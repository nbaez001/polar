<%-- 
    Document   : personanatural
    Created on : 10/02/2016, 11:23:00 PM
    Author     : nerio
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="operacionesModule">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro comprobante</title>
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
    <body class="nav-md" style="font-family: Cambria" ng-controller="comprobanteController">
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../shared/navbarLeft.jsp" flush="true"/>
                <jsp:include page="../shared/navbarTop.jsp" flush="true"/>
                <div class="right_col" role="main">

                    <div class="">
                        <div class="page-title">
                            <div class="title_left">
                                <h4>Registro de comprobantes</h4>
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
                                        <h2>Registrar nuevo  <i class="fa fa-book"></i></h2>
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
                                                <form name="formulario" ng-submit="crearComprobante(formulario)" ng-validate="validate">
                                                    <div class="col-ss-12 col-xs-3 col-sm-3">
                                                        <label>Numero comprobante</label>
                                                        <input ng-model="id" class="form-control" disabled="" type="text">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-10 col-sm-10">
                                                        <label>Cliente (*)</label>
                                                        <div class="row">
                                                            <div class="col-ss-3 col-xs-3 col-sm-3" style="padding-right: 0px">
                                                                <input ng-model="comprobante.cliente.codigo" class="form-control" disabled="" style="text-align: center; color:  #322660" type="text">
                                                            </div>
                                                            <div class="col-ss-9 col-xs-9 col-sm-9" style="padding-left: 0px">
                                                                <input name="nombreCliente" ng-model="nombreCliente" class="form-control" placeholder="CLIENTE" data-toggle="modal" data-target="#modalBuscarcliente" type="text">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-2 col-sm-2">
                                                        <label>Moneda (*)</label>
                                                        <select ng-options="moneda as moneda.denominacion for moneda in monedas track by moneda.id" ng-model="comprobante.moneda" name="moneda" class="form-control" disabled="">
                                                        </select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Agencia (*)</label>
                                                        <select ng-options="agencia as agencia.nombre for agencia in agencias track by agencia.id" ng-model="comprobante.agencia" name="agencia" class="form-control" disabled="">
                                                        </select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Glosa (*)</label>
                                                        <input ng-model="comprobante.glosa" name="glosa" class="form-control" placeholder="GLOSA" type="text">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Naturaleza compr. (*)</label>
                                                        <select ng-options="naturalezacomprobante as naturalezacomprobante.denominacion for naturalezacomprobante in naturalezacomprobantes track by naturalezacomprobante.id" ng-model="comprobante.naturalezacomprobante" name="naturalezacomprobante" class="form-control">
                                                        </select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-12">
                                                        <label>Observacion</label>
                                                        <textarea ng-model="comprobante.observaciones" name="observaciones" class="form-control" placeholder="OBSERVACIONES"></textarea>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="row" style="padding-top: 10px">
                                                <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                                    <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                        <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Detalle comprobante</a>
                                                        </li>
                                                    </ul>
                                                    <div id="myTabContent" class="tab-content">
                                                        <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                                                            <div class="panel panel-default">
                                                                <div class="panel-body">
                                                                    <fieldset>
                                                                        <legend style="font-family: Cambria">Detalle</legend>
                                                                        <div class="row">
                                                                            <form name="formulario2" ng-submit="registrardtc(formulario2)" ng-validate="validatedtc">
                                                                                <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                    <label>Tipo documento. (*)</label>
                                                                                    <select ng-options="tipodocumento as tipodocumento.denominacion for tipodocumento in tipodocumentos track by tipodocumento.id" ng-model="detallecomprobante.tipodocumento" name="tipodocumento" class="form-control" ng-change="actualizarDescripcion()">
                                                                                    </select>
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                    <label>Descripción (*)</label>
                                                                                    <input ng-model="detallecomprobante.descripcion" name="descripcion" class="form-control" type="text">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                    <label>Monto (*)</label>
                                                                                    <input ng-model="detallecomprobante.monto" name="monto" class="form-control" placeholder="MONTO" type="number">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-12" style="padding-top: 10px">
                                                                                    <input type="submit" value="Agregar" class="btn btn-success btn-xs">
                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                    </fieldset>
                                                                    <fieldset>
                                                                        <legend style="font-family: Cambria">Lista detalle comprobante</legend>
                                                                        <div class="row">
                                                                            <table class="table table-striped">
                                                                                <thead>
                                                                                    <tr class="headings">
                                                                                        <th>N° </th>
                                                                                        <th>Descripción </th>
                                                                                        <th>Motivo </th>
                                                                                        <th>Monto </th>
                                                                                        <th class=" no-link last"><span class="nobr">Accion</span>
                                                                                        </th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    <tr ng-show="detallecomprobantes.length > 0" ng-repeat="detallecomprobante in detallecomprobantes">
                                                                                        <td>{{detallecomprobante.id}}</td>
                                                                                        <td>{{detallecomprobante.descripcion}}</td>
                                                                                        <td>{{detallecomprobante.tipodocumento.denominacion}}</td>
                                                                                        <td>{{detallecomprobante.monto}}</td>
                                                                                        <td>
                                                                                            <a href="javascript:void(0)" ng-click="quitardtc(detallecomprobante)" style="color: red"><i class="fa fa-trash"></i> Quitar</a>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr ng-show="detallecomprobantes.length <= 0">
                                                                                        <td valign="top" colspan="5" class="dataTables_empty">Ningun registro de detalle comprobante</td>
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
                                            <button ng-click="crearComprobante(formulario)" class="btn btn-primary">Registrar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12 col-sm-12 col-xs-12 col-ss-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Registro comprobantes </h2>
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
                                        <table class="table table-striped jambo_table">
                                            <thead>
                                                <tr class="headings">
                                                    <th>N° </th>
                                                    <th>Cliente </th>
                                                    <th>Glosa </th>
                                                    <th>Fecha </th>
                                                    <th>Monto </th>
                                                    <th>Naturaleza comprobante </th>
                                                    <th>Accion </th>
                                                    <th class=" no-link last"><span class="nobr">Accion</span></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr ng-show="comprobantes.length > 0" ng-repeat="comprobante in comprobantes">
                                                    <td>{{comprobante.id}}</td>
                                                    <td>{{comprobante.nombre}}</td>
                                                    <td>{{comprobante.glosa}}</td>
                                                    <td>{{comprobante.fecha}}</td>
                                                    <td>{{comprobante.monto}}</td>
                                                    <td>{{comprobante.naturalezacomprobante.denominacion}}</td>
                                                    <td ng-if="comprobante.idEstado === 1">
                                                        <a href="javascript:void(0)" ng-click="quitarComprobante(comprobante)" style="color: red"><i class="fa fa-close"></i> Eliminar</a>
                                                    </td>
                                                    <td ng-if="comprobante.idEstado !== 1"> - </td>
                                                    <td class=" last">
                                                        <a target="_blank" href="${pageContext.request.contextPath}/reporte/comprobante?type=pdf&&cl={{comprobante.cliente.codigo.substr(0, 2)}}&&id={{comprobante.id}}"><i class="fa fa-file-pdf-o fa-2x"></i> Comprobante</a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
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

        <script src="${pageContext.request.contextPath}/assets/js/angular/angular.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-validate.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/controller/operacionesModule.js" type="text/javascript"></script>
    </body>
</html>
