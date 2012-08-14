<%--
  Created by IntelliJ IDEA.
  User: oosthph1
  Date: 2012/07/25
  Time: 11:45 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta name="layout" content="main"/>
  <title>Budget</title>
  <style type="text/css">
    .menuItem{
        cursor:pointer;
        display:inline-block;
        margin-left: 10px;
        margin-top: 10px;
        margin-bottom: 10px;
    }
    .menuItem .img{
        display:block;
        width: 100px;
        height: 100px;
        background-color: transparent;
        background-repeat: no-repeat;
        background-position: center center;
    }
    .menuItem .label{
        display:block;text-align: center;width:100px;font-weight: bold;
    }
    #budCP{
        background: url('${resource(dir: "images", file: "menu_bg.png")}') #eee repeat-x;
        margin: 10px 0px 0px 0px;
    }
    #logoutPanel{
    margin: 30px;
    }
  </style>
</head>
<body>
    <div class="nav" role="navigation">
        <ul>
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        </ul>
    </div>
    <div class="content">
        <h1>Budget</h1>
        <g:if test="${menuItems}">
            <div id="budCP">
                <g:each in="${menuItems}" var="mi">
                    <span class="menuItem" onclick="window.location='${mi.component}';" title="${mi.name}">
                        <span class="img" style="background-image: url('${resource(dir: 'images/menuitems', file: mi.imgFilename)}');"></span>
                        <span class="label">${mi.name}</span>
                    </span>
                </g:each>
            </div>
        </g:if>
        <g:if test="${session.user}">
            <div id="logoutPanel">
                <g:render template="/logoutPanel"/>
            </div>
        </g:if>
    </div>
</body>
</html>