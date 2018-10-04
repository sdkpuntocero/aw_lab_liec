<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panel_cliente.aspx.cs" Inherits="aw_lab_liec.panel_cliente" %>

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

    <script src="Scripts/bootstrap.min.js"></script>

    <link rel="shortcut icon" href="img/ico_liec.png" type="image/png" />
    <title>/ CONCRETO</title>
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
            <asp:UpdatePanel ID="up_clte_bienvenida" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <br />
                    <div class="row">

                        <div class="col-lg-6">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/img/ico_liec.png" Width="64" Height="64" CssClass="img-thumbnail" />
                        </div>

                        <div class="col-lg-6">
                            <div>
                                <p class="text-right">

                                    <label class="control-label fuente_css02">BIENVENID@:</label>
                                    <asp:LinkButton CssClass="buttonClass" ID="lkb_usr_oper" runat="server">
                                        <asp:Label CssClass="buttonClass" ID="lbl_usr_oper" runat="server" Text=""></asp:Label>&nbsp;<i class="fa fa-male" id="i_usr_oper" runat="server"></i>
                                    </asp:LinkButton>

                                    <br />

                                    <label class="control-label fuente_css02">PERFIL:</label>
                                    <asp:Label CssClass="buttonClass" ID="lbl_tusr" runat="server" Text=""></asp:Label>

                                    <br />

                                    <label class="control-label fuente_css02">EMPRESA:</label>
                                    <asp:LinkButton CssClass="buttonClass" ID="lkb_emp_oper" runat="server">
                                        <asp:Label CssClass="buttonClass" ID="lbl_emp_oper" runat="server" Text=""></asp:Label>&nbsp;<i class="fa fa-puzzle-piece" id="i_emp_oper" runat="server"></i>
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
                <asp:UpdatePanel ID="up_clte_menu" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-2">
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
                                                    <asp:LinkButton CssClass="fuente_css02" ID="lkb_clte" runat="server" OnClick="lkb_clte_Click">
                                                        <i class="fas fa-user-tie" id="i_clte" runat="server"></i>
                                                        <asp:Label CssClass="buttonClass" ID="lbl_clte" runat="server" Text="CLIENTES"> </asp:Label>
                                                    </asp:LinkButton>
                                                    <ul class="nav">
                                                        <li>
                                                            <a href="#">Concreto</a>
                                                        </li>
                                                        <li>
                                                            <a href="#">Acero</a>
                                                        </li>
                                                        <li>
                                                            <a href="#">Asfalto</a>
                                                        </li>
                                                        <li class="divider"></li>
                                                        <li></li>
                                                        <li class="divider"></li>
                                                        <li>
                                                            <a href="#">Geotecnia</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <asp:LinkButton CssClass="fuente_css02" ID="lkb_clte_fisc" runat="server" >
                                                        <i class="fas fa-gavel" id="i_clte_fisc" runat="server"></i>
                                                        <asp:Label CssClass="buttonClass" ID="lbl_clte_fisc" runat="server" Text="FISCALES"></asp:Label>
                                                    </asp:LinkButton>
                                                </li>
                                                <li>
                                                    <asp:LinkButton CssClass="fuente_css02" ID="lkb_clte_obras" runat="server" OnClick="lkb_clte_obras_Click">
                                                        <i class="fas fa-building" id="i_clte_obras" runat="server"></i>
                                                        <asp:Label CssClass="buttonClass" ID="lbl_clte_obras" runat="server" Text="OBRAS"> </asp:Label>
                                                    </asp:LinkButton>
                                                </li>

                                                <li>
                                                    <asp:LinkButton CssClass="fuente_css02" ID="lkb_concreto" runat="server" OnClick="lkb_concreto_Click">
                                                        <i class="fab fa-simplybuilt" id="i_concreto" runat="server"></i>
                                                        <asp:Label CssClass="buttonClass" ID="lbl_concreto" runat="server" Text="CONCRETO"></asp:Label>
                                                    </asp:LinkButton>
                                                </li>
                                                <br />
                                                <li>
                                                    <asp:LinkButton CssClass="fuente_css02" ID="lkb_salir" runat="server" OnClick="lkb_salir_Click">
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
                <asp:UpdatePanel ID="up_clte" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-10">
                            <div class="col-lg-12 ">
                                <div class="row">
                                    <div class="panel panel-default" id="pnl_clte" runat="server" visible="false">
                                        <div class="panel-heading">
                                            <p class="text-left">
                                                <div class="input-group" id="div_busc_clt" runat="server" visible="false">
                                                    <span class="input-group-addon">
                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_buscar_clte" runat="server" Text="*BUSCAR CLIENTE:" ></asp:Label>
                                                    </span>
                                                    <asp:TextBox CssClass="form-control input-box" ID="txt_buscar_clte" runat="server" placeholder="letras/numeros" TextMode="Search" TabIndex="3" ></asp:TextBox>
                                                    <span class="input-group-btn">
                                                        <asp:Button CssClass="btn btn01" ID="btn_buscar_clte" runat="server" Text="ACEPTAR"  OnClick="btn_buscar_clte_Click" TabIndex="4" />
                                                    </span>
                                                </div>
                                                <div class="text-right">
                                                    <ajaxToolkit:AutoCompleteExtender ID="ace_buscar_clte" runat="server" ServiceMethod="SearchCustomers" MinimumPrefixLength="2" CompletionInterval="100" EnableCaching="true" CompletionSetCount="10" TargetControlID="txt_buscar_clte" FirstRowSelected="false"></ajaxToolkit:AutoCompleteExtender>
                                                    <asp:RequiredFieldValidator ID="rfv_buscar_clte" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_buscar_clte" ForeColor="white" Enabled="false"></asp:RequiredFieldValidator>
                                                </div>
                                            </p>
                                            <p class="text-right">
                                                REGISTRO DE CLIENTES

                                        <span>
                                            <asp:LinkButton CssClass="btn btn02" ID="btn_agregar_clte" runat="server" ToolTip="AGREGAR CLIENTE" OnClick="btn_agregar_clte_Click" TabIndex="1">
                                                <i class="fas fa-plus" id="i_agregar_clte" runat="server"></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton CssClass="btn btn02" ID="btn_editar_clte" runat="server" ToolTip="EDITAR CLIENTE" OnClick="btn_editar_clte_Click" TabIndex="2">
                                                <i class="far fa-edit" id="i_editar_clte" runat="server"></i>
                                            </asp:LinkButton>
                                        </span>
                                                <br />
                                                <asp:CheckBox ID="chkb_desactivar_clte" runat="server" AutoPostBack="true" Text="Desactivar validaciones" OnCheckedChanged="chkb_desactivar_clte_CheckedChanged" />
                                            </p>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">

                                                <div class="col-lg-12">
                                                    <asp:GridView CssClass="table" ID="gv_clte" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" TabIndex="5" OnPageIndexChanging="gv_clte_PageIndexChanging" OnRowDataBound="gv_clte_RowDataBound">
                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chk_clte" runat="server" onclick="CheckOne(this)" AutoPostBack="true" OnCheckedChanged="chk_clte_CheckedChanged" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="cod_clte" HeaderText="ID" SortExpression="cod_clte" Visible="true" />

                                                            <asp:BoundField DataField="nombre_clte" HeaderText="CLIENTE" SortExpression="nombre_clte" />
                                                            <asp:BoundField DataField="fecha_registro" HeaderText="REGISTRO" SortExpression="fecha_registro" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="false" />
                                                            <asp:TemplateField HeaderText="ESTATUS">
                                                                <ItemTemplate>
                                                                    <asp:DropDownList ID="ddl_clte_estatus" runat="server" OnSelectedIndexChanged="ddl_clte_estatus_SelectedIndexChanged" AutoPostBack="true">
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
                                                </div>
                                            </div>
                                            <div class="row">

                                                <div class="col-lg-6">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_rs" runat="server" Text="*Nombre de Cliente"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_rs" runat="server" placeholder="letras/numeros" ToolTip="letras/numeros" TabIndex="6"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_rs" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_rs" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_telefono_clte" runat="server" Text="Teléfono"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_telefono_clte" runat="server" MaxLength="16" placeholder="000-000-00000000" TextMode="Phone" ToolTip="Un número de teléfono válido consiste en un código de lada de 3 dígitos, un guión (-),un código de área de 3 dígitos, un guión (-) y el número telefónico con valores del 0 al 9" TabIndex="7"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RegularExpressionValidator ID="revPhone" runat="server"
                                                                ErrorMessage="Formato Invalido" ControlToValidate="txt_telefono_clte"
                                                                ValidationExpression="[0-9]{3}[-][0-9]{3}[-][0-9]{8}" ForeColor="DarkRed">
                                                            </asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_email_clte" runat="server" Text="e-mail"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_email_clte" runat="server" placeholder="xxxx@xxxx.xxx" TextMode="Email" ToolTip="xxxx@xxxx.xxx" TabIndex="8"></asp:TextBox>
                                                        <br />
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_callenum_clte" runat="server" Text="*Calle ý número"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_callenum_clte" runat="server" placeholder="letras/numeros" ToolTip="letras/numeros" TextMode="MultiLine" BackColor="LightGray" ForeColor="#104D8D" TabIndex="9"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_callenum_clte" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_callenum_clte" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_cp_clte" runat="server" Text="*Código Postal"></asp:Label>

                                                        <div class="input-group">
                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_cp_clte" runat="server" placeholder="5 números (0-9)" MaxLength="5" ToolTip="Un código postal valido consiste en 5 numeros con valores del 0-9" TabIndex="10"></asp:TextBox>
                                                            <ajaxToolkit:MaskedEditExtender ID="mee_cp_clte" runat="server" TargetControlID="txt_cp_clte" Mask="99999" />
                                                            <span class="input-group-btn">
                                                                <asp:Button CssClass="btn btn02" ID="btn_cp_clte" runat="server" Text="VALIDAR" OnClick="btn_cp_clte_Click" TabIndex="11" />
                                                            </span>
                                                        </div>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_cp_clte" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_cp_clte" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_colonia_clte" runat="server" Text="*Colonia"></asp:Label>

                                                        <asp:DropDownList CssClass="form-control input-box" ID="ddl_colonia_clte" runat="server" TabIndex="12"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_colonia_clte" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_colonia_clte" InitialValue="0" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_municipio_clte" runat="server" Text="Municipio"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_municipio_clte" runat="server" placeholder="letras/numeros" Enabled="false" BackColor="LightGray"></asp:TextBox>
                                                        <br />
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_estado_clte" runat="server" Text="Estado"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_estado_clte" runat="server" placeholder="letras/numeros" Enabled="false" BackColor="LightGray"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-lg-10">

                                                    <asp:Label CssClass="control-label fuente_css02" ID="lbl_clte_coment" runat="server" Text="Comentarios"></asp:Label>

                                                    <asp:TextBox CssClass="form-control input-box" ID="txt_clte_coment" runat="server" placeholder="letras/numeros" TextMode="MultiLine" Enabled="false" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                    <div class="text-right">
                                                        <asp:RequiredFieldValidator ID="rfv_clte_coment" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_clte_coment" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2">
                                                    <br />
                                                    <br />
                                                    <div class="text-right">
                                                        <asp:Button CssClass="btn btn02" ID="btn_guardar_clte" runat="server" Text="GUARDAR" OnClick="btn_guardar_clte_Click" TabIndex="13" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btn_cp_clte" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="up_clte_obras" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-10">
                            <div class="col-lg-12 ">
                                <div class="row">
                                    <div class="panel panel-default" id="pnl_clte_obras" runat="server" visible="false">
                                        <div class="panel-heading">
                                            <p class="text-left">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_buscar_clte_obras" runat="server" Text="*Buscar cliente:"></asp:Label>
                                                    </span>
                                                    <asp:TextBox CssClass="form-control input-box" ID="txt_buscar_clte_obras" runat="server" placeholder="letras/numeros" TextMode="Search" TabIndex="3"></asp:TextBox>

                                                    <ajaxToolkit:AutoCompleteExtender ID="ace_buscar_clte_obras" runat="server" ServiceMethod="SearchCustomers" MinimumPrefixLength="2" CompletionInterval="100" EnableCaching="true" CompletionSetCount="10" TargetControlID="txt_buscar_clte_obras" FirstRowSelected="false"></ajaxToolkit:AutoCompleteExtender>
                                                </div>
                                                <div class="text-right">
                                                    <asp:RequiredFieldValidator ID="rfv_buscar_clte_obras" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_buscar_clte_obras" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                </div>
                                            </p>
                                            <p class="text-right">
                                                REGISTRO DE OBRAS
                                        <span>
                                            <asp:LinkButton CssClass="btn btn02" ID="btn_agregar_clte_obras" runat="server" ToolTip="AGREGAR CLIENTE" OnClick="btn_agregar_clte_obras_Click" TabIndex="1">
                                                <i class="fas fa-plus" id="i_agregar_clte_obras" runat="server"></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton CssClass="btn btn02" ID="btn_editar_clte_obras" runat="server" ToolTip="EDITAR CLIENTE" OnClick="btn_editar_clte_obras_Click" TabIndex="2">
                                                <i class="far fa-edit" id="i_editar_clte_obras" runat="server"></i>
                                            </asp:LinkButton>
                                        </span>
                                                <br />
                                                <asp:CheckBox ID="chkb_desactivar_clte_obras" runat="server" AutoPostBack="true" Text="Desactivar validaciones" OnCheckedChanged="chkb_desactivar_clte_obras_CheckedChanged" />
                                            </p>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <asp:GridView CssClass="table" ID="gv_clte_obras" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" TabIndex="5" OnRowDataBound="gv_clte_obras_RowDataBound">
                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chk_clte_obras" runat="server" onclick="CheckOne(this)" AutoPostBack="true" OnCheckedChanged="chk_clte_obras_CheckedChanged" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="clave_obra" HeaderText="Clave de Obra" SortExpression="clave_obra" Visible="true" />
                                                            <asp:BoundField DataField="desc_obra" HeaderText="Descripción Obra" SortExpression="desc_obra" />
                                                            <asp:BoundField DataField="fecha_registro" HeaderText="Fecha de Registro" SortExpression="fecha_registro" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="false" />
                                                            <asp:TemplateField HeaderText="Estatus">
                                                                <ItemTemplate>
                                                                    <asp:DropDownList ID="ddl_clteobra_estatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_clteobra_estatus_SelectedIndexChanged">
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
                                                </div>
                                            </div>
                                            <div class="row">

                                                <div class="col-lg-6">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_clte_clave_obra" runat="server" Text="*Clave de Obra"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_clte_clave_obra" runat="server" placeholder="letras/numeros" ToolTip="Una clave de obra valida se conforma de dos letras A hasta Z, un guión (-), y dos números del 0 al 9, sin espacios" TabIndex="6"></asp:TextBox>
                                                        <div class="text-right">

                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                                ErrorMessage="Formato Invalido" ControlToValidate="txt_clte_clave_obra"
                                                                ValidationExpression="[a-zA-Z]{2}[-][0-9]{2}" ForeColor="DarkRed">
                                                            </asp:RegularExpressionValidator>

                                                            <asp:RequiredFieldValidator ID="rfv_clte_clave_obra" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_clte_clave_obra" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_clte_desc_obra" runat="server" Text="*Nombre de Obra"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_clte_desc_obra" runat="server" placeholder="letras/numeros" ToolTip="letras/numeros" TabIndex="6" TextMode="MultiLine" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_clte_desc_obra" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_clte_desc_obra" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_clte_tservicio" runat="server" Text="*Tipo de Servicio"></asp:Label>

                                                        <asp:DropDownList CssClass="form-control input-box" ID="ddl_clte_tservicio" runat="server" TabIndex="12" BackColor="LightGray" ForeColor="#104D8D"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_clte_tservicio" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_clte_tservicio" InitialValue="0" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_clte_coordinador" runat="server" Text="*Coordinador"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_clte_coordinador" runat="server" placeholder="letras/numeros" ToolTip="letras/numeros" TabIndex="6" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_clte_coordinador" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_clte_coordinador" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_clte_contobra" runat="server" Text="*Con ateción:"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_clte_contobra" runat="server" placeholder="letras/numeros" ToolTip="letras/numeros" TabIndex="6" TextMode="MultiLine" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_clte_contobra" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_clte_contobra" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_coment_obras" runat="server" Text="Comentarios"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_coment_obras" runat="server" placeholder="letras/numeros" TextMode="MultiLine" Enabled="false" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_coment_obras" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_coment_obras" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="form-group text-left">
                                                            <div class="text-right">
                                                                <asp:Button CssClass="btn btn01" ID="btn_guardar_clte_obras" runat="server" Text="GUARDAR" TabIndex="13" OnClick="btn_guardar_clte_obras_Click" />
                                                            </div>
                                                        </div>
                                                    </div>
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
             <%--   <asp:UpdatePanel ID="up_clte_fisc" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-10">
                            <div class="col-lg-12 ">
                                <div class="row">
                                    <div class="panel panel-default" id="pnl_clte_fisc" runat="server" visible="false">
                                        <div class="panel-heading">
                                            <p class="text-left">

                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_bus_clte_fisc" runat="server" Text="*Buscar Cliente"></asp:Label>
                                                    </span>
                                                    <asp:TextBox CssClass="form-control input-box" ID="txt_bus_clte_fisc" runat="server" placeholder="letras/numeros" TextMode="Search" TabIndex="3"></asp:TextBox>

                                                    <ajaxToolkit:AutoCompleteExtender ID="ace_bus_clte_fisc" runat="server" ServiceMethod="SearchCustomers" MinimumPrefixLength="2" CompletionInterval="100" EnableCaching="true" CompletionSetCount="10" TargetControlID="txt_bus_clte_fisc" FirstRowSelected="false"></ajaxToolkit:AutoCompleteExtender>
                                                </div>
                                                <div class="text-right">
                                                    <asp:RequiredFieldValidator ID="rfv_bus_clte_fisc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_bus_clte_fisc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                </div>
                                            </p>
                                            <p class="text-right">
                                                REGISTRO DE DATOS FISCALES
                                        <span>
                                            <asp:LinkButton CssClass="btn btn02" ID="btn_agr_clte_fisc" runat="server" ToolTip="AGREGAR CLIENTE" TabIndex="1" OnClick="btn_agr_clte_fisc_Click">
                                                <i class="fas fa-plus" id="i_agr_clte_fisc" runat="server"></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton CssClass="btn btn02" ID="btn_edit_clte_fisc" runat="server" ToolTip="EDITAR CLIENTE" TabIndex="2" OnClick="btn_edit_clte_fisc_Click">
                                                <i class="far fa-edit" id="i_edit_clte_fisc" runat="server"></i>
                                            </asp:LinkButton>
                                        </span>
                                                <br />
                                                <asp:CheckBox ID="chkb_desac_clte_fisc" runat="server" AutoPostBack="true" Text="Desactivar validaciones" OnCheckedChanged="chkb_desac_clte_fisc_CheckedChanged" />
                                                <br />
                                                <asp:CheckBox ID="chkb_datos_clte_fisc" runat="server" AutoPostBack="true" Text="Usar Dirección de registro" OnCheckedChanged="chkb_datos_clte_fisc_CheckedChanged" />
                                            </p>
                                        </div>
                                        <div class="panel-body">

                                            <div class="row">

                                                <div class="col-lg-6">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_trfc_clte_fisc" runat="server" Text="*Tipo RFC"></asp:Label>

                                                        <asp:DropDownList CssClass="form-control input-box" ID="ddl_trfc_clte_fisc" runat="server" TabIndex="12" BackColor="LightGray" ForeColor="#104D8D"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_trfc_clte_fisc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_trfc_clte_fisc" InitialValue="0" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>

                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_rfc_clte_fisc" runat="server" Text="*RFC"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_rfc_clte_fisc" runat="server" placeholder="letras/numeros" ToolTip="letras/numeros" TabIndex="6"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                                                ErrorMessage="Formato Invalido" ControlToValidate="txt_rfc_clte_fisc"
                                                                ValidationExpression="[A-ZÑ&]{3,4}\d{6}[A-V1-9][A-Z1-9][0-9A]" ForeColor="DarkRed">
                                                            </asp:RegularExpressionValidator>
                                                            <asp:RequiredFieldValidator ID="rfv_rfc_clte_fisc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_rfc_clte_fisc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_rs_clte_fisc" runat="server" Text="*Razón Social"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_rs_clte_fisc" runat="server" placeholder="letras/numeros" ToolTip="letras/numeros" TabIndex="6"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_rs_clte_fisc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_rs_clte_fisc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_tel_clte_fisc" runat="server" Text="Teléfono"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_tel_clte_fisc" runat="server" MaxLength="16" placeholder="000-000-00000000" TextMode="Phone" ToolTip="Un número de teléfono válido consiste en un código de lada de 3 dígitos, un guión (-),un código de área de 3 dígitos, un guión (-) y el número telefónico con valores del 0 al 9" TabIndex="7"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RegularExpressionValidator ID="rev_tel_fisc" runat="server"
                                                                ErrorMessage="Formato Invalido" ControlToValidate="txt_tel_clte_fisc"
                                                                ValidationExpression="[0-9]{3}[-][0-9]{3}[-][0-9]{8}" ForeColor="DarkRed">
                                                            </asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_email_clte_fisc" runat="server" Text="e-mail"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_email_clte_fisc" runat="server" placeholder="xxxx@xxxx.xxx" TextMode="Email" ToolTip="xxxx@xxxx.xxx" TabIndex="8"></asp:TextBox>
                                                        <br />
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_callenum_clte_fisc" runat="server" Text="*Calle ý número"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_callenum_clte_fisc" runat="server" placeholder="letras/numeros" ToolTip="letras/numeros" TextMode="MultiLine" BackColor="LightGray" ForeColor="#104D8D" TabIndex="9"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_callenum_clte_fisc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_callenum_clte_fisc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                      <div class="col-lg-6">
                                                          <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_cp_clte_fisc" runat="server" Text="*Código Postal"></asp:Label>

                                                        <div class="input-group">
                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_cp_clte_fisc" runat="server" placeholder="5[0-9]" MaxLength="5" ToolTip="Un código postal valido consiste en 5 numeros con valores del 0-9" TabIndex="10"></asp:TextBox>
                                                            <ajaxToolkit:MaskedEditExtender ID="mee_cp_clte_fisc" runat="server" TargetControlID="txt_cp_clte_fisc" Mask="99999" />
                                                            <span class="input-group-btn">
                                                                <asp:Button CssClass="btn btn01" ID="btn_cp_clte_fisc" runat="server" Text="VALIDAR" TabIndex="11" OnClick="btn_cp_clte_fisc_Click" />
                                                            </span>
                                                        </div>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_cp_clte_fisc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_cp_clte_fisc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                      </div>
                                                    <div class="col-lg-6">
                                                        <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_col_clte_fisc" runat="server" Text="*Colonia"></asp:Label>

                                                        <asp:DropDownList CssClass="form-control input-box" ID="ddl_col_clte_fisc" runat="server" TabIndex="12" BackColor="LightGray" ForeColor="#104D8D"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_col_clte_fisc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_col_clte_fisc" InitialValue="0" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                      </div>
                                                        </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_municipio_clte_fisc" runat="server" Text="Municipio"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_municipio_clte_fisc" runat="server" placeholder="letras/numeros" Enabled="false" BackColor="LightGray"></asp:TextBox>
                                                        <br />
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_estado_clte_fisc" runat="server" Text="Estado"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_estado_clte_fisc" runat="server" placeholder="letras/numeros" Enabled="false" BackColor="LightGray"></asp:TextBox>
                                                    </div>
                                                    <div class="text-right">
                                                        <asp:Button CssClass="btn btn01" ID="btn_guar_clte_fisc" runat="server" Text="GUARDAR" TabIndex="13" OnClick="btn_guar_clte_fisc_Click" />
                                                    </div>
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
                </asp:UpdatePanel>--%>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-10">
                            <div class="col-lg-12 ">
                                <div class="row">
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="up_rppc" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-10">
                            <div class="col-lg-12 ">
                                <div class="row">
                                    <div class="panel panel-default" id="pnl_rppc" runat="server" visible="false">
                                        <div class="panel-heading">
                                            <p class="text-left">
                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_bus_rppc" runat="server" Text="*Buscar Cliente"></asp:Label>

                                                <div class="form-group">
                                                    <asp:TextBox CssClass="form-control input-box" ID="txt_bus_rppc" runat="server" placeholder="letras/numeros" TextMode="Search" TabIndex="3"></asp:TextBox>

                                                    <ajaxToolkit:AutoCompleteExtender ID="ace_bus_rppc" runat="server" ServiceMethod="SearchCustomers" MinimumPrefixLength="2" CompletionInterval="100" EnableCaching="true" CompletionSetCount="10" TargetControlID="txt_bus_rppc" FirstRowSelected="false"></ajaxToolkit:AutoCompleteExtender>
                                                </div>
                                                <div class="text-right">
                                                    <asp:RequiredFieldValidator ID="rfv_bus_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_bus_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                </div>
                                            </p>
                                            <p class="text-right">
                                                RECEPCIÓN Y PROGRAMACIÓN DE CONCRETO
                                        <span>
                                            <asp:LinkButton CssClass="btn btn02" ID="btn_agr_rppc" runat="server" ToolTip="AGREGAR" TabIndex="1" >
                                                <i class="fas fa-plus" id="i_agr_rppc" runat="server"></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton CssClass="btn btn02" ID="btn_edit_rppc" runat="server" ToolTip="EDITAR" TabIndex="2" >
                                                <i class="far fa-edit" id="i_edit_rppc" runat="server"></i>
                                            </asp:LinkButton>
                                        </span>
                                                <br />
                                                <asp:CheckBox ID="chkb_desac_rppc" runat="server" AutoPostBack="true" Text="Desactivar validaciones"  />
                                            </p>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-lg-2">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_nmue_rppc" runat="server" Text="*No. de Muestra:"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="nmue_rppc" runat="server" placeholder="letras/numeros"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_nmue_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="nmue_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_fcol_rppc" runat="server" Text="*Colado"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="fcol_rppc" runat="server" TextMode="Date"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_fcol_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="fcol_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2">

                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_frec_rppc" runat="server" Text="Recepción"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="frec_rppc" runat="server" TextMode="Date"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_frec_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="frec_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_entrega_rppc" runat="server" Text="Entrega"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="entrega_rppc" runat="server" placeholder="letras/numeros"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_entrega_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="entrega_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_recibe_rppc" runat="server" Text="Recibe"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="recibe_rppc" runat="server" placeholder="letras/numeros"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_recibe_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="recibe_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-3">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_r_rppc" runat="server" Text="f´c = kgf/cm3"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="r_rppc" runat="server" placeholder="[0-9]"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_r_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="r_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_tesp_rppc" runat="server" Text="Tipo de Especímen"></asp:Label>

                                                        <asp:DropDownList CssClass="form-control input-box" ID="ddl_tesp_rppc" runat="server" AutoPostBack="true"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_tesp_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_tesp_rppc" InitialValue="0" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_tconc_rppc" runat="server" Text="Tipo de Concreto (N,RR,RT,UR)"></asp:Label>

                                                        <asp:DropDownList CssClass="form-control input-box" ID="ddl_tconc_rppc" runat="server" AutoPostBack="true"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_tconc_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_tconc_rppc" InitialValue="0" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_sit_rppc" runat="server" Text="Situación (Documento)"></asp:Label>

                                                        <asp:DropDownList CssClass="form-control input-box" ID="ddl_sit_rppc" runat="server" AutoPostBack="true"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_sit_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_sit_rppc" InitialValue="0" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <h4 class="text-center">Programación Fechas de Ensaye</h4>
                                                    <asp:CheckBox ID="chkb_1_rppc" runat="server" AutoPostBack="true" Text=" 24 Horas:" />
                                                    <asp:Label CssClass="control-label fuente_css02" ID="lbl_1_rppc" runat="server" Text=""></asp:Label>
                                                    <br />
                                                    <asp:CheckBox ID="chkb_3_rppc" runat="server" AutoPostBack="true" Text=" 3 Días:" />
                                                    <asp:Label CssClass="control-label fuente_css02" ID="lbl_3_rppc" runat="server" Text=""></asp:Label>
                                                    <br />
                                                    <asp:CheckBox ID="chkb_7_rppc" runat="server" AutoPostBack="true" Text=" 7 Días:" />
                                                    <asp:Label CssClass="control-label fuente_css02" ID="lbl_7_rppc" runat="server" Text=""></asp:Label>
                                                    <br />
                                                    <asp:CheckBox ID="chkb_14_rppc" runat="server" AutoPostBack="true" Text=" 14 Días:" />
                                                    <asp:Label CssClass="control-label fuente_css02" ID="lbl_14_rppc" runat="server" Text=""></asp:Label>
                                                    <br />
                                                    <asp:CheckBox ID="chkb_28_rppc" runat="server" AutoPostBack="true" Text=" 28 Días:" />
                                                    <asp:Label CssClass="control-label fuente_css02" ID="lbl_28_rppc" runat="server" Text=""></asp:Label>
                                                    <br />
                                                </div>
                                                <div class="col-lg-6">
                                                    <asp:CheckBox ID="chkb_otro_rppc" runat="server" AutoPostBack="true" Text="Otro" />

                                                    <div class="form-group">
                                                        <asp:TextBox CssClass="form-control input-box" ID="fotro_rppc" runat="server" TextMode="Date"></asp:TextBox>
                                                        <div class="text-center">
                                                            <asp:RequiredFieldValidator ID="rfv_fotro_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="fotro_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <asp:CheckBox ID="chkb_fment_rppc" runat="server" AutoPostBack="true" Text="Fecha máxima para entrega de resultados" />
                                                    <div class="form-group ">
                                                        <asp:TextBox CssClass="form-control input-box" ID="fment_rppc" runat="server" TextMode="Date"></asp:TextBox>
                                                        <div class="text-center">
                                                            <asp:RequiredFieldValidator ID="rfv_fment_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="fment_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="text-right">
                                                        <asp:Button CssClass="btn" ID="btn_guardar_rppc" runat="server" Text="GUARDAR" />
                                                    </div>
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
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-10">
                            <div class="col-lg-12 ">
                                <div class="row">
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-10">
                            <div class="col-lg-12 ">
                                <div class="row">
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-10">
                            <div class="col-lg-12 ">
                                <div class="row">
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