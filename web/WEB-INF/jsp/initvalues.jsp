<%-- 
    Document   : login
    Created on : 14/11/2015, 05:13:14 PM
    Author     : Nerio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Init values</title>
        <%@include file="shared/favicon.jsp" %>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap-3.3.6.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/admin/custom.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/fonts/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/admin/site.css" rel="stylesheet" type="text/css"/>

        <!--  Estilos de error  -->
        <link href="${pageContext.request.contextPath}/assets/css/admin/cmxform.css" rel="stylesheet" type="text/css"/>
    </head>
    <body style="font-family: Cambria">
        <div class="main-login col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-12">
            <div class="logo"><i class="fa fa-briefcase"></i> Ingrese valores iniciales
            </div>
            <!-- start: LOGIN BOX -->
            <div class="box-login">
                <p style="text-align: center">
                    Ingrese los datos iniciales de la organizacion.
                </p>
                <form id="formulario" method="post">
                    <div class="row">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <fieldset>
                                    <legend>Datos organizacionales</legend>
                                    <div class="col-ss-12 col-xs-6">
                                        <label>Nombre organizacion (*)</label>
                                        <input name="nombre" type="text" class="form-control" placeholder="NOMBRE ORGANIZACION" autofocus>
                                    </div>
                                    <div class="col-ss-12 col-xs-6">
                                        <label>Ruc (*)</label>
                                        <input name="ruc" type="number" class="form-control" placeholder="RUC">
                                    </div>
                                    <div class="col-ss-12 col-xs-6">
                                        <label>Direccion (*)</label>
                                        <input name="direccion" type="text" class="form-control" placeholder="DIRECCION">
                                    </div>
                                    <div class="col-ss-12 col-xs-6">
                                        <label>Telefono (*)</label>
                                        <input name="telefono" type="number" class="form-control" placeholder="TELEFONO">
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                        <label>Pais (*)</label>
                                        <select name="pais" class="form-control">
                                            <c:forEach var="item" items="${listaPais}">
                                                <option value="${item.id}">${item.nombre}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                        <label>Departamento (*)</label>
                                        <select name="departamento" class="form-control" onmouseover="$.cargarDepartamento()">
                                        </select>
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                        <label>Provincia (*)</label>
                                        <select name="provincia" class="form-control" onmouseover="$.cargarProvincia()">
                                        </select>
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                        <label>Distrito (*)</label>
                                        <select name="distrito" class="form-control" onmouseover="$.cargarDistrito()">
                                        </select>
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <fieldset>
                                    <legend>Datos de administrador</legend>
                                    <div class="col-ss-12 col-xs-6">
                                        <label>Dni (*)</label>
                                        <input name="dni" type="number" class="form-control" placeholder="DNI">
                                    </div>
                                    <div class="col-ss-12 col-xs-6">
                                        <label>Nombre (*)</label>
                                        <input name="nombrep" type="text" class="form-control" placeholder="NOMBRE">
                                    </div>
                                    <div class="col-ss-12 col-xs-6">
                                        <label>Apellido paterno (*)</label>
                                        <input name="apellidoPat" type="text" class="form-control" placeholder="APELLIDO PATERNO">
                                    </div>
                                    <div class="col-ss-12 col-xs-6">
                                        <label>Apellido materno (*)</label>
                                        <input name="apellidoMat" type="text" class="form-control" placeholder="APELLIDO MATERNO">
                                    </div>
                                    <div class="col-ss-12 col-xs-6">
                                        <label>Direccion (*)</label>
                                        <input name="direccionp" type="text" class="form-control" placeholder="DIRECCION">
                                    </div>
                                    <div class="col-ss-12 col-xs-6">
                                        <label>Celular (*)</label>
                                        <input name="celular" type="number" class="form-control" placeholder="CALULAR">
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <fieldset>
                                    <legend>Datos como usuario del sistema</legend>
                                    <div class="col-ss-12 col-xs-6">
                                        <label>Cargo (*)</label>
                                        <input name="cargo" type="text" class="form-control" placeholder="CARGO EN LA EMPRESA">
                                    </div>
                                    <div class="col-ss-12 col-xs-6">
                                        <label>Usuario (*)</label>
                                        <input name="usuario" type="text" class="form-control" placeholder="ID DE USUARIO DEL SISTEMA">
                                    </div>
                                    <div class="col-ss-12 col-xs-6">
                                        <label>Contraseña (*)</label>
                                        <input id="precontrasena" name="precontrasena" type="password" class="form-control" placeholder="CONTRASEÑA">
                                    </div>
                                    <div class="col-ss-12 col-xs-6">
                                        <label>Repetir contraseña (*)</label>
                                        <input name="contrasena" type="password" class="form-control" placeholder="VALIDACION DE CONTRASEÑA">
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                    <div class="form-actions" style="padding-top: 5px">
                        <button type="submit" class="btn btn-danger pull-right">
                            Registrar <i class="fa fa-arrow-circle-right"></i>
                        </button>
                    </div>
                    <p id="mensaje" style="color: red">${error}</p>
                </form>
            </div>
            <div class="copyright">
                2015 &copy; PRO-NEGOCIOS.
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-2.1.4.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap-3.3.6.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery.validate.min.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/nicescroll/jquery.nicescroll.min.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/admin/custom.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.core.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.buttons.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.nonblock.js" type="text/javascript"></script>

        <script type="text/javascript">
                                            $.notificar = function (titulo, tipo, mensaje) {
                                                new PNotify({title: titulo,
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
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#formulario").validate({
                    rules: {
                        nombre: {
                            required: true
                        },
                        ruc: {
                            required: true
                        },
                        direccion: {
                            required: true
                        },
                        telefono: {
                            required: true
                        },
                        distrito: {
                            required: true
                        },
                        provincia: {
                            required: true
                        },
                        departamento: {
                            required: true
                        },
                        pais: {
                            required: true
                        },
                        dni: {
                            required: true
                        },
                        nombrep: {
                            required: true
                        },
                        apellidoPat: {
                            required: true
                        },
                        apellidoMat: {
                            required: true
                        },
                        celular: {
                            required: true
                        },
                        direccionp: {
                            required: true
                        },
                        cargo: {
                            required: true
                        },
                        usuario: {
                            required: true
                        },
                        precontrasena: {
                            required: true
                        },
                        contrasena: {
                            required: true,
                            equalTo: "#precontrasena"
                        }
                    },
                    messages: {
                        nombre: {
                            required: "Campo obligatorio"
                        },
                        ruc: {
                            required: "Campo obligatorio"
                        },
                        direccion: {
                            required: "Campo obligatorio"
                        },
                        telefono: {
                            required: "Campo obligatorio"
                        },
                        distrito: {
                            required: "Campo obligatorio"
                        },
                        provincia: {
                            required: "Campo obligatorio"
                        },
                        departamento: {
                            required: "Campo obligatorio"
                        },
                        pais: {
                            required: "Campo obligatorio"
                        },
                        dni: {
                            required: "Campo obligatorio"
                        },
                        nombrep: {
                            required: "Campo obligatorio"
                        },
                        apellidoPat: {
                            required: "Campo obligatorio"
                        },
                        apellidoMat: {
                            required: "Campo obligatorio"
                        },
                        celular: {
                            required: "Campo obligatorio"
                        },
                        direccionp: {
                            required: "Campo obligatorio"
                        },
                        cargo: {
                            required: "Campo obligatorio"
                        },
                        usuario: {
                            required: "Campo obligatorio"
                        },
                        precontrasena: {
                            required: "Campo obligatorio"
                        },
                        contrasena: {
                            required: "Campo obligatorio",
                            equalTo: "Las contraseñas no coinciden"
                        }
                    },
                    submitHandler: function () {
                        var data = {
                            nombre: $("#formulario input[name=nombre]").val(),
                            ruc: $("#formulario input[name=ruc]").val(),
                            direccion: $("#formulario input[name=direccion]").val(),
                            telefono: $("#formulario input[name=telefono]").val(),
                            distrito: $("#formulario select[name=distrito] option:selected").text(),
                            provincia: $("#formulario select[name=provincia] option:selected").text(),
                            departamento: $("#formulario select[name=departamento] option:selected").text(),
                            pais: $("#formulario select[name=pais] option:selected").text(),
                            dni: parseInt($("#formulario input[name=dni]").val()),
                            nombrep: $("#formulario input[name=nombrep]").val(),
                            apellidoPat: $("#formulario input[name=apellidoPat]").val(),
                            apellidoMat: $("#formulario input[name=apellidoMat]").val(),
                            direccionp: $("#formulario input[name=direccionp]").val(),
                            celular: parseFloat($("#formulario input[name=celular]").val()),
                            cargo: $("#formulario input[name=cargo]").val(),
                            usuario: $("#formulario input[name=usuario]").val(),
                            contrasena: $("#formulario input[name=contrasena]").val()
                        };

                        $.ajax({
                            type: 'POST',
                            url: '${pageContext.request.contextPath}/home/initvalues',
                            data: data,
                            dataType: 'json',
                            success: function (data, textStatus, jqXHR) {
                                if (data === 1) {
                                    window.location.href = "${pageContext.request.contextPath}/home/login";
                                }
                                else {
                                    $.notificar("Notificacion", "error", "No se pudo realizar el registro de inicio, vuelva a intentarlo.");
                                }
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                $.notificar("Notificacion", "error", "Error: " + errorThrown);
                            }
                        });
                    }
                });
            });

            $.cargarDepartamento = function () {
                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/admision/cargardepartamento',
                    data: {idPais: $("#formulario select[name=pais] option:selected").val()},
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
                    },
                    error: function (xhr, status, error) {
                        $.notificar("Notificacion", "error", "Error: " + error);
                    }
                });
            };

            $.cargarProvincia = function () {
                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/admision/cargarprovincia',
                    data: {idDepartamento: $("#formulario select[name=departamento] option:selected").val()},
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
                    },
                    error: function (xhr, status, error) {
                        $.notificar("Notificacion", "error", "Error: " + error);
                    }
                });
            };

            $.cargarDistrito = function () {
                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/admision/cargardistrito',
                    data: {idProvincia: $("#formulario select[name=provincia] option:selected").val()},
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
                    },
                    error: function (xhr, status, error) {
                        $.notificar("Notificacion", "error", "Error: " + error);
                    }
                });
            };
        </script>
    </body>
</html>
