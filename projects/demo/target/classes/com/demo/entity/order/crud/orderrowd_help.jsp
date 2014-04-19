<%@ include file="/taglib-imports.jspf" %>

<tiles:insert definition="help.layout">

    <tiles:put name="title" type="string">
        <bean:message key="online.help.title"/>
        <bean:message key="order.rowd"/>
    </tiles:put>

    <tiles:put name="body" type="string">
        <h1><bean:message key="order.rowd"/></h1>
        <p>
            <bean:message key="order.rowd.online.help"/>
        </p>
        <h2><bean:message key="order.rowd.product.num"/></h2>
        <p>
            <bean:message key="order.rowd.product.num.online.help"/>
        </p>
        <h2><bean:message key="order.rowd.unit.num"/></h2>
        <p>
            <bean:message key="order.rowd.unit.num.online.help"/>
        </p>
        <h2><bean:message key="order.rowd.goods.suttle"/></h2>
        <p>
            <bean:message key="order.rowd.goods.suttle.online.help"/>
        </p>
        <h2><bean:message key="order.rowd.goods.weight"/></h2>
        <p>
            <bean:message key="order.rowd.goods.weight.online.help"/>
        </p>
        <h2><bean:message key="order.rowd.goods.volume"/></h2>
        <p>
            <bean:message key="order.rowd.goods.volume.online.help"/>
        </p>
        <h2><bean:message key="order.rowd.label"/></h2>
        <p>
            <bean:message key="order.rowd.label.online.help"/>
        </p>
        <h2><bean:message key="order.rowd.carriage"/></h2>
        <p>
            <bean:message key="order.rowd.carriage.online.help"/>
        </p>
        <h2><bean:message key="order.rowd.especial"/></h2>
        <p>
            <bean:message key="order.rowd.especial.online.help"/>
        </p>
        <h2><bean:message key="order.rowd.goods.state"/></h2>
        <p>
            <bean:message key="order.rowd.goods.state.online.help"/>
        </p>
        <h2><bean:message key="order.rowd.remark"/></h2>
        <p>
            <bean:message key="order.rowd.remark.online.help"/>
        </p>
        <h2><bean:message key="order.rowd.order"/></h2>
        <p>
            <bean:message key="order.rowd.order.online.help"/>
        </p>
        <h2><bean:message key="order.rowd.product"/></h2>
        <p>
            <bean:message key="order.rowd.product.online.help"/>
        </p>
    </tiles:put>

</tiles:insert>

