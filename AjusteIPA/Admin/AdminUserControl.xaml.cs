using AjusteIPA.Data;
using System.Data.Entity;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Input;

namespace AjusteIPA.Admin
{
    /// <summary>
    /// Interaction logic for AdminUserControl.xaml
    /// </summary>
    public partial class AdminUserControl : UserControl
    {

        AjusteIpaDBEntities context = new AjusteIpaDBEntities();
        CollectionViewSource userViewSource;

        public AdminUserControl()
        {
            InitializeComponent();

            userViewSource = ((CollectionViewSource)(FindResource("usuarioViewSource")));
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
            Application.Current.Dispatcher.Invoke(() =>
            {
                Mouse.OverrideCursor = Cursors.Wait;
            });
            context.Usuarios.Load();

            // After the data is loaded, call the DbSet<T>.Local property    
            // to use the DbSet<T> as a binding source.   
            userViewSource.Source = context.Usuarios.Local.Where(x => x.Estatus == "1").ToList();
            Application.Current.Dispatcher.Invoke(() =>
            {
                Mouse.OverrideCursor = null;
            });
        }
    }
}
