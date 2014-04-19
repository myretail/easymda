<%@ include file="/taglib-imports.jspf" %>

<tiles:insert definition="help.layout">

    <tiles:put name="title" type="string">
        <bean:message key="online.help.title"/>
        <bean:message key="customer"/>
    </tiles:put>

    <tiles:put name="body" type="string">
        <h1><bean:message key="customer"/></h1>
        <p>
            <bean:message key="customer.online.help"/>
        </p>
        <h2><bean:message key="customer.customer.name"/></h2>
        <p>
            <bean:message key="customer.customer.name.online.help"/>
        </p>
        <h2><bean:message key="customer.cust.enum"/></h2>
        <p>
            <bean:message key="customer.cust.enum.online.help"/>
        </p>
    </tiles:put>

</tiles:insert>

