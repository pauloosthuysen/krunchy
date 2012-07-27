<%@ page import="pho.budget.BudLocation" %>

<g:javascript library="jquery-ui" />
<script type="text/javascript">
    $(function(){
        jQuery("#state").autocomplete({
            source: "${createLink(uri: '/budLocation/getExistingLocationInfo?type=state')}",
            autoFocus: true,
            minLength:2
        });
        jQuery("#city").autocomplete({
            source: "${createLink(uri: '/budLocation/getExistingLocationInfo?type=city')}",
            autoFocus: true,
            minLength:2
        });
        jQuery("#suburb").autocomplete({
            source: "${createLink(uri: '/budLocation/getExistingLocationInfo?type=suburb')}",
            autoFocus: true,
            minLength:2
        });
    });
</script>

<div class="fieldcontain ${hasErrors(bean: budLocationInstance, field: 'country', 'error')} required">
	<label for="country">
		<g:message code="budLocation.country.label" default="Country" />
		<span class="required-indicator">*</span>
	</label>
	<g:countrySelect name="country" value="${budLocationInstance?.country}" default="zaf"/>
</div>

<div class="fieldcontain ${hasErrors(bean: budLocationInstance, field: 'state', 'error')} required">
	<label for="state">
		<g:message code="budLocation.state.label" default="State" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="state" required="" value="${budLocationInstance?.state}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: budLocationInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="budLocation.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="city" required="" value="${budLocationInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: budLocationInstance, field: 'suburb', 'error')} required">
	<label for="suburb">
		<g:message code="budLocation.suburb.label" default="Suburb" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="suburb" required="" value="${budLocationInstance?.suburb}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: budLocationInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="budLocation.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${budLocationInstance?.description}"/>
</div>

