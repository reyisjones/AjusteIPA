using AjusteIPA.Data;
using System.Data.Entity;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;

namespace AjusteIPA.Claims
{
    /// <summary>
    /// Interaction logic for ClaimsTool.xaml
    /// </summary>
    public partial class ClaimsTool : UserControl
    {
        AjusteIpaEntities context = new AjusteIpaEntities();
        CollectionViewSource claimsViewSource;
        public ClaimsTool()
        {
            InitializeComponent();
            claimsViewSource = ((CollectionViewSource)(FindResource("reclamacionesViewSource")));
            DataContext = this;
        }

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            // Do not load your data at design time.
            // if (!System.ComponentModel.DesignerProperties.GetIsInDesignMode(this))
            // {
            // 	//Load your data here and assign the result to the CollectionViewSource.
            // 	System.Windows.Data.CollectionViewSource myCollectionViewSource = (System.Windows.Data.CollectionViewSource)this.Resources["Resource Key for CollectionViewSource"];
            // 	myCollectionViewSource.Source = your data
            // }

            context.Reclamaciones.Load();
            // After the data is loaded, call the DbSet<T>.Local property    
            // to use the DbSet<T> as a binding source.   
            claimsViewSource.Source = context.Reclamaciones.Local;
        }
    }
}
