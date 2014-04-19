<%@ include file="/taglib-imports.jspf" %>

<tiles:insert definition="help.layout">

    <tiles:put name="title" type="string">
        <bean:message key="online.help.title"/>
        <bean:message key="orderd"/>
    </tiles:put>

    <tiles:put name="body" type="string">
        <h1><bean:message key="orderd"/></h1>
        <p>
            <bean:message key="orderd.online.help"/>
        </p>
        <h2><bean:message key="orderd.customer.order.no"/></h2>
        <p>
            <bean:message key="orderd.customer.order.no.online.help"/>
        </p>
        <h2><bean:message key="orderd.contract.no"/></h2>
        <p>
            <bean:message key="orderd.contract.no.online.help"/>
        </p>
        <h2><bean:message key="orderd.conveyance.enum"/></h2>
        <p>
            <bean:message key="orderd.conveyance.enum.online.help"/>
        </p>
        <h2><bean:message key="orderd.carry.type.enum"/></h2>
        <p>
            <bean:message key="orderd.carry.type.enum.online.help"/>
        </p>
        <h2><bean:message key="orderd.shipper.remark"/></h2>
        <p>
            <bean:message key="orderd.shipper.remark.online.help"/>
        </p>
        <h2><bean:message key="orderd.carrier.remark"/></h2>
        <p>
            <bean:message key="orderd.carrier.remark.online.help"/>
        </p>
        <h2><bean:message key="orderd.level.enum"/></h2>
        <p>
            <bean:message key="orderd.level.enum.online.help"/>
        </p>
        <h2><bean:message key="orderd.customer.type.enum"/></h2>
        <p>
            <bean:message key="orderd.customer.type.enum.online.help"/>
        </p>
        <h2><bean:message key="orderd.refer.time"/></h2>
        <p>
            <bean:message key="orderd.refer.time.online.help"/>
        </p>
        <h2><bean:message key="orderd.link.man"/></h2>
        <p>
            <bean:message key="orderd.link.man.online.help"/>
        </p>
        <h2><bean:message key="orderd.tel"/></h2>
        <p>
            <bean:message key="orderd.tel.online.help"/>
        </p>
        <h2><bean:message key="orderd.book.time"/></h2>
        <p>
            <bean:message key="orderd.book.time.online.help"/>
        </p>
        <h2><bean:message key="orderd.complete.time"/></h2>
        <p>
            <bean:message key="orderd.complete.time.online.help"/>
        </p>
        <h2><bean:message key="orderd.remark"/></h2>
        <p>
            <bean:message key="orderd.remark.online.help"/>
        </p>
        <h2><bean:message key="orderd.order.row"/></h2>
        <p>
            <bean:message key="orderd.order.row.online.help"/>
        </p>
        <h2><bean:message key="orderd.customer"/></h2>
        <p>
            <bean:message key="orderd.customer.online.help"/>
        </p>
    </tiles:put>

</tiles:insert>

