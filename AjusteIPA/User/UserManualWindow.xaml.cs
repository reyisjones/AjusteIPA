using Microsoft.Web.WebView2.Core;
using System;
using System.Reflection;
using System.Windows;
using Path = System.IO.Path;

namespace AjusteIPA.User
{
    /// <summary>
    /// Interaction logic for UserManualWindow.xaml
    /// </summary>
    public partial class UserManualWindow : Window
    {
        public UserManualWindow()
        {
            InitializeComponent(); 
            webView.NavigationStarting += DisplayPdf;
        }

        void DisplayPdf(object sender, CoreWebView2NavigationStartingEventArgs args)
        { 
            String uriPath = Path.Combine(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location), @"User\ManualDelUsuario-SistemaIPA.pdf");
            webView.Source = new Uri(uriPath);
        }
    }
}
