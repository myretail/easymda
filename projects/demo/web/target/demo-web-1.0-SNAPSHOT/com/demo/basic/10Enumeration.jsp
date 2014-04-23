<%
String peopleId = request.getParameter("peopleId");
%>
<html>
<!--Ò»Ô¶à£¬Ö»Ò»Ò»Ó±í£¬Ã»Ð¿Ò»Ô¶Ó±var dataChild=querydataEnumeration[inRowIndex]-->
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
     <style type="text/css">
            @import "../dojo/dojo-release-1.0.0/dijit/themes/tundra/tundra.css";
            @import "../dojo/dojo-release-1.0.0/dojo/resources/dojo.css";
            @import "../dojo/dojo-release-1.0.0/dojox/grid/_grid/tundraGrid.css";
            @import "../dojo/dojo-release-1.0.0/dojox/grid/_grid/Grid.css";
            @import "../js/dijitTests.css";
            @import "../js/wlProject.css";
			@import "../dojo/dojo-release-1.0.0/dojox/layout/resources/FloatingPane.css"; 
		    @import "../dojo/dojo-release-1.0.0/dojox/layout/resources/ResizeHandle.css"; 
      </style>
      <script type="text/javascript" src="../dojo/dojo-release-1.0.0/dojo/dojo.js"  
                djConfig="parseOnLoad: true, isDebug: true,locale: 'zh-cn', extraLocale: ['zh-TW', 'fr']"></script>
      <script>
    
            dojo.require("dojo.data.ItemFileWriteStore");
            dojo.require("dojo.parser");
            dojo.require("dijit.form.Button");
            dojo.require("dijit.Menu");
			dojo.require("dijit.Tree");
            dojo.require("dojox.grid.Grid");
            dojo.require("dojox.validate._base");
            dojo.require("dojox.grid._data.model");
            dojo.require("dijit.form.ValidationTextBox");
            dojo.require("dijit.form.TextBox");
            dojo.require("dijit.form.FilteringSelect");
            dojo.require("dijit.form.ComboBox");
            dojo.require("dijit.form.Textarea");
            dojo.require("dojox.grid._data.dijitEditors");
            dojo.require("dojox.layout.FloatingPane");
			dojo.require("dijit.Dialog");
            dojo.registerModulePath("mydojo", "../../../js/mydojo");
            dojo.require("mydojo.FilteringSelect");
            dojo.require("mydojo.ValidationTextBox");
            dojo.require("mydojo.NumberTextBox");
			dojo.registerModulePath("projectDojo", "../../../dojo/projectDojo");
			dojo.require("projectDojo.Enumeration");
     </script>
        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 	<script type="text/javascript" >
		var dojoEnumeration= new  projectDojo.Enumeration();
	    dojoEnumeration.initEnumeration();
</script>

	 	 	 
	<script type="text/javascript" >
	  var urlEnumeration = getUrl()+ "services/EnumerationManageService";
	  var deletedataEnumeration =  new Array();
	  var querydataEnumeration =  new Array();
	  var pagenumberEnumeration=1;
	  var totalCountEnumeration=0;
	  var pagesizeEnumeration=10;
	  var orderByEnumeration='0';
	  var queryvoEnumeration=new Object();
	  var oddstyle='';
	  var modelEnumeration = new dojox.grid.data.Table(null, querydataEnumeration);
	  var urle = getUrl()+ "services/BasicManageService";
	  var modelEnumerationDetail;
	  var modelEnumerationChild;
	  


					//begin buildLayout


var mainLayout =[{//?????????colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: i18nStr.detail, width: 3, get: getCheckEnumeration, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				  				  {name: i18nStr.fieldName, field: 2,width: 10}
						  						  				,   {name: i18nStr.enumerationType, field: 3,width: 10}
						  				
					],[
									{ name: '\u8be6\u7ec6', colSpan: 4 ,styles: 'padding: 0; margin: 0;', get: getSubEnumeration }//value: '<div style="height:0px; background-color: white;"></div>'
						  ]
				  ]
	  
				}];	 
var subInt=	$childRow;			
function getSubEnumeration(inRowIndex){
		var cell = this;
		setTimeout(function() { buildSubgridEnumeration(inRowIndex, cell); }, 0);
		var h =0;
		if(detailRowsEnumeration[inRowIndex]&&querydataEnumeration[inRowIndex][$childRow].length>0){
							h=65+25*querydataEnumeration[inRowIndex][$childRow].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}				

//end buildLayout

var detailRowsEnumeration=[];

function onBeforeRow(inDataIndex, inRow) {	if (inRow[1]!=undefined)inRow[1].hidden = !detailRowsEnumeration[inDataIndex];}	

function toggleEnumeration(inIndex, inShow) {
        			if (!inShow) destroySubGridIdGeneral('',querydataEnumeration[inIndex][1],"EnumerationMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataEnumeration[inIndex][1],"EnumerationChild");
				    detailRowsEnumeration[inIndex] = inShow;
				    dijit.byId("gridEnumeration").updateRow(inIndex); 
				    
    } 

function getCheckEnumeration(inRowIndex) {
	var image = (detailRowsEnumeration[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsEnumeration[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleEnumeration(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}





//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}

	  
function buildSubgridEnumeration(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)Ç¸idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		var idmainDetail = makeSubGridIdGeneral('',querydataEnumeration[inRowIndex][1],"EnumerationMainDetail");//makeSubgridIdMainDetail(querydataEnumeration[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataEnumeration[inRowIndex][1],"EnumerationChild");
		var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataEnumeration[inRowIndex][$childRow];
		if(dataChild.length!=0){
			if (subGridChild){
				subGridChild.model.setData(dataChild);
				child.appendChild(subGridChild.domNode);
			}else{
				modelEnumerationChild=new dojox.grid.data.Table(null, dataChild);
				var childProps= {
								autoHeight: true, 
								autoRender: false,
								rowCount:dataChild.length,
								model:modelEnumerationChild,							};
				childProps.dataRow = inRowIndex;
				childProps.id = idchild;
				if(Math.ceil(inRowIndex/2)>inRowIndex/2){
					childProps.structure=childLayoutOdd;
				}else{
					childProps.structure=childLayout;
				}
				subGridChild = new dojox.Grid(childProps, child);//gridÎªÇ¶×±Ê±Ô¶DIVÄ´Ð¡
			}
			if (subGridChild) {
				subGridChild.render();
				subGridChild.cacheHeight = subGridChild.domNode.offsetHeight;
			}	      				
		}
		inCell.grid.rowHeightChanged(inRowIndex);
    }   
}
//var childLayout=//???????????????????????????????/ Ö±É£jshtml

function querybuttonEnumeration(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvoEnumeration=new Object();
	          if(queryEnumerationfieldName.getDisplayedValue()!="")queryvoEnumeration.fieldName=queryEnumerationfieldName.getDisplayedValue();//
	          if(queryEnumerationenumerationType.getDisplayedValue()!="")queryvoEnumeration.enumerationType=queryEnumerationenumerationType.getDisplayedValue();//
			

			if(validstate==0){
              pagenumberEnumeration=1;
              getEnumerationVO(queryvoEnumeration); 
             }      
       }

function getEnumerationVO(queryvo){
	var totalCount=0;
	deletedataEnumeration =new Array();
      var pu = new SOAPClientParameters2();
      pu.add('EnumerationVO',queryvo) ;
      pu.add('pageNumber',pagenumberEnumeration) ;
	    pu.add('pageSize',pagesizeEnumeration) ;
	    pu.add('orderBy',orderByEnumeration) ;
      SOAPClient.invoke(urlEnumeration,"getEnumeration", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydataEnumeration=new Array();
		   querydataEnumeration=dojoEnumeration.EnumerationVOtoArray_fun(ul,false);
           totalCountEnumeration=ul[ul.length-1]["ns:id"]; 
      }); 
      querydataEnumeration.splice(querydataEnumeration.length-1,1);
	  gridEnumeration.selection.clear();
      modelEnumeration.setData(querydataEnumeration);
      //dijit.byId("grid").updateRowCount(querydataEnumeration.length); 
	   var totalpage=Math.ceil(new Number(totalCountEnumeration)/pagesizeEnumeration);
	  
	if(totalpage>1){
		if(pagenumberEnumeration==1){
			dijit.byId("but6Enumeration").setDisabled(true);
			dijit.byId("but7Enumeration").setDisabled(false);
		}else if(pagenumberEnumeration==totalpage){
			dijit.byId("but6Enumeration").setDisabled(false);
			dijit.byId("but7Enumeration").setDisabled(true);
		}else{
			dijit.byId("but6Enumeration").setDisabled(false);
			dijit.byId("but7Enumeration").setDisabled(false);
		}
	}else{
		dijit.byId("but6Enumeration").setDisabled(true);
		dijit.byId("but7Enumeration").setDisabled(true);
	
	}
	if(pagesizeEnumeration==0){
		totalpage=1;
		dijit.byId("but6Enumeration").setDisabled(true);
		dijit.byId("but7Enumeration").setDisabled(true);
	}
	if(totalpage==1)pagenumberEnumeration=1;
	
	 document.getElementById("rowCountEnumeration").innerHTML=i18nStr.di+" "+pagenumberEnumeration+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountEnumeration+" "+i18nStr.rowSize; 	
}

function init(){
	
 	dojo.connect(dijit.byId("gridEnumeration"), "dodblclick", function(e){
	   if(document.getElementById('queryDivEnumeration').style.display=='')document.getElementById('queryDivEnumeration').style.display='none';
	   if(document.getElementById('addDivEnumeration').style.display=='none')document.getElementById('addDivEnumeration').style.display='';
		 document.getElementById('erowIndexEnumeration').value=e.rowIndex;
		 document.getElementById('EnumerationId').value=querydataEnumeration[e.rowIndex][1];
		 	 									dijit.byId("addEnumerationfieldName").setValue(querydataEnumeration[e.rowIndex][2]);
						 									dijit.byId("addEnumerationenumerationType").setValue(querydataEnumeration[e.rowIndex][3]);
						 			 
					   
	});  
	gridEnumeration.onStyleRow=OnStyleRowClassBlue();
	getEnumerationVO(queryvoEnumeration);
}

 dojo.addOnLoad(init);   



 
//addDiv---------------begin-------------------------------------
var addDivAdd = function(){
	 //if(document.getElementById('queryDivEnumeration').style.display=='')document.getElementById('queryDivEnumeration').style.display='none';
	 //if(document.getElementById('addDivEnumeration').style.display=='none')document.getElementById('addDivEnumeration').style.display='';
	  document.getElementById('gridSub').style.height='60px';
	 //add
															dijit.byId("addEnumerationfieldName").setValue('');
																								dijit.byId("addEnumerationenumerationType").setValue('');
														
		
	document.getElementById('EnumerationId').value='0';
	
} 
function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new Object();
    vobject.id=document.getElementById('EnumerationId').value;
	var passAll=0;
										if(dijit.byId("addEnumerationfieldName").isValid(true)){
					vobject.fieldName=dijit.byId("addEnumerationfieldName").getValue();
				}else{
					passAll=1;
				}
															if(dijit.byId("addEnumerationenumerationType").isValid(true)){
					vobject.enumerationType=dijit.byId("addEnumerationenumerationType").getValue();
				}else{
					passAll=1;
				}
										
	
if(passAll==0){
		var addrow=[];
														addrow.push(vobject.fieldName);
																					addrow.push(vobject.enumerationType);
																	 if(vobject.id==0){//create new row
		padd.add('EnumerationVO',vobject);
		SOAPClient.invoke(urlEnumeration, "createEnumeration", padd, false,  function GetEnu_callBack(ul, soapResponse){
			addrow.splice(0,0,false,ul);
			querydataEnumeration[querydataEnumeration.length]=addrow;
			document.getElementById('erowIndexEnumeration').value=querydataEnumeration.length-1;
			gridEnumeration.updateRowCount(querydataEnumeration.length);
			document.getElementById('EnumerationId').value=ul;
			});
	 }else{//modify row
		padd.add('EnumerationVO',vobject);
		SOAPClient.invoke(urlEnumeration, "updateEnumeration", padd, false,  function GetEnu_callBack(ul, soapResponse){
		});
		addrow.splice(0,0,false,vobject.id);
		querydataEnumeration[document.getElementById('erowIndexEnumeration').value]=addrow;
	 }
	}   call_funUpdGridSub();
	gridEnumeration.updateRow(document.getElementById('erowIndexEnumeration').value); 
}

 function addDivRemove(){
     if(window.confirm(i18nStr.deleteConfirm)){
       var s = dijit.byId("gridEnumeration").rowCount;
		console.log("sss:"+s);
        	  var delrowIndex=document.getElementById('erowIndexEnumeration').value;
              var sId=document.getElementById('EnumerationId').value;
              var pdel = new SOAPClientParameters();      
               pdel.add('id',sId);
               SOAPClient.invoke(urlEnumeration, "deleteEnumeration", pdel, false,  function GetEnu_callBack(ul, soapResponse){
               if(s-1!=delrowIndex){
					var e =document.createEvent("HTMLEvents");
					e.rowIndex=delrowIndex;
					dijit.byId("gridEnumeration").dodblclick(e);
			   }else{if(document.getElementById('addDivEnumeration').style.display=='')document.getElementById('addDivEnumeration').style.display='none';}
			   dijit.byId("gridEnumeration").model.remove(delrowIndex);
			   totalCountEnumeration--;
			   var totalpage=Math.ceil(new Number(new Number(totalCountEnumeration))/pagesizeEnumeration);
			   document.getElementById("rowCountEnumeration").innerHTML=i18nStr.di+" "+pagenumberEnumeration+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountEnumeration+" "+i18nStr.rowSize; 
               
	        });   
      }
 }    
 
 function adddis(){
	
	querydisplay("addDivEnumeration");
	if(document.getElementById('addDivEnumeration').style.display!='none')addDivAdd();
} 
//addDiv---------------end---------------------------------------	 
function allopen(){
          for(var i =0;i<querydataEnumeration.length;i++){
            toggleEnumeration(i,true);
          }
 }  

function allclose(){
          for(var i =0;i<querydataEnumeration.length;i++){
            toggleEnumeration(i,false);
          }
}

function pageSizeChangeEnumeration(mylabel){
	pagesizeEnumeration=mylabel;
	pagenumberEnumeration=1;
	getEnumerationVO(queryvoEnumeration);
}

function allpageEnumeration(){
	pagesizeEnumeration=0;
	getEnumerationVO(queryvoEnumeration);
}

function upPageEnumeration(){
	pagenumberEnumeration--;
	getEnumerationVO(queryvoEnumeration);
}
function downPageEnumeration(){
	pagenumberEnumeration++;
	getEnumerationVO(queryvoEnumeration);
}

</script>
</head>	 
<body class="tundra">
 <!--rowinum=$rowinum-->
 <!--addHeight=$addHeight-->
<div id="addDivEnumeration" style="margin-right: 0px;  height: 280px; display:none;" >
              <table align="center" width="100%" id="0" class="editorTable"  >
                <tr >
				<td align="center" style="{width:11%}" i18n="addNote" ></td>
                <td style="{width:22%}" ><input id="EnumerationId" style="{display:none}"  type="text"  /></td>
                <td style="{width:11%}"><input id="erowIndexEnumeration" style="{display:none}"  type="text"  /></td>
                <td style="{width:23%}" ></td>
                <td style="{width:11%}"></td>
                <td style="{width:22%}"></td>
				</tr> 
                <tr ><td align="center" style="{width:11%}"></td>
                <td style="{width:22%}" ></td>
                <td style="{width:11%}"></td>
				<td style="{width:23%}" ></td>
                <td style="{width:11%}"></td>
                <td style="{width:22%}"></td></tr>  
                <tr>
				<td align="right" i18n="fieldName" >fieldName:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addEnumerationfieldName"  jsId="addEnumerationfieldName"   dojoType="dijit.form.ValidationTextBox" required="true" />
							</td>
					<td align="right" i18n="enumerationType" >enumerationType:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addEnumerationenumerationType"  jsId="addEnumerationenumerationType"   dojoType="dijit.form.ValidationTextBox" required="true" />
							</td>
	
    <td align="right"    ></td><td align="right"    ></td></tr>
	

<tr><td align="right"> &nbsp;</td></tr>
	</table>
	<div style="{height:200px;}"  >
		<div id="gridSub"   dojoType="dojox.Grid" autoWidth="false" style="{width:1200px;height:200px;left:30px;}"  jsId="gridSub"	model="modelChildAdd"  structure="childAddLayout" singleClickEdit="true" ></div>
	 </div>
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button dojoType="dijit.form.Button" id="but1" jsId="but1" onclick="addRowSub();"  disabled='false' iconClass="addIcon" i18n="addRow" >addSub</button>
	 <button dojoType="dijit.form.Button" id="but2" jsId="but2" onclick="deleteSub();" disabled='false' iconClass="delIcon" i18n="delRow" >deleteSub</button>
	 <button dojoType="dijit.form.Button" onclick="addDivRemove();" iconClass="delIcon"  i18n="delete" >remove</button>
	 <button dojoType="dijit.form.Button" onclick="addDivSave();" iconClass="saveIcon"  i18n="save">save</button>
			 
</div>

 <!--rowinum=$rowinum-->

<div id="queryDivEnumeration" style="margin-right: 0px;  height: 80px; display:none;" >
  <table align="center" width=100% class="queryTable"  >
	<tr >
	<td align="center" style="{width:11%}" i18n="queryNote" >Please input criterial:</td>
	<td style="{width:22%}" ></td>
	<td style="{width:11%}"></td>
	<td style="{width:6%}" ></td>
	<td style="{width:11%}" ></td>
	<td style="{width:6%}" ></td>
	<td style="{width:11%}"></td>
	<td style="{width:22%}"></td>
	</tr> 
	<tr ><td align="center" style="{width:11%}"></td>
	<td style="{width:22%}" ></td>
	<td style="{width:11%}"></td>
	<td style="{width:6%}" ></td>
	<td style="{width:11%}" ></td>
	<td style="{width:6%}" ></td>
	<td style="{width:11%}"></td>
	<td style="{width:22%}"></td></tr>  
                <tr>
							<td align="right" i18n="fieldName" >fieldName:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryEnumerationfieldName"  jsId="queryEnumerationfieldName"   dojoType="dijit.form.TextBox"  />
													</td>
														<td align="right"  i18n="enumerationType" >enumerationType:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="queryEnumerationenumerationType"  jsId="queryEnumerationenumerationType"   dojoType="dijit.form.TextBox"  />
												</td>  
				
    <td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybuttonEnumeration();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
	    </div>	

<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   Enumeration List</b></td>
		<td align="right" >
	<!--button dojoType="dijit.form.Button" onclick="addRowEnumeration();" iconClass="addIcon" i18n="add"  >add</button>
	<button dojoType="dijit.form.Button" onclick="removeSelectedRowsEnumeration();" iconClass="delIcon" i18n="delete" >delete</button>
	<button dojoType="dijit.form.Button"  onclick="call_funUpdEnumeration();" i18n="save" iconClass="saveIcon">save</button>
	<button dojoType="dijit.form.Button" onclick="addDivAdd();" iconClass="addIcon"  >add</button-->
	<button dojoType="dijit.form.Button" onclick="adddis();" iconClass="openDivIcon"  i18n="edit" >openAdd</button>
	<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivEnumeration');" iconClass="queryIcon"  i18n="openQuery" >query</button>
	<span id="rowCountEnumeration"></span>
		<button dojoType="dijit.form.myButton" onclick="upPageEnumeration();"  id="but6Enumeration" disabled='true' jsId="but6Enumeration" iconClass="upPageIcon" >pageup</button><!--span dojoType="dijit.Tooltip" connectId="but6">pageup</span-->
		<button dojoType="dijit.form.myButton" onclick="downPageEnumeration();" id="but7Enumeration" disabled='true' jsId="but7Enumeration" iconClass="downPageIcon" >pagedown</button><!--span dojoType="dijit.Tooltip" connectId="but7">pagedown</span-->
		<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
			  <div dojoType="dijit.Menu">
				  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangeEnumeration(this.label);"></div>
				  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangeEnumeration(this.label);"></div>
			  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangeEnumeration(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangeEnumeration(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpageEnumeration();"></div>
			  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
		</div>
		<button dojoType="dijit.form.myButton" onclick="allopen();"  iconClass="allopenIcon" i18n="allopen" >allopen</button>
		<button dojoType="dijit.form.myButton" onclick="allclose();" iconClass="allcloseIcon" i18n="allclose"  >allclose</button>
		</td>
	</tr>
</table>	   

<div id="gridEnumeration"  dojoType="dojox.Grid"  autoWidth="false" style="{width:100%;height:85%}" 	jsId="gridEnumeration"	model="modelEnumeration" structure="mainLayout"  ></div>
</body>
<script type="text/javascript">trans18tag();</script>
</html>					 





















					