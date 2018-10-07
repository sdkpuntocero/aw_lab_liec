using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace aw_lab_liec
{
    public partial class pnl_ctrl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region menu
        protected void lkb_arqu_Click(object sender, EventArgs e)
        {

        }

        protected void lkb_cali_Click(object sender, EventArgs e)
        {

        }

        protected void lkb_capt_Click(object sender, EventArgs e)
        {
            pnl_desa_tec.Visible = false;
            pnl_desa_tec.Focus();
            up_desa_tec.Update();

            pnl_cont.Visible = false;
            pnl_cont.Focus();
            up_cont.Update();

            pnl_recu_hum.Visible = false;
            pnl_recu_hum.Focus();
            up_recu_hum.Update();

            pnl_capt.Visible = true;
            pnl_capt.Focus();
            up_capt.Update();
        }

        protected void lkb_cobr_Click(object sender, EventArgs e)
        {

        }

        protected void lkb_cont_Click(object sender, EventArgs e)
        {
            pnl_recu_hum.Visible = false;
            pnl_recu_hum.Focus();
            up_recu_hum.Update();

            pnl_cont.Visible = true;
            pnl_cont.Focus();
            up_cont.Update();

            pnl_desa_tec.Visible = false;
            pnl_desa_tec.Focus();
            up_desa_tec.Update();

            pnl_capt.Visible = false;
            pnl_capt.Focus();
            up_capt.Update();
        }

        protected void lkb_coor_labcent_Click(object sender, EventArgs e)
        {

        }

        protected void lkb_desa_tec_Click(object sender, EventArgs e)
        {
            pnl_recu_hum.Visible = false;
            pnl_recu_hum.Focus();
            up_recu_hum.Update();

            pnl_cont.Visible = false;
            pnl_cont.Focus();
            up_cont.Update();

            pnl_desa_tec.Visible = true;
            pnl_desa_tec.Focus();
            up_desa_tec.Update();

            pnl_capt.Visible = false;
            pnl_capt.Focus();
            up_capt.Update();
        }

        protected void lkb_desa_neg_Click(object sender, EventArgs e)
        {

        }

        protected void lkb_estr_Click(object sender, EventArgs e)
        {

        }

        protected void lkb_gere_adm_Click(object sender, EventArgs e)
        {

        }

        protected void lkb_gere_cal_Click(object sender, EventArgs e)
        {

        }

        protected void lkb_gere_gen_Click(object sender, EventArgs e)
        {

        }

        protected void lkb_gere_tec_Click(object sender, EventArgs e)
        {

        }

        protected void lkb_mant_Click(object sender, EventArgs e)
        {

        }

        protected void lkb_meca_sue_Click(object sender, EventArgs e)
        {

        }

        protected void lkb_pers_obra_Click(object sender, EventArgs e)
        {

        }

        protected void lkb_recep_Click(object sender, EventArgs e)
        {

        }

        protected void lkb_recu_hum_Click(object sender, EventArgs e)
        {
            pnl_desa_tec.Visible = false;
            pnl_desa_tec.Focus();
            up_desa_tec.Update();

            pnl_cont.Visible = false;
            pnl_cont.Focus();
            up_cont.Update();

            pnl_recu_hum.Visible = true;
            pnl_recu_hum.Focus();
            up_recu_hum.Update();

            pnl_capt.Visible = false;
            pnl_capt.Focus();
            up_capt.Update();

        }

        protected void lkb_supe_Click(object sender, EventArgs e)
        {

        }

        protected void lkb_salir_Click(object sender, EventArgs e)
        {

        }
        #endregion

        protected void lkb_recu_hum_i_Click(object sender, EventArgs e)
        {
            Response.Redirect("panel_recu_hum.aspx");
        }

        protected void lkb_cont_i_Click(object sender, EventArgs e)
        {
            Response.Redirect("panel_cont.aspx");
        }

        protected void lkb_desa_tec_i_Click(object sender, EventArgs e)
        {
            Response.Redirect("panel_desa_tec.aspx");
        }

        protected void lkb_capt_i_Click(object sender, EventArgs e)
        {
            Response.Redirect("panel_capt.aspx");
        }
    }
}