<%@ include file="/taglib-imports.jspf" %>

<tiles:insert definition="help.layout">

    <tiles:put name="title" type="string">
        <bean:message key="online.help.title"/>
        <bean:message key="order.row.task"/>
    </tiles:put>

    <tiles:put name="body" type="string">
        <h1><bean:message key="order.row.task"/></h1>
        <p>
            <bean:message key="order.row.task.online.help"/>
        </p>
        <h2><bean:message key="order.row.task.order.row"/></h2>
        <p>
            <bean:message key="order.row.task.order.row.online.help"/>
        </p>
        <h2><bean:message key="order.row.task.task"/></h2>
        <p>
            <bean:message key="order.row.task.task.online.help"/>
        </p>
    </tiles:put>

</tiles:insert>

