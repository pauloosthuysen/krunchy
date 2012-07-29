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
      }
      .amount{
          text-align: right;
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
            <%
                def curDate = new Date()
            %>
            <label>From: <g:datePicker name="fromDate" value="${new Date(curDate.year, curDate.month, 1).clearTime()}" precision="day" relativeYears="[-5..5]"/></label>
            <label>To: <g:datePicker name="toDate" value="${new Date()}" precision="day" relativeYears="[-5..5]"/></label>
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
                            <td>${i.date}</td>
                            <td>${i.description}</td>
                            <td class="amount">${sprintf("R %5.2f", i.amount.toBigDecimal())}</td>
                        </tr>
                    </g:each>
                    <tr>
                        <td colspan="3" class="total">${sprintf("R %.2f", incomesTotal)}</td>
                    </tr>
                </table>
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
                            <td>${i.date}</td>
                            <td>${i.description}</td>
                            <td class="amount">${sprintf("R %5.2f", i.amount.toBigDecimal())}</td>
                        </tr>
                    </g:each>
                    <tr>
                        <td colspan="3" class="total">${sprintf("R %5.2f", expensesTotal)}</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</body>
</html>