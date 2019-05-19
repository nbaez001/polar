<%-- 
    Document   : index
    Created on : 13/02/2016, 03:29:06 AM
    Author     : nerio
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="administracionModule">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admision cuenta credito</title>
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
    <body class="nav-md" style="font-family: Cambria" ng-controller="admisioncreditoController">
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../shared/navbarLeft.jsp" flush="true"/>
                <jsp:include page="../shared/navbarTop.jsp" flush="true"/>
                <div class="right_col" role="main">

                    <div class="">
                        <div class="page-title">
                            <div class="title_left">
                                <h4>Admision de creditos</h4>
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
                                        <h2>Revisar creditos <i class="fa fa-book"></i></h2>
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
                                                    <div class="col-ss-12 col-xs-6 col-sm-6">
                                                        <label>Agencia</label>
                                                        <select ng-options="agencia as agencia.nombre for agencia in agencias track by agencia.id" ng-model="agencia" class="form-control">
                                                        </select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6" style="padding-top: 5px">
                                                        <br>
                                                        <button ng-click="listarCuentasadmision()" class="btn btn-primary">Actualizar</button>
                                                    </div>
                                                </form>
                                                <!-- DATOS ADICIONALES-->
                                                <div class="col-ss-12 col-xs-12 col-sm-12" style="margin-top: 10px">
                                                    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                            <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Cuentas de credito</a>
                                                            </li>
                                                        </ul>
                                                        <div id="myTabContent" class="tab-content">
                                                            <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                                                                <div class="panel panel-default">
                                                                    <div class="panel-body">
                                                                        <fieldset>
                                                                            <legend style="font-family: Cambria">Cuentas de credito otorgados</legend>
                                                                            <div class="row">
                                                                                <div class="col-ss-12 col-xs-12">
                                                                                    <table class="table table-striped jambo_table bulk_action">
                                                                                        <thead>
                                                                                            <tr class="headings">
                                                                                                <th class="column-title">N°</th>
                                                                                                <th class="column-title">Codigo cliente</th>
                                                                                                <th class="column-title">Cliente</th>
                                                                                                <th class="column-title">Producto credito</th>
                                                                                                <th class="column-title">Credito</th>
                                                                                                <th class="column-title">Interes</th>
                                                                                                <th class="column-title">Moneda</th>
                                                                                                <th class="column-title">Fecha apertura</th>
                                                                                                <th class="column-title">Plazo</th>
                                                                                                <th class="column-title">Estado</th>
                                                                                                <th class="column-title">Accion</th>
                                                                                                <th class="column-title">Accion</th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                            <tr ng-repeat="cuentacredito in cuentacreditos">
                                                                                                <td>{{cuentacredito.id}}</td>
                                                                                                <td>{{cuentacredito.cliente.codigo}}</td>
                                                                                                <td>{{cuentacredito.nombre}}</td>
                                                                                                <td>{{cuentacredito.productocredito.nombre}}</td>
                                                                                                <td>{{cuentacredito.importeCredito}}</td>
                                                                                                <td>{{cuentacredito.interes}}</td>
                                                                                                <td>{{cuentacredito.moneda}}</td>
                                                                                                <td>{{cuentacredito.fechaApertura}}</td>
                                                                                                <td>{{cuentacredito.plazo}}</td>
                                                                                                <td>{{cuentacredito.estadocredito.abreviacion}}</td>
                                                                                                <td>
                                                                                                    <a target="_blank" href="${pageContext.request.contextPath}/reporte/reporteplanpagos?type=pdf&&cl={{cuentacredito.cliente.codigo.substr(0, 2)}}&&id={{cuentacredito.id}}"><i class="fa fa-file-pdf-o fa-2x"></i> Plan pagos</a>
                                                                                                </td>
                                                                                                <td ng-if="cuentacredito.cliente.codigo.substr(0, 2) === 'CN'">
                                                                                                    <a href="javascript:void(0)" ng-click="cargardetallecn(cuentacredito)"><i class="fa fa-check-square-o fa-2x"></i> Ver detalles</a>
                                                                                                </td>
                                                                                                <td ng-if="cuentacredito.cliente.codigo.substr(0, 2) === 'CJ'">
                                                                                                    <a href="javascript:void(0)" ng-click="cargardetallecj(cuentacredito)"><i class="fa fa-check-square-o fa-2x"></i> Ver detalles</a>
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
                                                <div ng-show="clientecn.id !== 0" id="detailcn" class="col-ss-12 col-xs-12 col-sm-12" style="margin-top: 10px">
                                                    <div class="panel panel-default">
                                                        <form name="formulariocn" ng-validate="validatecn">
                                                            <div class="panel-heading" style="text-align: center;color: blue">CREDITO {{cuentacredito.cuentaCredito}}</div>
                                                            <div class="panel-body">
                                                                <div class="row">
                                                                    <fieldset>
                                                                        <legend style="font-size:14px"><b>Datos del cliente</b></legend>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>Codigo cliente: </b>{{cuentacredito.cliente.codigo}}
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>Dni: </b>{{clientecn.dni}}
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>Nombre: </b>{{clientecn.nombre}}
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>Apellidos: </b>{{clientecn.apellidoPat}} {{clientecn.apellidoMat}}
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>Direccion: </b>{{clientecn.direccion}}
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>Celular: </b>{{clientecn.celular}}
                                                                        </div>
                                                                    </fieldset>
                                                                </div>
                                                                <div class="row" style="padding-top:10px">
                                                                    <fieldset>
                                                                        <legend style="font-size:14px"><b>Datos de credito</b></legend>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>Producto credito: </b>{{cuentacredito.productocredito.nombre}}
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>Cuenta credito: </b>{{cuentacredito.cuentaCredito}}
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>Importe credito: </b>{{cuentacredito.importeCredito}}
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>Interes: </b>{{cuentacredito.interes}}
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>Moneda: </b>{{cuentacredito.moneda}}
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>Plazo pago: </b>{{cuentacredito.plazo}} meses
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>Fecha apertura: </b>{{cuentacredito.fechaApertura}}
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>Monto desembolso: </b>{{cuentacredito.montoDesembolso}}
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>estado credito: </b>{{cuentacredito.estadocredito.denominacion}}
                                                                        </div>
                                                                    </fieldset>
                                                                </div>
                                                                <div class="row" style="padding-top:10px">
                                                                    <fieldset>
                                                                        <legend style="font-size:14px"><b>Garantes</b></legend>
                                                                        <div class="col-ss-12 col-xs-12 col-sm-12">
                                                                            <table class="table table-striped">
                                                                                <thead>
                                                                                    <tr>
                                                                                        <td>N°</td>
                                                                                        <td>Tipo</td>
                                                                                        <td>Descripcion</td>
                                                                                        <td>Importe garante</td>
                                                                                        <td>Importe comprometido</td>
                                                                                        <td>Moneda</td>
                                                                                        <td>Fecha activacion</td>
                                                                                        <td>Fecha levantamiento</td>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    <tr ng-show="garantes.length !== 0" ng-repeat="garante in garantes">
                                                                                        <td>-</td>
                                                                                        <td>{{garante.tipoGrante}}</td>
                                                                                        <td>{{garante.descripcion}}</td>
                                                                                        <td>{{garante.importeGarante}}</td>
                                                                                        <td>{{garante.importeComprometido}}</td>
                                                                                        <td>{{garante.tipoMoneda}}</td>
                                                                                        <td>{{garante.fechaActivacion}}</td>
                                                                                        <td>{{garante.fechaLevantamiento}}</td>
                                                                                    </tr>
                                                                                    <tr ng-show="garantes.length === 0">
                                                                                        <td valign="top" colspan="8" class="dataTables_empty">No hay garantes registrados</td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </fieldset>
                                                                </div>
                                                                <div class="row" style="padding-top:10px" id="panelMensajeRechazoAnulacion">
                                                                    <fieldset>
                                                                        <div class="col-ss-12 col-xs-12 col-sm-12">
                                                                            <textarea ng-model="mensaje" name="mensaje" class="form-control" placeholder="DEBE ESCRIBIR UN MENSAJE OBLIGATORIAMENTE EN CASO DE RECHAZAR ALGUN CREDITO"></textarea>
                                                                        </div>
                                                                    </fieldset>
                                                                </div>
                                                            </div>
                                                            <div class="panel-footer" style="text-align: center">
                                                                <button class="btn btn-success"  ng-click="admisioncredito(5, formulariocn)">Aceptar</button>
                                                                <button class="btn btn-primary" ng-click="admisioncredito(2, formulariocn)">Rechazar</button>
                                                                <button class="btn btn-danger" ng-click="admisioncredito(3, formulariocn)">Anular</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                                <div ng-show="clientecj.id !== 0" id="detailcj" class="col-ss-12 col-xs-12 col-sm-12" style="margin-top: 10px">
                                                    <div class="panel panel-default">
                                                        <form name="formulariocj" ng-validate="validatecj">
                                                            <div class="panel-heading" style="text-align: center;color: blue">CREDITO {{cuentacredito.cuentaCredito}}</div>
                                                            <div class="panel-body">
                                                                <div class="row" >
                                                                    <fieldset>
                                                                        <legend style="font-size:14px"><b>Datos del cliente</b></legend>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>Codigo cliente: </b>{{cuentacredito.cliente.codigo}}
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>RUC: </b>{{clientecj.ruc}}
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>Razon social </b>{{clientecj.razonSocial}}
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>Nombre comercial </b>{{clientecj.nombreComercial}}
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>Giro del negocio: </b>{{clientecj.giroNegocio}}
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>Direccion: </b>{{clientecj.direccion}}
                                                                        </div>
                                                                    </fieldset>
                                                                </div>
                                                                <div class="row" style="padding-top:10px">
                                                                    <fieldset>
                                                                        <legend style="font-size:14px"><b>Datos de credito</b></legend>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>Producto credito: </b>{{cuentacredito.productocredito.nombre}}
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>Cuenta credito: </b>{{cuentacredito.cuentaCredito}}
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>Importe credito: </b>{{cuentacredito.importeCredito}}
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>Interes: </b>{{cuentacredito.interes}}
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>Moneda: </b>{{cuentacredito.moneda}}
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>Plazo pago: </b>{{cuentacredito.plazo}} meses
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>Fecha apertura: </b>{{cuentacredito.fechaApertura}}
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>Monto desembolso: </b>{{cuentacredito.montoDesembolso}}
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                            <b>estado credito: </b>{{cuentacredito.estadocredito.denominacion}}
                                                                        </div>
                                                                    </fieldset>
                                                                </div>
                                                                <div class="row" style="padding-top:10px">
                                                                    <fieldset>
                                                                        <legend style="font-size:14px"><b>Garantes</b></legend>
                                                                        <div class="col-ss-12 col-xs-12 col-sm-12">
                                                                            <table class="table table-striped">
                                                                                <thead>
                                                                                    <tr>
                                                                                        <td>N°</td>
                                                                                        <td>Tipo</td>
                                                                                        <td>Descripcion</td>
                                                                                        <td>Importe garante</td>
                                                                                        <td>Importe comprometido</td>
                                                                                        <td>Moneda</td>
                                                                                        <td>Fecha activacion</td>
                                                                                        <td>Fecha levantamiento</td>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    <tr ng-show="garantes.length !== 0" ng-repeat="garante in garantes">
                                                                                        <td>-</td>
                                                                                        <td>{{garante.tipoGrante}}</td>
                                                                                        <td>{{garante.descripcion}}</td>
                                                                                        <td>{{garante.importeGarante}}</td>
                                                                                        <td>{{garante.importeComprometido}}</td>
                                                                                        <td>{{garante.tipoMoneda}}</td>
                                                                                        <td>{{garante.fechaActivacion}}</td>
                                                                                        <td>{{garante.fechaLevantamiento}}</td>
                                                                                    </tr>
                                                                                    <tr ng-show="garantes.length === 0">
                                                                                        <td valign="top" colspan="8" class="dataTables_empty">No hay garantes registrados</td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </fieldset>
                                                                </div>
                                                                <div class="row" style="padding-top:10px">
                                                                    <fieldset>
                                                                        <div class="col-ss-12 col-xs-12 col-sm-12">
                                                                            <textarea ng-model="mensaje" name="mensaje" class="form-control" placeholder="DEBE ESCRIBIR UN MENSAJE OBLIGATORIAMENTE EN CASO DE RECHAZAR ALGUN CREDITO"></textarea>
                                                                        </div>
                                                                    </fieldset>
                                                                </div>
                                                            </div>
                                                            <div class="panel-footer" style="text-align: center">
                                                                <button class="btn btn-success" ng-click="admisioncredito(5, formulariocj)">Aceptar</button>
                                                                <button class="btn btn-primary" ng-click="admisioncredito(2, formulariocj)">Rechazar</button>
                                                                <button class="btn btn-danger" ng-click="admisioncredito(3, formulariocj)">Anular</button>
                                                            </div>
                                                        </form>
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

        <script src="${pageContext.request.contextPath}/assets/js/angular/angular.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-validate.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/controller/administracionModule.js" type="text/javascript"></script>
    </body>
</html>
