<%@ include file="/taglib-imports.jspf" %>

<tiles:insert definition="help.layout">

    <tiles:put name="title" type="string">
        <bean:message key="online.help.title"/>
        <bean:message key="prod"/>
    </tiles:put>

    <tiles:put name="body" type="string">
        <h1><bean:message key="prod"/></h1>
        <p>
            <bean:message key="prod.online.help"/>
        </p>
        <h2><bean:message key="prod.prod.name"/></h2>
        <p>
            <bean:message key="prod.prod.name.online.help"/>
        </p>
        <h2><bean:message key="prod.code"/></h2>
        <p>
            <bean:message key="prod.code.online.help"/>
        </p>
        <h2><bean:message key="prod.price"/></h2>
        <p>
            <bean:message key="prod.price.online.help"/>
        </p>
        <h2><bean:message key="prod.datef"/></h2>
        <p>
            <bean:message key="prod.datef.online.help"/>
        </p>
        <h2><bean:message key="prod.prod.type"/></h2>
        <p>
            <bean:message key="prod.prod.type.online.help"/>
        </p>
        <h2><bean:message key="prod.prod.cust"/></h2>
        <p>
            <bean:message key="prod.prod.cust.online.help"/>
        </p>
        <h2><bean:message key="prod.principal"/></h2>
        <p>
            <bean:message key="prod.principal.online.help"/>
        </p>
    </tiles:put>

</tiles:insert>

