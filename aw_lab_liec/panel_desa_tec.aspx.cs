using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace aw_lab_liec
{
    public partial class panel_desa_tec : System.Web.UI.Page
    {
        private static int int_areas, int_pnlID, int_e_env;
        private static Guid guid_emp = Guid.Parse("d8a03556-6791-45f3-babe-ecf267b865f1");

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        #region funciones

        [ScriptMethod()]
        [WebMethod]
        public static List<string> SearchCustomers(string prefixText, int count)
        {
            List<String> columnData = new List<String>();
            string str_fclte = prefixText.ToUpper();

            if (int_pnlID == 1)
            {
                using (SqlConnection connection = new SqlConnection(cn.cn_SQL))
                {
                    connection.Open();
                    string query = "SELECT [cod_area],[desc_areas] FROM [lab_liec].[dbo].[fact_areas]  WHERE [desc_areas] LIKE '" + str_fclte + "%' ";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                columnData.Add(reader.GetString(0));
                            }
                        }
                    }
                }
            }
            else if (int_pnlID == 2)
            {
                using (SqlConnection connection = new SqlConnection(cn.cn_SQL))
                {
                    connection.Open();
                    string query = "SELECT [desc_areas],[cod_area] FROM [lab_liec].[dbo].[fact_areas]  WHERE [desc_areas] LIKE '" + str_fclte + "%' ";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                columnData.Add(reader.GetString(0) + " | " + reader.GetString(1).ToUpper());
                            }
                        }
                    }
                }
            }
            else if (int_pnlID == 3)
            {
                using (SqlConnection connection = new SqlConnection(cn.cn_SQL))
                {
                    connection.Open();
                    string query = @"SELECT         nom_completo,cod_usr
        FROM            (SELECT        cod_usr,  CONCAT(nombres, ' ', a_paterno, ' ', a_materno)  AS nom_completo
                                  FROM            inf_usuarios) AS DEV_USR WHERE nom_completo LIKE '" + str_fclte + "%' ";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                columnData.Add(reader.GetString(0) + " | " + reader.GetString(1).ToUpper());
                            }
                        }
                    }
                }
            }

            return columnData;
        }

        private void Mensaje(string contenido)
        {
            lblModalTitle.Text = "LIEC";
            lblModalBody.Text = contenido;
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
            upModal.Update();
        }

        #endregion funciones

        #region menu
        protected void lkb_areas_Click(object sender, EventArgs e)
        {
            int_areas = 0;
            int_pnlID = 2;
            i_areas.Attributes["style"] = "color:#104D8d";
            lbl_areas.Attributes["style"] = "color:#104D8d";
            i_e_envio.Attributes["style"] = "color:#E34C0E";
            lbl_e_envio.Attributes["style"] = "color:#104D8dE34C0E";

            i_agregar_areas.Attributes["style"] = "color:white";
            i_editar_areas.Attributes["style"] = "color:white";

            pnl_areas.Visible = true;
            up_areas.Update();

            limp_txt_area();
            div_busc_clt.Visible = false;
            gv_areas.Visible = false;

            pnl_e_env.Visible = false;
            up_e_env.Update();
        }

        protected void lkb_e_env_Click(object sender, EventArgs e)
        {
            int_e_env = 0;
            int_pnlID = 0;

            i_areas.Attributes["style"] = "color:#E34C0E";
            lbl_areas.Attributes["style"] = "color:#E34C0E";

            i_e_envio.Attributes["style"] = "color:#104D8d";
            lbl_e_envio.Attributes["style"] = "color:#104D8d";



            i_agregar_e_env.Attributes["style"] = "color:white";
            i_editar_e_env.Attributes["style"] = "color:white";

        

            pnl_areas.Visible = false;
            up_areas.Update();

            limpia_e_env();
            div_busc_e_env.Visible = false;
            gv_e_env.Visible = false;


            pnl_e_env.Visible = true;
            up_e_env.Update();
        }

        protected void lkb_e_rec_Click(object sender, EventArgs e)
        {

        }
        #endregion

        #region areas



        protected void btn_guardar_areas_Click(object sender, EventArgs e)
        {
            if (int_areas == 0)
            {
                Mensaje("Favor de seleccionar una acción");
            }
            else
            {
                try
                {
                    Guid guid_area = Guid.NewGuid();
                    
                    string str_area = txt_areas_coment.Text.ToUpper().Trim();
                    string str_codigo_area;

                    if (int_areas == 1)
                    {
                        using (lab_liecEntities edm_nclte = new lab_liecEntities())
                        {
                            var i_nclte = (from c in edm_nclte.fact_areas
                                           where c.desc_areas == str_area
                                           select c).ToList();

                            if (i_nclte.Count == 0)
                            {
                                using (lab_liecEntities edm_fclte = new lab_liecEntities())
                                {
                                    var i_fclte = (from c in edm_fclte.fact_areas
                                                   select c).ToList();

                                    if (i_fclte.Count == 0)
                                    {
                                        str_codigo_area = "LIEC-AREA" + string.Format("{0:000}", (object)(i_nclte.Count + 1));

                                        using (var m_clte = new lab_liecEntities())
                                        {
                                            var i_clte = new fact_areas

                                            {
                                                id_area = guid_area,
                                                cod_area = str_codigo_area,
                                                id_est_areas = 1,
                                                desc_areas = str_area,
                                                id_emp = guid_emp,
                                                fecha_registro = DateTime.Now
                                            };

                                            m_clte.fact_areas.Add(i_clte);
                                            m_clte.SaveChanges();
                                        }
                                        limp_txt_area();
                                        Mensaje("Datos de área agregados con éxito.");
                                    }
                                    else
                                    {
                                        str_codigo_area = "LIEC-AREA" + string.Format("{0:000}", (object)(i_fclte.Count + 1));

                                        using (var m_clte = new lab_liecEntities())
                                        {
                                            var i_clte = new fact_areas

                                            {
                                                id_area = guid_area,
                                                cod_area = str_codigo_area,
                                                id_est_areas = 1,
                                                desc_areas = str_area,
                                                id_emp = guid_emp,
                                                fecha_registro = DateTime.Now
                                            };

                                            m_clte.fact_areas.Add(i_clte);
                                            m_clte.SaveChanges();
                                        }
                                        limp_txt_area();

                                        Mensaje("Datos de área agregados con éxito.");
                                    }
                                }
                            }
                            else
                            {
                                limp_txt_area();
                                rfv_areas_coment.Enabled = false;
                                Mensaje("Área existe en la base de datos, favor de revisar.");
                            }
                        }
                    }
                    else if (int_areas == 2)
                    {
                        int int_ddl, int_f_clte = 0;
                        int int_estatusID = 0;
                        string str_fclte = null;
                        string v_area = null;
                        foreach (GridViewRow row in gv_areas.Rows)
                        {
                            // int key = (int)GridView1.DataKeys[row.RowIndex].Value;
                            if (row.RowType == DataControlRowType.DataRow)
                            {
                                CheckBox chkRow = (row.Cells[0].FindControl("chk_areas") as CheckBox);
                                if (chkRow.Checked)
                                {
                                    int_f_clte = int_f_clte + 1;
                                    str_fclte = row.Cells[1].Text;
                                    v_area = row.Cells[2].Text;
                                    DropDownList dl = (DropDownList)row.FindControl("ddl_area_estatus");

                                    int_ddl = int.Parse(dl.SelectedValue);
                                    if (int_ddl == 1)
                                    {
                                        int_estatusID = 1;
                                        break;
                                    }
                                    else if (int_ddl == 2)
                                    {
                                        int_estatusID = 2;
                                        break;
                                    }
                                    break;
                                }
                            }
                        }

                        if (int_estatusID == 0)
                        {
                            Mensaje("Favor de seleccionar una área.");
                        }
                        else
                        {
                            using (var m_clte = new lab_liecEntities())
                            {
                                var i_clte = (from c in m_clte.fact_areas
                                              where c.cod_area == str_fclte
                                              select c).FirstOrDefault();

                                if (str_area == i_clte.desc_areas)
                                {
                                    var i_area = (from c in m_clte.fact_areas
                                                  where c.cod_area == str_fclte
                                                  select c).FirstOrDefault();

                                    i_area.id_est_areas = int_estatusID;
                                    i_area.desc_areas = str_area;

                                    m_clte.SaveChanges();

                                    rfv_buscar_areas.Enabled = false;
                                    rfv_areas_coment.Enabled = false;
                                    limp_txt_area();
                                    Mensaje("Datos de área actualizados con éxito.");
                                }
                                else
                                {
                                    var i_nclte = (from c in m_clte.fact_areas
                                                   where c.desc_areas == str_area
                                                   select c).ToList();

                                    if (i_nclte.Count == 0)
                                    {
                                        var i_fareas = (from c in m_clte.fact_areas
                                                        where c.cod_area == str_fclte
                                                        select c).FirstOrDefault();

                                        i_fareas.id_est_areas = int_estatusID;
                                        i_fareas.desc_areas = str_area;

                                        m_clte.SaveChanges();

                                        rfv_buscar_areas.Enabled = false;
                                        rfv_areas_coment.Enabled = false;
                                        limp_txt_area();
                                        string str_clte = txt_buscar_areas.Text.ToUpper().Trim();
                                        try
                                        {
                                            if (str_clte == "TODOS")
                                            {
                                                using (lab_liecEntities data_areas = new lab_liecEntities())
                                                {
                                                    var i_areas = (from t_areas in data_areas.fact_areas
                                                                   join t_est in data_areas.fact_est_areas on t_areas.id_est_areas equals t_est.id_est_area

                                                                   select new
                                                                   {
                                                                       t_areas.cod_area,
                                                                       t_est.desc_est_area,
                                                                       t_areas.desc_areas,
                                                                       t_areas.fecha_registro
                                                                   }).OrderBy(x => x.cod_area).ToList();

                                                    gv_areas.DataSource = i_areas;
                                                    gv_areas.DataBind();
                                                    gv_areas.Visible = true;
                                                }
                                            }
                                            else
                                            {
                                                string n_rub;
                                                Char char_s = '|';
                                                string d_rub = txt_buscar_areas.Text.Trim();
                                                String[] de_rub = d_rub.Trim().Split(char_s);
                                                n_rub = de_rub[1].Trim();

                                                using (lab_liecEntities data_areas = new lab_liecEntities())
                                                {
                                                    var i_areas = (from t_areas in data_areas.fact_areas
                                                                   join t_est in data_areas.fact_est_areas on t_areas.id_est_areas equals t_est.id_est_area
                                                                   where t_areas.cod_area == n_rub

                                                                   select new
                                                                   {
                                                                       t_areas.cod_area,
                                                                       t_est.desc_est_area,
                                                                       t_areas.desc_areas,
                                                                       t_areas.fecha_registro
                                                                   }).OrderBy(x => x.cod_area).ToList();

                                                    gv_areas.DataSource = i_areas;
                                                    gv_areas.DataBind();
                                                    gv_areas.Visible = true;
                                                }
                                            }
                                        }
                                        catch
                                        {
                                            txt_areas_coment.Text = null;
                                            txt_buscar_areas.Text = null;
                                            Mensaje("Área no existe, favor de revisar.");
                                        }
                                        Mensaje("Datos de área actualizados con éxito.");
                                    }
                                    else
                                    {
                                        limp_txt_area();
                                        Mensaje("Área ya existe en la base de datos, favor de revisar.");
                                    }
                                }
                            }
                        }
                    }
                }
                catch
                { }
            }
        }

        private void limp_txt_area()
        {
        }

        protected void btn_agregar_areas_Click(object sender, EventArgs e)

        {
            int_areas = 1;

            i_agregar_areas.Attributes["style"] = "color:#E34C0E";
            i_editar_areas.Attributes["style"] = "color:white";
            rfv_areas_coment.Enabled = true;
            rfv_buscar_areas.Enabled = false;
            div_busc_clt.Visible = false;
            gv_areas.Visible = false;
        }

        protected void btn_buscar_areas_Click(object sender, EventArgs e)
        {
            txt_areas_coment.Text = null;
            string str_clte = txt_buscar_areas.Text.ToUpper().Trim();
            try
            {
                if (str_clte == "TODOS")
                {
                    using (lab_liecEntities data_areas = new lab_liecEntities())
                    {
                        var i_areas = (from t_areas in data_areas.fact_areas
                                       join t_est in data_areas.fact_est_areas on t_areas.id_est_areas equals t_est.id_est_area

                                       select new
                                       {
                                           t_areas.cod_area,
                                           t_est.desc_est_area,
                                           t_areas.desc_areas,
                                           t_areas.fecha_registro
                                       }).OrderBy(x => x.cod_area).ToList();

                        gv_areas.DataSource = i_areas;
                        gv_areas.DataBind();
                        gv_areas.Visible = true;
                    }
                }
                else
                {
                    string n_rub;
                    Char char_s = '|';
                    string d_rub = txt_buscar_areas.Text.Trim();
                    String[] de_rub = d_rub.Trim().Split(char_s);
                    n_rub = de_rub[1].Trim();

                    using (lab_liecEntities data_areas = new lab_liecEntities())
                    {
                        var i_areas = (from t_areas in data_areas.fact_areas
                                       join t_est in data_areas.fact_est_areas on t_areas.id_est_areas equals t_est.id_est_area
                                       where t_areas.cod_area == n_rub

                                       select new
                                       {
                                           t_areas.cod_area,
                                           t_est.desc_est_area,
                                           t_areas.desc_areas,
                                           t_areas.fecha_registro
                                       }).OrderBy(x => x.cod_area).ToList();

                        gv_areas.DataSource = i_areas;
                        gv_areas.DataBind();
                        gv_areas.Visible = true;
                    }
                }
            }
            catch
            {
                txt_areas_coment.Text = null;
                txt_buscar_areas.Text = null;
                Mensaje("Área no existe, favor de revisar.");
            }
        }

        protected void chk_areas_CheckedChanged(object sender, EventArgs e)
        {
            string str_rub;
            Guid guid_rub;

            foreach (GridViewRow row in gv_areas.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chk_areas") as CheckBox);
                    if (chkRow.Checked)
                    {
                        row.BackColor = Color.FromArgb(227, 76, 14);
                        str_rub = row.Cells[1].Text;

                        using (lab_liecEntities edm_rub = new lab_liecEntities())
                        {
                            var i_rub = (from c in edm_rub.fact_areas
                                         where c.cod_area == str_rub
                                         select c).FirstOrDefault();

                            guid_rub = i_rub.id_area;

                            var f_rub = (from r in edm_rub.fact_areas
                                         where r.id_area == guid_rub
                                         select new
                                         {
                                             r.desc_areas,
                                         }).FirstOrDefault();

                            txt_areas_coment.Text = f_rub.desc_areas;
                        }
                    }
                    else
                    {
                        row.BackColor = Color.White;
                    }
                }
            }
        }

        protected void gv_areas_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string str_clteID = e.Row.Cells[1].Text;
                int int_estatusID;

                using (lab_liecEntities data_clte = new lab_liecEntities())
                {
                    var i_clte = (from t_clte in data_clte.fact_areas
                                  where t_clte.cod_area == str_clteID
                                  select new
                                  {
                                      t_clte.id_est_areas,
                                  }).FirstOrDefault();

                    int_estatusID = int.Parse(i_clte.id_est_areas.ToString());
                }

                DropDownList DropDownList1 = (e.Row.FindControl("ddl_area_estatus") as DropDownList);

                using (lab_liecEntities db_sepomex = new lab_liecEntities())
                {
                    var tbl_sepomex = (from c in db_sepomex.fact_est_areas
                                       select c).ToList();

                    DropDownList1.DataSource = tbl_sepomex;

                    DropDownList1.DataTextField = "desc_est_area";
                    DropDownList1.DataValueField = "id_est_area";
                    DropDownList1.DataBind();
                    DropDownList1.Items.Insert(0, new ListItem("SELECCIONAR", "0"));
                    DropDownList1.SelectedValue = int_estatusID.ToString();
                }
            }
        }

        protected void gv_areas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_areas.PageIndex = e.NewPageIndex;
            string str_clte = txt_buscar_areas.Text.ToUpper().Trim();

            if (str_clte == "TODOS")
            {
                using (lab_liecEntities data_areas = new lab_liecEntities())
                {
                    var i_areas = (from t_areas in data_areas.fact_areas
                                   select new
                                   {
                                       t_areas.cod_area,
                                       t_areas.desc_areas,
                                       t_areas.fecha_registro
                                   }).OrderBy(x => x.cod_area).ToList();

                    gv_areas.DataSource = i_areas;
                    gv_areas.DataBind();
                    gv_areas.Visible = true;
                }
            }
            else
            {
                string n_rub;
                Char char_s = '|';
                string d_rub = txt_buscar_areas.Text.Trim();
                String[] de_rub = d_rub.Trim().Split(char_s);
                n_rub = de_rub[1].Trim();

                using (lab_liecEntities data_areas = new lab_liecEntities())
                {
                    var i_areas = (from t_areas in data_areas.fact_areas
                                   where t_areas.cod_area == n_rub

                                   select new
                                   {
                                       t_areas.cod_area,

                                       t_areas.desc_areas,
                                       t_areas.fecha_registro
                                   }).OrderBy(x => x.cod_area).ToList();

                    gv_areas.DataSource = i_areas;
                    gv_areas.DataBind();
                    gv_areas.Visible = true;
                }
            }

            limp_txt_area();
        }



        protected void chkb_desactivar_areas_CheckedChanged(object sender, EventArgs e)
        {
            int_areas = 0;
            i_agregar_areas.Attributes["style"] = "color:white";
            i_editar_areas.Attributes["style"] = "color:white";
            rfv_areas_coment.Enabled = false;
            rfv_buscar_areas.Enabled = false;
            div_busc_clt.Visible = false;
        }

        protected void btn_editar_areas_Click(object sender, EventArgs e)
        {
            int_areas = 2;

            i_agregar_areas.Attributes["style"] = "color:white";
            i_editar_areas.Attributes["style"] = "color:#E34C0E";
            div_busc_clt.Visible = true;
            rfv_buscar_areas.Enabled = true;
        }

        #endregion areas

        #region corro_envio
        protected void btn_buscar_e_env_Click(object sender, EventArgs e)
        {
           
            string str_e = txt_buscar_e_env.Text.ToUpper().Trim();
            try
            {
                if (str_e == "TODOS")
                {
                    using (lab_liecEntities data_e_env = new lab_liecEntities())
                    {
                        var i_e_env = (from t_e_env in data_e_env.inf_email_envio
                                       join t_est in data_e_env.fact_est_e_env on t_e_env.id_est_e_env equals t_est.id_est_e_env

                                       select new
                                       {
                                           t_e_env.email,
                                           
                                           t_e_env.fecha_registro
                                       }).OrderBy(x => x.email).ToList();

                        gv_e_env.DataSource = i_e_env;
                        gv_e_env.DataBind();
                        gv_e_env.Visible = true;
                    }
                }
                else
                {


                    using (lab_liecEntities data_e_env = new lab_liecEntities())
                    {
                        var i_e_env = (from t_e_env in data_e_env.inf_email_envio
                                       join t_est in data_e_env.fact_est_e_env on t_e_env.id_est_e_env equals t_est.id_est_e_env
                                       where t_e_env.email == str_e
                                       select new
                                       {
                                           t_e_env.email,

                                           t_e_env.fecha_registro
                                       }).OrderBy(x => x.email).ToList();

                        gv_e_env.DataSource = i_e_env;
                        gv_e_env.DataBind();
                        gv_e_env.Visible = true;
                    }
                }
            }
            catch
            {
                
                txt_buscar_e_env.Text = null;
                Mensaje("Correo no existe, favor de revisar.");
            }
        }

        protected void btn_agregar_e_env_Click(object sender, EventArgs e)
        {

            int_e_env = 1;

            i_agregar_e_env.Attributes["style"] = "color:#E34C0E";
            i_editar_e_env.Attributes["style"] = "color:white";

            rfv_buscar_e_env.Enabled = false;
            div_busc_e_env.Visible = false;
            gv_e_env.Visible = false;

            rfv_correo_envio.Enabled = true;
            rfv_asunto_envio.Enabled = true;
            rfv_usuario_envio.Enabled = true;
            rfv_servidor_smtp.Enabled = true;
            rfv_clave_envio.Enabled = true;
            rfv_puerto_envio.Enabled = true;



        }

        protected void btn_editar_e_env_Click(object sender, EventArgs e)
        {
            int_e_env = 2;

            i_agregar_e_env.Attributes["style"] = "color:white";
            i_editar_e_env.Attributes["style"] = "color:#E34C0E";

            div_busc_e_env.Visible = true;
            rfv_buscar_e_env.Enabled = true;

        }

        protected void gv_e_env_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_e_env.PageIndex = e.NewPageIndex;
            string str_e = txt_buscar_e_env.Text.ToUpper().Trim();
            try
            {
                if (str_e == "TODOS")
                {
                    using (lab_liecEntities data_e_env = new lab_liecEntities())
                    {
                        var i_e_env = (from t_e_env in data_e_env.inf_email_envio
                                       join t_est in data_e_env.fact_est_e_env on t_e_env.id_est_e_env equals t_est.id_est_e_env

                                       select new
                                       {
                                           t_e_env.email,

                                           t_e_env.fecha_registro
                                       }).OrderBy(x => x.email).ToList();

                        gv_e_env.DataSource = i_e_env;
                        gv_e_env.DataBind();
                        gv_e_env.Visible = true;
                    }
                }
                else
                {


                    using (lab_liecEntities data_e_env = new lab_liecEntities())
                    {
                        var i_e_env = (from t_e_env in data_e_env.inf_email_envio
                                       join t_est in data_e_env.fact_est_e_env on t_e_env.id_est_e_env equals t_est.id_est_e_env
                                       where t_e_env.email == str_e
                                       select new
                                       {
                                           t_e_env.email,

                                           t_e_env.fecha_registro
                                       }).OrderBy(x => x.email).ToList();

                        gv_e_env.DataSource = i_e_env;
                        gv_e_env.DataBind();
                        gv_e_env.Visible = true;
                    }
                }
            }
            catch
            {

                txt_buscar_e_env.Text = null;
                Mensaje("Correo no existe, favor de revisar.");
            }
        }

        protected void gv_e_env_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string str_clteID = e.Row.Cells[1].Text;
                int int_estatusID;

                using (lab_liecEntities data_clte = new lab_liecEntities())
                {
                    var i_clte = (from t_clte in data_clte.inf_email_envio
                                  where t_clte.email == str_clteID
                                  select new
                                  {
                                      t_clte.id_est_e_env,
                                  }).FirstOrDefault();

                    int_estatusID = int.Parse(i_clte.id_est_e_env.ToString());
                }

                DropDownList DropDownList1 = (e.Row.FindControl("ddl_est_e_env") as DropDownList);

                using (lab_liecEntities db_sepomex = new lab_liecEntities())
                {
                    var tbl_sepomex = (from c in db_sepomex.fact_est_e_env
                                       select c).ToList();

                    DropDownList1.DataSource = tbl_sepomex;

                    DropDownList1.DataTextField = "descid_est_e_env";
                    DropDownList1.DataValueField = "id_est_e_env";
                    DropDownList1.DataBind();
                    DropDownList1.Items.Insert(0, new ListItem("SELECCIONAR", "0"));
                    DropDownList1.SelectedValue = int_estatusID.ToString();
                }
            }
        }

        protected void chk_e_env_CheckedChanged(object sender, EventArgs e)
        {
            string str_rub;
            Guid guid_rub;

            foreach (GridViewRow row in gv_e_env.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chk_e_env") as CheckBox);
                    if (chkRow.Checked)
                    {
                        row.BackColor = Color.FromArgb(227, 76, 14);
                        str_rub = row.Cells[1].Text;

                        using (lab_liecEntities edm_rub = new lab_liecEntities())
                        {
                            var i_rub = (from c in edm_rub.inf_email_envio
                                         where c.email == str_rub
                                         select c).FirstOrDefault();

                            guid_rub = i_rub.id_email_env;

                            var f_rub = (from r in edm_rub.inf_email_envio
                                         where r.id_email_env == guid_rub
                                         select new
                                         {
                                             r.email,
                                             r.usuario,
                                             r.asunto,
                                             r.servidor_smtp,
                                             r.puerto

                                         }).FirstOrDefault();

                            txt_correo_envio.Text = f_rub.email;
                            txt_usuario_envio.Text = f_rub.usuario;
                            
                            txt_asunto_envio.Text = f_rub.asunto;
                            txt_servidor_smtp.Text = f_rub.servidor_smtp;
                            txt_puerto_envio.Text = f_rub.puerto.ToString();
                        }
                    }
                    else
                    {
                        row.BackColor = Color.White;
                    }
                }
            }
        }

        protected void chkb_des_e_env_CheckedChanged(object sender, EventArgs e)
        {
            int_e_env = 0;

            rfv_buscar_e_env.Enabled = false;
            rfv_correo_envio.Enabled = false;
            rfv_asunto_envio.Enabled = false;
            rfv_usuario_envio.Enabled = false;
            rfv_servidor_smtp.Enabled = false;
            rfv_clave_envio.Enabled = false;
            rfv_puerto_envio.Enabled = false;
        }

        protected void btn_guardar_envio_Click(object sender, EventArgs e)
        {
            if (int_e_env == 0)
            {
                Mensaje("Favor de seleccionar una acción");
            }
            else
            {
                Guid guid_ncorreoenvio = Guid.NewGuid();
                string str_correoenvio = txt_correo_envio.Text;
                string str_usuarioenvio = txt_usuario_envio.Text;
                string str_claveenvio = encrypta.Encrypt(txt_clave_envio.Text);
                string str_asunto = txt_asunto_envio.Text;
                string str_svrsmtp = txt_servidor_smtp.Text;
                int str_puertoenvio = int.Parse(txt_puerto_envio.Text);

                Guid guid_fcorreoenvio;

                if (int_e_env == 1)
                {
                    using (lab_liecEntities data_user = new lab_liecEntities())
                    {
                        var items_user = (from c in data_user.inf_email_envio
                                          where c.email == str_correoenvio
                                          select c).ToList();

                        if (items_user.Count == 0)
                        {

                            var i_usuario = new inf_email_envio
                            {
                                id_email_env = guid_ncorreoenvio,
                                id_est_e_env = 1,
                                email = str_correoenvio,
                                usuario = str_usuarioenvio,
                                clave = str_claveenvio,
                                asunto = str_asunto,
                                servidor_smtp = str_svrsmtp,
                                puerto = str_puertoenvio,
                                fecha_registro = DateTime.Now,
                                id_emp = guid_emp
                            };

                            data_user.inf_email_envio.Add(i_usuario);
                            data_user.SaveChanges();




                            limpia_e_env();
                            Mensaje("Datos agregados con éxito");
                        }
                        else
                        {
                            Mensaje("Correo ya existe en la base de datos, favor de reintentar o editar información");
                        }
                    }
                }
                else if (int_e_env == 2)
                {
                    using (var m_fusuarioff = new lab_liecEntities())
                    {
                        var i_fusuarioff = (from c in m_fusuarioff.inf_email_envio
                                            select c).FirstOrDefault();

                        guid_fcorreoenvio = i_fusuarioff.id_email_env;

                        var i_ff = (from c in m_fusuarioff.inf_email_envio
                                            where c.id_email_env == guid_fcorreoenvio
                                            select c).FirstOrDefault();

                        i_fusuarioff.email = str_correoenvio;
                        i_fusuarioff.usuario = str_usuarioenvio;
                        i_fusuarioff.clave = str_claveenvio;
                        i_fusuarioff.asunto = str_asunto;
                        i_fusuarioff.servidor_smtp = str_svrsmtp;
                        i_fusuarioff.puerto = str_puertoenvio;

                        m_fusuarioff.SaveChanges();
                    }

          
                    Mensaje("Datos actualizados con éxito");
                }
    
            }
        }
        private void limpia_e_env()
        {
            txt_correo_envio.Text = null;
            txt_usuario_envio.Text = null;
            txt_clave_envio.Text = null;
            txt_asunto_envio.Text = null;
            txt_servidor_smtp.Text = null;
            txt_puerto_envio.Text = null;
        }
        #endregion

    }
}