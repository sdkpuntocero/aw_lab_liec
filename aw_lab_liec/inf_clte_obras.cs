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
    
    public partial class inf_clte_obras
    {
        public int id_clte_obras { get; set; }
        public Nullable<int> id_est_obra { get; set; }
        public string clave_obra { get; set; }
        public string desc_obra { get; set; }
        public string coordinador { get; set; }
        public string contacto_obra { get; set; }
        public int id_tipo_servicio { get; set; }
        public string comentarios { get; set; }
        public Nullable<System.DateTime> fecha_registro { get; set; }
        public System.Guid id_clte { get; set; }
    }
}
