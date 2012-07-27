<%--
  Created by IntelliJ IDEA.
  User: oosthph1
  Date: 2012/07/17
  Time: 12:44 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta name="layout" content="main"/>
  <title>Home</title>
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
      #userCP{
          background: url('${resource(dir: "images", file: "menu_bg.png")}') #eee repeat-x;
          margin: 10px 0px 0px 0px;
      }
      #adminCP{
          background: url('${resource(dir: "images", file: "menu_bg.png")}') #eee repeat-x;
          margin: 10px 0px 0px 0px;
      }
      #introPar{
          margin: 10px;
      }
      #loginPanel{
          margin-left: 30px;
          margin-right: 30px;
      }
      #logoutPanel{
          margin: 30px;
      }
  </style>
</head>
<body>
    <div class="content">
        <h1>Welcome</h1>
        <p id="introPar">This is blah blah blah.</p>
        <g:if test="${adminMenuItems && session.user && session.user.isAdmin}">
            <h1>Administrator Control-Panel</h1>
            <div id="adminCP">
                <g:each in="${adminMenuItems}" var="mi">
                    <span class="menuItem" onclick="window.location='${mi.component}';" title="${mi.name}">
                        <span class="img" style="background-image: url('${resource(dir: 'images/menuitems', file: mi.imgFilename)}');"></span>
                        <span class="label">${mi.name}</span>
                    </span>
                </g:each>
            </div>
        </g:if>
        <g:if test="${userMenuItems && session.user}">
            <h1>User Control-Panel</h1>
            <div id="userCP">
                <g:each in="${userMenuItems}" var="mi">
                    <span class="menuItem" onclick="window.location='${mi.component}';" title="${mi.name}">
                        <span class="img" style="background-image: url('${resource(dir: 'images/menuitems', file: mi.imgFilename)}');"></span>
                        <span class="label">${mi.name}</span>
                    </span>
                </g:each>
            </div>
        </g:if>
        <g:if test="${!session.user}">
            <h1>Login</h1>
            <div id="loginPanel">
                <g:render template="/loginPanel"/>
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