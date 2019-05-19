<%-- 
    Document   : index
    Created on : 13/02/2016, 03:29:06 AM
    Author     : nerio
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear cuenta credito</title>
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
                                <h4>Administracion de cuenta credito</h4>
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
                                        <h2>Crear cuenta credito <i class="fa fa-book"></i></h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li>
                                                <a href="#"><i class="fa fa-chevron-up"></i></a>
                                            </li>
                                            <li class="dropdown">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
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
                                                    <div class="col-ss-12 col-xs-3 col-sm-3">
                                                        <label>Codigo</label>
                                                        <input name="cuentaCredito" class="form-control" value="${codigoCuentacredito}" disabled="true" type="text">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-12 col-sm-12">
                                                        <label>Cliente (*)</label>
                                                        <div class="row">
                                                            <input name="idCliente" hidden="" type="number">
                                                            <div class="col-ss-3 col-xs-3 col-sm-2" style="padding-right: 0px">
                                                                <input id="codigoCliente" class="form-control" value="CC-000000" disabled="" style="text-align: center; color:  #322660" type="text">
                                                            </div>
                                                            <div class="col-ss-9 col-xs-9 col-sm-8" style="padding-left: 0px">
                                                                <input name="nombreCliente" id="nombreCliente" class="form-control" placeholder="CLIENTE" data-toggle="modal" data-target="#modalBuscarcliente" type="text">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-12 col-sm-12">
                                                        <label>Producto credito (*)</label>
                                                        <div class="row">
                                                            <input name="idProductocredito" hidden="" type="number">
                                                            <div class="col-ss-3 col-xs-3 col-sm-2" style="padding-right: 0px">
                                                                <input id="codigoProductocredito" class="form-control" value="PC-000000" disabled="" style="text-align: center; color:  #322660" type="text">
                                                            </div>
                                                            <div class="col-ss-9 col-xs-9 col-sm-8" style="padding-left: 0px">
                                                                <input name="nombreProductocredito" id="nombreProductocredito" class="form-control" placeholder="PRODUCTO CREDITO" data-toggle="modal" data-target="#modalBuscarproductocredito" type="text">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Moneda</label>
                                                        <input name="moneda" id="moneda" class="form-control" placeholder="MONEDA" disabled="" type="text">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Frecuencia pago (*)</label>
                                                        <select name="idFrecuenciapago" class="form-control" disabled="">
                                                            <c:forEach var="item" items="${listaFrecuenciapago}">
                                                                <option value="${item.id}">${item.nombre}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Tasa de interes (*)</label>
                                                        <input name="tem" hidden="" type="number">
                                                        <input name="tasaInteres" class="form-control" value="0" type="number" disabled="">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Central de riesgo</label>
                                                        <input name="centralRiesgo" class="form-control" value="0.00" type="number" disabled="">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Gastos administrativos</label>
                                                        <input name="gastosAdministrativo" class="form-control" value="0.00" type="number" disabled="">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Seguro desgravamen</label>
                                                        <input name="seguroDesgravamen" class="form-control" value="0.00" type="number" disabled="">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Encaje</label>
                                                        <input name="encaje" class="form-control" value="0.00" type="number" disabled="">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Importe credito (*)</label>
                                                        <input name="importeCredito" class="form-control" value="0.00" type="number" onkeyup="$.calcularDesembolso($(this).val())">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Plazo pago en meses (*)</label>
                                                        <input name="plazo" class="form-control" value="0" type="number">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Periodo cracia</label>
                                                        <input name="periodoGracia" class="form-control" value="0" type="number">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Plazo vencimiento cuotas</label>
                                                        <input name="plazoPagoCuotas" class="form-control" value="0" type="number">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Calendario</label>
                                                        <select name="idCalendario" class="form-control">
                                                            <c:forEach var="item" items="${listaCalendario}">
                                                                <option value="${item.id}">${item.nombre}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Fecha desembolso</label>
                                                        <input id="fechaApertura" name="fechaApertura" class="form-control" placeholder="YYYY-MM-DD">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Monto desembolso</label>
                                                        <input name="montoDesembolso" class="form-control" value="0.00" type="number" disabled="">
                                                    </div>

                                                    <div class="col-ss-12 col-xs-12" style="padding-top: 10px">
                                                        <a href="#tab_content2" class="open-tab" role="tab" data-toggle="tab" onclick="$.calcularCuota()" style="color: #7926FE; font-size: 17px">Calcular cuotas <i class="fa fa-cubes"></i></a>
                                                    </div>
                                                </form>
                                                <!-- DATOS ADICIONALES-->
                                                <div class="col-ss-12 col-xs-12 col-sm-12" style="margin-top: 10px">
                                                    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                            <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Cuentas</a>
                                                            </li>
                                                            <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Cuotas</a>
                                                            </li>
                                                            <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Garantias</a>
                                                            </li>
                                                            <li role="presentation" class=""><a href="#tab_content4" role="tab" id="profile-tab3" data-toggle="tab" aria-expanded="false">Datos de gestion y SBS</a>
                                                            </li>
                                                        </ul>
                                                        <div id="myTabContent" class="tab-content">
                                                            <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                                                                <div class="panel panel-default">
                                                                    <div class="panel-body">
                                                                        <fieldset>
                                                                            <legend style="font-family: Cambria">Cuentas de credito del cliente</legend>
                                                                            <div class="row">
                                                                                <div class="col-ss-12 col-xs-12">
                                                                                    <table class="table table-striped responsive-utilities jambo_table bulk_action" id="tablaCuentacredito">
                                                                                        <thead>
                                                                                            <tr class="headings">
                                                                                                <th class="column-title">N°</th>
                                                                                                <th class="column-title">Cuenta credito</th>
                                                                                                <th class="column-title">Moneda</th>
                                                                                                <th class="column-title">Importe credito</th>
                                                                                                <th class="column-title">Monto desembolso</th>
                                                                                                <th class="column-title">Desembolsado</th>
                                                                                                <th class="column-title">Accion</th>
                                                                                                <th class="column-title" style="text-align: center">Plan</th>
                                                                                                <th class="column-title" style="text-align: center">Contrato</th>
                                                                                                <th class="column-title" style="text-align: center">Pagaré</th>
                                                                                                <th class="column-title" style="text-align: center">Hoja desembolso</th>
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
                                                                                                <td>*</td>
                                                                                                <td>*</td>
                                                                                                <td>*</td>
                                                                                                <td>*</td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-12">
                                                                                    <button onclick="$.llenarCuentas()" class="btn btn-success btn-xs">Actualizar</button>
                                                                                </div>
                                                                            </div>
                                                                        </fieldset>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                                                                <div class="panel panel-default">
                                                                    <div class="panel-body"  id="imprimir">
                                                                        <fieldset id="imprimirbody">
                                                                            <legend style="font-family: Cambria" id="imprimir3">Plan de pagos</legend>
                                                                            <div class="row">
                                                                                <div class="col-ss-12 col-xs-12">
                                                                                    <table class="table table-striped responsive-utilities jambo_table bulk_action" id="tablaCalculocuotas">
                                                                                        <thead>
                                                                                            <tr class="headings">
                                                                                                <th class="column-title">N°</th>
                                                                                                <th class="column-title">Fecha pago</th>
                                                                                                <th class="column-title">Dia</th>
                                                                                                <th class="column-title">Deuda extinguida</th>
                                                                                                <th class="column-title">Saldo insoluto</th>
                                                                                                <th class="column-title">Amortizacion</th>
                                                                                                <th class="column-title">Interes</th>
                                                                                                <th class="column-title">Cuota</th>
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
                                                                                                <td>*</td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row" id="imprimir2">
                                                                                <div class="col-ss-12 col-xs-12">
                                                                                    <button class="btn btn-success btn-xs" onclick="$.imprimir()">Imprimir</button>          
                                                                                </div>
                                                                            </div>
                                                                        </fieldset>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab2">
                                                                <div class="row">
                                                                    <div class="col-ss-12 col-xs-12">
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-body">
                                                                                <fieldset>
                                                                                    <legend style="font-family: Cambria">Datos garante</legend>
                                                                                    <div class="row">
                                                                                        <form id="formulario2">
                                                                                            <div class="col-ss-12 col-xs-4 col-sm-4">
                                                                                                <label>Tipo garante</label>
                                                                                                <select name="tipoGarante" class="form-control">
                                                                                                    <c:forEach var="item" items="${listaTipogarante}">
                                                                                                        <option value="${item.id}">${item.denominacion}</option>
                                                                                                    </c:forEach>
                                                                                                </select>
                                                                                            </div>
                                                                                            <div class="col-ss-12 col-xs-4 col-sm-4">
                                                                                                <label>Moneda</label>
                                                                                                <select name="tipoMoneda" class="form-control">
                                                                                                    <c:forEach var="item" items="${listaTipomoneda}">
                                                                                                        <option value="${item.id}">${item.denominacion}</option>
                                                                                                    </c:forEach>
                                                                                                </select>
                                                                                            </div>
                                                                                            <div class="col-ss-12 col-xs-4 col-sm-4">
                                                                                                <label>Fecha activacion</label>
                                                                                                <input name="fechaActivacion" id="fechaActivacion" class="form-control" placeholder="YYYY-MM-DD">
                                                                                            </div>
                                                                                            <div class="col-ss-12 col-xs-4 col-sm-4">
                                                                                                <label>Fecha levantamiento</label>
                                                                                                <input name="fechaLevantamiento" id="fechaLevantamiento" class="form-control" placeholder="YYYY-MM-DD">
                                                                                            </div>
                                                                                            <div class="col-ss-12 col-xs-4 col-sm-4">
                                                                                                <label>Importe garante</label>
                                                                                                <input name="importeGarante" class="form-control" value="0.00" type="number" onkeyup="$.calcularImportelibre()">
                                                                                            </div>
                                                                                            <div class="col-ss-12 col-xs-4 col-sm-4">
                                                                                                <label>Importe comprometido</label>
                                                                                                <input name="importeComprometido" class="form-control" value="0.00" type="number" onkeyup="$.calcularImportelibre()">
                                                                                            </div>
                                                                                            <div class="col-ss-12 col-xs-4 col-sm-4">
                                                                                                <label>Importe libre</label>
                                                                                                <input name="importeLibre" class="form-control" value="0.00" type="number" disabled="">
                                                                                            </div>
                                                                                            <div class="col-ss-12 col-xs-8 col-sm-8">
                                                                                                <label>Descripcion</label>
                                                                                                <textarea name="descripcion" class="form-control" placeholder="DESCRIPCION"></textarea>
                                                                                            </div>
                                                                                            <div class="col-ss-12 col-xs-12" style="padding-top: 5px">
                                                                                                <button type="submit" class="btn btn-success btn-xs">Agregar</button>
                                                                                            </div>
                                                                                        </form>
                                                                                    </div>
                                                                                    <legend style="font-family: Cambria">Lista garantes</legend>
                                                                                    <div class="row">
                                                                                        <table class="table table-striped responsive-utilities jambo_table bulk_action" id="tablaGarantes">
                                                                                            <thead>
                                                                                                <tr class="headings">
                                                                                                    <th class="column-title">N°</th>
                                                                                                    <th class="column-title">Tipo garante</th>
                                                                                                    <th class="column-title">Importe garante</th>
                                                                                                    <th class="column-title">Importe comprometido</th>
                                                                                                    <th class="column-title">Moneda</th>
                                                                                                    <th class="column-title">Fecha activacion</th>
                                                                                                    <th class="column-title">Fecha levantamiento</th>
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
                                                                                </fieldset>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div role="tabpanel" class="tab-pane fade" id="tab_content4" aria-labelledby="profile-tab3">
                                                                <div class="row">
                                                                    NOT IMPLEMENTED
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-ss-12 col-xs-12" style="padding-top: 10px">
                                                    <button id="crear" class="btn btn-primary" onclick="$.crearCuentacredito()">Crear</button>
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
        <div class="modal fade" id="modalBuscarcliente" tabindex="-1" role="dialog" aria-labelledby="modalBuscarClienteLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="color: #449ACA; text-align: center">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="modalBuscarClienteLabel">Buscar cliente</h4>
                    </div>
                    <div id="bodyModal" class="modal-body">
                        <div class="row">
                            <div class="col-ss-12 col-xs-12">
                                <fieldset>
                                    <div class="row">
                                        <div class="col-ss-12 col-xs-6">
                                            <select id="opcionCliente" class="form-control" style="color: #322660">
                                                <option value="0">SELECCIONAR</option>
                                                <option value="1">PERSONA NATURAL</option>
                                                <option value="2">PERSONA JURIDICA</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div id="opcionPersonanatural" class="row" hidden="">
                                        <div class="col-ss-12 col-xs-12">
                                            <div class="row">
                                                <div class="col-ss-12 col-xs-6 col-sm-3">
                                                    <label>DNI</label>
                                                    <input id="dniBusqueda" class="form-control" placeholder="DNI" type="number" onkeyup="$.buscarClientenatural(1)">  
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-ss-12 col-xs-4">
                                            <label>Nombre</label>
                                            <input id="nombreBusqueda" class="form-control" placeholder="NOMBRE" type="text" onkeyup="$.buscarClientenatural(2)">
                                        </div>
                                        <div class="col-ss-12 col-xs-4">
                                            <label>Apellido paterno</label>
                                            <input id="apellidoPatBusqueda" class="form-control" placeholder="APELLIDO PATERNO" type="text" onkeyup="$.buscarClientenatural(2)">
                                        </div>
                                        <div class="col-ss-12 col-xs-4">
                                            <label>Apellido materno</label>
                                            <input id="apellidoMatBusqueda" class="form-control" placeholder="APELLIDO MATERNO" type="text" onkeyup="$.buscarClientenatural(2)">
                                        </div>
                                    </div>
                                    <div id="opcionPersonajuridica" class="row" hidden="">
                                        <div class="col-ss-12 col-xs-12">
                                            <div class="row">
                                                <div class="col-ss-12 col-xs-6 col-sm-3">
                                                    <label>RUC</label>
                                                    <input id="rucBusqueda" class="form-control" placeholder="RUC" type="number" onkeyup="$.buscarClientejuridico(1)">  
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-ss-12 col-xs-6">
                                            <label>Razon social</label>
                                            <input id="razonsocialBusqueda" class="form-control" placeholder="RAZON SOCIAL" type="text" onkeyup="$.buscarClientejuridico(2)">
                                        </div>
                                        <div class="col-ss-12 col-xs-6">
                                            <label>Nombre comercial</label>
                                            <input id="nombrecomercialBusqueda" class="form-control" placeholder="NOMBRE COMERCIAL" type="text" onkeyup="$.buscarClientejuridico(2)">
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                            <div class="col-ss-12 col-xs-12" style="padding-top: 10px">
                                <table class="table table-striped responsive-utilities jambo_table bulk_action" id="tablaBuscarcliente">

                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal" aria-label="Close">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="modalBuscarproductocredito" tabindex="-1" role="dialog" aria-labelledby="modalBuscarClienteLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="color: #449ACA; text-align: center">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="modalBuscarClienteLabel">Buscar producto credito</h4>
                    </div>
                    <div id="bodyModal" class="modal-body">
                        <div class="row">
                            <div class="col-ss-12 col-xs-12">
                                <fieldset>
                                    <div class="row">
                                        <div class="col-ss-12 col-xs-6">
                                            <label>Tipo moneda</label>
                                            <select id="idTipomonedaBusqueda" class="form-control">
                                                <c:forEach var="item" items="${listaTipomoneda}">
                                                    <option value="${item.id}">${item.denominacion}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-ss-12 col-xs-6">
                                            <label>Nombre</label>
                                            <input id="nombrepBusqueda" class="form-control" placeholder="NOMBRE" type="text" onkeyup="$.buscarProductocredito($(this).val())">  
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                            <div class="col-ss-12 col-xs-12" style="padding-top: 10px">
                                <table class="table table-striped responsive-utilities jambo_table bulk_action" id="tablaBuscarproductocredito">

                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal" aria-label="Close">Cancelar</button>
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

                                                $.limpiarControles = function () {
                                                    $("#formulario input[name=idProductocredito]").val("");
                                                    $("#formulario input[id=codigoProductocredito]").val("");
                                                    $("#formulario input[name=nombreProductocredito]").val("");

                                                    $("#formulario input[name=moneda]").val("");
                                                    $("#formulario input[name=importeCredito]").val(0);
                                                    $("#formulario input[name=plazo]").val(0);
                                                    $("#formulario input[name=tasaInteres]").val(0);
                                                    $("#formulario input[name=periodoGracia]").val(0);
                                                    $("#formulario input[name=plazoPagoCuotas]").val(0);
                                                    $("#formulario input[name=centralRiesgo]").val(0);
                                                    $("#formulario input[name=gastosAdministrativo]").val(0);
                                                    $("#formulario input[name=seguroDesgravamen]").val(0);
                                                    $("#formulario input[name=encaje]").val(0);
                                                    $("#formulario input[name=montoDesembolso]").val(0);
                                                    $("#formulario input[id=fechaApertura]").val("");

                                                    $("#formulario2 input[name=fechaActivacion]").val("");
                                                    $("#formulario2 input[name=fechaLevantamiento]").val("");
                                                    $("#formulario2 input[name=importeGarante]").val(0);
                                                    $("#formulario2 input[name=importeComprometido]").val(0);
                                                    $("#formulario2 input[name=importeLibre]").val(0);
                                                    $("#formulario2 textarea[name=descripcion]").val("");

                                                    //LIMPIAR TABLAS
                                                    $("#tablaGarantes tbody").html("<tr><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td></tr>");
                                                    $("#tablaCalculocuotas tbody").html("<tr><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td></tr>");
                                                    $("#tablaCuentacredito tbody").html("<tr><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td></tr>");
                                                };

                                                $.llenarCliente = function (id) {
                                                    var codigo = $("#tablaBuscarcliente #" + id + " td")[0].innerHTML;
                                                    var nombre = $("#tablaBuscarcliente #" + id + " td")[2].innerHTML;
                                                    var apellido = $("#tablaBuscarcliente #" + id + " td")[3].innerHTML;
                                                    var idCliente = $("#tablaBuscarcliente #" + id + " td")[4].innerHTML;

                                                    $("#formulario input[name=idCliente]").val(idCliente);
                                                    $("#formulario input[id=codigoCliente]").val(codigo);
                                                    $("#formulario input[id=nombreCliente]").val(nombre + " " + apellido);

                                                    $('#modalBuscarcliente').modal('hide');

                                                    $.llenarCuentas();
                                                };

                                                $.llenarCuentas = function () {
                                                    var idCliente = $("#formulario input[name=idCliente]").val();
                                                    $.ajax({
                                                        type: 'POST',
                                                        url: '${pageContext.request.contextPath}/credito/listarcuentacredito',
                                                        data: {idCliente: idCliente},
                                                        dataType: "json",
                                                        success: function (data) {
                                                            var added = '';
                                                            if (data.length !== 0) {
                                                                $.each(data, function (i, value) {
                                                                    var json = JSON.parse(value);
                                                                    added += '<tr>' +
                                                                            '<td>' + (i + 1) + '</td>' +
                                                                            '<td>' + json.cuentaCredito + '</td>' +
                                                                            '<td>' + json.moneda + '</td>' +
                                                                            '<td>' + json.importeCredito + '</td>' +
                                                                            '<td>' + json.montoDesembolso + '</td>' +
                                                                            '<td>' + json.estadoDesembolso + '</td>';
                                                                    if (json.idEstadocredito === 1) {
                                                                        added += '<td><a href="javascript:void(0)" onclick="$.eliminarCuentacredito(' + json.id + ')"  style="color:red"><i class="fa fa-close"></i> Eliminar</a></td>';
                                                                    }
                                                                    else {
                                                                        added += '<td>-</td>';
                                                                    }
                                                                    added += '<td><a target="_blank" href="${pageContext.request.contextPath}/reporte/reporteplanpagos?type=pdf&&cl=' + json.cliente + '&&id=' + json.id + '"><i class="fa fa-file-pdf-o fa-2x"></i> Plan pagos</a></td>' +
                                                                            '<td><a target="_blank" href="${pageContext.request.contextPath}/reporte/contratoprestamo?type=pdf&&cl=' + json.cliente + '&&id=' + json.id + '"><i class="fa fa-file-word-o fa-2x"></i> Contrato de prestamo</a></td>' +
                                                                            '<td><a target="_blank" href="${pageContext.request.contextPath}/reporte/pagare?type=pdf&&cl=' + json.cliente + '&&id=' + json.id + '"><i class="fa fa-file-powerpoint-o fa-2x"></i> Pagare</a></td>' +
                                                                            '<td><a target="_blank" href="${pageContext.request.contextPath}/reporte/hojadesembolso?type=pdf&&cl=' + json.cliente + '&&id=' + json.id + '"><i class="fa fa-file-archive-o fa-2x"></i> Hoja desembolso</a></td>' +
                                                                            '</tr>';
                                                                });
                                                                $("#tablaCuentacredito tbody").html(added);
                                                                $.notificar("Notificacion", "info", "Se cargo las cuentas del cliente correctamente");
                                                            }
                                                            else {
                                                                added += '<tr>' +
                                                                        '<td>*</td>' +
                                                                        '<td>*</td>' +
                                                                        '<td>*</td>' +
                                                                        '<td>*</td>' +
                                                                        '<td>*</td>' +
                                                                        '<td>*</td>' +
                                                                        '<td>*</td>' +
                                                                        '<td>*</td>' +
                                                                        '<td>*</td>' +
                                                                        '<td>*</td>' +
                                                                        '</tr>';
                                                                $("#tablaCuentacredito tbody").html(added);
                                                                $.notificar("Notificacion", "info", "No se pudo obtener cuentas de este cliente");
                                                            }
                                                        },
                                                        error: function (xhr, status, error) {
                                                            $.notificar("Notificacion", "error", "Error: " + error);
                                                        }
                                                    });
                                                };

                                                $.llenarProductocredito = function (id) {
                                                    var codigo = $("#tablaBuscarproductocredito #" + id + " td")[0].innerHTML;
                                                    var idProductocredito = $("#tablaBuscarproductocredito #" + id + " td")[1].innerHTML;
                                                    var nombre = $("#tablaBuscarproductocredito #" + id + " td")[2].innerHTML;
                                                    var moneda = $("#idTipomonedaBusqueda option:selected").text();

                                                    $("#formulario input[name=idProductocredito]").val(idProductocredito);
                                                    $("#formulario input[id=codigoProductocredito]").val(codigo);
                                                    $("#formulario input[id=nombreProductocredito]").val(nombre);
                                                    $("#formulario input[id=moneda]").val(moneda);

                                                    $('#modalBuscarproductocredito').modal('hide');

                                                    $.ajax({
                                                        type: 'POST',
                                                        url: '${pageContext.request.contextPath}/credito/obtenerproductocredito',
                                                        data: {idProductocredito: idProductocredito},
                                                        dataType: "json",
                                                        success: function (data) {
                                                            if (data !== null) {
                                                                //ESTABLECER DATOS
                                                                $("#formulario input[name=tasaInteres]").val(data.tasa);
                                                                $("#formulario select[name=idFrecuenciapago]").val(data.idFrecuenciapago);
                                                                $("#formulario input[name=centralRiesgo]").val(data.centralRiesgo);
                                                                $("#formulario input[name=gastosAdministrativo]").val(data.comisionGastosAdm);
                                                                $("#formulario input[name=seguroDesgravamen]").val(data.tasaSeguroDesgravamen);
                                                                $("#formulario input[name=encaje]").val(data.encaje);
                                                                $("#formulario input[name=tem]").val(data.tem);

                                                                var settings = $('#formulario').validate().settings;
                                                                settings.rules.importeCredito = {min: parseFloat(data.montoMinimo), max: parseFloat(data.montoMaximo)};
                                                                settings.rules.periodoGracia = {min: parseInt(data.minPeriodoGracia), max: parseInt(data.maxPeriodoGracia)};
                                                                settings.rules.plazoPagoCuotas = {min: parseInt(data.minDiasPlazoPago), max: parseInt(data.maxDiasPlazoPago)};


                                                                settings.messages.importeCredito = {min: "El monto debe estar entre " + data.montoMinimo + " y " + data.montoMaximo, max: "El monto debe estar entre " + data.montoMinimo + " y " + data.montoMaximo};
                                                                settings.messages.periodoGracia = {min: "El monto debe estar entre " + data.minPeriodoGracia + " y " + data.maxPeriodoGracia, max: "El monto debe estar entre " + data.minPeriodoGracia + " y " + data.maxPeriodoGracia};
                                                                settings.messages.plazoPagoCuotas = {min: "El monto debe estar entre " + data.minDiasPlazoPago + " y " + data.maxDiasPlazoPago, max: "El monto debe estar entre " + data.minDiasPlazoPago + " y " + data.maxDiasPlazoPago};
                                                            }
                                                            else {
                                                                $.notificar("Notificacion", "black", "Error al aplicar restricciones del producto credito elegido, intentelo nuevamente");
                                                            }
                                                        },
                                                        error: function (xhr, status, error) {
                                                            $.notificar("Notificacion", "error", "Error: " + error);
                                                        }
                                                    });
                                                };

                                                $.buscarClientenatural = function (id) {
                                                    $.ajax({
                                                        type: 'POST',
                                                        url: '${pageContext.request.contextPath}/credito/buscarclientenatural',
                                                        data: {dni: $("#dniBusqueda").val(), nombre: $("#nombreBusqueda").val(), apellidoPat: $("#apellidoPatBusqueda").val(), apellidoMat: $("#apellidoMatBusqueda").val(), id: id},
                                                        dataType: "json",
                                                        success: function (data) {
                                                            var added = '<thead><tr class="headings">' +
                                                                    '<th class="column-title">Codigo </th>' +
                                                                    '<th class="column-title">DNI</th>' +
                                                                    '<th class="column-title">Nombre </th>' +
                                                                    '<th class="column-title">Apellidos</th>' +
                                                                    '<th class="column-title">Id cliente</th>' +
                                                                    '</tr></thead><tbody>';

                                                            if (data !== "0") {
                                                                $.each(data, function (i, value) {
                                                                    var json = JSON.parse(value);
                                                                    added += '<tr id="' + json.idCliente + '" onClick="$.llenarCliente(' + json.idCliente + ')">' +
                                                                            '<td>' + json.codigo + '</td>' +
                                                                            '<td>' + json.dni + '</td>' +
                                                                            '<td>' + json.nombre + '</td>' +
                                                                            '<td>' + json.apellidoPat + ' ' + json.apellidoMat + '</td>' +
                                                                            '<td>' + json.idCliente + '</td>' +
                                                                            '</tr>';
                                                                });

                                                                added += '</tbody>';

                                                                $("#tablaBuscarcliente").html(added);
                                                            }
                                                            else {
                                                                added += '<tr>No hay datos</tr></tbody>';
                                                                $("#tablaBuscarcliente").html(added);
                                                            }
                                                        },
                                                        error: function (xhr, status, error) {
                                                            $.notificar("Notificacion", "error", "Error: " + error);
                                                        }
                                                    });
                                                };

                                                $.buscarClientejuridico = function (id) {
                                                    $.ajax({
                                                        type: 'POST',
                                                        url: '${pageContext.request.contextPath}/credito/buscarclientejuridico',
                                                        data: {ruc: $("#rucBusqueda").val(), razonSocial: $("#razonsocialBusqueda").val(), nombreComercial: $("#nombrecomercialBusqueda").val(), id: id},
                                                        dataType: "json",
                                                        success: function (data) {
                                                            var added = '<thead><tr class="headings">' +
                                                                    '<th class="column-title">Codigo </th>' +
                                                                    '<th class="column-title">RUC</th>' +
                                                                    '<th class="column-title">Razon social </th>' +
                                                                    '<th class="column-title">Nombre comercial</th>' +
                                                                    '<th class="column-title">Id cliente</th>' +
                                                                    '</tr></thead><tbody>';

                                                            if (data !== "0") {
                                                                $.each(data, function (i, value) {
                                                                    var json = JSON.parse(value);
                                                                    added += '<tr id="' + json.idCliente + '" onClick="$.llenarCliente(' + json.idCliente + ')">' +
                                                                            '<td>' + json.codigo + '</td>' +
                                                                            '<td>' + json.ruc + '</td>' +
                                                                            '<td>' + json.razonSocial + '</td>' +
                                                                            '<td>' + json.nombreComercial + '</td>' +
                                                                            '<td>' + json.idCliente + '</td>' +
                                                                            '</tr>';
                                                                });

                                                                added += '</tbody>';

                                                                $("#tablaBuscarcliente").html(added);
                                                            }
                                                            else {
                                                                added += '<tr>No hay datos</tr></tbody>';
                                                                $("#tablaBuscarcliente").html(added);
                                                            }
                                                        },
                                                        error: function (xhr, status, error) {
                                                            $.notificar("Notificacion", "error", "Error: " + error);
                                                        }
                                                    });
                                                };

                                                $.buscarProductocredito = function (texto) {
                                                    $.ajax({
                                                        type: 'POST',
                                                        url: '${pageContext.request.contextPath}/credito/buscarProductocredito',
                                                        data: {texto: texto, idTipomoneda: $("#idTipomonedaBusqueda").val()},
                                                        dataType: "json",
                                                        success: function (data) {
                                                            var added = '<thead><tr class="headings">' +
                                                                    '<th class="column-title">Codigo </th>' +
                                                                    '<th class="column-title">Id</th>' +
                                                                    '<th class="column-title">Nombre </th>' +
                                                                    '<th class="column-title">Monto</th>' +
                                                                    '<th class="column-title">Periodo gracia</th>' +
                                                                    '<th class="column-title">Plazo pago</th>' +
                                                                    '</tr></thead><tbody>';

                                                            if (data !== "0") {
                                                                $.each(data, function (i, value) {
                                                                    var json = JSON.parse(value);
                                                                    added += '<tr id="' + json.id + '" onClick="$.llenarProductocredito(' + json.id + ')">' +
                                                                            '<td>' + json.codigo + '</td>' +
                                                                            '<td>' + json.id + '</td>' +
                                                                            '<td>' + json.nombre + '</td>' +
                                                                            '<td>' + json.montoMinimo + ' - ' + json.montoMaximo + '</td>' +
                                                                            '<td>' + json.minPeriodoGracia + ' - ' + json.maxPeriodoGracia + '</td>' +
                                                                            '<td>' + json.minDiasPlazoPago + ' - ' + json.maxDiasPlazoPago + '</td>' +
                                                                            '</tr>';
                                                                });

                                                                added += '</tbody>';

                                                                $("#tablaBuscarproductocredito").html(added);
                                                            }
                                                            else {
                                                                added += '<tr>No hay datos</tr></tbody>';
                                                                $("#tablaBuscarproductocredito").html(added);
                                                            }
                                                        },
                                                        error: function (xhr, status, error) {
                                                            $.notificar("Notificacion", "error", "Error: " + error);
                                                        }
                                                    });
                                                };

                                                //FORMULARIO ACTIONS
                                                $.calcularDesembolso = function (monto) {
                                                    monto = parseFloat(monto);
                                                    monto -= parseFloat($("#formulario input[name=centralRiesgo]").val());
                                                    monto -= parseFloat($("#formulario input[name=gastosAdministrativo]").val());
                                                    monto -= parseFloat($("#formulario input[name=seguroDesgravamen]").val());
                                                    monto -= parseFloat($("#formulario input[name=encaje]").val());

                                                    $("#formulario input[name=montoDesembolso]").val(monto);
                                                };

                                                $.calcularImportelibre = function () {
                                                    $("input[name=importeLibre]").val(parseInt($("input[name=importeGarante]").val()) - parseInt($("input[name=importeComprometido]").val()));
                                                };

                                                $.imprimir = function () {
                                                    var restorepage = document.body.innerHTML;

                                                    $("#imprimir2").remove();
                                                    $("#imprimir3").remove();
                                                    $("#imprimirbody").prepend('<div class="row"><div class="col-ss-12 col-xs-12">' +
                                                            '<img src="${pageContext.request.contextPath}/assets/report/logo.png" class="img-responsive" style="height:120px"></div></div>' +
                                                            '<div class="row" style="padding-top:5px"><div class="col-ss-12 col-xs-12" style="text-align:center"><b>PLAN DE PAGOS</b></div></div>' +
                                                            '<div class="row" style="padding-bottom:10px">' +
                                                            '<div class="col-ss-12 col-xs-7"><div class="row"><div class="col-ss-12 col-xs-5">CLIENTE: </div><div class="col-ss-12 col-xs-7">' + $("#nombreCliente").val() + '</div></div></div>' +
                                                            '<div class="col-ss-12 col-xs-5"><div class="row"><div class="col-ss-12 col-xs-9">MONTO: </div><div class="col-ss-12 col-xs-3" style="text-align:right">S/.' + $("#formulario input[name=importeCredito]").val() + '</div></div></div>' +
                                                            '<div class="col-ss-12 col-xs-7"><div class="row"><div class="col-ss-12 col-xs-5">PRODUCTO: </div><div class="col-ss-12 col-xs-7">' + $("#nombreProductocredito").val() + '</div></div></div>' +
                                                            '<div class="col-ss-12 col-xs-5"><div class="row"><div class="col-ss-12 col-xs-9">CENTRAL DE RIESGO: </div><div class="col-ss-12 col-xs-3" style="text-align:right">S/.' + $("#formulario input[name=centralRiesgo]").val() + '</div></div></div>' +
                                                            '<div class="col-ss-12 col-xs-7"><div class="row"><div class="col-ss-12 col-xs-5">FORMA DE PAGO: </div><div class="col-ss-12 col-xs-7">' + $("#formulario select[name=idFrecuenciapago] option:selected").text() + '</div></div></div>' +
                                                            '<div class="col-ss-12 col-xs-5"><div class="row"><div class="col-ss-12 col-xs-9">GASTOS ADMINISTRATIVOS: </div><div class="col-ss-12 col-xs-3" style="text-align:right">S/.' + $("#formulario input[name=gastosAdministrativo]").val() + '</div></div></div>' +
                                                            '<div class="col-ss-12 col-xs-7"><div class="row"><div class="col-ss-12 col-xs-5">FECHA DESEMBOLSO: </div><div class="col-ss-12 col-xs-7">' + $("#formulario input[name=fechaApertura]").val() + '</div></div></div>' +
                                                            '<div class="col-ss-12 col-xs-5"><div class="row"><div class="col-ss-12 col-xs-9">DESEMBOLSO NETO: </div><div class="col-ss-12 col-xs-3" style="text-align:right">S/.' + $("#formulario input[name=montoDesembolso]").val() + '</div></div></div>' +
                                                            '</div>');
                                                    $("#imprimir td").css({"padding": "0px"});

                                                    var printcontent = document.getElementById('imprimir').innerHTML;
                                                    document.body.innerHTML = printcontent;

                                                    setTimeout(function () {
                                                        window.print();
                                                        document.body.innerHTML = restorepage;
                                                    }, parseInt(50));
                                                };
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#opcionCliente").change(function () {
                    var val = $("#opcionCliente").val();
                    if (val === "1") {
                        $("#opcionPersonanatural").show();
                        $("#opcionPersonajuridica").hide();
                    }
                    else {
                        if (val === "2") {
                            $("#opcionPersonajuridica").show();
                            $("#opcionPersonanatural").hide();
                        }
                    }
                });

                $('.open-tab').click(function () {
                    $("#myTab li[class=active]").removeClass("active");

                    var tab = $("#profile-tab").parent();
                    tab.addClass("active");
                });

                $("#formulario").validate({
                    rules: {
                        nombreCliente: {
                            required: true
                        },
                        nombreProductocredito: {
                            required: true
                        },
                        idCliente: {
                            required: true
                        },
                        idProductocredito: {
                            required: true
                        },
                        moneda: {
                            required: true
                        },
                        idFrecuenciapago: {
                            required: true
                        },
                        importeCredito: {
                            required: true
                        },
                        plazo: {
                            required: true,
                            min: 1
                        },
                        tasaInteres: {
                            required: true
                        },
                        periodoGracia: {
                            required: true
                        },
                        plazoPagoCuotas: {
                            required: true
                        },
                        idCalendario: {
                            required: true
                        },
                        centralRiesgo: {
                            required: true
                        },
                        gastosAdministrativo: {
                            required: true
                        },
                        seguroDesgravamen: {
                            required: true
                        },
                        encaje: {
                            required: true
                        },
                        fechaApertura: {
                            required: true
                        },
                        montoDesembolso: {
                            required: true,
                            min: 1
                        }
                    },
                    messages: {
                        nombreCliente: {
                            required: "Campo obligatorio"
                        },
                        nombreProductocredito: {
                            required: "Campo obligatorio"
                        },
                        idCliente: {
                            required: "Campo obligatorio"
                        },
                        idProductocredito: {
                            required: "Campo obligatorio"
                        },
                        moneda: {
                            required: "Campo obligatorio"
                        },
                        idFrecuenciapago: {
                            required: "Campo obligatorio"
                        },
                        importeCredito: {
                            required: "Campo obligatorio"
                        },
                        plazo: {
                            required: "Campo obligatorio",
                            min: "Cantidad minima de cuotas (1)"
                        },
                        tasaInteres: {
                            required: "Campo obligatorio"
                        },
                        periodoGracia: {
                            required: "Campo obligatorio"
                        },
                        plazoPagoCuotas: {
                            required: "Campo obligatorio"
                        },
                        idCalendario: {
                            required: "Campo obligatorio"
                        },
                        centralRiesgo: {
                            required: "Campo obligatorio"
                        },
                        gastosAdministrativo: {
                            required: "Campo obligatorio"
                        },
                        seguroDesgravamen: {
                            required: "Campo obligatorio"
                        },
                        encaje: {
                            required: "Campo obligatorio"
                        },
                        fechaApertura: {
                            required: "Campo obligatorio"
                        },
                        montoDesembolso: {
                            required: "Campo obligatorio",
                            min: "El desembolso no puede ser 0"
                        }
                    },
                    submitHandler: function () {
                        var calendario = {
                            id: $("#formulario select[name=idCalendario]").val()
                        };

                        var cliente = {
                            id: $("#formulario input[name=idCliente]").val()
                        };

                        var frecuenciapago = {
                            id: $("#formulario select[name=idFrecuenciapago]").val()
                        };

                        var productocredito = {
                            id: $("#formulario input[name=idProductocredito]").val()
                        };

                        var estadocredito = {
                            id: 1
                        };

                        var cuentacredito = {
                            id: 0,
                            calendario: calendario,
                            cliente: cliente,
                            frecuenciapago: frecuenciapago,
                            productocredito: productocredito,
                            moneda: $("#formulario input[name=moneda]").val(),
                            importeCredito: $("#formulario input[name=importeCredito]").val(),
                            plazo: $("#formulario input[name=plazo]").val(),
                            tasaInteres: $("#formulario input[name=tasaInteres]").val(),
                            tasaInteresmora: $("#formulario input[name=tem]").val(),
                            periodoGracia: $("#formulario input[name=periodoGracia]").val(),
                            plazoPagoCuotas: $("#formulario input[name=plazoPagoCuotas]").val(),
                            fechaApertura: $("#formulario input[name=fechaApertura]").val(),
                            centralRiesgo: $("#formulario input[name=centralRiesgo]").val(),
                            gastosAdministrativo: $("#formulario input[name=gastosAdministrativo]").val(),
                            seguroDesgravamen: $("#formulario input[name=seguroDesgravamen]").val(),
                            encaje: $("#formulario input[name=encaje]").val(),
                            montoDesembolso: $("#formulario input[name=montoDesembolso]").val(),
                            estadocredito: estadocredito
                        };
                        $.ajax({
                            type: "POST",
                            url: "${pageContext.request.contextPath}/credito/crearcuentacredito",
                            contentType: "application/json",
                            data: JSON.stringify(cuentacredito),
                            dataType: "json",
                            success: function (data) {
                                if (data !== 0) {
                                    $.notificar("Notificacion", "success", "Se ha registrado la cuenta de credito correctamente");
                                    //LIMPIAR CAMPOS
                                    $.limpiarControles();
                                }
                                else {
                                    $.notificar("Notificacion", "error", "Ocurrio un error al procesar la fecha de desembolso");
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
                        tipoGarante: {
                            required: true
                        },
                        tipoMoneda: {
                            required: true
                        },
                        fechaActivacion: {
                            required: true
                        },
                        fechaLevantamiento: {
                            required: true
                        },
                        importeGarante: {
                            required: true
                        },
                        importeComprometido: {
                            required: true
                        },
                        importeLibre: {
                            required: true
                        },
                        descripcion: {
                            required: true
                        }
                    },
                    messages: {
                        tipoGarante: {
                            required: "Campo obligatorio"
                        },
                        tipoMoneda: {
                            required: "Campo obligatorio"
                        },
                        fechaActivacion: {
                            required: "Campo obligatorio"
                        },
                        fechaLevantamiento: {
                            required: "Campo obligatorio"
                        },
                        importeGarante: {
                            required: "Campo obligatorio"
                        },
                        importeComprometido: {
                            required: "Campo obligatorio"
                        },
                        importeLibre: {
                            required: "Campo obligatorio"
                        },
                        descripcion: {
                            required: "Campo obligatorio"
                        }
                    },
                    submitHandler: function () {
                        var garante = {
                            descripcion: $("#formulario2 textarea[name=descripcion]").val(),
                            fechaActivacion: $("#formulario2 input[name=fechaActivacion]").val(),
                            fechaLevantamiento: $("#formulario2 input[name=fechaLevantamiento]").val(),
                            importeGarante: $("#formulario2 input[name=importeGarante]").val(),
                            importeComprometido: $("#formulario2 input[name=importeComprometido]").val(),
                            importeLibre: $("#formulario2 input[name=importeLibre]").val(),
                            estado: true,
                            tipoGarante: $("#formulario2 select[name=tipoGarante] option:selected").text(),
                            tipoMoneda: $("#formulario2 select[name=tipoMoneda] option:selected").text()
                        };

                        $.ajax({
                            type: "POST",
                            url: "${pageContext.request.contextPath}/credito/agregargarante",
                            contentType: "application/json",
                            data: JSON.stringify(garante),
                            dataType: "json",
                            success: function (data) {
                                var added = '';
                                if (data.length !== 0) {
                                    $.each(data, function (i, value) {
                                        var json = JSON.parse(value);
                                        added += '<tr>' +
                                                '<td>' + (i + 1) + '</td>' +
                                                '<td>' + json.tipoGarante + '</td>' +
                                                '<td>' + json.importeGarante + '</td>' +
                                                '<td>' + json.importeComprometido + '</td>' +
                                                '<td>' + json.tipoMoneda + '</td>' +
                                                '<td>' + json.fechaActivacion + '</td>' +
                                                '<td>' + json.fechaLevantamiento + '</td>' +
                                                '</tr>';
                                    });

                                    $("#tablaGarantes tbody").html(added);
                                }
                                else {
                                    $.notificar("Notificacion", "error", "Error al realizar el registro, intente nuevamente");
                                }
                            },
                            error: function (xhr, status, error) {
                                $.notificar("Notificacion", "error", "Error: " + error);
                            }
                        });

                    }
                });

                $.calcularCuota = function () {

                    var calendario = {
                        id: $("select[name=idCalendario]").val()
                    };

                    var cliente = {
                        id: $("input[name=idCliente]").val()
                    };

                    var frecuenciapago = {
                        id: $("select[name=idFrecuenciapago]").val()
                    };

                    var productocredito = {
                        id: $("input[name=idProductocredito]").val()
                    };

                    var cuentacredito = {
                        id: 0,
                        calendario: calendario,
                        cliente: cliente,
                        frecuenciapago: frecuenciapago,
                        productocredito: productocredito,
                        moneda: $("input[name=moneda]").val(),
                        importeCredito: $("input[name=importeCredito]").val(),
                        plazo: $("input[name=plazo]").val(),
                        tasaInteres: $("input[name=tasaInteres]").val(),
                        periodoGracia: $("input[name=periodoGracia]").val(),
                        plazoPagoCuotas: $("input[name=plazoPagoCuotas]").val(),
                        fechaApertura: $("input[name=fechaApertura]").val(),
                        centralRiesgo: $("input[name=centralRiesgo]").val(),
                        gastosAdministrativo: $("input[name=gastosAdministrativo]").val(),
                        seguroDesgravamen: $("input[name=seguroDesgravamen]").val(),
                        encaje: $("input[name=encaje]").val()
                    };

                    $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/credito/calcularcuotas",
                        contentType: "application/json",
                        data: JSON.stringify(cuentacredito),
                        dataType: "json",
                        success: function (data) {
                            var added = '';
                            if (data.length !== 0) {
                                var totalCuota = 0;
                                var totalInteres = 0;
                                var totalAmortizacion = 0;
                                $.each(data, function (i, value) {
                                    var json = JSON.parse(value);
                                    added += '<tr>' +
                                            '<td>' + (i + 1) + '</td>' +
                                            '<td>' + json.fechaVence + '</td>' +
                                            '<td>' + json.diaPago + '</td>' +
                                            '<td>' + parseFloat(json.deudaExtinguida).toFixed(2) + '</td>' +
                                            '<td>' + parseFloat(json.saldoInsoluto).toFixed(2) + '</td>' +
                                            '<td>' + parseFloat(json.amortizacion).toFixed(2) + '</td>' +
                                            '<td>' + parseFloat(json.interes).toFixed(2) + '</td>' +
                                            '<td>' + parseFloat(json.cuota).toFixed(2) + '</td>' +
                                            '</tr>';
                                    totalAmortizacion += parseFloat(json.amortizacion);
                                    totalCuota += parseFloat(json.cuota);
                                });

                                totalInteres = totalCuota - parseFloat($("input[name=importeCredito]").val());

                                added += '<tr>' +
                                        '<td></td>' +
                                        '<td></td>' +
                                        '<td></td>' +
                                        '<td></td>' +
                                        '<td>TOTAL</td>' +
                                        '<td>' + parseFloat(totalAmortizacion).toFixed(2) + '</td>' +
                                        '<td>' + parseFloat(totalInteres).toFixed(2) + '</td>' +
                                        '<td>' + parseFloat(totalCuota).toFixed(2) + '</td>' +
                                        '</tr>';

                                $("#tablaCalculocuotas tbody").html(added);
                            }
                            else {
                                added += '<tr>' +
                                        '<td>NO</td>' +
                                        '<td>HAY</td>' +
                                        '<td>DATOS</td>' +
                                        '<td>*</td>' +
                                        '<td>*</td>' +
                                        '<td>*</td>' +
                                        '<td>*</td>' +
                                        '<td>*</td>' +
                                        '</tr>';
                                $("#tablaCalculocuotas tbody").html(added);
                                $.notificar("Notificacion", "error", "Error al realizar los calculos, intente nuevamente");
                            }
                        },
                        error: function (xhr, status, error) {
                            $.notificar("Notificacion", "error", "Error: " + error);
                        }
                    });
                };
            });

            $("#fechaApertura").datepicker({dateFormat: 'yy-mm-dd', minDate: 0});
            $("#fechaActivacion").datepicker({dateFormat: 'yy-mm-dd', minDate: 0});
            $("#fechaLevantamiento").datepicker({dateFormat: 'yy-mm-dd', minDate: 0});

            $.crearCuentacredito = function () {
                $("#formulario").submit();
            };

            $.eliminarCuentacredito = function (id) {
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/credito/eliminarcuentacredito",
                    data: {id: id},
                    dataType: "json",
                    success: function (data) {
                        if (data === 1) {
                            $.llenarCuentas();
                        }
                        else {
                            $.notificar("Notificacion", "error", "Error al eliminar el credito, intente nuevamente");
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
