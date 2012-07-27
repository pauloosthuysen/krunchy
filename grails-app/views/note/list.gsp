<%@ page import="pho.Note" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'note.label', default: 'Note')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <style type="text/css">
        #logoutPanel{
            margin: 30px;
        }
    </style>
</head>

<body>
<a href="#list-note" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-note" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="name" title="${message(code: 'note.name.label', default: 'Name')}"/>

            <g:sortableColumn property="subject" title="${message(code: 'note.subject.label', default: 'Subject')}"/>

            <g:sortableColumn property="content" title="${message(code: 'note.content.label', default: 'Content')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${noteInstanceList}" status="i" var="noteInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${noteInstance.id}">${fieldValue(bean: noteInstance, field: "name")}</g:link></td>

                <td>${fieldValue(bean: noteInstance, field: "subject")}</td>

                <td>${fieldValue(bean: noteInstance, field: "content")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${noteInstanceTotal}"/>
    </div>
    <div id="logoutPanel">
        <g:render template="/logoutPanel"/>
    </div>
</div>
</body>
</html>