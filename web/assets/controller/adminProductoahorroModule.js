angular.module("adminProductoahorroModule", ['ngValidate'])
        .controller("ProductoahorroController", ["$scope", "$http", function (s, h) {
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

                s.tipoahorros = [];
                s.tipomonedas = [];
                s.frecuenciaaportes = [];
                s.productoahorros = [];

                s.productoahorro = {};
                
                s.productoahorro2 = {};

                h.post('/polar/common/listartipoahorro')
                        .success(function (data) {
                            $.each(data, function (index, value) {
                                s.tipoahorros.push(JSON.parse(value));
                            });
                            s.productoahorro.tipoahorro = s.tipoahorros[0];
                        })
                        .error(function (error) {
                            s.notificar('Notificacion', 'error', 'Error: ' + error);
                        });

                h.post('/polar/common/listartipomoneda')
                        .success(function (data) {
                            $.each(data, function (index, value) {
                                s.tipomonedas.push(JSON.parse(value));
                            });
                            s.productoahorro.tipomoneda = s.tipomonedas[0];
                        })
                        .error(function (error) {
                            s.notificar('Notificacion', 'error', 'Error: ' + error);
                        });

                h.post('/polar/common/listarfrecuenciaaporte')
                        .success(function (data) {
                            $.each(data, function (index, value) {
                                s.frecuenciaaportes.push(JSON.parse(value));
                            });
                            s.productoahorro.frecuenciaaporte = s.frecuenciaaportes[0];
                        })
                        .error(function (error) {
                            s.notificar('Notificacion', 'error', 'Error: ' + error);
                        });

                h.post('/polar/common/listarproductoahorro')
                        .success(function (data) {
                            $.each(data, function (index, value) {
                                s.productoahorros.push(JSON.parse(value));
                            });
                        })
                        .error(function (error) {
                            s.notificar('Notificacion', 'error', 'Error: ' + error);
                        });

                s.actualizarFormulario = function () {
                    var tipoahorro = parseInt(s.productoahorro.tipoahorro.id);
                    if (tipoahorro === 1) {
                        $("#formulario1").removeAttr('hidden');
                        $("#formulario2").attr({hidden: true});
                    }
                    else {
                        $("#formulario2").removeAttr('hidden');
                        $("#formulario1").attr({hidden: true});
                    }
                };

                s.validationFormulario1 = {
                    rules: {
                        nombre: {
                            required: true
                        },
                        docSustentatorios: {
                            required: true
                        },
                        tipomoneda: {
                            required: true
                        },
                        tea: {
                            required: true
                        },
                        inicioFechaVigencia: {
                            required: true
                        },
                        finFechaVigencia: {
                            required: true
                        },
                        montoMinimo: {
                            required: true
                        },
                        montoMaximo: {
                            required: true
                        },
                        periodoMinimo: {
                            required: true
                        },
                        periodoMaximo: {
                            required: true
                        }
                    },
                    messages: {
                        nombre: {
                            required: "Campo obligatorio"
                        },
                        docSustentatorios: {
                            required: "Campo obligatorio"
                        },
                        tipomoneda: {
                            required: "Campo obligatorio"
                        },
                        tea: {
                            required: "Campo obligatorio"
                        },
                        inicioFechaVigencia: {
                            required: "Campo obligatorio"
                        },
                        finFechaVigencia: {
                            required: "Campo obligatorio"
                        },
                        montoMinimo: {
                            required: "Campo obligatorio"
                        },
                        montoMaximo: {
                            required: "Campo obligatorio"
                        },
                        periodoMinimo: {
                            required: "Campo obligatorio"
                        },
                        periodoMaximo: {
                            required: "Campo obligatorio"
                        }
                    }
                };

                s.registrarProductopf = function (form) {
                    if (form.validate()) {
                        h.post("/polar/administracion/productoahorro", s.productoahorro)
                                .success(function (data, status, headers, config) {
                                    if (data === 1) {
                                        s.notificar('Notificacion', 'success', 'Se ha registrado correctamente el producto ahorro');
                                        h.post('/polar/common/listarproductoahorro')
                                                .success(function (data) {
                                                    s.productoahorros = [];
                                                    $.each(data, function (index, value) {
                                                        s.productoahorros.push(JSON.parse(value));
                                                    });
                                                })
                                                .error(function (error) {
                                                    s.notificar('Notificacion', 'error', 'Error: ' + error);
                                                });
                                    }
                                    else {
                                        s.notificar('Notificacion', 'error', 'Ocurrió un error al registrar el producto ahorro');
                                    }
                                })
                                .error(function (error, status, headers, config) {
                                    s.notificar('Notificacion', 'error', 'Error: ' + error);
                                });
                    }
                };

                s.validationFormulario2 = {
                    rules: {
                        nombre: {
                            required: true
                        },
                        docSustentatorios: {
                            required: true
                        },
                        tipomoneda: {
                            required: true
                        },
                        tea: {
                            required: true
                        },
                        inicioFechaVigencia: {
                            required: true
                        },
                        finFechaVigencia: {
                            required: true
                        },
                        frecuenciaaporte: {
                            required: true
                        },
                        montoMinimo: {
                            required: true
                        },
                        montoMaximo: {
                            required: true
                        },
                        montoInscripcion: {
                            required: true
                        },
                        montoCarnet: {
                            required: true
                        }
                    },
                    messages: {
                        nombre: {
                            required: "Campo obligatorio"
                        },
                        docSustentatorios: {
                            required: "Campo obligatorio"
                        },
                        tipomoneda: {
                            required: "Campo obligatorio"
                        },
                        tea: {
                            required: "Campo obligatorio"
                        },
                        inicioFechaVigencia: {
                            required: "Campo obligatorio"
                        },
                        finFechaVigencia: {
                            required: "Campo obligatorio"
                        },
                        frecuenciaaporte: {
                            required: "Campo obligatorio"
                        },
                        montoMinimo: {
                            required: "Campo obligatorio"
                        },
                        montoMaximo: {
                            required: "Campo obligatorio"
                        },
                        montoInscripcion: {
                            required: "Campo obligatorio"
                        },
                        montoCarnet: {
                            required: "Campo obligatorio"
                        }
                    }
                };

                s.registrarProductoah = function (form) {
                    if (form.validate()) {
                        h.post("/polar/administracion/productoahorro", s.productoahorro)
                                .success(function (data, status, headers, config) {
                                    if (data === 1) {
                                        s.notificar('Notificacion', 'success', 'Se ha registrado correctamente el producto ahorro');
                                        h.post('/polar/common/listarproductoahorro')
                                                .success(function (data) {
                                                    s.productoahorros = [];
                                                    $.each(data, function (index, value) {
                                                        s.productoahorros.push(JSON.parse(value));
                                                    });
                                                })
                                                .error(function (error) {
                                                    s.notificar('Notificacion', 'error', 'Error: ' + error);
                                                });
                                    }
                                    else {
                                        s.notificar('Notificacion', 'error', 'Ocurrió un error al registrar el producto ahorro');
                                    }
                                })
                                .error(function (error, status, headers, config) {
                                    s.notificar('Notificacion', 'error', 'Error: ' + error);
                                });
                    }
                };

                s.eliminarproductoahorro = function (dato) {
                    dato.inicioFechaVigencia = null;
                    dato.finFechaVigencia = null;
                    h.post("/polar/administracion/eliminarproductoahorro", dato)
                            .success(function (data, status, headers, config) {
                                if (data === 1) {
                                    s.notificar('Notificacion', 'success', 'eliminado correctamente');
                                    h.post('/polar/common/listarproductoahorro')
                                            .success(function (data) {
                                                s.productoahorros = [];
                                                $.each(data, function (index, value) {
                                                    s.productoahorros.push(JSON.parse(value));
                                                });
                                            })
                                            .error(function (error) {
                                                s.notificar('Notificacion', 'error', 'Error: ' + error);
                                            });
                                }
                                else {
                                    s.notificar('Notificacion', 'error', 'Ocurrió un error al eliminar producto ahorro');
                                }
                            })
                            .error(function (error, status, headers, config) {
                                s.notificar('Notificacion', 'error', 'Error: ' + status);
                            });

                };
                
                s.modificarproductoahorro= function (dato){
                    s.productoahorro2= dato;
                    
                    if(s.productoahorro2.tipoahorro.id===1){
                        $("#myModal").modal('show');
                    }
                    else{
                        $("#myModal2").modal('show');
                    }
                };
            }
        ]);


