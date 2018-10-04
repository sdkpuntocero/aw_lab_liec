using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace aw_lab_liec
{
    public partial class panel_concreto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    DateTime fecha_actual = DateTime.Now;
                    lbl_fechaactual.Text = "FECHA ACTUAL: " + fecha_actual.ToLongDateString().ToUpper();
                }
                else
                {
                }
            }
            catch
            {
                Response.Redirect("acceso.aspx");
            }
        }

        private void filtra_panel(int int_idpanel)
        {
            switch (int_idpanel)
            {
                case 1:

                    pnl_cot_rt_01.Visible = true;

               

                    limpiar_con_rt_01();
                    
                    
                    

                    break;

      

                default:

                    break;
            }
        }

        private void limpiar_con_rt_01()
        {
            DropDownList1.Items.Clear();
            using (lab_liecEntities m_genero = new lab_liecEntities())
            {
                var i_genero = (from f_tr in m_genero.fact_especimen
                                select f_tr).ToList();

                DropDownList1.DataSource = i_genero;
                DropDownList1.DataTextField = "desc_tipo_especimen";
                DropDownList1.DataValueField = "id_tipo_especimen";
                DropDownList1.DataBind();
            }
            DropDownList1.Items.Insert(0, new ListItem("Seleccionar", "0"));

            DropDownList1.Items.Clear();
            using (lab_liecEntities m_genero = new lab_liecEntities())
            {
                var i_genero = (from f_tr in m_genero.fact_especimen
                                select f_tr).ToList();

                DropDownList1.DataSource = i_genero;
                DropDownList1.DataTextField = "desc_tipo_especimen";
                DropDownList1.DataValueField = "id_tipo_especimen";
                DropDownList1.DataBind();
            }
            DropDownList1.Items.Insert(0, new ListItem("Seleccionar", "0"));


            DropDownList2.Items.Clear();
            using (lab_liecEntities m_genero = new lab_liecEntities())
            {
                var i_genero = (from f_tr in m_genero.fac_tipo_concreto
                                select f_tr).ToList();

                DropDownList2.DataSource = i_genero;
                DropDownList2.DataTextField = "desc_tipo_concreto";
                DropDownList2.DataValueField = "id_tipo_concreto";
                DropDownList2.DataBind();
            }
            DropDownList2.Items.Insert(0, new ListItem("Seleccionar", "0"));

            DropDownList3.Items.Clear();
            //using (lab_liecEntities m_genero = new lab_liecEntities())
            //{
            //    var i_genero = (from f_tr in m_genero.fac_situacion_concreto
            //                    select f_tr).ToList();

            //    DropDownList3.DataSource = i_genero;
            //    DropDownList3.DataTextField = "desc_situacion_concreto";
            //    DropDownList3.DataValueField = "id_situacion_concreto";
            //    DropDownList3.DataBind();
            //}
            DropDownList3.Items.Insert(0, new ListItem("Seleccionar", "0"));
        }

        protected void lkb_cot_rt_01_Click(object sender, EventArgs e)
        {
            filtra_panel(1);
        }
    }
}