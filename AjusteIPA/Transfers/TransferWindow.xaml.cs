using AjusteIPA.Data;
using System;
using System.Data.Entity;
using System.Linq;
using System.Windows;
using System.Windows.Data;
using System.Windows.Input;

namespace AjusteIPA.Transfers
{
    /// <summary>
    /// Interaction logic for TransferWindow.xaml
    /// </summary>
    public partial class TransferWindow : Window
    {
        AjusteIpaDBEntities context = new AjusteIpaDBEntities();
        CollectionViewSource claimsViewSource;
        public TransferWindow()
        {
            InitializeComponent();
            claimsViewSource = ((CollectionViewSource)(FindResource("reclamacionesViewSource")));
            DataContext = this;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            Application.Current.Dispatcher.Invoke(() =>
            {
                Mouse.OverrideCursor = Cursors.Wait;
            });
            context.Reclamaciones.Load();

            claimsViewSource.Source = context.Reclamaciones.Local.Where(x => x.EstatusReclamacion.Contains("Procesad")).ToList();
            Application.Current.Dispatcher.Invoke(() =>
            {
                Mouse.OverrideCursor = null;
            });
        }

        private void Transfer_OnClick(object sender, RoutedEventArgs e)
        {

            Application.Current.Dispatcher.Invoke(() =>
            {
                Mouse.OverrideCursor = Cursors.Wait;
            });

            var claims = context.Reclamaciones.Local.Where(x => x.EstatusReclamacion.Contains("Procesad"));
            foreach (var item in claims)
            {
                context.LogReclamacionesAjustadas.Add(new LogReclamacionesAjustada
                {
                    idLogReclamacionesAjustadas = Guid.NewGuid(),
                    idReclamacion = item.idReclamacion,
                    NumReclamacion = item.NumReclamacion,
                    NumeroIPA = item.NumeroIPA,
                    NumeroPCP = item.NumeroPCP,
                    NombrePCP = item.NombrePCP,
                    Tier = item.Tier,
                    Cuenta = item.Cuenta,
                    NumeroContrato = item.NumeroContrato,
                    NombreAsegurado = item.NombreAsegurado,
                    Edad = item.Edad,
                    FechaServicio = item.FechaServicio,
                    FechaPago = item.FechaPago,
                    TipoServicio = item.TipoServicio,
                    LugarServicio = item.LugarServicio,
                    NumeroServicio = item.NumeroServicio,
                    CargoTotal = item.CargoTotal,
                    ICD9 = item.ICD9,
                    ICD10 = item.ICD10,
                    IdCodigoCatastrofico = item.IdCodigoCatastrofico,
                    Especialidad = item.Especialidad,
                    Municipio = item.Municipio,
                    CantidadPagada = item.CantidadPagada,
                    EstatusAjuste = item.EstatusAjuste,
                    CantidadAjustada = item.CantidadAjustada,
                    FechaAjuste = item.FechaAjuste,
                    EstatusReclamacion = item.EstatusReclamacion,
                    IDUsuario = item.IDUsuario,
                    Comentarios = item.Comentarios,
                    Seleccionar = item.Seleccionar,
                    FechaEntrada = DateTime.UtcNow,
                });
            }
            context.SaveChanges();

            Application.Current.Dispatcher.Invoke(() =>
            {
                Mouse.OverrideCursor = null;
            });
        }
    }
}
