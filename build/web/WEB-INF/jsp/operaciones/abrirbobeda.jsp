<%-- 
    Document   : categoria
    Created on : 29/12/2015, 10:47:48 AM
    Author     : Nerio
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
        <title>Apertura bobeda</title>
        <%@include file="../shared/favicon.jsp" %>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap-3.3.6.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/fonts/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/animate/animate.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/admin/site.css" rel="stylesheet" type="text/css"/>

        <link href="${pageContext.request.contextPath}/assets/css/admin/custom.css" rel="stylesheet" type="text/css"/>
        <!--  Estilos de error  -->
        <link href="${pageContext.request.contextPath}/assets/css/admin/cmxform.css" rel="stylesheet" type="text/css"/>
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
                                <h4>Administracion de bobeda </h4>
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
                                        <h2>Apertura de bobeda <i class="fa fa-book"></i></h2>
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
                                                <form action="${pageContext.request.contextPath}/operaciones/bobeda" method="POST">
                                                    <div class="col-ss-12 col-xs-12">
                                                        <label style="color: blueviolet"> Bobeda diaria pendiente de apertura</label>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-6">
                                                        <label>Nombre</label>
                                                        <input class="form-control" value="BOBEDA SOLES" disabled="">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-6">
                                                        <label>Fecha apertura</label>
                                                        <div id="reportrange" style="margin-top: 5px; background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #E6E9ED">
                                                            <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                                                            <span style="color: #73879C"><%=formateadorFecha.format(new Date())%>) Horas</span> <b class="caret"></b>
                                                        </div>
                                                    </div>

                                                    <div class="col-ss-12 col-xs-12" style="padding-top: 5px">
                                                        <input type="submit" value="Abrir bobeda" class="btn btn-primary">
                                                    </div>
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
                                                <h2>Estado de bobedas hasta ahora</h2>
                                            </div>
                                            <div class="col-ss-12 col-xs-8">
                                                <div id="reportrange" class="pull-right" style="margin-top: 5px; background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #E6E9ED">
                                                    <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                                                    <span style="color: #73879C"><%=formateadorFecha.format(new Date())%>) Horas</span> <b class="caret"></b>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <div class="col-md-12 col-sm-12 col-xs-12 col-ss-12">
                                            <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                                <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                    <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Actividad reciente</a>
                                                    </li>
                                                </ul>
                                                <div id="myTabContent" class="tab-content">
                                                    <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">

                                                        <!-- start recent activity -->
                                                        <ul class="messages" id="listaProductocredito">
                                                            <c:forEach var="item" items="${listaBobeda}">
                                                                <li id="${item.id}">
                                                                    <img src="" class="avatar" alt="Avatar" >
                                                                    <div class="message_date">
                                                                        <h4 class="date text-info"><fmt:formatDate pattern="YYYY-MM-dd" value="${item.fechaApertura}"></fmt:formatDate></h4>
                                                                            <p class="month">Fecha apertura</p>
                                                                        </div>
                                                                        <div class="message_wrapper">
                                                                            <h4 class="heading">${item.nombre}</h4>
                                                                        <blockquote class="message" style="font-size: 13px">
                                                                            <b>Monto apertura: </b>${item.montoApertura}<br>
                                                                            <b>Monto cierre: </b>${item.montoCierre}<br>
                                                                            <b>Fecha cierre: </b><fmt:formatDate pattern="YYYY-MM-dd" value="${item.fechaCierre}"></fmt:formatDate><br>
                                                                            <b>Moneda: </b>${item.moneda}<br>
                                                                        </blockquote>
                                                                        <br />
                                                                        <p class="url">
                                                                            <span class="fs1 text-info" aria-hidden="true" data-icon="" style="padding-left: 20px"></span>
                                                                            <a target="_blank" href="${pageContext.request.contextPath}/reporte/reportebobeda?type=pdf&&id=${item.id}"><i class="fa fa-file-pdf-o fa-2x"></i> Reporte bobeda</a>
                                                                        </p>
                                                                    </div>
                                                                </li>
                                                            </c:forEach>
                                                        </ul>
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

        <script src="${pageContext.request.contextPath}/assets/js/progressbar/bootstrap-progressbar.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/nicescroll/jquery.nicescroll.min.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/admin/custom.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery.validate.min.js" type="text/javascript"></script>
    </body>
</html>
