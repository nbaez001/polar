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
        <title>Agregar cliente</title>
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
                                <h4>Registro de clientes (persona natural) </h4>
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
                                        <h2>Crear nuevo cliente  <i class="fa fa-book"></i></h2>
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
                                                        <label id="labelDni">Dni (*)</label>
                                                        <input name="dni" class="form-control" placeholder="DNI" autofocus="" onkeyup="$.validarPersona($(this).val())" type="number">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Nombre (*)</label>
                                                        <input name="nombre" class="form-control" placeholder="NOMBRE" type="text">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Apellido paterno (*)</label>
                                                        <input name="apellidoPat" class="form-control" placeholder="APELLIDO PATERNO" type="text">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Apellido materno (*)</label>
                                                        <input name="apellidoMat" class="form-control" placeholder="APELLIDO MATERNO" type="text">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Celular (*)</label>
                                                        <input name="celular" class="form-control" placeholder="CELULAR" type="number">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Direccion (*)</label>
                                                        <input name="direccion" class="form-control" placeholder="DIRECCION" type="text">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Pais</label>
                                                        <select name="pais" class="form-control" onchange="$.cargarDepartamento()">
                                                            <c:forEach var="item" items="${listaPais}">
                                                                <option value="${item.id}">${item.nombre}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label id="labelDepartamento">Departamento</label>
                                                        <select name="departamento" class="form-control" onchange="$.restaurarLabel()">
                                                        </select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label id="labelProvincia">Provincia</label>
                                                        <select name="provincia" class="form-control" onmouseover="$.cargarProvincia()" onchange="$.restaurarLabel()">
                                                        </select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label id="labelDistrito">Distrito</label>
                                                        <select name="distrito" class="form-control" onmouseover="$.cargarDistrito()">
                                                        </select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Email</label>
                                                        <input name="email" class="form-control" type="email" placeholder="EMAIL">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Ruc</label>
                                                        <input name="ruc" class="form-control" type="number" placeholder="RUC">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Estado civil</label>
                                                        <select name="estadocivil" class="form-control">
                                                            <c:forEach var="item" items="${listaEstadocivil}">
                                                                <option value="${item.id}">${item.denominacion}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Fecha nacimiento</label>
                                                        <input id="datepicker1" name="fechaNacimiento" class="form-control" placeholder="YYYY-MM-DD">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Sexo</label>
                                                        <select name="genero" class="form-control">
                                                            <c:forEach var="item" items="${listaGenero}">
                                                                <option value="${item.id}">${item.denominacion}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Recibo</label>
                                                        <select name="recibo" class="form-control">
                                                            <option value="AGUA">AGUA</option>
                                                            <option value="LUZ">LUZ</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Nacionalidad</label>
                                                        <select name="nacionalidad" class="form-control">
                                                            <c:forEach var="item" items="${listaPais}">
                                                                <option value="${item.id}">${item.nombre}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Ocupacion</label>
                                                        <input name="profesion" class="form-control" placeholder="PROFESION U OCUPACION" type="text">
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="row" style="padding-top: 10px">
                                                <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                                    <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                        <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Conyugue</a>
                                                        </li>
                                                    </ul>
                                                    <div id="myTabContent" class="tab-content">
                                                        <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                                                            <div class="panel panel-default">
                                                                <div class="panel-body">
                                                                    <fieldset>
                                                                        <legend style="font-family: Cambria">Registro de conyugue</legend>
                                                                        <div class="row">
                                                                            <form id="formulario2">
                                                                                <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                    <label>Dni (*)</label>
                                                                                    <input name="dni" class="form-control" placeholder="DNI" type="number">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                    <label>Nombre (*)</label>
                                                                                    <input name="nombre" class="form-control" placeholder="NOMBRE" type="text">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                    <label>Apellido paterno (*)</label>
                                                                                    <input name="apellidoPat" class="form-control" placeholder="APELLIDO PATERNO" type="text">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                    <label>Apellido materno (*)</label>
                                                                                    <input name="apellidoMat" class="form-control" placeholder="APELLIDO MATERNO" type="text">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                    <label>Numero de hijos</label>
                                                                                    <input name="numeroHijos" class="form-control" placeholder="NUMERO DE HIJOS" type="number">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                    <label>Numero de dependientes</label>
                                                                                    <input name="numeroDependientes" class="form-control" placeholder="NUMERO DE DEPENDIENTES" type="number">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                    <label>Ocupacion</label>
                                                                                    <input name="profesion" class="form-control" placeholder="PROFESION U OCUPACION" type="text">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-12" style="padding-top: 10px">
                                                                                    <input type="submit" value="Agregar" class="btn btn-success btn-xs">
                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                        <legend style="font-family: Cambria">Lista conyugue</legend>
                                                                        <div class="row">
                                                                            <table id="tablaConyugue" class="table table-striped">
                                                                                <thead>
                                                                                    <tr class="headings">
                                                                                        <th>N° </th>
                                                                                        <th>Dni </th>
                                                                                        <th>Nombre </th>
                                                                                        <th>Apellido </th>
                                                                                        <th>Profesion </th>
                                                                                        <th>Hijos </th>
                                                                                        <th class=" no-link last"><span class="nobr">Accion</span>
                                                                                        </th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    <tr class="odd">
                                                                                        <td valign="top" colspan="8" class="dataTables_empty">Ningun registro de conyugue</td>
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
                                        <div class="col-ss-12 col-xs-12" style="padding-top: 10px">
                                            <button id="registrar" class="btn btn-primary" onclick="$.registrarPersona()">Registrar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12 col-sm-12 col-xs-12 col-ss-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Registro de clientes <small>Persona natural</small></h2>
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
                                                    <th>Codigo </th>
                                                    <th>Nombre </th>
                                                    <th>Apellidos </th>
                                                    <th>Dni </th>
                                                    <th>Direccion </th>
                                                    <th>Celular </th>
                                                    <th>Fec. Incripcion </th>
                                                    <th>Accion</th>
                                                    <th>Accion</th>
                                                    <th class=" no-link last"><span class="nobr">Reporte</span>
                                                    </th>
                                                </tr>
                                            </thead>

                                            <tbody id="tablaPersonanatural">
                                                <c:forEach var="item" items="${listaPersonanatural}">
                                                    <tr id="${item.id}">
                                                        <td>${item.cliente.codigo}</td>
                                                        <td>${item.persona.nombre}</td>
                                                        <td>${item.persona.apellidoPat} ${item.persona.apellidoMat}</td>
                                                        <td>${item.persona.dni}</td>
                                                        <td>${item.persona.direccion}</td>
                                                        <td>${item.persona.celular}</td>
                                                        <td>${item.cliente.fechaInscripcion}</td>
                                                        <td>
                                                            <a href="javascript:void(0)" onclick="$.modificarClientenatural(${item.id})" data-toggle="modal" data-target="#myModal" style="padding-right: 5px">
                                                                <i class="fa fa-pencil"></i> Edit
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="javascript:void(0)" onclick="$.quitarClientenatural(${item.id})" style="color: red">
                                                                <i class="fa fa-close"></i> Eliminar
                                                            </a>
                                                        </td>
                                                        <td class=" last">
                                                            <c:choose>
                                                                <c:when test="${item.persona.conyugue eq null}">
                                                                    <a target="_blank" href="${pageContext.request.contextPath}/reporte/reporteclientenatural?type=pdf&&conyugue=N&&id=${item.cliente.id}"><i class="fa fa-file-pdf-o fa-2x"></i> Ficha cliente</a>
                                                                </c:when>  
                                                                <c:otherwise>
                                                                    <a target="_blank" href="${pageContext.request.contextPath}/reporte/reporteclientenatural?type=pdf&&conyugue=S&&id=${item.cliente.id}"><i class="fa fa-file-pdf-o fa-2x"></i> Ficha cliente</a>
                                                                </c:otherwise>
                                                            </c:choose>
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
                    <form id="formulario3">
                        <div class="modal-header" style="color: #449ACA; text-align: center">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Detalle de Usuario</h4>
                        </div>
                        <div id="bodyModal" class="modal-body">
                            <fieldset style="margin-top: 0px">
                                <legend style="font-family: Cambria; font-size: 9px">DATOS PERSONALES</legend>
                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                    <label>Dni</label>
                                    <input name="id" type="number" hidden="">
                                    <input name="dni" class="form-control" placeholder="DNI" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                    <label>Nombre</label>
                                    <input name="nombre" class="form-control" placeholder="NOMBRE" type="text">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                    <label>Apellido Paterno</label>
                                    <input name="apellidoPat" class="form-control" placeholder="APELLIDO PATERNO" type="text">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                    <label>Apellido Materno</label>
                                    <input name="apellidoMat" class="form-control" placeholder="APELLIDO MATERNO" type="text">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                    <label>Direccion</label>
                                    <input name="direccion" class="form-control" placeholder="DIRECCION" type="text">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                    <label>Celular</label>
                                    <input name="celular" class="form-control" placeholder="CELULAR" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                    <label>Pais</label>
                                    <select name="pais" class="form-control" onchange="$.cargarDepartamento2()">
                                        <c:forEach var="item" items="${listaPais}">
                                            <option value="${item.id}">${item.nombre}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                    <label id="labelDepartamento2">Departamento</label>
                                    <select name="departamento" class="form-control" onchange="$.restaurarLabel2()">
                                    </select>
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                    <label id="labelProvincia2">Provincia</label>
                                    <select name="provincia" class="form-control" onmouseover="$.cargarProvincia2()" onchange="$.restaurarLabel2()">
                                    </select>
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                    <label id="labelDistrito2">Distrito</label>
                                    <select name="distrito" class="form-control" onmouseover="$.cargarDistrito2()">
                                    </select>
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                    <label>E-mail</label>
                                    <input name="email" class="form-control" placeholder="E-MAIL" type="text">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                    <label>Ruc</label>
                                    <input name="ruc" class="form-control" placeholder="RUC" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                    <label>Estado civil</label>
                                    <select name="estadocivil" class="form-control">
                                        <c:forEach var="item" items="${listaEstadocivil}">
                                            <option value="${item.id}">${item.denominacion}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                    <label>Fecha nacimiento</label>
                                    <input name="fechaNacimiento" id="datepicker2" class="form-control" placeholder="FECHA NACIMIENTO">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                    <label>Sexo</label>
                                    <select name="genero" class="form-control">
                                        <c:forEach var="item" items="${listaGenero}">
                                            <option value="${item.id}">${item.denominacion}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                    <label>Nacionalidad</label>
                                    <select name="nacionalidad" class="form-control">
                                        <c:forEach var="item" items="${listaPais}">
                                            <option value="${item.id}">${item.nombre}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                    <label>Ocupacion</label>
                                    <input name="profesion" class="form-control" placeholder="OCUPACION" type="text">
                                </div>
                            </fieldset>
                            <fieldset>
                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                    <label>
                                        <input type="checkbox" name="conyugue" onclick="$.showConyuguefield()"> ¿Agregar conyugue?
                                    </label>
                                </div>
                            </fieldset>
                            <fieldset style="margin-top: 15px" id="conyugueField" hidden="">
                                <legend style="font-family: Cambria; font-size: 9px">DATOS DE CONYUGUE</legend>
                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                    <label>Dni</label>
                                    <input name="dnic" class="form-control" placeholder="DNI" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                    <label>Nombre</label>
                                    <input name="nombrec" class="form-control" placeholder="NOMBRE" type="text">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                    <label>Apellido paterno</label>
                                    <input name="apellidoPatc" class="form-control" placeholder="APELLIDO PATERNO" type="text">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                    <label>Apellido materno</label>
                                    <input name="apellidoMatc" class="form-control" placeholder="APELLIDO MATERNO" type="text">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                    <label>Numero hijos</label>
                                    <input name="numeroHijosc" class="form-control" placeholder="NUMERO HIJOS" value="0" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                    <label>Numero dependientes</label>
                                    <input name="numeroDependientesc" class="form-control" placeholder="NUMERO HIJOS" value="0" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                    <label>Ocupación</label>
                                    <input name="profesionc" class="form-control" placeholder="OCUPACION" type="text">
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

        <script src="${pageContext.request.contextPath}/assets/js/nicescroll/jquery.nicescroll.min.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/admin/custom.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.core.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.buttons.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.nonblock.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery.validate.min.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-ui-1.11.4.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/datatables/jquery.dataTables.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/icheck/icheck.min.js" type="text/javascript"></script>

        <script type="text/javascript">
                                            var asInitVals = new Array();
                                            $(document).ready(function () {
                                                var oTable = $('#example').dataTable({
                                                    "oLanguage": {"sSearch": "Buscar en todas las columnas:"
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
                $("#formulario input[name=apellidoPat]").val("");
                $("#formulario input[name=apellidoMat]").val("");
                $("#formulario input[name=dni]").val("");
                $("#formulario input[name=ruc]").val("");
                $("#formulario input[name=direccion]").val("");
                $("#formulario input[name=celular]").val("");
                $("#formulario input[name=email]").val("");
                $("#formulario input[name=fechaNacimiento]").val("");
                $("#formulario input[name=profesion]").val("");

                $("#tablaConyugue tbody").html('<tr><td valign="top" colspan="8" class="dataTables_empty">Ningun registro de conyugue</td></tr>');
            };

            $.limpiarControles2 = function () {
                $("#formulario3 input[name=nombre]").val("");
                $("#formulario3 input[name=apellidoPat]").val("");
                $("#formulario3 input[name=apellidoMat]").val("");
                $("#formulario3 input[name=dni]").val("");
                $("#formulario3 input[name=ruc]").val("");
                $("#formulario3 input[name=direccion]").val("");
                $("#formulario3 input[name=celular]").val("");
                $("#formulario3 input[name=email]").val("");
                $("#formulario3 input[name=fechaNacimiento]").val("");

                $("#formulario3 input[name=dnic]").val("");
                $("#formulario3 input[name=nombrec]").val("");
                $("#formulario3 input[name=apellidoPatc]").val("");
                $("#formulario3 input[name=apellidoMatc]").val("");
                $("#formulario3 input[name=numeroHijosc]").val("");
                $("#formulario3 input[name=numeroDependientesc]").val("");
                $("#formulario3 input[name=profesionc]").val("");
            };

            $.estaVacio = function (nombre) {
                if ($(nombre).val().length < 1) {
                    return true;
                }
                else {
                    return false;
                }
            };

            $.quitarClientenatural = function (id) {
                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/admision/quitarclientenatural',
                    data: {id: id},
                    dataType: "json",
                    success: function (data) {
                        if (data === 0) {
                            $.notificar("Notificacion", "error", "Error al eliminar el cliente natural (esto puede ser debido a que tiene cuentas a su nombre) ");
                        }
                        else {
                            $.notificar("Notificacion", "success", "El cliente natural se elimino correctamente");
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
                        apellidoPat: {
                            required: true
                        },
                        apellidoMat: {
                            required: true
                        },
                        dni: {
                            required: true,
                            minlength: 8,
                            maxlength: 8
                        },
                        direccion: {
                            required: true
                        },
                        celular: {required: true,
                            minlength: 9,
                            maxlength: 11
                        }
                    },
                    messages: {
                        nombre: {
                            required: "Campo obligatorio"
                        },
                        apellidoPat: {
                            required: "Campo obligatorio"
                        },
                        apellidoMat: {
                            required: "Campo obligatorio"
                        },
                        dni: {
                            required: "Campo obligatorio",
                            minlength: "Este campo debe contener al menos {0} caracteres",
                            maxlength: "Este campo no debe debe sobrepasar los {0} caracteres"},
                        direccion: {
                            required: "Campo obligatorio"
                        },
                        celular: {
                            required: "Campo obligatorio",
                            minlength: "Este campo debe contener al menos {0} caracteres",
                            maxlength: "Este campo no debe debe sobrepasar los {0} caracteres"
                        }
                    },
                    submitHandler: function () {
                        var genero = {
                            id: $("#formulario select[name=genero] option:selected").val()
                        };

                        var estadocivil = {
                            id: $("#formulario select[name=estadocivil] option:selected").val()
                        };

                        var persona = {
                            dni: $("#formulario input[name=dni]").val(),
                            nombre: $("#formulario input[name=nombre]").val(),
                            apellidoPat: $("#formulario input[name=apellidoPat]").val(),
                            apellidoMat: $("#formulario input[name=apellidoMat]").val(),
                            direccion: $("#formulario input[name=direccion]").val(),
                            pais: $("#formulario select[name=pais] option:selected").text(),
                            departamento: $("#formulario select[name=departamento] option:selected").text(),
                            provincia: $("#formulario select[name=provincia] option:selected").text(),
                            distrito: $("#formulario select[name=distrito] option:selected").text(),
                            celular: $("#formulario input[name=celular]").val(),
                            email: $("#formulario input[name=email]").val(),
                            ruc: $("#formulario input[name=ruc]").val(),
                            estadocivil: estadocivil,
                            fechaNacimiento: $("#formulario input[name=fechaNacimiento]").val(),
                            genero: genero,
                            nacionalidad: $("#formulario select[name=nacionalidad] option:selected").text(),
                            profesion: $("#formulario input[name=profesion]").val()
                        };
                        var personanatural = {
                            recibo: $("#formulario select[name=recibo] option:selected").text(),
                            estado: true
                        };
                        var cliente = {
                            estado: true
                        };
                        var data = {
                            persona: persona,
                            personanatural: personanatural,
                            cliente: cliente
                        };

                        $.ajax({
                            type: "POST",
                            url: "${pageContext.request.contextPath}/admision",
                            contentType: "application/json",
                            data: JSON.stringify(data),
                            dataType: "json",
                            success: function (data) {
                                if (data !== 0) {
                                    if (data !== 2) {
                                        if (data !== 3) {
                                            $.notificar("Notificacion", "success", "Los datos se han regitrado correctamente");
                                            $("#labelDni").html('Dni');
                                            $.limpiarControles();
                                            $("#tablaPersonanatural").prepend('<tr id="' + data.id + '">' +
                                                    '<td>' + data.clienteCodigo + '</td>' +
                                                    '<td>' + data.personaNombre + '</td>' +
                                                    '<td>' + data.personaApellidoPat + ' ' + data.personaApellidoMat + '</td>' +
                                                    '<td>' + data.personaDni + '</td>' +
                                                    '<td>' + data.personaDireccion + '</td>' +
                                                    '<td>' + data.personaCelular + '</td>' +
                                                    '<td>' + data.clienteFechaInscripcion + '</td>' +
                                                    '<td>' +
                                                    '<a href="javascript:void(0)" onclick="$.modificarClientenatural(' + data.id + ')" data-toggle="modal" data-target="#myModal" style="padding-right: 5px">' +
                                                    '<i class="fa fa-pencil"></i> Edit' +
                                                    '</a>' +
                                                    '</td>' +
                                                    '<td>' +
                                                    '<a href="javascript:void(0)" onclick="$.quitarClientenatural(' + data.id + ')" style="color: red">' +
                                                    '<i class="fa fa-close"></i> Eliminar' +
                                                    '</a>' +
                                                    '</td>' +
                                                    '<td class=" last">' +
                                                    '<a target="_blank" href="${pageContext.request.contextPath}/reporte/reporteclientenatural?type=pdf&&conyugue=' + data.personaConyugue + '&&id=' + data.idCliente + '"><i class="fa fa-file-pdf-o fa-2x"></i> Ficha cliente</a>' +
                                                    '</td>' +
                                                    '</tr>');
                                        }
                                        else {
                                            $.notificar("Notificacion", "warning", "Error, solo esta permitido registrar un conyugue");
                                        }
                                    }
                                    else {
                                        $.notificar("Notificacion", "error", "Error, la persona con el dni que quiere registrar ya existe");
                                    }
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
                $("#formulario2").validate({
                    rules: {
                        nombre: {
                            required: true
                        },
                        apellidoPat: {
                            required: true
                        },
                        apellidoMat: {
                            required: true
                        },
                        dni: {
                            required: true,
                            minlength: 8,
                            maxlength: 8
                        }
                    },
                    messages: {
                        nombre: {
                            required: "Campo obligatorio"
                        },
                        apellidoPat: {
                            required: "Campo obligatorio"
                        },
                        apellidoMat: {
                            required: "Campo obligatorio"
                        },
                        dni: {
                            required: "Campo obligatorio",
                            minlength: "Este campo debe contener al menos {0} caracteres",
                            maxlength: "Este campo no debe debe sobrepasar los {0} caracteres"
                        }
                    },
                    submitHandler: function () {
                        var conyugue = {
                            dni: $("#formulario2 input[name=dni]").val(),
                            nombre: $("#formulario2 input[name=nombre]").val(),
                            apellidoPat: $("#formulario2 input[name=apellidoPat]").val(),
                            apellidoMat: $("#formulario2 input[name=apellidoMat]").val(),
                            numeroHijos: $("#formulario2 input[name=numeroHijos]").val(),
                            numeroDependientes: $("#formulario2 input[name=numeroDependientes]").val(),
                            profesion: $("#formulario2 input[name=profesion]").val()
                        };
                        $.ajax({
                            type: "POST",
                            url: "${pageContext.request.contextPath}/admision/agregarconyugue",
                            contentType: "application/json",
                            data: JSON.stringify(conyugue),
                            dataType: "json",
                            success: function (data) {
                                var added = '';
                                if (data.length !== 0) {
                                    $.each(data, function (i, value) {
                                        var json = JSON.parse(value);
                                        added += '<tr>' +
                                                '<td>' + (i + 1) + '</td>' +
                                                '<td>' + json.dni + '</td>' +
                                                '<td>' + json.nombre + '</td>' +
                                                '<td>' + json.apellidoPat + '</td>' +
                                                '<td>' + json.profesion + '</td>' +
                                                '<td>' + json.numeroHijos + '</td>' +
                                                '<td class="last">' +
                                                '<a href="javascript:void(0)" onclick="$.quitarConyugue(' + json.dni + ')" style="color: red">' +
                                                '<i class="fa fa-close"></i> Eliminar' +
                                                '</a>' +
                                                '</td>' +
                                                '</tr>';
                                    });
                                    $("#tablaConyugue tbody").html(added);
                                    $("#formulario2 input[name=dni]").val("");
                                    $("#formulario2 input[name=nombre]").val("");
                                    $("#formulario2 input[name=apellidoPat]").val("");
                                    $("#formulario2 input[name=apellidoMat]").val("");
                                    $("#formulario2 input[name=profesion]").val("");
                                    $("#formulario2 input[name=numeroHijos]").val("");
                                    $("#formulario2 input[name=numeroDependientes]").val("");
                                }
                                else {
                                    $.notificar("Notificacion", "error", "Error, no puede registrar 2 personas con el dni iguales");
                                }
                            },
                            error: function (xhr, status, error) {
                                $.notificar("Notificacion", "error", "Error: " + error);
                            }
                        });
                    }
                });
                $("#formulario3").validate({
                    rules: {
                        nombre: {
                            required: true
                        },
                        apellidoPat: {
                            required: true
                        },
                        apellidoMat: {
                            required: true
                        },
                        dni: {
                            required: true,
                            minlength: 8,
                            maxlength: 8
                        },
                        direccion: {
                            required: true
                        },
                        celular: {required: true,
                            minlength: 9,
                            maxlength: 11
                        }
                    },
                    messages: {
                        nombre: {
                            required: "Campo obligatorio"
                        },
                        apellidoPat: {
                            required: "Campo obligatorio"
                        },
                        apellidoMat: {
                            required: "Campo obligatorio"
                        },
                        dni: {
                            required: "Campo obligatorio",
                            minlength: "Este campo debe contener al menos {0} caracteres",
                            maxlength: "Este campo no debe debe sobrepasar los {0} caracteres"},
                        direccion: {
                            required: "Campo obligatorio"
                        },
                        celular: {
                            required: "Campo obligatorio",
                            minlength: "Este campo debe contener al menos {0} caracteres",
                            maxlength: "Este campo no debe debe sobrepasar los {0} caracteres"
                        }
                    },
                    submitHandler: function () {
                        var id = $("#formulario3 input[name=id]").val();
                        var conyugue;

                        if ($("#formulario3 input[name=conyugue]").prop('checked')) {
                            conyugue = {
                                dni: $("#formulario3 input[name=dnic]").val(),
                                nombre: $("#formulario3 input[name=nombrec]").val(),
                                apellidoPat: $("#formulario3 input[name=apellidoPatc]").val(),
                                apellidoMat: $("#formulario3 input[name=apellidoMatc]").val(),
                                numeroHijos: $("#formulario3 input[name=numeroHijosc]").val(),
                                numeroDependientes: $("#formulario3 input[name=numeroDependientesc]").val(),
                                profesion: $("#formulario3 input[name=profesionc]").val()
                            };
                        }
                        else {
                            conyugue = null;
                        }

                        var genero = {
                            id: $("#formulario3 select[name=genero] option:selected").val()
                        };

                        var estadocivil = {
                            id: $("#formulario3 select[name=estadocivil] option:selected").val()
                        };

                        var persona = {
                            conyugue: conyugue,
                            dni: $("#formulario3 input[name=dni]").val(),
                            nombre: $("#formulario3 input[name=nombre]").val(),
                            apellidoPat: $("#formulario3 input[name=apellidoPat]").val(),
                            apellidoMat: $("#formulario3 input[name=apellidoMat]").val(),
                            direccion: $("#formulario3 input[name=direccion]").val(),
                            pais: $("#formulario3 select[name=pais] option:selected").text(),
                            departamento: $("#formulario3 select[name=departamento] option:selected").text(),
                            provincia: $("#formulario3 select[name=provincia] option:selected").text(),
                            distrito: $("#formulario3 select[name=distrito] option:selected").text(),
                            celular: parseInt($("#formulario3 input[name=celular]").val()),
                            email: $("#formulario3 input[name=email]").val(),
                            ruc: parseInt($("#formulario3 input[name=ruc]").val()),
                            estadocivil: estadocivil,
                            fechaNacimiento: $("#formulario3 input[name=fechaNacimiento]").val(),
                            genero: genero,
                            nacionalidad: $("#formulario3 select[name=nacionalidad] option:selected").text(),
                            profesion: $("#formulario3 input[name=profesion]").val()};

                        var personanatural = {
                            id: id,
                            recibo: $("#formulario3 select[name=recibo] option:selected").text(),
                            persona: persona,
                            estado: true
                        };

                        $.ajax({
                            type: "POST",
                            url: "${pageContext.request.contextPath}/admision/modificarclientenatural",
                            contentType: "application/json",
                            data: JSON.stringify(personanatural),
                            dataType: "json",
                            success: function (data) {
                                if (data !== 0) {
                                    if (data !== 2) {
                                        $("#" + id).remove();
                                        $("#myModal").modal('hide');
                                        $.notificar("Notificacion", "success", "Los datos se han actualizado correctamente");
                                        $("#labelDni").html('Dni');
                                        $.limpiarControles();
                                        $("#tablaPersonanatural").prepend('<tr id="' + data.id + '">' +
                                                '<td>' + data.clienteCodigo + '</td>' +
                                                '<td>' + data.personaNombre + '</td>' +
                                                '<td>' + data.personaApellidoPat + ' ' + data.personaApellidoMat + '</td>' +
                                                '<td>' + data.personaDni + '</td>' +
                                                '<td>' + data.personaDireccion + '</td>' +
                                                '<td>' + data.personaCelular + '</td>' +
                                                '<td>' + data.clienteFechaInscripcion + '</td>' +
                                                '<td>' +
                                                '<a href="javascript:void(0)" onclick="$.modificarClientenatural(' + data.id + ')" data-toggle="modal" data-target="#myModal" style="padding-right: 5px">' +
                                                '<i class="fa fa-pencil"></i> Edit' +
                                                '</a>' +
                                                '</td>' +
                                                '<td>' +
                                                '<a href="javascript:void(0)" onclick="$.quitarClientenatural(' + data.id + ')" style="color: red">' +
                                                '<i class="fa fa-close"></i> Eliminar' +
                                                '</a>' +
                                                '</td>' +
                                                '<td class=" last">' +
                                                '<a target="_blank" href="${pageContext.request.contextPath}/reporte/reporteclientenatural?type=pdf&&conyugue=' + data.personaConyugue + '&&id=' + data.idCliente + '"><i class="fa fa-file-pdf-o fa-2x"></i> Ficha cliente</a>' +
                                                '</td>' +
                                                '</tr>');
                                    }
                                    else {
                                        $.notificar("Notificacion", "error", "Error, la persona con el dni que quiere registrar ya existe");
                                    }
                                }
                                else {
                                    $.notificar("Notificacion", "error", "Error, se produjo un error al actualizar los datos");
                                }

                            },
                            error: function (xhr, status, error) {
                                $.notificar("Notificacion", "error", "Error: " + error);
                            }
                        });
                    }
                });
            });

            $("#datepicker1").datepicker({dateFormat: 'yy-mm-dd'});
            $("#datepicker2").datepicker({dateFormat: 'yy-mm-dd'});

            $.cargarDepartamento = function () {
                $.restaurarLabel();
                var idPais = $("#formulario select[name=pais] option:selected").val();
                if (typeof (idPais) === 'undefined') {
                    $("#labelDepartamento").html('Departamento <span class="label label-info">Seleccione pais</span>');
                }
                else {
                    $.ajax({
                        type: 'POST',
                        url: '${pageContext.request.contextPath}/admision/cargardepartamento',
                        data: {idPais: idPais},
                        dataType: "json",
                        success: function (data) {
                            if (data.length !== 0) {
                                var added = '';
                                $.each(data, function (i, value) {
                                    var json = JSON.parse(value);
                                    added += '<option value="' + json.id + '">' + json.nombre + '</option>';
                                });
                                $("#formulario select[name=departamento]").html(added);
                            }
                            else {
                                $("#formulario select[name=departamento]").html('');
                                $("#formulario select[name=provincia]").html('');
                                $("#formulario select[name=distrito]").html('');
                            }
                        },
                        error: function (xhr, status, error) {
                            $.notificar("Notificacion", "error", "Error: " + error);
                        }
                    });
                }
            };

            $.cargarProvincia = function () {
                var idDepartamento = $("#formulario select[name=departamento] option:selected").val();
                if (typeof (idDepartamento) === 'undefined') {
                    $("#labelProvincia").html('Provincia <span class="label label-info">Seleccione departamento</span>');
                }
                else {
                    $.ajax({
                        type: 'POST',
                        url: '${pageContext.request.contextPath}/admision/cargarprovincia',
                        data: {idDepartamento: idDepartamento},
                        dataType: "json",
                        success: function (data) {
                            if (data.length !== 0) {
                                var added = '';
                                $.each(data, function (i, value) {
                                    var json = JSON.parse(value);
                                    added += '<option value="' + json.id + '">' + json.nombre + '</option>';
                                });
                                $("#formulario select[name=provincia]").html(added);
                            }
                            else {
                                $("#formulario select[name=provincia]").html('');
                                $("#formulario select[name=distrito]").html('');
                            }
                        },
                        error: function (xhr, status, error) {
                            $.notificar("Notificacion", "error", "Error: " + error);
                        }
                    });
                }
            };

            $.cargarDistrito = function () {
                var idProvincia = $("#formulario select[name=provincia] option:selected").val();
                if (typeof (idProvincia) === 'undefined') {
                    $("#labelDistrito").html('Distrito <span class="label label-info">Seleccione provincia</span>');
                }
                else {
                    $.ajax({
                        type: 'POST',
                        url: '${pageContext.request.contextPath}/admision/cargardistrito',
                        data: {idProvincia: idProvincia},
                        dataType: "json",
                        success: function (data) {
                            if (data.length !== 0) {
                                var added = '';
                                $.each(data, function (i, value) {
                                    var json = JSON.parse(value);
                                    added += '<option value="' + json.id + '">' + json.nombre + '</option>';
                                });
                                $("#formulario select[name=distrito]").html(added);
                            }
                            else {
                                $("#formulario select[name=distrito]").html('');
                            }
                        },
                        error: function (xhr, status, error) {
                            $.notificar("Notificacion", "error", "Error: " + error);
                        }
                    });
                }
            };

            $.restaurarLabel = function () {
                $("#labelDepartamento").html('Departamento');
                $("#labelProvincia").html('Provincia');
                $("#labelDistrito").html('Distrito');
            };

            $.registrarPersona = function () {
                $("#formulario").submit();
            };

            $.validarPersona = function (dni) {
                if (dni.length === 8) {
                    $.ajax({
                        type: 'POST',
                        url: '${pageContext.request.contextPath}/admision/validarclientenatural',
                        data: {dni: dni},
                        dataType: "json",
                        success: function (data) {
                            if (data === 0) {
                                $("#labelDni").html('Dni (*) <span class="label label-success">Cliente nuevo</span>');
                            }
                            else {
                                if (data === 1) {
                                    $("#labelDni").html('Dni (*) <span class="label label-danger">Cliente existe</span>');
                                    $("#registrar").attr({disabled: true});
                                }
                                else {
                                    if (data === 2) {
                                        $.notificar("Notificación", "warning", "Existe mas de un registro de cliente para este numero de dni, solicite al TECNICO INFORMATICO solucionar el problema antes de registrar");
                                    }
                                    else {
                                        $("#labelDni").html('Dni (*) <span class="label label-warning">Persona existe</span>');
                                        $("#formulario input[name=nombre]").val(data.nombre);
                                        $("#formulario input[name=apellidoPat]").val(data.apellidoPat);
                                        $("#formulario input[name=apellidoMat]").val(data.apellidoMat);
                                        $("#formulario input[name=direccion]").val(data.direccion);
                                        $("#formulario input[name=celular]").val(data.celular);
                                        $("#formulario input[name=email]").val(data.email);
                                        $("#formulario input[name=ruc]").val(data.ruc);
                                        $("#formulario input[name=fechaNacimiento]").val(data.fechaNacimiento);
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
                    $("#labelDni").html('Dni (*)');
                    $("#registrar").removeAttr("disabled");
                }
            };

            $.quitarConyugue = function (dni) {
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/admision/quitarconyugue",
                    data: {dni: dni},
                    dataType: "json",
                    success: function (data) {
                        var added = '';
                        if (data.length !== 0) {
                            $.each(data, function (i, value) {
                                var json = JSON.parse(value);
                                added += '<tr>' +
                                        '<td>' + (i + 1) + '</td>' +
                                        '<td>' + json.dni + '</td>' +
                                        '<td>' + json.nombre + '</td>' +
                                        '<td>' + json.apellidoPat + '</td>' +
                                        '<td>' + json.profesion + '</td>' +
                                        '<td>' + json.numeroHijos + '</td>' +
                                        '<td class="last">' +
                                        '<a href="javascript:void(0)" onclick="$.quitarConyugue(' + json.dni + ')" style="color: red">' +
                                        '<i class="fa fa-close"></i> Eliminar' +
                                        '</a>' +
                                        '</td>' +
                                        '</tr>';
                            });

                            $("#tablaConyugue tbody").html(added);
                        }
                        else {
                            $("#tablaConyugue tbody").html('<tr class="odd"><td valign="top" colspan="8" class="dataTables_empty">No hay registros de conyugue</td></tr></tr>');
                        }
                    },
                    error: function (xhr, status, error) {
                        $.notificar("Notificacion", "error", "Error: " + error);
                    }
                });
            };

            $.modificarClientenatural = function (id) {
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/admision/cargarclientenatural",
                    data: {id: id},
                    dataType: "json",
                    success: function (data) {
                        if (data !== 0) {
                            $("#formulario3 input[name=id]").val(data.id);
                            $("#formulario3 input[name=dni]").val(data.personaDni);
                            $("#formulario3 input[name=nombre]").val(data.personaNombre);
                            $("#formulario3 input[name=apellidoPat]").val(data.personaApellidoPat);
                            $("#formulario3 input[name=apellidoMat]").val(data.personaApellidoMat);
                            $("#formulario3 input[name=direccion]").val(data.personaDireccion);
                            $("#formulario3 select[name=distrito]").html('<option value="0">' + data.personaDistrito + '</option>');
                            $("#formulario3 select[name=provincia]").html('<option value="0">' + data.personaProvincia + '</option>');
                            $("#formulario3 select[name=departamento]").html('<option value="0">' + data.personaDepartamento + '</option>');
                            $("#formulario3 select[name=pais]").val(data.personaPais);
                            $("#formulario3 input[name=celular]").val(data.personaCelular);
                            $("#formulario3 input[name=email]").val(data.personaEmail);
                            $("#formulario3 input[name=ruc]").val(data.personaRuc);
                            $("#formulario3 select[name=estadocivil]").val(data.personaEstadocivil);
                            $("#formulario3 input[name=fechaNacimiento]").val(data.personaFechanacimiento);
                            $("#formulario3 select[name=genero]").val(data.personaGenero);
                            $("#formulario3 select[name=nacionalidad]").val(data.personaNacionalidad);
                            $("#formulario3 input[name=profesion]").val(data.personaProfesion);

                            if (data.personaConyugue === "S") {
                                $("#conyugue").prop("checked", true);
                                $("#conyugueField").show();

                                $("#formulario3 input[name=dnic]").val(data.conyugueDni);
                                $("#formulario3 input[name=nombrec]").val(data.conyugueNombre);
                                $("#formulario3 input[name=apellidoPatc]").val(data.conyugueApellidoPat);
                                $("#formulario3 input[name=apellidoMatc]").val(data.conyugueApellidoMat);
                                $("#formulario3 input[name=numeroHijosc]").val(data.conyugueNumerohijos);
                                $("#formulario3 input[name=numeroDependientesc]").val(data.conyugueNumerodependientes);
                                $("#formulario3 input[name=profesionc]").val(data.conyugueProfesion);
                            }
                            else {
                                $("#conyugueField").hide();

                                $("#formulario3 input[name=dnic]").val(data.conyugueDni);
                                $("#formulario3 input[name=nombrec]").val(data.conyugueNombre);
                                $("#formulario3 input[name=apellidoPatc]").val(data.conyugueApellidoPat);
                                $("#formulario3 input[name=apellidoMatc]").val(data.conyugueApellidoMat);
                                $("#formulario3 input[name=numeroHijosc]").val(data.conyugueNumerohijos);
                                $("#formulario3 input[name=numeroDependientesc]").val(data.conyugueNumerodependientes);
                                $("#formulario3 input[name=profesionc]").val(data.conyugueProfesion);
                            }
                        }
                        else {
                            $("#myModal").modal('hide');
                        }
                    },
                    error: function (xhr, status, error) {
                        $.notificar("Notificacion", "error", "Error: " + error);
                    }
                });
            };

            $.showConyuguefield = function () {
                if ($("#formulario3 input[name=conyugue]").prop('checked')) {
                    $("#conyugueField").show();
                }
                else {
                    $("#conyugueField").hide();
                }
            };

            $.cargarDepartamento2 = function () {
                $.restaurarLabel2();
                var idPais = $("#formulario3 select[name=pais] option:selected").val();
                if (typeof (idPais) === 'undefined') {
                    $("#labelDepartamento2").html('Departamento <span class="label label-info">Seleccione pais</span>');
                }
                else {
                    $.ajax({
                        type: 'POST',
                        url: '${pageContext.request.contextPath}/admision/cargardepartamento',
                        data: {idPais: idPais},
                        dataType: "json",
                        success: function (data) {
                            if (data.length !== 0) {
                                var added = '';
                                $.each(data, function (i, value) {
                                    var json = JSON.parse(value);
                                    added += '<option value="' + json.id + '">' + json.nombre + '</option>';
                                });
                                $("#formulario3 select[name=departamento]").html(added);
                            }
                            else {
                                $("#formulario3 select[name=departamento]").html('');
                                $("#formulario3 select[name=provincia]").html('');
                                $("#formulario3 select[name=distrito]").html('');
                            }
                        },
                        error: function (xhr, status, error) {
                            $.notificar("Notificacion", "error", "Error: " + error);
                        }
                    });
                }
            };

            $.cargarProvincia2 = function () {
                var idDepartamento = $("#formulario3 select[name=departamento] option:selected").val();
                if (typeof (idDepartamento) === 'undefined') {
                    $("#labelProvincia2").html('Provincia <span class="label label-info">Seleccione departamento</span>');
                }
                else {
                    $.ajax({
                        type: 'POST',
                        url: '${pageContext.request.contextPath}/admision/cargarprovincia',
                        data: {idDepartamento: idDepartamento},
                        dataType: "json",
                        success: function (data) {
                            if (data.length !== 0) {
                                var added = '';
                                $.each(data, function (i, value) {
                                    var json = JSON.parse(value);
                                    added += '<option value="' + json.id + '">' + json.nombre + '</option>';
                                });
                                $("#formulario3 select[name=provincia]").html(added);
                            }
                            else {
                                $("#formulario3 select[name=provincia]").html('');
                                $("#formulario3 select[name=distrito]").html('');
                            }
                        },
                        error: function (xhr, status, error) {
                            $.notificar("Notificacion", "error", "Error: " + error);
                        }
                    });
                }
            };

            $.cargarDistrito2 = function () {
                var idProvincia = $("#formulario3 select[name=provincia] option:selected").val();
                if (typeof (idProvincia) === 'undefined') {
                    $("#labelDistrito2").html('Distrito <span class="label label-info">Seleccione provincia</span>');
                }
                else {
                    $.ajax({
                        type: 'POST',
                        url: '${pageContext.request.contextPath}/admision/cargardistrito',
                        data: {idProvincia: idProvincia},
                        dataType: "json",
                        success: function (data) {
                            if (data.length !== 0) {
                                var added = '';
                                $.each(data, function (i, value) {
                                    var json = JSON.parse(value);
                                    added += '<option value="' + json.id + '">' + json.nombre + '</option>';
                                });
                                $("#formulario3 select[name=distrito]").html(added);
                            }
                            else {
                                $("#formulario3 select[name=distrito]").html('');
                            }
                        },
                        error: function (xhr, status, error) {
                            $.notificar("Notificacion", "error", "Error: " + error);
                        }
                    });
                }
            };

            $.restaurarLabel2 = function () {
                $("#labelDepartamento2").html('Departamento');
                $("#labelProvincia2").html('Provincia');
                $("#labelDistrito2").html('Distrito');
            };
        </script>
    </body>
</html>
