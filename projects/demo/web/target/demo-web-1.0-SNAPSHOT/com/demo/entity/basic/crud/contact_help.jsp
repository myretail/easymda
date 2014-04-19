<%@ include file="/taglib-imports.jspf" %>

<tiles:insert definition="help.layout">

    <tiles:put name="title" type="string">
        <bean:message key="online.help.title"/>
        <bean:message key="contact"/>
    </tiles:put>

    <tiles:put name="body" type="string">
        <h1><bean:message key="contact"/></h1>
        <p>
            <bean:message key="contact.online.help"/>
        </p>
        <h2><bean:message key="contact.code.contact"/></h2>
        <p>
            <bean:message key="contact.code.contact.online.help"/>
        </p>
        <h2><bean:message key="contact.customer"/></h2>
        <p>
            <bean:message key="contact.customer.online.help"/>
        </p>
    </tiles:put>

</tiles:insert>

