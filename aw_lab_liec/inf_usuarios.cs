//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class inf_usuarios
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public inf_usuarios()
        {
            this.inf_cont_usr = new HashSet<inf_cont_usr>();
        }
    
        public System.Guid id_usuario { get; set; }
        public Nullable<int> id_est_usr { get; set; }
        public Nullable<int> id_genero { get; set; }
        public System.Guid id_area { get; set; }
        public Nullable<int> id_departamento { get; set; }
        public Nullable<int> id_perfil { get; set; }
        public string email { get; set; }
        public string cod_usr { get; set; }
        public string usr { get; set; }
        public string clave { get; set; }
        public string nombres { get; set; }
        public string a_paterno { get; set; }
        public string a_materno { get; set; }
        public Nullable<System.DateTime> fecha_nacimiento { get; set; }
        public Nullable<System.DateTime> fecha_registro { get; set; }
        public System.Guid id_emp { get; set; }
    
        public virtual fact_areas fact_areas { get; set; }
        public virtual fact_departamento fact_departamento { get; set; }
        public virtual fact_estatus fact_estatus { get; set; }
        public virtual fact_generos fact_generos { get; set; }
        public virtual fact_perfil fact_perfil { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<inf_cont_usr> inf_cont_usr { get; set; }
    }
}
