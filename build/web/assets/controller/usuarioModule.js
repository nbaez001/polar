angular.module("usuarioModule", ['ngValidate'])
        .controller("mantenerusuarioController", ["$scope", "$http", "$timeout", function (s, h, t) {
                s.notificar = function (titulo, tipo, mensaje) {
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

                s.meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
                s.dias = ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"];

                s.estados = [
                    {id: 1, nombre: 'ACTIVO'},
                    {id: 0, nombre: 'INACTIVO'}
                ];

                s.usuarios = [];
                s.agencias = [];
                s.tipoempleados = [];
                s.roles = [];
                s.generos = [];
                s.estadocivils = [];

                s.usuario = {};
                s.usuario.id = -2;
                s.usuario.empleado = {};
                s.usuario.empleado.persona = {};

                s.usuarioa = {};
                s.usuarioa.estado = s.estados[0];

                h.post('/polar/common/listarusuario')
                        .success(function (data) {
                            $.each(data, function (index, value) {
                                s.usuarios.push(JSON.parse(value));
                            });
                        })
                        .error(function (error) {
                            s.notificar('Notificacion', 'error', 'Error: ' + error);
                        });

                h.post('/polar/common/listaragencia')
                        .success(function (data) {
                            $.each(data, function (index, value) {
                                s.agencias.push(JSON.parse(value));
                            });
                            s.usuario.empleado.agencia = s.agencias[0];
                        })
                        .error(function (error) {
                            s.notificar('Notificacion', 'error', 'Error: ' + error);
                        });

                h.post('/polar/common/listartipoempleado')
                        .success(function (data) {
                            $.each(data, function (index, value) {
                                s.tipoempleados.push(JSON.parse(value));
                            });

                            s.usuario.empleado.tipoempleado = s.tipoempleados[0];
                        })
                        .error(function (error) {
                            s.notificar('Notificacion', 'error', 'Error: ' + error);
                        });

                h.post('/polar/common/listarrol')
                        .success(function (data) {
                            $.each(data, function (index, value) {
                                s.roles.push(JSON.parse(value));
                            });
                        })
                        .error(function (error) {
                            s.notificar('Notificacion', 'error', 'Error: ' + error);
                        });

                h.post('/polar/common/listargenero')
                        .success(function (data) {
                            $.each(data, function (index, value) {
                                s.generos.push(JSON.parse(value));
                            });
                            s.usuario.empleado.persona.genero = s.generos[0];
                        })
                        .error(function (error) {
                            s.notificar('Notificacion', 'error', 'Error: ' + error);
                        });

                h.post('/polar/common/listarestadocivil')
                        .success(function (data) {
                            $.each(data, function (index, value) {
                                s.estadocivils.push(JSON.parse(value));
                            });
                            s.usuario.empleado.persona.estadocivil = s.estadocivils[0];
                        })
                        .error(function (error) {
                            s.notificar('Notificacion', 'error', 'Error: ' + error);
                        });

                s.listarUsuarios = function () {
                    s.usuarios = [];
                    h.post('/polar/common/listarusuario')
                            .success(function (data) {
                                $.each(data, function (index, value) {
                                    s.usuarios.push(JSON.parse(value));
                                });
                            })
                            .error(function (error) {
                                s.notificar('Notificacion', 'error', 'Error: ' + error);
                            });
                };

                s.actualizarUsuario = function (usuario) {
                    s.usuarioa = usuario;
                };

                s.validarPersona = function () {
                    if ((s.usuario.empleado.persona.dni + '').length === 8) {
                        h.post('/polar/administracion/validarusuario', s.usuario.empleado.persona)
                                .success(function (data) {
                                    s.usuario = data;
                                })
                                .error(function (error) {
                                    s.notificar('Notificacion', 'error', 'Error: ' + error);
                                });
                    }
                };

                s.validateusuario = {
                    rules: {
                        dni: {
                            required: true,
                            minlength: 8,
                            maxlength: 8
                        },
                        nombre: {
                            required: true
                        },
                        apellidoPat: {
                            required: true
                        },
                        apellidoMat: {
                            required: true
                        },
                        direccion: {
                            required: true
                        },
                        celular: {
                            required: true,
                            minlength: 9,
                            maxlength: 11
                        },
                        agencia: {
                            required: true
                        },
                        tipoempleado: {
                            required: true
                        },
                        fechaInicio: {
                            required: true
                        },
                        usuario: {
                            required: true
                        },
                        contrasena1: {
                            required: true
                        },
                        contrasena: {
                            required: true
                        }
                    },
                    messages: {
                        dni: {
                            required: "Campo obligatorio",
                            minlength: "Este campo debe contener al menos {0} caracteres",
                            maxlength: "Este campo no debe debe sobrepasar los {0} caracteres"
                        },
                        nombre: {
                            required: "Campo obligatorio"
                        },
                        apellidoPat: {
                            required: "Campo obligatorio"
                        },
                        apellidoMat: {
                            required: "Campo obligatorio"
                        },
                        direccion: {
                            required: "Campo obligatorio"
                        },
                        celular: {
                            required: "Campo obligatorio",
                            minlength: "Este campo debe contener al menos {0} caracteres",
                            maxlength: "Este campo no debe debe sobrepasar los {0} caracteres"
                        },
                        agencia: {
                            required: "Campo obligatorio"
                        },
                        tipoempleado: {
                            required: "Campo obligatorio"
                        },
                        fechaInicio: {
                            required: "Campo obligatorio"
                        },
                        usuario: {
                            required: "Campo obligatorio"
                        },
                        contrasena1: {
                            required: "Campo obligatorio"
                        },
                        contrasena: {
                            required: "Campo obligatorio"
                        }
                    }
                };

                s.validateusuarioa = {
                    rules: {
                        dni: {
                            required: true,
                            minlength: 8,
                            maxlength: 8
                        },
                        nombre: {
                            required: true
                        },
                        apellidoPat: {
                            required: true
                        },
                        apellidoMat: {
                            required: true
                        },
                        direccion: {
                            required: true
                        },
                        celular: {
                            required: true,
                            minlength: 9,
                            maxlength: 11
                        },
                        agencia: {
                            required: true
                        },
                        tipoempleado: {
                            required: true
                        },
                        fechaInicio: {
                            required: true
                        },
                        usuario: {
                            required: true
                        },
                        contrasena1: {
                            required: true
                        },
                        contrasena: {
                            required: true
                        }
                    },
                    messages: {
                        dni: {
                            required: "Campo obligatorio",
                            minlength: "Este campo debe contener al menos {0} caracteres",
                            maxlength: "Este campo no debe debe sobrepasar los {0} caracteres"
                        },
                        nombre: {
                            required: "Campo obligatorio"
                        },
                        apellidoPat: {
                            required: "Campo obligatorio"
                        },
                        apellidoMat: {
                            required: "Campo obligatorio"
                        },
                        direccion: {
                            required: "Campo obligatorio"
                        },
                        celular: {
                            required: "Campo obligatorio",
                            minlength: "Este campo debe contener al menos {0} caracteres",
                            maxlength: "Este campo no debe debe sobrepasar los {0} caracteres"
                        },
                        agencia: {
                            required: "Campo obligatorio"
                        },
                        tipoempleado: {
                            required: "Campo obligatorio"
                        },
                        fechaInicio: {
                            required: "Campo obligatorio"
                        },
                        usuario: {
                            required: "Campo obligatorio"
                        },
                        contrasena1: {
                            required: "Campo obligatorio"
                        },
                        contrasena: {
                            required: "Campo obligatorio"
                        }
                    }
                };

                s.registrarusuario = function (form) {
                    if (form.validate()) {

                        s.permisos = [];
                        $("#permisos input:checked").each(function (index)
                        {
                            s.permisos.push({rol: JSON.parse($(this).val()), usuario: s.usuario});
                        });

                        h.post('/polar/administracion/crearusuario', s.permisos)
                                .success(function (data) {
                                    if (data === 0) {
                                        s.notificar("Notificacion", "error", "Error, se produjo un error al registrar los datos");
                                    }
                                    else {
                                        if (data === 2) {
                                            s.notificar("Notificacion", "warning", "Error, no se pueden crear 2 usuarios con cargo gerente general al mismo tiempo.");
                                        }
                                        else {
                                            s.notificar("Notificacion", "success", "Los datos se han regitrado correctamente");
                                            s.usuario = {};
                                            s.usuario.empleado = {};
                                            s.usuario.empleado.persona = {};
                                            s.usuario.empleado.agencia = s.agencias[0];
                                            s.usuario.empleado.tipoempleado = s.tipoempleados[0];
                                            s.usuario.empleado.persona.genero = s.generos[0];
                                            s.usuario.empleado.persona.estadocivil = s.estadocivils[0];

                                            s.listarUsuarios();
                                        }
                                    }
                                })
                                .error(function (error) {
                                    s.notificar('Notificacion', 'error', 'Error: ' + error);
                                });
                    }
                };

                s.modificarusuario = function (form) {
                    if (form.validate()) {
                        s.usuarioa.estado = s.usuarioa.estado.id;

                        s.permisos = [];
                        $("#permisos2 input:checked").each(function (index)
                        {
                            s.permisos.push({rol: JSON.parse($(this).val()), usuario: s.usuarioa});
                        });

                        h.post('/polar/administracion/modificarusuario', s.permisos)
                                .success(function (data) {
                                    if (data === 0) {
                                        s.notificar("Notificacion", "error", "Error, se produjo un error al actualizar los datos");
                                    }
                                    else {
                                        if (data === 2) {
                                            s.notificar("Notificacion", "warning", "Error, ya existe un usuario con cargo de Gerente general, modifique el cargo de este y vuelva a intentarlo");
                                        }
                                        else {
                                            s.notificar("Notificacion", "success", "Los datos se han actualizado correctamente");
                                            s.usuarioa = {};
                                            s.usuarioa.empleado = {};
                                            s.usuarioa.empleado.persona = {};
                                            s.usuarioa.empleado.agencia = s.agencias[0];
                                            s.usuarioa.empleado.tipoempleado = s.tipoempleados[0];
                                            s.usuarioa.empleado.persona.genero = s.generos[0];
                                            s.usuarioa.empleado.persona.estadocivil = s.estadocivils[0];

                                            $("#myModal").modal('hide');
                                            s.listarUsuarios();
                                        }
                                    }
                                })
                                .error(function (error) {
                                    s.notificar('Notificacion', 'error', 'Error: ' + error);
                                });
                    }
                };

                s.eliminarUsuario = function (usuario) {
                    h.post('/polar/administracion/eliminarusuario', usuario)
                            .success(function (data) {
                                if (data === 0) {
                                    s.notificar("Notificacion", "error", "Error al eliminar usuario");
                                }
                                else {
                                    s.notificar("Notificacion", "success", "El usuario se elimino correctamente");
                                    s.listarUsuarios();
                                }
                            })
                            .error(function (error) {
                                s.notificar('Notificacion', 'error', 'Error: ' + error);
                            });
                };
                
                s.countUp = function () {
                    s.tiempo = new Date();

                    s.fecha = s.dias[s.tiempo.getDay()] + ' ' + s.tiempo.getDate() + ' ' + s.meses[s.tiempo.getMonth()] + ' ' + s.tiempo.getFullYear() + ' (' + s.tiempo.getHours() + ':' + s.tiempo.getMinutes() + ':' + s.tiempo.getSeconds() + ') Horas';
                    t(s.countUp, 1000);
                };

                t(s.countUp, 1000);
            }
        ]);


