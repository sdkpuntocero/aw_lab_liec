using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace aw_lab_liec
{
    //public partial class panel_cliente : System.Web.UI.Page
    //{
    //    public static int int_clte, int_clte_obras, int_pnlID, int_clte_fisc;
    //    public static string str_clte, str_usr_oper;

    //    protected void Page_Load(object sender, EventArgs e)
    //    {
    //        try
    //        {
    //            if (!IsPostBack)
    //            {
    //                load_ddl();
    //                inf_usr_oper();
    //            }
    //            else
    //            {
    //            }
    //        }
    //        catch
    //        {
    //            Response.Redirect("acceso.aspx");
    //        }
    //    }

    //    private void inf_usr_oper()
    //    {
    //        str_usr_oper = (string)(Session["s_usuario"]);
    //        lbl_usr_oper.Text = str_usr_oper;
    //        lbl_tusr.Text = "Gerente General";
    //        lbl_emp_oper.Text = "LIEC";
    //    }

    //    [ScriptMethod()]
    //    [WebMethod]
    //    public static List<string> SearchCustomers(string prefixText, int count)
    //    {
    //        List<String> columnData = new List<String>();
    //        string str_fclte = prefixText.ToUpper();

    //        if (int_pnlID == 1)
    //        {
    //            using (SqlConnection connection = new SqlConnection(cn.cn_SQL))
    //            {
    //                connection.Open();
    //                string query = "SELECT razon_social FROM [lab_liec].[dbo].[inf_clte]  WHERE razon_social like '" + str_fclte + "%' ";
    //                using (SqlCommand command = new SqlCommand(query, connection))
    //                {
    //                    using (SqlDataReader reader = command.ExecuteReader())
    //                    {
    //                        while (reader.Read())
    //                        {
    //                            columnData.Add(reader.GetString(0));
    //                        }
    //                    }
    //                }
    //            }
    //        }
    //        else if (int_pnlID == 2)
    //        {
    //            using (SqlConnection connection = new SqlConnection(cn.cn_SQL))
    //            {
    //                connection.Open();
    //                string query = "SELECT razon_social,cod_clte FROM [lab_liec].[dbo].[inf_clte] WHERE razon_social like '" + str_fclte + "%' ";
    //                using (SqlCommand command = new SqlCommand(query, connection))
    //                {
    //                    using (SqlDataReader reader = command.ExecuteReader())
    //                    {
    //                        while (reader.Read())
    //                        {
    //                            columnData.Add(reader.GetString(0) + " | " + reader.GetString(1).ToUpper());
    //                        }
    //                    }
    //                }
    //            }
    //        }

    //        return columnData;
    //    }

    //    private void load_ddl()
    //    {
    //        ddl_colonia_clte.Items.Insert(0, new ListItem("SELECCIONAR", "0"));
    //        ddl_colonia_clte.BackColor = Color.FromArgb(211, 211, 211);
    //        ddl_colonia_clte.ForeColor = Color.FromArgb(16, 77, 141);
    //    }

    //    #region menu

    //    protected void lkb_clte_Click(object sender, EventArgs e)
    //    {
    //        int_pnlID = 1;

    //        i_clte.Attributes["style"] = "color:#104D8d";
    //        lbl_clte.Attributes["style"] = "color:#104D8d";

    //        i_clte_obras.Attributes["style"] = "color:#E34C0E";
    //        lbl_clte_obras.Attributes["style"] = "color:#E34C0E";

    //        i_clte_fisc.Attributes["style"] = "color:#E34C0E";
    //        lbl_clte_fisc.Attributes["style"] = "color:#E34C0E";

    //        pnl_clte.Visible = true;
    //        up_clte.Update();
    //        pnl_clte_obras.Visible = false;
    //        up_clte_obras.Update();
          
    //        pnl_rppc.Visible = false;
    //        up_rppc.Update();
    //    }

    //    protected void lkb_clte_obras_Click(object sender, EventArgs e)
    //    {
    //        int_pnlID = 2;

    //        i_clte.Attributes["style"] = "color:#E34C0E";
    //        lbl_clte.Attributes["style"] = "color:#E34C0E";

    //        i_clte_obras.Attributes["style"] = "color:#104D8d";
    //        lbl_clte_obras.Attributes["style"] = "color:#104D8d";

    //        i_clte_fisc.Attributes["style"] = "color:#E34C0E";
    //        lbl_clte_fisc.Attributes["style"] = "color:#E34C0E";

    //        limp_txt_clte_obras();
    //        rfv_buscar_clte_obras.Enabled = true;

    //        pnl_clte.Visible = false;
    //        up_clte.Update();
    //        pnl_clte_obras.Visible = true;
    //        up_clte_obras.Update();
       
    //        pnl_rppc.Visible = false;
    //        up_rppc.Update();
    //    }

        

    //    protected void lkb_concreto_Click(object sender, EventArgs e)
    //    {
    //        pnl_clte.Visible = false;
    //        up_clte.Update();
    //        pnl_clte_obras.Visible = false;
    //        up_clte_obras.Update();
        
    //        pnl_rppc.Visible = true;
    //        up_rppc.Update();
    //    }

    //    protected void lkb_salir_Click(object sender, EventArgs e)
    //    {
    //        Response.Redirect("acceso.aspx");
    //    }

    //    #endregion menu

    //    #region clte

    //    protected void btn_agregar_clte_Click(object sender, EventArgs e)
    //    {
    //        int_clte = 1;

    //        i_agregar_clte.Attributes["style"] = "color:#E34C0E";
    //        i_editar_clte.Attributes["style"] = "color:white";

    //        rfv_rs.Enabled = true;
    //        rfv_callenum_clte.Enabled = true;
    //        rfv_cp_clte.Enabled = true;

    //        div_busc_clt.Visible = false;

    //        gv_clte.Visible = false;

    //        limp_txt_clte();
    //    }

    //    protected void btn_editar_clte_Click(object sender, EventArgs e)
    //    {
    //        int_clte = 2;
    //        txt_buscar_clte.Text = null;
    //        i_agregar_clte.Attributes["style"] = "color:white";
    //        i_editar_clte.Attributes["style"] = "color:#E34C0E";

    //        rfv_rs.Enabled = false;
    //        rfv_callenum_clte.Enabled = false;
    //        rfv_cp_clte.Enabled = false;
    //        rfv_colonia_clte.Enabled = false;

    //        div_busc_clt.Visible = true;

    //        rfv_buscar_clte.Enabled = true;

    //        limp_txt_clte();
    //    }

    //    private void limp_txt_clte()
    //    {
    //        ddl_colonia_clte.Items.Clear();
    //        ddl_colonia_clte.Items.Insert(0, new ListItem("SELECCIONAR", "0"));

    //        txt_rs.Text = null;
    //        txt_telefono_clte.Text = null;
    //        txt_email_clte.Text = null;
    //        txt_callenum_clte.Text = null;
    //        txt_cp_clte.Text = null;

    //        txt_municipio_clte.Text = null;
    //        txt_estado_clte.Text = null;
    //    }

    //    private void guarda_clte()
    //    {
    //        try
    //        {
    //            Guid guid_clte = Guid.NewGuid();
    //            Guid guid_emp = Guid.Parse("d8a03556-6791-45f3-babe-ecf267b865f1");
    //            string str_cod_clte, str_nom_clte;
    //            string str_razon_social = txt_rs.Text.ToUpper().Trim();
    //            string str_telefono = txt_telefono_clte.Text;
    //            string str_email = txt_email_clte.Text.Trim();
    //            string str_callenum = txt_callenum_clte.Text.ToUpper().Trim();
    //            string str_cp = txt_cp_clte.Text;
    //            string str_coment;
    //            int int_colony = Convert.ToInt32(ddl_colonia_clte.SelectedValue);
    //            int int_idcodigocp = 0;

    //            using (lab_liecEntities db_sepomex = new lab_liecEntities())
    //            {
    //                var tbl_sepomex = (from c in db_sepomex.inf_sepomex
    //                                   where c.d_codigo == str_cp
    //                                   where c.id_asenta_cpcons == int_colony
    //                                   select c).ToList();

    //                int_idcodigocp = tbl_sepomex[0].id_codigo;
    //            }

    //            if (int_clte == 1)
    //            {
    //                using (lab_liecEntities edm_nclte = new lab_liecEntities())
    //                {
    //                    var i_nclte = (from c in edm_nclte.inf_clte
    //                                   where c.razon_social.Contains(str_razon_social)
    //                                   select c).ToList();

    //                    if (i_nclte.Count == 0)
    //                    {
    //                        using (lab_liecEntities edm_fclte = new lab_liecEntities())
    //                        {
    //                            var i_fclte = (from c in edm_fclte.inf_clte
    //                                           select c).ToList();

    //                            if (i_fclte.Count == 0)
    //                            {
    //                                str_cod_clte = "LIEC-CLTE" + string.Format("{0:000}", (object)(i_nclte.Count + 1));

    //                                using (var m_clte = new lab_liecEntities())
    //                                {
    //                                    var i_clte = new inf_clte

    //                                    {
    //                                        id_clte = guid_clte,
    //                                        id_estatus_clte = 1,
    //                                        cod_clte = str_cod_clte,
    //                                        razon_social = str_razon_social,
    //                                        telefono = str_telefono,
    //                                        email = str_email,
    //                                        callenum = str_callenum,
    //                                        id_codigo = int_idcodigocp,
    //                                        fecha_registro = DateTime.Now,
    //                                        id_emp = guid_emp
    //                                    };

    //                                    m_clte.inf_clte.Add(i_clte);
    //                                    m_clte.SaveChanges();
    //                                }

    //                                Mensaje("Datos de cliente agregados con éxito.");
    //                            }
    //                            else
    //                            {
    //                                str_cod_clte = "LIEC-CLTE" + string.Format("{0:000}", (object)(i_fclte.Count + 1));

    //                                using (var m_clte = new lab_liecEntities())
    //                                {
    //                                    var i_clte = new inf_clte

    //                                    {
    //                                        id_clte = guid_clte,
    //                                        id_estatus_clte = 1,
    //                                        cod_clte = str_cod_clte,
    //                                        razon_social = str_razon_social,
    //                                        telefono = str_telefono,
    //                                        email = str_email,
    //                                        callenum = str_callenum,
    //                                        id_codigo = int_idcodigocp,
    //                                        fecha_registro = DateTime.Now,
    //                                        id_emp = guid_emp
    //                                    };

    //                                    m_clte.inf_clte.Add(i_clte);
    //                                    m_clte.SaveChanges();
    //                                }

    //                                Mensaje("Datos de cliente agregados con éxito.");
    //                            }
    //                        }
    //                    }
    //                    else
    //                    {
    //                        limp_txt_clte();
    //                        rfv_rs.Enabled = false;
    //                        rfv_callenum_clte.Enabled = false;
    //                        rfv_cp_clte.Enabled = false;
    //                        rfv_colonia_clte.Enabled = false;
    //                        Mensaje("Cliente existe en la base de datos, favor de revisar.");
    //                    }
    //                }
    //            }
    //            else if (int_clte == 2)
    //            {
    //                int int_ddl, int_f_clte = 0;
    //                int int_estatusID = 0;
    //                string str_fclte = null;
    //                foreach (GridViewRow row in gv_clte.Rows)
    //                {
    //                    // int key = (int)GridView1.DataKeys[row.RowIndex].Value;
    //                    if (row.RowType == DataControlRowType.DataRow)
    //                    {
    //                        CheckBox chkRow = (row.Cells[0].FindControl("chk_clte") as CheckBox);
    //                        if (chkRow.Checked)
    //                        {
    //                            int_f_clte = int_f_clte + 1;
    //                            str_fclte = row.Cells[1].Text;
    //                            str_nom_clte = row.Cells[2].Text;
    //                            DropDownList dl = (DropDownList)row.FindControl("ddl_clte_estatus");

    //                            int_ddl = int.Parse(dl.SelectedValue);
    //                            if (int_ddl == 1)
    //                            {
    //                                int_estatusID = 1;
    //                                break;
    //                            }
    //                            else if (int_ddl == 2)
    //                            {
    //                                int_estatusID = 2;
    //                                break;
    //                            }
    //                            break;
    //                        }
    //                    }
    //                }
    //                str_coment = txt_clte_coment.Text;

    //                string str_clte = txt_buscar_clte.Text.ToUpper().Trim();

    //                using (var m_clte = new lab_liecEntities())
    //                {
    //                    var i_clte = (from c in m_clte.inf_clte
    //                                  where c.cod_clte == str_clte
    //                                  select c).FirstOrDefault();

    //                    i_clte.id_estatus_clte = int_estatusID;
    //                    i_clte.razon_social = str_razon_social;
    //                    i_clte.telefono = str_telefono;
    //                    i_clte.email = str_email;
    //                    i_clte.callenum = str_callenum;
    //                    i_clte.id_codigo = int_idcodigocp;
    //                    i_clte.comentarios = str_coment;

    //                    m_clte.SaveChanges();
    //                }

    //                rfv_rs.Enabled = false;
    //                rfv_callenum_clte.Enabled = false;
    //                rfv_cp_clte.Enabled = false;
    //                rfv_colonia_clte.Enabled = false;
    //                Mensaje("Datos de cliente actualizados con éxito.");
    //            }
    //        }
    //        catch
    //        { }
    //    }

    //    protected void btn_cp_clte_Click(object sender, EventArgs e)
    //    {
    //        string str_cp = txt_cp_clte.Text;

    //        datos_sepomex(str_cp);

    //        ddl_colonia_clte.Focus();
    //    }

    //    private void datos_sepomex(string str_codigo)
    //    {
    //        using (lab_liecEntities db_sepomex = new lab_liecEntities())
    //        {
    //            var tbl_sepomex = (from c in db_sepomex.inf_sepomex
    //                               where c.d_codigo == str_codigo
    //                               select c).ToList();

    //            ddl_colonia_clte.DataSource = tbl_sepomex;
    //            ddl_colonia_clte.DataTextField = "d_asenta";
    //            ddl_colonia_clte.DataValueField = "id_asenta_cpcons";
    //            ddl_colonia_clte.DataBind();

    //            if (tbl_sepomex.Count == 1)
    //            {
    //                txt_municipio_clte.Text = tbl_sepomex[0].d_mnpio;
    //                txt_estado_clte.Text = tbl_sepomex[0].d_estado;
    //                rfv_colonia_clte.Enabled = true;
    //            }
    //            if (tbl_sepomex.Count > 1)
    //            {
    //                ddl_colonia_clte.Items.Insert(0, new ListItem("SELECCIONAR", "0"));

    //                txt_municipio_clte.Text = tbl_sepomex[0].d_mnpio;
    //                txt_estado_clte.Text = tbl_sepomex[0].d_estado;
    //                rfv_colonia_clte.Enabled = true;
    //            }
    //            else if (tbl_sepomex.Count == 0)
    //            {
    //                ddl_colonia_clte.Items.Clear();
    //                ddl_colonia_clte.Items.Insert(0, new ListItem("SELECCIONAR", "0"));
    //                txt_municipio_clte.Text = null;
    //                txt_estado_clte.Text = null;
    //                rfv_colonia_clte.Enabled = false;
    //            }
    //        }
    //        up_clte.Update();
    //    }

    //    protected void btn_guardar_clte_Click(object sender, EventArgs e)
    //    {
    //        if (int_clte == 0)
    //        {
    //            Mensaje("Favor de seleccionar una acción");
    //        }
    //        else
    //        {
    //            guarda_clte();
    //        }
    //    }

    //    protected void chkb_desactivar_clte_CheckedChanged(object sender, EventArgs e)
    //    {
    //        if (chkb_desactivar_clte.Checked)
    //        {
    //            int_clte = 0;
    //            i_agregar_clte.Attributes["style"] = "color:white";
    //            i_editar_clte.Attributes["style"] = "color:white";

    //            rfv_buscar_clte.Enabled = false;

    //            rfv_rs.Enabled = false;
    //            rfv_callenum_clte.Enabled = false;
    //            rfv_cp_clte.Enabled = false;
    //            rfv_colonia_clte.Enabled = false;

    //            rfv_clte_coment.Enabled = false;
    //        }
    //    }

    //    protected void btn_buscar_clte_Click(object sender, EventArgs e)
    //    {
    //        string str_clte = txt_buscar_clte.Text.ToUpper().Trim();

    //        if (str_clte == "TODOS")
    //        {
    //            using (lab_liecEntities data_clte = new lab_liecEntities())
    //            {
    //                var i_clte = (from t_clte in data_clte.inf_clte
    //                              join t_est in data_clte.fact_estatus on t_clte.id_estatus_clte equals t_est.id_estatus

    //                              select new
    //                              {
    //                                  t_clte.cod_clte,
    //                                  t_est.desc_estatus,
    //                                  t_clte.razon_social,
    //                                  t_clte.fecha_registro
    //                              }).OrderBy(x => x.cod_clte).ToList();

    //                gv_clte.DataSource = i_clte;
    //                gv_clte.DataBind();
    //                gv_clte.Visible = true;
    //            }
    //        }
    //        else
    //        {
    //            using (lab_liecEntities data_clte = new lab_liecEntities())
    //            {
    //                var i_clte = (from t_clte in data_clte.inf_clte
    //                              where t_clte.razon_social == str_clte
    //                              select new
    //                              {
    //                                  t_clte.cod_clte,
    //                                  t_clte.id_estatus_clte,
    //                                  t_clte.razon_social,
    //                                  t_clte.fecha_registro
    //                              }).ToList();

    //                gv_clte.DataSource = i_clte;
    //                gv_clte.DataBind();
    //                gv_clte.Visible = true;
    //            }
    //        }

    //        limp_txt_clte();
    //    }

    //    protected void chk_clte_CheckedChanged(object sender, EventArgs e)
    //    {
    //        Guid guid_clte;

    //        foreach (GridViewRow row in gv_clte.Rows)
    //        {
    //            if (row.RowType == DataControlRowType.DataRow)
    //            {
    //                CheckBox chkRow = (row.Cells[0].FindControl("chk_clte") as CheckBox);
    //                if (chkRow.Checked)
    //                {
    //                    row.BackColor = Color.FromArgb(227, 76, 14);
    //                    str_clte = row.Cells[1].Text;

    //                    using (lab_liecEntities edm_clte = new lab_liecEntities())
    //                    {
    //                        var i_clte = (from c in edm_clte.inf_clte
    //                                      where c.cod_clte == str_clte
    //                                      select c).FirstOrDefault();

    //                        guid_clte = i_clte.id_clte;
    //                    }

    //                    using (lab_liecEntities edm_clte = new lab_liecEntities())
    //                    {
    //                        var i_clte = (from t_clte in edm_clte.inf_clte
    //                                      where t_clte.id_clte == guid_clte
    //                                      select new
    //                                      {
    //                                          t_clte.razon_social,
    //                                          t_clte.telefono,
    //                                          t_clte.email,
    //                                          t_clte.callenum,
    //                                          t_clte.id_codigo,
    //                                          t_clte.comentarios
    //                                      }).FirstOrDefault();

    //                        txt_rs.Text = i_clte.razon_social;
    //                        txt_telefono_clte.Text = i_clte.telefono;
    //                        txt_email_clte.Text = i_clte.email;
    //                        txt_callenum_clte.Text = i_clte.callenum;
    //                        txt_clte_coment.Text = i_clte.comentarios;

    //                        try
    //                        {
    //                            int int_codigo = int.Parse(i_clte.id_codigo.ToString());

    //                            using (lab_liecEntities db_sepomex = new lab_liecEntities())
    //                            {
    //                                var tbl_sepomex = (from c in db_sepomex.inf_sepomex
    //                                                   where c.id_codigo == int_codigo
    //                                                   select c).ToList();

    //                                ddl_colonia_clte.DataSource = tbl_sepomex;
    //                                ddl_colonia_clte.DataTextField = "d_asenta";
    //                                ddl_colonia_clte.DataValueField = "id_asenta_cpcons";
    //                                ddl_colonia_clte.DataBind();

    //                                txt_cp_clte.Text = tbl_sepomex[0].d_codigo;

    //                                txt_municipio_clte.Text = tbl_sepomex[0].d_mnpio;
    //                                txt_estado_clte.Text = tbl_sepomex[0].d_estado;
    //                            }
    //                        }
    //                        catch
    //                        { }
    //                        rfv_rs.Enabled = true;
    //                        rfv_callenum_clte.Enabled = true;
    //                        rfv_cp_clte.Enabled = true;
    //                    }
    //                }
    //                else
    //                {
    //                    row.BackColor = Color.White;
    //                }
    //            }
    //        }
    //    }

    //    protected void gv_clte_PageIndexChanging(object sender, GridViewPageEventArgs e)
    //    {
    //        gv_clte.PageIndex = e.NewPageIndex;

    //        string str_clte = txt_buscar_clte.Text.ToUpper().Trim();

    //        if (str_clte == "TODOS")
    //        {
    //            using (lab_liecEntities data_clte = new lab_liecEntities())
    //            {
    //                var i_clte = (from t_clte in data_clte.inf_clte
    //                              join t_est in data_clte.fact_estatus on t_clte.id_estatus_clte equals t_est.id_estatus

    //                              select new
    //                              {
    //                                  t_clte.cod_clte,
    //                                  t_est.desc_estatus,
    //                                  t_clte.razon_social,
    //                                  t_clte.fecha_registro
    //                              }).OrderBy(x => x.cod_clte).ToList();

    //                gv_clte.DataSource = i_clte;
    //                gv_clte.DataBind();
    //                gv_clte.Visible = true;
    //            }
    //        }
    //        else
    //        {
    //            using (lab_liecEntities data_clte = new lab_liecEntities())
    //            {
    //                var i_clte = (from t_clte in data_clte.inf_clte
    //                              join t_est in data_clte.fact_estatus on t_clte.id_estatus_clte equals t_est.id_estatus
    //                              where str_clte.Contains(t_clte.razon_social)
    //                              select new
    //                              {
    //                                  t_clte.cod_clte,
    //                                  t_est.desc_estatus,
    //                                  t_clte.razon_social,
    //                                  t_clte.fecha_registro
    //                              }).ToList();

    //                gv_clte.DataSource = i_clte;
    //                gv_clte.DataBind();
    //                gv_clte.Visible = true;
    //            }
    //        }
    //    }

    //    protected void ddl_clte_estatus_SelectedIndexChanged(object sender, EventArgs e)
    //    {
    //        string str_ddl;

    //        GridViewRow gvr = (GridViewRow)(((Control)sender).NamingContainer);
    //        DropDownList duty = (DropDownList)gvr.FindControl("ddl_clte_estatus");
    //        str_ddl = duty.SelectedItem.Value;

    //        if (str_ddl == "2")
    //        {
    //            txt_clte_coment.Enabled = true;
    //            rfv_clte_coment.Enabled = true;
    //        }
    //        else
    //        {
    //            txt_clte_coment.Enabled = false;
    //            rfv_clte_coment.Enabled = false;
    //        }
    //    }

    //    protected void gv_clte_RowDataBound(object sender, GridViewRowEventArgs e)
    //    {
    //        if (e.Row.RowType == DataControlRowType.DataRow)
    //        {
    //            string str_clteID = e.Row.Cells[1].Text;
    //            int int_estatusID;

    //            using (lab_liecEntities data_clte = new lab_liecEntities())
    //            {
    //                var i_clte = (from t_clte in data_clte.inf_clte
    //                              where t_clte.cod_clte == str_clteID
    //                              select new
    //                              {
    //                                  t_clte.id_estatus_clte,
    //                              }).FirstOrDefault();

    //                int_estatusID = int.Parse(i_clte.id_estatus_clte.ToString());
    //            }

    //            DropDownList DropDownList1 = (e.Row.FindControl("ddl_clte_estatus") as DropDownList);

    //            using (lab_liecEntities db_sepomex = new lab_liecEntities())
    //            {
    //                var tbl_sepomex = (from c in db_sepomex.fact_estatus_clte
    //                                   select c).ToList();

    //                DropDownList1.DataSource = tbl_sepomex;

    //                DropDownList1.DataTextField = "desc_estatus_clte";
    //                DropDownList1.DataValueField = "id_estatus_clte";
    //                DropDownList1.DataBind();
    //                DropDownList1.Items.Insert(0, new ListItem("SELECCIONAR", "0"));
    //                DropDownList1.SelectedValue = int_estatusID.ToString();
    //            }
    //        }
    //    }

    //    #endregion clte

    //    #region funciones

    //    private string RemoveSpecialCharacters(string str)
    //    {
    //        return Regex.Replace(str, @"[^0-9A-Za-z]", "", RegexOptions.None);
    //    }

    //    public static string RemoveAccentsWithRegEx(string inputString)
    //    {
    //        Regex replace_a_Accents = new Regex("[á|à|ä|â]", RegexOptions.Compiled);
    //        Regex replace_e_Accents = new Regex("[é|è|ë|ê]", RegexOptions.Compiled);
    //        Regex replace_i_Accents = new Regex("[í|ì|ï|î]", RegexOptions.Compiled);
    //        Regex replace_o_Accents = new Regex("[ó|ò|ö|ô]", RegexOptions.Compiled);
    //        Regex replace_u_Accents = new Regex("[ú|ù|ü|û]", RegexOptions.Compiled);
    //        inputString = replace_a_Accents.Replace(inputString, "a");
    //        inputString = replace_e_Accents.Replace(inputString, "e");
    //        inputString = replace_i_Accents.Replace(inputString, "i");
    //        inputString = replace_o_Accents.Replace(inputString, "o");
    //        inputString = replace_u_Accents.Replace(inputString, "u");
    //        return inputString;
    //    }

    //    private void genera_usuario()
    //    {
    //        //try
    //        //{
    //        //    string str_nombres = RemoveSpecialCharacters(RemoveAccentsWithRegEx(txt_nombres_admin.Text.ToLower()));
    //        //    string[] separados;

    //        //    separados = str_nombres.Split(" ".ToCharArray());

    //        //    string str_apaterno = RemoveSpecialCharacters(RemoveAccentsWithRegEx(txt_apaterno_admin.Text.ToLower()));
    //        //    string str_amaterno = RemoveSpecialCharacters(RemoveAccentsWithRegEx(txt_amaterno_admin.Text.ToLower()));

    //        //    string codigo_usuario = str_nombres + "_" + left_right_mid.left(str_apaterno, 2) + left_right_mid.left(str_amaterno, 2);
    //        //    txt_usuario_admin.Text = codigo_usuario;
    //        //}
    //        //catch
    //        //{
    //        //    Mensaje("Se requiere minimo 2 letras por cada campo(nombre,apellido paterno, apellido materno) para generar el usuario.");
    //        //}
    //    }

    //    private void Mensaje(string contenido)
    //    {
    //        lblModalTitle.Text = "LIEC";
    //        lblModalBody.Text = contenido;
    //        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
    //        upModal.Update();
    //    }

    //    #endregion funciones

    //    #region clte_obras

    //    protected void btn_buscar_clte_obras_Click(object sender, EventArgs e)
    //    {
    //        string str_clte = txt_buscar_clte.Text.ToUpper().Trim();

    //        using (lab_liecEntities data_clte = new lab_liecEntities())
    //        {
    //            var i_clte = (from t_clte in data_clte.inf_clte
    //                          join t_est in data_clte.fact_estatus on t_clte.id_estatus_clte equals t_est.id_estatus
    //                          where t_clte.razon_social == str_clte
    //                          select new
    //                          {
    //                              t_clte.cod_clte,
    //                              t_est.desc_estatus,
    //                              t_clte.razon_social,
    //                              t_clte.fecha_registro
    //                          }).ToList();

    //            gv_clte.DataSource = i_clte;
    //            gv_clte.DataBind();
    //            gv_clte.Visible = true;
    //        }
    //    }

    //    protected void btn_agregar_clte_obras_Click(object sender, EventArgs e)
    //    {
    //        int_clte_obras = 1;

    //        i_agregar_clte_obras.Attributes["style"] = "color:#E34C0E";
    //        i_editar_clte_obras.Attributes["style"] = "color:white";

    //        rfv_clte_clave_obra.Enabled = true;
    //        rfv_clte_desc_obra.Enabled = true;
    //        rfv_clte_tservicio.Enabled = true;
    //        rfv_clte_coordinador.Enabled = true;
    //        rfv_clte_contobra.Enabled = true;

    //        limp_txt_clte_obras();
    //    }

    //    private void limp_txt_clte_obras()
    //    {
    //        //ddl_clte_tservicio.Items.Clear();
    //        //using (lab_liecEntities db_sepomex = new lab_liecEntities())
    //        //{
    //        //    var tbl_sepomex = (from c in db_sepomex.fact_tipo_servicio

    //        //                       select c).ToList();

    //        //    ddl_clte_tservicio.DataSource = tbl_sepomex;
    //        //    ddl_clte_tservicio.DataTextField = "desc_tipo_servicio";
    //        //    ddl_clte_tservicio.DataValueField = "id_tipo_servicio";
    //        //    ddl_clte_tservicio.DataBind();
    //        //}
    //        //ddl_clte_tservicio.Items.Insert(0, new ListItem("SELECCIONAR", "0"));

    //        txt_clte_clave_obra.Text = null;
    //        txt_clte_desc_obra.Text = null;
    //        txt_clte_coordinador.Text = null;
    //        txt_clte_contobra.Text = null;
    //    }

    //    protected void btn_guardar_clte_obras_Click(object sender, EventArgs e)
    //    {
    //        if (int_clte_obras == 0)
    //        {
    //            Mensaje("Favor de SELECCIONAR una acción");
    //        }
    //        else
    //        {
    //            string str_clteobra, str_claveobra, str_descobra, str_coordinador, str_contobra, str_coment;
    //            int int_tservicio;
    //            Guid guid_fclte;
    //            Char char_s = '|';
    //            int startIndex = txt_buscar_clte_obras.Text.Trim().IndexOf(char_s);
    //            int endIndex = txt_buscar_clte_obras.Text.Trim().Length;
    //            int length = endIndex - startIndex;
    //            str_clteobra = txt_buscar_clte_obras.Text.Substring(startIndex, length).Replace("|", "").Trim();
    //            str_claveobra = txt_clte_clave_obra.Text.Trim().ToUpper();
    //            str_descobra = txt_clte_desc_obra.Text.Trim().ToUpper();
    //            int_tservicio = int.Parse(ddl_clte_tservicio.SelectedValue);
    //            str_coordinador = txt_clte_coordinador.Text.Trim().ToUpper();
    //            str_contobra = txt_clte_contobra.Text.Trim().ToUpper();
    //            str_coment = txt_coment_obras.Text.Trim().ToUpper();
    //            using (lab_liecEntities edm_nclte = new lab_liecEntities())
    //            {
    //                var i_nclte = (from c in edm_nclte.inf_clte
    //                               where c.cod_clte == str_clteobra
    //                               select c).FirstOrDefault();

    //                guid_fclte = i_nclte.id_clte;
    //            }

    //            using (lab_liecEntities edm_nclte = new lab_liecEntities())
    //            {
    //                var i_nclte = (from c in edm_nclte.inf_clte_obras
    //                               where c.clave_obra == str_claveobra
    //                               select c).ToList();

    //                if (i_nclte.Count == 0)
    //                {
    //                    using (var m_clte = new lab_liecEntities())
    //                    {
    //                        var i_clte = new inf_clte_obras

    //                        {
    //                            id_estatus_obra = 1,
    //                            clave_obra = str_claveobra,
    //                            desc_obra = str_descobra,
    //                            coordinador = str_coordinador,
    //                            contacto_obra = str_contobra,
    //                            id_tipo_servicio = int_tservicio,
    //                            fecha_registro = DateTime.Now,
    //                            id_clte = guid_fclte
    //                        };

    //                        m_clte.inf_clte_obras.Add(i_clte);
    //                        m_clte.SaveChanges();
    //                    }

    //                    limp_txt_clte_obras();

    //                    rfv_clte_clave_obra.Enabled = false;
    //                    rfv_clte_desc_obra.Enabled = false;
    //                    rfv_clte_tservicio.Enabled = false;
    //                    rfv_clte_coordinador.Enabled = false;
    //                    rfv_clte_contobra.Enabled = false;
    //                    Mensaje("Datos de cliente-obra agregados con éxito.");
    //                }
    //                else
    //                {
    //                    if (int_clte_obras == 2)
    //                    {
    //                        int int_ddl;
    //                        int int_estatusID = 0;
    //                        foreach (GridViewRow row in gv_clte_obras.Rows)
    //                        {
    //                            // int key = (int)GridView1.DataKeys[row.RowIndex].Value;
    //                            if (row.RowType == DataControlRowType.DataRow)
    //                            {
    //                                DropDownList dl = (DropDownList)row.FindControl("ddl_clteobra_estatus");

    //                                int_ddl = int.Parse(dl.SelectedValue);
    //                                if (int_ddl == 1)
    //                                {
    //                                    int_estatusID = 1;
    //                                }
    //                                else if (int_ddl == 2)
    //                                {
    //                                    int_estatusID = 2;
    //                                }
    //                            }
    //                        }
    //                        str_coment = txt_clte_coment.Text;

    //                        using (var m_clte = new lab_liecEntities())
    //                        {
    //                            var i_clte = (from c in m_clte.inf_clte_obras
    //                                          where c.clave_obra == str_claveobra
    //                                          select c).FirstOrDefault();

    //                            i_clte.id_estatus_obra = int_estatusID;
    //                            i_clte.desc_obra = str_descobra;
    //                            i_clte.coordinador = str_coordinador;
    //                            i_clte.contacto_obra = str_contobra;
    //                            i_clte.id_tipo_servicio = int_tservicio;
    //                            i_clte.comentarios = str_coment;

    //                            m_clte.SaveChanges();
    //                        }

    //                        rfv_clte_clave_obra.Enabled = false;
    //                        rfv_clte_desc_obra.Enabled = false;
    //                        rfv_clte_tservicio.Enabled = false;
    //                        rfv_clte_coordinador.Enabled = false;
    //                        rfv_clte_contobra.Enabled = false;
    //                        Mensaje("Datos de cliente-obra actualizados con éxito.");
    //                    }
    //                    else
    //                    {
    //                        limp_txt_clte();
    //                        rfv_rs.Enabled = false;
    //                        rfv_callenum_clte.Enabled = false;
    //                        rfv_cp_clte.Enabled = false;
    //                        rfv_colonia_clte.Enabled = false;
    //                        Mensaje("Obra existe en la base de datos, favor de revisar.");
    //                    }
    //                }
    //            }
    //        }
    //    }

    //    protected void gv_clte_obras_RowDataBound(object sender, GridViewRowEventArgs e)
    //    {
    //        if (e.Row.RowType == DataControlRowType.DataRow)
    //        {
    //            string str_clteobraID = e.Row.Cells[1].Text;
    //            int int_estatusID;

    //            using (lab_liecEntities data_clte = new lab_liecEntities())
    //            {
    //                var i_clte = (from t_clte in data_clte.inf_clte_obras
    //                              where t_clte.clave_obra == str_clteobraID
    //                              select new
    //                              {
    //                                  t_clte.id_estatus_obra,
    //                              }).FirstOrDefault();

    //                int_estatusID = int.Parse(i_clte.id_estatus_obra.ToString());
    //            }

    //            DropDownList DropDownList1 = (e.Row.FindControl("ddl_clteobra_estatus") as DropDownList);

    //            using (lab_liecEntities db_sepomex = new lab_liecEntities())
    //            {
    //                var tbl_sepomex = (from c in db_sepomex.fact_estatus_obra
    //                                   select c).ToList();

    //                DropDownList1.DataSource = tbl_sepomex;

    //                DropDownList1.DataTextField = "desc_estatus_obra";
    //                DropDownList1.DataValueField = "id_estatus_obra";
    //                DropDownList1.DataBind();
    //                DropDownList1.Items.Insert(0, new ListItem("SELECCIONAR", "0"));
    //                DropDownList1.SelectedValue = int_estatusID.ToString();
    //            }
    //        }
    //    }

    //    protected void chk_clte_obras_CheckedChanged(object sender, EventArgs e)
    //    {
    //        string str_clte_obra;
    //        int int_clteobra;

    //        foreach (GridViewRow row in gv_clte_obras.Rows)
    //        {
    //            if (row.RowType == DataControlRowType.DataRow)
    //            {
    //                CheckBox chkRow = (row.Cells[0].FindControl("chk_clte_obras") as CheckBox);
    //                if (chkRow.Checked)
    //                {
    //                    row.BackColor = Color.FromArgb(227, 76, 14);
    //                    str_clte_obra = row.Cells[1].Text;

    //                    using (lab_liecEntities edm_clte = new lab_liecEntities())
    //                    {
    //                        var i_clte = (from c in edm_clte.inf_clte_obras
    //                                      where c.clave_obra == str_clte_obra
    //                                      select c).FirstOrDefault();

    //                        int_clteobra = i_clte.id_clte_obras;
    //                    }

    //                    using (lab_liecEntities edm_clte = new lab_liecEntities())
    //                    {
    //                        var i_clte = (from t_clte in edm_clte.inf_clte_obras
    //                                      where t_clte.id_clte_obras == int_clteobra
    //                                      select new
    //                                      {
    //                                          t_clte.clave_obra,
    //                                          t_clte.desc_obra,
    //                                          t_clte.coordinador,
    //                                          t_clte.contacto_obra,
    //                                          t_clte.id_tipo_servicio,
    //                                          t_clte.id_estatus_obra
    //                                      }).FirstOrDefault();

    //                        txt_clte_clave_obra.Text = i_clte.clave_obra;
    //                        txt_clte_desc_obra.Text = i_clte.desc_obra;
    //                        txt_clte_coordinador.Text = i_clte.coordinador;
    //                        txt_clte_contobra.Text = i_clte.contacto_obra;
    //                        ddl_clte_tservicio.SelectedValue = i_clte.id_tipo_servicio.ToString();
    //                    }
    //                }
    //                else
    //                {
    //                    row.BackColor = Color.White;
    //                }
    //            }
    //        }
    //    }

    //    protected void ddl_clteobra_estatus_SelectedIndexChanged(object sender, EventArgs e)
    //    {
    //        string str_ddl;

    //        GridViewRow gvr = (GridViewRow)(((Control)sender).NamingContainer);
    //        DropDownList duty = (DropDownList)gvr.FindControl("ddl_clteobra_estatus");
    //        str_ddl = duty.SelectedItem.Value;

    //        if (str_ddl == "2")
    //        {
    //            txt_coment_obras.Enabled = true;
    //            rfv_coment_obras.Enabled = true;
    //        }
    //        else
    //        {
    //            txt_coment_obras.Enabled = false;
    //            rfv_coment_obras.Enabled = false;
    //        }
    //    }

    //    protected void chkb_desactivar_clte_obras_CheckedChanged(object sender, EventArgs e)
    //    {
    //        rfv_buscar_clte_obras.Enabled = false;
    //        rfv_clte_clave_obra.Enabled = false;
    //        rfv_clte_desc_obra.Enabled = false;
    //        rfv_clte_tservicio.Enabled = false;
    //        rfv_clte_coordinador.Enabled = false;
    //        rfv_clte_contobra.Enabled = false;
    //    }

    //    protected void btn_editar_clte_obras_Click(object sender, EventArgs e)
    //    {
    //        int_clte_obras = 2;

    //        i_agregar_clte_obras.Attributes["style"] = "color:white";
    //        i_editar_clte_obras.Attributes["style"] = "color:#E34C0E";

    //        Guid guid_cltef;
    //        string str_clteobra;

    //        Char char_s = '|';
    //        try
    //        {
    //            int startIndex = txt_buscar_clte_obras.Text.Trim().IndexOf(char_s);
    //            int endIndex = txt_buscar_clte_obras.Text.Trim().Length;
    //            int length = endIndex - startIndex;
    //            str_clteobra = txt_buscar_clte_obras.Text.Substring(startIndex, length).Replace("|", "").Trim();

    //            using (lab_liecEntities data_clte = new lab_liecEntities())
    //            {
    //                var i_clte = (from t_clte in data_clte.inf_clte
    //                              where t_clte.cod_clte == str_clteobra
    //                              select t_clte).FirstOrDefault();

    //                guid_cltef = i_clte.id_clte;
    //            }

    //            using (lab_liecEntities data_clte = new lab_liecEntities())
    //            {
    //                var i_clte = (from t_clte in data_clte.inf_clte_obras
    //                              where t_clte.id_clte == guid_cltef
    //                              select new
    //                              {
    //                                  t_clte.clave_obra,
    //                                  t_clte.desc_obra,
    //                                  t_clte.fecha_registro
    //                              }).ToList();

    //                gv_clte_obras.DataSource = i_clte;
    //                gv_clte_obras.DataBind();
    //                gv_clte_obras.Visible = true;
    //            }
    //        }
    //        catch
    //        {
    //            gv_clte_obras.Visible = false;
    //        }
    //    }

    //    #endregion clte_obras


    //}
}