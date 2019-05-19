<%-- 
    Document   : personanatural
    Created on : 10/02/2016, 11:23:00 PM
    Author     : nerio
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar cliente</title>
        <%@include file="../shared/favicon.jsp" %>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap-3.3.6.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/fonts/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/animate/animate.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/admin/site.css" rel="stylesheet" type="text/css"/>

        <link href="${pageContext.request.contextPath}/assets/css/admin/custom.css" rel="stylesheet" type="text/css"/>
        <!--  Estilos de error  -->
        <link href="${pageContext.request.contextPath}/assets/css/admin/cmxform.css" rel="stylesheet" type="text/css"/>
        <!--  Estilos de datepicker  -->
        <link href="${pageContext.request.contextPath}/assets/css/jquery/jquery-ui-1.11.4.css" rel="stylesheet" type="text/css"/>

        <link href="${pageContext.request.contextPath}/assets/css/datatables/dataTables.tableTools.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="nav-md" style="font-family: Cambria">
        <div class="container body">
            <div class="main_container">
                <%@include file="../shared/navbarLeft.jsp" %>
                <%@include file="../shared/navbarTop.jsp" %>
                <div class="right_col" role="main">

                    <div class="">
                        <div class="page-title">
                            <div class="title_left">
                                <h4>Registro de clientes (persona juridica) </h4>
                            </div>

                            <div class="title_right">
                                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Buscar...">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">Go!</button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>

                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Crear nuevo cliente  <i class="fa fa-book"></i></h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li>
                                                <a href="#"><i class="fa fa-chevron-up"></i></a>
                                            </li>
                                            <li class="dropdown">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"><i class="fa fa-wrench"></i></a>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a href="#">Settings 1</a>
                                                    </li>
                                                    <li><a href="#">Settings 2</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li><a href="#"><i class="fa fa-close"></i></a>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <div class="col-ss-12 col-xs-12">
                                            <div class="row">
                                                <form id="formulario" method="post">
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>RUC (*)</label>
                                                        <input name="ruc" class="form-control" placeholder="RUC" autofocus="" type="number">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Razon social (*)</label>
                                                        <input name="razonSocial" class="form-control" placeholder="RAZON SOCIAL" type="text">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Nombre comercial (*)</label>
                                                        <input name="nombreComercial" class="form-control" placeholder="NOMBRE COMERCIAL" type="text">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Giro negocio (*)</label>
                                                        <input name="giroNegocio" class="form-control" placeholder="GIRO NEGOCIO" type="text">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Telefono (*)</label>
                                                        <input name="telefono" class="form-control" placeholder="TELEFONO" type="text">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Direccion (*)</label>
                                                        <input name="direccion" class="form-control" placeholder="DIRECCION" type="text">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Pais</label>
                                                        <select name="pais" class="form-control" onchange="$.cargarDepartamento()">
                                                            <c:forEach var="item" items="${listaPais}">
                                                                <option value="${item.id}">${item.nombre}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label id="labelDepartamento">Departamento</label>
                                                        <select name="departamento" class="form-control" onchange="$.restaurarLabel()">
                                                        </select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label id="labelProvincia">Provincia</label>
                                                        <select name="provincia" class="form-control" onmouseover="$.cargarProvincia()" onchange="$.restaurarLabel()">
                                                        </select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label id="labelDistrito">Distrito</label>
                                                        <select name="distrito" class="form-control" onmouseover="$.cargarDistrito()">
                                                        </select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Email</label>
                                                        <input name="email" class="form-control" type="email" placeholder="EMAIL">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Fecha fundacion</label>
                                                        <input name="fechaFundacion" class="form-control" placeholder="YYYY-MM-DD">
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="row" style="padding-top: 10px">
                                                <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                                    <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                        <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Representantes</a>
                                                        </li>
                                                    </ul>
                                                    <div id="myTabContent" class="tab-content">
                                                        <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                                                            <div class="panel panel-default">
                                                                <div class="panel-body">
                                                                    <fieldset>
                                                                        <legend style="font-family: Cambria">Representante legal</legend>
                                                                        <div class="row">
                                                                            <form id="formulario2">
                                                                                <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                    <label>DNI (*)</label>
                                                                                    <input name="dni" class="form-control" placeholder="DNI" type="number">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                    <label>Nombre (*)</label>
                                                                                    <input name="nombre" class="form-control" placeholder="NOMBRE" type="text">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                    <label>Apellido paterno (*)</label>
                                                                                    <input name="apellidoPat" class="form-control" placeholder="APELLIDO PATERNO" type="text">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                    <label>Apellido materno (*)</label>
                                                                                    <input name="apellidoMat" class="form-control" placeholder="APELLIDO MATERNO" type="text">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                    <label>Direccion (*)</label>
                                                                                    <input name="direccion" class="form-control" placeholder="DIRECCION" type="text">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                    <label>Celular</label>
                                                                                    <input name="celular" class="form-control" placeholder="CELULAR" type="number">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                    <label>Cargo</label>
                                                                                    <input name="cargo" class="form-control" placeholder="CARGO" type="text">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-12" style="padding-top: 10px">
                                                                                    <input id="agregar" type="submit" value="Agregar" class="btn btn-success btn-xs">
                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                        <legend style="font-family: Cambria">Lista representante legal</legend>
                                                                        <div class="row">
                                                                            <table id="tablaRepresentantelegal" class="table table-striped">
                                                                                <thead>
                                                                                    <tr class="headings">
                                                                                        <th>N° </th>
                                                                                        <th>Dni </th>
                                                                                        <th>Nombre </th>
                                                                                        <th>Apellido </th>
                                                                                        <th>Direccion </th>
                                                                                        <th>Celular </th>
                                                                                        <th>Cargo </th>
                                                                                        <th class=" no-link last"><span class="nobr">Action</span>
                                                                                        </th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    <tr class="odd">
                                                                                        <td valign="top" colspan="8" class="dataTables_empty">Ningun registro de representante legal</td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </fieldset>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-ss-12 col-xs-12">
                                            <button onclick="$.crearClientejuridico()" class="btn btn-primary">Crear</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12 col-sm-12 col-xs-12 col-ss-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Registro de clientes <small>Persona juridica</small></h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a href="#"><i class="fa fa-chevron-up"></i></a>
                                            </li>
                                            <li class="dropdown">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"><i class="fa fa-wrench"></i></a>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a href="#">Settings 1</a>
                                                    </li>
                                                    <li><a href="#">Settings 2</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li><a href="#"><i class="fa fa-close"></i></a>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <table id="example" class="table table-striped responsive-utilities jambo_table">
                                            <thead>
                                                <tr class="headings">
                                                    <th>Codigo </th>
                                                    <th>Nombre </th>
                                                    <th>Apellidos </th>
                                                    <th>Dni </th>
                                                    <th>Direccion </th>
                                                    <th>Celular </th>
                                                    <th>Fec. Incripcion </th>
                                                    <th>Action</th>
                                                    <th>Action</th>
                                                    <th class=" no-link last"><span class="nobr">Action</span></th>
                                                </tr>
                                            </thead>

                                            <tbody id="tablaPersonajuridica">
                                                <c:forEach var="item" items="${listaPersonajuridica}">
                                                    <tr id="${item.id}">
                                                        <td>${item.cliente.codigo}</td>
                                                        <td>${item.razonSocial}</td>
                                                        <td>${item.giroNegocio}</td>
                                                        <td>${item.ruc}</td>
                                                        <td>${item.direccion}</td>
                                                        <td>${item.telefono}</td>
                                                        <td>${item.fechaFundacion}</td>
                                                        <td>
                                                            <a href="javascript:void(0)" onclick="$.modificarClientejuridico(${item.id})" data-toggle="modal" data-target="#myModal" style="padding-right: 5px">
                                                                <i class="fa fa-pencil"></i> Edit
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="javascript:void(0)" onclick="$.quitarClientejuridico(${item.id})" style="color: red">
                                                                <i class="fa fa-close"></i> Eliminar
                                                            </a>
                                                        </td>
                                                        <td class=" last">
                                                            <a target="_blank" href="${pageContext.request.contextPath}/reporte/reporteclientejuridico?type=pdf&&id=${item.cliente.id}"><i class="fa fa-file-pdf-o fa-2x"></i> Ficha cliente</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%@include file="../shared/footer.jsp" %>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="color: #449ACA; text-align: center">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Modificar categoria</h4>
                        <input id="id2" type="number" hidden="">
                    </div>
                    <div id="bodyModal" class="modal-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <fieldset>
                                    <blockquote style="color: mediumblue; font-size: 13px"><i class="fa fa-check" style="color: green"></i> Las categorias seran mostradas en la seccion de navegacion de la tienda virtual, por lo tanto le recomendamos que posea entre 1 a 2 palabras maximo.</blockquote>
                                    <div class="col-ss-12 col-xs-6">
                                        <label>Denominacion</label>
                                        <input id="denominacion2" class="form-control" placeholder="Denominacion" type="text" required="" autofocus>
                                    </div>
                                    <div class="col-ss-12 col-xs-6">
                                        <label>Estado</label>
                                        <select id="estado2" class="form-control">
                                            <option value="true">Activo</option>
                                            <option value="false">Desactivo</option>
                                        </select>
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button onclick="Modificar()" type="button" class="btn btn-primary">Modificar</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-2.1.4.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap-3.3.6.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/nicescroll/jquery.nicescroll.min.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/admin/custom.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.core.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.buttons.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.nonblock.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery.validate.min.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-ui-1.11.4.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/datatables/jquery.dataTables.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/icheck/icheck.min.js" type="text/javascript"></script>

        <script type="text/javascript">
                            var asInitVals = new Array();
                            $(document).ready(function () {
                                var oTable = $('#example').dataTable({
                                    "oLanguage": {
                                        "sSearch": "Buscar en todas las columnas:"},
                                    "aaSorting": [[6, 'desc']],
                                    "aoColumnDefs": [
                                        {
                                            'bSortable': false,
                                            'aTargets': [0]
                                        } //disables sorting for column one
                                    ],
                                    'iDisplayLength': 10,
                                    "sPaginationType": "full_numbers",
                                    "dom": 'T<"clear">lfrtip',
                                    "tableTools": {
                                        "sSwfPath": "<?php echo base_url('assets2/js/Datatables/tools/swf/copy_csv_xls_pdf.swf'); ?>"
                                    }
                                });
                                $("tfoot input").keyup(function () {
                                    /* Filter on the column based on the index of this element's parent <th> */
                                    oTable.fnFilter(this.value, $("tfoot th").index($(this).parent()));
                                });
                                $("tfoot input").each(function (i) {
                                    asInitVals[i] = this.value;
                                });
                                $("tfoot input").focus(function () {
                                    if (this.className === "search_init") {
                                        this.className = "";
                                        this.value = "";
                                    }
                                });
                                $("tfoot input").blur(function (i) {
                                    if (this.value === "") {
                                        this.className = "search_init";
                                        this.value = asInitVals[$("tfoot input").index(this)];
                                    }
                                });
                            });
        </script>
        <script type="text/javascript">
            $.notificar = function (titulo, tipo, mensaje) {
                new PNotify({title: titulo,
                    type: tipo,
                    text: mensaje,
                    nonblock: {
                        nonblock: true
                    },
                    before_close: function (PNotify) {
                        PNotify.update({
                            title: PNotify.options.title + " - Enjoy your Stay",
                            before_close: null
                        });
                        PNotify.queueRemove();
                        return false;
                    }
                });
            };

            $.limpiarControles = function () {
                $("#formulario input[name=ruc]").val("");
                $("#formulario input[name=razonSocial]").val("");
                $("#formulario input[name=nombreComercial]").val("");
                $("#formulario input[name=giroNegocio]").val("");
                $("#formulario input[name=direccion]").val("");
                $("#formulario input[name=telefono]").val("");
                $("#formulario input[name=email]").val("");
                $("#formulario input[name=fechaFundacion]").val("");

                $("#formulario2 input[name=dni]").val("");
                $("#formulario2 input[name=nombre]").val("");
                $("#formulario2 input[name=apellidoPat]").val("");
                $("#formulario2 input[name=apellidoMat]").val("");
                $("#formulario2 input[name=direccion]").val("");
                $("#formulario2 input[name=celular]").val("");

                $("#tablaRepresentantelegal tbody").html('<tr><td valign="top" colspan="8" class="dataTables_empty">Ningun registro de representante legal</td></tr>');
            };

            $.crearClientejuridico = function () {
                $("#formulario").submit();
            };

            $.quitarClientejuridico = function (id) {
                $.ajax({type: 'POST',
                    url: '${pageContext.request.contextPath}/admision/quitarclientejuridico',
                    data: {id: id},
                    dataType: "json",
                    success: function (data) {
                        if (data === 0) {
                            $.notificar("Notificacion", "error", "Error al eliminar el cliente juridico (esto puede ser debido a que tiene cuentas a su nombre) ");
                        }
                        else {
                            $.notificar("Notificacion", "success", "El cliente juridico se elimino correctamente");
                            $("#" + id).hide();
                        }
                    },
                    error: function (xhr, status, error) {
                        $.notificar("Notificacion", "error", "Error: " + error);
                    }
                });
            };

            $.quitarRepresentantelegal = function (dni) {
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/admision/quitarrepresentantelegal",
                    data: {dni: dni},
                    dataType: "json",
                    success: function (data) {
                        var added = '';
                        if (data.length !== 0) {
                            $.each(data, function (i, value) {
                                var json = JSON.parse(value);
                                added += '<tr>' +
                                        '<td>' + (i + 1) + '</td>' +
                                        '<td>' + json.dni + '</td>' +
                                        '<td>' + json.nombre + '</td>' +
                                        '<td>' + json.apellidoPat + '</td>' +
                                        '<td>' + json.direccion + '</td>' +
                                        '<td>' + json.celular + '</td>' +
                                        '<td>' + json.cargo + '</td>' +
                                        '<td class="last">' +
                                        '<a href="javascript:void(0)" onclick="$.quitarRepresentantelegal(' + json.dni + ')" style="color: red">' +
                                        '<i class="fa fa-close"></i> Eliminar' +
                                        '</a>' +
                                        '</td>' +
                                        '</tr>';
                            });

                            $("#tablaRepresentantelegal tbody").html(added);
                        }
                        else {
                            $("#tablaRepresentantelegal tbody").html('<tr><td valign="top" colspan="8" class="dataTables_empty">Ningun registro de representante legal</td></tr>');
                        }
                    },
                    error: function (xhr, status, error) {
                        $.notificar("Notificacion", "error", "Error: " + error);
                    }
                });
            };
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#formulario").validate({
                    rules: {
                        ruc: {
                            required: true,
                            minlength: 11,
                            maxlength: 11
                        },
                        razonSocial: {
                            required: true
                        },
                        nombreComercial: {
                            required: true
                        },
                        giroNegocio: {
                            required: true
                        },
                        direccion: {
                            required: true
                        },
                        telefono: {
                            required: true,
                            minlength: 9,
                            maxlength: 11
                        }
                    },
                    messages: {
                        ruc: {
                            required: "Campo obligatorio",
                            minlength: "El numero ruc debe ser de 11 digitos",
                            maxlength: "El numero ruc debe ser de 11 digitos"
                        },
                        razonSocial: {
                            required: "Campo obligatorio"
                        },
                        nombreComercial: {
                            required: "Campo obligatorio"
                        },
                        giroNegocio: {
                            required: "Campo obligatorio"
                        },
                        direccion: {
                            required: "Campo obligatorio"
                        },
                        telefono: {
                            required: "Campo obligatorio",
                            minlength: "Este campo debe contener al menos {0} caracteres",
                            maxlength: "Este campo no debe debe sobrepasar los {0} caracteres"
                        }
                    },
                    submitHandler: function () {
                        var personajuridica = {
                            ruc: $("#formulario input[name=ruc]").val(),
                            razonSocial: $("#formulario input[name=razonSocial]").val(),
                            nombreComercial: $("#formulario input[name=nombreComercial]").val(),
                            giroNegocio: $("#formulario input[name=giroNegocio]").val(),
                            direccion: $("#formulario input[name=direccion]").val(),
                            distrito: $("#formulario select[name=distrito] option:selected").text(),
                            provincia: $("#formulario select[name=provincia] option:selected").text(),
                            departamento: $("#formulario select[name=departamento] option:selected").text(),
                            pais: $("#formulario select[name=pais] option:selected").text(),
                            telefono: $("#formulario input[name=telefono]").val(),
                            email: $("#formulario input[name=email]").val(),
                            fechaFundacion: $("#formulario input[name=fechaFundacion]").val(),
                            estado: true
                        };

                        $.ajax({
                            type: "POST",
                            url: "${pageContext.request.contextPath}/admision/clientejuridico",
                            contentType: "application/json",
                            data: JSON.stringify(personajuridica),
                            dataType: "json",
                            success: function (data) {
                                if (data !== "0") {
                                    if (data === 2) {
                                        $.notificar("Notificacion", "info", "Error, la persona juridica con el numero ruc que quiere registrar ya existe o no se agregaron representantes legales");
                                    }
                                    else {
                                        $.notificar("Notificacion", "success", "Los datos se han regitrado correctamente");
                                        $.limpiarControles();
                                        $("#tablaPersonajuridica").prepend('<tr id="' + data.id + '">' +
                                                '<td>' + data.codigoCliente + '</td>' +
                                                '<td>' + data.razonSocial + '</td>' +
                                                '<td>' + data.giroNegocio + '</td>' +
                                                '<td>' + data.ruc + '</td>' +
                                                '<td>' + data.direccion + '</td>' +
                                                '<td>' + data.telefono + '</td>' +
                                                '<td>' + data.fechaFundacion + '</td>' +
                                                '<td>' +
                                                '<a href="javascript:void(0)" onclick="$.modificarClientejuridico(' + data.id + ')" data-toggle="modal" data-target="#myModal" style="padding-right: 5px">' +
                                                '<i class="fa fa-pencil"></i> Edit' +
                                                '</a>' +
                                                '</td>' +
                                                '<td>' +
                                                '<a href="javascript:void(0)" onclick="$.quitarClientejuridico(' + data.id + ')" style="color: red">' +
                                                '<i class="fa fa-close"></i> Eliminar' +
                                                '</a>' +
                                                '</td>' +
                                                '<td>' +
                                                '<a target="_blank" href="${pageContext.request.contextPath}/reporte/reporteclientejuridico?type=pdf&&id=' + data.idCliente + '"><i class="fa fa-file-pdf-o fa-2x"></i> Ficha cliente</a>' +
                                                '</td>' +
                                                '</tr>');
                                    }
                                }
                                else {
                                    $.notificar("Notificacion", "error", "Error, se produjo un error al registrar los datos");
                                }

                            },
                            error: function (xhr, status, error) {
                                $.notificar("Notificacion", "error", "Error: " + error);
                            }
                        });
                    }
                });

                $("#formulario2").validate({
                    rules: {
                        nombre: {
                            required: true
                        },
                        apellidoPat: {
                            required: true
                        },
                        apellidoMat: {
                            required: true
                        }, 
                        dni: {
                            required: true,
                            minlength: 8,
                            maxlength: 8
                        },
                        direccion: {
                            required: true
                        }, 
                        celular: {
                            required: true,
                            minlength: 9,
                            maxlength: 11
                        },
                        cargo: {
                            required: true
                        }
                    },
                    messages: {
                        nombre: {
                            required: "Campo obligatorio"
                        },
                        apellidoPat: {
                            required: "Campo obligatorio"
                        },
                        apellidoMat: {
                            required: "Campo obligatorio"
                        },
                        dni: {
                            required: "Campo obligatorio",
                            minlength: "Este campo debe contener al menos {0} caracteres",
                            maxlength: "Este campo no debe debe sobrepasar los {0} caracteres"
                        },
                        direccion: {
                            required: "Campo obligatorio"
                        },
                        celular: {
                            required: "Campo obligatorio",
                            minlength: "Este campo debe contener al menos {0} caracteres",
                            maxlength: "Este campo no debe debe sobrepasar los {0} caracteres"
                        },
                        cargo: {
                            required: "Campo obligatorio"
                        }
                    },
                    submitHandler: function () {
                        var persona = {
                            dni: $("#formulario2 input[name=dni]").val(),
                            nombre: $("#formulario2 input[name=nombre]").val(),
                            apellidoPat: $("#formulario2 input[name=apellidoPat]").val(),
                            apellidoMat: $("#formulario2 input[name=apellidoMat]").val(),
                            direccion: $("#formulario2 input[name=direccion]").val(),
                            celular: $("#formulario2 input[name=celular]").val()
                        };

                        var representantelegal = {
                            cargo: $("#formulario2 input[name=cargo]").val(),
                            persona: persona
                        };

                        $.ajax({
                            type: "POST",
                            url: "${pageContext.request.contextPath}/admision/agregarrepresentantelegal",
                            contentType: "application/json",
                            data: JSON.stringify(representantelegal),
                            dataType: "json",
                            success: function (data) {
                                var added = '';
                                if (data.length !== 0) {
                                    $.each(data, function (i, value) {
                                        var json = JSON.parse(value);
                                        added += '<tr>' +
                                                '<td>' + (i + 1) + '</td>' +
                                                '<td>' + json.dni + '</td>' +
                                                '<td>' + json.nombre + '</td>' +
                                                '<td>' + json.apellidoPat + '</td>' +
                                                '<td>' + json.direccion + '</td>' +
                                                '<td>' + json.celular + '</td>' +
                                                '<td>' + json.cargo + '</td>' +
                                                '<td class="last">' +
                                                '<a href="javascript:void(0)" onclick="$.quitarRepresentantelegal(' + json.dni + ')" style="color: red">' +
                                                '<i class="fa fa-close"></i> Eliminar' +
                                                '</a>' +
                                                '</td>' +
                                                '</tr>';
                                    });
                                    $("#tablaRepresentantelegal tbody").html(added);

                                    $("#formulario2 input[name=dni]").val("");
                                    $("#formulario2 input[name=nombre]").val("");
                                    $("#formulario2 input[name=apellidoPat]").val("");
                                    $("#formulario2 input[name=apellidoMat]").val("");
                                    $("#formulario2 input[name=direccion]").val("");
                                    $("#formulario2 input[name=celular]").val("");
                                    $("#formulario2 input[name=cargo]").val("");
                                }
                                else {
                                    $.notificar("Notificacion", "error", "Error, no puede registrar 2 personas con el dni iguales");
                                }
                            },
                            error: function (xhr, status, error) {
                                $.notificar("Notificacion", "error", "Error: " + error);
                            }
                        });

                    }
                });
            });

            $("#formulario input[name=fechaFundacion]").datepicker({dateFormat: 'yy-mm-dd'});
        </script>
        <script>
            $.mostrarClientejuridico = function (id, denominacion, estado) {
                $("#id2").val(id);
                $("#denominacion2").val(denominacion);
                $("#estado2").val(estado);
            };

            $.modificarClientejuridico = function () {
                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/administrator/publicacion/modificarcategoria',
                    data: {
                        id: $("#id2").val(),
                        denominacion: $("#denominacion2").val(),
                        estado: $("#estado2").val()
                    },
                    dataType: "json",
                    success: function (data) {
                        alert(data);
                        if (data === 0) {
                            alert("Error al registrar");
                        }
                        else {
                            LimpiarControl();
                            $('#myModal').hide();
                            alert("Modificado correctamente...");
                            window.location.href = "${pageContext.request.contextPath}/administrator/publicacion";
                        }
                    },
                    error: function (xhr, status, error) {
                        $.notificar("Notificacion", "error", "Error: " + error);
                    }
                });
            };

            $.cargarDepartamento = function () {
                $.restaurarLabel();
                var idPais = $("#formulario select[name=pais] option:selected").val();
                if (typeof (idPais) === 'undefined') {
                    $("#labelDepartamento").html('Departamento <span class="label label-info">Seleccione pais</span>');
                }
                else {
                    $.ajax({
                        type: 'POST',
                        url: '${pageContext.request.contextPath}/admision/cargardepartamento',
                        data: {idPais: $("#formulario select[name=pais] option:selected").val()},
                        dataType: "json",
                        success: function (data) {
                            if (data.length !== 0) {
                                var added = '';
                                $.each(data, function (i, value) {
                                    var json = JSON.parse(value);
                                    added += '<option value="' + json.id + '">' + json.nombre + '</option>';
                                });
                                $("#formulario select[name=departamento]").html(added);
                            }
                            else {
                                $("#formulario select[name=departamento]").html('');
                                $("#formulario select[name=provincia]").html('');
                                $("#formulario select[name=distrito]").html('');
                            }
                        },
                        error: function (xhr, status, error) {
                            $.notificar("Notificacion", "error", "Error: " + error);
                        }
                    });
                }
            };

            $.cargarProvincia = function () {
                var idDepartamento = $("#formulario select[name=departamento] option:selected").val();
                if (typeof (idDepartamento) === 'undefined') {
                    $("#labelProvincia").html('Provincia <span class="label label-info">Seleccione departamento</span>');
                }
                else {
                    $.ajax({
                        type: 'POST',
                        url: '${pageContext.request.contextPath}/admision/cargarprovincia',
                        data: {idDepartamento: $("#formulario select[name=departamento] option:selected").val()},
                        dataType: "json",
                        success: function (data) {
                            if (data.length !== 0) {
                                var added = '';
                                $.each(data, function (i, value) {
                                    var json = JSON.parse(value);
                                    added += '<option value="' + json.id + '">' + json.nombre + '</option>';
                                });
                                $("#formulario select[name=provincia]").html(added);
                            }
                            else {
                                $("#formulario select[name=provincia]").html('');
                                $("#formulario select[name=distrito]").html('');
                            }
                        },
                        error: function (xhr, status, error) {
                            $.notificar("Notificacion", "error", "Error: " + error);
                        }
                    });
                }
            };

            $.cargarDistrito = function () {
                var idProvincia = $("#formulario select[name=provincia] option:selected").val();
                if (typeof (idProvincia) === 'undefined') {
                    $("#labelDistrito").html('Distrito <span class="label label-info">Seleccione provincia</span>');
                }
                else {
                    $.ajax({
                        type: 'POST',
                        url: '${pageContext.request.contextPath}/admision/cargardistrito',
                        data: {idProvincia: $("#formulario select[name=provincia] option:selected").val()},
                        dataType: "json",
                        success: function (data) {
                            if (data.length !== 0) {
                                var added = '';
                                $.each(data, function (i, value) {
                                    var json = JSON.parse(value);
                                    added += '<option value="' + json.id + '">' + json.nombre + '</option>';
                                });
                                $("#formulario select[name=distrito]").html(added);
                            }
                            else {
                                $("#formulario select[name=distrito]").html('');
                            }
                        },
                        error: function (xhr, status, error) {
                            $.notificar("Notificacion", "error", "Error: " + error);
                        }
                    });
                }
            };

            $.restaurarLabel = function () {
                $("#labelDepartamento").html('Departamento');
                $("#labelProvincia").html('Provincia');
                $("#labelDistrito").html('Distrito');
            };
        </script>
    </body>
</html>
