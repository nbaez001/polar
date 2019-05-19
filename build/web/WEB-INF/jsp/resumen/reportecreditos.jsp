<%-- 
    Document   : index
    Created on : 13/02/2016, 03:29:06 AM
    Author     : nerio
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resumen creditos</title>
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
                                <h4>Administracion de creditos otorgados</h4>
                            </div>

                            <div class="title_right">
                                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Buscar...">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">Ir!</button>
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
                                        <h2>Busqueda de creditos otorgados <i class="fa fa-book"></i></h2>
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
                                        <div class="row">
                                            <div class="col-ss-12 col-xs-12">
                                                <fieldset>
                                                    <div class="row" style="padding-bottom: 10px">
                                                        <div class="col-ss-12 col-xs-6">
                                                            <select id="opcionCliente" class="form-control" style="color: #322660">
                                                                <option value="0">SELECCIONAR</option>
                                                                <option value="1">REPORTE POR PRODUCTO CREDITO</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div id="opcionPorproductocredito" class="row" hidden="">
                                                        <form id="formulario">
                                                            <div class="col-ss-12 col-xs-4 col-sm-3">
                                                                <label>Agencia</label>
                                                                <select name="agencia" class="form-control">
                                                                    <c:forEach var="item" items="${listaAgencia}">
                                                                        <option value="${item.id}">${item.nombre}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="col-ss-12 col-xs-4 col-sm-3">
                                                                <label>Producto credito</label>
                                                                <select name="productoCredito" class="form-control">
                                                                    <option value="0">TODOS</option>
                                                                    <c:forEach var="item" items="${listaProductocredito}">
                                                                        <option value="${item.id}">${item.nombre}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="col-ss-12 col-xs-4 col-sm-3">
                                                                <label>Fecha inicial</label>
                                                                <input name="fechaInicio" class="form-control" placeholder="FECHA INICIO">  
                                                            </div>
                                                            <div class="col-ss-12 col-xs-4 col-sm-3">
                                                                <label>Fecha inicial</label>
                                                                <input name="fechaFin" class="form-control" placeholder="FECHA FIN">  
                                                            </div>
                                                            <div class="col-ss-12 col-xs-4 col-sm-3" style="padding-top: 23px">
                                                                <button type="submit" class="btn btn-primary">Buscar</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </fieldset>
                                            </div>
                                        </div>
                                        <div class="row" style="padding-top: 15px">
                                            <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                                <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                    <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Registro de busqueda</a>
                                                    </li>
                                                </ul>
                                                <div id="myTabContent" class="tab-content">
                                                    <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                                                        <div class="panel panel-default">
                                                            <div class="panel-body">
                                                                <fieldset>
                                                                    <legend style="font-family: Cambria">Creditos otorgados</legend>
                                                                    <div class="row">
                                                                        <div class="col-ss-12 col-xs-12">
                                                                            <table class="table table-striped responsive-utilities jambo_table bulk_action" id="tablaBuscarcliente">
                                                                                <thead>
                                                                                    <tr class="headings">
                                                                                        <th>N° </th>
                                                                                        <th>Dni</th>
                                                                                        <th>Nombre </th>
                                                                                        <th>Apellidos</th>
                                                                                        <th>Codigo cliente</th>
                                                                                        <th>Numero cuentas con mora</th>
                                                                                        <th>Accion</th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td>*</td>
                                                                                        <td>*</td>
                                                                                        <td>*</td>
                                                                                        <td>*</td>
                                                                                        <td>*</td>
                                                                                        <td>*</td>
                                                                                        <td>*</td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </fieldset>
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
                    <%@include file="../shared/footer.jsp" %>
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

        <script src="${pageContext.request.contextPath}/assets/js/icheck/icheck.min.js" type="text/javascript"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $("#opcionCliente").change(function () {
                    var val = $("#opcionCliente").val();
                    if (val === "1") {
                        $("#opcionPorproductocredito").show();
                    }
                    else {
                        $("#opcionPorproductocredito").hide();
                    }
                });

                $("#formulario").validate({
                    rules: {
                        fechaInicio: {
                            required: true
                        },
                        fechaFin: {
                            required: true
                        },
                        agencia: {
                            required: true
                        },
                        productoCredito: {
                            required: true
                        }
                    },
                    messages: {
                        fechaInicio: {
                            required: "Campo obligatorio"
                        },
                        fechaFin: {
                            required: "Campo obligatorio"
                        },
                        agencia: {
                            required: "Campo obligatorio"
                        },
                        productoCredito: {
                            required: "Campo obligatorio"
                        }
                    },
                    submitHandler: function () {
                        $.ajax({
                            type: 'POST',
                            url: '${pageContext.request.contextPath}/resumen/resumencreditosporfechas',
                            data: {fechaInicio: $("#formulario input[name=fechaInicio]").val(), fechaFin: $("#formulario input[name=fechaFin]").val(), idProductoCredito: $("#formulario select[name=productoCredito] option:selected").val()},
                            dataType: "json",
                            success: function (data) {
                                var added = '<thead><tr class="headings">' +
                                        '<th>N° </th>' +
                                        '<th>Codigo </th>' +
                                        '<th>Nombre </th>' +
                                        '<th>Forma pago </th>' +
                                        '<th>Tasa de interes </th>' +
                                        '<th>Numero cuentas</th>' +
                                        '<th>Accion</th>' +
                                        '</tr></thead><tbody>';
                                if (data.length !== 0) {
                                    $.each(data, function (i, value) {
                                        var json = JSON.parse(value);
                                        added += '<tr>' +
                                                '<td>' + (i + 1) + '</td>' +
                                                '<td>' + json.codigo + '</td>' +
                                                '<td>' + json.nombre + '</td>' +
                                                '<td>' + json.formaPago + '</td>' +
                                                '<td>' + json.tasa + '</td>' +
                                                '<td style="color:red">' + json.numero + ' cuenta(s)</td>' +
                                                '<td class=" last"><a target="_blank" href="${pageContext.request.contextPath}/reporte/reportecreditosotorgado?type=pdf&&agencia=' + $("#formulario select[name=agencia] option:selected").text() + '&&fechaInicio=' + $("#formulario input[name=fechaInicio]").val() + '&&fechaFin=' + $("#formulario input[name=fechaFin]").val() + '&&id=' + json.id + '"><i class="fa fa-file-pdf-o fa-2x"></i> Reporte creditos otorgados</a></td></tr>';
                                    });
                                    added += '<tr class="odd"><td valign="top" colspan="8" class="dataTables_empty"><a target="_blank" href="${pageContext.request.contextPath}/reporte/reportegeneralcreditosotorgado?type=pdf&&agencia=' + $("#formulario select[name=agencia] option:selected").text() + '&&fechaInicio=' + $("#formulario input[name=fechaInicio]").val() + '&&fechaFin=' + $("#formulario input[name=fechaFin]").val() + '" style="color:blue"><i class="fa fa-file-pdf-o fa-2x"></i> Imprimir reporte general de creditos otorgados por producto</a></td></tr>';
                                    added += '</tbody>';
                                    $("#tablaBuscarcliente").html(added);
                                }
                                else {
                                    added += '<tr class="odd"><td valign="top" colspan="8" class="dataTables_empty">No se encontraron resultados</td></tr></tbody>';
                                    $("#tablaBuscarcliente").html(added);
                                }

                            },
                            error: function (xhr, status, error) {
                                $.notificar("Notificacion", "error", "Error: " + error);
                            }
                        });
                    }
                });
            });

            $("#formulario input[name=fechaInicio]").datepicker({dateFormat: 'yy-mm-dd'});
            $("#formulario input[name=fechaFin]").datepicker({dateFormat: 'yy-mm-dd'});
        </script>
        <script type="text/javascript">
            $.notificar = function (titulo, tipo, mensaje) {
                new PNotify({
                    title: titulo,
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
        </script>
    </body>
</html>
