<%@ include file="/taglib-imports.jspf" %>

<tiles:insert definition="help.layout">

    <tiles:put name="title" type="string">
        <bean:message key="online.help.title"/>
        <bean:message key="enumeration"/>
    </tiles:put>

    <tiles:put name="body" type="string">
        <h1><bean:message key="enumeration"/></h1>
        <p>
            <bean:message key="enumeration.online.help"/>
        </p>
        <h2><bean:message key="enumeration.field.name"/></h2>
        <p>
            <bean:message key="enumeration.field.name.online.help"/>
        </p>
        <h2><bean:message key="enumeration.enumeration.type"/></h2>
        <p>
            <bean:message key="enumeration.enumeration.type.online.help"/>
        </p>
    </tiles:put>

</tiles:insert>

