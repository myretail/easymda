<%@ include file="/taglib-imports.jspf" %>

<tiles:insert definition="help.layout">

    <tiles:put name="title" type="string">
        <bean:message key="online.help.title"/>
        <bean:message key="payment"/>
    </tiles:put>

    <tiles:put name="body" type="string">
        <h1><bean:message key="payment"/></h1>
        <p>
            <bean:message key="payment.online.help"/>
        </p>
        <h2><bean:message key="payment.new.attr1"/></h2>
        <p>
            <bean:message key="payment.new.attr1.online.help"/>
        </p>
        <h2><bean:message key="payment.new.attr2"/></h2>
        <p>
            <bean:message key="payment.new.attr2.online.help"/>
        </p>
        <h2><bean:message key="payment.payment"/></h2>
        <p>
            <bean:message key="payment.payment.online.help"/>
        </p>
    </tiles:put>

</tiles:insert>

