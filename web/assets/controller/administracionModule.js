angular.module("administracionModule", ['ngValidate'])
        .controller("admisioncreditoController", ["$scope", "$http", function (s, h) {
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

                s.agencias = [];
                s.cuentacreditos = [];
                s.garantes = [];
                s.clientecn = {};
                s.clientecj = {};

                s.clientecn.id = 0;
                s.clientecj.id = 0;

                s.cuentacredito = {};

                h.post('/polar/common/listaragencia')
                        .success(function (data) {
                            $.each(data, function (index, value) {
                                s.agencias.push(JSON.parse(value));
                            });
                            s.agencia = s.agencias[0];
                        })
                        .error(function (error) {
                            s.notificar('Notificacion', 'error', 'Error: ' + error);
                        });

                h.post('/polar/administracion/listarcuentasadmision')
                        .success(function (data) {
                            $.each(data, function (index, value) {
                                s.cuentacreditos.push(JSON.parse(value));
                            });
                        })
                        .error(function (error) {
                            s.notificar('Notificacion', 'error', 'Error: ' + error);
                        });

                s.listarCuentasadmision = function () {
                    s.cuentacreditos = [];
                    h.post('/polar/administracion/listarcuentasadmision')
                            .success(function (data) {
                                $.each(data, function (index, value) {
                                    s.cuentacreditos.push(JSON.parse(value));
                                });
                            })
                            .error(function (error) {
                                s.notificar('Notificacion', 'error', 'Error: ' + error);
                            });
                };

                s.validatecj = {
                    rules: {
                        mensaje: {
                            required: true
                        }
                    },
                    messages: {
                        mensaje: {
                            required: "Este campo es obligatorio en caso de rechazo o anulacion de creditos"
                        }
                    }
                };

                s.validatecn = {
                    rules: {
                        mensaje: {
                            required: true
                        }
                    },
                    messages: {
                        mensaje: {
                            required: "Este campo es obligatorio en caso de rechazo o anulacion de creditos"
                        }
                    }
                };

                s.admisioncredito = function (codigo, form) {
                    s.cuentacredito.estadocredito.id = codigo;
                    if (s.cuentacredito.estadocredito.id !== 5) {
                        if (form.validate()) {
                            s.cuentacredito.mensaje = s.mensaje;

                            h.post('/polar/administracion/admisioncredito', s.cuentacredito)
                                    .success(function (data) {
                                        if (data === 1) {
                                            s.listarCuentasadmision();
                                            s.notificar("Notificacion", "success", "Se proceso correctamente la peticion");

                                            s.clientecn.id = 0;
                                            s.clientecj.id = 0;
                                        }
                                        else {
                                            s.notificar("Notificacion", "error", "Error, hubo un error al procesar la peticion");
                                        }
                                    })
                                    .error(function (error) {
                                        s.notificar('Notificacion', 'error', 'Error: ' + error);
                                    });
                        }
                    }
                    else {
                        h.post('/polar/administracion/admisioncredito', s.cuentacredito)
                                .success(function (data) {
                                    if (data === 1) {
                                        s.listarCuentasadmision();
                                        s.notificar("Notificacion", "success", "Se proceso correctamente la peticion");

                                        s.clientecn.id = 0;
                                        s.clientecj.id = 0;
                                    }
                                    else {
                                        s.notificar("Notificacion", "error", "Error, hubo un error al procesar la peticion");
                                    }
                                })
                                .error(function (error) {
                                    s.notificar('Notificacion', 'error', 'Error: ' + error);
                                });

                    }
                };

                s.cargardetallegarante = function (cuentacredito) {
                    s.garantes = [];
                    h.post('/polar/administracion/cargardetallegarante', cuentacredito)
                            .success(function (data) {
                                $.each(data, function (i, value) {
                                    s.garantes.push(JSON.parse(value));
                                });
                            })
                            .error(function (error) {
                                s.notificar('Notificacion', 'error', 'Error: ' + error);
                            });
                };

                s.cargardetallecn = function (cuentacredito) {
                    s.clientecj.id = 0;

                    s.cargardetallegarante(cuentacredito);
                    s.cuentacredito = cuentacredito;

                    h.post('/polar/administracion/obtenerclientecn', cuentacredito.cliente)
                            .success(function (data) {
                                s.clientecn = data;
                            })
                            .error(function (error) {
                                s.notificar('Notificacion', 'error', 'Error: ' + error);
                            });

                    $('html,body').animate({
                        scrollTop: $("#detailcn").offset().top
                    }, 2000);
                };

                s.cargardetallecj = function (cuentacredito) {
                    s.clientecn.id = 0;

                    s.cargardetallegarante(cuentacredito);
                    s.cuentacredito = cuentacredito;

                    h.post('/polar/administracion/obtenerclientecj', cuentacredito.cliente)
                            .success(function (data) {
                                s.clientecj = data;
                            })
                            .error(function (error) {
                                s.notificar('Notificacion', 'error', 'Error: ' + error);
                            });

                    $('html,body').animate({
                        scrollTop: $("#detailcj").offset().top
                    }, 2000);
                };
            }
        ]);


