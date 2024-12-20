using DataBaseLibrary.Models;
using FragrantWorld.Services;
using System.Net.Http;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Markup;

namespace FragrantWorld
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        readonly WebApiService _service = new();
        string sortBy;
        List<Product> selectedProducts = new();

        public MainWindow()
        {
            InitializeComponent();
            UpdateInfo();
            manufacturerComboBox.Items.Add("Все производители");
            sortProductsComboBox.SelectedIndex = 0;
            manufacturerComboBox.SelectedIndex = 0;
        }

        public async Task Filter()
        {
            try
            {
                sortBy = sortProductsComboBox.SelectedIndex switch
                {
                    1 => "Descending",
                    _ => "Ascending"
                };
                IEnumerable<Product> products = await _service.GetProductsAsync();
                if (searchTextBox.Text != null)
                    productListBox.ItemsSource = await _service.GetFilteredProductsAsync(searchTextBox.Text);
                else if (minPriceTextBox.Text != null && maxPriceTextBox.Text != null)
                    productListBox.ItemsSource = await _service.GetFilteredProductsAsync(Convert.ToDecimal(minPriceTextBox.Text), Convert.ToDecimal(maxPriceTextBox.Text));
                else if (minPriceTextBox.Text == null && maxPriceTextBox.Text == null && searchTextBox.Text == null)
                    productListBox.ItemsSource = await _service.GetFilteredProductsAsync(sortBy, manufacturerComboBox.Text);
                countTextBlock.Text = $"Показано {productListBox.Items.Count} / {products.Count()} результатов";
            }
            catch (HttpRequestException ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        public async void UpdateInfo()
        {
            try
            {
                IEnumerable<Product> products = await _service.GetProductsAsync();
                productListBox.ItemsSource = products;
                countTextBlock.Text = $"Показано {productListBox.Items.Count} / {products.Count()} результатов";
                await GetManufacturersAsync();
            }
            catch (HttpRequestException ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        public async Task GetManufacturersAsync()
        {
            var products = await _service.GetProductsAsync();
            foreach (Product product in products)
            {
                if (!manufacturerComboBox.Items.Contains(product.Manufacturer))
                    manufacturerComboBox.Items.Add(product.Manufacturer);
            }
        }

        private async void MinPriceTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (String.IsNullOrEmpty(minPriceTextBox.Text))
                minPriceHintTextBlock.Visibility = Visibility.Visible;
            else
                minPriceHintTextBlock.Visibility = Visibility.Collapsed;
            await Filter();
        }

        private async void MaxPriceTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (String.IsNullOrEmpty(maxPriceTextBox.Text))
                maxPriceHintTextBlock.Visibility = Visibility.Visible;
            else
                maxPriceHintTextBlock.Visibility = Visibility.Collapsed;
            await Filter();
        }

        private async void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (String.IsNullOrEmpty(searchTextBox.Text))
                hintSearchTextBlock.Visibility = Visibility.Visible;
            else
                hintSearchTextBlock.Visibility = Visibility.Collapsed;
            await Filter();
        }

        private void PriceTextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]");
            e.Handled = regex.IsMatch(e.Text);

            if (e.Text == "0" && (sender as TextBox).Text.Length == 0 || (sender as TextBox).Text.StartsWith("0"))
                e.Handled = true;
        }

        private async void SortProductsComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            await Filter();
        }

        private async void ManufacturersComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            await Filter();
        }

        private void AuthButton_Click(object sender, RoutedEventArgs e)
        {
            AuthorizationWindow window = new AuthorizationWindow();
            if (window.ShowDialog() == true)
            {
                authButton.Visibility = Visibility.Collapsed;
                exitButton.Visibility = Visibility.Visible;
                userInfoTextBlock.Text = window.FullName;
            }
        }

        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            userInfoTextBlock.Text = "";
            authButton.Visibility = Visibility.Visible;
            exitButton.Visibility = Visibility.Collapsed;
        }

        private void OrderButton_Click(object sender, RoutedEventArgs e)
        {
            if (productListBox.Items.Count == 0 || productListBox.SelectedItem == null)
            {
                MessageBox.Show("Выберите товар", "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }
            selectedProducts.Add(productListBox.SelectedItem as Product);
            goToOrderButton.Visibility = Visibility.Visible;
        }

        private void GoToOrderButton_Click(object sender, RoutedEventArgs e)
        {
            OrderWindow window = new OrderWindow(selectedProducts, userInfoTextBlock.Text);
            window.ShowDialog();
            if (selectedProducts.Count == 0)
                goToOrderButton.Visibility = Visibility.Collapsed;
        }
    }
}