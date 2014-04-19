<!--
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
-->
     <style type="text/css">
            @import "../dojo/dojo-release-1.0.0/dijit/themes/tundra/tundra.css";
            @import "../dojo/dojo-release-1.0.0/dojo/resources/dojo.css";
            @import "../dojo/dojo-release-1.0.0/dojox/grid/_grid/tundraGrid.css";
            @import "../dojo/dojo-release-1.0.0/dojox/grid/_grid/Grid.css";
            @import "../js/wlProject.css";
	
      </style>
      <script type="text/javascript" src="../dojo/dojo-release-1.0.0/dojo/dojo.js"  
                djConfig="parseOnLoad: true, isDebug: true,locale: 'zh-cn', extraLocale: ['zh-TW', 'fr']"></script>
      <script>
    
            dojo.require("dojo.data.ItemFileWriteStore");
            dojo.require("dijit.layout.SplitContainer");
            dojo.require("dijit.layout.ContentPane");
            dojo.require("dijit.Tree");
            dojo.require("dojo.parser");
            dojo.require("dijit._tree.dndSource");
            dojo.require("dijit.layout.TabContainer");
            dojo.require("dijit.form.Button");
            dojo.require("dojox.grid.Grid");
            dojo.require("dojox.grid._data.model");
            dojo.require("dojo.i18n");
            dojo.require("dojox.validate._base");
            dojo.require("dijit.form.ValidationTextBox");
            dojo.require("dijit.form.TextBox");
            dojo.require("dijit.form.FilteringSelect");
            dojo.require("dojox.grid._data.dijitEditors");
            
            dojo.registerModulePath("mydojo", "../../../js/mydojo");
            dojo.require("mydojo.FilteringSelect");
            dojo.require("mydojo.ValidationTextBox");
            
     </script>
        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
