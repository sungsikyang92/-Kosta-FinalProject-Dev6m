<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- Navbar - OPEN -->
    <nav class="navbar navbar-expand-lg fixed-top navbar-dark" id="navbar">

        <!-- Navbar content - OPEN -->
        <div class="container-lg">

            <!-- Logo - OPEN -->
            <a class="navbar-brand logo" href="/">
                <img src="${pageContext.request.contextPath}/resources/media/images/logo.png" width="80" alt="">
            </a>
            <!-- Logo - CLOSE -->

            <!-- Toogle responsive - OPEN -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggler" aria-controls="navbarToggler" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- Toogle responsive - CLOSE -->

            <!-- Content collapse - OPEN -->
            <div class="collapse navbar-collapse" id="navbarToggler">

                <!-- Left - OPEN -->
                <ul class="navbar-nav mr-auto my-2 my-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link navbar-nav-item" href="#">
                            홈<span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link navbar-nav-item" href="#">
                            TV프로그램
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link navbar-nav-item" href="#">
                            영화
                        </a>
                    </li>
                </ul>
                <!-- Left - CLOSE -->

                <!-- Right - OPEN -->
                <ul class="navbar-nav my-2 my-lg-0 navbar-right">
                    <li class="nav-item">
                        <a class="nav-link float-center" href="#">
                            <img src="${pageContext.request.contextPath}/resources/media/icons/search.png" width="20" alt="">
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link float-center" href="#">
                            <img src="${pageContext.request.contextPath}/resources/media/icons/bell.png" width="20" alt="">
                        </a>
                    </li>
                    <li class="nav-item avatar">
                        <a class="float-right" href="https://github.com/eduayme" target="_blank">
                            <img class="avatar" src="${pageContext.request.contextPath}/resources/media/icons/avatar.png" alt="">
                        </a>
                    </li>
                </ul>
                <!-- Right - OPEN -->

            </div>
            <!-- Content collapse - CLOSE -->

        </div>
        <!-- Navbar content - CLOSE -->

    </nav>
    <!-- Navbar - CLOSE -->