<%@ page import="pho.homeautomation.HmaActionSchedule" %>



<div class="fieldcontain ${hasErrors(bean: hmaActionScheduleInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="hmaActionSchedule.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${hmaActionScheduleInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hmaActionScheduleInstance, field: 'url', 'error')} required">
	<label for="url">
		<g:message code="hmaActionSchedule.url.label" default="Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="url" required="" value="${hmaActionScheduleInstance?.url}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hmaActionScheduleInstance, field: 'effectiveDate', 'error')} required">
	<label for="effectiveDate">
		<g:message code="hmaActionSchedule.effectiveDate.label" default="Effective Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="effectiveDate" precision="day"  value="${hmaActionScheduleInstance?.effectiveDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: hmaActionScheduleInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="hmaActionSchedule.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${hmaActionScheduleInstance?.endDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: hmaActionScheduleInstance, field: 'execTimeH', 'error')} required">
	<label for="execTimeH">
		<g:message code="hmaActionSchedule.execTimeH.label" default="Exec Time H" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="execTimeH" type="number" min="0" max="23" value="${hmaActionScheduleInstance.execTimeH}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: hmaActionScheduleInstance, field: 'execTimeM', 'error')} required">
	<label for="execTimeM">
		<g:message code="hmaActionSchedule.execTimeM.label" default="Exec Time M" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="execTimeM" type="number" min="0" max="59" value="${hmaActionScheduleInstance.execTimeM}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: hmaActionScheduleInstance, field: 'repeatType', 'error')} required">
	<label for="repeatType">
		<g:message code="hmaActionSchedule.repeatType.label" default="Repeat Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="repeatType" name="repeatType.id" from="${pho.homeautomation.HmaActionScheduleRepeatTypes.list()}" optionKey="id" required="" value="${hmaActionScheduleInstance?.repeatType?.id}" class="many-to-one"/>
</div>