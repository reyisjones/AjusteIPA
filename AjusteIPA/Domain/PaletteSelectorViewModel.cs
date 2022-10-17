using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using MaterialDesignColors;
using MaterialDesignThemes.Wpf;
namespace AjusteIPA.Domain
{
    public class PaletteSelectorViewModel : ViewModelBase
    {
        public PaletteSelectorViewModel()
        {
            Swatches = new SwatchesProvider().Swatches;
        }

        public IEnumerable<Swatch> Swatches { get; }

        public ICommand ApplyPrimaryCommand { get; } = new AnotherCommandImplementation(o => ApplyPrimary((Swatch)o));

        private static void ApplyPrimary(Swatch swatch)
            => ModifyTheme(theme => theme.SetPrimaryColor(swatch.ExemplarHue.Color));

        public ICommand ApplyAccentCommand { get; } = new AnotherCommandImplementation(o => ApplyAccent((Swatch)o));

        private static void ApplyAccent(Swatch swatch)
        {
            // TODO: Implement swatch
            //if (swatch is { AccentExemplarHue: not null })
            //{
            //    ModifyTheme(theme => theme.SetSecondaryColor(swatch.AccentExemplarHue.Color));
            //}
        }

        private static void ModifyTheme(Action<ITheme> modificationAction)
        {
            var paletteHelper = new PaletteHelper();
            ITheme theme = paletteHelper.GetTheme();

            modificationAction?.Invoke(theme);

            paletteHelper.SetTheme(theme);
        }
    }
}
