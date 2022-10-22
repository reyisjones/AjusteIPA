using AjusteIPA.Data;
using Microsoft.Reporting.WinForms;
using System;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Reflection;
using System.Windows;
using System.Windows.Data;
using System.Windows.Input;
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

        private readonly string adjustedAcceptedClaims = @"Reports\AdjustedAcceptedClaims.rdlc";
        private readonly string adjustedDeniedClaims = @"Reports\AdjustedDeniedClaims.rdlc";
        private readonly string processedAdjustedClaims = @"Reports\ProcessedAdjustedClaims.rdlc";
        private readonly string processedAdjustedClaimsNew = @"Reports\ProcessedAdjustedClaimsNew.rdlc";
        private readonly string totalAdjustedClaimsbyIPA = @"Reports\TotalAdjustedClaimsbyIPA.rdlc";
        private readonly string totalAdjustedClaimsbyUser = @"Reports\TotalAdjustedClaimsbyUser.rdlc";

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
            claimsViewSource.Source = context.Reclamaciones.Local.Where(x => x.EstatusReclamacion == "Pendiente").ToList();
            BuildReport(processedAdjustedClaims);

            Application.Current.Dispatcher.Invoke(() =>
            {
                Mouse.OverrideCursor = null;
            });
        }

        private void BuildReport(string reportPath)
        {
            ReportDataSource datasource = new ReportDataSource("AjusteIpaDataSet", context.Reclamaciones);
            datasource.Value = claimsViewSource.Source;

            SqlServerTypes.Utilities.LoadNativeAssemblies(AppDomain.CurrentDomain.BaseDirectory);
            string rdlFilePath = Path.Combine(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location), reportPath);

            rptWellBalanceClaims.ProcessingMode = ProcessingMode.Local;
            LocalReport localReport = rptWellBalanceClaims.LocalReport;
            localReport.ReportPath = rdlFilePath;
            localReport.DataSources.Clear();
            localReport.DataSources.Add(datasource);

            rptWellBalanceClaims.RefreshReport();
        }

        private void AceptadaOnClick(object sender, RoutedEventArgs e)
        {
            context.LogReclamacionesAjustadas.Load();
            claimsViewSource.Source = context.LogReclamacionesAjustadas.Local.Where(x => x.EstatusReclamacion == "Procesada"
            && x.EstatusAjuste == "Aceptado"
            && x.FechaAjuste.Value.Month == DateTime.UtcNow.Month).ToList();
            BuildReport(adjustedAcceptedClaims);
        }

        private void DenegadaOnClick(object sender, RoutedEventArgs e)
        {
            context.LogReclamacionesAjustadas.Load();
            claimsViewSource.Source = context.LogReclamacionesAjustadas.Local.Where(x => x.EstatusReclamacion == "Procesada"
            && x.EstatusAjuste == "Denegado"
            && x.FechaAjuste.Value.Month == DateTime.UtcNow.Month).ToList();
            BuildReport(adjustedDeniedClaims);
        }

        private void StatusOnClick(object sender, RoutedEventArgs e)
        {
            context.LogReclamacionesAjustadas.Load();
            claimsViewSource.Source = context.LogReclamacionesAjustadas.Local.Where(x => x.EstatusReclamacion == "Procesada"
            && x.EstatusAjuste == "Denegado"
            && x.FechaAjuste.Value.Month == DateTime.UtcNow.Month).ToList();
            BuildReport(adjustedDeniedClaims);
        }

        private void AjustadaOnClick(object sender, RoutedEventArgs e)
        {
            context.Reclamaciones.Load();
            claimsViewSource.Source = context.LogReclamacionesAjustadas.Local.Where(x => x.EstatusReclamacion == "Procesada"
            && x.FechaAjuste.Value.Month == DateTime.UtcNow.Month).ToList();
            BuildReport(processedAdjustedClaimsNew);
        }

        private void IPAOnClick(object sender, RoutedEventArgs e)
        {
            context.LogReclamacionesAjustadas.Load();
            claimsViewSource.Source = context.LogReclamacionesAjustadas.Local.Where(x => x.EstatusReclamacion == "Procesada"
            && x.FechaAjuste.Value.Month == DateTime.UtcNow.Month).ToList();
            BuildReport(totalAdjustedClaimsbyIPA);
        }

        private void UserOnClick(object sender, RoutedEventArgs e)
        {
            context.LogReclamacionesAjustadas.Load();
            claimsViewSource.Source = context.LogReclamacionesAjustadas.Local.Where(x => x.EstatusReclamacion == "Procesada"
            && x.FechaAjuste.Value.Month == DateTime.UtcNow.Month).ToList();
            BuildReport(totalAdjustedClaimsbyUser);
        }
    }
}
