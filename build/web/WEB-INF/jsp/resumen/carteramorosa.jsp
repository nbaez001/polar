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
<html ng-app="resumenModule">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cartera moroso</title>
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
    <body class="nav-md" style="font-family: Cambria" ng-controller="carteramorosaController">
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../shared/navbarLeft.jsp" flush="true"/>
                <jsp:include page="../shared/navbarTop.jsp" flush="true"/>
                <div class="right_col" role="main">

                    <div class="">
                        <div class="page-title">
                            <div class="title_left">
                                <h4>Administracion de cuentas morosas</h4>
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
                                        <h2>Busqueda de cartera morosa <i class="fa fa-book"></i></h2>
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
                                                            <select ng-options="opcioncliente as opcioncliente.nombre for opcioncliente in opcionclientes track by opcioncliente.id" ng-model="opcioncliente" class="form-control" style="color: #322660">
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div ng-show="opcioncliente.id === 1" class="row">
                                                        <form name="formulariopc" ng-submit="morosidadpc(formulariopc)" ng-validate="validatepc">
                                                            <div class="col-ss-12 col-xs-4 col-sm-3">
                                                                <label>Agencia</label>
                                                                <select ng-options="agencia as agencia.nombre for agencia in agencias track by agencia.id" ng-model="agencia" name="agencia" class="form-control">
                                                                </select>
                                                            </div>
                                                            <div class="col-ss-12 col-xs-4 col-sm-3">
                                                                <label>Producto credito</label>
                                                                <select ng-options="productocredito as productocredito.nombre for productocredito in productocreditos track by productocredito.id" ng-model="productocreditob" name="productoCredito" class="form-control">
                                                                </select>
                                                            </div>
                                                            <div class="col-ss-12 col-xs-4 col-sm-3" style="padding-top: 23px">
                                                                <button type="submit" class="btn btn-primary">Buscar</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <div ng-show="opcioncliente.id === 2" class="row">
                                                        <form name="formulariofc" ng-submit="morosidadfc(formulariofc)" ng-validate="validatefc">
                                                            <div class="col-ss-12 col-xs-4 col-sm-3">
                                                                <label>Fecha inicial</label>
                                                                <input ng-model="morosofechab.fechaInicio" name="fechaInicio" class="form-control" placeholder="FECHA INICIO">  
                                                            </div>
                                                            <div class="col-ss-12 col-xs-4 col-sm-3">
                                                                <label>Fecha inicial</label>
                                                                <input ng-model="morosofechab.fechaFin" name="fechaFin" class="form-control" placeholder="FECHA FIN">  
                                                            </div>
                                                            <div class="col-ss-12 col-xs-4 col-sm-3" style="padding-top: 23px">
                                                                <button type="submit" class="btn btn-primary">Buscar</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <div ng-show="opcioncliente.id === 3" class="row">
                                                        <div class="col-ss-12 col-xs-12">
                                                            <div class="row">
                                                                <div class="col-ss-12 col-xs-6 col-sm-3">
                                                                    <label>DNI</label>
                                                                    <input ng-model="personab.dni" class="form-control" placeholder="DNI" type="number" ng-keyup="buscarMorosonatural(1)">  
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-ss-12 col-xs-4">
                                                            <label>Nombre</label>
                                                            <input ng-model="personab.nombre" class="form-control" placeholder="NOMBRE" type="text" ng-keyup="buscarMorosonatural(2)">
                                                        </div>
                                                        <div class="col-ss-12 col-xs-4">
                                                            <label>Apellido paterno</label>
                                                            <input ng-model="personab.apellidoPat" class="form-control" placeholder="APELLIDO PATERNO" type="text" ng-keyup="buscarMorosonatural(2)">
                                                        </div>
                                                        <div class="col-ss-12 col-xs-4">
                                                            <label>Apellido materno</label>
                                                            <input ng-model="personab.apellidoMat" class="form-control" placeholder="APELLIDO MATERNO" type="text" ng-keyup="buscarMorosonatural(2)">
                                                        </div>
                                                    </div>
                                                    <div ng-show="opcioncliente.id === 4" class="row">
                                                        <div class="col-ss-12 col-xs-12">
                                                            <div class="row">
                                                                <div class="col-ss-12 col-xs-6 col-sm-3">
                                                                    <label>RUC</label>
                                                                    <input ng-model="personajuridicab.ruc" class="form-control" placeholder="RUC" type="number" ng-keyup="buscarMorosojuridico(1)">  
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-ss-12 col-xs-6">
                                                            <label>Razon social</label>
                                                            <input ng-model="personajuridicab.razonSocial" class="form-control" placeholder="RAZON SOCIAL" type="text" ng-keyup="buscarMorosojuridico(2)">
                                                        </div>
                                                        <div class="col-ss-12 col-xs-6">
                                                            <label>Nombre comercial</label>
                                                            <input ng-model="personajuridicab.nombreComercial" class="form-control" placeholder="NOMBRE COMERCIAL" type="text" ng-keyup="buscarMorosojuridico(2)">
                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </div>
                                        </div>
                                        <div class="row" style="padding-top: 15px">
                                            <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                                <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                    <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Registro de busqueda</a>
                                                    </li>
                                                    <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Registro completo</a>
                                                    </li>
                                                </ul>
                                                <div id="myTabContent" class="tab-content">
                                                    <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                                                        <div class="panel panel-default">
                                                            <div class="panel-body">
                                                                <fieldset>
                                                                    <legend style="font-family: Cambria">Clientes morosos</legend>
                                                                    <div class="row">
                                                                        <div class="col-ss-12 col-xs-12">
                                                                            <table ng-show="opcioncliente.id === 1" class="table table-striped responsive-utilities jambo_table bulk_action">
                                                                                <thead>
                                                                                    <tr class="headings">
                                                                                        <th>N° </th>
                                                                                        <th>Codigo</th>
                                                                                        <th>Nombre </th>
                                                                                        <th>Forma pago</th>
                                                                                        <th>Tasa de interes</th>
                                                                                        <th>Numero cuentas morosas</th>
                                                                                        <th>Accion</th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    <tr ng-show="morosopcs.length !== 0" ng-repeat="item in morosopcs">
                                                                                        <td>-</td>
                                                                                        <td>{{item.codigo}}</td>
                                                                                        <td>{{item.nombre}}</td>
                                                                                        <td>{{item.formaPago}}</td>
                                                                                        <td>{{item.tasa}}</td>
                                                                                        <td style="color:red">{{item.numeroCuentamorosa}} cuenta(s) con mora</td>
                                                                                        <td class=" last"><a target="_blank" href="${pageContext.request.contextPath}/reporte/reportecarteramorosa?type=pdf&&agencia={{agencia.nombre}}&&id={{item.id}}"><i class="fa fa-file-pdf-o fa-2x"></i> Reporte cartera morosa</a></td>
                                                                                    </tr>
                                                                                    <tr ng-show="morosopcs.length !== 0">
                                                                                        <td valign="top" colspan="7" class="dataTables_empty"><a target="_blank" href="${pageContext.request.contextPath}/reporte/reportegeneralcarteramorosa?type=pdf&&agencia={{agencia.nombre}}" style="color:blue"><i class="fa fa-file-pdf-o fa-2x"></i> Imprimir reporte general de cartera morosa por producto</a></td>
                                                                                    </tr>
                                                                                    <tr ng-show="morosopcs.length === 0">
                                                                                        <td valign="top" colspan="7" class="dataTables_empty">Ningun registro de moras por producto credito</td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                            <table ng-show="opcioncliente.id === 2" class="table table-striped responsive-utilities jambo_table bulk_action">
                                                                                <thead>
                                                                                    <tr class="headings">
                                                                                        <th>N° </th>
                                                                                        <th>DNI/RUC</th>
                                                                                        <th>Nombre/Razon social</th>
                                                                                        <th>Apellidos/Nombre comercial</th>
                                                                                        <th>Codigo cliente</th>
                                                                                        <th>Numero cuentas con mora</th>
                                                                                        <th>Accion</th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    <tr ng-show="morosofechas.length !== 0" ng-repeat="item in morosofechas">
                                                                                        <td>-</td>
                                                                                        <td>{{item.dato1}}</td>
                                                                                        <td>{{item.dato2}}</td>
                                                                                        <td>{{item.dato3}}</td>
                                                                                        <td>{{item.codigo}}</td>
                                                                                        <td style="color:red" ng-if="item.numeroCuentamorosa > 0">{{item.numeroCuentamorosa}} Cuentas con mora</td>
                                                                                        <td><a target="_blank" href="${pageContext.request.contextPath}/reporte/reportemoroso?type=pdf&&cl={{item.cl}}&&id={{item.idCliente}}"><i class="fa fa-file-pdf-o fa-2x"></i> Ficha moroso</a></td>
                                                                                    </tr>
                                                                                    <tr ng-show="morosofechas.length === 0">
                                                                                        <td valign="top" colspan="7" class="dataTables_empty">Ningun registro de clientes morosos en las fechas seleccionadas</td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                            <table ng-show="opcioncliente.id === 3" class="table table-striped responsive-utilities jambo_table bulk_action">
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
                                                                                    <tr ng-show="morosonaturals.length !== 0" ng-repeat="item in morosonaturals">
                                                                                        <td>{{item.id}}</td>
                                                                                        <td>{{item.dni}}</td>
                                                                                        <td>{{item.nombre}}</td>
                                                                                        <td>{{item.apellidoPat}} {{item.apellidoMat}}</td>
                                                                                        <td>{{item.codigo}}</td>
                                                                                        <td style="color:red" ng-if="item.numeroCuentamorosa > 0">{{item.numeroCuentamorosa}} Cuentas con mora</td>
                                                                                        <td class=" last" ng-if="item.numeroCuentamorosa > 0"><a target="_blank" href="${pageContext.request.contextPath}/reporte/reportemoroso?type=pdf&&cl={{item.cl}}&&id={{item.idCliente}}"><i class="fa fa-file-pdf-o fa-2x"></i> Ficha moroso</a></td>
                                                                                        <td style="color:blue" ng-if="item.numeroCuentamorosa <= 0">{{item.numeroCuentamorosa}} Cuentas con mora</td>
                                                                                        <td ng-if="item.numeroCuentamorosa <= 0"></td>
                                                                                    </tr>
                                                                                    <tr ng-show="morosonaturals.length === 0">
                                                                                        <td valign="top" colspan="7" class="dataTables_empty">Ningun registro de clientes naturales morosos</td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                            <table ng-show="opcioncliente.id === 4" class="table table-striped responsive-utilities jambo_table bulk_action">
                                                                                <thead>
                                                                                    <tr class="headings">
                                                                                        <th>N° </th>
                                                                                        <th>RUC</th>
                                                                                        <th>Razon social </th>
                                                                                        <th>Nombre comercial</th>
                                                                                        <th>Codigo cliente</th>
                                                                                        <th>Numero cuentas con mora</th>
                                                                                        <th>Accion</th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    <tr ng-show="morosojuridicos.length !== 0" ng-repeat="item in morosojuridicos">
                                                                                        <td>{{item.id}}</td>
                                                                                        <td>{{item.ruc}}</td>
                                                                                        <td>{{item.razonSocial}}</td>
                                                                                        <td>{{item.nombreComercial}}</td>
                                                                                        <td>{{item.codigo}}</td>
                                                                                        <td style="color:red" ng-if="item.numeroCuentamorosa > 0">{{item.numeroCuentamorosa}} Cuentas con mora</td>
                                                                                        <td class="last" ng-if="item.numeroCuentamorosa > 0"><a target="_blank" href="${pageContext.request.contextPath}/reporte/reportemoroso?type=pdf&&cl={{item.cl}}&&id={{item.idCliente}}"><i class="fa fa-file-pdf-o fa-2x"></i> Ficha moroso</a></td>
                                                                                        <td style="color:blue" ng-if="item.numeroCuentamorosa <= 0">{{item.numeroCuentamorosa}} Cuentas con mora</td>
                                                                                        <td ng-if="item.numeroCuentamorosa <= 0">-</td>
                                                                                    </tr>
                                                                                    <tr ng-show="morosojuridicos.length === 0">
                                                                                        <td valign="top" colspan="7" class="dataTables_empty">Ningun registro de clientes juridicos morosos</td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </fieldset>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                                                        <div class="panel panel-default">
                                                            <div class="panel-body">
                                                                <fieldset>
                                                                    <legend style="font-family: Cambria">Clientes morosos</legend>
                                                                    <div class="row">
                                                                        <div class="col-ss-12 col-xs-12">
                                                                            <table class="table table-striped responsive-utilities jambo_table bulk_action">
                                                                                <thead>
                                                                                    <tr class="headings">
                                                                                        <th>N°</th>
                                                                                        <th>Cliente</th>
                                                                                        <th>Nombre cliente</th>
                                                                                        <th>Cuenta credito</th>
                                                                                        <th>Moneda</th>
                                                                                        <th>Credito</th>
                                                                                        <th>Fecha vencimiento</th>
                                                                                        <th>Notificación</th>
                                                                                        <th>Accion</th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    <tr ng-repeat="cuentamorosa in cuentamorosas">
                                                                                        <td>{{cuentamorosa.id}}</td>
                                                                                        <td>{{cuentamorosa.cliente.codigo}}</td>
                                                                                        <td>{{cuentamorosa.nombre}}</td>
                                                                                        <td>{{cuentamorosa.cuentaCredito}}</td>
                                                                                        <td>{{cuentamorosa.moneda}}</td>
                                                                                        <td>{{cuentamorosa.importeCredito}}</td>
                                                                                        <td>{{cuentamorosa.fechaVencimiento}}</td>
                                                                                        <td>{{cuentamorosa.mensaje}}</td>
                                                                                        <td class=" last">
                                                                                            <a target="_blank" href="${pageContext.request.contextPath}/reporte/reportemoroso?type=pdf&&cl={{cuentamorosa.cl}}&&id={{cuentamorosa.cliente.id}}"><i class="fa fa-file-pdf-o fa-2x"></i> Ficha moroso</a>
                                                                                        </td>
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
                    <jsp:include page="../shared/footer.jsp" flush="true"/>
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

        <script src="${pageContext.request.contextPath}/assets/controller/resumenModule.js" type="text/javascript"></script>

        <script type="text/javascript">
                                                                                                        $("form[name=formulariofc] input[name=fechaInicio]").datepicker({dateFormat: 'yy-mm-dd'});
                                                                                                        $("form[name=formulariofc] input[name=fechaFin]").datepicker({dateFormat: 'yy-mm-dd'});
        </script>
    </body>
</html>
