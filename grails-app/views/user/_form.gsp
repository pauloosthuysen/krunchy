<%@ page import="pho.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${userInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="password" maxlength="8" required="" value="${userInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'isAdmin', 'error')} ">
	<label for="isAdmin">
		<g:message code="user.isAdmin.label" default="Is Admin" />
		
	</label>
	<g:checkBox name="isAdmin" value="${userInstance?.isAdmin}" />
</div>

