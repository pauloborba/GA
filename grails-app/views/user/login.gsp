<%--
  Created by IntelliJ IDEA.
  User: ess
  Date: 20/10/15
  Time: 17:48
--%>

<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>User Login</title>
</head>
<body>
<div class="body">
    <g:form action="doLogin" method="post">
        <div class="dialog">
            <p>Enter your login details below:</p>
            <table class="userForm">
                <tr class='prop'>
                    <td valign='top' style='text-align:left;' width='20%'>
                        <label for='login'>Login:</label>
                    </td>
                    <td valign='top' style='text-align:left;' width='80%'>
                        <input id="login" type='text' name='login' value='${user?.login}' />
                    </td>
                </tr>
                <tr class='prop'>
                    <td valign='top' style='text-align:left;' width='20%'>
                        <label for='senha'>Senha:</label>
                    </td>
                    <td valign='top' style='text-align:left;' width='80%'>
                        <input id="senha" type='senha' name='senha'
                               value='${user?.senha}' />
                    </td>
                </tr>

            </table>
        </div>
        <div class="buttons">
            <span class="formButton">
                <input type="submit" name="Login" value="Login"></input>
            </span>
        </div>
    </g:form>
</div>
</body>
</html>
