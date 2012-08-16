<%@ page import="pho.budget.BudTransaction" %>



<div class="fieldcontain ${hasErrors(bean: budTransactionInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="budTransaction.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${budTransactionInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: budTransactionInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="budTransaction.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" value="${fieldValue(bean: budTransactionInstance, field: 'amount')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: budTransactionInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="budTransaction.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${budTransactionInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: budTransactionInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="budTransaction.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
    <g:if test="${type}">
        <g:select id="category" name="category.id" from="${pho.budget.BudCategory.findAllWhere(type: pho.budget.BudTransactionType.findWhere(name: type))}" optionKey="id" required="" value="${budTransactionInstance?.category?.id}" class="many-to-one"/>
    </g:if><g:else>
        <g:select id="category" name="category.id" from="${pho.budget.BudCategory.list()}" optionKey="id" required="" value="${budTransactionInstance?.category?.id}" class="many-to-one"/>
    </g:else>
</div>

<div class="fieldcontain ${hasErrors(bean: budTransactionInstance, field: 'location', 'error')} ">
	<label for="location">
		<g:message code="budTransaction.location.label" default="Location" />
		
	</label>
	<g:select id="location" name="location.id" from="${pho.budget.BudLocation.list()}" optionKey="id" value="${budTransactionInstance?.location?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

