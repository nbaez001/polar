<div class="top_nav">
    <div class="nav_menu">
        <nav class="" role="navigation">
            <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
            </div>

            <ul class="nav navbar-nav navbar-right">
                <li class="">
                    <a href="#" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-user"></i> ${user.empleado.persona.nombre}
                        <span class=" fa fa-angle-down"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-usermenu animated fadeInDown pull-right">
                        <li><a href="${pageContext.request.contextPath}/home/perfil"> Perfil</a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/home/salir"><i class="fa fa-sign-out pull-right"></i> Salir</a>
                        </li>
                    </ul>
                </li>

                <li role="presentation" class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-envelope-o"></i>
                        <span class="badge bg-green" id="nroSolicitudes">1</span>
                    </a>
                    <ul id="menu1" class="dropdown-menu list-unstyled msg_list animated fadeInDown" role="menu">
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <i class="fa fa-2x fa-edit " style="color: blue"></i>
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>Notificaciones</strong>
                                        </h5>
                                        <span>
                                            <span>Fecha</span>
                                            <span class="time">2/2/2018</span>
                                        </span>
                                        <span class="message">
                                            Mensaje...
                                        </span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <div class="text-center">
                                <a href="listarPendientes">
                                    <strong>Ver todos</strong>
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</div>