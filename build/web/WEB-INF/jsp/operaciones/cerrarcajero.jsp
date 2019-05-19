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
                                <h5>Cajero: <i>${cajero.usuario.usuario}</i> </h5>
                                <h5>Saldo: <i id="saldoCajero">${cajero.saldoCierre}</i></h5>
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
                                        <h2>Cerrar caja <i class="fa fa-book"></i></h2>
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
                                                    <input id="cajero" class="form-control" placeholder="ID" disabled="" value="${cajero.id}" type="number">
                                                </div>
                                                <div class="col-ss-12 col-xs-11">
                                                    <label>Caja</label>
                                                    <input class="form-control" placeholder="CAJA" disabled="" value="${cajero.caja.nombre}" type="text">
                                                </div>
                                                <div class="col-ss-12 col-xs-1">
                                                    <label>Cajero</label>
                                                    <input class="form-control" placeholder="CAJERO" disabled="" value="${cajero.usuario.usuario}" type="text">
                                                </div>
                                                <div class="col-ss-12 col-xs-11">
                                                    <label>Estado</label>
                                                    <input class="form-control" placeholder="ESTADO" disabled="" value="${cajero.cerrado}" type="text">
                                                </div>

                                                <div class="col-ss-12 col-xs-10 col-sm-10">
                                                    <div class="row">
                                                        <div class="col-ss-12 col-xs-4">
                                                            <label>Fecha apertura</label>
                                                            <input class="form-control" disabled="" style="text-align: center; color:  #322660" value="<fmt:formatDate pattern="YYYY-MM-dd" value="${cajero.fechaApertura}"></fmt:formatDate>" type="text">
                                                            </div>
                                                            <div class="col-ss-12 col-xs-4">
                                                                <label>Hora apertura</label>
                                                                <input class="form-control" disabled="" style="text-align: center; color:  #322660" value="<fmt:formatDate pattern="HH:ss" value="${cajero.fechaApertura}"></fmt:formatDate>" type="text">
                                                            </div>
                                                            <div class="col-ss-12 col-xs-4">
                                                                <label>Saldo inicio</label>
                                                                <input class="form-control" disabled="" style="text-align: center; color:  #322660" value="${cajero.saldoApertura}" type="number">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-ss-12 col-xs-10 col-sm-10">
                                                    <div class="row">
                                                        <div class="col-ss-12 col-xs-4">
                                                            <label>Fecha cierre</label>
                                                            <input class="form-control" disabled="" style="text-align: center; color:  #322660" value="<fmt:formatDate pattern="YYYY-MM-dd" value="${cajero.fechaCierre}"></fmt:formatDate>" type="text">
                                                            </div>
                                                            <div class="col-ss-12 col-xs-4">
                                                                <label>Hora cierre</label>
                                                                <input class="form-control" disabled="" style="text-align: center; color:  #322660" value="<fmt:formatDate pattern="HH:ss" value="${cajero.fechaCierre}"></fmt:formatDate>" type="text">
                                                            </div>
                                                            <div class="col-ss-12 col-xs-4">
                                                                <label>Saldo final</label>
                                                                <input id="saldoFinal" class="form-control" disabled="" style="text-align: center; color:  #322660" value="${cajero.saldoCierre}" type="number">
                                                        </div>
                                                    </div>
                                                </div>        
                                                <!-- DATOS ADICIONALES-->
                                                <div class="col-ss-12 col-xs-12 col-sm-12" style="margin-top: 10px">
                                                    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                            <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Detalle cierre bobeda</a>
                                                            </li>
                                                        </ul>
                                                        <div id="myTabContent" class="tab-content">
                                                            <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                                                                <div class="row">
                                                                    <div class="col-ss-12 col-xs-6">
                                                                        <fieldset>
                                                                            <legend style="font-family: Cambria">Inicio del dia</legend>
                                                                            <table class="table table-striped" id="detallesaldoCajeroInicial">
                                                                                <thead>
                                                                                    <tr class="headings">
                                                                                        <th class="column-title">Denominacion</th>
                                                                                        <th class="column-title">Valor</th>
                                                                                        <th class="column-title">Cantidad</th>
                                                                                        <th class="column-title">Total</th>
                                                                                        <th class="column-title">Accion</th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    <c:forEach var="item" items="${listaDscApertura}">
                                                                                        <tr>
                                                                                            <td>${item.denominacion}</td>
                                                                                            <td>${item.valor}</td>
                                                                                            <td>${item.cantidad}</td>
                                                                                            <td>${item.monto}</td>
                                                                                        </tr>
                                                                                    </c:forEach>
                                                                                </tbody>
                                                                            </table>
                                                                        </fieldset>
                                                                    </div>
                                                                    <div class="col-ss-12 col-xs-6">
                                                                        <fieldset>
                                                                            <legend style="font-family: Cambria">Fin del dia</legend>
                                                                            <table class="table table-striped" id="detallesaldoCajeroFinal">
                                                                                <thead>
                                                                                    <tr class="headings">
                                                                                        <th class="column-title">Denominacion</th>
                                                                                        <th class="column-title">Valor</th>
                                                                                        <th class="column-title" style="text-align: center">Cantidad</th>
                                                                                        <th class="column-title">Total</th>
                                                                                        <th class="column-title" style="text-align: center">Opcion</th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <select onchange="$.calcular()">
                                                                                                <option value="200">DOSCIENTOS</option>
                                                                                                <option value="100">CIEN</option>
                                                                                                <option value="50">CINCUENTA</option>
                                                                                                <option value="20">VEINTE</option>
                                                                                                <option value="10">DIEZ</option>
                                                                                                <option value="5">CINCO</option>
                                                                                                <option value="2">DOS</option>
                                                                                                <option value="1">UN SOL</option>
                                                                                                <option value="0.5">CINCUENTA CENTIMOS</option>
                                                                                                <option value="0.2">VEINTE CENTIMOS</option>
                                                                                                <option value="0.1">DIEZ CENTIMOS</option>
                                                                                            </select>
                                                                                        </td>
                                                                                        <td>200.00</td>
                                                                                        <td contenteditable="true" onkeyup="$.calcular()" style="background-color: #E9EFF8;text-align: center">0</td>
                                                                                        <td>0.0</td>
                                                                                        <td style="text-align: center">
                                                                                            <a href="javascript:void(0)" onclick="$.quitarCelda($(this).parent().parent())"><i class="fa fa-close" style="color: red"></i></a>
                                                                                        </td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                            <a href="javascript:void(0)" onclick="$.agregarCelda()"><i class="fa fa-plus" style="color: blue">Agregar celda</i></a>
                                                                            <div style="text-align: right">
                                                                                <b>TOTAL SALDO APERTURA: </b><b id="totalSaldoFinal">0.0</b>
                                                                            </div>
                                                                        </fieldset>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <button onclick="$.cerrarCajero()">Cerrar Cajero</button>
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

                                                                        $.calcular = function () {
                                                                            var valorTotal = 0.0;
                                                                            var valor = 0.0;
                                                                            var cantidad = 0;
                                                                            $("#detallesaldoCajeroFinal tbody tr").each(function (index)
                                                                            {
                                                                                $(this).children("td").each(function (index2)
                                                                                {
                                                                                    if (index2 === 0) {
                                                                                        valor = parseFloat($(this).children().find('option:selected').val());
                                                                                    }
                                                                                    if (index2 === 1) {
                                                                                        $(this).text(valor);
                                                                                    }
                                                                                    if (index2 === 2) {
                                                                                        cantidad = parseFloat($(this).text());
                                                                                    }
                                                                                    if (index2 === 3) {
                                                                                        $(this).text((valor * cantidad).toFixed(2));
                                                                                        valorTotal += parseFloat($(this).text());
                                                                                    }
                                                                                });
                                                                            });
                                                                            $("#totalSaldoFinal").html(parseFloat(valorTotal).toFixed(2));
                                                                        };

                                                                        $.agregarCelda = function () {
                                                                            $("#detallesaldoCajeroFinal tbody").append('<tr><td>' +
                                                                                    '<select onchange="$.calcular()">' +
                                                                                    '<option value="200">DOSCIENTOS</option>' +
                                                                                    '<option value="100">CIEN</option>' +
                                                                                    '<option value="50">CINCUENTA</option>' +
                                                                                    '<option value="20">VEINTE</option>' +
                                                                                    '<option value="10">DIEZ</option>' +
                                                                                    '<option value="5">CINCO</option>' +
                                                                                    '<option value="2">DOS</option>' +
                                                                                    '<option value="1">UN SOL</option>' +
                                                                                    '<option value="0.5">CINCUENTA CENTIMOS</option>' +
                                                                                    '<option value="0.2">VEINTE CENTIMOS</option>' +
                                                                                    '<option value="0.1">DIEZ CENTIMOS</option>' +
                                                                                    '</select>' +
                                                                                    '</td>' +
                                                                                    '<td>200.00</td>' +
                                                                                    '<td contenteditable="true" onkeyup="$.calcular()" style="background-color: #E9EFF8;text-align: center">0</td>' +
                                                                                    '<td>0.0</td>' +
                                                                                    '<td style="text-align: center"><a href="javascript:void(0)" onclick="$.quitarCelda($(this).parent().parent())"><i class="fa fa-close" style="color: red"></i></a></td>' +
                                                                                    '</tr>');
                                                                        };

                                                                        $.quitarCelda = function (dom) {
                                                                            dom.remove();

                                                                            $.calcular();
                                                                        };

                                                                        $.cerrarCajero = function () {
                                                                            var listadetallesaldocajero = [];
                                                                            var cajero = {
                                                                                id: $("#cajero").val()
                                                                            };

                                                                            var valorTotal = 0.0;
                                                                            var denominacion = '';
                                                                            var valor = 0.0;
                                                                            var cantidad = 0;
                                                                            var total = 0.0;

                                                                            $("#detallesaldoCajeroFinal tbody tr").each(function (index)
                                                                            {
                                                                                $(this).children("td").each(function (index2)
                                                                                {
                                                                                    if (index2 === 0) {
                                                                                        denominacion = $(this).children().find('option:selected').text();
                                                                                        valor = parseFloat($(this).children().find('option:selected').val());
                                                                                    }
                                                                                    if (index2 === 1) {
                                                                                        $(this).text(valor);
                                                                                    }
                                                                                    if (index2 === 2) {
                                                                                        cantidad = parseFloat($(this).text());
                                                                                    }
                                                                                    if (index2 === 3) {
                                                                                        $(this).text((valor * cantidad).toFixed(2));
                                                                                        total = parseFloat($(this).text());
                                                                                        valorTotal += parseFloat($(this).text());
                                                                                    }
                                                                                });
                                                                                listadetallesaldocajero.push({denominacion: denominacion, valor: valor, cantidad: cantidad, monto: total, apertura: false, cajero: cajero});
                                                                            });

                                                                            if (parseFloat(valorTotal).toFixed(2) === parseFloat($("#saldoFinal").val()).toFixed(2)) {
                                                                                $.ajax({
                                                                                    type: "POST",
                                                                                    url: "${pageContext.request.contextPath}/operaciones/cerrarcajero",
                                                                                    contentType: "application/json",
                                                                                    data: JSON.stringify(listadetallesaldocajero),
                                                                                    dataType: "json",
                                                                                    success: function (data) {
                                                                                        if (data === 0) {
                                                                                            $.notificar("Notificacion", "error", "Error, se produjo un error al realizar el cierre de caja");
                                                                                        }
                                                                                        else {
                                                                                            if (data === 2) {
                                                                                                $.notificar("Notificacion", "error", "Error, el estado de la caja esta cerrada no podra realizar operaciones hasta volver a abrirla.");
                                                                                            }
                                                                                            else {
                                                                                                if (data === 3) {
                                                                                                    $.notificar("Notificacion", "warning", "El monto total ingresado del detalle saldo final y el saldo final de cierre no coinciden");
                                                                                                } else {
                                                                                                    if (data === 10) {
                                                                                                        window.location.href = "${pageContext.request.contextPath}/home";
                                                                                                    }
                                                                                                    else {
                                                                                                        window.location.href = "${pageContext.request.contextPath}/reporte/recibotransferencia?type=pdf&&idTipo=4&&id=" + data.idTransaccion;
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    },
                                                                                    error: function (xhr, status, error) {
                                                                                        $.notificar("Notificacion", "error", "Error: " + error);
                                                                                    }
                                                                                });
                                                                            }
                                                                            else {
                                                                                $.notificar("Notificacion", "warning", "El monto total ingresado del detalle saldo final y el saldo final de cierre no coinciden");
                                                                            }
                                                                        };
        </script>
    </body>
</html>
