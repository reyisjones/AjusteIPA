using AjusteIPA;
using AjusteIPA.Claims;
using AjusteIPA.Menu;
using MaterialDesignThemes.Wpf;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Configuration;
using System.Linq;
using System.Windows.Data;

namespace AjusteIPA.Domain
{
    public class MainWindowViewModel : ViewModelBase
    {
        public MainWindowViewModel(ISnackbarMessageQueue snackbarMessageQueue)
        {
            DemoItems = new ObservableCollection<DemoItem>(new[]
            {
                new DemoItem(
                    "Home",
                    typeof(Home),
                    new[]
                    {
                        new DocumentationLink(
                            DocumentationLinkType.Wiki,
                            $"{ConfigurationManager.AppSettings["GitHub"]}/wiki",
                            "WIKI"),
                        DocumentationLink.DemoPageLink<Home>()
                    },
                    selectedIcon: PackIconKind.Home,
                    unselectedIcon: PackIconKind.HomeOutline),
                new DemoItem(
                    "Claims",
                    typeof(ClaimsTool),
                    new[]
                    {
                        new DocumentationLink(
                            DocumentationLinkType.Wiki,
                            $"{ConfigurationManager.AppSettings["GitHub"]}/wiki",
                            "WIKI"),
                        DocumentationLink.DemoPageLink<ClaimsTool>()
                    },
                    selectedIcon: PackIconKind.MedicalBag,
                    unselectedIcon: PackIconKind.MedicalBag),
            });

            foreach (var item in GenerateDemoItems(snackbarMessageQueue).OrderBy(i => i.Name))
            {
                DemoItems.Add(item);
            }

            _demoItemsView = CollectionViewSource.GetDefaultView(DemoItems);
            _demoItemsView.Filter = DemoItemsFilter;

            HomeCommand = new AnotherCommandImplementation(
                _ =>
                {
                    SearchKeyword = string.Empty;
                    SelectedIndex = 0;
                });

            MovePrevCommand = new AnotherCommandImplementation(
                _ =>
                {
                    if (!string.IsNullOrWhiteSpace(SearchKeyword))
                        SearchKeyword = string.Empty;

                    SelectedIndex--;
                },
                _ => SelectedIndex > 0);

            MoveNextCommand = new AnotherCommandImplementation(
               _ =>
               {
                   if (!string.IsNullOrWhiteSpace(SearchKeyword))
                       SearchKeyword = string.Empty;

                   SelectedIndex++;
               },
               _ => SelectedIndex < DemoItems.Count - 1);
        }

        private readonly ICollectionView _demoItemsView;
        private DemoItem _selectedItem;
        private int _selectedIndex;
        private string _searchKeyword;
        private bool _controlsEnabled = true;

        public string SearchKeyword
        {
            get => _searchKeyword;
            set
            {
                if (SetProperty(ref _searchKeyword, value))
                {
                    _demoItemsView.Refresh();
                }
            }
        }

        public ObservableCollection<DemoItem> DemoItems { get; }

        public DemoItem SelectedItem
        {
            get => _selectedItem;
            set => SetProperty(ref _selectedItem, value);
        }

        public int SelectedIndex
        {
            get => _selectedIndex;
            set => SetProperty(ref _selectedIndex, value);
        }

        public bool ControlsEnabled
        {
            get => _controlsEnabled;
            set => SetProperty(ref _controlsEnabled, value);
        }

        public AnotherCommandImplementation HomeCommand { get; }
        public AnotherCommandImplementation MovePrevCommand { get; }
        public AnotherCommandImplementation MoveNextCommand { get; }
        public AnotherCommandImplementation DismissAllNotificationsCommand { get; }
        public AnotherCommandImplementation AddNewNotificationCommand { get; }

        private static IEnumerable<DemoItem> GenerateDemoItems(ISnackbarMessageQueue snackbarMessageQueue)
        {
            if (snackbarMessageQueue is null)
                throw new ArgumentNullException(nameof(snackbarMessageQueue));

            yield return new DemoItem(
                "Reclamaciones",
                typeof(ClaimsTool),
                new[]
                {
                    DocumentationLink.DemoPageLink<ClaimsTool>("Demo View"),
                    DocumentationLink.DemoPageLink<ClaimsToolViewModel>("Demo View Model"),
                    DocumentationLink.ApiLink<PaletteHelper>()
                },
                selectedIcon: PackIconKind.StoreEditOutline,
                unselectedIcon: PackIconKind.StoreEditOutline);


            //yield return new DemoItem(
            //    "Ajuste1",
            //    typeof(ClaimsTool),
            //    new[]
            //    {
            //        DocumentationLink.DemoPageLink<ClaimsTool>("Demo View"),
            //        DocumentationLink.DemoPageLink<ClaimsToolViewModel>("Demo View Model"),
            //        DocumentationLink.ApiLink<PaletteHelper>()
            //    },
            //    selectedIcon: PackIconKind.StoreEditOutline,
            //    unselectedIcon: PackIconKind.StoreEditOutline);

            //yield return new DemoItem(
            //    "Rating",
            //    typeof(RatingBar),
            //    new[]
            //    {
            //        DocumentationLink.DemoPageLink<RatingBar>(),
            //        DocumentationLink.StyleLink("RatingBar"),
            //        DocumentationLink.ApiLink<RatingBar>()
            //    },
            //    selectedIcon: PackIconKind.Star,
            //    unselectedIcon: PackIconKind.StarOutline);

            //yield return new DemoItem(
            //    "Elevation",
            //    typeof(Elevation),
            //    new[]
            //    {
            //        DocumentationLink.DemoPageLink<Elevation>(),
            //        DocumentationLink.StyleLink("Shadows"),
            //        DocumentationLink.SpecsLink("https://material.io/design/environment/elevation.html", "Elevation")
            //    },
            //    selectedIcon: PackIconKind.BoxShadow,
            //    unselectedIcon: PackIconKind.BoxShadow);
        }

        private bool DemoItemsFilter(object obj)
        {
            if (string.IsNullOrWhiteSpace(_searchKeyword))
            {
                return true;
            }

            return obj is DemoItem item
                   && item.Name.ToLower().Contains(_searchKeyword.ToLower());
        }

    }
}