//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AjusteIPA.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Usuario
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Usuario()
        {
            this.Reclamaciones = new HashSet<Reclamaciones>();
        }
    
        public int idusuario { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string numempleado { get; set; }
        public Nullable<int> rolid { get; set; }
        public string password { get; set; }
        public string Estatus { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Reclamaciones> Reclamaciones { get; set; }
        public virtual Rol Rol { get; set; }
    }
}
