angular.module("operacionesModule", ['ngValidate'])
        .controller("transaccionesController", ["$scope", "$http", function (s, h) {
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

                s.opcionPagos = [
                    {id: 0, denominacion: "PAGO POR CUOTAS"},
                    {id: 1, denominacion: "PAGO RAPIDO"}
                ];

                s.opcionPago = s.opcionPagos[0];

                s.opcionClientes = [
                    {id: 0, denominacion: "SELECCIONAR"},
                    {id: 1, denominacion: "PERSONA NATURAL"},
                    {id: 2, denominacion: "PERSONA JURIDICA"}
                ];
                s.opcionCliente = s.opcionClientes[0];

                s.clienteb = {};
                s.cliente = {};

                s.cuentaahorrospf = [];
                s.cuentaahorrosah = [];

                s.personanaturals = [];
                s.transaccions = [];

                s.codigoCliente = 'CC-000000';


                //VARIABLES PARA PAGO FACIL
                s.operacion = {};
                s.operacion.transaccion = {};

                s.cuentaahorrospfcs = [];


                h.post('/polar/operaciones/listatransaccion')
                        .success(function (data) {
                            s.transaccions = [];
                            $.each(data, function (index, value) {
                                s.transaccions.push(JSON.parse(value));
                            });
                        })
                        .error(function (error) {
                            s.notificar('Notificacion', 'error', 'Error: ' + error);
                        });

                s.listarTransaccions = function () {
                    h.post('/polar/operaciones/listatransaccion')
                            .success(function (data) {
                                s.transaccions = [];
                                $.each(data, function (index, value) {
                                    s.transaccions.push(JSON.parse(value));
                                });
                            })
                            .error(function (error) {
                                s.notificar('Notificacion', 'error', 'Error: ' + error);
                            });
                };

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

                s.seleccionar = function (personanatural) {
                    s.cliente = personanatural.cliente;
                    s.cliente.fechaInscripcion = null;

                    s.nombreCliente = personanatural.persona.nombre + ' ' + personanatural.persona.apellidoPat + ' ' + personanatural.persona.apellidoMat;
                    s.codigoCliente = personanatural.cliente.codigo;

                    $("#modalCliente").modal('hide');
                };

                s.validateCuentaahorro = {
                    rules: {
                        nombreCliente: {
                            required: true
                        }
                    },
                    messages: {
                        nombreCliente: {
                            required: "Campo obligatorio"
                        }
                    }
                };

                s.seleccionarpn = function (personanatural) {
                    s.operacion.transaccion.cliente = personanatural.cliente;
                    s.operacion.transaccion.nombrecliente = personanatural.persona.nombre + ' ' + personanatural.persona.apellidoPat + ' ' + personanatural.persona.apellidoMat;

                    $("#modalCliente2").modal('hide');
                };

                s.actalizarlistaCuentaahorro = function () {
                    s.cuentaahorrospf = [];
                    s.cuentaahorrosah = [];

                    h.post('/polar/ahorro/listarcpf', s.cliente)
                            .success(function (data) {
                                s.cuentaahorrospf = [];
                                $.each(data, function (index, value) {
                                    s.cuentaahorrospf.push(JSON.parse(value));
                                });
                            })
                            .error(function (error) {
                                s.notificar('Notificacion', 'error', 'Error: ' + error);
                            });

                    h.post('/polar/ahorro/listarcah', s.cliente)
                            .success(function (data) {
                                s.cuentaahorrosah = [];
                                $.each(data, function (index, value) {
                                    s.cuentaahorrosah.push(JSON.parse(value));
                                });
                            })
                            .error(function (error) {
                                s.notificar('Notificacion', 'error', 'Error: ' + error);
                            });
                };

                s.listarCuentaahorro = function () {
                    s.cuentaahorrospf = [];
                    s.cuentaahorrosah = [];

                    h.post('/polar/ahorro/listarcpf', s.cliente)
                            .success(function (data) {
                                if (data.length === 0) {
                                    s.notificar('Notificacion', 'info', 'No hay cuentas de ahorro a plazo fijo registrados');
                                } else {
                                    s.cuentaahorrospf = [];
                                    $.each(data, function (index, value) {
                                        s.cuentaahorrospf.push(JSON.parse(value));
                                    });
                                }
                            })
                            .error(function (error) {
                                s.notificar('Notificacion', 'error', 'Error: ' + error);
                            });

                    h.post('/polar/ahorro/listarcah', s.cliente)
                            .success(function (data) {
                                if (data.length === 0) {
                                    s.notificar('Notificacion', 'info', 'No hay aportes de cuentas ahorro pendientes de pago');
                                } else {
                                    s.cuentaahorrosah = [];
                                    $.each(data, function (index, value) {
                                        s.cuentaahorrosah.push(JSON.parse(value));
                                    });
                                }
                            })
                            .error(function (error) {
                                s.notificar('Notificacion', 'error', 'Error: ' + error);
                            });
                };

                s.buscarCuentaahorro = function (form) {
                    if (form.validate()) {
                        s.listarCuentaahorro();
                    }
                };

                s.aperturarah = function (aporte) {
                    h.post('/polar/ahorro/aperturarah', aporte)
                            .success(function (data) {
                                if (data === 1) {
                                    s.notificar('Notificacion', 'success', 'Se ha realizado correctamente la transaccion, revice su RECIBO en la session TRANSACCION');
                                    s.actalizarlistaCuentaahorro();
                                    s.listarTransaccions();
                                }
                                else {
                                    s.notificar('Notificacion', 'error', 'Error al procesar la transaccion');
                                }
                            })
                            .error(function (error) {
                                s.notificar('Notificacion', 'error', 'Error: ' + error);
                            });
                };

                s.cobrarah = function (aporte) {
                    h.post('/polar/ahorro/cobrarah', aporte)
                            .success(function (data) {
                                if (data === 1) {
                                    s.notificar('Notificacion', 'success', 'Se ha realizado correctamente la transaccion, revice su RECIBO en la session TRANSACCION');
                                    s.actalizarlistaCuentaahorro();
                                    s.listarTransaccions();
                                }
                                else {
                                    s.notificar('Notificacion', 'error', 'Error al procesar la transaccion');
                                }
                            })
                            .error(function (error) {
                                s.notificar('Notificacion', 'error', 'Error: ' + error);
                            });
                };

                s.aperturarpf = function (cuentaahorro) {
                    h.post('/polar/ahorro/aperturarpf', cuentaahorro)
                            .success(function (data) {
                                if (data === 1) {
                                    s.notificar('Notificacion', 'success', 'Se ha realizado correctamente la transaccion, revice su RECIBO en la session TRANSACCION');
                                    s.actalizarlistaCuentaahorro();
                                    s.listarTransaccions();
                                }
                                else {
                                    s.notificar('Notificacion', 'error', 'Error al procesar la transaccion');
                                }
                            })
                            .error(function (error) {
                                s.notificar('Notificacion', 'error', 'Error: ' + error);
                            });
                };

                //FUNCIONES DE PAGO DE CUOTAS FACIL
                s.listarcuentaspfb = function (cliente) {
                    s.cuentaahorrospfcs = [];
                    h.post('/polar/operaciones/buscarcuentasporpagar', cliente)
                            .success(function (data) {
                                $.each(data, function (index, value) {
                                    s.cuentaahorrospfcs.push(JSON.parse(value));
                                });

                                if (s.cuentaahorrospfcs.length <= 0) {
                                    s.notificar('Notificacion', 'info', 'No se encontraron registros de pagos pendientes para este el cliente');
                                }
                            })
                            .error(function (error) {
                                s.notificar('Notificacion', 'error', 'Error: ' + error);
                            });
                };

                s.validatepfb = {
                    rules: {
                        nombreCliente: {
                            required: true
                        }
                    },
                    messages: {
                        nombreCliente: {
                            required: "Campo obligatorio"
                        }
                    }
                };

                s.buscarpfb = function (form) {
                    if (form.validate()) {
                        s.listarcuentaspfb(s.operacion.transaccion.cliente);
                    }
                };

                s.registrarPagopf = function (cuentaahorrospfc) {
                    if (s.operacion.total > 0) {
                        if (s.operacion.total > cuentaahorrospfc.total) {
                            s.notificar('Notificacion', 'warning', 'Error: el monto ingresado supera el monto de pago pendiente');
                        }
                        else {
                            s.operacion.cuentacredito = cuentaahorrospfc.cuentaCredito;

                            h.post('/polar/operaciones/pagofacilcuentacredito', {cuentacredito: {id: cuentaahorrospfc.id}, operacion: s.operacion})
                                    .success(function (data) {
                                        if (data === 1) {
                                            s.notificar('Notificacion', 'success', 'Se ha realizado correctamente la transaccion, revice su RECIBO en la session TRANSACCION');
                                            s.listarTransaccions();

                                            s.listarcuentaspfb(s.operacion.transaccion.cliente);
                                        }
                                        else {
                                            if (data === 2) {
                                                s.notificar('Notificacion', 'error', 'La caja se encuentra cerrada');
                                            }
                                            else {
                                                s.notificar('Notificacion', 'error', 'Error al procesar la transaccion');
                                            }
                                        }
                                    })
                                    .error(function (error) {
                                        s.notificar('Notificacion', 'error', 'Error: ' + error);
                                    });
                        }
                    }
                    else {
                        s.notificar('Notificacion', 'warning', 'Error: complete el campo monto a pagar');
                    }
                };
            }
        ])
        .controller("comprobanteController", ["$scope", "$http", function (s, h) {
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

                s.opcionClientes = [
                    {id: 0, denominacion: "SELECCIONAR"},
                    {id: 1, denominacion: "PERSONA NATURAL"},
                    {id: 2, denominacion: "PERSONA JURIDICA"}
                ];
                s.opcionCliente = s.opcionClientes[0];

                s.comprobantes = [];
                s.monedas = [];
                s.agencias = [];
                s.naturalezacomprobantes = [];
                s.tipodocumentos = [];
                s.personanaturals = [];
                s.personajuridicas = [];

                s.detallecomprobantes = [];

                s.clienteb = {};
                s.personaj = {};

                s.comprobante = {};
                s.comprobante.cliente = {};
                s.comprobante.cliente.codigo = 'CN-000000';
                s.detallecomprobante = {};

                h.post('/polar/operaciones/obtenercodigocomp')
                        .success(function (data) {
                            s.id = '0000' + data;
                        })
                        .error(function (error) {
                            s.notificar('Notificacion', 'error', 'Error: ' + error);
                        });

                h.post('/polar/operaciones/listarcomprobante')
                        .success(function (data) {
                            $.each(data, function (index, value) {
                                s.comprobantes.push(JSON.parse(value));
                            });
                        })
                        .error(function (error) {
                            s.notificar('Notificacion', 'error', 'Error: ' + error);
                        });

                h.post('/polar/common/listartipomoneda')
                        .success(function (data) {
                            $.each(data, function (index, value) {
                                s.monedas.push(JSON.parse(value));
                            });
                            s.comprobante.moneda = s.monedas[0];
                        })
                        .error(function (error) {
                            s.notificar('Notificacion', 'error', 'Error: ' + error);
                        });

                h.post('/polar/common/listaragencia')
                        .success(function (data) {
                            $.each(data, function (index, value) {
                                s.agencias.push(JSON.parse(value));
                            });
                            s.comprobante.agencia = s.agencias[0];
                        })
                        .error(function (error) {
                            s.notificar('Notificacion', 'error', 'Error: ' + error);
                        });


                h.post('/polar/common/listarnaturalezacomprobante')
                        .success(function (data) {
                            $.each(data, function (index, value) {
                                s.naturalezacomprobantes.push(JSON.parse(value));
                            });
                            s.comprobante.naturalezacomprobante = s.naturalezacomprobantes[0];
                        })
                        .error(function (error) {
                            s.notificar('Notificacion', 'error', 'Error: ' + error);
                        });

                h.post('/polar/common/listartipodocumento')
                        .success(function (data) {
                            $.each(data, function (index, value) {
                                s.tipodocumentos.push(JSON.parse(value));
                            });
                            s.detallecomprobante.tipodocumento = s.tipodocumentos[0];
                            s.detallecomprobante.descripcion = s.detallecomprobante.tipodocumento.denominacion + ' - ';
                        })
                        .error(function (error) {
                            s.notificar('Notificacion', 'error', 'Error: ' + error);
                        });

                s.listarComprobantes = function () {
                    s.comprobantes = [];
                    h.post('/polar/operaciones/listarcomprobante')
                            .success(function (data) {
                                $.each(data, function (index, value) {
                                    s.comprobantes.push(JSON.parse(value));
                                });
                            })
                            .error(function (error) {
                                s.notificar('Notificacion', 'error', 'Error: ' + error);
                            });
                };

                s.obtenerCodigo = function () {
                    h.post('/polar/operaciones/obtenercodigocomp')
                            .success(function (data) {
                                s.id = '0000' + data;
                            })
                            .error(function (error) {
                                s.notificar('Notificacion', 'error', 'Error: ' + error);
                            });
                };

                s.listarPersonanatural = function (tipo) {
                    s.clienteb.id = tipo;
                    s.personanaturals = [];
                    h.post('/polar/common/listarpersonanatural', s.clienteb)
                            .success(function (data) {
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

                s.seleccionarpn = function (personanatural) {
                    s.comprobante.cliente = personanatural.cliente;

                    s.nombreCliente = personanatural.persona.nombre + ' ' + personanatural.persona.apellidoPat + ' ' + personanatural.persona.apellidoMat;

                    $("#modalBuscarcliente").modal('hide');
                };

                s.seleccionarpj = function (personajuridica) {
                    s.comprobante.cliente = personajuridica.cliente;

                    s.nombreCliente = personajuridica.razonSocial;

                    $("#modalBuscarcliente").modal('hide');
                };

                s.validate = {
                    rules: {
                        nombreCliente: {
                            required: true
                        },
                        agencia: {
                            required: true
                        },
                        moneda: {
                            required: true
                        },
                        naturalezaComprobante: {
                            required: true
                        },
                        glosa: {
                            required: true
                        }
                    },
                    messages: {
                        nombreCliente: {
                            required: "Campo obligatorio"
                        },
                        agencia: {
                            required: "Campo obligatorio"
                        },
                        moneda: {
                            required: "Campo obligatorio"
                        },
                        naturalezaComprobante: {
                            required: "Campo obligatorio"
                        },
                        glosa: {
                            required: "Campo obligatorio"
                        }
                    }
                };

                s.validatedtc = {
                    rules: {
                        tipodocumento: {
                            required: true
                        },
                        descripcion: {
                            required: true
                        },
                        monto: {
                            required: true
                        }
                    },
                    messages: {
                        tipodocumento: {
                            required: "Campo obligatorio"
                        },
                        descripcion: {
                            required: "Campo obligatorio"
                        },
                        monto: {
                            required: "Campo obligatorio"
                        }
                    }
                };

                s.crearComprobante = function (form) {
                    if (form.validate()) {

                        s.comprobante.moneda = s.comprobante.moneda.denominacion;
                        $.each(s.detallecomprobantes, function (index, value) {
                            value.comprobante = s.comprobante;
                        });

                        h.post('/polar/operaciones/comprobante', s.detallecomprobantes)
                                .success(function (data) {
                                    if (data === 0) {
                                        s.notificar("Notificacion", "error", "Error, se produjo un error al registrar los datos");
                                    } else {
                                        if (data === 2) {
                                            s.notificar("Notificacion", "info", "Error, no se ha agregado el detalle de comprobante.");
                                        } else {
                                            s.notificar("Notificacion", "success", "Los datos se han regitrado correctamente");

                                            s.comprobante = {};
                                            s.comprobante.cliente = {};
                                            s.comprobante.agencia = s.agencias[0];
                                            s.comprobante.naturalezacomprobante = s.naturalezacomprobantes[0];
                                            s.comprobante.moneda = s.monedas[0];
                                            s.comprobante.cliente.codigo = 'CN-000000';

                                            s.nombreCliente = '';

                                            s.detallecomprobante = {};
                                            s.detallecomprobante.tipodocumento = s.tipodocumentos[0];

                                            s.detallecomprobantes = [];

                                            s.listarComprobantes();
                                            s.obtenerCodigo();
                                        }
                                    }
                                })
                                .error(function (error) {
                                    s.notificar('Notificacion', 'error', 'Error: ' + error);
                                });
                    }
                };

                s.quitarComprobante = function (comprobante) {
                    h.post('/polar/operaciones/quitarcomprobante', {id: comprobante.id})
                            .success(function (data) {
                                if (data === 0) {
                                    s.notificar("Notificacion", "error", "Error al eliminar el comprobante");
                                }
                                else {
                                    if (data === 2) {
                                        s.notificar("Notificacion", "error", "Error al eliminar el comprobante, debido a que se tiene una transaccion asociada a ella.");
                                    }
                                    else {
                                        s.notificar("Notificacion", "success", "El comprobante se elimino correctamente");
                                        s.listarComprobantes();
                                    }
                                }
                            })
                            .error(function (error) {
                                s.notificar('Notificacion', 'error', 'Error: ' + error);
                            });
                };

                s.registrardtc = function (form) {
                    if (form.validate()) {
                        s.detallecomprobante.id = s.detallecomprobantes.length;
                        s.detallecomprobantes.push(s.detallecomprobante);

                        s.detallecomprobante = {};
                        s.detallecomprobante.tipodocumento = s.tipodocumentos[0];
                        s.detallecomprobante.descripcion = s.detallecomprobante.tipodocumento.denominacion + ' - ';
                    }
                };

                s.quitardtc = function (detallecomprobante) {
                    var array = s.detallecomprobantes;

                    s.detallecomprobantes = [];
                    $.each(array, function (index, value) {
                        if (value.id !== detallecomprobante.id) {
                            value.id = index;
                            s.detallecomprobantes.push(value);
                        }
                    });
                };

                s.actualizarDescripcion = function () {
                    s.detallecomprobante.descripcion = s.detallecomprobante.tipodocumento.denominacion + ' - ';
                };
            }
        ]);


