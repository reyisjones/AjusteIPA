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
        public int idusuario { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string numempleado { get; set; }
        public Nullable<int> rolid { get; set; }
        public string password { get; set; }
        public string Estatus { get; set; }
    
        public virtual Rol Rol { get; set; }
    }
}