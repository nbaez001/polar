angular.module("ahorroCuentaahorroModule", ['ngValidate'])
        .controller("cuentaahorroController", ["$scope", "$http", function (s, h) {
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

                s.frecuenciaaportes = [];
                s.personanaturals = [];
                s.personajuridicas = [];
                s.productoahorros = [];
                s.tipomonedas = [];

                s.intereses = [];

                s.cuentaahorros = [];

                s.tem = 0;
                s.ted = 0;
                s.cuentaahorro = {};

                //PARA BUSQUEDAS
                s.opcionClientes = [
                    {id: 0, denominacion: "SELECCIONAR"},
                    {id: 1, denominacion: "PERSONA NATURAL"},
                    {id: 2, denominacion: "PERSONA JURIDICA"}
                ];
                s.opcionCliente = s.opcionClientes[0];

                s.clienteb = {};
                s.productoahorrob = {};

                h.post('/polar/common/listarfrecuenciaaporte')
                        .success(function (data) {
                            $.each(data, function (index, value) {
                                s.frecuenciaaportes.push(JSON.parse(value));
                            });
                            s.cuentaahorro.frecuenciaaporte = s.frecuenciaaportes[0];
                        })
                        .error(function (error) {
                            s.notificar('Notificacion', 'error', 'Error: ' + error);
                        });

                h.post('/polar/common/listartipomoneda')
                        .success(function (data) {
                            $.each(data, function (index, value) {
                                s.tipomonedas.push(JSON.parse(value));
                            });
                            s.productoahorrob.tipomoneda = s.tipomonedas[0];
                        })
                        .error(function (error) {
                            s.notificar('Notificacion', 'error', 'Error: ' + error);
                        });

                h.post('/polar/ahorro/obtenercodigoca')
                        .success(function (data) {
                            s.cuentaahorro.codigo = 'CA-00' + data;
                        })
                        .error(function (error) {
                            s.notificar('Notificacion', 'error', 'Error: ' + error);
                        });

                s.listarPersonanatural = function (tipo) {
                    s.clienteb.id = tipo;
                    h.post('/polar/common/listarpersonanatural', s.clienteb)
                            .success(function (data) {
                                s.personanaturals = [];
                                $.each(data, function (index, value) {
                                    s.personanaturals.push(JSON.parse(value));
                                });
                            })
                            .error(function (error) {
                                s.notificar('Notificacion', 'error', 'Error: ' + error);
                            });
                };

                s.listarPersonajuridica = function (tipo) {
                    s.personaj.id = tipo;

                    s.personajuridicas = [];
                    h.post('/polar/common/listarpersonajuridica', s.personaj)
                            .success(function (data) {
                                $.each(data, function (index, value) {
                                    s.personajuridicas.push(JSON.parse(value));
                                });
                            })
                            .error(function (error) {
                                s.notificar('Notificacion', 'error', 'Error: ' + error);
                            });
                };

                s.listarProductoahorro = function () {
                    h.post('/polar/common/listarproductoahorros', s.productoahorrob)
                            .success(function (data) {
                                s.productoahorros = [];
                                $.each(data, function (index, value) {
                                    s.productoahorros.push(JSON.parse(value));
                                });
                            })
                            .error(function (error) {
                                s.notificar('Notificacion', 'error', 'Error: ' + error);
                            });
                };

                s.listarCuentaahorros = function (cliente) {
                    h.post('/polar/ahorro/listarcuentaahorro', cliente)
                            .success(function (data) {
                                s.cuentaahorros = [];
                                $.each(data, function (index, value) {
                                    s.cuentaahorros.push(JSON.parse(value));
                                });
                            })
                            .error(function (error) {
                                s.notificar('Notificacion', 'error', 'Error: ' + error);
                            });
                };

                s.opcionBusquedacliente = function () {
                    if (s.opcionCliente.id === 1) {
                        $("#opcionPersonanatural").removeAttr('hidden');
                        $("#opcionPersonajuridica").attr({hidden: true});
                    }
                    else {
                        if (s.opcionCliente.id === 2) {
                            $("#opcionPersonajuridica").removeAttr('hidden');
                            $("#opcionPersonanatural").attr({hidden: true});
                        }
                        else {
                            $("#opcionPersonanatural").attr({hidden: true});
                            $("#opcionPersonajuridica").attr({hidden: true});
                        }
                    }
                };

                s.obtenerCodigo = function () {
                    h.post('/polar/ahorro/obtenercodigoca')
                            .success(function (data) {
                                s.cuentaahorro.codigo = 'CA-00' + data;
                            })
                            .error(function (error) {
                                s.notificar('Notificacion', 'error', 'Error: ' + error);
                            });
                };

                s.seleccionarpn = function (personanatural) {
                    s.cuentaahorro.cliente = personanatural.cliente;
                    s.cuentaahorro.cliente.fechaInscripcion = null;

                    s.nombreCliente = personanatural.persona.nombre + ' ' + personanatural.persona.apellidoPat + ' ' + personanatural.persona.apellidoMat;

                    $("#modalBuscarcliente").modal('hide');

                    s.listarCuentaahorros(personanatural.cliente);
                };
                
                s.seleccionarpj = function (personajuridica) {
                    s.cuentaahorro.cliente = personajuridica.cliente;
                    s.cuentaahorro.cliente.fechaInscripcion = null;

                    s.nombreCliente = personajuridica.razonSocial;

                    $("#modalBuscarcliente").modal('hide');

                    s.listarCuentaahorros(personajuridica.cliente);
                };

                s.seleccionarph = function (productoahorro) {
                    s.cuentaahorro.productoahorro = productoahorro;
                    s.cuentaahorro.tea = productoahorro.tea;
                    s.cuentaahorro.tipomoneda = productoahorro.tipomoneda;
                    s.cuentaahorro.productoahorro.inicioFechaVigencia = null;
                    s.cuentaahorro.productoahorro.finFechaVigencia = null;

                    s.intereses = [];

                    $("#modalBuscarproductoahorro").modal('hide');

                    s.tem = (Math.pow((1 + productoahorro.tea), (1 / 12)) - 1);
                    s.ted = (Math.pow((1 + productoahorro.tea), (1 / 360)) - 1);

                    if (s.cuentaahorro.productoahorro.tipoahorro.id === 1) {
                        s.cuentaahorro.montoInscripcion = null;
                        s.cuentaahorro.montoCarnet = null;
                        s.cuentaahorro.frecuenciaaporte = null;
                        //DEPOSITO PLAZO FIJO

                        var settings = $('form[name=formulariopf]').validate().settings;
                        settings.rules.importe = {required: true, min: parseFloat(productoahorro.montoMinimo), max: parseFloat(productoahorro.montoMaximo)};
                        settings.rules.periodo = {required: true, min: parseInt(productoahorro.periodoMinimo), max: parseInt(productoahorro.periodoMaximo)};
                        settings.rules.fechaApertura = {required: true};

                        settings.messages.importe = {required: "Campo obligatorio", min: "El monto debe estar entre " + productoahorro.montoMinimo + " y " + productoahorro.montoMaximo, max: "El monto debe estar entre " + productoahorro.montoMinimo + " y " + productoahorro.montoMaximo};
                        settings.messages.periodo = {required: "Campo obligatorio", min: "El periodo debe estar entre " + productoahorro.periodoMinimo + " y " + productoahorro.periodoMaximo, max: "El periodo debe estar entre " + productoahorro.periodoMinimo + " y " + productoahorro.periodoMaximo};
                        settings.messages.fechaApertura = {required: "Campo obligatorio"};

                        $("#plazofijo").removeAttr("hidden");
                        $("#ahorro").attr("hidden", "true");
                        $("#plazofijobtn").removeAttr("hidden");
                        $("#ahorrobtn").attr("hidden", "true");
                    }
                    else {
                        s.cuentaahorro.periodo = null;
                        s.cuentaahorro.interesProyectado = null;
                        s.cuentaahorro.montoInscripcion = productoahorro.montoInscripcion;
                        s.cuentaahorro.montoCarnet = productoahorro.montoCarnet;
                        s.cuentaahorro.frecuenciaaporte = productoahorro.frecuenciaaporte;

                        var settings = $('form[name=formularioah]').validate().settings;
                        settings.rules.importe = {required: true, min: parseFloat(productoahorro.montoMinimo), max: parseFloat(productoahorro.montoMaximo)};
                        settings.rules.frecuenciaaporte = {required: true};
                        settings.rules.montoCarnet = {required: true};
                        settings.rules.montoInscripcion = {required: true};
                        settings.rules.fechaApertura = {required: true};

                        settings.messages.importe = {required: "Campo obligatorio", min: "El monto debe estar entre " + productoahorro.montoMinimo + " y " + productoahorro.montoMaximo, max: "El monto debe estar entre " + productoahorro.montoMinimo + " y " + productoahorro.montoMaximo};
                        settings.messages.frecuenciaaporte = {required: "Campo obligatorio"};
                        settings.messages.montoCarnet = {required: "Campo obligatorio"};
                        settings.messages.montoInscripcion = {required: "Campo obligatorio"};
                        settings.messages.fechaApertura = {required: "Campo obligatorio"};

                        $("#ahorro").removeAttr("hidden");
                        $("#plazofijo").attr("hidden", "true");
                        $("#ahorrobtn").removeAttr("hidden");
                        $("#plazofijobtn").attr("hidden", "true");
                    }
                };

                s.registrarpf = function (form) {
                    if (form.validate()) {
                        h.post('/polar/ahorro/registrarcuentaahorropf', s.cuentaahorro)
                                .success(function (data) {
                                    if (data === 1) {
                                        s.cuentaahorro.importe = null;
                                        s.cuentaahorro.periodo = null;
                                        s.cuentaahorro.fechaApertura = null;
                                        s.cuentaahorro.interesProyectado = null;
                                        s.obtenerCodigo();
                                        s.listarCuentaahorros(s.cuentaahorro.cliente);

                                        s.notificar('Notificacion', 'success', 'Se registro correctamente la cuenta de ahorro');
                                    } else {
                                        s.notificar('Notificacion', 'error', 'Error al registrar la cuenta de ahorro');
                                    }
                                })
                                .error(function (error) {
                                    s.notificar('Notificacion', 'error', 'Error: ' + error);
                                });
                    }
                };

                s.registrarah = function (form) {
                    if (form.validate()) {
                        h.post('/polar/ahorro/registrarcuentaahorroah', s.cuentaahorro)
                                .success(function (data) {
                                    if (data === 1) {
                                        s.cuentaahorro.importe = null;
                                        s.cuentaahorro.periodo = null;
                                        s.cuentaahorro.fechaApertura = null;
                                        s.obtenerCodigo();
                                        s.listarCuentaahorros(s.cuentaahorro.cliente);

                                        s.notificar('Notificacion', 'success', 'Se registro correctamente la cuenta a plazo fijo');
                                    } else {
                                        s.notificar('Notificacion', 'error', 'Error al registrar la cuenta a plazo fijo');
                                    }
                                })
                                .error(function (error) {
                                    s.notificar('Notificacion', 'error', 'Error: ' + error);
                                });
                    }
                };

                s.calcularInteres = function (form) {
                    if (form.validate()) {
                        h.post('/polar/ahorro/calcularinteres', s.cuentaahorro)
                                .success(function (data) {
                                    s.intereses = [];

                                    var montot = 0.0;
                                    var interest = 0.0;
                                    $.each(data, function (index, value) {
                                        var json = JSON.parse(value);
                                        s.intereses.push(json);

                                        montot = parseFloat(json.monto) + parseFloat(json.interes);
                                        interest += parseFloat(json.interes);
                                    });

                                    s.intereses.push({numero: '', fecha: '', factor: 'TOTAL', monto: montot, interes: interest});

                                    s.cuentaahorro.interesProyectado = interest;
                                })
                                .error(function (error) {
                                    s.notificar('Notificacion', 'error', 'Error: ' + error);
                                });
                    }
                };

                s.eliminarCuentaahorro = function (cuentaahorro) {
                    h.post('/polar/ahorro/eliminarcuentaahorro', cuentaahorro)
                            .success(function (data) {
                                if (data === 1) {
                                    s.notificar('Notificacion', 'success', 'Se ha eliminado correctamente cuenta de ahorro');
                                    s.listarCuentaahorros(s.cuentaahorro.cliente);
                                } else {
                                    s.notificar('Notificacion', 'error', 'Error al eliminar la cuenta de ahorro');
                                }
                            })
                            .error(function (error) {
                                s.notificar('Notificacion', 'error', 'Error: ' + error);
                            });
                };
            }
        ]);


