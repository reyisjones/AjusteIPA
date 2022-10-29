using System.Windows;
using System.Windows.Controls.Primitives;

namespace AjusteIPA.Login
{
    /// <summary>
    /// Interaction logic for LoginWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        public bool PasswordMatch { get; set; }

        public LoginWindow()
        {
            InitializeComponent();
        }


        private void CheckBoxChanged(object sender, RoutedEventArgs e)
        {
            //if (WindowsCredentialsCheckBox.IsChecked == true)
            //{
            //    LocalUserNameTextBox.Text = Environment.UserName;
            //    LocalPasswordBox.Password = "SHOW_SOME_PASSWORD";
            //}
            //else
            //{
            LocalUserNameTextBox.Text = string.Empty;
            LocalPasswordBox.Password = string.Empty;
            //}
        }

        private void BtnActionMinimize_OnClick(object sender, RoutedEventArgs e)
        {
            WindowState = WindowState.Minimized;
        }

        private void BtnActionSystemInformation_OnClick(object sender, RoutedEventArgs e)
        {
            //var systemInformationWindow = new SystemInformationWindow();
            //systemInformationWindow.Show();
        }

        private void btnActionClose_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void Thumb_OnDragDelta(object sender, DragDeltaEventArgs e)
        {
            Left = Left + e.HorizontalChange;
            Top = Top + e.VerticalChange;
        }

        private void LocalLoginButton_Click(object sender, RoutedEventArgs e)
        {
            if (LocalUserNameTextBox.Text == "admin")
                if (LocalPasswordBox.Password == "123")
                    this.Close();


        }
    }
}
