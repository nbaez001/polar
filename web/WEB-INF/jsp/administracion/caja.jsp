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
        <title>Agregar cajas</title>
        <%@include file="../shared/favicon.jsp" %>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap-3.3.6.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/fonts/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/animate/animate.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/admin/site.css" rel="stylesheet" type="text/css"/>

        <link href="${pageContext.request.contextPath}/assets/css/admin/custom.css" rel="stylesheet" type="text/css"/>
        <!--  Estilos de error  -->
        <link href="${pageContext.request.contextPath}/assets/css/admin/cmxform.css" rel="stylesheet" type="text/css"/>

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
                                <h4>Administracion de cajas </h4>
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
                                        <h2>Crear nueva caja  <i class="fa fa-book"></i></h2>
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
                                                        <label>Agencia</label>
                                                        <select name="agencia" class="form-control">
                                                            <c:forEach var="item" items="${listaAgencia}">
                                                                <option value="${item.id}">${item.nombre}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Nombre (*)</label>
                                                        <input name="nombre" class="form-control" placeholder="NOMBRE" type="text">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-12" style="padding-top: 10px">
                                                        <input id="crear" type="submit" value="Crear" class="btn btn-primary">
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12 col-sm-12 col-xs-12 col-ss-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Cajas</h2>
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
                                                    <th>N° </th>
                                                    <th>Nombre </th>
                                                    <th>Estado </th>
                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                    </th>
                                                </tr>
                                            </thead>

                                            <tbody id="tablaCaja">
                                                <c:set var="count" value="0" scope="page" />
                                                <c:forEach var="item" items="${listaCaja}">
                                                    <c:set var="count" value="${count + 1}" scope="page"/>
                                                    <tr id="${item.id}">
                                                        <td>${count}</td>
                                                        <td>${item.nombre}</td>
                                                        <td>${item.estado}</td>
                                                        <td class=" last">
                                                            <a href="javascript:void(0)" onclick="$.quitarCaja(${item.id})" style="color: red">
                                                                <i class="fa fa-close"></i> Eliminar
                                                            </a>
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

        <script src="${pageContext.request.contextPath}/assets/js/datatables/jquery.dataTables.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/icheck/icheck.min.js" type="text/javascript"></script>

        <script type="text/javascript">
                            var asInitVals = new Array();
                            $(document).ready(function () {
                                var oTable = $('#example').dataTable({
                                    "oLanguage": {
                                        "sSearch": "Buscar en todas las columnas:"
                                    },
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

            $.limpiarControles = function () {
                $("#formulario input[name=nombre]").val("");
            };

            $.quitarCaja = function (id) {
                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/administracion/quitarcaja',
                    data: {id: id},
                    dataType: "json",
                    success: function (data) {
                        if (data === 0) {
                            $.notificar("Notificacion", "error", "Error al eliminar el caja (esto puede ser debido a que tiene operaciones realizadas) ");
                        }
                        else {
                            $.notificar("Notificacion", "success", "La caja se elimino correctamente");
                            $("#" + id).hide();
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
                        nombre: {
                            required: true
                        },
                        agencia: {
                            required: true
                        }
                    },
                    messages: {
                        nombre: {
                            required: "Campo obligatorio"
                        },
                        agencia: {
                            required: "Campo obligatorio"
                        }
                    },
                    submitHandler: function () {
                        var caja = {
                            nombre: $("#formulario select[name=agencia] option:selected").text() + ' - ' + $("#formulario input[name=nombre]").val(),
                            estado: true
                        };

                        $.ajax({
                            type: "POST",
                            url: "${pageContext.request.contextPath}/administracion/caja",
                            contentType: "application/json",
                            data: JSON.stringify(caja),
                            dataType: "json",
                            success: function (data) {
                                if (data !== "0") {
                                    $.notificar("Notificacion", "success", "Los datos se han regitrado correctamente");
                                    $.limpiarControles();
                                    $("#tablaCaja").prepend('<tr id="' + data.id + '">' +
                                            '<td>-</td>' +
                                            '<td>' + data.nombre + '</td>' +
                                            '<td>' + data.estado + '</td>' +
                                            '<td class="last">' +
                                            '<a href="javascript:void(0)" onclick="$.quitarCaja(' + data.id + ')" style="color: red">' +
                                            '<i class="fa fa-close"></i> Eliminar' +
                                            '</a>' +
                                            '</td>' +
                                            '</tr>');
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
            });
        </script>
    </body>
</html>
