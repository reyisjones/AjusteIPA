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
using System.Data;
using System.Data.SqlClient;
using Microsoft.Reporting.WinForms;
using AjusteIPA.Data;
using System.Data.Entity;
using System.Reflection;
using System.IO;
using Path = System.IO.Path;

namespace AjusteIPA.Reports
{
    /// <summary>
    /// Interaction logic for ReportWindow.xaml
    /// </summary>
    public partial class ReportWindow : Window
    {
        AjusteIpaDBEntities context = new AjusteIpaDBEntities();
        CollectionViewSource claimsViewSource;
        public ReportWindow()
        {
            InitializeComponent();
            claimsViewSource = ((CollectionViewSource)(FindResource("reclamacionesViewSource")));
            DataContext = this;
            LoadReport();
        }

        private void LoadReport()
        {
            Application.Current.Dispatcher.Invoke(() =>
            {
                Mouse.OverrideCursor = Cursors.Wait;
            });
            context.Reclamaciones.Load();

            claimsViewSource.Source = context.Reclamaciones.Local.Where(x => x.EstatusReclamacion == "Pendiente");
            Application.Current.Dispatcher.Invoke(() =>
            {
                Mouse.OverrideCursor = null;
            });

            var dsClaims = claimsViewSource.Source;
            ReportDataSource datasource = new ReportDataSource("AjusteIpaDataSet", context.Reclamaciones);
            //DataSet dataset = new DataSet("AjusteIpaDataSet"); 
            datasource.Value = dsClaims;

            SqlServerTypes.Utilities.LoadNativeAssemblies(AppDomain.CurrentDomain.BaseDirectory);
            string rdlFilePath = Path.Combine(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location), @"Reports\ProcessedAdjustedClaims.rdlc");

            //this.rptWellBalanceClaims = new Microsoft.Reporting.WinForms.ReportViewer();
            // Set the processing mode for the ReportViewer to Local  
            rptWellBalanceClaims.ProcessingMode = ProcessingMode.Local;

            LocalReport localReport = rptWellBalanceClaims.LocalReport;
            localReport.ReportPath = rdlFilePath;


            //rptWellBalanceClaims.LocalReport.ReportEmbeddedResource = rdlFilePath;
            //rptWellBalanceClaims.LocalReport.DataSources.Clear();
            //rptWellBalanceClaims.LocalReport.DataSources.Add(datasource);
            localReport.DataSources.Clear();
            localReport.DataSources.Add(datasource);

            rptWellBalanceClaims.RefreshReport();

        }
    }
}
