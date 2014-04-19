<%@ include file="/taglib-imports.jspf" %>

<div class="box1">
     <h4>Latest News</h4>

     <p><b>AndroMDA - the new release</b><br/>

     - New cartridges, lots of new features<br/>
     - Major performance improvements...<br/>
     </p>
     <p><a href="http://www.andromda.org/" title="AndroMDA homepage">more &raquo;</a></p>
</div>

<p class="spacer"></p>

<div class="box2">
    <h4><bean:message key="menu.usecases.title"/></h4>
    <ul>
            <li>
                <html:link action="/Enumeration/Manage" titleKey="entity.management">
                    <bean:message key="entity.management"/>
                </html:link>
            </li>
    </ul>
</div>

<div class="box3">
    <p>This web application has been generated using AndroMDA&#146;s Bpm4Struts cartridge, check the
       <a href="http://www.andromda.org/andromda-bpm4struts-cartridge/" title="AndroMDA Docs">Docs</a>
       for more information.</p>
    <p class="author">
       The AndroMDA Team <br/>
       &copy; 2006</p>
</div>

