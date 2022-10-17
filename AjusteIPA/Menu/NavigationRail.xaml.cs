using AjusteIPA.Domain;
using System.Collections.Generic;
using System.Windows.Controls;

namespace AjusteIPA.Menu
{
    /// <summary>
    /// Interaction logic for NavigationRail.xaml
    /// </summary>
    public partial class NavigationRail : UserControl
    {
        public List<SampleItem> SampleList { get; set; }

        public NavigationRail()
        {
            InitializeComponent();
        }
    }
}
