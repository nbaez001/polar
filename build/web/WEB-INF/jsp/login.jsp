<%-- 
    Document   : login
    Created on : 14/11/2015, 05:13:14 PM
    Author     : Nerio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <%@include file="shared/favicon.jsp" %>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap-3.3.6.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/admin/custom.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/fonts/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/admin/site.css" rel="stylesheet" type="text/css"/>

        <!--  Estilos de error  -->
        <link href="${pageContext.request.contextPath}/assets/css/admin/cmxform.css" rel="stylesheet" type="text/css"/>
    </head>
    <body style="font-family: Cambria">
        <div class="main-login col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-6 col-xs-offset-3 col-ss-12">
            <div class="logo">LOG<i class="fa fa-paperclip"></i>IN
            </div>
            <!-- start: LOGIN BOX -->
            <div class="box-login">
                <h3 style="text-align: center">Ingrese a su cuenta</h3>
                <p style="text-align: center">
                    Ingrese su usuario y contraseña para iniciar sesión.
                </p>
                <form id="formulario" action="${pageContext.request.contextPath}/home/login" method="post" class="form-login">
                    <fieldset>
                        <div class="form-group">
                            <span class="input-icon">
                                <input type="text" class="form-control" name="usuario" placeholder="Id de usuario" autofocus />
                                <i class="fa fa-user"></i>
                            </span>
                        </div>
                        <div class="form-group form-actions">
                            <span class="input-icon">
                                <input type="password" class="form-control password" name="contrasena" placeholder="Contraseña">
                                <i class="fa fa-lock"></i>
                        </div>
                        <div class="form-actions">
                            <label for="remember" class="checkbox-inline">
                                <input type="checkbox" class="grey remember" id="remember" name="remember">
                                Recordar Cuenta
                            </label>
                            <button type="submit" class="btn btn-danger pull-right">
                                Login <i class="fa fa-arrow-circle-right"></i>
                            </button>
                        </div>
                    </fieldset>
                </form>
                <!--Mensaje de error-->
                <p id="mensaje" style="color: red">${error}</p>
            </div>
            <div class="copyright">
                2015 &copy; POLAR.
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-2.1.4.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap-3.3.6.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery.validate.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#formulario").validate({
                    rules: {
                        usuario: {
                            required: true
                        },
                        contrasena: {
                            required: true
                        }
                    },
                    messages: {
                        usuario: {
                            required: "Campo obligatorio"
                        },
                        contrasena: {
                            required: "Campo obligatorio"
                        }
                    }
                });
            });
        </script>
    </body>
</html>
