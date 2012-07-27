<%@ page import="pho.homeautomation.HmaActionSchedule" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'hmaActionSchedule.label', default: 'HmaActionSchedule')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-hmaActionSchedule" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                        default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><a class="hma" href="${createLink(uri: '/hma')}"><g:message code="default.hma.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-hmaActionSchedule" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list hmaActionSchedule">

        <g:if test="${hmaActionScheduleInstance?.name}">
            <li class="fieldcontain">
                <span id="name-label" class="property-label"><g:message code="hmaActionSchedule.name.label"
                                                                        default="Name"/></span>

                <span class="property-value" aria-labelledby="name-label"><g:fieldValue
                        bean="${hmaActionScheduleInstance}" field="name"/></span>

            </li>
        </g:if>

        <g:if test="${hmaActionScheduleInstance?.url}">
            <li class="fieldcontain">
                <span id="url-label" class="property-label"><g:message code="hmaActionSchedule.url.label"
                                                                       default="Url"/></span>

                <span class="property-value" aria-labelledby="url-label"><g:fieldValue
                        bean="${hmaActionScheduleInstance}" field="url"/></span>

            </li>
        </g:if>

        <g:if test="${hmaActionScheduleInstance?.effectiveDate}">
            <li class="fieldcontain">
                <span id="effectiveDate-label" class="property-label"><g:message
                        code="hmaActionSchedule.effectiveDate.label" default="Effective Date"/></span>

                <span class="property-value" aria-labelledby="effectiveDate-label"><g:formatDate
                        date="${hmaActionScheduleInstance?.effectiveDate}"/></span>

            </li>
        </g:if>

        <g:if test="${hmaActionScheduleInstance?.endDate}">
            <li class="fieldcontain">
                <span id="endDate-label" class="property-label"><g:message code="hmaActionSchedule.endDate.label"
                                                                           default="End Date"/></span>

                <span class="property-value" aria-labelledby="endDate-label"><g:formatDate
                        date="${hmaActionScheduleInstance?.endDate}"/></span>

            </li>
        </g:if>

        <g:if test="${hmaActionScheduleInstance?.execTimeH}">
            <li class="fieldcontain">
                <span id="execTimeH-label" class="property-label"><g:message code="hmaActionSchedule.execTimeH.label"
                                                                             default="Exec Time H"/></span>

                <span class="property-value" aria-labelledby="execTimeH-label"><g:fieldValue
                        bean="${hmaActionScheduleInstance}" field="execTimeH"/></span>

            </li>
        </g:if>

        <g:if test="${hmaActionScheduleInstance?.execTimeM}">
            <li class="fieldcontain">
                <span id="execTimeM-label" class="property-label"><g:message code="hmaActionSchedule.execTimeM.label"
                                                                             default="Exec Time M"/></span>

                <span class="property-value" aria-labelledby="execTimeM-label"><g:fieldValue
                        bean="${hmaActionScheduleInstance}" field="execTimeM"/></span>

            </li>
        </g:if>

        <g:if test="${hmaActionScheduleInstance?.repeatType}">
            <li class="fieldcontain">
                <span id="repeatType-label" class="property-label"><g:message code="hmaActionSchedule.repeatType.label"
                                                                              default="Repeat Type"/></span>

                <span class="property-value" aria-labelledby="repeatType-label"><g:link
                        controller="hmaActionScheduleRepeatTypes" action="show"
                        id="${hmaActionScheduleInstance?.repeatType?.id}">${hmaActionScheduleInstance?.repeatType?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${hmaActionScheduleInstance?.lastRun}">
            <li class="fieldcontain">
                <span id="lastRun-label" class="property-label"><g:message code="hmaActionSchedule.lastRun.label"
                                                                           default="Last Run"/></span>

                <span class="property-value" aria-labelledby="lastRun-label"><g:formatDate
                        date="${hmaActionScheduleInstance?.lastRun}"/></span>

            </li>
        </g:if>

        <g:if test="${hmaActionScheduleInstance?.lastResponse}">
            <li class="fieldcontain">
                <span id="lastResponse-label" class="property-label"><g:message
                        code="hmaActionSchedule.lastResponse.label" default="Last Response"/></span>

                <span class="property-value" aria-labelledby="lastResponse-label"><g:fieldValue
                        bean="${hmaActionScheduleInstance}" field="lastResponse"/></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${hmaActionScheduleInstance?.id}"/>
            <g:link class="edit" action="edit" id="${hmaActionScheduleInstance?.id}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
