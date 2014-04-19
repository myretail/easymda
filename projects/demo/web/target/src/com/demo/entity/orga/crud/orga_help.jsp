<%@ include file="/taglib-imports.jspf" %>

<tiles:insert definition="help.layout">

    <tiles:put name="title" type="string">
        <bean:message key="online.help.title"/>
        <bean:message key="orga"/>
    </tiles:put>

    <tiles:put name="body" type="string">
        <h1><bean:message key="orga"/></h1>
        <p>
            <bean:message key="orga.online.help"/>
        </p>
        <h2><bean:message key="orga.orga.name"/></h2>
        <p>
            <bean:message key="orga.orga.name.online.help"/>
        </p>
        <h2><bean:message key="orga.orga.code"/></h2>
        <p>
            <bean:message key="orga.orga.code.online.help"/>
        </p>
        <h2><bean:message key="orga.sno"/></h2>
        <p>
            <bean:message key="orga.sno.online.help"/>
        </p>
        <h2><bean:message key="orga.remark"/></h2>
        <p>
            <bean:message key="orga.remark.online.help"/>
        </p>
        <h2><bean:message key="orga.parent.id"/></h2>
        <p>
            <bean:message key="orga.parent.id.online.help"/>
        </p>
    </tiles:put>

</tiles:insert>

