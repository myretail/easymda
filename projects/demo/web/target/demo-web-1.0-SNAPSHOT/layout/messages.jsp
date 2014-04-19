<%@ include file="/taglib-imports.jspf" %>

<div id="messages">
    <logic:messagesPresent message="false">
        <logic:messagesNotPresent message="true" property="org.andromda.bpm4struts.errormessages">
            <div class="errors">
                <html:messages id="error" message="false">
                    <div class="error">${error}</div>
                </html:messages>
            </div>
        </logic:messagesNotPresent>
    </logic:messagesPresent>
    <logic:messagesPresent message="true" property="org.andromda.bpm4struts.errormessages">
        <div class="errors">
            <html:messages id="error" message="true" property="org.andromda.bpm4struts.errormessages">
                <div class="error">${error}</div>
            </html:messages>
        </div>
    </logic:messagesPresent>
    <logic:messagesPresent message="true" property="org.andromda.bpm4struts.warningmessages">
        <div class="warnings">
            <html:messages id="warning" message="true" property="org.andromda.bpm4struts.warningmessages">
                <div class="warning">${warning}</div>
            </html:messages>
        </div>
    </logic:messagesPresent>
    <logic:messagesPresent message="true" property="org.andromda.bpm4struts.successmessages">
        <div class="messages">
            <html:messages id="message" message="true" property="org.andromda.bpm4struts.successmessages">
                <div class="message">${message}</div>
            </html:messages>
        </div>
    </logic:messagesPresent>
</div>
