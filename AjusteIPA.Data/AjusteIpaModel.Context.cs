﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class AjusteIpaDBEntities : DbContext
    {
        public AjusteIpaDBEntities()
            : base("name=AjusteIpaDBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<CodigoCatastrofico> CodigoCatastroficoes { get; set; }
        public virtual DbSet<Cuenta> Cuentas { get; set; }
        public virtual DbSet<Especialidad> Especialidads { get; set; }
        public virtual DbSet<IPA> IPAs { get; set; }
        public virtual DbSet<Municipio> Municipios { get; set; }
        public virtual DbSet<Reclamaciones> Reclamaciones { get; set; }
        public virtual DbSet<RegistroCatastrofico> RegistroCatastroficoes { get; set; }
        public virtual DbSet<Rol> Rols { get; set; }
        public virtual DbSet<Tier> Tiers { get; set; }
        public virtual DbSet<TipoServicio> TipoServicios { get; set; }
        public virtual DbSet<Usuario> Usuarios { get; set; }
        public virtual DbSet<LogReclamacionesAjustada> LogReclamacionesAjustadas1 { get; set; }
    }
}
