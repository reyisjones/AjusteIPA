using AjusteIPA.Data;
using System.Data.Entity;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;

namespace AjusteIPA.Claims
{
    /// <summary>
    /// Interaction logic for ClaimsDetail.xaml
    /// </summary>
    public partial class ClaimsDetail : Page
    {
        AjusteIpaEntities context = new AjusteIpaEntities();
        CollectionViewSource claimsViewSource;

        public ClaimsDetail()
        {
            InitializeComponent();
            claimsViewSource = ((CollectionViewSource)(FindResource("reclamacionesViewSource")));
            DataContext = this;
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            context.Reclamaciones.Load();

            // After the data is loaded, call the DbSet<T>.Local property    
            // to use the DbSet<T> as a binding source.   
            claimsViewSource.Source = context.Reclamaciones.Local;
        }
    }
}
