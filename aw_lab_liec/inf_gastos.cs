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
    
    public partial class inf_gastos
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public inf_gastos()
        {
            this.inf_gastos_dep = new HashSet<inf_gastos_dep>();
        }
    
        public System.Guid id_gasto { get; set; }
        public Nullable<int> id_est_gast { get; set; }
        public Nullable<int> id_est_rpt { get; set; }
        public Nullable<int> id_tipo_rubro { get; set; }
        public Nullable<System.Guid> id_rubro { get; set; }
        public Nullable<decimal> monto { get; set; }
        public Nullable<System.DateTime> fecha_registro { get; set; }
        public Nullable<System.Guid> id_emp { get; set; }
        public string desc_gasto { get; set; }
        public string codigo_gasto { get; set; }
    
        public virtual fact_est_gast fact_est_gast { get; set; }
        public virtual inf_emp inf_emp { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<inf_gastos_dep> inf_gastos_dep { get; set; }
    }
}
