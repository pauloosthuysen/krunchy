<%--
  Created by IntelliJ IDEA.
  User: paul
  Date: 2012/07/29
  Time: 2:28 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta name="layout" content="main"/>
  <title>Budget Overview</title>
  <style type="text/css">
      #overviewContent{
          padding: 10px;
      }
      #incomes{
          width: 440px;
          display: inline-block;
      }
      #expenses{
          width: 440px;
          display: inline-block;
          float: right;
      }
      .total{
          text-align: right;
          font-weight: bold;
          border-top: 5px double #eee;
      }
      .amount{
          text-align: right;
      }
      #dateSelector{
          text-align: right;
          padding: 0px 20px 0px 0px;
          font-weight: bold;
      }
      #summary{
          padding: 10px;
      }
      #summary div.total div{
          display: inline-block;
      }
      #summary div.total div.totValue{
          width: 250px;
      }
      #logoutPanel{
          margin: 30px;
      }
  </style>
</head>
<body>
    <div class="nav" role="navigation">
        <ul>
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li><a class="budget" href="${createLink(uri: '/bud')}"><g:message code="default.bud.label"/></a></li>
        </ul>
    </div>
    <div class="content">
        <h1>Overview</h1>
        <div id="dateSelector">
            <g:form controller="budOverview" action="index">
                <label>From: <g:datePicker name="fromDate" value="${fromDate}" precision="day" relativeYears="[-5..5]"/></label>
                <label>To: <g:datePicker name="toDate" value="${toDate}" precision="day" relativeYears="[-5..5]"/></label>
                <g:submitButton name="applyDatesButton" value="Set Filter"/>
            </g:form>
        </div>
        <div id="overviewContent">
            <div id="incomes">
                <h2>Income</h2>
                <table>
                    <tr>
                        <th>Date</th>
                        <th>Description</th>
                        <th>Amount</th>
                    </tr>
                    <g:each in="${incomes}" var="i">
                        <tr>
                            <td>${i.date.format("yyyy-MM-dd")}</td>
                            <td>${i.description}</td>
                            <td class="amount">${sprintf("R %.2f", i.amount.toBigDecimal())}</td>
                        </tr>
                    </g:each>
                    <tr>
                        <td colspan="3" class="total">${sprintf("R %.2f", incomesTotal)}</td>
                    </tr>
                </table>
                <g:link controller="budTransaction" action="create" params="[type:'Income',backTo:'budOverview']">New Income</g:link>
            </div>
            <div id="expenses">
                <h2>Expenses</h2>
                <table>
                    <tr>
                        <th>Date</th>
                        <th>Description</th>
                        <th>Amount</th>
                    </tr>
                    <g:each in="${expenses}" var="i">
                        <tr>
                            <td>${i.date.format("yyyy-MM-dd")}</td>
                            <td>${i.description}</td>
                            <td class="amount">${sprintf("R %.2f", i.amount.toBigDecimal())}</td>
                        </tr>
                    </g:each>
                    <tr>
                        <td colspan="3" class="total">${sprintf("R %.2f", expensesTotal)}</td>
                    </tr>
                </table>
                <g:link controller="budTransaction" action="create" params="[type:'Expense',backTo:'budOverview']">New Expense</g:link>
            </div>
        </div>
        <div id="summary">
            <table>
                <tr>
                    <td>Balance:</td>
                    <td>${sprintf("R %.2f", balance)}</td>
                </tr>
                <tr>
                    <td>Days left of month, including today (${new Date().format("MMMMM, yyyy")}):</td>
                    <td>${daysLeftOfMonth}</td>
                </tr>
                <tr>
                    <td>Amount allowed per day:</td>
                    <td>${sprintf("R %.2f", balanceLeftForMonth)}</td>
                </tr>
                <tr>
                    <td>Excess/Short Amount:</td>
                    <td>${sprintf("R %.2f", excessAmount)}</td>
                </tr>
                <tr>
                    <td>Current Threshold:</td>
                    <td>${sprintf("R %.2f", threshold)}</td>
                </tr>
            </table>
        </div>
        <div id="logoutPanel">
            <g:render template="/logoutPanel"/>
        </div>
    </div>
</body>
</html>