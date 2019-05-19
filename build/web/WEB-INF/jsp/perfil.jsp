<%-- 
    Document   : administrarPerfil
    Created on : 19/03/2015, 06:45:36 PM
    Author     : NERIO
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil</title>
        <%@include file="shared/favicon.jsp" %>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap-3.3.6.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/fonts/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/animate/animate.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/admin/site.css" rel="stylesheet" type="text/css"/>

        <link href="${pageContext.request.contextPath}/assets/css/admin/custom.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="nav-md" style="font-family: Cambria">
        <div class="container body">
            <div class="main_container">
                <%@include file="shared/navbarLeft.jsp" %>
                <%@include file="shared/navbarTop.jsp" %>
                <div class="right_col" role="main">
                    <div class="">
                        <div class="row">
                            <div class="col-ss-12 col-xs-12" style="text-align: center">
                                <div class="tile">
                                    <h4>Administracion de perfil</h4>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-ss-12 col-xs-12">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <fieldset>
                                            <legend><h4>Datos personales</h4></legend>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="background-color: #DDDDDD; border-radius: 5%; border-color: #C0C09F; height: 36px">
                                                <b>Nombre: </b>
                                            </div>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="height: 36px">
                                                ${user.empleado.persona.nombre}
                                            </div>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="background-color: #DDDDDD; border-radius: 5%; border-color: #C0C09F; height: 36px">
                                                <b>Apellido paterno: </b>
                                            </div>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="height: 36px">
                                                ${user.empleado.persona.apellidoPat}
                                            </div>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="background-color: #DDDDDD; border-radius: 5%; border-color: #C0C09F; height: 36px">
                                                <b>Apellido materno: </b>
                                            </div>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="height: 36px">
                                                ${user.empleado.persona.apellidoMat}
                                            </div>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="background-color: #DDDDDD; border-radius: 5%; border-color: #C0C09F; height: 36px">
                                                <b>Dni: </b>
                                            </div>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="height: 36px">
                                                ${user.empleado.persona.dni}
                                            </div>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="background-color: #DDDDDD; border-radius: 5%; border-color: #C0C09F; height: 36px">
                                                <b>Celular: </b>
                                            </div>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="height: 36px">
                                                ${user.empleado.persona.celular}
                                            </div>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="background-color: #DDDDDD; border-radius: 5%; border-color: #C0C09F; height: 36px">
                                                <b>Direccion: </b>
                                            </div>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="height: 36px">
                                                ${user.empleado.persona.direccion}
                                            </div>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="background-color: #DDDDDD; border-radius: 5%; border-color: #C0C09F; height: 36px">
                                                <b>Email: </b>
                                            </div>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="height: 36px">
                                                ${user.empleado.persona.email}
                                            </div>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="background-color: #DDDDDD; border-radius: 5%; border-color: #C0C09F; height: 36px">
                                                <b>Ruc: </b>
                                            </div>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="height: 36px">
                                                ${user.empleado.persona.ruc}
                                            </div>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="background-color: #DDDDDD; border-radius: 5%; border-color: #C0C09F; height: 36px">
                                                <b>Estado civil: </b>
                                            </div>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="height: 36px">
                                                ${user.empleado.persona.estadocivil.denominacion}
                                            </div>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="background-color: #DDDDDD; border-radius: 5%; border-color: #C0C09F; height: 36px">
                                                <b>Fecha nacimiento: </b>
                                            </div>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="height: 36px">
                                                <fmt:formatDate pattern="YYYY-MM-dd" value="${user.empleado.persona.fechaNacimiento}"></fmt:formatDate>
                                                </div>
                                                <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="background-color: #DDDDDD; border-radius: 5%; border-color: #C0C09F; height: 36px">
                                                    <b>Sexo: </b>
                                                </div>
                                                <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="height: 36px">
                                                ${user.empleado.persona.genero.denominacion}
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-ss-12 col-xs-12">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <fieldset>
                                            <legend><h4>Datos de colaborador</h4></legend>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="background-color: #DDDDDD; border-radius: 5%; border-color: #C0C09F; height: 36px">
                                                <b>Cargo: </b>
                                            </div>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="height: 36px">
                                                ${user.empleado.tipoempleado.nombre}
                                            </div>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="background-color: #DDDDDD; border-radius: 5%; border-color: #C0C09F; height: 36px">
                                                <b>Fecha inicio: </b>
                                            </div>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="height: 36px">
                                                <fmt:formatDate pattern="YYYY-MM-dd" value="${user.empleado.fechaInicio}"></fmt:formatDate>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-ss-12 col-xs-12">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <fieldset>
                                                <legend><h4>Datos de cuenta</h4></legend>
                                                <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="background-color: #DDDDDD; border-radius: 5%; border-color: #C0C09F; height: 36px">
                                                    <b>Usuario: </b>
                                                </div>
                                                <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="height: 36px">
                                                ${user.usuario}
                                            </div>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="background-color: #DDDDDD; border-radius: 5%; border-color: #C0C09F; height: 36px">
                                                <b>Contraseña: </b>
                                            </div>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="height: 36px" title="${user.contrasena}">
                                                ${user.contrasena}
                                            </div>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="background-color: #DDDDDD; border-radius: 5%; border-color: #C0C09F; height: 36px">
                                                <b>Estado: </b>
                                            </div>
                                            <div class="col-ss-12 col-xs-12 col-sm-6 col-md-3 col-lg-3" style="height: 36px">
                                                <c:choose>
                                                    <c:when test="${user.estado == true}">
                                                        ACTIVO.
                                                    </c:when>
                                                    <c:otherwise>
                                                        INACTIVO.
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%@include file="shared/footer.jsp" %>
                </div>
            </div>
        </div>

        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-2.1.4.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap-3.3.6.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/nicescroll/jquery.nicescroll.min.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/admin/custom.js" type="text/javascript"></script>
    </body>
</html>
