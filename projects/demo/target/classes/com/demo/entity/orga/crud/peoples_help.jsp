<%@ include file="/taglib-imports.jspf" %>

<tiles:insert definition="help.layout">

    <tiles:put name="title" type="string">
        <bean:message key="online.help.title"/>
        <bean:message key="peoples"/>
    </tiles:put>

    <tiles:put name="body" type="string">
        <h1><bean:message key="peoples"/></h1>
        <p>
            <bean:message key="peoples.online.help"/>
        </p>
        <h2><bean:message key="peoples.people.name"/></h2>
        <p>
            <bean:message key="peoples.people.name.online.help"/>
        </p>
        <h2><bean:message key="peoples.people.password"/></h2>
        <p>
            <bean:message key="peoples.people.password.online.help"/>
        </p>
        <h2><bean:message key="peoples.people.status"/></h2>
        <p>
            <bean:message key="peoples.people.status.online.help"/>
        </p>
        <h2><bean:message key="peoples.birth.day"/></h2>
        <p>
            <bean:message key="peoples.birth.day.online.help"/>
        </p>
        <h2><bean:message key="peoples.sex"/></h2>
        <p>
            <bean:message key="peoples.sex.online.help"/>
        </p>
        <h2><bean:message key="peoples.birth.place"/></h2>
        <p>
            <bean:message key="peoples.birth.place.online.help"/>
        </p>
        <h2><bean:message key="peoples.address"/></h2>
        <p>
            <bean:message key="peoples.address.online.help"/>
        </p>
        <h2><bean:message key="peoples.tel"/></h2>
        <p>
            <bean:message key="peoples.tel.online.help"/>
        </p>
        <h2><bean:message key="peoples.engage.mode"/></h2>
        <p>
            <bean:message key="peoples.engage.mode.online.help"/>
        </p>
        <h2><bean:message key="peoples.engage.date"/></h2>
        <p>
            <bean:message key="peoples.engage.date.online.help"/>
        </p>
        <h2><bean:message key="peoples.grade.enum"/></h2>
        <p>
            <bean:message key="peoples.grade.enum.online.help"/>
        </p>
        <h2><bean:message key="peoples.remark"/></h2>
        <p>
            <bean:message key="peoples.remark.online.help"/>
        </p>
    </tiles:put>

</tiles:insert>

