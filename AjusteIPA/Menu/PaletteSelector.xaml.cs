using AjusteIPA.Domain;
using System.Windows.Controls;

namespace AjusteIPA.Menu
{
    /// <summary>
    /// Interaction logic for PaletteSelector.xaml
    /// </summary>
    public partial class PaletteSelector : UserControl
    {
        public PaletteSelector()
        {
            DataContext = new PaletteSelectorViewModel();
            InitializeComponent();
        }
    }
}
