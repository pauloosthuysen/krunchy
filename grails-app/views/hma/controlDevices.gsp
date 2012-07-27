<%--
  Created by IntelliJ IDEA.
  User: paul
  Date: 7/20/12
  Time: 3:32 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta name="layout" content="main"/>
  <title>Control Appliances</title>
  <style type="text/css">
      .content{
          margin: 10px;
      }
      #applianceTable{
          width: auto;
          border-top: none;
      }
      #applianceTable td{
          vertical-align: middle;
      }
      #applianceTable td img{
          cursor: pointer;
      }
  </style>
  <g:javascript library="jquery" />
</head>
<body>
    <script type="text/javascript">
        function toggleAppliance(code, obj){
            var val = 0;
            if(obj.getAttribute('src') == '<g:resource dir="images" file="poweroff.png"/>'){
                val = 1;
            }
            jQuery.ajax({
                type: 'get',
                data: {
                    secret: 'd65454df342qwed',
                    params: code + '=' + val
                },
                url: '${createLink(uri: '/hma/toggleAppliance')}',
                success: function(data){
                    if(val == 1){
                        obj.src = "<g:resource dir="images" file="poweron.png"/>";
                    }else{
                        obj.src = "<g:resource dir="images" file="poweroff.png"/>";
                    }
                }
            });
        }

        jQuery(document).ready(function(){
            jQuery.getJSON('${createLink(uri: '/hma/getAppliancesStatus.json')}',
                    {
                        secret: 'd65454df342qwed'
                    },
                    function(data){
                        $.each(data, function(key, e){
                            var o = jQuery('#' + e.name + "Appliance");
                            if(e.value == "1"){
                                o.attr('src', '<g:resource dir="images" file="poweron.png"/>');
                            }else{
                                o.attr('src', '<g:resource dir="images" file="poweroff.png"/>');
                            }
                        });
                    });
        });
    </script>
    <div class="nav" role="navigation">
        <ul>
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li><a class="hma" href="${createLink(uri: '/hma')}"><g:message code="default.hma.label"/></a></li>
        </ul>
    </div>

    <div class="content">
        <g:each in="${appCategories}" var="w">
            <div><h1>${w.name}</h1></div>
            <table id="applianceTable">
                <% def appliancesList = appliances.findAll{it.applianceCategory.name == w.name} %>
                <g:if test="${appliancesList.size() > 0}">
                    <g:each in="${appliancesList}" var="app" status="i">
                        <tr>
                            <td>${app.name}</td>
                            <td>
                                <img title="Toggle Appliance" id="${app.code}Appliance" src="<g:resource dir="images" file="poweroff.png"/>" alt="power" onclick="toggleAppliance('${app.code}', this);return false;"/>
                            </td>
                        </tr>
                    </g:each>
                </g:if><g:else>
                    <tr><td style="color:#ccc;font-style: italic;">{THERE ARE NO APPLIANCES TO DISPLAY}</td></tr>
                </g:else>
            </table>
        </g:each>
    </div>
</body>
</html>