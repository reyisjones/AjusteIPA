using AjusteIPA.Data;
using Microsoft.Reporting.WinForms;
using System;
using System.Data.Entity;
using System.Linq;
using System.Reflection;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Input;
using Path = System.IO.Path;

namespace AjusteIPA.Reports
{
    /// <summary>
    /// Interaction logic for ReportPage1.xaml
    /// </summary>
    public partial class ReportPage1 : Page
    {
        AjusteIpaDBEntities context = new AjusteIpaDBEntities();
        CollectionViewSource claimsViewSource;
        public ReportPage1()
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

            claimsViewSource.Source = context.Reclamaciones.Local.Where(x => x.EstatusReclamacion == "Procesada");
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