<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panel_concreto.aspx.cs" Inherits="aw_lab_liec.panel_concreto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
    <!-- Bootstrap -->

    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="styles/estilos_concreto.css" rel="stylesheet" />
    <link href="Content/font-awesome.min.css" rel="stylesheet" />

    <script src="Scripts/jquery-3.3.1.min.js"></script>

    <script src="Scripts/bootstrap.min.js"></script>

    <link rel="shortcut icon" href="img/ico_liec.png" type="image/png" />
    <title>/ CONCRETO</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="page-content">
            <div class="row">
                <div class="col-lg-12">
                    <div class="sidebar content-box" style="display: block;">
                        <div class="text-right">
                            <p class="text-right">
                                <asp:Label CssClass="buttonClass" ID="lbl_bienvenida" runat="server" Text="BIENVENIDO@: "></asp:Label>
                                <asp:LinkButton CssClass="buttonClass" ID="lkb_edita_usuariof" runat="server">
                                    <asp:Label CssClass="buttonClass" ID="lbl_edita_usuariof" runat="server" Text=""></asp:Label>&nbsp;<i class="fa fa-male" id="i_edita_usuariof" runat="server"></i>
                                </asp:LinkButton>
                                <br />
                                <asp:Label CssClass="buttonClass" ID="lbl_tipousuario" runat="server" Text="PERFIL: "></asp:Label>
                                <asp:Label CssClass="buttonClass" ID="lbl_ftipousuario" runat="server" Text=""></asp:Label>
                                <br />
                                <asp:Label CssClass="buttonClass" ID="lbl_fnegocio" runat="server" Text="DESARROLLO: "></asp:Label>
                                <asp:LinkButton CssClass="buttonClass" ID="lkb_fnegocio" runat="server">
                                    <asp:Label CssClass="buttonClass" ID="lbl_ffnegocio" runat="server" Text=""></asp:Label>&nbsp;<i class="fa fa-puzzle-piece" id="i_editafnegocio" runat="server"></i>
                                </asp:LinkButton>
                                <br />
                                <asp:Label CssClass="text-info" ID="lbl_fechaactual" runat="server" Text="Fecha: "></asp:Label>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="sidebar-nav">
                        <div class="navbar-default" role="navigation">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-navbar-collapse"><span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                                <span class="visible-xs navbar-brand">Menú</span>
                            </div>
                            <div class="navbar-collapse collapse sidebar-navbar-collapse">
                                <br />
                                <div class="sidebar content-box " style="display: block;">
                                    <ul class="nav">

                                        <li>
                                            <asp:LinkButton CssClass="buttonClass" ID="lkb_cot_rt_01" runat="server" OnClick="lkb_cot_rt_01_Click">
                                                <i class="fa fa-pencil-square-o" id="i_cot_rt_01" runat="server"></i>
                                                <asp:Label CssClass="buttonClass" ID="lbl_cot_rt_01" runat="server" Text="CON-RT-01"> </asp:Label>
                                            </asp:LinkButton>
                                        </li>
                                        <li>
                                            <asp:LinkButton CssClass="buttonClass" ID="lkb_cot_rt_02" runat="server">
                                                <i class="fa fa-pencil-square-o" id="i_cot_rt_02" runat="server"></i>
                                                <asp:Label CssClass="buttonClass" ID="lbl_cot_rt_02" runat="server" Text="CON-RT-02"> </asp:Label>
                                            </asp:LinkButton>
                                        </li>
                                        <li>
                                            <asp:LinkButton CssClass="buttonClass" ID="lkb_usuarios" runat="server">
                                                <i class="fa fa-pencil-square-o" id="i_usuarios" runat="server"></i>
                                                <asp:Label CssClass="buttonClass" ID="lbl_usuarios" runat="server" Text="CON-RT-03"></asp:Label>
                                            </asp:LinkButton>
                                        </li>
                                        <li>
                                            <asp:LinkButton CssClass="buttonClass" ID="lkb_correos" runat="server">
                                                <i class="fa fa-pencil-square-o" id="i_correos" runat="server"></i>
                                                <asp:Label CssClass="buttonClass" ID="lbl_correos" runat="server" Text="CON-RT-04"> </asp:Label>
                                            </asp:LinkButton>
                                        </li>
                                        <br />
                                        <li>
                                            <asp:LinkButton CssClass="buttonClass" ID="lkb_salir" runat="server">
                                                <i class="fa fa-power-off" id="i_salir" runat="server"></i>
                                                <asp:Label CssClass="buttonClass" ID="lbl_salir" runat="server" Text="SALIR"></asp:Label>
                                            </asp:LinkButton>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!--/.nav-collapse -->
                    </div>
                </div>
                <div class="col-lg-10">
                    <div class="form-group has-error">
                        <asp:UpdatePanel ID="up_usuariof" runat="server">
                            <ContentTemplate>
                                <div class="panel panel-default" id="pnl_cot_rt_01" runat="server" visible="false">
                                    <div class="panel-heading">
                                        <h3 class="panel-title text-left">Recepción y Programación de Concreto</h3>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group text-left">
                                                    <h5>
                                                        <asp:Label CssClass="control-label " ID="Label1" runat="server" Text="*Clave Obra"></asp:Label>
                                                    </h5>
                                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Capturar Clave Obra"></asp:TextBox>
                                                    <div class="text-right">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="TextBox1" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-5">
                                                <div class="form-group text-left">
                                                    <h5>
                                                        <asp:Label CssClass="control-label" ID="Label2" runat="server" Text="Nombre de Obra"></asp:Label>
                                                    </h5>
                                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Muestra Nombre de Obra"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group text-left">
                                                    <h5>
                                                        <asp:Label CssClass="control-label" ID="Label3" runat="server" Text="Cliente"></asp:Label>
                                                    </h5>
                                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Muestra Cliente"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group text-left">
                                                    <h5>
                                                        <asp:Label CssClass="control-label" ID="Label4" runat="server" Text="*Humedad Relativa %"></asp:Label>
                                                    </h5>
                                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Capturar Humedad Relativa %"></asp:TextBox>
                                                    <div class="text-right">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="TextBox4" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">

                                                <div class="form-group text-left">
                                                    <h5>
                                                        <asp:Label CssClass="control-label" ID="Label5" runat="server" Text="*Temperatura °C"></asp:Label>
                                                    </h5>
                                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Capturar Temperatura °C"></asp:TextBox>
                                                    <div class="text-right">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="TextBox5" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group text-left">
                                                    <h5>
                                                        <asp:Label CssClass="control-label" ID="Label6" runat="server" Text="*Equipo Utilizado: Termohigrómetro"></asp:Label>
                                                    </h5>
                                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Capturar Equipo Utilizado"></asp:TextBox>
                                                    <div class="text-right">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="TextBox4" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group text-left">
                                                    <h5>
                                                        <asp:Label CssClass="control-label" ID="Label7" runat="server" Text="*No. de Muestra:"></asp:Label>
                                                    </h5>
                                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Capturar No. de Muestra:"></asp:TextBox>
                                                    <div class="text-right">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="TextBox5" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <h5 class="text-right">
                                                    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" Text="Agregar" />
                                                    <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="true" Text="Editar" />
                                                </h5>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3">
                                                <div class="form-group text-left">
                                                    <h5>
                                                        <asp:Label CssClass="control-label" ID="Label8" runat="server" Text="*Fecha de Colado"></asp:Label>
                                                    </h5>
                                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" TextMode="Date"></asp:TextBox>
                                                    <div class="text-right">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="TextBox4" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">

                                                <div class="form-group text-left">
                                                    <h5>
                                                        <asp:Label CssClass="control-label" ID="Label9" runat="server" Text="Fecha de Recepción"></asp:Label>
                                                    </h5>
                                                    <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" TextMode="Date"></asp:TextBox>
                                                    <div class="text-right">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="TextBox5" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group text-left">
                                                    <h5>
                                                        <asp:Label CssClass="control-label" ID="Label10" runat="server" Text="Entrega"></asp:Label>
                                                    </h5>
                                                    <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Capturar Nombre"></asp:TextBox>
                                                    <div class="text-right">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="TextBox4" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group text-left">
                                                    <h5>
                                                        <asp:Label CssClass="control-label" ID="Label11" runat="server" Text="Recibe"></asp:Label>
                                                    </h5>
                                                    <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Capturar Nombre"></asp:TextBox>
                                                    <div class="text-right">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="TextBox5" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3">
                                                <div class="form-group text-left">
                                                    <h5>
                                                        <asp:Label CssClass="control-label" ID="Label12" runat="server" Text="f´c = kgf/cm3"></asp:Label>
                                                    </h5>
                                                    <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" placeholder="Capturar Valor"></asp:TextBox>
                                                    <div class="text-right">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="TextBox4" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group text-left">
                                                    <h5>
                                                        <asp:Label CssClass="control-label" ID="Label13" runat="server" Text="Tipo de Especímen"></asp:Label>
                                                    </h5>
                                                    <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" AutoPostBack="true"></asp:DropDownList>
                                                    <div class="text-right">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="DropDownList1" InitialValue="0" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group text-left">
                                                    <h5>
                                                        <asp:Label CssClass="control-label" ID="Label14" runat="server" Text="Tipo de Concreto (N,RR,RT,UR)"></asp:Label>
                                                    </h5>
                                                    <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server" AutoPostBack="true"></asp:DropDownList>
                                                    <div class="text-right">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="DropDownList1" InitialValue="0" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group text-left">
                                                    <h5>
                                                        <asp:Label CssClass="control-label" ID="Label15" runat="server" Text="Situación (Documento)"></asp:Label>
                                                    </h5>
                                                    <asp:DropDownList CssClass="form-control" ID="DropDownList3" runat="server" AutoPostBack="true"></asp:DropDownList>
                                                    <div class="text-right">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="DropDownList1" InitialValue="0" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <h4 class="text-center">Programación Fechas de Ensaye</h4>
                                                <div class="col-lg-6">
                                                    <h4 class="text-center">
                                                        <asp:CheckBox ID="CheckBox3" runat="server" AutoPostBack="true" Text=" 24 Horas" />
                                                    </h4>
                                                    <div class="form-group">
                                                        <asp:TextBox CssClass="form-control" ID="TextBox13" runat="server" TextMode="Date"></asp:TextBox>
                                                        <div class="text-center">
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="TextBox4" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <h4 class="text-center">
                                                        <asp:CheckBox ID="CheckBox4" runat="server" AutoPostBack="true" Text=" 3 Días" />
                                                    </h4>
                                                    <div class="form-group">
                                                        <asp:TextBox CssClass="form-control" ID="TextBox14" runat="server" TextMode="Date"></asp:TextBox>
                                                        <div class="text-center">
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="TextBox4" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <h4 class="text-center">
                                                        <asp:CheckBox ID="CheckBox5" runat="server" AutoPostBack="true" Text=" 7 Días" />
                                                    </h4>
                                                    <div class="form-group">
                                                        <asp:TextBox CssClass="form-control" ID="TextBox15" runat="server" TextMode="Date"></asp:TextBox>
                                                        <div class="text-center">
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="TextBox4" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <h4 class="text-center">
                                                        <asp:CheckBox ID="CheckBox6" runat="server" AutoPostBack="true" Text=" 14 Días" />
                                                    </h4>
                                                    <div class="form-group">
                                                        <asp:TextBox CssClass="form-control" ID="TextBox16" runat="server" TextMode="Date"></asp:TextBox>
                                                        <div class="text-center">
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="TextBox4" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-6">
                                                    <h4 class="text-center">
                                                        <asp:CheckBox ID="CheckBox7" runat="server" AutoPostBack="true" Text=" 28 Días" />
                                                    </h4>
                                                    <div class="form-group">
                                                        <asp:TextBox CssClass="form-control" ID="TextBox17" runat="server" TextMode="Date"></asp:TextBox>
                                                        <div class="text-center">
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="TextBox4" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <h4 class="text-center">
                                                        <asp:CheckBox ID="CheckBox8" runat="server" AutoPostBack="true" Text="Otro" />
                                                    </h4>
                                                    <div class="form-group">
                                                        <asp:TextBox CssClass="form-control" ID="TextBox18" runat="server" TextMode="Date"></asp:TextBox>
                                                        <div class="text-center">
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="TextBox4" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 text-right">
                                                <h4 class="text-center">Fecha máxima para entrega de resultados</h4>
                                                <br />
                                                <br />
                                                <div class="col-lg-6 text-right">
                                                    <div class="form-group ">
                                                        <asp:TextBox CssClass="form-control" ID="TextBox19" runat="server" TextMode="Date"></asp:TextBox>
                                                        <div class="text-center">
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="TextBox4" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 text-right">

                                                <asp:CheckBox ID="chkb_estatus_gasto" runat="server" Text="Desactivar" Visible="false" />
                                                <asp:Button CssClass="btn" ID="btn_guardar_gasto" runat="server" Text="GUARDAR" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title">
                                    <asp:Label ID="lblModalTitle" runat="server" Text=""></asp:Label>
                                </h4>
                            </div>
                            <div class="modal-body">
                                <asp:Label ID="lblModalBody" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="modal-footer">
                                <button class="btn" data-dismiss="modal" aria-hidden="true">Ok</button>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </form>
</body>
</html>