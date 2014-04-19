<%@ include file="/taglib-imports.jspf" %>

<tiles:insert definition="help.layout">

    <tiles:put name="title" type="string">
        <bean:message key="online.help.title"/>
        <bean:message key="$applicationUseCase.titleKey"/>
    </tiles:put>

    <tiles:put name="body" type="string">
        <h1><bean:message key="$applicationUseCase.titleKey"/></h1>
        <p>
            <bean:message key="$applicationUseCase.onlineHelpKey"/>
        </p>
    </tiles:put>

</tiles:insert>

