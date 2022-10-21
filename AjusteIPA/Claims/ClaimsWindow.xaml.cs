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

            // After the data is loaded, call the DbSet<T>.Local property    
            // to use the DbSet<T> as a binding source.   

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

                context.Entry(item).State = EntityState.Modified;
                //context.SaveChanges();
                //this.reclamacionesDataGrid.Items.Refresh();
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

                context.Entry(item).State = EntityState.Modified;
                //context.SaveChanges();
                //this.reclamacionesDataGrid.Items.Refresh();
            }
        }

        private void ValidateContratoEspecialidadIPA()
        {
            var selectedClaims = context.Reclamaciones.Local.Where(x => x.Seleccionar.Value == true);
            var regCat = context.RegistroCatastroficoes.Local;

            foreach (var item in selectedClaims)
            {
                var validIpa = item.NumeroIPA.HasValue ? true : false;
                var validNumContrato = string.IsNullOrWhiteSpace(item.NumeroContrato) ? true : false;
                var validEsp = item.Especialidad.HasValue ? true : false;


                if (validIpa && validEsp && validNumContrato)
                {
                    item.EstatusAjuste = "Aceptado";
                }
                else {
                    item.EstatusAjuste = "Denegado";
                }

                context.Entry(item).State = EntityState.Modified;
                //context.SaveChanges();
                //this.reclamacionesDataGrid.Items.Refresh();
            }
        }
    }

    public static class AdjustedClaimsRules
    {
        /*
         Paso 2: Verificar NumeroReclamacion existe en [dbo].[LogReclamacionesAjustadas]
            Si existe 
	            - Update al campo [EstatusAjuste] from [dbo].[Reclamaciones] ==> 'Denegado' 
	            - Update al campo [EstatusReclamacion] == "Duplicado"
            Paso 3: 
             [EstatusReclamacion] == "Pendiente" (default value) 
            -- If [NumeroContrato] Not Exists [dbo].[RegistroCatastrofico] Then  ==> EstatusAjuste = Denegado 

            If Not Null 
	            ,t1.[NumeroIPA]
                ,t1.[NumeroContrato]
                ,t1.[Especialidad] 
            &&  [NumeroContrato] Exists [dbo].[RegistroCatastrofico] Then  ==> EstatusAjuste = Aceptado 
         */
    }
}
