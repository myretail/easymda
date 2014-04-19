<%@ include file="/taglib-imports.jspf" %>

<tiles:insert definition="help.layout">

    <tiles:put name="title" type="string">
        <bean:message key="online.help.title"/>
        <bean:message key="task.form"/>
    </tiles:put>

    <tiles:put name="body" type="string">
        <h1><bean:message key="task.form"/></h1>
        <p>
            <bean:message key="task.form.online.help"/>
        </p>
        <h2><bean:message key="task.form.set.date"/></h2>
        <p>
            <bean:message key="task.form.set.date.online.help"/>
        </p>
        <h2><bean:message key="task.form.form.state"/></h2>
        <p>
            <bean:message key="task.form.form.state.online.help"/>
        </p>
        <h2><bean:message key="task.form.remark"/></h2>
        <p>
            <bean:message key="task.form.remark.online.help"/>
        </p>
        <h2><bean:message key="task.form.tasks"/></h2>
        <p>
            <bean:message key="task.form.tasks.online.help"/>
        </p>
        <h2><bean:message key="task.form.car"/></h2>
        <p>
            <bean:message key="task.form.car.online.help"/>
        </p>
    </tiles:put>

</tiles:insert>

