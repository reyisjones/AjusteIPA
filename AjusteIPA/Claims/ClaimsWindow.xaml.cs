﻿using AjusteIPA.Data;
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

        }
    }


    public static class AdjustedClaimsRules {

        public static bool ValidateClaimLog() {


            return false;
        } 
    }

    /*
     
     
     
     
     */




}
