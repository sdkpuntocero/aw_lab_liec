using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace aw_lab_liec
{
    public partial class panel_cont : System.Web.UI.Page
    {
        static private int acc_rubro, int_pnlID;
        private static Guid guid_iduser, guid_fnegocio;
        private static int int_idtipousuario, int_tipousuario, int_accion_usuario, int_accion_rubro, int_accion_gasto, int_accion_caja, int_accion_email_envio, int_accion_email_recepcion;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        #region funciones

        [ScriptMethod()]
        [WebMethod]
        public static List<string> SearchCustomers(string prefixText, int count)
        {
            List<String> columnData = new List<String>();
            string d_rub = prefixText.ToUpper();

            if (int_pnlID == 1)
            {
                using (SqlConnection connection = new SqlConnection(cn.cn_SQL))
                {
                    connection.Open();
                    string query = "SELECT etiqueta_rubro,rubro,codigo_rubro FROM [liec_gastos].[dbo].[inf_rubro]  WHERE etiqueta_rubro LIKE '" + d_rub + "%' ";
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
            else if (int_pnlID == 3)
            {
                string f_rub = prefixText.ToUpper();

                using (SqlConnection connection = new SqlConnection(cn.cn_SQL))
                {
                    connection.Open();
                    string query = "SELECT etiqueta_rubro,rubro,codigo_rubro FROM [liec_gastos].[dbo].[inf_rubro]  WHERE etiqueta_rubro LIKE '" + f_rub + "%' ";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                columnData.Add(reader.GetString(0) + " | " + reader.GetString(1).ToUpper() + " | " + reader.GetString(2).ToUpper());
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

        #region caja

        protected void btn_buscar_caja_Click(object sender, EventArgs e)
        {
            string str_userb = txt_buscar_caja.Text.ToUpper();

            using (lab_liecEntities data_user = new lab_liecEntities())
            {
                var inf_user = (from i_r in data_user.inf_caja
                                join r_e in data_user.fact_est_caja on i_r.id_est_caja equals r_e.id_est_caja
                                join t_r in data_user.fact_tipo_rubro on i_r.id_tipo_rubro equals t_r.id_tipo_rubro
                                join i_dr in data_user.inf_rubro on i_r.id_rubro equals i_dr.id_rubro
                                where i_r.desc_caja.Contains(str_userb)
                                select new
                                {
                                    i_r.codigo_caja,
                                    r_e.desc_est_caja,
                                    t_r.tipo_rubro,
                                    i_dr.rubro,
                                    i_r.desc_caja,
                                    i_r.fecha_registro
                                }).ToList();

                if (inf_user.Count == 0)
                {
                    gv_caja.DataSource = inf_user;
                    gv_caja.DataBind();
                    gv_caja.Visible = true;

                    Mensaje("gasto no encontrado.");
                }
                else
                {
                    gv_caja.DataSource = inf_user;
                    gv_caja.DataBind();
                    gv_caja.Visible = true;
                }
            }
        }

        protected void btn_guardar_caja_Click(object sender, EventArgs e)
        {
            if (int_accion_caja == 0)
            {
                Mensaje("FAvor de seleccionar una acción");
            }
            else
            {
                Guid guid_idcaja;
                Guid guid_ncaja = Guid.NewGuid();
                int int_tiporubro = int.Parse(ddl_tipocaja_rubro.SelectedValue);
                Guid guid_descrubro = Guid.Parse(ddl_desccaja_rubro.SelectedValue);
                double dbl_monto = double.Parse(txt_monto_caja.Text);
                string str_descaja = txt_desc_caja.Text.ToUpper();
                string str_codigocaja;

                if (int_accion_caja == 1)
                {
                    using (lab_liecEntities data_user = new lab_liecEntities())
                    {
                        var items_user = (from c in data_user.inf_caja
                                          select c).ToList();

                        if (items_user.Count == 0)
                        {
                            str_codigocaja = "liec_c" + string.Format("{0:000}", items_user.Count + 1);

                            using (var m_usuario = new lab_liecEntities())
                            {
                                var i_usuario = new inf_caja
                                {
                                    id_caja = guid_ncaja,
                                    codigo_caja = str_codigocaja,
                                    id_est_caja = 1,
                                    id_estatus_rpt = 1,
                                    id_tipo_rubro = int_tiporubro,
                                    id_rubro = guid_descrubro,
                                    monto = decimal.Parse(dbl_monto.ToString()),
                                    desc_caja = str_descaja,
                                    fecha_registro = DateTime.Now,
                                    id_emp = guid_fnegocio
                                };

                                m_usuario.inf_caja.Add(i_usuario);
                                m_usuario.SaveChanges();
                            }

                            limpia_txt_caja();

                            Mensaje("Datos agregados con éxito.");
                        }
                        else
                        {
                            str_codigocaja = "liec_c" + string.Format("{0:000}", items_user.Count + 1);

                            using (var m_usuario = new lab_liecEntities())
                            {
                                var i_usuario = new inf_caja
                                {
                                    id_caja = guid_ncaja,
                                    codigo_caja = str_codigocaja,
                                    id_est_caja = 1,
                                    id_estatus_rpt = 1,
                                    id_tipo_rubro = int_tiporubro,
                                    id_rubro = guid_descrubro,
                                    monto = decimal.Parse(dbl_monto.ToString()),
                                    desc_caja = str_descaja,
                                    fecha_registro = DateTime.Now,
                                    id_emp = guid_fnegocio
                                };

                                m_usuario.inf_caja.Add(i_usuario);
                                m_usuario.SaveChanges();
                            }

                            limpia_txt_caja();

                            double dml_caja, dml_monto;

                            using (lab_liecEntities edm_rubro = new lab_liecEntities())
                            {
                                var i_rubro = (from u in edm_rubro.inf_gastos
                                               where u.id_tipo_rubro == 4
                                               select new
                                               {
                                                   u.monto
                                               }).ToList();

                                if (i_rubro.Count == 0)
                                {
                                    dml_monto = double.Parse(i_rubro.Count.ToString());
                                }
                                else
                                {
                                    dml_monto = double.Parse(i_rubro.Sum(x => x.monto).ToString());
                                }
                            }

                            using (lab_liecEntities edm_gastos = new lab_liecEntities())
                            {
                                var i_gastos = (from i_g in edm_gastos.inf_caja

                                                select new
                                                {
                                                    i_g.monto,
                                                }).ToList();

                                if (i_gastos.Count == 0)
                                {
                                    dml_caja = i_gastos.Count;
                                }
                                else
                                {
                                    dml_caja = double.Parse(i_gastos.Sum(x => x.monto).ToString());
                                }
                            }
                            lbl_tcaja.Text = "MONTO: " + string.Format("{0:C}", (Math.Truncate(Convert.ToDouble(dml_monto) * 100.0) / 100.0)) + " GASTOS: " + string.Format("{0:C}", (Math.Truncate(Convert.ToDouble(dml_caja) * 100.0) / 100.0)) + " BALANCE: " + string.Format("{0:C}", (Math.Truncate(Convert.ToDouble(dml_monto - dml_caja) * 100.0) / 100.0));
                            up_caja.Update();
                            Mensaje("Datos agregados con éxito.");
                        }
                    }
                }
                else if (int_accion_caja == 2)
                {
                    foreach (GridViewRow row in gv_caja.Rows)
                    {
                        if (row.RowType == DataControlRowType.DataRow)
                        {
                            CheckBox chkRow = (row.Cells[0].FindControl("chk_caja") as CheckBox);
                            if (chkRow.Checked)
                            {
                                row.BackColor = Color.FromArgb(224, 153, 123);
                                string codeuser = row.Cells[1].Text;

                                using (lab_liecEntities data_user = new lab_liecEntities())
                                {
                                    var items_user = (from c in data_user.inf_caja
                                                      where c.codigo_caja == codeuser
                                                      select c).FirstOrDefault();

                                    guid_idcaja = items_user.id_caja;
                                }

                                int int_estatuscaja;

                                if (chkb_estatus_caja.Checked == true)
                                {
                                    int_estatuscaja = 3;
                                }
                                else
                                {
                                    int_estatuscaja = 1;
                                }

                                using (var m_fempresa = new lab_liecEntities())
                                {
                                    var i_fempresa = (from c in m_fempresa.inf_caja
                                                      where c.id_caja == guid_idcaja
                                                      select c).FirstOrDefault();

                                    i_fempresa.id_est_caja = int_estatuscaja;
                                    i_fempresa.id_tipo_rubro = int_tiporubro;
                                    i_fempresa.id_rubro = guid_descrubro;
                                    i_fempresa.monto = decimal.Parse(dbl_monto.ToString());
                                    i_fempresa.desc_caja = str_descaja;

                                    m_fempresa.SaveChanges();
                                }

                                limpia_txt_rubros();

                                double dml_caja, dml_monto;

                                using (lab_liecEntities edm_rubro = new lab_liecEntities())
                                {
                                    var i_rubro = (from u in edm_rubro.inf_gastos
                                                   where u.id_tipo_rubro == 4
                                                   select new
                                                   {
                                                       u.monto
                                                   }).ToList();

                                    if (i_rubro.Count == 0)
                                    {
                                        dml_monto = double.Parse(i_rubro.Count.ToString());
                                    }
                                    else
                                    {
                                        dml_monto = double.Parse(i_rubro.Sum(x => x.monto).ToString());
                                    }
                                }

                                using (lab_liecEntities edm_gastos = new lab_liecEntities())
                                {
                                    var i_gastos = (from i_g in edm_gastos.inf_caja

                                                    select new
                                                    {
                                                        i_g.monto,
                                                    }).ToList();

                                    if (i_gastos.Count == 0)
                                    {
                                        dml_caja = i_gastos.Count;
                                    }
                                    else
                                    {
                                        dml_caja = double.Parse(i_gastos.Sum(x => x.monto).ToString());
                                    }
                                }
                                lbl_tcaja.Text = "MONTO: " + string.Format("{0:C}", (Math.Truncate(Convert.ToDouble(dml_monto) * 100.0) / 100.0)) + " GASTOS: " + string.Format("{0:C}", (Math.Truncate(Convert.ToDouble(dml_caja) * 100.0) / 100.0)) + " BALANCE: " + string.Format("{0:C}", (Math.Truncate(Convert.ToDouble(dml_monto - dml_caja) * 100.0) / 100.0));

                                using (lab_liecEntities data_user = new lab_liecEntities())
                                {
                                    var inf_user = (from i_r in data_user.inf_caja
                                                    join r_e in data_user.fact_est_caja on i_r.id_est_caja equals r_e.id_est_caja
                                                    join t_r in data_user.fact_tipo_rubro on i_r.id_tipo_rubro equals t_r.id_tipo_rubro
                                                    select new
                                                    {
                                                        i_r.codigo_caja,
                                                        r_e.desc_est_caja,
                                                        t_r.tipo_rubro,
                                                
                                                        i_r.desc_caja,
                                                        i_r.fecha_registro
                                                    }).ToList();

                                    gv_caja.DataSource = inf_user;
                                    gv_caja.DataBind();
                                    gv_caja.Visible = true;
                                }

                                using (lab_liecEntities edm_rubro = new lab_liecEntities())
                                {
                                    var i_rubro = (from u in edm_rubro.inf_gastos
                                                   where u.id_tipo_rubro == 4
                                                   select new
                                                   {
                                                       u.monto
                                                   }).ToList();

                                    if (i_rubro.Count == 0)
                                    {
                                        dml_monto = double.Parse(i_rubro.Count.ToString());
                                    }
                                    else
                                    {
                                        dml_monto = double.Parse(i_rubro.Sum(x => x.monto).ToString());
                                    }
                                }

                                using (lab_liecEntities edm_gastos = new lab_liecEntities())
                                {
                                    var i_gastos = (from i_g in edm_gastos.inf_caja

                                                    select new
                                                    {
                                                        i_g.monto,
                                                    }).ToList();

                                    if (i_gastos.Count == 0)
                                    {
                                        dml_caja = i_gastos.Count;
                                    }
                                    else
                                    {
                                        dml_caja = double.Parse(i_gastos.Sum(x => x.monto).ToString());
                                    }
                                }
                                lbl_tcaja.Text = "MONTO: " + string.Format("{0:C}", (Math.Truncate(Convert.ToDouble(dml_monto) * 100.0) / 100.0)) + " GASTOS: " + string.Format("{0:C}", (Math.Truncate(Convert.ToDouble(dml_caja) * 100.0) / 100.0)) + " BALANCE: " + string.Format("{0:C}", (Math.Truncate(Convert.ToDouble(dml_monto - dml_caja) * 100.0) / 100.0));

                                Mensaje("Datos actualizados con éxito.");
                            }
                            else
                            {
                                row.BackColor = Color.White;
                            }
                        }
                    }
                }
            }
        }

        private void limpia_txt_caja()
        {
            ddl_tipocaja_rubro.Items.Clear();
            ddl_desccaja_rubro.Items.Clear();
            using (lab_liecEntities m_genero = new lab_liecEntities())
            {
                var i_genero = (from f_tr in m_genero.fact_tipo_rubro
                                where f_tr.id_tipo_rubro != 4
                                select f_tr).ToList();

                ddl_tipocaja_rubro.DataSource = i_genero;
                ddl_tipocaja_rubro.DataTextField = "desc_tipo_rubro";
                ddl_tipocaja_rubro.DataValueField = "id_tipo_rubro";
                ddl_tipocaja_rubro.DataBind();
            }
            ddl_tipocaja_rubro.Items.Insert(0, new ListItem("Seleccionar", "0"));
            ddl_desccaja_rubro.Items.Insert(0, new ListItem("Seleccionar", "0"));

            txt_monto_caja.Text = null;
            txt_desc_caja.Text = null;
        }

        protected void chk_caja_CheckedChanged(object sender, EventArgs e)
        {
            Guid guid_idcaja;

            foreach (GridViewRow row in gv_caja.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chk_caja") as CheckBox);
                    if (chkRow.Checked)
                    {
                        row.BackColor = Color.FromArgb(224, 153, 123);
                        string codeuser = row.Cells[1].Text;

                        using (lab_liecEntities data_user = new lab_liecEntities())
                        {
                            var items_user = (from c in data_user.inf_caja
                                              where c.codigo_caja == codeuser
                                              select c).FirstOrDefault();

                            guid_idcaja = items_user.id_caja;
                        }

                        using (lab_liecEntities data_user = new lab_liecEntities())
                        {
                            var inf_user = (from u in data_user.inf_caja
                                            where u.id_caja == guid_idcaja
                                            select new
                                            {
                                                u.id_tipo_rubro,
                                                u.id_rubro,
                                                u.desc_caja,
                                                u.monto
                                            }).FirstOrDefault();

                            ddl_tipocaja_rubro.SelectedValue = inf_user.id_tipo_rubro.ToString();
                            using (lab_liecEntities m_genero = new lab_liecEntities())
                            {
                                var i_genero = (from f_tr in m_genero.inf_rubro
                                                where f_tr.id_rubro == inf_user.id_rubro
                                                select f_tr).ToList();

                                ddl_desccaja_rubro.DataSource = i_genero;
                                ddl_desccaja_rubro.DataTextField = "etiqueta_rubro";
                                ddl_desccaja_rubro.DataValueField = "id_rubro";
                                ddl_desccaja_rubro.DataBind();
                            }

                            txt_desc_caja.Text = inf_user.desc_caja;
                            txt_monto_caja.Text = string.Format("{0:n2}", (Math.Truncate(Convert.ToDouble(inf_user.monto) * 100.0) / 100.0));

                            rfv_buscar_caja.Enabled = false;
                            rfv_desc_caja.Enabled = true;
                            rfv_monto_caja.Enabled = true;
                            rfv_tipocaja_rubro.Enabled = true;
                            rfv_desccaja_rubro.Enabled = true;
                        }
                    }
                    else
                    {
                        row.BackColor = Color.White;
                    }
                }
            }
        }

        protected void chkbox_agregar_c_CheckedChanged(object sender, EventArgs e)
        {
            if (chkbox_agregar_c.Checked)
            {
                int_accion_caja = 1;

                txt_buscar_caja.Visible = false;
                btn_buscar_caja.Visible = false;

                gv_caja.Visible = false;
                chkb_estatus_caja.Visible = false;
                limpia_txt_caja();
                chkbox_editar_c.Checked = false;
                rfv_buscar_caja.Enabled = false;
                rfv_desc_caja.Enabled = true;
                rfv_monto_caja.Enabled = true;
                rfv_tipocaja_rubro.Enabled = true;
                rfv_desccaja_rubro.Enabled = true;
            }
            else
            {
                int_accion_caja = 0;
                chkbox_editar_c.Checked = false;
                rfv_buscar_caja.Enabled = false;
                rfv_desc_caja.Enabled = false;
                rfv_monto_caja.Enabled = false;
                rfv_tipocaja_rubro.Enabled = false;
                rfv_desccaja_rubro.Enabled = false;
            }
        }

        protected void chkbox_editar_c_CheckedChanged(object sender, EventArgs e)
        {
            if (chkbox_editar_c.Checked)
            {
                chkbox_agregar_c.Checked = false;
                int_accion_caja = 2;

                txt_buscar_caja.Visible = true;
                btn_buscar_caja.Visible = true;
                chkb_estatus_caja.Visible = true;

                limpia_txt_caja();

                using (lab_liecEntities data_user = new lab_liecEntities())
                {
                    var inf_user = (from i_r in data_user.inf_caja
                                    join r_e in data_user.fact_est_caja on i_r.id_est_caja equals r_e.id_est_caja
                                    join t_r in data_user.fact_tipo_rubro on i_r.id_tipo_rubro equals t_r.id_tipo_rubro
                                    join i_dr in data_user.inf_rubro on i_r.id_rubro equals i_dr.id_rubro
                                    select new
                                    {
                                        i_r.codigo_caja,
                                        r_e.desc_est_caja,
                                        t_r.tipo_rubro,
                                        i_dr.rubro,
                                        i_r.desc_caja,
                                        i_r.fecha_registro
                                    }).ToList();

                    gv_caja.DataSource = inf_user;
                    gv_caja.DataBind();
                    gv_caja.Visible = true;
                }
                rfv_buscar_caja.Enabled = false;
                rfv_desc_caja.Enabled = true;
                rfv_monto_caja.Enabled = true;
                rfv_tipocaja_rubro.Enabled = true;
                rfv_desccaja_rubro.Enabled = true;
            }
            else
            {
                int_accion_caja = 0;
                chkbox_agregar_c.Checked = false;

                int_accion_caja = 0;
                chkbox_editar_c.Checked = false;
                rfv_buscar_caja.Enabled = false;
                rfv_desc_caja.Enabled = false;
                rfv_monto_caja.Enabled = false;
                rfv_tipocaja_rubro.Enabled = false;
                rfv_desccaja_rubro.Enabled = false;
            }
        }

        protected void ddl_tipocaja_rubro_SelectedIndexChanged(object sender, EventArgs e)
        {
            int int_idtiporubro = int.Parse(ddl_tipocaja_rubro.SelectedValue);

            ddl_desccaja_rubro.Items.Clear();
            using (lab_liecEntities m_genero = new lab_liecEntities())
            {
                var i_genero = (from f_tr in m_genero.inf_rubro
                                where f_tr.id_tipo_rubro == int_idtiporubro
                                select f_tr).ToList();

                ddl_desccaja_rubro.DataSource = i_genero;
                ddl_desccaja_rubro.DataTextField = "etiqueta_rubro";
                ddl_desccaja_rubro.DataValueField = "id_rubro";
                ddl_desccaja_rubro.DataBind();
            }
            ddl_desccaja_rubro.Items.Insert(0, new ListItem("Seleccionar", "0"));
        }

        protected void gv_caja_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_caja.PageIndex = e.NewPageIndex;

            using (lab_liecEntities data_user = new lab_liecEntities())
            {
                var inf_user = (from i_r in data_user.inf_caja
                                join r_e in data_user.fact_est_caja on i_r.id_est_caja equals r_e.id_est_caja
                                join t_r in data_user.fact_tipo_rubro on i_r.id_tipo_rubro equals t_r.id_tipo_rubro
                                join i_dr in data_user.inf_rubro on i_r.id_rubro equals i_dr.id_rubro
                                select new
                                {
                                    i_r.codigo_caja,
                                    r_e.desc_est_caja,
                                    t_r.tipo_rubro,
                                    i_dr.rubro,
                                    i_r.desc_caja,
                                    i_r.fecha_registro
                                }).ToList();

                gv_caja.DataSource = inf_user;
                gv_caja.DataBind();
                gv_caja.Visible = true;
            }
        }

        protected void txt_buscar_caja_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txt_buscar_caja.Text))
            {
                rfv_buscar_caja.Enabled = false;
            }
            else
            {
                rfv_buscar_caja.Enabled = true;
                rfv_desc_caja.Enabled = false;
                rfv_monto_caja.Enabled = false;
                rfv_tipocaja_rubro.Enabled = false;
                rfv_desccaja_rubro.Enabled = false;
            }
        }

        #endregion caja

        #region rubro

        protected void lkb_cont_rub_Click(object sender, EventArgs e)
        {
            acc_rubro = 0;
            int_pnlID = 3;
            pnl_rubros.Visible = true;
            limpia_txt_rubros();
            up_rubros.Update();
        }

        protected void btn_agr_rubro_Click(object sender, EventArgs e)
        {
            acc_rubro = 1;

            div_busc_rub.Visible = false;

            gv_rubros.Visible = false;

            monto_extra.Enabled = false;

            limpia_txt_rubros();

            i_agr_rubro.Attributes["style"] = "color:#E34C0E";
            i_edit_rubro.Attributes["style"] = "color:white";

            rfv_eti_rub.Enabled = true;
            rfv_desc_rubro.Enabled = true;
            rfv_s_tipo_rubro.Enabled = true;
            rfv_mont_rubro.Enabled = true;
            rfv_minimo_rubro.Enabled = true;
            rfv_maximo_rubro.Enabled = true;
            rfv_pextra_rubro.Enabled = false;
        }

        protected void btn_edit_rubro_Click(object sender, EventArgs e)
        {
            acc_rubro = 2;

            div_busc_rub.Visible = true;
            rfv_buscar_rub.Enabled = true;
            monto_extra.Enabled = false;

            limpia_txt_rubros();

            i_agr_rubro.Attributes["style"] = "color:white";
            i_edit_rubro.Attributes["style"] = "color:#E34C0E";
        }

        protected void chkb_des_rubro_CheckedChanged(object sender, EventArgs e)
        {
            acc_rubro = 0;
            rfv_eti_rub.Enabled = false;
            rfv_desc_rubro.Enabled = false;
            rfv_s_tipo_rubro.Enabled = false;
            rfv_mont_rubro.Enabled = false;
            rfv_minimo_rubro.Enabled = false;
            rfv_maximo_rubro.Enabled = false;
            rfv_pextra_rubro.Enabled = false;
            rfv_buscar_rub.Enabled = false;
        }

        protected void mont_rubro_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(mont_rubro.Text))
            {
                rfv_minimo_rubro.Enabled = true;
            }
            else
            {
                string stringTest = mont_rubro.Text.Trim().Replace("$", "").Replace(",", "");

                try
                {
                    decimal moneyvalue = decimal.Parse(stringTest);
                    string html = String.Format("{0:C}", moneyvalue);

                    mont_rubro.Text = html;
                    mont_rubro.Focus();
                }
                catch
                {
                    mont_rubro.Text = null;
                }
            }
        }

        protected void btn_guardar_rubros_Click(object sender, EventArgs e)
        {
            int t_rub, min_rub = 0, max_rub = 0;
            string s_eti_rub, s_desc_rub, str_cod_rub;
            double d_mont_fijo, d_mont_ext;
            Guid guid_nrubro, guid_emp;

            if (acc_rubro == 0)
            {
                Mensaje("Favor de seleccionar una acción");
            }
            else
            {
                if (acc_rubro == 2)
                {
                    int int_estatusID = 0;
                    string f_rub = null;
                    foreach (GridViewRow row in gv_rubros.Rows)
                    {
                        // int key = (int)GridView1.DataKeys[row.RowIndex].Value;
                        if (row.RowType == DataControlRowType.DataRow)
                        {
                            CheckBox chkRow = (row.Cells[0].FindControl("chk_rubros") as CheckBox);
                            if (chkRow.Checked)
                            {
                                int_estatusID = int_estatusID + 1;
                                break;
                            }
                            else
                            {
                                int_estatusID = 0;
                            }
                        }
                    }

                    if (int_estatusID >= 1)
                    {
                        guid_nrubro = Guid.NewGuid();
                        guid_emp = Guid.NewGuid();

                        t_rub = int.Parse(s_tipo_rubro.SelectedValue);
                        s_eti_rub = eti_rub.Text.Trim().ToUpper();
                        s_desc_rub = desc_rubro.Text.Trim().ToUpper();
                        min_rub = int.Parse(minimo_rubro.Text);
                        max_rub = int.Parse(maximo_rubro.Text);
                        d_mont_fijo = double.Parse(mont_rubro.Text.Replace("$", ""));
                        double dbl_pextra;

                        if ((min_rub + max_rub) == 0 || (min_rub + max_rub) > 100 || (min_rub + max_rub) < 100)
                        {
                            minimo_rubro.Text = null;
                            maximo_rubro.Text = null;
                            Mensaje("suma de minimo y máximo debe ser igual 100");
                        }
                        else
                        {
                            if (string.IsNullOrEmpty(monto_extra.Text))
                            {
                            }
                            else
                            {
                                d_mont_ext = double.Parse(monto_extra.Text.Replace("$", ""));
                            }

                            Guid guid_idrubro;
                            int int_ddl, int_f_rub = 0;

                            foreach (GridViewRow row in gv_rubros.Rows)
                            {
                                // int key = (int)GridView1.DataKeys[row.RowIndex].Value;
                                if (row.RowType == DataControlRowType.DataRow)
                                {
                                    CheckBox chkRow = (row.Cells[0].FindControl("chk_rubros") as CheckBox);
                                    if (chkRow.Checked)
                                    {
                                        int_f_rub = int_f_rub + 1;
                                        f_rub = row.Cells[1].Text;

                                        DropDownList dl = (DropDownList)row.FindControl("ddl_rub_estatus");

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
                            using (lab_liecEntities data_user = new lab_liecEntities())
                            {
                                var items_user = (from c in data_user.inf_rubro
                                                  where c.codigo_rubro == f_rub
                                                  select c).FirstOrDefault();

                                guid_idrubro = items_user.id_rubro;
                            }

                            if (string.IsNullOrEmpty(monto_extra.Text))
                            {
                                dbl_pextra = 0;
                            }
                            else
                            {
                                dbl_pextra = double.Parse(monto_extra.Text);
                            }

                            using (var m_fempresa = new lab_liecEntities())
                            {
                                var i_fempresa = (from c in m_fempresa.inf_rubro
                                                  where c.id_rubro == guid_idrubro
                                                  select c).FirstOrDefault();

                                i_fempresa.id_est_rub = int_estatusID;
                                i_fempresa.id_tipo_rubro = t_rub;
                                i_fempresa.etiqueta_rubro = s_eti_rub;
                                i_fempresa.rubro = s_desc_rub;
                                i_fempresa.presupuesto = d_mont_fijo;
                                i_fempresa.presupuesto_extra = dbl_pextra;
                                i_fempresa.minimo = min_rub;
                                i_fempresa.maximo = max_rub;
                                m_fempresa.SaveChanges();
                            }

                            limpia_txt_rubros();

                            rfv_eti_rub.Enabled = false;
                            rfv_desc_rubro.Enabled = false;
                            rfv_s_tipo_rubro.Enabled = false;
                            rfv_mont_rubro.Enabled = false;
                            rfv_minimo_rubro.Enabled = false;
                            rfv_maximo_rubro.Enabled = false;
                            rfv_pextra_rubro.Enabled = false;
                            gv_rubros.Visible = false;
                            Mensaje("Datos actualizados con éxito.");
                        }
                    }
                    else
                    {
                        Mensaje("Favor de seleccionar una un rubro");
                    
                    }
                }
                else
                {
                    guid_nrubro = Guid.NewGuid();
                    guid_emp = Guid.Parse("D8A03556-6791-45F3-BABE-ECF267B865F1");

                    t_rub = int.Parse(s_tipo_rubro.SelectedValue);
                    s_eti_rub = eti_rub.Text.Trim().ToUpper();
                    s_desc_rub = desc_rubro.Text.Trim().ToUpper();
                    min_rub = int.Parse(minimo_rubro.Text);
                    max_rub = int.Parse(maximo_rubro.Text);
                    d_mont_fijo = double.Parse(mont_rubro.Text.Replace("$", ""));
                    double dbl_pextra;

                    if ((min_rub + max_rub) == 0 || (min_rub + max_rub) > 100 || (min_rub + max_rub) < 100)
                    {
                        minimo_rubro.Text = null;
                        maximo_rubro.Text = null;
                        Mensaje("suma de minimo y máximo debe ser igual 100");
                    }
                    else
                    {
                        if (string.IsNullOrEmpty(monto_extra.Text))
                        {
                        }
                        else
                        {
                            d_mont_ext = double.Parse(monto_extra.Text.Replace("$", ""));
                        }

                        using (lab_liecEntities edm_rub = new lab_liecEntities())
                        {
                            var i_rub = (from c in edm_rub.inf_rubro
                                         where c.id_tipo_rubro == t_rub
                                         where c.etiqueta_rubro == s_eti_rub
                                         select c).ToList();

                            if (i_rub.Count == 0)
                            {
                                var c_rub = (from c in edm_rub.inf_rubro
                                             select c).ToList();
                                if (c_rub.Count == 0)
                                {
                                    str_cod_rub = "liec_r" + string.Format("{0:000}", c_rub.Count + 1);

                                    var i_usuario = new inf_rubro
                                    {
                                        id_rubro = guid_nrubro,
                                        id_est_rub = 1,
                                        codigo_rubro = str_cod_rub,
                                        id_tipo_rubro = t_rub,
                                        etiqueta_rubro = s_eti_rub,
                                        rubro = s_desc_rub,
                                        presupuesto = d_mont_fijo,
                                        minimo = min_rub,
                                        maximo = max_rub,
                                        presupuesto_extra = 0,
                                        fecha_registro = DateTime.Now,
                                        id_emp = guid_emp
                                    };

                                    edm_rub.inf_rubro.Add(i_usuario);
                                    edm_rub.SaveChanges();

                                    var i_ctrl_montosf = new inf_control_montos
                                    {
                                        id_control_monto = guid_nrubro,
                                        id_rubro = guid_nrubro,
                                
                                        monto = d_mont_fijo,
                                        fecha_registro = DateTime.Now,
                                    };

                                    edm_rub.inf_control_montos.Add(i_ctrl_montosf);
                                    edm_rub.SaveChanges();

                                    limpia_txt_rubros();
                                    Mensaje("Datos agregados con éxito.");
                                }
                                else
                                {
                                    str_cod_rub = "liec_r" + string.Format("{0:000}", c_rub.Count + 1);

                                    var i_usuario = new inf_rubro
                                    {
                                        id_rubro = guid_nrubro,
                                        id_est_rub = 1,
                                        codigo_rubro = str_cod_rub,
                                        id_tipo_rubro = t_rub,
                                        etiqueta_rubro = s_eti_rub,
                                        rubro = s_desc_rub,
                                        presupuesto = d_mont_fijo,
                                        minimo = min_rub,
                                        maximo = max_rub,
                                        presupuesto_extra = 0,
                                        fecha_registro = DateTime.Now,
                                        id_emp = guid_emp
                                    };

                                    edm_rub.inf_rubro.Add(i_usuario);
                                    edm_rub.SaveChanges();

                                    var i_ctrl_montosf = new inf_control_montos
                                    {
                                        id_control_monto = guid_nrubro,
                                        id_rubro = guid_nrubro,
                 
                                        monto = d_mont_fijo,
                                        fecha_registro = DateTime.Now,
                                    };

                                    edm_rub.inf_control_montos.Add(i_ctrl_montosf);
                                    edm_rub.SaveChanges();


                                    limpia_txt_rubros();
                        

                                    Mensaje("Datos agregados con éxito.");
                                }
                            }
                            else
                            {
                                Mensaje("Tipo de rubro y etiqueta, ya existen en la base de datos, favor de re-intentar.");
                            }
                        }
                       
                    }
                }
            }
        }

        protected void btn_buscar_rub_Click(object sender, EventArgs e)
        {
            string str_rub = txt_buscar_rub.Text.ToUpper().Trim();

            if (str_rub == "TODOS")
            {
                using (lab_liecEntities data_user = new lab_liecEntities())
                {
                    var inf_user = (from i_r in data_user.inf_rubro
                                    join t_r in data_user.fact_tipo_rubro on i_r.id_tipo_rubro equals t_r.id_tipo_rubro
                                    select new
                                    {
                                        i_r.codigo_rubro,
                                        t_r.tipo_rubro,
                                        i_r.etiqueta_rubro,
                                        i_r.rubro,
                                        i_r.fecha_registro
                                    }).OrderBy(x => x.codigo_rubro).ToList();

                    if (inf_user.Count == 0)
                    {
                        gv_rubros.DataSource = inf_user;
                        gv_rubros.DataBind();
                        gv_rubros.Visible = true;

                        Mensaje("Rubro no encontrado.");
                    }
                    else
                    {
                        gv_rubros.DataSource = inf_user;
                        gv_rubros.DataBind();
                        gv_rubros.Visible = true;
                    }
                }
            }
            else
            {
                try
                {
                    string n_rub;
                    Guid guid_fclte;
                    Char char_s = '|';
                    string d_rub = txt_buscar_rub.Text.Trim();
                    String[] de_rub = d_rub.Trim().Split(char_s);

                    n_rub = de_rub[2].Trim();

                    using (lab_liecEntities edm_nclte = new lab_liecEntities())
                    {
                        var i_nclte = (from c in edm_nclte.inf_rubro
                                       where c.codigo_rubro == n_rub
                                       select c).FirstOrDefault();

                        guid_fclte = i_nclte.id_rubro;
                    }

                    using (lab_liecEntities data_user = new lab_liecEntities())
                    {
                        var inf_user = (from i_r in data_user.inf_rubro
                                        join t_r in data_user.fact_tipo_rubro on i_r.id_tipo_rubro equals t_r.id_tipo_rubro
                                        where i_r.id_rubro == guid_fclte
                                        select new
                                        {
                                            i_r.codigo_rubro,
                                            t_r.tipo_rubro,
                                            i_r.etiqueta_rubro,
                                            i_r.rubro,
                                            i_r.fecha_registro
                                        }).OrderBy(x => x.codigo_rubro).ToList();

                        if (inf_user.Count == 0)
                        {
                            gv_rubros.DataSource = inf_user;
                            gv_rubros.DataBind();
                            gv_rubros.Visible = true;

                            Mensaje("Rubro no encontrado.");
                        }
                        else
                        {
                            gv_rubros.DataSource = inf_user;
                            gv_rubros.DataBind();
                            gv_rubros.Visible = true;
                        }
                    }
                }
                catch
                {
                    limpia_txt_rubros();
                    Mensaje("Rubro no encontrado.");
                }
            }
        }

        protected void gv_rubros_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string str_clteID = e.Row.Cells[1].Text;
                int int_estatusID;

                using (lab_liecEntities data_clte = new lab_liecEntities())
                {
                    var i_clte = (from t_clte in data_clte.inf_rubro
                                  where t_clte.codigo_rubro == str_clteID
                                  select new
                                  {
                                      t_clte.id_est_rub,
                                  }).FirstOrDefault();

                    int_estatusID = int.Parse(i_clte.id_est_rub.ToString());
                }

                DropDownList DropDownList1 = (e.Row.FindControl("ddl_rub_estatus") as DropDownList);

                using (lab_liecEntities db_sepomex = new lab_liecEntities())
                {
                    var tbl_sepomex = (from c in db_sepomex.fact_est_rub
                                       select c).ToList();

                    DropDownList1.DataSource = tbl_sepomex;

                    DropDownList1.DataTextField = "desc_est_rub";
                    DropDownList1.DataValueField = "id_est_rub";
                    DropDownList1.DataBind();
                    DropDownList1.Items.Insert(0, new ListItem("SELECCIONAR", "0"));
                    DropDownList1.SelectedValue = int_estatusID.ToString();
                }
            }
        }

        protected void chk_rubros_CheckedChanged(object sender, EventArgs e)
        {
            Guid guid_rub;
            string str_rub;

            foreach (GridViewRow row in gv_rubros.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chk_rubros") as CheckBox);
                    if (chkRow.Checked)
                    {
                        row.BackColor = Color.FromArgb(227, 76, 14);
                        str_rub = row.Cells[1].Text;

                        using (lab_liecEntities edm_rub = new lab_liecEntities())
                        {
                            var i_rub = (from c in edm_rub.inf_rubro
                                         where c.codigo_rubro == str_rub
                                         select c).FirstOrDefault();

                            guid_rub = i_rub.id_rubro;

                            var f_rub = (from r in edm_rub.inf_rubro
                                         where r.id_rubro == guid_rub
                                         select new
                                         {
                                             r.id_tipo_rubro,
                                             r.etiqueta_rubro,
                                             r.rubro,
                                             r.presupuesto,
                                             r.minimo,
                                             r.maximo,
                                             r.presupuesto_extra
                                         }).FirstOrDefault();

                            s_tipo_rubro.SelectedValue = f_rub.id_tipo_rubro.ToString();
                            eti_rub.Text = f_rub.etiqueta_rubro;
                            desc_rubro.Text = f_rub.rubro;
                            decimal moneyvalue = decimal.Parse(f_rub.presupuesto.ToString());
                            string monto_rub = String.Format("{0:C}", moneyvalue);
                            mont_rubro.Text = monto_rub;
                            minimo_rubro.Text = f_rub.minimo.ToString();
                            maximo_rubro.Text = f_rub.maximo.ToString();
                        }
                    }
                    else
                    {
                        row.BackColor = Color.White;
                    }
                }
            }
        }

        protected void gv_rubros_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_rubros.PageIndex = e.NewPageIndex;

            string str_rub = txt_buscar_rub.Text.ToUpper().Trim();

            if (str_rub == "TODOS")
            {
                using (lab_liecEntities data_user = new lab_liecEntities())
                {
                    var inf_user = (from i_r in data_user.inf_rubro
                                    join t_r in data_user.fact_tipo_rubro on i_r.id_tipo_rubro equals t_r.id_tipo_rubro
                                    select new
                                    {
                                        i_r.codigo_rubro,
                                        t_r.tipo_rubro,
                                        i_r.etiqueta_rubro,
                                        i_r.rubro,
                                        i_r.fecha_registro
                                    }).OrderBy(x => x.codigo_rubro).ToList();

                    if (inf_user.Count == 0)
                    {
                        gv_rubros.DataSource = inf_user;
                        gv_rubros.DataBind();
                        gv_rubros.Visible = true;

                        Mensaje("Rubro no encontrado.");
                    }
                    else
                    {
                        gv_rubros.DataSource = inf_user;
                        gv_rubros.DataBind();
                        gv_rubros.Visible = true;
                    }
                }
                rfv_eti_rub.Enabled = true;
                rfv_desc_rubro.Enabled = true;
                rfv_s_tipo_rubro.Enabled = true;
                rfv_mont_rubro.Enabled = true;
                rfv_minimo_rubro.Enabled = true;
                rfv_maximo_rubro.Enabled = true;
                rfv_pextra_rubro.Enabled = false;
            }
            else
            {
                using (lab_liecEntities data_user = new lab_liecEntities())
                {
                    var inf_user = (from i_r in data_user.inf_rubro
                                    join t_r in data_user.fact_tipo_rubro on i_r.id_tipo_rubro equals t_r.id_tipo_rubro
                                    where i_r.etiqueta_rubro.Contains(str_rub)
                                    select new
                                    {
                                        i_r.codigo_rubro,
                                        t_r.tipo_rubro,
                                        i_r.etiqueta_rubro,
                                        i_r.rubro,
                                        i_r.fecha_registro
                                    }).OrderBy(x => x.codigo_rubro).ToList();

                    if (inf_user.Count == 0)
                    {
                        gv_rubros.DataSource = inf_user;
                        gv_rubros.DataBind();
                        gv_rubros.Visible = true;

                        Mensaje("Rubro no encontrado.");
                    }
                    else
                    {
                        gv_rubros.DataSource = inf_user;
                        gv_rubros.DataBind();
                        gv_rubros.Visible = true;
                    }
                }
                rfv_eti_rub.Enabled = true;
                rfv_desc_rubro.Enabled = true;
                rfv_s_tipo_rubro.Enabled = true;
                rfv_mont_rubro.Enabled = true;
                rfv_minimo_rubro.Enabled = true;
                rfv_maximo_rubro.Enabled = true;
                rfv_pextra_rubro.Enabled = false;
            }
        }

        private void limpia_txt_rubros()
        {
            s_tipo_rubro.Items.Clear();
            using (lab_liecEntities m_genero = new lab_liecEntities())
            {
                var i_genero = (from f_tr in m_genero.fact_tipo_rubro
                                select f_tr).ToList();

                s_tipo_rubro.DataSource = i_genero;
                s_tipo_rubro.DataTextField = "desc_tipo_rubro";
                s_tipo_rubro.DataValueField = "id_tipo_rubro";
                s_tipo_rubro.DataBind();
            }
            s_tipo_rubro.Items.Insert(0, new ListItem("SELECCIONAR", "0"));

            desc_rubro.Text = null;
            mont_rubro.Text = null;
            minimo_rubro.Text = null;
            maximo_rubro.Text = null;
            monto_extra.Text = null;
            monto_gastado.Text = null;
            eti_rub.Text = null;
        }

        #endregion rubro
    }
}