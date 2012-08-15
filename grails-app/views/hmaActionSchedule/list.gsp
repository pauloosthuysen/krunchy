<%@ page import="pho.homeautomation.HmaActionSchedule" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'hmaActionSchedule.label', default: 'HmaActionSchedule')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <style type="text/css">
    #logoutPanel {
        margin: 30px;
    }
    </style>
</head>

<body>
<a href="#list-hmaActionSchedule" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                        default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><a class="hma" href="${createLink(uri: '/hma')}"><g:message code="default.hma.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-hmaActionSchedule" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="name"
                              title="${message(code: 'hmaActionSchedule.name.label', default: 'Name')}"/>

            <g:sortableColumn property="url" title="${message(code: 'hmaActionSchedule.url.label', default: 'Url')}"/>

            <g:sortableColumn property="effectiveDate"
                              title="${message(code: 'hmaActionSchedule.effectiveDate.label', default: 'Effective Date')}"/>

            <g:sortableColumn property="endDate"
                              title="${message(code: 'hmaActionSchedule.endDate.label', default: 'End Date')}"/>

            <g:sortableColumn property="execTimeH"
                              title="${message(code: 'hmaActionSchedule.execTimeH.label', default: 'Exec Time H')}"/>

            <g:sortableColumn property="execTimeM"
                              title="${message(code: 'hmaActionSchedule.execTimeM.label', default: 'Exec Time M')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${hmaActionScheduleInstanceList}" status="i" var="hmaActionScheduleInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${hmaActionScheduleInstance.id}">${fieldValue(bean: hmaActionScheduleInstance, field: "name")}</g:link></td>

                <td>${fieldValue(bean: hmaActionScheduleInstance, field: "url")}</td>

                <td><g:formatDate date="${hmaActionScheduleInstance.effectiveDate}"/></td>

                <td><g:formatDate date="${hmaActionScheduleInstance.endDate}"/></td>

                <td>${fieldValue(bean: hmaActionScheduleInstance, field: "execTimeH")}</td>

                <td>${fieldValue(bean: hmaActionScheduleInstance, field: "execTimeM")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${hmaActionScheduleInstanceTotal}"/>
    </div>
    <div id="logoutPanel">
        <g:render template="/logoutPanel"/>
    </div>
</div>


</body>
</html>
