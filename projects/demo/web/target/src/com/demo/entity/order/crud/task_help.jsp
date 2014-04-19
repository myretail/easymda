<%@ include file="/taglib-imports.jspf" %>

<tiles:insert definition="help.layout">

    <tiles:put name="title" type="string">
        <bean:message key="online.help.title"/>
        <bean:message key="task"/>
    </tiles:put>

    <tiles:put name="body" type="string">
        <h1><bean:message key="task"/></h1>
        <p>
            <bean:message key="task.online.help"/>
        </p>
        <h2><bean:message key="task.num"/></h2>
        <p>
            <bean:message key="task.num.online.help"/>
        </p>
        <h2><bean:message key="task.volumne"/></h2>
        <p>
            <bean:message key="task.volumne.online.help"/>
        </p>
        <h2><bean:message key="task.remark"/></h2>
        <p>
            <bean:message key="task.remark.online.help"/>
        </p>
        <h2><bean:message key="task.task.form"/></h2>
        <p>
            <bean:message key="task.task.form.online.help"/>
        </p>
    </tiles:put>

</tiles:insert>

