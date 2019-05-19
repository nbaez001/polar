angular.module("resumenModule", ['ngValidate'])
        .controller("carteramorosaController", ["$scope", "$http", function (s, h) {
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

                s.opcionclientes = [
                    {id: 1, nombre: 'REPORTE POR PRODUCTO CREDITO'},
                    {id: 2, nombre: 'REPORTE POR RANGO DE FECHAS'},
                    {id: 3, nombre: 'PERSONA NATURAL'},
                    {id: 4, nombre: 'PERSONA JURIDICA'}
                ];
                s.opcioncliente = s.opcionclientes[0];
                s.personab = {};
                s.personajuridicab = {};
                s.productocreditob = {};
                s.morosofechab = {};

                s.agencias = [];
                s.productocreditos = [];

                s.cuentamorosas = [];
                s.morosonaturals = [];
                s.morosojuridicos = [];
                s.morosofechas = [];
                s.morosopcs = [];



                h.post('/polar/resumen/listarcuentamorosa')
                        .success(function (data) {
                            $.each(data, function (index, value) {
                                s.cuentamorosas.push(JSON.parse(value));
                            });
                        })
                        .error(function (error) {
                            s.notificar('Notificacion', 'error', 'Error: ' + error);
                        });

                h.post('/polar/common/listarproductocredito')
                        .success(function (data) {
                            s.productocreditos.push({id: 0, nombre: 'TODOS'});
                            $.each(data, function (index, value) {
                                s.productocreditos.push(JSON.parse(value));
                            });
                            s.productocreditob = s.productocreditos[0];
                        })
                        .error(function (error) {
                            s.notificar('Notificacion', 'error', 'Error: ' + error);
                        });

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

                s.buscarMorosonatural = function (id) {
                    s.personab.id = id;

                    s.morosonaturals = [];
                    h.post('/polar/resumen/buscarmorosonatural', s.personab)
                            .success(function (data) {
                                $.each(data, function (index, value) {
                                    s.morosonaturals.push(JSON.parse(value));
                                });
                            })
                            .error(function (error) {
                                s.notificar('Notificacion', 'error', 'Error: ' + error);
                            });
                };

                s.buscarMorosojuridico = function (id) {
                    s.personajuridicab.id = id;

                    s.morosojuridicos = [];
                    h.post('/polar/resumen/buscarmorosojuridico', s.personajuridicab)
                            .success(function (data) {
                                $.each(data, function (index, value) {
                                    s.morosojuridicos.push(JSON.parse(value));
                                });
                            })
                            .error(function (error) {
                                s.notificar('Notificacion', 'error', 'Error: ' + error);
                            });
                };

                s.validatepc = {
                    rules: {
                        agencia: {
                            required: true
                        },
                        productoCredito: {
                            required: true
                        }
                    },
                    messages: {
                        agencia: {
                            required: "Campo obligatorio"
                        },
                        productoCredito: {
                            required: "Campo obligatorio"
                        }
                    }
                };

                s.validatefc = {
                    rules: {
                        fechaInicio: {
                            required: true
                        },
                        fechaFin: {
                            required: true
                        }
                    },
                    messages: {
                        fechaInicio: {
                            required: "Campo obligatorio"
                        },
                        fechaFin: {
                            required: "Campo obligatorio"
                        }
                    }
                };

                s.morosidadpc = function (form) {
                    if (form.validate()) {
                        s.morosopcs = [];
                        h.post('/polar/resumen/buscarmorosoproductocredito', s.productocreditob)
                                .success(function (data) {
                                    $.each(data, function (index, value) {
                                        s.morosopcs.push(JSON.parse(value));
                                    });
                                })
                                .error(function (error) {
                                    s.notificar('Notificacion', 'error', 'Error: ' + error);
                                });
                    }
                };

                s.morosidadfc = function (form) {
                    if (form.validate()) {
                        s.morosofechas = [];
                        h.post('/polar/resumen/buscarmorosoporfechas', s.morosofechab)
                                .success(function (data) {
                                    $.each(data, function (index, value) {
                                        s.morosofechas.push(JSON.parse(value));
                                    });
                                })
                                .error(function (error) {
                                    s.notificar('Notificacion', 'error', 'Error: ' + error);
                                });
                    }
                };
            }
        ]);


