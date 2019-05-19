<%-- 
    Document   : categoria
    Created on : 29/12/2015, 10:47:48 AM
    Author     : Nerio
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%SimpleDateFormat formateadorFecha = new SimpleDateFormat("EEEE d MMMM yyyy (HH:mm");%>
<!DOCTYPE html>
<html ng-app="usuarioModule">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administracion de usuario</title>
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
    <body class="nav-md" style="font-family: Cambria" ng-controller="mantenerusuarioController">
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../shared/navbarLeft.jsp" flush="true"/>
                <jsp:include page="../shared/navbarTop.jsp" flush="true"/>
                <div class="right_col" role="main">
                    <div class="">
                        <div class="page-title">
                            <div class="title_left">
                                <h4>Administracion de usuarios </h4>
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
                            <div class="col-md-12 col-sm-12 col-xs-12 col-ss-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Crear nuevo usuario <i class="fa fa-book"></i></h2>
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
                                                <form name="formulario" ng-submit="registrarusuario(formulario)" ng-validate="validateusuario">
                                                    <fieldset style="margin-top: 5px">
                                                        <legend style="font-size: 13px; font-weight: bold">DATOS PERSONALES</legend>
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Dni 
                                                                <span ng-show="usuario.id === -1" class="label label-success">Nueva persona</span>
                                                                <span ng-show="usuario.id === 0" class="label label-warning">Persona existe</span>
                                                                <span ng-show="usuario.id > 0" class="label label-danger">Usuario existe</span>
                                                            </label>
                                                            <input ng-model="usuario.empleado.persona.dni" name="dni" class="form-control" placeholder="DNI" autofocus="" ng-keyup="validarPersona()"  type="number">
                                                        </div>
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Nombre</label>
                                                            <input ng-model="usuario.empleado.persona.nombre" name="nombre" class="form-control" placeholder="NOMBRE" type="text">
                                                        </div>
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Apellido paterno</label>
                                                            <input ng-model="usuario.empleado.persona.apellidoPat" name="apellidoPat" class="form-control" placeholder="APELLIDO PATERNO" type="text">
                                                        </div>
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Apellido materno</label>
                                                            <input ng-model="usuario.empleado.persona.apellidoMat" name="apellidoMat" class="form-control" placeholder="APELLIDO PATERNO" type="text">
                                                        </div>
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Direccion</label>
                                                            <input ng-model="usuario.empleado.persona.direccion" name="direccion" class="form-control" placeholder="DIRECCION" type="text">
                                                        </div>
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Celular</label>
                                                            <input ng-model="usuario.empleado.persona.celular" name="celular" class="form-control" placeholder="CELULAR" type="number">
                                                        </div>
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>E-mail</label>
                                                            <input ng-model="usuario.empleado.persona.email" name="email" class="form-control" placeholder="EMAIL" type="text">
                                                        </div>
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Ruc</label>
                                                            <input ng-model="usuario.empleado.persona.ruc" name="ruc" class="form-control" placeholder="RUC" type="number">
                                                        </div>
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Estado civil</label>
                                                            <select ng-options="estadocivil as estadocivil.denominacion for estadocivil in estadocivils track by estadocivil.id" ng-model="usuario.empleado.persona.estadocivil" name="estadocivil" class="form-control">
                                                            </select>
                                                        </div>
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Fecha nacimiento</label>
                                                            <input ng-model="usuario.empleado.persona.fechaNacimiento" name="fechaNacimiento" class="form-control" id="datepicker1">
                                                        </div>
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Genero</label>
                                                            <select ng-options="genero as genero.denominacion for genero in generos track by genero.id" ng-model="usuario.empleado.persona.genero" name="genero" class="form-control">
                                                            </select>
                                                        </div>
                                                    </fieldset>
                                                    <fieldset style="margin-top: 15px">
                                                        <legend style="font-size: 13px; font-weight: bold">DATOS DE EMPLEADO</legend>
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Agencia</label>
                                                            <select ng-options="agencia as agencia.nombre for agencia in agencias track by agencia.id" ng-model="usuario.empleado.agencia" name="agencia" class="form-control">
                                                            </select>
                                                        </div>
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Cargo</label>
                                                            <select ng-options="tipoempleado as tipoempleado.nombre for tipoempleado in tipoempleados track by tipoempleado.id" ng-model="usuario.empleado.tipoempleado" name="tipoempleado" class="form-control">
                                                            </select>
                                                        </div>
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Fecha inicio</label>
                                                            <input ng-model="usuario.empleado.fechaInicio" name="fechaInicio" class="form-control" id="datepicker2" placeholder="FECHA INICIO">
                                                        </div>
                                                        <div class="col-ss-12 col-xs-12 col-sm-12">
                                                            <label>Permisos</label>
                                                            <div class="checkbox" id="permisos">
                                                                <div class="row">
                                                                    <div class="col-ss-12 col-xs-4 col-sm-3 col-md-3 col-lg-3" ng-repeat="rol in roles">
                                                                        <label class="checkbox-inline">
                                                                            <input type="checkbox" value="{{rol}}">{{rol.denominacion}}
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                    <fieldset style="margin-top: 15px">
                                                        <legend style="font-size: 13px; font-weight: bold">DATOS DE CUENTA</legend>
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Usuario</label>
                                                            <input ng-model="usuario.usuario" name="usuario" class="form-control" placeholder="usuario" type="text">
                                                        </div>
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Contraseña</label>
                                                            <input name="contrasena1" class="form-control" placeholder="CONTRASEÑA" type="password">
                                                        </div>
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Confirmacion contraseña</label>
                                                            <input ng-model="usuario.contrasena" name="contrasena" class="form-control" placeholder="CONFIRMACION CONTRASEÑA" type="password">
                                                        </div>
                                                        <div class="col-ss-12 col-xs-12" style="padding-top: 5px">
                                                            <button ng-show="usuario.id > 0" type="submit" class="btn btn-primary" disabled="">Crear</button>
                                                            <button ng-show="usuario.id <= 0" type="submit" class="btn btn-primary">Crear</button>
                                                        </div>
                                                    </fieldset>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12 col-sm-12 col-xs-12 col-ss-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <div class="profile_title">
                                            <div class="col-ss-12 col-xs-4">
                                                <h2>Cuentas de usuarios de sistemas</h2>
                                            </div>
                                            <div class="col-ss-12 col-xs-8">
                                                <div id="reportrange" class="pull-right" style="margin-top: 5px; background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #E6E9ED">
                                                    <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                                                    <span style="color: #73879C">{{fecha}}</span><b class="caret"></b>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <table class="table table-striped jambo_table">
                                            <thead>
                                                <tr class="headings">
                                                    <th>N°</th>
                                                    <th>Nombre</th>
                                                    <th>Apellidos</th>
                                                    <th>Dni</th>
                                                    <th>Email</th>
                                                    <th>Cargo</th>
                                                    <th>Fecha inicio</th>
                                                    <th>Usuario</th>
                                                    <th>Accion</th>
                                                    <th>Accion</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr ng-repeat="usuario in usuarios">
                                                    <td>{{usuario.id}}</td>
                                                    <td>{{usuario.empleado.persona.nombre}}</td>
                                                    <td>{{usuario.empleado.persona.apellidoPat}} {{usuario.empleado.persona.apellidoMat}}</td>
                                                    <td>{{usuario.empleado.persona.dni}}</td>
                                                    <td>{{usuario.empleado.persona.email}}</td>
                                                    <td>{{usuario.empleado.tipoempleado.nombre}}</td>
                                                    <td>{{usuario.empleado.fechaInicio}}</td>
                                                    <td>{{usuario.usuario}}</td>
                                                    <td class=" last">
                                                        <a href="javascript:void(0)" ng-click="actualizarUsuario(usuario)" style="padding-right: 5px" data-toggle="modal" data-target="#myModal">
                                                            <i class="fa fa-pencil"></i> Edit
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <a href="javascript:void(0)" ng-click="eliminarUsuario(usuario)" style="color: red">
                                                            <i class="fa fa-trash"></i> Eliminar
                                                        </a>
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
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form name="formulario2" ng-submit="modificarusuario(formulario2)" ng-validate="validateusuarioa">
                        <div class="modal-header" style="color: #449ACA; text-align: center">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Detalle de Usuario</h4>
                        </div>
                        <div class="modal-body">
                            <fieldset style="margin-top: 0px">
                                <legend style="font-size: 13px; font-weight: bold">DATOS PERSONALES</legend>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6">
                                    <label>Dni</label>
                                    <input ng-model="usuarioa.empleado.persona.dni" name="dni" class="form-control" placeholder="DNI" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6">
                                    <label>Nombre</label>
                                    <input ng-model="usuarioa.empleado.persona.nombre" name="nombre" class="form-control" placeholder="NOMBRE" type="text">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6">
                                    <label>Apellido Paterno</label>
                                    <input ng-model="usuarioa.empleado.persona.apellidoPat" name="apellidoPat" class="form-control" placeholder="APELLIDO PATERNO" type="text">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6  ">
                                    <label>Apellido Materno</label>
                                    <input ng-model="usuarioa.empleado.persona.apellidoMat" name="apellidoMat" class="form-control" placeholder="APELLIDO MATERNO" type="text">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6 ">
                                    <label>Direccion</label>
                                    <input ng-model="usuarioa.empleado.persona.direccion" name="direccion" class="form-control" placeholder="DIRECCION" type="text">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6  ">
                                    <label>Celular</label>
                                    <input ng-model="usuarioa.empleado.persona.celular" name="celular" class="form-control" placeholder="CELULAR" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6  ">
                                    <label>E-mail</label>
                                    <input ng-model="usuarioa.empleado.persona.email" name="email" class="form-control" placeholder="E-MAIL" type="text">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6  ">
                                    <label>Ruc</label>
                                    <input ng-model="usuarioa.empleado.persona.ruc" name="ruc" class="form-control" placeholder="RUC" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6  ">
                                    <label>Estado civil</label>
                                    <select ng-options="estadocivil as estadocivil.denominacion for estadocivil in estadocivils track by estadocivil.id" ng-model="usuarioa.empleado.persona.estadocivil" name="estadocivil" class="form-control">
                                    </select>
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6  ">
                                    <label>Fecha nacimiento</label>
                                    <input ng-model="usuarioa.empleado.persona.fechaNacimiento" name="fechaNacimiento" id="datepicker3" class="form-control" placeholder="FECHA NACIMIENTO">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6  ">
                                    <label>Sexo</label>
                                    <select ng-options="genero as genero.denominacion for genero in generos track by genero.id" ng-model="usuarioa.empleado.persona.genero" name="genero" class="form-control">
                                    </select>
                                </div>
                            </fieldset>
                            <fieldset style="margin-top: 15px">
                                <legend style="font-size: 13px; font-weight: bold">DATOS DE COLABORADOR</legend>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6">
                                    <label>Agencia</label>
                                    <select ng-options="agencia as agencia.nombre for agencia in agencias track by agencia.id" ng-model="usuarioa.empleado.agencia" name="agencia" class="form-control">
                                    </select>
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6">
                                    <label>Cargo</label>
                                    <select ng-options="tipoempleado as tipoempleado.nombre for tipoempleado in tipoempleados track by tipoempleado.id" ng-model="usuarioa.empleado.tipoempleado" name="tipoempleado" class="form-control">
                                    </select>
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6">
                                    <label>FechaInicio</label>
                                    <input ng-model="usuarioa.empleado.fechaInicio" name="fechaInicio" class="form-control" id="datepicker4" placeholder="FECHA INICIO">
                                </div>
                                <div class="col-ss-12 col-xs-12 col-sm-12 col-md-12">
                                    <label>Permisos</label>
                                    <div class="checkbox" id="permisos2">
                                        <div class="row">
                                            <div class="col-ss-12 col-xs-4 col-sm-3 col-md-3 col-lg-3" ng-repeat="rol in roles">
                                                <label class="checkbox-inline">
                                                    <input type="checkbox" value="{{rol}}">{{rol.denominacion}}
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6">
                                    <label>Estado</label>
                                    <select ng-options="estado as estado.nombre for estado in estados track by estado.id" ng-model="usuarioa.estado" name="estado" class="form-control">
                                    </select>
                                </div>
                            </fieldset>
                            <fieldset style="margin-top: 15px">
                                <legend style="font-size: 13px; font-weight: bold">DATOS DE CUENTA</legend>
                                <div class="col-ss-12 col-xs-6 col-sm-4 col-md-4   ">
                                    <label>Usuario</label>
                                    <input ng-model="usuarioa.usuario" name="usuario" class="form-control" placeholder="USUARIO" type="text">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-4 col-md-4   ">
                                    <label>Contraseña</label>
                                    <input name="contrasena1" class="form-control" placeholder="CONTRASEÑA" type="password">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-4 col-md-4   ">
                                    <label>Confirmacion contraseña</label>
                                    <input ng-model="usuarioa.contrasena" name="contrasena" class="form-control" placeholder="REPETIR CONTRASEÑA" type="password">
                                </div>
                            </fieldset>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Actualizar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-2.1.4.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap-3.3.6.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/progressbar/bootstrap-progressbar.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/nicescroll/jquery.nicescroll.min.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/admin/custom.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.core.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.buttons.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.nonblock.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery.validate.min.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-ui-1.11.4.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/angular/angular.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-validate.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/controller/usuarioModule.js" type="text/javascript"></script>

        <script type="text/javascript">
                                                $(document).ready(function () {
                                                    $("#datepicker1").datepicker({dateFormat: 'yy-mm-dd'});
                                                    $("#datepicker2").datepicker({dateFormat: 'yy-mm-dd', minDate: 0});
                                                    $("#datepicker3").datepicker({dateFormat: 'yy-mm-dd'});
                                                    $("#datepicker4").datepicker({dateFormat: 'yy-mm-dd'});
                                                });

                                                function mostrarhora() {


                                                    

                                                    $("#fecha").html(fecha);

                                                    setTimeout(mostrarhora(), 1000);
                                                };
        </script>

        <!--<script type="text/javascript">

                    Reloj();

                    function Reloj() {
                        var meses = new Array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");
                        var dias = new Array("Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado");

                        var tiempo = new Date();
                        
                        var fecha = dias[tiempo.getDay()] + ' ' + tiempo.getDate() + ' ' + meses[tiempo.getMonth()] + ' ' + tiempo.getFullYear() + ' (' + tiempo.getHours() + ':' + tiempo.getMinutes() + ':' + tiempo.getSeconds() + ') Horas';

                        document.getElementById('fecha').innerHTML = fecha;

                        setTimeout('Reloj()', 1000);
                    };

        </script>-->

    </body>
</html>
