<%@ page import="pho.Note" %>



<div class="fieldcontain ${hasErrors(bean: noteInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="note.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${noteInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: noteInstance, field: 'subject', 'error')} ">
	<label for="subject">
		<g:message code="note.subject.label" default="Subject" />
		
	</label>
	<g:textField name="subject" value="${noteInstance?.subject}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: noteInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="note.content.label" default="Content" />
		
	</label>
	<g:textArea name="content" cols="40" rows="5" maxlength="300" value="${noteInstance?.content}"/>
</div>
<g:hiddenField name="user.id" value="${session.user.id}"/>