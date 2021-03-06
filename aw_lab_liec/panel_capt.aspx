﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panel_capt.aspx.cs" Inherits="aw_lab_liec.panel_capt" %>

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
                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_buscar_clte" runat="server" Text="*BUSCAR CLIENTE:"></asp:Label>
                                                    </span>
                                                    <asp:TextBox CssClass="form-control input-box" ID="txt_buscar_clte" runat="server" placeholder="letras/números" TextMode="Search" TabIndex="3"></asp:TextBox>
                                                    <span class="input-group-btn">
                                                        <asp:Button CssClass="btn btn01" ID="btn_buscar_clte" runat="server" Text="ACEPTAR" OnClick="btn_buscar_clte_Click" TabIndex="4" />
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

                                                            <asp:BoundField DataField="razon_social" HeaderText="RAZÓN SOCIAL" SortExpression="razon_social" />
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

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_trfc_clte_fisc" runat="server" Text="*Tipo RFC"></asp:Label>

                                                        <asp:DropDownList CssClass="form-control input-box" ID="ddl_trfc_clte_fisc" runat="server" TabIndex="12" BackColor="LightGray" ForeColor="#104D8D"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_trfc_clte_fisc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_trfc_clte_fisc" InitialValue="0" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>

                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_rfc_clte_fisc" runat="server" Text="*RFC"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_rfc_clte_fisc" runat="server" placeholder="letras/números" ToolTip="letras/números" TabIndex="6"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                                                ErrorMessage="Formato Invalido" ControlToValidate="txt_rfc_clte_fisc"
                                                                ValidationExpression="[A-ZÑ&]{3,4}\d{6}[A-V1-9][A-Z1-9][0-9A]" ForeColor="DarkRed">
                                                            </asp:RegularExpressionValidator>
                                                            <asp:RequiredFieldValidator ID="rfv_rfc_clte_fisc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_rfc_clte_fisc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_rs" runat="server" Text="*Razón Social"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_rs" runat="server" placeholder="letras/números" ToolTip="letras/números" TabIndex="6"></asp:TextBox>
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

                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_callenum_clte" runat="server" Text="*Calle ý número"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_callenum_clte" runat="server" placeholder="letras/números" ToolTip="letras/números" TextMode="MultiLine" BackColor="LightGray" ForeColor="#104D8D" TabIndex="9"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_callenum_clte" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_callenum_clte" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
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

                                                        <asp:DropDownList CssClass="form-control input-box" ID="ddl_colonia_clte" runat="server" TabIndex="12" BackColor="LightGray" ForeColor="#104D8D"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_colonia_clte" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_colonia_clte" InitialValue="0" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_municipio_clte" runat="server" Text="Municipio"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_municipio_clte" runat="server" placeholder="letras/números" Enabled="false" BackColor="LightGray"></asp:TextBox>
                                                        <br />
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_estado_clte" runat="server" Text="Estado"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_estado_clte" runat="server" placeholder="letras/números" Enabled="false" BackColor="LightGray"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-lg-10">

                                                    <asp:Label CssClass="control-label fuente_css02" ID="lbl_clte_coment" runat="server" Text="Comentarios"></asp:Label>

                                                    <asp:TextBox CssClass="form-control input-box" ID="txt_clte_coment" runat="server" placeholder="letras/números" TextMode="MultiLine" Enabled="false" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
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
                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_buscar_clte_obras" runat="server" Text="*BUSCAR CLIENTE:"></asp:Label>
                                                    </span>
                                                    <asp:TextBox CssClass="form-control input-box" ID="txt_buscar_clte_obras" runat="server" placeholder="letras/números" TextMode="Search" TabIndex="3"></asp:TextBox>

                                                    <ajaxToolkit:AutoCompleteExtender ID="ace_buscar_clte_obras" runat="server" ServiceMethod="SearchCustomers" MinimumPrefixLength="2" CompletionInterval="100" EnableCaching="true" CompletionSetCount="10" TargetControlID="txt_buscar_clte_obras" FirstRowSelected="false"></ajaxToolkit:AutoCompleteExtender>
                                                </div>
                                                <div class="text-right">
                                                    <asp:RequiredFieldValidator ID="rfv_buscar_clte_obras" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_buscar_clte_obras" ForeColor="white" Enabled="false"></asp:RequiredFieldValidator>
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
                                                            <asp:BoundField DataField="clave_obra" HeaderText="CLAVE" SortExpression="clave_obra" Visible="true" />
                                                            <asp:BoundField DataField="desc_obra" HeaderText="DESCRIPCIÓN" SortExpression="desc_obra" />
                                                            <asp:BoundField DataField="fecha_registro" HeaderText="REGISTRO" SortExpression="fecha_registro" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="false" />
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

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_clte_clave_obra" runat="server" placeholder="letras/números" ToolTip="Una clave de obra valida se conforma de dos letras A hasta Z, un guión (-), y dos números del 0 al 9, sin espacios" TabIndex="6"></asp:TextBox>
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

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_clte_desc_obra" runat="server" placeholder="letras/números" ToolTip="letras/números" TabIndex="6" TextMode="MultiLine" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
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

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_clte_coordinador" runat="server" placeholder="letras/números" ToolTip="letras/números" TabIndex="6" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_clte_coordinador" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_clte_coordinador" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_clte_contobra" runat="server" Text="*Con ateción:"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_clte_contobra" runat="server" placeholder="letras/números" ToolTip="letras/números" TabIndex="6" TextMode="MultiLine" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_clte_contobra" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_clte_contobra" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_coment_obras" runat="server" Text="Comentarios"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_coment_obras" runat="server" placeholder="letras/números" TextMode="MultiLine" Enabled="false" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_coment_obras" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_coment_obras" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="form-group text-left">
                                                            <div class="text-right">
                                                                <asp:Button CssClass="btn btn02" ID="btn_guardar_clte_obras" runat="server" Text="GUARDAR" TabIndex="13" OnClick="btn_guardar_clte_obras_Click" />
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
                                                <div class="input-group" id="div_rppc" runat="server" visible="true">
                                                    <span class="input-group-addon">
                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_buscar_rppc" runat="server" Text="*BUSCAR OBRA:"></asp:Label>
                                                    </span>
                                                    <asp:TextBox CssClass="form-control input-box" ID="txt_buscar_rppc" runat="server" placeholder="letras/números" TextMode="Search" TabIndex="3"></asp:TextBox>

                                                    <ajaxToolkit:AutoCompleteExtender ID="ace_buscar_rppc" runat="server" ServiceMethod="SearchCustomers" MinimumPrefixLength="2" CompletionInterval="100" EnableCaching="true" CompletionSetCount="10" TargetControlID="txt_buscar_rppc" FirstRowSelected="false"></ajaxToolkit:AutoCompleteExtender>
                                                </div>
                                                <div class="text-right">
                                                    <asp:RequiredFieldValidator ID="rfv_buscar_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_buscar_rppc" ForeColor="white" Enabled="false"></asp:RequiredFieldValidator>
                                                </div>
                                            </p>
                                            <p class="text-right">
                                                RECEPCIÓN Y PROGRAMACIÓN DE CONCRETO
                                        <span>
                                            <asp:LinkButton CssClass="btn btn02" ID="btn_agregar_rppc" runat="server" ToolTip="AGREGAR CLIENTE" OnClick="btn_agregar_rppc_Click" TabIndex="1">
                                                <i class="fas fa-plus" id="i_agregar_rppc" runat="server"></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton CssClass="btn btn02" ID="btn_editar_rppc" runat="server" ToolTip="EDITAR CLIENTE" OnClick="btn_editar_rppc_Click" TabIndex="2">
                                                <i class="far fa-edit" id="i_editar_rppc" runat="server"></i>
                                            </asp:LinkButton>
                                        </span>
                                                <br />
                                                <asp:CheckBox ID="chkb_desactivar_rppc" runat="server" AutoPostBack="true" Text="Desactivar validaciones" OnCheckedChanged="chkb_desactivar_rppc_CheckedChanged" />
                                            </p>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <asp:GridView CssClass="table" ID="gv_rppc" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" TabIndex="5" OnRowDataBound="gv_rppc_RowDataBound">
                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chk_rppc" runat="server" onclick="CheckOne(this)" AutoPostBack="true" OnCheckedChanged="chk_rppc_CheckedChanged" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="no_muesra" HeaderText="# MUESTRA" SortExpression="no_muesra" Visible="true" />
                                                            <asp:BoundField DataField="fecha_registro" HeaderText="REGISTRO" SortExpression="fecha_registro" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="false" />
                                                            <asp:TemplateField HeaderText="ESTATUS">
                                                                <ItemTemplate>
                                                                    <asp:DropDownList ID="ddl_rppc_est" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_rppc_est_SelectedIndexChanged">
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
                                                <div class="col-lg-2">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_nmue_rppc" runat="server" Text="*No. de Muestra:"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="nmue_rppc" runat="server" placeholder="letras/números"></asp:TextBox>
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

                                                        <asp:TextBox CssClass="form-control input-box" ID="entrega_rppc" runat="server" placeholder="letras/números"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_entrega_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="entrega_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_recibe_rppc" runat="server" Text="Recibe"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="recibe_rppc" runat="server" placeholder="letras/números"></asp:TextBox>
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

                                                        <asp:DropDownList CssClass="form-control input-box" ID="ddl_tesp_rppc" runat="server" AutoPostBack="true" BackColor="LightGray" ForeColor="#104D8D"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_tesp_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_tesp_rppc" InitialValue="0" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_tconc_rppc" runat="server" Text="Tipo de Concreto (N,RR,RT,UR)"></asp:Label>

                                                        <asp:DropDownList CssClass="form-control input-box" ID="ddl_tconc_rppc" runat="server" AutoPostBack="true" BackColor="LightGray" ForeColor="#104D8D"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_tconc_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_tconc_rppc" InitialValue="0" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_sit_rppc" runat="server" Text="Situación (Documento)"></asp:Label>

                                                        <asp:DropDownList CssClass="form-control input-box" ID="ddl_sit_rppc" runat="server" AutoPostBack="true" BackColor="LightGray" ForeColor="#104D8D"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_sit_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_sit_rppc" InitialValue="0" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <h4 class="text-center">Programación fechas de ensaye</h4>
                                                <div class="col-lg-6">

                                                    <asp:CheckBox ID="chkb_1_rppc" runat="server" AutoPostBack="true" Text=" 24 Horas:" OnCheckedChanged="chkb_1_rppc_CheckedChanged" />
                                                    <asp:Label CssClass="control-label fuente_css02" ID="lbl_1_rppc" runat="server" Text=""></asp:Label>
                                                    <br />
                                                    <asp:CheckBox ID="chkb_3_rppc" runat="server" AutoPostBack="true" Text=" 3 Días:" OnCheckedChanged="chkb_3_rppc_CheckedChanged" />
                                                    <asp:Label CssClass="control-label fuente_css02" ID="lbl_3_rppc" runat="server" Text=""></asp:Label>
                                                    <br />
                                                    <asp:CheckBox ID="chkb_7_rppc" runat="server" AutoPostBack="true" Text=" 7 Días:" OnCheckedChanged="chkb_7_rppc_CheckedChanged" />
                                                    <asp:Label CssClass="control-label fuente_css02" ID="lbl_7_rppc" runat="server" Text=""></asp:Label>
                                                    <br />
                                                    <asp:CheckBox ID="chkb_14_rppc" runat="server" AutoPostBack="true" Text=" 14 Días:" OnCheckedChanged="chkb_14_rppc_CheckedChanged" />
                                                    <asp:Label CssClass="control-label fuente_css02" ID="lbl_14_rppc" runat="server" Text=""></asp:Label>
                                                    <br />
                                                    <asp:CheckBox ID="chkb_28_rppc" runat="server" AutoPostBack="true" Text=" 28 Días:" OnCheckedChanged="chkb_28_rppc_CheckedChanged" />
                                                    <asp:Label CssClass="control-label fuente_css02" ID="lbl_28_rppc" runat="server" Text=""></asp:Label>

                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="row">
                                                        <div class="col-lg-4">
                                                            <asp:CheckBox ID="chkb_otro_rppc" runat="server" AutoPostBack="true" Text="Otro en dias" OnCheckedChanged="chkb_otro_rppc_CheckedChanged" />
                                                            <div class="form-group">
                                                                <asp:TextBox CssClass="form-control input-box" ID="fotro_rppc" runat="server"></asp:TextBox>
                                                                <div class="text-center">
                                                                    <asp:RequiredFieldValidator ID="rfv_fotro_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="fotro_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <div class="col-lg-4">
                                                            <div class="form-group">
                                                                <br />
                                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_otro_rppc" runat="server" Text=""></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4">
                                                            <div class="form-group">
                                                                <br />
                                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_fmaxe" runat="server" Text=""></asp:Label>
                                                            </div>
                                                            <div class="form-group text-left">
                                                                <div class="text-right">
                                                                    <asp:Button CssClass="btn btn02" ID="btn_guardar_rppc" runat="server" Text="GUARDAR" TabIndex="13" OnClick="btn_guardar_rppc_Click" />
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
                        </div>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="up_ensa_comp" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-2">
                        </div>
                        <div class="col-lg-10">
                            <div class="col-lg-12 ">
                                <div class="panel panel-default" id="pnl_ensa_comp" runat="server" visible="false">
                                    <div class="panel-heading">
                                        <p class="text-left">
                                            <div class="input-group" id="div1" runat="server" visible="false">
                                                <span class="input-group-addon">
                                                    <asp:Label CssClass="control-label fuente_css02" ID="lbl_buscar_ensa_comp" runat="server" Text="*BUSCAR ÁREA:"></asp:Label>
                                                </span>
                                                <asp:TextBox CssClass="form-control input-box" ID="txt_buscar_ensa_comp" runat="server" placeholder="letras/números" TextMode="Search" TabIndex="3"></asp:TextBox>
                                                <span class="input-group-btn">
                                                    <asp:Button CssClass="btn btn01" ID="btn_buscar_ensa_comp" runat="server" Text="ACEPTAR" TabIndex="4" />
                                                </span>
                                            </div>
                                            <div class="text-right">
                                                <ajaxToolkit:AutoCompleteExtender ID="ace_buscar_ensa_comp" runat="server" ServiceMethod="SearchCustomers" MinimumPrefixLength="2" CompletionInterval="100" EnableCaching="true" CompletionSetCount="10" TargetControlID="txt_buscar_ensa_comp" FirstRowSelected="false"></ajaxToolkit:AutoCompleteExtender>
                                                <asp:RequiredFieldValidator ID="rfv_buscar_ensa_comp" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_buscar_ensa_comp" ForeColor="white" Enabled="false"></asp:RequiredFieldValidator>
                                            </div>
                                        </p>
                                        <p class="text-right">
                                            ENSAYE DE PRISMAS A COMPRESIÓN

                                        <span>
                                            <asp:LinkButton CssClass="btn btn02" ID="btn_agregar_ensa_comp" runat="server" ToolTip="AGREGAR ÁREA" TabIndex="1" OnClick="btn_agregar_ensa_comp_Click">
                                                <i class="fas fa-plus" id="i_agregar_ensa_comp" runat="server"></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton CssClass="btn btn02" ID="btn_editar_ensa_comp" runat="server" ToolTip="EDITAR ÁREA" TabIndex="2" OnClick="btn_editar_ensa_comp_Click">
                                                <i class="far fa-edit" id="i_editar_ensa_comp" runat="server"></i>
                                            </asp:LinkButton>
                                        </span>
                                            <br />
                                            <asp:CheckBox ID="chkb_desacensa_comp" runat="server" AutoPostBack="true" Text="Desactivar validaciones" OnCheckedChanged="chkb_desacensa_comp_CheckedChanged" />
                                        </p>
                                    </div>
                                    <div class="panel-body">
                                        <h6>
                                            <div class="row">

                                                <div class="col-lg-2">
                                                    <div class="form-group text-left">
                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_clavensa_ec" runat="server" Text="CLAVE DE ENSAYE"></asp:Label>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_clavensa_a" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_clavensa_a" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_clavensa_a" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_clavensa_b" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_clavensa_b" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_clavensa_b" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2">
                                                    <div class="form-group text-left">
                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_masa_ec" runat="server" Text="MASA (kg)"></asp:Label>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_masa_a" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_masa_a" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_masa_a" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_masa_b" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_masa_b" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_masa_b" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2">
                                                    <div class="form-group text-left">
                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_altu_ec" runat="server" Text="ALTURA"></asp:Label>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_altu_a" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_altu_a" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_altu_a" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_altu_b" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_altu_b" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_altu_c" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_altu_c" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_altu_c" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_altu_c" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2">
                                                    <div class="form-group text-left">
                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_lad_ec" runat="server" Text="LADOS"></asp:Label>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_lad_a" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_lad_a" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_lad_a" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_lad_b" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_lad_b" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_lad_b" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_lad_c" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_lad_c" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_lad_c" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2">
                                                    <div class="form-group text-left">
                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_dire_ec" runat="server" Text="DIRECTO"></asp:Label>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_dire_a" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_dire_a" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_dire_a" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_dire_b" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_dire_b" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_dire_a" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2">
                                                    <div class="form-group text-left">
                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_inte_ec" runat="server" Text="INTENSIDAD"></asp:Label>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_inte_a" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_inte_a" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_inte_a" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_inte_b" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_inte_b" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_inte_b" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">

                                                <div class="col-lg-2">
                                                    <div class="form-group text-left">
                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_area_ec" runat="server" Text="ÁREA (mm2)"></asp:Label>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_area_a" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_area_a" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_area_a" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_area_b" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_area_b" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_area_b" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2">
                                                    <div class="form-group text-left">
                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_pres_ec" runat="server" Text="PRESIÓN (kN)"></asp:Label>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_pres_a" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_pres_a" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_pres_a" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_pres_b" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_pres_b" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_pres_b" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2">
                                                    <div class="form-group text-left">
                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_esfu_ec" runat="server" Text="ESFUERZO (kgf/cm2)"></asp:Label>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_esfu_a" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_esfu_a" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_esfu_a" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_esfu_b" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_esfu_b" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_esfu_b" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-lg-2">
                                                    <div class="form-group text-left">
                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_esfuprom_ec" runat="server" Text="PROMEDIO (Kg/cm2)"></asp:Label>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_esfuprom_a" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_esfuprom_a" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_esfuprom_a" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_esfuprom_b" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_esfuprom_b" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_esfuprom_b" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-lg-2">
                                                    <div class="form-group text-left">
                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_masavol_ec" runat="server" Text="MASA VOL. (kg/m³)"></asp:Label>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_masavol_a" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_masavol_a" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_masavol_a" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_masavol_b" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_masavol_b" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_masavol_b" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2">
                                                    <div class="form-group text-left">
                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_masavolprom_ec" runat="server" Text="PROMEDIO (kg/m3)"></asp:Label>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_masavolprom_a" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_masavolprom_a" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_masavolprom_a" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_masavolprom_b" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_masavolprom_b" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_masavolprom_b" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">

                                                <div class="col-lg-2">
                                                    <div class="form-group text-left">
                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_tf_ec" runat="server" Text="TIPO DE FALLA"></asp:Label>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_tf_a" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_tf_a" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_tf_a" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_tf_b" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_tf_b" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_tf_b" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-2">
                                                    <div class="form-group text-left">
                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_dif_ab_ec" runat="server" Text="DIFERENCIA ENTRE PRISMAS COMPAÑEROS"></asp:Label>
                                                    </div>
                                                    <div class="form-group text-left">
                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_dif_ab_ec" runat="server" placeholder="letras/números" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_dif_ab_ec" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_dif_ab_ec" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-lg-8">

                                                    <div class="text-right">
                                                        <br />
                                                        <br />
                                                        <br />
                                                        <asp:Button CssClass="btn btn02" ID="btn_guardar_ensa_comp" runat="server" Text="GUARDAR" TabIndex="13" OnClick="btn_guardar_ensa_comp_Click" />
                                                    </div>
                                                </div>
                                            </div>

                                        </h6>
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
