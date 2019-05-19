<div class="col-md-3 left_col">
    <div class="left_col scroll-view">

        <div class="navbar nav_title" style="border: 0">
            <a href="${pageContext.request.contextPath}/home" class="site_title"><i class="fa icon-polar2"></i><span> POLAR!</span></a>
        </div>
        <div class="clearfix"></div>
        <div class="profile">
            <div class="profile_pic">
                <img src="${pageContext.request.contextPath}/assets/files/img/admin.jpg" alt="..." class="img-circle profile_img">
            </div>
            <div class="profile_info">
                <span>Bienvenido,</span>
                <h2>${user.empleado.persona.nombre} ${user.empleado.persona.apellidoPat}</h2>
            </div>
        </div>
        <br />
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <h3>${user.empleado.tipoempleado.nombre}</h3>
                <ul class="nav side-menu">
                    <li>
                        <a href="${pageContext.request.contextPath}/home">
                            <i class="fa fa-home"></i> Home 
                        </a>
                    </li>
                    <li>
                        <a><i class="fa fa-table"></i> Administracion <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu" style="display: none">
                            <li><a href="${pageContext.request.contextPath}/administracion/productocredito">Administrar producto credito</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/administracion/productoahorro">Administrar producto ahorro</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/administracion/admisioncredito">Admision de creditos</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/administracion/caja">Administracion de cajas</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/administracion/administrarusuario">Administracion de usuarios</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a><i class="fa fa-edit"></i> Admision <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu" style="display: none">
                            <li><a href="${pageContext.request.contextPath}/admision">Registrar cliente natural</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/admision/clientejuridico">Registrar cliente juridico</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/admision/persona">Registrar persona</a>
                            </li>
                        </ul>
                    </li>
                    <li><a><i class="fa fa-desktop"></i> Creditos <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu" style="display: none">
                            <li><a href="${pageContext.request.contextPath}/credito/cuentacredito">Crear cuenta credito</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/credito/seguimiento">Seguimiento cuenta credito</a>
                            </li>
                        </ul>
                    </li>
                    <li><a><i class="fa fa-archive"></i> Ahorros <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu" style="display: none">
                            <li><a href="${pageContext.request.contextPath}/ahorro/cuentaahorro">Crear cuenta ahorro</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/ahorro/seguimiento">Seguimiento cuenta ahorro</a>
                            </li>
                        </ul>
                    </li>
                    <li><a><i class="fa fa-gears"></i> Operaciones <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu" style="display: none">
                            <li><a href="${pageContext.request.contextPath}/operaciones/bobeda">Administracion de bobeda</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/operaciones/comprobante">Registrar comprobante</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/operaciones/transaccioncajero">Transacciones en caja</a>
                            </li>
                        </ul>
                    </li>
                    <li><a><i class="fa fa-bar-chart-o"></i> Reportes <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu" style="display: none">
                            <li><a href="${pageContext.request.contextPath}/resumen/carteramorosa">Reporte cartera morosa</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/resumen/reportecreditos">Reporte creditos otorgados</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /sidebar menu -->

        <!-- /menu footer buttons -->
        <div class="sidebar-footer hidden-small">
            <a data-toggle="tooltip" data-placement="top" title="Configuraciones">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Pantalla completa">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Bloquear">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
            </a>
            <a href="${pageContext.request.contextPath}/home/salir" data-toggle="tooltip" data-placement="top" title="Salir">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
            </a>
        </div>
    </div>
</div>
