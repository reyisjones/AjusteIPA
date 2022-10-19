using AjusteIPA.Domain;
using AjusteIPA.Data;
using System.Data.Entity;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data; 

namespace AjusteIPA.Claims
{
    internal class ClaimsToolViewModel : ViewModelBase
    {
        AjusteIpaDBEntities context = new AjusteIpaDBEntities();
        CollectionViewSource claimsViewSource;

        public ClaimsToolViewModel()
        {
             
        }
    }
}

