<%-- 
    Document   : error404
    Created on : 01/10/2015, 01:27:09 AM
    Author     : Nerio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error 404</title>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap-3.3.6.css" rel="stylesheet" type="text/css"/>
        
        <link href="${pageContext.request.contextPath}/assets/fonts/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/admin/custom.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="nav-md">

        <div class="container body">

            <div class="main_container">

                <!-- page content -->
                <div class="col-md-12">
                    <div class="col-middle">
                        <div class="text-center text-center">
                            <h1 class="error-number">404</h1>
                            <h2>No se pudo entrar esta pagina</h2>
                            <p>Lapagina que estas buscando no existe <a href="${pageContext.request.contextPath}/home">Ir a pagina principal?</a>
                            </p>
                            <div class="mid_center">
                                <h3>Search</h3>
                                <form>
                                    <div class="col-xs-12 form-group pull-right top_search">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="Buscar...">
                                            <span class="input-group-btn">
                                                <button class="btn btn-default" type="button">Ir!</button>
                                            </span>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /page content -->

            </div>
            <!-- footer content -->
        </div>

        <div id="custom_notifications" class="custom-notifications dsp_none">
            <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
            </ul>
            <div class="clearfix"></div>
            <div id="notif-group" class="tabbed_notifications"></div>
        </div>
    </body>
</html>
