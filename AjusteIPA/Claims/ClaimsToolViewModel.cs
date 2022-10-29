using AjusteIPA.Data;
using AjusteIPA.Domain;
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

