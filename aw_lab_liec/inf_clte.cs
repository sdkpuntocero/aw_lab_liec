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
    
    public partial class inf_clte
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public inf_clte()
        {
            this.inf_clte_obras = new HashSet<inf_clte_obras>();
        }
    
        public System.Guid id_clte { get; set; }
        public Nullable<int> id_est_clte { get; set; }
        public string cod_clte { get; set; }
        public Nullable<int> id_tipo_rfc { get; set; }
        public string rfc { get; set; }
        public string razon_social { get; set; }
        public string telefono { get; set; }
        public string email { get; set; }
        public string callenum { get; set; }
        public string d_codigo { get; set; }
        public Nullable<int> id_asenta_cpcons { get; set; }
        public Nullable<System.DateTime> fecha_registro { get; set; }
        public string comentarios { get; set; }
        public System.Guid id_emp { get; set; }
    
        public virtual fact_est_clte fact_est_clte { get; set; }
        public virtual fact_tipo_rfc fact_tipo_rfc { get; set; }
        public virtual inf_emp inf_emp { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<inf_clte_obras> inf_clte_obras { get; set; }
    }
}