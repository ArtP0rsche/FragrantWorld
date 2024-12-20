using DataBaseLibrary.Models;
using FragrantWorld.Services;
using Microsoft.Win32;
using System.IO;
using System.Net.Http;
using System.Windows;

namespace FragrantWorld
{
    /// <summary>
    /// Логика взаимодействия для OrderWindow.xaml
    /// </summary>
    public partial class OrderWindow : Window
    {
        public readonly WebApiService _service = new();

        List<Product> products = new();
        int receiptCode = new Random().Next(100, 1000);
        decimal? totalCost;

        public OrderWindow(List<Product> selectedProducts, string userFullName = "")
        {
            InitializeComponent();
            productListBox.ItemsSource = selectedProducts;
            products = selectedProducts;
            UpdateOrder();
            pickupPointComboBox.SelectedIndex = 0;
            receiptCodeTextBlock.Text = receiptCode.ToString();
            userInfoTextBlock.Text = userFullName;
        }

        public async void UpdateOrder()
        {
            pickupPointComboBox.ItemsSource = await _service.GetPickupPointsAsync();
            orderNumberTextBlock.Text = $"{await _service.GetOrderNextIdAsync()}";
            priceTextBlock.Text = "";
            totalCost = 0;
            foreach (Product product in products)
            {
                if (product.DiscountAmount > 0)
                    totalCost += product.Cost * (1 - product.DiscountAmount * (decimal)0.01);
                else
                    totalCost += product.Cost;
            }
            priceTextBlock.Text += totalCost.ToString();
        }

        private void GoBackButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private async void OrderButton_Click(object sender, RoutedEventArgs e)
        {
            var postCode = (pickupPointComboBox.SelectedItem as PickupPoint).PostCode;
            var address = (pickupPointComboBox.SelectedItem as PickupPoint).Address;

            Order order = new()
            {
                Status = "Новый",
                OrderDate = DateTime.Now,
                DeliveryDate = DateTime.Now.AddDays(3),
                PickupPoint = pickupPointComboBox.SelectedIndex + 1,
                ReceiptCode = Convert.ToInt16(receiptCode)
                ,
                PickupPointNavigation = new PickupPoint { PostCode = postCode, Address = address }
            };
            try
            {
                await _service.AddOrderAsync(order);
                MessageBox.Show("Заказ был создан", "Успешно", MessageBoxButton.OK, MessageBoxImage.Information);
                products.Clear();
                productListBox.Items.Refresh();
                UpdateOrder();
            }
            catch (HttpRequestException ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void SaveTicketButton_Click(object sender, RoutedEventArgs e)
        {
            if (productListBox.Items.Count == 0)
            {
                MessageBox.Show("Для формирования талона должен быть заказан хотя бы один товар", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Information);
                return;
            }

            SaveFileDialog sfd = new SaveFileDialog();
            sfd.Filter = "Текстовые файлы (.txt)|*.txt";

            if (sfd.ShowDialog() == true)
            {
                string filePath = sfd.FileName;

                string orderList = "";
                foreach (Product product in products)
                {
                    orderList += $"\n-{product.Name}";
                }

                try
                {
                    using (StreamWriter writer = new StreamWriter(filePath))
                    {
                        writer.WriteLine($"Дата заказа: {DateTime.Now.ToString("yyyy-MM-dd")}\nНомер заказа: {orderNumberTextBlock.Text}\n\n" +
                            $"Список товаров: {orderList}\nCумма заказа: {string.Format("{0:C2}", totalCost)}\n" +
                            $"Пункт выдачи: {(pickupPointComboBox.SelectedItem as PickupPoint).Address}\n\nКод получения: {receiptCode}");
                    }
                    MessageBox.Show($"Талон успешно сохранен в файл {Path.GetFileName(filePath)}", "Успешно", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                catch
                {
                    MessageBox.Show("Не удалось создать талон", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void RemoveButton_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Вы уверены что хотите удалить товар?", "Подтверждение пользователя", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                products.Remove((Product)productListBox.SelectedItem);
                productListBox.Items.Refresh();
                UpdateOrder();
            }
            return;
        }
    }
}
