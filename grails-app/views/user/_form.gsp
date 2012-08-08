<%@ page import="pho.GlobalService; cr.co.arquetipos.crypto.Blowfish; pho.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${userInstance? Blowfish.decryptBase64(userInstance?.email, GlobalService.getDecryptionPassword()) : ''}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="password" maxlength="8" required="" value=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'isAdmin', 'error')} ">
	<label for="isAdmin">
		<g:message code="user.isAdmin.label" default="Is Admin" />
		
	</label>
	<g:checkBox name="isAdmin" value="${userInstance?.isAdmin}" />
</div>

