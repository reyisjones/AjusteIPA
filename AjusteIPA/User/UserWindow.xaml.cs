using System.Reflection;
using System.Windows;
using Path = System.IO.Path;

namespace AjusteIPA.User
{
    /// <summary>
    /// Interaction logic for UserWindow.xaml
    /// </summary>
    public partial class UserWindow : Window
    {
        public UserWindow()
        {
            InitializeComponent(); 
        }

        private void ChromiumWebBrowser_Loaded(object sender, RoutedEventArgs e)
        {
            string pdfFilePath = Path.Combine(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location), @"User\ManualDelUsuario-SistemaIPA.pdf");

            Browser.Address = pdfFilePath;
        }
    }
}
