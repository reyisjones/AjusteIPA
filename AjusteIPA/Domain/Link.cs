using System.Diagnostics;
using System.Runtime.InteropServices;

namespace AjusteIPA.Domain
{
    public static class Link
    {
        public static void OpenInBrowser(string url)
        {
            if (!string.IsNullOrEmpty(url) && RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
            {
                Process.Start(new ProcessStartInfo(url) { UseShellExecute = true });
            }
        }
    }
}