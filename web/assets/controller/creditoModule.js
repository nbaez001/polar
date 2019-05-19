angular.module("creditoModule", [])
        .controller("seguimientoController", ["$scope", "$http", function (s, h) {
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

                s.personanaturals = [];
                s.personajuridicas = [];

                s.cuentacreditos = [];
                s.garantes = [];

                s.codigoCliente = 'CC-000000';

                s.clientecn = {};
                s.clientecj = {};
                s.clientecn.id = 0;
                s.clientecj.id = 0;

                s.clienteb = {};
                s.personaj = {};
                s.cuentacredito = {};

                s.listarCuentacreditos = function (cliente) {
                    s.cuentacreditos = [];
                    h.post('/polar/credito/listarcuentascredito', cliente)
                            .success(function (data) {
                                $.each(data, function (index, value) {
                                    s.cuentacreditos.push(JSON.parse(value));
                                });

                                if (s.cuentacreditos.length <= 0) {
                                    s.notificar('Notificacion', 'info', 'No se encontraron registros de cuentas credito, para el cliente seleccionado');
                                }
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
                    s.codigoCliente = personanatural.cliente.codigo;
                    s.nombreCliente = personanatural.persona.nombre + ' ' + personanatural.persona.apellidoPat + ' ' + personanatural.persona.apellidoMat;

                    $("#modalBuscarcliente").modal('hide');

                    s.listarCuentacreditos(personanatural.cliente);
                };

                s.seleccionarpj = function (personajuridica) {
                    s.codigoCliente = personajuridica.cliente.codigo;
                    s.nombreCliente = personajuridica.razonSocial;

                    $("#modalBuscarcliente").modal('hide');

                    s.listarCuentacreditos(personajuridica.cliente);
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

                    $("#myTab li[class=active]").removeClass("active");
                    var tab = $("#profile-tab").parent();
                    tab.addClass("active");
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

                    $("#myTab li[class=active]").removeClass("active");
                    var tab = $("#profile-tab").parent();
                    tab.addClass("active");
                };
            }
        ]);


