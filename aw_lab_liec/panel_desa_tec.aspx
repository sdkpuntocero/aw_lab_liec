<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panel_desa_tec.aspx.cs" Inherits="aw_lab_liec.panel_desa_tec" %>

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
    <link href="styles/estilos_liec.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/dist/jquery.maskMoney.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>

    <link rel="shortcut icon" href="img/ico_liec.png" type="image/png" />
    <title>/ DESARROLLO DE TECNOLOGÍA</title>
</head>
<body>
    <script>
        function CheckOne(obj) {
            var grid = obj.parentNode.parentNode.parentNode;
            var inputs = grid.getElementsByTagName("input");
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].type == "checkbox") {
                    if (obj.checked && inputs[i] != obj && inputs[i].checked) {
                        inputs[i].checked = false;
                    }
                }
            }
        }
    </script>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container">
            <asp:UpdatePanel ID="up_gastos_bienvenida" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <br />
                    <div class="row">

                        <div class="col-lg-6">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/img/ico_liec.png" Width="64" Height="64" CssClass="img-thumbnail" />
                        </div>

                        <div class="col-lg-6">
                            <div>
                                <p class="text-right">

                                    <label class="control-label fuente_css02 fuente_css02">BIENVENID@:</label>
                                    <asp:LinkButton CssClass="buttonClass" ID="lkb_edita_usuariof" runat="server">
                                        <asp:Label CssClass="buttonClass" ID="lbl_edita_usuariof" runat="server" Text=""></asp:Label>&nbsp;<i class="fa fa-male" id="i_edita_usuariof" runat="server"></i>
                                    </asp:LinkButton>

                                    <br />

                                    <label class="control-label fuente_css02 fuente_css02">PERFIL:</label>
                                    <asp:Label CssClass="buttonClass" ID="lbl_ftipousuario" runat="server" Text=""></asp:Label>

                                    <br />

                                    <label class="control-label fuente_css02 fuente_css02">EMPRESA:</label>
                                    <asp:LinkButton CssClass="buttonClass" ID="lkb_fnegocio" runat="server">
                                        <asp:Label CssClass="buttonClass" ID="lbl_ffnegocio" runat="server" Text=""></asp:Label>&nbsp;<i class="fa fa-puzzle-piece" id="i_editafnegocio" runat="server"></i>
                                    </asp:LinkButton>
                                </p>
                            </div>
                        </div>
                    </div>
                    <hr />
                </ContentTemplate>
                <Triggers>
                </Triggers>
            </asp:UpdatePanel>

            <div class="row">
                <asp:UpdatePanel ID="up_gastos_menu" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-3">
                            <div class="sidebar-nav">
                                <div class="navbar-default" role="navigation">
                                    <div class="navbar-header">
                                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-navbar-collapse"><span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                                        <span class="visible-xs navbar-brand">Menú</span>
                                    </div>
                                    <div class="navbar-collapse collapse sidebar-navbar-collapse">
                                        <br />
                                        <div class="sidebar" style="display: block;">
                                            <ul class="nav">
                                                <li>
                                                    <asp:LinkButton CssClass="fuente_css02" ID="lkb_areas" runat="server" OnClick="lkb_areas_Click">
                                                        <i class="fas fa-braille" id="i_areas" runat="server"></i>
                                                        <asp:Label CssClass="buttonClass" ID="lbl_areas" runat="server" Text="ÁREAS"> </asp:Label>
                                                    </asp:LinkButton>
                                                </li>
                                                <li>
                                                    <asp:LinkButton CssClass="fuente_css02" ID="lkb_e_env" runat="server" OnClick="lkb_e_env_Click">
                                                        <i class="far fa-envelope" id="i_e_envio" runat="server"></i>
                                                        <asp:Label CssClass="buttonClass" ID="lbl_e_envio" runat="server" Text="CORREO ENVÍO"></asp:Label>
                                                    </asp:LinkButton>
                                                </li>
                                                <li>
                                                    <asp:LinkButton CssClass="fuente_css02" ID="lkb_e_rec" runat="server" OnClick="lkb_e_rec_Click">

                                                        <i class="fas fa-mail-bulk" id="i_e_rec" runat="server"></i>
                                                        <asp:Label CssClass="buttonClass" ID="lbl_e_rec" runat="server" Text="CORREO RECEPCIÓN"></asp:Label>
                                                    </asp:LinkButton>
                                                </li>
                                                <br />
                                                <li>
                                                    <asp:LinkButton CssClass="fuente_css02" ID="lkb_salir" runat="server">
                                                        <i class="fas fa-power-off" id="i_salir" runat="server"></i>
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
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="up_areas" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-9">
                            <div class="col-lg-12 ">
                                <div class="panel panel-default" id="pnl_areas" runat="server" visible="false">
                                    <div class="panel-heading">
                                        <p class="text-left">
                                            <div class="input-group" id="div_busc_clt" runat="server" visible="false">
                                                <span class="input-group-addon">
                                                    <asp:Label CssClass="control-label fuente_css02" ID="lbl_buscar_areas" runat="server" Text="*BUSCAR ÁREA:"></asp:Label>
                                                </span>
                                                <asp:TextBox CssClass="form-control input-box" ID="txt_buscar_areas" runat="server" placeholder="letras/números" TextMode="Search" TabIndex="3"></asp:TextBox>
                                                <span class="input-group-btn">
                                                    <asp:Button CssClass="btn btn01" ID="btn_buscar_areas" runat="server" Text="ACEPTAR" TabIndex="4" OnClick="btn_buscar_areas_Click" />
                                                </span>
                                            </div>
                                            <div class="text-right">
                                                <ajaxToolkit:AutoCompleteExtender ID="ace_buscar_areas" runat="server" ServiceMethod="SearchCustomers" MinimumPrefixLength="2" CompletionInterval="100" EnableCaching="true" CompletionSetCount="10" TargetControlID="txt_buscar_areas" FirstRowSelected="false"></ajaxToolkit:AutoCompleteExtender>
                                                <asp:RequiredFieldValidator ID="rfv_buscar_areas" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_buscar_areas" ForeColor="white" Enabled="false"></asp:RequiredFieldValidator>
                                            </div>
                                        </p>
                                        <p class="text-right">
                                            REGISTRO DE ÁREAS

                                        <span>
                                            <asp:LinkButton CssClass="btn btn02" ID="btn_agregar_areas" runat="server" ToolTip="AGREGAR ÁREA" TabIndex="1" OnClick="btn_agregar_areas_Click">
                                                <i class="fas fa-plus" id="i_agregar_areas" runat="server"></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton CssClass="btn btn02" ID="btn_editar_areas" runat="server" ToolTip="EDITAR ÁREA" TabIndex="2" OnClick="btn_editar_areas_Click">
                                                <i class="far fa-edit" id="i_editar_areas" runat="server"></i>
                                            </asp:LinkButton>
                                        </span>
                                            <br />
                                            <asp:CheckBox ID="chkb_desactivar_areas" runat="server" AutoPostBack="true" Text="Desactivar validaciones" OnCheckedChanged="chkb_desactivar_areas_CheckedChanged" />
                                        </p>
                                    </div>
                                    <div class="panel-body">

                                        <div class="col-lg-12">
                                            <asp:GridView CssClass="table" ID="gv_areas" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="5" OnRowDataBound="gv_areas_RowDataBound" OnPageIndexChanging="gv_areas_PageIndexChanging">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chk_areas" runat="server" onclick="CheckOne(this)" AutoPostBack="true" OnCheckedChanged="chk_areas_CheckedChanged" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="cod_area" HeaderText="ID" SortExpression="cod_area" Visible="true" />
                                                    <asp:BoundField DataField="desc_areas" HeaderText="ÁREA" SortExpression="desc_areas" />
                                                    <asp:BoundField DataField="fecha_registro" HeaderText="REGISTRO" SortExpression="fecha_registro" DataFormatString="{0:dd-MM-yyyy}" />
                                                    <asp:TemplateField HeaderText="ESTATUS">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="ddl_area_estatus" runat="server" AutoPostBack="true">
                                                            </asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EditRowStyle BackColor="#999999" />
                                                <FooterStyle BackColor="#5D7B9D" ForeColor="White" />
                                                <HeaderStyle BackColor="#104D8d" ForeColor="White" />
                                                <PagerSettings Mode="NumericFirstLast" FirstPageText="Inicio" LastPageText="Final" />
                                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                            </asp:GridView>
                                            <br />
                                        </div>
                                        <div class="col-lg-10">

                                            <asp:Label CssClass="control-label fuente_css02" ID="lbl_areas_coment" runat="server" Text="Área"></asp:Label>

                                            <asp:TextBox CssClass="form-control input-box" ID="txt_areas_coment" runat="server" placeholder="letras/números" TextMode="MultiLine" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                            <div class="text-right">
                                                <asp:RequiredFieldValidator ID="rfv_areas_coment" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_areas_coment" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="col-lg-2">
                                            <br />
                                            <br />
                                            <div class="text-right">
                                                <asp:Button CssClass="btn btn02" ID="btn_guardar_areas" runat="server" Text="GUARDAR" TabIndex="13" OnClick="btn_guardar_areas_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>

                <asp:UpdatePanel ID="up_e_env" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-9">
                            <div class="col-lg-12 ">
                                <div class="panel panel-default" id="pnl_e_env" runat="server" visible="false">
                                    <div class="panel-heading">
                                        <p class="text-left">
                                            <div class="input-group" id="div_busc_e_env" runat="server" visible="false">
                                                <span class="input-group-addon">
                                                    <asp:Label CssClass="control-label fuente_css02" ID="lbl_buscar_e_env" runat="server" Text="*BUSCAR CORREO:"></asp:Label>
                                                </span>
                                                <asp:TextBox CssClass="form-control input-box" ID="txt_buscar_e_env" runat="server" placeholder="letras/números" TextMode="Search" TabIndex="3"></asp:TextBox>
                                                <span class="input-group-btn">
                                                    <asp:Button CssClass="btn btn01" ID="btn_buscar_e_env" runat="server" Text="ACEPTAR" TabIndex="4" OnClick="btn_buscar_e_env_Click" />
                                                </span>
                                            </div>
                                            <div class="text-right">
                                                <ajaxToolkit:AutoCompleteExtender ID="ace_buscar_e_env" runat="server" ServiceMethod="SearchCustomers" MinimumPrefixLength="2" CompletionInterval="100" EnableCaching="true" CompletionSetCount="10" TargetControlID="txt_buscar_e_env" FirstRowSelected="false"></ajaxToolkit:AutoCompleteExtender>
                                                <asp:RequiredFieldValidator ID="rfv_buscar_e_env" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_buscar_e_env" ForeColor="white" Enabled="false"></asp:RequiredFieldValidator>
                                            </div>
                                        </p>
                                        <p class="text-right">
                                            REGISTRO DE CORREO PARA ENVÍO

                                        <span>
                                            <asp:LinkButton CssClass="btn btn02" ID="btn_agregar_e_env" runat="server" ToolTip="AGREGAR CORREO ENVÍO" TabIndex="1" OnClick="btn_agregar_e_env_Click">
                                                <i class="fas fa-plus" id="i_agregar_e_env" runat="server"></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton CssClass="btn btn02" ID="btn_editar_e_env" runat="server" ToolTip="EDITAR CORREO ENVÍO" TabIndex="2" OnClick="btn_editar_e_env_Click">
                                                <i class="far fa-edit" id="i_editar_e_env" runat="server"></i>
                                            </asp:LinkButton>
                                        </span>
                                            <br />
                                            <asp:CheckBox ID="chkb_des_e_env" runat="server" AutoPostBack="true" Text="Desactivar validaciones" OnCheckedChanged="chkb_des_e_env_CheckedChanged" />
                                        </p>
                                    </div>
                                    <div class="panel-body">
                                        <div class="col-lg-12">
                                            <asp:GridView CssClass="table" ID="gv_e_env" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="5" OnRowDataBound="gv_e_env_RowDataBound" OnPageIndexChanging="gv_e_env_PageIndexChanging">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chk_e_env" runat="server" onclick="CheckOne(this)" AutoPostBack="true" OnCheckedChanged="chk_e_env_CheckedChanged" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="email" HeaderText="ID" SortExpression="cod_area" Visible="true" />
                                                    <asp:BoundField DataField="fecha_registro" HeaderText="REGISTRO" SortExpression="fecha_registro" DataFormatString="{0:dd-MM-yyyy}" />
                                                    <asp:TemplateField HeaderText="ESTATUS">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="ddl_est_e_env" runat="server" AutoPostBack="true">
                                                            </asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EditRowStyle BackColor="#999999" />
                                                <FooterStyle BackColor="#5D7B9D" ForeColor="White" />
                                                <HeaderStyle BackColor="#104D8d" ForeColor="White" />
                                                <PagerSettings Mode="NumericFirstLast" FirstPageText="Inicio" LastPageText="Final" />
                                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                            </asp:GridView>
                                            <br />
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group text-left">

                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_correo_envio" runat="server" Text="*Correo"></asp:Label>

                                                <asp:TextBox CssClass="form-control input-box" ID="txt_correo_envio" runat="server" TextMode="Email" placeholder="xxxx@xxxx.xxx"></asp:TextBox>
                                                <div class="text-right">
                                                    <asp:RequiredFieldValidator ID="rfv_correo_envio" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_correo_envio" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form-group text-left">

                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_asunto_envio" runat="server" Text="*Asunto"></asp:Label>

                                                <asp:TextBox CssClass="form-control input-box" ID="txt_asunto_envio" runat="server" placeholder="letras/números"></asp:TextBox>
                                                <div class="text-right">
                                                    <asp:RequiredFieldValidator ID="rfv_asunto_envio" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_asunto_envio" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group text-left">

                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_usuario_envio" runat="server" Text="*Usuario"></asp:Label>

                                                <asp:TextBox CssClass="form-control input-box" ID="txt_usuario_envio" runat="server" placeholder="letras/números"></asp:TextBox>
                                                <div class="text-right">
                                                    <asp:RequiredFieldValidator ID="rfv_usuario_envio" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_usuario_envio" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form-group text-left">

                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_servidor_smtp" runat="server" Text="*SMTP"></asp:Label>

                                                <asp:TextBox CssClass="form-control input-box" ID="txt_servidor_smtp" runat="server" placeholder="smtp.xxxx.xxx"></asp:TextBox>
                                                <div class="text-right">
                                                    <asp:RequiredFieldValidator ID="rfv_servidor_smtp" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_servidor_smtp" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group text-left">

                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_clave_envio" runat="server" Text="*Contraseña"></asp:Label>

                                                <asp:TextBox CssClass="form-control input-box" ID="txt_clave_envio" runat="server" placeholder="letras/números" TextMode="Password"></asp:TextBox>
                                                <div class="text-right">
                                                    <asp:RequiredFieldValidator ID="rfv_clave_envio" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_clave_envio" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form-group text-left">

                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_puerto_envio" runat="server" Text="*Puerto"></asp:Label>

                                                <asp:TextBox CssClass="form-control input-box" ID="txt_puerto_envio" runat="server" placeholder="[0/9]"></asp:TextBox>
                                                <div class="text-right">
                                                    <asp:RequiredFieldValidator ID="rfv_puerto_envio" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_puerto_envio" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                    <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" TargetControlID="txt_puerto_envio" Mask="99999" />
                                                </div>
                                                <div class="text-right">
                                                    <br />

                                                    <asp:Button CssClass="btn btn02" ID="btn_guardar_envio" runat="server" Text="GUARDAR" OnClick="btn_guardar_envio_Click" />

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="up_correo" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-10">
                            <div class="col-lg-12 ">
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-9">
                            <div class="col-lg-12 ">
                                <div class="panel panel-default" id="Div1" runat="server" visible="false">
                                    <div class="panel-heading">
                                    </div>
                                    <div class="panel-body">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="modal-content">
                            <div class="modal-header encabezado001">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-window-close-o"></i></button>
                                <h4 class="modal-title">
                                    <asp:Label ID="lblModalTitle" runat="server" Text=""></asp:Label>
                                </h4>
                            </div>
                            <div class="modal-body">
                                <asp:Label CssClass="fuente_css02" ID="lblModalBody" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn01" data-dismiss="modal" aria-hidden="true">OK <i class="fa fa-check-circle-o"></i></button>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </form>
</body>
</html>
