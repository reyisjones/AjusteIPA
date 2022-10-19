using MaterialDesignThemes.Wpf;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace AjusteIPA.Login
{
    /// <summary>
    /// Interaction logic for LoginView.xaml
    /// </summary>
    public partial class LoginView : Window
    {
        LoginViewModel _loginVM;

        public LoginView()
        {
            InitializeComponent();
            _loginVM = new LoginViewModel();
        }

        private void OnPasswordChanged(object sender, RoutedEventArgs e)
        {
            // Text="{Binding Password}" 
            // TODO: Set Binding Password
            PasswordBox pbx = (PasswordBox)sender;
            string pwd = pbx.Password;
            _loginVM.Password += pwd;
            if (pwd == "1234")
            {
                Close();
            }
            //DialogHost.ContentTemplateProperty.ValidateValueCallback(pwd);

            Debug.WriteLine(pbx.Password); // pwdBox.Password);
        }
    }
}
