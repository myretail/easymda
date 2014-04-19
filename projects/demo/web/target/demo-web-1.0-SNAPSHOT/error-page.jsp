<%@ page session="false" isErrorPage="true" %>
<%@ include file="/taglib-imports.jspf" %>



<html:html lang="true">

    <head>
        <title><bean:message key="error.${param.code}.title"/></title>
        <meta http-equiv="Content-Type" content="text/html; charset:utf-8" />
<%-- uncomment this to enable the browser 'favorites' icons
        <link rel="shortcut icon" href="my-custom-image.ico"></link>
        <link rel="icon" type="image/gif" href="my-custom-image.gif"></link>
--%>
        <link rel="stylesheet" type="text/css" media="screen" href="<html:rewrite page="/layout/default-application.css"/>"></link>
        <link rel="stylesheet" type="text/css" media="screen" href="<html:rewrite page="/layout/default.css"/>"></link>
    </head>

    <body>
        <div id="error">
            <div id="title"><bean:message key="error.${param.code}.title"/></div>
            <div id="message"><bean:message key="error.${param.code}.message"/></div>
            <c:set var="link"><html:rewrite page="/index.jsp"/></c:set>
            <div id="link">
               <html:link href="${link}" titleKey="error.link.title">
                  <bean:message key="error.link.text"/>
               </html:link>
            </div>
            <c:if test="${param.exception}">
                <div class="details">
                    <code>${requestScope["javax.servlet.error.exception"]}</code>
                </div>
            </c:if>
            <c:if test="${param.resource}">
                <div class="details">
                    ${requestScope["javax.servlet.error.request_uri"]}
                </div>
            </c:if>
        </div>
    </body>

</html:html>