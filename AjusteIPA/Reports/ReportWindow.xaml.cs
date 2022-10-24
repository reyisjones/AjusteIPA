using AjusteIPA.Data;
using Microsoft.Reporting.WinForms;
using System;
using System.Collections.Generic;
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

            context.LogReclamacionesAjustadas.Load();
            //claimsViewSource.Source = context.LogReclamacionesAjustadas.Local.Where(x => x.EstatusReclamacion == "Pendiente").ToList();
            BuildReport(processedAdjustedClaims, ReportTypes.Ajustada);

            Application.Current.Dispatcher.Invoke(() =>
            {
                Mouse.OverrideCursor = null;
            });
        }

        private void BuildReport(string reportPath, ReportTypes reportTypes)
        {
            List<LogReclamacionesAjustada> query = new List<LogReclamacionesAjustada>();
            context.LogReclamacionesAjustadas.Load();

            switch (reportTypes)
            {
                case ReportTypes.Aceptada:
                    query = context.LogReclamacionesAjustadas.Local.Where(x => x.EstatusReclamacion == "Procesada"
                    && x.EstatusAjuste == "Aceptado"
                    && x.FechaAjuste.Value.Month == DateTime.UtcNow.Month).ToList();
                    break;
                case ReportTypes.Denegada:
                    query = context.LogReclamacionesAjustadas.Local.Where(x => x.EstatusReclamacion == "Procesada"
                    && x.EstatusAjuste == "Denegado"
                    && x.FechaAjuste.Value.Month == DateTime.UtcNow.Month).ToList();
                    break;
                case ReportTypes.Ajustada:
                    query = context.LogReclamacionesAjustadas.Local.Where(x => x.EstatusReclamacion == "Procesada"
                    && x.FechaAjuste.Value.Month == DateTime.UtcNow.Month).ToList();
                    break;
                case ReportTypes.IPA:
                    query = context.LogReclamacionesAjustadas.Local.Where(x => x.EstatusReclamacion == "Procesada"
                    && x.FechaAjuste.Value.Month == DateTime.UtcNow.Month).ToList();
                    break;
                case ReportTypes.User:
                    query = context.LogReclamacionesAjustadas.Local.Where(x => x.EstatusReclamacion == "Procesada"
                    && x.FechaAjuste.Value.Month == DateTime.UtcNow.Month).ToList();
                    break;
                default:
                    break;
            }

            claimsViewSource.Source = query;
            ReportDataSource datasource = new ReportDataSource("AjusteIpaDataSet", query);
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
            BuildReport(adjustedAcceptedClaims, ReportTypes.Aceptada);
        }

        private void DenegadaOnClick(object sender, RoutedEventArgs e)
        {
            BuildReport(adjustedDeniedClaims, ReportTypes.Denegada);
        }

        private void AjustadaOnClick(object sender, RoutedEventArgs e)
        {
            BuildReport(processedAdjustedClaimsNew, ReportTypes.Ajustada);
        }

        private void IPAOnClick(object sender, RoutedEventArgs e)
        {
            BuildReport(totalAdjustedClaimsbyIPA, ReportTypes.IPA);
        }

        private void UserOnClick(object sender, RoutedEventArgs e)
        {
            BuildReport(totalAdjustedClaimsbyUser, ReportTypes.User);
        }
    }

    public enum ReportTypes
    {
        Aceptada,
        Denegada,
        Ajustada,
        IPA,
        User
    }

}
