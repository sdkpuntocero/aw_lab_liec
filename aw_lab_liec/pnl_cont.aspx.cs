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
    public partial class pnl_cont : System.Web.UI.Page
    {
        static private int acc_rubro, acc_gasto, int_pnlID;
        static private Guid guid_emp;
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
                    string query = "SELECT etiqueta_rubro,rubro,codigo_rubro FROM [lab_liec].[dbo].[inf_rubro]  WHERE etiqueta_rubro LIKE '" + d_rub + "%' ";
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
                    string query = "SELECT etiqueta_rubro,rubro,codigo_rubro FROM [lab_liec].[dbo].[inf_rubro]  WHERE etiqueta_rubro LIKE '" + f_rub + "%' ";
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

        #region rubro

        protected void lkb_cont_rub_Click(object sender, EventArgs e)
        {
            acc_rubro = 0;
            int_pnlID = 3;


            pnl_gasto.Visible = false;
            up_gasto.Update();

            pnl_rubro.Visible = true;
            div_busc_rub.Visible = false;
            i_agr_rubro.Attributes["style"] = "color:white";
            i_edit_rubro.Attributes["style"] = "color:white";
            gv_rubro.Visible = false;
            limpia_txt_rubro();
            up_rubro.Update();
        }

        protected void btn_agr_rubro_Click(object sender, EventArgs e)
        {
            acc_rubro = 1;

            div_busc_rub.Visible = false;

            gv_rubro.Visible = false;

            monto_extra.Enabled = false;

            limpia_txt_rubro();

            i_agr_rubro.Attributes["style"] = "color:#E34C0E";
            i_edit_rubro.Attributes["style"] = "color:white";

            rfv_eti_rub.Enabled = true;
            rfv_desc_rubro.Enabled = true;
            rfv_tipo_rubro.Enabled = true;
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

            limpia_txt_rubro();

            i_agr_rubro.Attributes["style"] = "color:white";
            i_edit_rubro.Attributes["style"] = "color:#E34C0E";
        }

        protected void chkb_des_rubro_CheckedChanged(object sender, EventArgs e)
        {
            acc_rubro = 0;
            rfv_eti_rub.Enabled = false;
            rfv_desc_rubro.Enabled = false;
            rfv_tipo_rubro.Enabled = false;
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

        protected void btn_guardar_rubro_Click(object sender, EventArgs e)
        {
            int t_rub, min_rub = 0, max_rub = 0;
            string s_eti_rub, s_desc_rub, str_cod_rub;
            decimal d_mont_fijo, d_mont_ext, dbl_pextra;
            Guid guid_nrubro, guid_nrubrom, guid_emp;

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
                    foreach (GridViewRow row in gv_rubro.Rows)
                    {
                        // int key = (int)GridView1.DataKeys[row.RowIndex].Value;
                        if (row.RowType == DataControlRowType.DataRow)
                        {
                            CheckBox chkRow = (row.Cells[0].FindControl("chk_rubro") as CheckBox);
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
                        guid_nrubrom = Guid.NewGuid();

                        t_rub = int.Parse(ddl_tipo_rubro.SelectedValue);
                        s_eti_rub = eti_rub.Text.Trim().ToUpper();
                        s_desc_rub = desc_rubro.Text.Trim().ToUpper();
                        min_rub = int.Parse(minimo_rubro.Text);
                        max_rub = int.Parse(maximo_rubro.Text);
                        d_mont_fijo = decimal.Parse(mont_rubro.Text.Replace("$", ""));


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
                                d_mont_ext = decimal.Parse(monto_extra.Text.Replace("$", ""));
                            }

                            Guid guid_idrubro;
                            int int_ddl, int_f_rub = 0;

                            foreach (GridViewRow row in gv_rubro.Rows)
                            {
                                // int key = (int)GridView1.DataKeys[row.RowIndex].Value;
                                if (row.RowType == DataControlRowType.DataRow)
                                {
                                    CheckBox chkRow = (row.Cells[0].FindControl("chk_rubro") as CheckBox);
                                    if (chkRow.Checked)
                                    {
                                        int_f_rub = int_f_rub + 1;
                                        f_rub = row.Cells[1].Text;

                                        DropDownList dl = (DropDownList)row.FindControl("ddl_rub_est");

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
                                d_mont_ext = 0;
                            }
                            else
                            {
                                d_mont_ext = decimal.Parse(monto_extra.Text);
                            }

                            using (var m_nrubro = new lab_liecEntities())
                            {
                                var i_nrubro = (from c in m_nrubro.inf_rubro
                                                where c.id_rubro == guid_idrubro
                                                select c).FirstOrDefault();

                                i_nrubro.id_est_rub = int_estatusID;
                                i_nrubro.id_tipo_rubro = t_rub;
                                i_nrubro.etiqueta_rubro = s_eti_rub;
                                i_nrubro.rubro = s_desc_rub;

                                m_nrubro.SaveChanges();

                                var i_nrubrom = (from c in m_nrubro.inf_rubro_mes
                                                 where c.id_rubro == guid_idrubro
                                                 select c).FirstOrDefault();

                                DateTime f_rubrom = DateTime.Parse(i_nrubrom.fecha_registro.ToString());
                                DateTime f_actua = DateTime.Now;

                                if (f_rubrom.Month == f_actua.Month)
                                {
                                    i_nrubrom.monto_fijo = d_mont_fijo;
                                    i_nrubrom.monto_extra = d_mont_ext;
                                    i_nrubrom.minimo = min_rub;
                                    i_nrubrom.maximo = max_rub;

                                    m_nrubro.SaveChanges();
                                }
                                else
                                {
                                    i_nrubrom.id_est_rubm = 2;
                                    m_nrubro.SaveChanges();

                                    var i_nrubm = new inf_rubro_mes
                                    {
                                        id_rubro_mes = guid_nrubrom,
                                        id_est_rubm = 1,
                                        monto_fijo = d_mont_fijo,
                                        minimo = min_rub,
                                        maximo = max_rub,
                                        monto_extra = 0,
                                        fecha_registro = DateTime.Now,
                                        id_rubro = guid_idrubro
                                    };

                                    m_nrubro.inf_rubro_mes.Add(i_nrubm);
                                    m_nrubro.SaveChanges();

                                }

                            }

                            limpia_txt_rubro();

                            rfv_eti_rub.Enabled = false;
                            rfv_desc_rubro.Enabled = false;
                            rfv_tipo_rubro.Enabled = false;
                            rfv_mont_rubro.Enabled = false;
                            rfv_minimo_rubro.Enabled = false;
                            rfv_maximo_rubro.Enabled = false;
                            rfv_pextra_rubro.Enabled = false;
                            gv_rubro.Visible = false;
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
                    guid_nrubrom = Guid.NewGuid();
                    guid_emp = Guid.Parse("D8A03556-6791-45F3-BABE-ECF267B865F1");
                    t_rub = int.Parse(ddl_tipo_rubro.SelectedValue);
                    s_eti_rub = eti_rub.Text.Trim().ToUpper();
                    s_desc_rub = desc_rubro.Text.Trim().ToUpper();
                    min_rub = int.Parse(minimo_rubro.Text);
                    max_rub = int.Parse(maximo_rubro.Text);
                    d_mont_fijo = decimal.Parse(mont_rubro.Text.Replace("$", ""));


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
                            d_mont_ext = decimal.Parse(monto_extra.Text.Replace("$", ""));
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
                                    str_cod_rub = "LIEC-R" + string.Format("{0:000}", c_rub.Count + 1);

                                    var i_nrub = new inf_rubro
                                    {
                                        id_rubro = guid_nrubro,
                                        id_est_rub = 1,
                                        codigo_rubro = str_cod_rub,
                                        id_tipo_rubro = t_rub,
                                        etiqueta_rubro = s_eti_rub,
                                        rubro = s_desc_rub,
                                        fecha_registro = DateTime.Now,
                                        id_emp = guid_emp
                                    };

                                    edm_rub.inf_rubro.Add(i_nrub);
                                    edm_rub.SaveChanges();

                                    var i_nrubm = new inf_rubro_mes
                                    {
                                        id_rubro_mes = guid_nrubrom,
                                        id_est_rubm = 1,
                                        monto_fijo = d_mont_fijo,
                                        minimo = min_rub,
                                        maximo = max_rub,
                                        monto_extra = 0,
                                        fecha_registro = DateTime.Now,
                                        id_rubro = guid_nrubro
                                    };

                                    edm_rub.inf_rubro_mes.Add(i_nrubm);
                                    edm_rub.SaveChanges();

                                    limpia_txt_rubro();
                                    Mensaje("Datos agregados con éxito.");
                                }
                                else
                                {
                                    str_cod_rub = "LIEC-R" + string.Format("{0:000}", c_rub.Count + 1);


                                    var i_nrub = new inf_rubro
                                    {
                                        id_rubro = guid_nrubro,
                                        id_est_rub = 1,
                                        codigo_rubro = str_cod_rub,
                                        id_tipo_rubro = t_rub,
                                        etiqueta_rubro = s_eti_rub,
                                        rubro = s_desc_rub,
                                        fecha_registro = DateTime.Now,
                                        id_emp = guid_emp
                                    };

                                    edm_rub.inf_rubro.Add(i_nrub);
                                    edm_rub.SaveChanges();

                                    var i_nrubm = new inf_rubro_mes
                                    {
                                        id_rubro_mes = guid_nrubrom,
                                        id_est_rubm = 1,
                                        monto_fijo = d_mont_fijo,
                                        minimo = min_rub,
                                        maximo = max_rub,
                                        monto_extra = 0,
                                        fecha_registro = DateTime.Now,
                                        id_rubro = guid_nrubro
                                    };

                                    edm_rub.inf_rubro_mes.Add(i_nrubm);
                                    edm_rub.SaveChanges();

                                    limpia_txt_rubro();
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
                        gv_rubro.DataSource = inf_user;
                        gv_rubro.DataBind();
                        gv_rubro.Visible = true;

                        Mensaje("Rubro no encontrado.");
                    }
                    else
                    {
                        gv_rubro.DataSource = inf_user;
                        gv_rubro.DataBind();
                        gv_rubro.Visible = true;
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
                            gv_rubro.DataSource = inf_user;
                            gv_rubro.DataBind();
                            gv_rubro.Visible = true;

                            Mensaje("Rubro no encontrado.");
                        }
                        else
                        {
                            gv_rubro.DataSource = inf_user;
                            gv_rubro.DataBind();
                            gv_rubro.Visible = true;
                        }
                    }
                }
                catch
                {
                    limpia_txt_rubro();
                    Mensaje("Rubro no encontrado.");
                }
            }
        }

        protected void gv_rubro_RowDataBound(object sender, GridViewRowEventArgs e)
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

                DropDownList DropDownList1 = (e.Row.FindControl("ddl_rub_est") as DropDownList);

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

        protected void chk_rubro_CheckedChanged(object sender, EventArgs e)
        {
            Guid guid_rub;
            string str_rub;

            foreach (GridViewRow row in gv_rubro.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chk_rubro") as CheckBox);
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

                                         }).FirstOrDefault();






                            var f_rubm = (from r in edm_rub.inf_rubro_mes
                                          where r.id_rubro == guid_rub
                                          where r.id_est_rubm == 1
                                          select new
                                          {
                                              r.monto_fijo,
                                              r.monto_extra,
                                              r.minimo,
                                              r.maximo

                                          }).FirstOrDefault();

                            ddl_tipo_rubro.SelectedValue = f_rub.id_tipo_rubro.ToString();
                            eti_rub.Text = f_rub.etiqueta_rubro;
                            desc_rubro.Text = f_rub.rubro;
                            decimal moneyvalue = decimal.Parse(f_rubm.monto_fijo.ToString());
                            string monto_rub = String.Format("{0:C}", moneyvalue);
                            mont_rubro.Text = monto_rub;
                            minimo_rubro.Text = f_rubm.minimo.ToString();
                            maximo_rubro.Text = f_rubm.maximo.ToString();
                        }
                    }
                    else
                    {
                        row.BackColor = Color.White;
                    }
                }
            }
        }

        protected void gv_rubro_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_rubro.PageIndex = e.NewPageIndex;

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
                        gv_rubro.DataSource = inf_user;
                        gv_rubro.DataBind();
                        gv_rubro.Visible = true;

                        Mensaje("Rubro no encontrado.");
                    }
                    else
                    {
                        gv_rubro.DataSource = inf_user;
                        gv_rubro.DataBind();
                        gv_rubro.Visible = true;
                    }
                }
                rfv_eti_rub.Enabled = true;
                rfv_desc_rubro.Enabled = true;
                rfv_tipo_rubro.Enabled = true;
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
                        gv_rubro.DataSource = inf_user;
                        gv_rubro.DataBind();
                        gv_rubro.Visible = true;

                        Mensaje("Rubro no encontrado.");
                    }
                    else
                    {
                        gv_rubro.DataSource = inf_user;
                        gv_rubro.DataBind();
                        gv_rubro.Visible = true;
                    }
                }
                rfv_eti_rub.Enabled = true;
                rfv_desc_rubro.Enabled = true;
                rfv_tipo_rubro.Enabled = true;
                rfv_mont_rubro.Enabled = true;
                rfv_minimo_rubro.Enabled = true;
                rfv_maximo_rubro.Enabled = true;
                rfv_pextra_rubro.Enabled = false;
            }
        }

        protected void ddl_rub_est_SelectedIndexChanged(object sender, EventArgs e)
        {

        }



        private void limpia_txt_rubro()
        {
            ddl_tipo_rubro.Items.Clear();
            using (lab_liecEntities m_genero = new lab_liecEntities())
            {
                var i_genero = (from f_tr in m_genero.fact_tipo_rubro
                                select f_tr).ToList();

                ddl_tipo_rubro.DataSource = i_genero;
                ddl_tipo_rubro.DataTextField = "desc_tipo_rubro";
                ddl_tipo_rubro.DataValueField = "id_tipo_rubro";
                ddl_tipo_rubro.DataBind();
            }
            ddl_tipo_rubro.Items.Insert(0, new ListItem("SELECCIONAR", "0"));

            desc_rubro.Text = null;
            mont_rubro.Text = null;
            minimo_rubro.Text = null;
            maximo_rubro.Text = null;
            monto_extra.Text = null;
            monto_gastado.Text = null;
            eti_rub.Text = null;
        }


        #endregion rubro

        #region gastos
        protected void lkb_cont_gast_Click(object sender, EventArgs e)
        {
            acc_gasto = 0;
            int_pnlID = 4;

            pnl_rubro.Visible = false;
            up_rubro.Update();

            pnl_gasto.Visible = true;
            div_busc_rub.Visible = false;
            i_agr_gasto.Attributes["style"] = "color:white";
            i_edit_gasto.Attributes["style"] = "color:white";
            gv_gasto.Visible = false;
            limpia_txt_gasto();
            up_gasto.Update();


        }

        private void limpia_txt_gasto()
        {
            ddl_tipo_gasto.Items.Clear();
            using (lab_liecEntities m_genero = new lab_liecEntities())
            {
                var i_genero = (from f_tr in m_genero.fact_tipo_rubro
                                select f_tr).ToList();

                ddl_tipo_gasto.DataSource = i_genero;
                ddl_tipo_gasto.DataTextField = "tipo_rubro";
                ddl_tipo_gasto.DataValueField = "id_tipo_rubro";
                ddl_tipo_gasto.DataBind();
            }
            ddl_tipo_gasto.Items.Insert(0, new ListItem("SELECCIONAR", "0"));
            ddl_eti_gasto.Items.Insert(0, new ListItem("SELECCIONAR", "0"));
            eti_rub.Text = null;
            desc_gasto.Text = null;
            mont_gasto.Text = null;

        }

        protected void btn_buscar_gasto_Click(object sender, EventArgs e)
        {
            string str_rub = txt_buscar_rub.Text.ToUpper().Trim();

            if (str_rub == "TODOS")
            {
                using (lab_liecEntities data_user = new lab_liecEntities())
                {
                    var inf_user = (from i_g in data_user.inf_gastos
                                    join t_r in data_user.fact_tipo_rubro on i_g.id_tipo_rubro equals t_r.id_tipo_rubro
                                    join i_r in data_user.inf_rubro on i_g.id_rubro equals i_r.id_rubro
                                    select new
                                    {
                                        i_g.codigo_gasto,
                                        t_r.tipo_rubro,
                                        i_r.etiqueta_rubro,
                                        i_g.desc_gasto,
                                        i_r.fecha_registro

                                    }).OrderBy(x => x.codigo_gasto).ToList();

                    if (inf_user.Count == 0)
                    {
                        gv_gasto.DataSource = inf_user;
                        gv_gasto.DataBind();
                        gv_gasto.Visible = true;

                        Mensaje("Rubro no encontrado.");
                    }
                    else
                    {
                        gv_gasto.DataSource = inf_user;
                        gv_gasto.DataBind();
                        gv_gasto.Visible = true;
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
                        var i_nclte = (from c in edm_nclte.inf_gastos
                                       where c.codigo_gasto == n_rub
                                       select c).FirstOrDefault();

                        guid_fclte = i_nclte.id_gasto;
                    }

                    using (lab_liecEntities data_user = new lab_liecEntities())
                    {

                        var inf_user = (from i_g in data_user.inf_gastos
                                        join t_r in data_user.fact_tipo_rubro on i_g.id_tipo_rubro equals t_r.id_tipo_rubro
                                        join i_r in data_user.inf_rubro on i_g.id_rubro equals i_r.id_rubro
                                        select new
                                        {
                                            i_g.codigo_gasto,
                                            t_r.tipo_rubro,
                                            i_r.etiqueta_rubro,
                                            i_g.desc_gasto,
                                            i_r.fecha_registro
                                        }).OrderBy(x => x.codigo_gasto).ToList();

                        if (inf_user.Count == 0)
                        {
                            gv_gasto.DataSource = inf_user;
                            gv_gasto.DataBind();
                            gv_gasto.Visible = true;

                            Mensaje("Rubro no encontrado.");
                        }
                        else
                        {
                            gv_gasto.DataSource = inf_user;
                            gv_gasto.DataBind();
                            gv_gasto.Visible = true;
                        }
                    }
                }
                catch
                {
                    limpia_txt_gasto();
                    Mensaje("Rubro no encontrado.");
                }
            }
        }

        protected void btn_agr_gasto_Click(object sender, EventArgs e)
        {
            acc_gasto = 1;

            div_busc_rub.Visible = false;

            gv_gasto.Visible = false;

            monto_extra.Enabled = false;

            limpia_txt_gasto();

            i_agr_gasto.Attributes["style"] = "color:#E34C0E";
            i_edit_gasto.Attributes["style"] = "color:white";

            rfv_eti_gasto.Enabled = true;
            rfv_desc_gasto.Enabled = true;
            rfv_tipo_gasto.Enabled = true;
            rfv_mont_gasto.Enabled = true;

        }

        protected void btn_edit_gasto_Click(object sender, EventArgs e)
        {
            acc_gasto = 2;

            div_busc_rub.Visible = true;
            rfv_buscar_rub.Enabled = true;
            monto_extra.Enabled = false;

            limpia_txt_gasto();

            i_agr_gasto.Attributes["style"] = "color:white";
            i_edit_gasto.Attributes["style"] = "color:#E34C0E";
        }

        protected void chkb_des_gasto_CheckedChanged(object sender, EventArgs e)
        {
            acc_gasto = 0;
            rfv_eti_gasto.Enabled = false;
            rfv_desc_gasto.Enabled = false;
            rfv_tipo_gasto.Enabled = false;
            rfv_mont_gasto.Enabled = false;

            rfv_buscar_rub.Enabled = false;
        }

        protected void gv_gasto_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gv_gasto_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string str_clteID = e.Row.Cells[1].Text;
                int int_estatusID;

                using (lab_liecEntities data_clte = new lab_liecEntities())
                {
                    var i_clte = (from t_clte in data_clte.inf_gastos
                                  where t_clte.codigo_gasto == str_clteID
                                  select new
                                  {
                                      t_clte.id_est_gast,
                                  }).FirstOrDefault();

                    int_estatusID = int.Parse(i_clte.id_est_gast.ToString());
                }

                DropDownList DropDownList1 = (e.Row.FindControl("ddl_gasto_est") as DropDownList);

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

        protected void chk_gasto_CheckedChanged(object sender, EventArgs e)
        {
            Guid guid_rub;
            string str_rub;

            foreach (GridViewRow row in gv_gasto.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chk_gasto") as CheckBox);
                    if (chkRow.Checked)
                    {
                        row.BackColor = Color.FromArgb(227, 76, 14);
                        str_rub = row.Cells[1].Text;

                        using (lab_liecEntities edm_rub = new lab_liecEntities())
                        {
                            var i_rub = (from c in edm_rub.inf_gastos
                                         where c.codigo_gasto == str_rub
                                         select c).FirstOrDefault();

                            guid_rub = i_rub.id_gasto;

                            var f_rub = (from r in edm_rub.inf_gastos
                                         where r.id_gasto == guid_rub
                                         select new
                                         {
                                             r.id_tipo_rubro,
                                             r.id_rubro,
                                             r.desc_gasto,
                                             r.monto

                                         }).FirstOrDefault();


                            ddl_tipo_gasto.SelectedValue = f_rub.id_tipo_rubro.ToString();
                            //eti_rub.Text = f_rub.etiqueta_gasto;
                            desc_gasto.Text = f_rub.desc_gasto;
                            decimal moneyvalue = decimal.Parse(f_rub.monto.ToString());
                            string monto_rub = String.Format("{0:C}", moneyvalue);
                            mont_gasto.Text = monto_rub;

                        }
                    }
                    else
                    {
                        row.BackColor = Color.White;
                    }
                }
            }
        }

        protected void ddl_gasto_est_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddl_tipo_gasto_SelectedIndexChanged(object sender, EventArgs e)
        {
            int int_tg = int.Parse(ddl_tipo_gasto.SelectedValue);
            ddl_eti_gasto.Items.Clear();
            using (lab_liecEntities m_genero = new lab_liecEntities())
            {
                var i_genero = (from f_tr in m_genero.inf_rubro
                                where f_tr.id_tipo_rubro == int_tg
                                select f_tr).ToList();

                ddl_eti_gasto.DataSource = i_genero;
                ddl_eti_gasto.DataTextField = "etiqueta_rubro";
                ddl_eti_gasto.DataValueField = "id_rubro";
                ddl_eti_gasto.DataBind();
            }
            ddl_eti_gasto.Items.Insert(0, new ListItem("SELECCIONAR", "0"));
        }

        protected void mont_gasto_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(mont_gasto.Text))
            {
                rfv_mont_gasto.Enabled = true;
            }
            else
            {
                string stringTest = mont_gasto.Text.Trim().Replace("$", "").Replace(",", "");

                try
                {
                    decimal moneyvalue = decimal.Parse(stringTest);
                    string html = String.Format("{0:C}", moneyvalue);

                    mont_gasto.Text = html;
                    mont_gasto.Focus();
                }
                catch
                {
                    mont_gasto.Text = null;
                }
            }
        }

        protected void btn_guardar_gasto_Click(object sender, EventArgs e)
        {
            int t_gasto, min_gasto = 0, max_gasto = 0;
            string eti_gasto, s_desc_gasto, str_cod_gasto;
            double d_mont_fijo, monto_f;
            Guid guid_nrubro, guid_nrubrom, guid_rubf, guid_emp;
            DateTime f_filtro = DateTime.Now;

            if (acc_gasto == 0)
            {
                Mensaje("Favor de seleccionar una acción");
            }
            else
            {
                if (acc_gasto == 2)
                {
                    //int int_estatusID = 0;
                    //string f_gasto = null;
                    //foreach (GridViewRow row in gv_gasto.Rows)
                    //{
                    //    // int key = (int)GridView1.DataKeys[row.RowIndex].Value;
                    //    if (row.RowType == DataControlRowType.DataRow)
                    //    {
                    //        CheckBox chkRow = (row.Cells[0].FindControl("chk_gasto") as CheckBox);
                    //        if (chkRow.Checked)
                    //        {
                    //            int_estatusID = int_estatusID + 1;
                    //            break;
                    //        }
                    //        else
                    //        {
                    //            int_estatusID = 0;
                    //        }
                    //    }
                    //}

                    //if (int_estatusID >= 1)
                    //{
                    //    guid_nrubro = Guid.NewGuid();
                    //    Guid guid_idrubro;
                    //    int int_ddl, int_f_gasto = 0;

                    //    foreach (GridViewRow row in gv_gasto.Rows)
                    //    {
                    //        // int key = (int)GridView1.DataKeys[row.RowIndex].Value;
                    //        if (row.RowType == DataControlRowType.DataRow)
                    //        {
                    //            CheckBox chkRow = (row.Cells[0].FindControl("chk_gasto") as CheckBox);
                    //            if (chkRow.Checked)
                    //            {
                    //                int_f_gasto = int_f_gasto + 1;
                    //                f_gasto = row.Cells[1].Text;

                    //                DropDownList dl = (DropDownList)row.FindControl("ddl_gasto_est");

                    //                int_ddl = int.Parse(dl.SelectedValue);
                    //                if (int_ddl == 1)
                    //                {
                    //                    int_estatusID = 1;
                    //                    break;
                    //                }
                    //                else if (int_ddl == 2)
                    //                {
                    //                    int_estatusID = 2;
                    //                    break;
                    //                }
                    //                break;
                    //            }
                    //        }
                    //    }
                    //    using (lab_liecEntities data_user = new lab_liecEntities())
                    //    {
                    //        var items_user = (from c in data_user.inf_gastos
                    //                          where c.codigo_gasto == f_gasto
                    //                          select c).FirstOrDefault();

                    //        guid_idrubro = items_user.id_gasto;
                    //    }


                    //    using (var m_nrubro = new lab_liecEntities())
                    //    {
                    //        var i_nrubro = (from c in m_nrubro.inf_gastos
                    //                        where c.id_gasto == guid_idrubro
                    //                        select c).FirstOrDefault();

                    //        i_nrubro.id_est_gasto = int_estatusID;
                    //        i_nrubro.id_tipo_gasto = t_gasto;
                    //        i_nrubro.etiqueta_gasto = s_eti_gasto;
                    //        i_nrubro.rubro = s_desc_gasto;

                    //        m_nrubro.SaveChanges();

                    //        var i_nrubrom = (from c in m_nrubro.inf_gasto_mes
                    //                         where c.id_gasto == guid_idrubro
                    //                         select c).FirstOrDefault();

                    //        DateTime f_gastom = DateTime.Parse(i_nrubrom.fecha_registro.ToString());
                    //        DateTime f_actua = DateTime.Now;

                    //        if (f_gastom.Month == f_actua.Month)
                    //        {
                    //            i_nrubrom.monto_fijo = d_mont_fijo;
                    //            i_nrubrom.monto_extra = d_mont_ext;
                    //            i_nrubrom.minimo = min_gasto;
                    //            i_nrubrom.maximo = max_gasto;

                    //            m_nrubro.SaveChanges();
                    //        }
                    //        else
                    //        {
                    //            i_nrubrom.id_est_gastom = 2;
                    //            m_nrubro.SaveChanges();

                    //            var i_nrubm = new inf_gasto_mes
                    //            {
                    //                id_gasto_mes = guid_nrubrom,
                    //                id_est_gastom = 1,
                    //                monto_fijo = d_mont_fijo,
                    //                minimo = min_gasto,
                    //                maximo = max_gasto,
                    //                monto_extra = 0,
                    //                fecha_registro = DateTime.Now,
                    //                id_gasto = guid_idrubro
                    //            };

                    //            m_nrubro.inf_gasto_mes.Add(i_nrubm);
                    //            m_nrubro.SaveChanges();

                    //        }

                    //    }

                    //    limpia_txt_gasto();

                    //    rfv_eti_gasto.Enabled = false;
                    //    rfv_desc_gasto.Enabled = false;
                    //    rfv_tipo_gasto.Enabled = false;
                    //    rfv_mont_gasto.Enabled = false;

                    //    gv_gasto.Visible = false;
                    //    Mensaje("Datos actualizados con éxito.");
                    //}
                    //else
                    //{
                    //    Mensaje("Favor de seleccionar una un rubro");

                    //}
                }
                else
                {
                    guid_nrubro = Guid.NewGuid();
                    guid_nrubrom = Guid.NewGuid();
                    guid_emp = Guid.Parse("D8A03556-6791-45F3-BABE-ECF267B865F1");
                    t_gasto = int.Parse(ddl_tipo_gasto.SelectedValue);
                    guid_rubf = Guid.Parse(ddl_eti_gasto.SelectedValue);
                    s_desc_gasto = desc_gasto.Text.Trim().ToUpper();

                    d_mont_fijo = double.Parse(mont_gasto.Text.Replace("$", ""));

                    using (lab_liecEntities edm_gasto = new lab_liecEntities())
                    {
                        var i_gasto = (from c in edm_gasto.inf_gastos
                                       select c).ToList();

                        if (i_gasto.Count == 0)
                        {


                            var c_gasto = (from c in edm_gasto.inf_gastos
                                           select c).ToList();
                            if (c_gasto.Count == 0)
                            {
                                str_cod_gasto = "LIEC-G" + string.Format("{0:000}", c_gasto.Count + 1);

                                var i_nrub = new inf_gastos
                                {
                                    id_gasto = guid_nrubro,
                                    id_rubro = guid_rubf,
                                    id_est_gast = 1,
                                    codigo_gasto = str_cod_gasto,
                                    id_tipo_rubro = t_gasto,
                                    monto = decimal.Parse(d_mont_fijo.ToString()),
                                    desc_gasto = s_desc_gasto,
                                    fecha_registro = DateTime.Now,
                                    id_emp = guid_emp
                                };

                                edm_gasto.inf_gastos.Add(i_nrub);
                                edm_gasto.SaveChanges();

                                var i_gastos = (from i_g in edm_gasto.inf_gastos
                                                where i_g.id_tipo_rubro == t_gasto
                                                where i_g.id_rubro == guid_rubf
                                                select new
                                                {
                                                    i_g.monto,
                                                }).ToList();

                                if (i_gastos.Count == 0)
                                {
                                    monto_f = i_gastos.Count;
                                }
                                else
                                {
                                    monto_f = double.Parse(i_gastos.Sum(x => x.monto).ToString());
                                }
                                var i_rubm = (from i_g in edm_gasto.inf_rubro_mes
                                              where i_g.id_rubro == guid_rubf
                                              where i_g.id_est_rubm == 1
                                              select new
                                              {
                                                  i_g.monto_fijo,
                                                  i_g.minimo,
                                                  i_g.min,
                                                  i_g.maximo,
                                                  i_g.max,

                                              }).FirstOrDefault();

                                double m_min = (Math.Truncate(Convert.ToDouble(i_rubm.monto_fijo) * 100.0) / 100.0) * ((Math.Truncate(Convert.ToDouble(i_rubm.minimo) * 100.0) / 100.0) / 100) + 1;

                                if (monto_f >= m_min && i_rubm.min == 0)
                                {
                                    //enviar email 
                                    using (lab_liecEntities data_user = new lab_liecEntities())
                                    {
                                        var igf = (from c in data_user.inf_rubro_mes
                                                   where c.id_rubro == guid_rubf
                                                   select c).FirstOrDefault();

                                        igf.min = 1;
                                        data_user.SaveChanges();
                                    }


                                }

                                limpia_txt_gasto();
                                Mensaje("Datos agregados con éxito.");
                            }
                            else
                            {
                                str_cod_gasto = "LIEC-G" + string.Format("{0:000}", c_gasto.Count + 1);


                                var i_nrub = new inf_gastos
                                {
                                    id_gasto = guid_nrubro,
                                    id_est_gast = 1,
                                    codigo_gasto = str_cod_gasto,
                                    id_tipo_rubro = t_gasto,
                                    id_rubro = guid_rubf,
                                    desc_gasto = s_desc_gasto,
                                    fecha_registro = DateTime.Now,
                                    id_emp = guid_emp
                                };

                                edm_gasto.inf_gastos.Add(i_nrub);
                                edm_gasto.SaveChanges();




                                limpia_txt_gasto();
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

        #endregion
    }
}