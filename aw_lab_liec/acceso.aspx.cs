using System;
using System.DirectoryServices;
using System.DirectoryServices.AccountManagement;
using System.Web.UI;

namespace aw_lab_liec
{
    public partial class acceso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btn_acceso_Click(object sender, EventArgs e)
        {
            string dominio, user, pass;

            dominio = "192.168.1.253";
            user = txt_usuario.Text;
            pass = txt_clave.Text;

            if (usuario_AD(user, pass, dominio) == true)
            {
                using (var context = new PrincipalContext(ContextType.Domain, dominio, user, pass))
                {
                    using (var searcher = new PrincipalSearcher(new UserPrincipal(context)))
                    {
                        foreach (var result in searcher.FindAll())
                        {
                            DirectoryEntry de = result.GetUnderlyingObject() as DirectoryEntry;
                            if ((string)de.Properties["givenName"].Value == user)
                            {
                                string nameAD = de.Properties["givenName"].Value.ToString();
                                string displayAD = de.Properties["displayName"].Value.ToString();

                                Session["s_usuario"] = displayAD;

                                Response.Redirect("panel_cliente.aspx");
                                PropertyCollection pc = de.Properties;
                                foreach (PropertyValueCollection col in pc)
                                {
                                }
                            }
                        }
                    }
                }
            }
            else
            {
                Mensaje("Error al Autenticar");
            }
        }

        private bool usuario_AD(string user, string pass, string dominio)
        {
            PrincipalContext ValidarLAC = new PrincipalContext(ContextType.Domain, dominio);

            return ValidarLAC.ValidateCredentials(user, pass);
        }

        private void Mensaje(string contenido)
        {
            lblModalTitle.Text = "LIEC";
            lblModalBody.Text = contenido;
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
            upModal.Update();
        }
    }
}