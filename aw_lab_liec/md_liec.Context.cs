﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace aw_lab_liec
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class lab_liecEntities : DbContext
    {
        public lab_liecEntities()
            : base("name=lab_liecEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<fac_sit_concreto> fac_sit_concreto { get; set; }
        public virtual DbSet<fac_tipo_concreto> fac_tipo_concreto { get; set; }
        public virtual DbSet<fact_areas> fact_areas { get; set; }
        public virtual DbSet<fact_departamento> fact_departamento { get; set; }
        public virtual DbSet<fact_especimen> fact_especimen { get; set; }
        public virtual DbSet<fact_est_areas> fact_est_areas { get; set; }
        public virtual DbSet<fact_est_caja> fact_est_caja { get; set; }
        public virtual DbSet<fact_est_clte> fact_est_clte { get; set; }
        public virtual DbSet<fact_est_concreto> fact_est_concreto { get; set; }
        public virtual DbSet<fact_est_e_env> fact_est_e_env { get; set; }
        public virtual DbSet<fact_est_e_recep> fact_est_e_recep { get; set; }
        public virtual DbSet<fact_est_gast> fact_est_gast { get; set; }
        public virtual DbSet<fact_est_obra> fact_est_obra { get; set; }
        public virtual DbSet<fact_est_rub> fact_est_rub { get; set; }
        public virtual DbSet<fact_est_rubm> fact_est_rubm { get; set; }
        public virtual DbSet<fact_estatus> fact_estatus { get; set; }
        public virtual DbSet<fact_generos> fact_generos { get; set; }
        public virtual DbSet<fact_perfil> fact_perfil { get; set; }
        public virtual DbSet<fact_tipo_rfc> fact_tipo_rfc { get; set; }
        public virtual DbSet<fact_tipo_rubro> fact_tipo_rubro { get; set; }
        public virtual DbSet<fact_tipo_servicio> fact_tipo_servicio { get; set; }
        public virtual DbSet<inf_caja> inf_caja { get; set; }
        public virtual DbSet<inf_clte> inf_clte { get; set; }
        public virtual DbSet<inf_clte_obras> inf_clte_obras { get; set; }
        public virtual DbSet<inf_conc_ec> inf_conc_ec { get; set; }
        public virtual DbSet<inf_cont_usr> inf_cont_usr { get; set; }
        public virtual DbSet<inf_control_montos> inf_control_montos { get; set; }
        public virtual DbSet<inf_email_envio> inf_email_envio { get; set; }
        public virtual DbSet<inf_email_recepcion> inf_email_recepcion { get; set; }
        public virtual DbSet<inf_emp> inf_emp { get; set; }
        public virtual DbSet<inf_gastos> inf_gastos { get; set; }
        public virtual DbSet<inf_gastos_dep> inf_gastos_dep { get; set; }
        public virtual DbSet<inf_mrp_concreto> inf_mrp_concreto { get; set; }
        public virtual DbSet<inf_rubro> inf_rubro { get; set; }
        public virtual DbSet<inf_rubro_mes> inf_rubro_mes { get; set; }
        public virtual DbSet<inf_sepomex> inf_sepomex { get; set; }
        public virtual DbSet<inf_usuarios> inf_usuarios { get; set; }
    }
}
