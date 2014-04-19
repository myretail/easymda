<%@ include file="/taglib-imports.jspf" %>

<tiles:insert definition="help.layout">

    <tiles:put name="title" type="string">
        <bean:message key="online.help.title"/>
        <bean:message key="orga.peoples"/>
    </tiles:put>

    <tiles:put name="body" type="string">
        <h1><bean:message key="orga.peoples"/></h1>
        <p>
            <bean:message key="orga.peoples.online.help"/>
        </p>
        <h2><bean:message key="orga.peoples.orga"/></h2>
        <p>
            <bean:message key="orga.peoples.orga.online.help"/>
        </p>
        <h2><bean:message key="orga.peoples.people"/></h2>
        <p>
            <bean:message key="orga.peoples.people.online.help"/>
        </p>
    </tiles:put>

</tiles:insert>

