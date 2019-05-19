<%-- 
    Document   : index
    Created on : 13/02/2016, 03:29:06 AM
    Author     : nerio
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%SimpleDateFormat formateadorFecha = new SimpleDateFormat("EEEE d MMMM yyyy (HH:mm");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transacciones cajero</title>
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
                                <h4>Cierre de bobeda </h4>
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
                                        <h2>Cerrar bobeda <i class="fa fa-book"></i></h2>
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
                                                <div class="col-ss-12 col-xs-1">
                                                    <label>Id</label>
                                                    <input class="form-control" placeholder="ID" disabled="" value="${bobeda.id}" type="number">
                                                </div>
                                                <div class="col-ss-12 col-xs-8">
                                                    <label>Nombre</label>
                                                    <input class="form-control" placeholder="NOMBRE" disabled="" value="${bobeda.nombre}" type="text">
                                                </div>
                                                <div class="col-ss-12 col-xs-3">
                                                    <label>Moneda</label>
                                                    <input class="form-control" placeholder="NOMBRE" disabled="" value="${bobeda.moneda}" type="text">
                                                </div>

                                                <div class="col-ss-12 col-xs-10 col-sm-10">
                                                    <div class="row">
                                                        <div class="col-ss-12 col-xs-4">
                                                            <label>Fecha apertura</label>
                                                            <input class="form-control" disabled="" style="text-align: center; color:  #322660" value="<fmt:formatDate pattern="YYYY-MM-dd" value="${bobeda.fechaApertura}"></fmt:formatDate>" type="text">
                                                            </div>
                                                            <div class="col-ss-12 col-xs-4">
                                                                <label>Hora apertura</label>
                                                                <input class="form-control" disabled="" style="text-align: center; color:  #322660" value="<fmt:formatDate pattern="HH:ss" value="${bobeda.fechaApertura}"></fmt:formatDate>" type="text">
                                                            </div>
                                                            <div class="col-ss-12 col-xs-4">
                                                                <label>Saldo inicio</label>
                                                                <input class="form-control" disabled="" style="text-align: center; color:  #322660" value="${bobeda.montoApertura}" type="text">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-ss-12 col-xs-10 col-sm-10">
                                                    <div class="row">
                                                        <div class="col-ss-12 col-xs-4">
                                                            <label>Fecha cierre</label>
                                                            <input class="form-control" disabled="" style="text-align: center; color:  #322660" value="<fmt:formatDate pattern="YYYY-MM-dd" value="${bobeda.fechaCierre}"></fmt:formatDate>" type="text">
                                                            </div>
                                                            <div class="col-ss-12 col-xs-4">
                                                                <label>Hora cierre</label>
                                                                <input class="form-control" disabled="" style="text-align: center; color:  #322660" value="<fmt:formatDate pattern="HH:ss" value="${bobeda.fechaCierre}"></fmt:formatDate>" type="text">
                                                            </div>
                                                            <div class="col-ss-12 col-xs-4">
                                                                <label>Saldo final</label>
                                                                <input id="saldoFinal" class="form-control" disabled="" style="text-align: center; color:  #322660" value="${bobeda.montoCierre}" type="text">
                                                        </div>
                                                    </div>
                                                </div>        
                                                <!-- DATOS ADICIONALES-->
                                                <div class="col-ss-12 col-xs-12 col-sm-12" style="margin-top: 10px">
                                                    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                            <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Detalle de cajeros abiertos</a>
                                                            </li>
                                                        </ul>
                                                        <div id="myTabContent" class="tab-content">
                                                            <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                                                                <div class="row">
                                                                    <div class="col-ss-12 col-xs-12">
                                                                        <fieldset>
                                                                            <legend style="font-family: Cambria">Cajeros</legend>
                                                                            <table class="table table-striped" id="detalleCajero">
                                                                                <thead>
                                                                                    <tr class="headings">
                                                                                        <th class="column-title">Caja</th>
                                                                                        <th class="column-title">Usuario</th>
                                                                                        <th class="column-title">Persona</th>
                                                                                        <th class="column-title">Esta cerrado</th>
                                                                                        <th class="column-title">Accion</th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    <c:forEach var="item" items="${listaCajero}">
                                                                                        <tr>
                                                                                            <td>${item.caja.nombre}</td>
                                                                                            <td>${item.usuario.usuario}</td>
                                                                                            <td>${item.usuario.empleado.persona.nombre} ${item.usuario.empleado.persona.apellidoPat}</td>
                                                                                            <c:choose>
                                                                                                <c:when test="${item.cerrado eq true}">
                                                                                                    <td style="color: red">CERRADO</td>
                                                                                                </c:when>  
                                                                                                <c:otherwise>
                                                                                                    <td style="color:blue">ABIERTO</td>
                                                                                                </c:otherwise>
                                                                                            </c:choose>
                                                                                            <c:choose>
                                                                                                <c:when test="${item.idEstado eq 10}">
                                                                                                    <td><button class="btn btn-danger btn-xs" onclick="$.cerrarCajapendiente(${item.id})">Cerrar</button></td>
                                                                                                </c:when>  
                                                                                                <c:otherwise>
                                                                                                    <td>-</td>
                                                                                                </c:otherwise>
                                                                                            </c:choose>
                                                                                        </tr>
                                                                                    </c:forEach>
                                                                                </tbody>
                                                                            </table>
                                                                        </fieldset>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <a onclick="$.cerrarBobeda(${bobeda.id})" class="btn btn-primary">Cerrar Bobeda</a>
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

                                                                        $.cerrarBobeda = function (id) {
                                                                            var cantidad = 0;

                                                                            $("#detalleCajero tbody tr").each(function (index)
                                                                            {
                                                                                $(this).children("td").each(function (index2)
                                                                                {
                                                                                    if (index2 === 3) {
                                                                                        var estado = $(this).text();
                                                                                        if (estado === "ABIERTO") {
                                                                                            cantidad += 1;
                                                                                        }
                                                                                    }
                                                                                });
                                                                            });

                                                                            if (cantidad > 0) {
                                                                                $.notificar("Notificacion", "warning", "Tiene que cerrar todas los cajeros abiertos antes de cerrar la bobeda");
                                                                            }
                                                                            else {
                                                                                $.ajax({
                                                                                    type: "POST",
                                                                                    url: "${pageContext.request.contextPath}/operaciones/cerrarbobeda",
                                                                                    data: {id: id},
                                                                                    dataType: "json",
                                                                                    success: function (data) {
                                                                                        if (data === 0) {
                                                                                            $.notificar("Notificacion", "error", "Error, se produjo un error al realizar el cierre de bobeda");
                                                                                        }
                                                                                        else {
                                                                                            if (data === 2) {
                                                                                                $.notificar("Notificacion", "warning", "Tiene que cerrar todas los cajeros abiertos antes de cerrar la bobeda");
                                                                                            }
                                                                                            else {
                                                                                                window.location.href = "${pageContext.request.contextPath}/operaciones/bobeda";
                                                                                            }
                                                                                        }
                                                                                    },
                                                                                    error: function (xhr, status, error) {
                                                                                        $.notificar("Notificacion", "error", "Error: " + error);
                                                                                    }
                                                                                });
                                                                            }
                                                                        };

                                                                        $.cerrarCajapendiente = function (id) {
                                                                            $.ajax({
                                                                                type: "POST",
                                                                                url: "${pageContext.request.contextPath}/operaciones/cerrarcajapendiente",
                                                                                data: {id: id},
                                                                                dataType: "json",
                                                                                success: function (data) {
                                                                                    if (data === 0) {
                                                                                        $.notificar("Notificacion", "error", "Error, se produjo un error al realizar el cierre de la caja pendiente");
                                                                                    }
                                                                                    else {
                                                                                        window.location.href = "${pageContext.request.contextPath}/operaciones/bobeda";
                                                                                    }
                                                                                },
                                                                                error: function (xhr, status, error) {
                                                                                    $.notificar("Notificacion", "error", "Error: " + error);
                                                                                }
                                                                            });
                                                                        };
        </script>
    </body>
</html>
