using FragrantWorld.Services;
using System.Windows;

namespace FragrantWorld
{
    /// <summary>
    /// Логика взаимодействия для AuthorizationWindow.xaml
    /// </summary>
    public partial class AuthorizationWindow : Window
    {
        readonly WebApiService _service = new();
        public string Login => loginTextBox.Text;
        public string Password => passwordTextBox.Text;
        public string FullName { get; set; }
        public int Role { get; set; }

        public AuthorizationWindow()
        {
            InitializeComponent();
        }

        private async void enterButton_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(loginTextBox.Text) || string.IsNullOrEmpty(passwordTextBox.Text))
            {
                MessageBox.Show("Заполните все поля", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            var user = await _service.GetUserByLoginAsync(loginTextBox.Text);
            if (user.Password != passwordTextBox.Text)
            {
                MessageBox.Show("Пароль указан неверно", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            FullName = $"{user.Surname} {user.Name} {user.Patronymic}";
            Role = user.RoleId;
            this.DialogResult = true;
        }

        private void cancelButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
