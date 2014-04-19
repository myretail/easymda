<%@ include file="/taglib-imports.jspf" %>

<tiles:insert definition="help.layout">

    <tiles:put name="title" type="string">
        <bean:message key="online.help.title"/>
        <bean:message key="car"/>
    </tiles:put>

    <tiles:put name="body" type="string">
        <h1><bean:message key="car"/></h1>
        <p>
            <bean:message key="car.online.help"/>
        </p>
        <h2><bean:message key="car.load"/></h2>
        <p>
            <bean:message key="car.load.online.help"/>
        </p>
    </tiles:put>

</tiles:insert>

