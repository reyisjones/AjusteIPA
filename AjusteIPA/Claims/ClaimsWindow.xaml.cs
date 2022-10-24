using AjusteIPA.Data;
using System.Data.Entity;
using System.Linq;
using System.Windows;
using System.Windows.Data;
using System.Windows.Input;

namespace AjusteIPA.Claims
{
    /// <summary>
    /// Interaction logic for ClaimsWindow.xaml
    /// </summary>
    public partial class ClaimsWindow : Window
    {
        AjusteIpaDBEntities context = new AjusteIpaDBEntities();
        CollectionViewSource claimsViewSource;
        public ClaimsWindow()
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
            context.LogReclamacionesAjustadas.Load();
            context.RegistroCatastroficoes.Load();

            claimsViewSource.Source = context.Reclamaciones.Local.Where(x => x.EstatusReclamacion == "Pendiente").ToList();
            Application.Current.Dispatcher.Invoke(() =>
            {
                Mouse.OverrideCursor = null;
            });
        }

        private void Adjust_OnClick(object sender, RoutedEventArgs e)
        {
            Validation();
        }

        public void Save()
        {
            context.SaveChanges();
            // Refresh the grids so the database generated values show up.
            this.reclamacionesDataGrid.Items.Refresh();
        }

        public void Validation()
        {
            Application.Current.Dispatcher.Invoke(() =>
            {
                Mouse.OverrideCursor = Cursors.Wait;
            });

            ValidateLogReclamacionesAjustadas();
            ValidateRegistroCatastrofico();
            ValidateContratoEspecialidadIPA();
            context.SaveChanges();
            UpdateSeleccionar();

            context.SaveChanges();
            this.reclamacionesDataGrid.Items.Refresh();

            Application.Current.Dispatcher.Invoke(() =>
            {
                Mouse.OverrideCursor = null;
            });
        }

        private void ValidateLogReclamacionesAjustadas()
        {
            var selectedClaims = context.Reclamaciones.Local.Where(x => x.Seleccionar.Value == true);
            var logClaim = context.LogReclamacionesAjustadas.Local;

            var query = from cl in selectedClaims
                        join lca in logClaim on cl.idReclamacion equals lca.idReclamacion
                        select cl;

            foreach (var item in query)
            {
                item.EstatusAjuste = "Denegado";
                item.EstatusReclamacion = "Duplicado";
                item.Seleccionar = false;
                item.FechaAjuste = System.DateTime.Now;
                context.Entry(item).State = EntityState.Modified;
            }
        }

        private void ValidateRegistroCatastrofico()
        {
            var selectedClaims = context.Reclamaciones.Local.Where(x => x.Seleccionar.Value == true);
            var regCat = context.RegistroCatastroficoes.Local;

            var query = selectedClaims.Where(sc => regCat.All(rc => rc.NumeroContrato != sc.NumeroContrato));

            foreach (var item in query)
            {
                item.EstatusAjuste = "Denegado";
                item.EstatusReclamacion = "Duplicado";
                item.Seleccionar = false;
                item.FechaAjuste = System.DateTime.Now;
                context.Entry(item).State = EntityState.Modified;
            }
        }

        private void ValidateContratoEspecialidadIPA()
        {
            var selectedClaims = context.Reclamaciones.Local.Where(x => x.Seleccionar.Value == true);
            var regCat = context.RegistroCatastroficoes.Local;

            foreach (var item in selectedClaims)
            {
                var validIpa = item.NumeroIPA.HasValue ? true : false;
                var validNumContrato = string.IsNullOrWhiteSpace(item.NumeroContrato) ? false : true;
                var validEsp = item.Especialidad.HasValue ? true : false;

                if (validIpa && validEsp && validNumContrato)
                {
                    item.EstatusAjuste = "Aceptado";
                    item.EstatusReclamacion = "Procesada";
                    item.CantidadAjustada = item.CargoTotal;
                    item.CantidadPagada = item.CargoTotal;
                    item.FechaAjuste = System.DateTime.Now;
                }
                else
                {
                    item.EstatusAjuste = "Denegado";
                    item.EstatusReclamacion = "Procesada";
                    item.FechaAjuste = System.DateTime.Now;
                }

                context.Entry(item).State = EntityState.Modified;
            }
        }

        private void UpdateSeleccionar()
        {
            var claims = context.Reclamaciones.Local;

            foreach (var item in claims)
            {
                item.Seleccionar = false;

                context.Entry(item).State = EntityState.Modified;
                context.SaveChanges();
            }
        }

    }
}
