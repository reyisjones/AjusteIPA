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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace AjusteIPA.Reports
{
    /// <summary>
    /// Interaction logic for ReportContainer.xaml
    /// </summary>
    public partial class ReportContainer : UserControl
    {
        public ReportContainer()
        {
            InitializeComponent();
        }

        private void initializeReport()
        {
            //this.mform_components = new System.ComponentModel.Container();
            //Microsoft.Reporting.WinForms.ReportDataSource reportDataSource1 = new Microsoft.Reporting.WinForms.ReportDataSource();

            //this.ProductBindingSource = new System.Windows.Forms.BindingSource(this.mform_components);
            //((System.ComponentModel.ISupportInitialize)(this.ProductBindingSource)).BeginInit();

            //reportDataSource1.Name = "DataSet4";
            //reportDataSource1.Value = this.ProductBindingSource;

            //this.viewerInstance.LocalReport.DataSources.Add(reportDataSource1);
            //this.viewerInstance.LocalReport.ReportEmbeddedResource = "YourReport.rdlc";
            //this.viewerInstance.ZoomPercent = 95;
            //this.windowsFormsHost1.Width = 680;

            //((System.ComponentModel.ISupportInitialize)(this.ProductBindingSource)).EndInit();
        }


    }
}
