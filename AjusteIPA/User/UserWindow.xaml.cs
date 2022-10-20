using GemBox.Pdf;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
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
using System.Windows.Shapes;

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
            ComponentInfo.SetLicense("FREE-LIMITED-KEY");
        }

        private void MenuItem_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog fileDialog = new OpenFileDialog();
            fileDialog.Filter = "PDF files (*.pdf)|*.pdf";

            if (fileDialog.ShowDialog() == true)
            {
                using (var document = PdfDocument.Load(fileDialog.FileName))
                {
                    this.ImageControl.Source = document.ConvertToImageSource(SaveOptions.Image);
                }
            }
        }
    }
}
