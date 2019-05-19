<%-- 
    Document   : index
    Created on : 13/02/2016, 03:29:06 AM
    Author     : nerio
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="ahorroCuentaahorroModule">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear cuenta ahorro</title>
        <jsp:include page="../shared/favicon.jsp" flush="true"/>
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
    <body ng-controller="cuentaahorroController" class="nav-md" style="font-family: Cambria">
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../shared/navbarLeft.jsp" flush="true"/>
                <jsp:include page="../shared/navbarTop.jsp" flush="true"/>
                <div class="right_col" role="main">

                    <div class="">
                        <div class="page-title">
                            <div class="title_left">
                                <h4>Administracion de cuenta ahorro</h4>
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
                                        <h2>Crear cuenta ahorro <i class="fa fa-book"></i></h2>
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
                                                <div class="col-ss-12 col-xs-3 col-sm-3">
                                                    <label>Codigo</label>
                                                    <input ng-model="cuentaahorro.codigo"  class="form-control" disabled="" type="text">
                                                </div>
                                                <div class="col-ss-12 col-xs-12 col-sm-12">
                                                    <label>Cliente (*)</label>
                                                    <div class="row">
                                                        <div class="col-ss-3 col-xs-3 col-sm-2" style="padding-right: 0px">
                                                            <input ng-model="cuentaahorro.cliente.codigo" name="clientecodigo" class="form-control" placeholder="CN-000000" disabled="" style="text-align: center; color:  #322660" type="text">
                                                        </div>
                                                        <div class="col-ss-9 col-xs-9 col-sm-8" style="padding-left: 0px">
                                                            <input ng-model="nombreCliente" name="nombrecliente" class="form-control" placeholder="CLIENTE" data-toggle="modal" data-target="#modalBuscarcliente" type="text">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-ss-12 col-xs-12 col-sm-12">
                                                    <label>Producto ahorro (*)</label>
                                                    <div class="row">
                                                        <div class="col-ss-3 col-xs-3 col-sm-2" style="padding-right: 0px">
                                                            <input ng-model="cuentaahorro.productoahorro.codigo" name="productoahorrocodigo" class="form-control" placeholder="PC-000000" disabled="" style="text-align: center; color:  #322660" type="text">
                                                        </div>
                                                        <div class="col-ss-9 col-xs-9 col-sm-8" style="padding-left: 0px">
                                                            <input ng-model="cuentaahorro.productoahorro.nombre" name="productoahorronombre" class="form-control" placeholder="PRODUCTO AHORRO" data-toggle="modal" data-target="#modalBuscarproductoahorro" type="text">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-ss-12 col-xs-4">
                                                    <label>TEA</label>
                                                    <input  ng-model="cuentaahorro.productoahorro.tea" name="tea" class="form-control" placeholder="Tasa efectiva anual" disabled="" type="number">
                                                </div>
                                                <div class="col-ss-12 col-xs-4">
                                                    <label>TEM</label>
                                                    <input ng-model="tem" class="form-control" placeholder="Tasa efectiva mensual" disabled="" type="number">
                                                </div>
                                                <div class="col-ss-12 col-xs-4">
                                                    <label>TED</label>
                                                    <input ng-model="ted" class="form-control" placeholder="Tasa efectiva diaria" disabled="" type="number">
                                                </div>
                                                <div id="plazofijo" hidden="">
                                                    <form name="formulariopf" ng-submit="registrarpf(formulariopf)" ng-validate="validatepf">
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Importe apertura (*)</label>
                                                            <input ng-model="cuentaahorro.importe" name="importe" class="form-control" placeholder="Importe apertura" type="number">
                                                        </div>
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Periodo en dias (*)</label>
                                                            <input ng-model="cuentaahorro.periodo" name="periodo" class="form-control" placeholder="Periodo" type="number">
                                                        </div>
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Fecha apertura (*)</label>
                                                            <input ng-model="cuentaahorro.fechaApertura" name="fechaApertura" class="form-control" placeholder="Fecha apertura" id="fechaApertura">
                                                        </div>
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Interes proyectado</label>
                                                            <input ng-model="cuentaahorro.interesProyectado" name="interesProyectado" class="form-control" placeholder="Interes proyectado" type="number" disabled="">
                                                        </div>
                                                        <div class="col-ss-12 col-xs-12" style="padding-top: 10px">
                                                            <a href="#tab_content2" class="open-tab" role="tab" data-toggle="tab" ng-click="calcularInteres(formulariopf)" style="color: #7926FE; font-size: 17px">Calcular interes <i class="fa fa-cubes"></i></a>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div id="ahorro" hidden="">
                                                    <form name="formularioah" ng-submit="registrarah(formularioah)" ng-validate="validateah">
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Monto inscripcion (*)</label>
                                                            <input ng-model="cuentaahorro.montoInscripcion" name="montoInscripcion" class="form-control" placeholder="Monto inscripcion" type="number" disabled="">
                                                        </div>
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Monto carnet</label>
                                                            <input ng-model="cuentaahorro.montoCarnet" name="montoCarnet" class="form-control" placeholder="Monto carnet" type="number" disabled="">
                                                        </div>
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Frecuencia aporte (*)</label>
                                                            <select ng-options="frecuenciaaporte as frecuenciaaporte.nombre for frecuenciaaporte in frecuenciaaportes track by frecuenciaaporte.id" ng-model="cuentaahorro.frecuenciaaporte" name="frecuenciaaporte" class="form-control" disabled=""></select>
                                                        </div>
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Monto aporte (*)</label>
                                                            <input ng-model="cuentaahorro.importe" name="importe" class="form-control" placeholder="Monto aporte" type="number">
                                                        </div>
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Fecha apertura (*)</label>
                                                            <input ng-model="cuentaahorro.fechaApertura" name="fechaApertura" class="form-control" placeholder="Fecha apertura" id="fechaApertura2">
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="col-ss-12 col-xs-12 col-sm-12" style="margin-top: 10px">
                                                    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                            <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Cuentas</a>
                                                            </li>
                                                            <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Intereses</a>
                                                            </li>
                                                        </ul>
                                                        <div id="myTabContent" class="tab-content">
                                                            <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                                                                <div class="panel panel-default">
                                                                    <div class="panel-body">
                                                                        <fieldset>
                                                                            <legend style="font-family: Cambria">Cuentas de ahorro del cliente</legend>
                                                                            <div class="row">
                                                                                <div class="col-ss-12 col-xs-12">
                                                                                    <table class="table table-striped responsive-utilities jambo_table bulk_action" id="tablaCuentacredito">
                                                                                        <thead>
                                                                                            <tr class="headings">
                                                                                                <th class="column-title">N°</th>
                                                                                                <th class="column-title">Cuenta</th>
                                                                                                <th class="column-title">Moneda</th>
                                                                                                <th class="column-title">Importe credito</th>
                                                                                                <th class="column-title">Fecha creacion</th>
                                                                                                <th class="column-title">Tea</th>
                                                                                                <th class="column-title">Accion</th>
                                                                                                <th class="column-title" style="text-align: center">Certificado</th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                            <tr ng-show="cuentaahorros.length > 0" ng-repeat="cuentaahorro in cuentaahorros">
                                                                                                <td>{{cuentaahorro.id}}</td>
                                                                                                <td>{{cuentaahorro.codigo}}</td>
                                                                                                <td>{{cuentaahorro.tipomoneda.denominacion}}</td>
                                                                                                <td>{{cuentaahorro.importe|currency: 'S/. '}}</td>
                                                                                                <td>{{cuentaahorro.fechaApertura}}</td>
                                                                                                <td>{{cuentaahorro.tea}} %</td>
                                                                                                <td ng-show="cuentaahorro.estadocuentaahorro.id === 1"><a href="javascript:void(0)" ng-click="eliminarCuentaahorro(cuentaahorro)"  style="color:red"><i class="fa fa-close"></i> Eliminar</a></td>
                                                                                                <td ng-show="cuentaahorro.estadocuentaahorro.id > 1"></td>
                                                                                                <td ng-show="cuentaahorro.productoahorro.tipoahorro.id === 1"><a target="_blank" href="${pageContext.request.contextPath}/reporte/reportecertificado?type=pdf&&cl={{cuentaahorro.cliente.codigo.substr(0,2)}}&&id={{cuentaahorro.id}}"><i class="fa fa-file-pdf-o"></i> Certificado</a></td>
                                                                                                <td ng-show="cuentaahorro.productoahorro.tipoahorro.id > 1"></td>
                                                                                            </tr>
                                                                                            <tr ng-show="cuentaahorros.length === 0">
                                                                                                <td colspan="8" class="dataTables_empty">No hay datos disponibles</td>
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
                                                                            <legend style="font-family: Cambria" id="imprimir3">Plan de intereses</legend>
                                                                            <div class="row">
                                                                                <div class="col-ss-12 col-xs-12">
                                                                                    <table class="table table-striped responsive-utilities jambo_table bulk_action" id="tablaCalculocuotas">
                                                                                        <thead>
                                                                                            <tr class="headings">
                                                                                                <th class="column-title">N°</th>
                                                                                                <th class="column-title">Fecha</th>
                                                                                                <th class="column-title">Factor</th>
                                                                                                <th class="column-title">Monto</th>
                                                                                                <th class="column-title">Interes</th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                            <tr ng-show="intereses.length > 0" ng-repeat="interes in intereses">
                                                                                                <td>{{interes.numero}}</td>
                                                                                                <td>{{interes.fecha}}</td>
                                                                                                <td>{{interes.factor}}</td>
                                                                                                <td>{{interes.monto}}</td>
                                                                                                <td>{{interes.interes}}</td>
                                                                                            </tr>
                                                                                            <tr ng-show="intereses.length === 0">
                                                                                                <td colspan="5" class="dataTables_empty">No hay datos disponibles</td>
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
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-ss-12 col-xs-12" style="padding-top: 10px" id="plazofijobtn" hidden="">
                                                    <button class="btn btn-primary" ng-click="registrarpf(formulariopf)">Crear</button>
                                                </div>
                                                <div class="col-ss-12 col-xs-12" style="padding-top: 10px" id="ahorrobtn" hidden="">
                                                    <button class="btn btn-primary" ng-click="registrarah(formularioah)">Crear</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <jsp:include page="../shared/footer.jsp" flush="true"/>
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
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-ss-12 col-xs-12">
                                <fieldset>
                                    <div class="row">
                                        <div class="col-ss-12 col-xs-6">
                                            <select ng-options="opcionCliente as opcionCliente.denominacion for opcionCliente in opcionClientes track by opcionCliente.id" ng-model="opcionCliente" class="form-control">
                                            </select>
                                        </div>
                                    </div>
                                    <div ng-show="opcionCliente.id === 1" class="row">
                                        <div class="col-ss-12 col-xs-12">
                                            <div class="row">
                                                <div class="col-ss-12 col-xs-6 col-sm-3">
                                                    <label>DNI</label>
                                                    <input ng-model="clienteb.dni" class="form-control" placeholder="DNI" type="number" ng-keyup="listarPersonanatural(1)">  
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-ss-12 col-xs-4">
                                            <label>Nombre</label>
                                            <input ng-model="clienteb.nombre" class="form-control" placeholder="NOMBRE" type="text" ng-keyup="listarPersonanatural(2)">
                                        </div>
                                        <div class="col-ss-12 col-xs-4">
                                            <label>Apellido paterno</label>
                                            <input ng-model="clienteb.apellidoPat" class="form-control" placeholder="APELLIDO PATERNO" type="text" ng-keyup="listarPersonanatural(2)">
                                        </div>
                                        <div class="col-ss-12 col-xs-4">
                                            <label>Apellido materno</label>
                                            <input ng-model="clienteb.apellidoMat" class="form-control" placeholder="APELLIDO MATERNO" type="text" ng-keyup="listarPersonanatural(2)">
                                        </div>
                                        <div class="col-ss-12 col-xs-12" style="padding-top: 10px">
                                            <table class="table table-striped jambo_table bulk_action">
                                                <thead>
                                                    <tr>
                                                        <th>Codigo</th>
                                                        <th>DNI</th>
                                                        <th>Nombre</th>
                                                        <th>Apellidos</th>
                                                        <th>Id cliente</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-show="personanaturals.length > 0" ng-repeat="personanatural in personanaturals" ng-click="seleccionarpn(personanatural)">
                                                        <td>{{personanatural.cliente.codigo}}</td>
                                                        <td>{{personanatural.persona.dni}}</td>
                                                        <td>{{personanatural.persona.nombre}}</td>
                                                        <td>{{personanatural.persona.apellidoPat}} {{personanatural.persona.apellidoMat}}</td>
                                                        <td>{{personanatural.cliente.id}}</td>
                                                    </tr>
                                                    <tr ng-show="personanaturals.length <= 0">
                                                        <td colspan="5" class="dataTables_empty">No hay registros de clientes persona natural</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div ng-show="opcionCliente.id === 2" class="row">
                                        <div class="col-ss-12 col-xs-12">
                                            <div class="row">
                                                <div class="col-ss-12 col-xs-6 col-sm-3">
                                                    <label>RUC</label>
                                                    <input ng-model="personaj.ruc" class="form-control" placeholder="RUC" type="number" ng-keyup="listarPersonajuridica(1)">  
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-ss-12 col-xs-6">
                                            <label>Razon social</label>
                                            <input ng-model="personaj.razonSocial" class="form-control" placeholder="RAZON SOCIAL" type="text" ng-keyup="listarPersonajuridica(2)">
                                        </div>
                                        <div class="col-ss-12 col-xs-6">
                                            <label>Nombre comercial</label>
                                            <input ng-model="personaj.nombreComercial" class="form-control" placeholder="NOMBRE COMERCIAL" type="text" ng-keyup="listarPersonajuridica(2)">
                                        </div>
                                        <div class="col-ss-12 col-xs-12" style="padding-top: 10px">
                                            <table class="table table-striped jambo_table bulk_action">
                                                <thead>
                                                    <tr>
                                                        <th>Codigo </th>
                                                        <th>RUC</th>
                                                        <th>Razon social </th>
                                                        <th>Nombre comercial</th>
                                                        <th>Id cliente</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-show="personajuridicas.length > 0" ng-repeat="personajuridica in personajuridicas" ng-click="seleccionarpj(personajuridica)">
                                                        <td>{{personajuridica.cliente.codigo}}</td>
                                                        <td>{{personajuridica.ruc}}</td>
                                                        <td>{{personajuridica.razonSocial}}</td>
                                                        <td>{{personajuridica.nombreComercial}}</td>
                                                        <td>{{personajuridica.cliente.id}}</td>
                                                    </tr>
                                                    <tr ng-show="personajuridicas.length <= 0">
                                                        <td colspan="5" class="dataTables_empty">No hay registros de clientes persona juridica</td>
                                                    </tr>
                                                </tbody>                                                
                                            </table>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal" aria-label="Close">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="modalBuscarproductoahorro" tabindex="-1" role="dialog" aria-labelledby="modalBuscarProductoahorro" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="color: #449ACA; text-align: center">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="modalBuscarClienteLabel">Buscar producto ahorro</h4>
                    </div>
                    <div id="bodyModal" class="modal-body">
                        <div class="row">
                            <div class="col-ss-12 col-xs-12">
                                <fieldset>
                                    <div class="row">
                                        <div class="col-ss-12 col-xs-6">
                                            <label>Tipo moneda</label>
                                            <select ng-options="tipomoneda as tipomoneda.denominacion for tipomoneda in tipomonedas track by tipomoneda.id" ng-model="productoahorrob.tipomoneda" class="form-control">
                                            </select>
                                        </div>
                                        <div class="col-ss-12 col-xs-6">
                                            <label>Nombre</label>
                                            <input ng-model="productoahorrob.nombre" class="form-control" placeholder="NOMBRE" type="text" ng-keyup="listarProductoahorro()">  
                                        </div>
                                        <div class="col-ss-12 col-xs-12" style="padding-top: 10px">
                                            <table class="table table-striped responsive-utilities jambo_table bulk_action">
                                                <thead>
                                                    <tr>
                                                        <th>Codigo</th>
                                                        <th>Id</th>
                                                        <th>Nombre</th>
                                                        <th>Tea</th>
                                                        <th>Tipo ahorro</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-repeat="productoahorro in productoahorros" ng-click="seleccionarph(productoahorro)">
                                                        <td>{{productoahorro.codigo}}</td>
                                                        <td>{{productoahorro.id}}</td>
                                                        <td>{{productoahorro.nombre}}</td>
                                                        <td>{{productoahorro.tea}} %</td>
                                                        <td>{{productoahorro.tipoahorro.denominacion}}</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </fieldset>
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

        <script src="${pageContext.request.contextPath}/assets/js/angular/angular.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-validate.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/controller/ahorroCuentaahorroModule.js" type="text/javascript"></script>

        <script type="text/javascript">

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

                                                                    $('.open-tab').click(function () {
                                                                        $("#myTab li[class=active]").removeClass("active");

                                                                        var tab = $("#profile-tab").parent();
                                                                        tab.addClass("active");
                                                                    });

                                                                    $("#fechaApertura").datepicker({dateFormat: "yy-mm-dd"});
                                                                    $("#fechaApertura2").datepicker({dateFormat: "yy-mm-dd"});
        </script>
    </body>
</html>
