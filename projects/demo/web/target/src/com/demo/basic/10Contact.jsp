<%
String peopleId = request.getParameter("peopleId");
%>
<html>
<!--????¨¤?????????¡À¨ª???????????¡Àvar dataChild=querydataContact[inRowIndex]-->
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
			dojo.require("projectDojo.Contact");
     </script>
        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 	<script type="text/javascript" >
		var dojoContact= new  projectDojo.Contact();
	    dojoContact.initContact();
	</script>

	 	 				 
	<script type="text/javascript" >
	  var urlContact = getUrl()+ "services/ContactManageService";
	  var deletedataContact =  new Array();
	  var querydataContact =  new Array();
	  var pagenumberContact=1;
	  var totalCountContact=0;
	  var pagesizeContact=10;
	  var orderByContact='0';
	  var queryvoContact=new Object();
	  var oddstyle='';
	  var modelContact = new dojox.grid.data.Table(null, querydataContact);
	  var urle = getUrl()+ "services/BasicManageService";
	  var modelContactDetail;
	  var modelContactChild;
	  
	function customerSet(id,value){
        	/*var itemselect=customerStore._getItemByIdentity(value);
				if(itemselect!='undefined'&& itemselect!=null){
				}*/
	}


					//begin buildLayout


var mainLayout =[{//?????????colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: i18nStr.detail, width: 3, get: getCheckContact, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				  				  {name: i18nStr.codeContact, field: 2,width: 10}
						  				
//
					 ,   {name: i18nStr.customer,field: 3,get:function(inRowIndex){ var str='';if(querydataContact[inRowIndex]!=undefined && querydataContact[inRowIndex][3]!=undefined){str=querydataContact[inRowIndex][3][2];} return str;} ,width: 10 }
										],[
									{ name: '\u8be6\u7ec6', colSpan: 4 ,styles: 'padding: 0; margin: 0;', get: getSubContact }//value: '<div style="height:0px; background-color: white;"></div>'
						  ]
				  ]
	  
				}];	 
var subInt=	$childRow;			
function getSubContact(inRowIndex){
		var cell = this;
		setTimeout(function() { buildSubgridContact(inRowIndex, cell); }, 0);
		var h =0;
		if(detailRowsContact[inRowIndex]&&querydataContact[inRowIndex][$childRow].length>0){
							h=65+25*querydataContact[inRowIndex][$childRow].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}				

//end buildLayout

var detailRowsContact=[];

function onBeforeRow(inDataIndex, inRow) {	if (inRow[1]!=undefined)inRow[1].hidden = !detailRowsContact[inDataIndex];}	

function toggleContact(inIndex, inShow) {
        			if (!inShow) destroySubGridIdGeneral('',querydataContact[inIndex][1],"ContactMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataContact[inIndex][1],"ContactChild");
				    detailRowsContact[inIndex] = inShow;
				    dijit.byId("gridContact").updateRow(inIndex); 
				    
    } 

function getCheckContact(inRowIndex) {
	var image = (detailRowsContact[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsContact[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleContact(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}





//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}

	  
function buildSubgridContact(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)??idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		var idmainDetail = makeSubGridIdGeneral('',querydataContact[inRowIndex][1],"ContactMainDetail");//makeSubgridIdMainDetail(querydataContact[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataContact[inRowIndex][1],"ContactChild");
		var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataContact[inRowIndex][$childRow];
		if(dataChild.length!=0){
			if (subGridChild){
				subGridChild.model.setData(dataChild);
				child.appendChild(subGridChild.domNode);
			}else{
				modelContactChild=new dojox.grid.data.Table(null, dataChild);
				var childProps= {
								autoHeight: true, 
								autoRender: false,
								rowCount:dataChild.length,
								model:modelContactChild,							};
				childProps.dataRow = inRowIndex;
				childProps.id = idchild;
				if(Math.ceil(inRowIndex/2)>inRowIndex/2){
					childProps.structure=childLayoutOdd;
				}else{
					childProps.structure=childLayout;
				}
				subGridChild = new dojox.Grid(childProps, child);//grid????¡Á¡À?¡À??DIV????
			}
			if (subGridChild) {
				subGridChild.render();
				subGridChild.cacheHeight = subGridChild.domNode.offsetHeight;
			}	      				
		}
		inCell.grid.rowHeightChanged(inRowIndex);
    }   
}
//var childLayout=//???????????????????????????????/ ?¡À??jshtml

function querybuttonContact(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvoContact=new Object();
	          if(queryContactcodeContact.getDisplayedValue()!="")queryvoContact.codeContact=queryContactcodeContact.getDisplayedValue();//
			
	if(queryContactcustomer.getDisplayedValue()!=""){
				var customerQuery= new Object();
				//customerQuery.ContactName=queryContactcustomer.getDisplayedValue();
				customerQuery.id=queryContactcustomer.getValue();
				queryvoContact.customer=customerQuery;
			  }

			if(validstate==0){
              pagenumberContact=1;
              getContactVO(queryvoContact); 
             }      
       }

function getContactVO(queryvo){
	var totalCount=0;
	deletedataContact =new Array();
      var pu = new SOAPClientParameters2();
      pu.add('ContactVO',queryvo) ;
      pu.add('pageNumber',pagenumberContact) ;
	    pu.add('pageSize',pagesizeContact) ;
	    pu.add('orderBy',orderByContact) ;
      SOAPClient.invoke(urlContact,"getContact", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydataContact=new Array();
		   querydataContact=dojoContact.ContactVOtoArray_fun(ul,false);
           totalCountContact=ul[ul.length-1]["ns:id"]; 
      }); 
      querydataContact.splice(querydataContact.length-1,1);
	  gridContact.selection.clear();
      modelContact.setData(querydataContact);
      //dijit.byId("grid").updateRowCount(querydataContact.length); 
	   var totalpage=Math.ceil(new Number(totalCountContact)/pagesizeContact);
	  
	if(totalpage>1){
		if(pagenumberContact==1){
			dijit.byId("but6Contact").setDisabled(true);
			dijit.byId("but7Contact").setDisabled(false);
		}else if(pagenumberContact==totalpage){
			dijit.byId("but6Contact").setDisabled(false);
			dijit.byId("but7Contact").setDisabled(true);
		}else{
			dijit.byId("but6Contact").setDisabled(false);
			dijit.byId("but7Contact").setDisabled(false);
		}
	}else{
		dijit.byId("but6Contact").setDisabled(true);
		dijit.byId("but7Contact").setDisabled(true);
	
	}
	if(pagesizeContact==0){
		totalpage=1;
		dijit.byId("but6Contact").setDisabled(true);
		dijit.byId("but7Contact").setDisabled(true);
	}
	if(totalpage==1)pagenumberContact=1;
	
	 document.getElementById("rowCountContact").innerHTML=i18nStr.di+" "+pagenumberContact+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountContact+" "+i18nStr.rowSize; 	
}

function init(){
	
 	dojo.connect(dijit.byId("gridContact"), "dodblclick", function(e){
	   if(document.getElementById('queryDivContact').style.display=='')document.getElementById('queryDivContact').style.display='none';
	   if(document.getElementById('addDivContact').style.display=='none')document.getElementById('addDivContact').style.display='';
		 document.getElementById('erowIndexContact').value=e.rowIndex;
		 document.getElementById('ContactId').value=querydataContact[e.rowIndex][1];
		 	 									dijit.byId("addContactcodeContact").setValue(querydataContact[e.rowIndex][2]);
						 			 
									dijit.byId("addContactcustomer").setValue(querydataContact[e.rowIndex][3][1]);
								   
	});  
	gridContact.onStyleRow=OnStyleRowClassBlue();
	getContactVO(queryvoContact);
}

 dojo.addOnLoad(init);   

	function selectCustomerFun(rep){
		querydataContact[dojoContact.selectCustomerInRow][dojoContact.noCustomer]=rep;
		gridContact.updateRow(dojoContact.selectCustomerInRow);		
	}


 
//addDiv---------------begin-------------------------------------
var addDivAdd = function(){
	 //if(document.getElementById('queryDivContact').style.display=='')document.getElementById('queryDivContact').style.display='none';
	 //if(document.getElementById('addDivContact').style.display=='none')document.getElementById('addDivContact').style.display='';
	  document.getElementById('gridSub').style.height='60px';
	 //add
															dijit.byId("addContactcodeContact").setValue('');
														
						dijit.byId("addContactcustomer").setValue('');
			dijit.byId("addContactcustomer").setDisplayedValue('');
				
	document.getElementById('ContactId').value='0';
	
} 
function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new Object();
    vobject.id=document.getElementById('ContactId').value;
	var passAll=0;
										if(dijit.byId("addContactcodeContact").isValid(true)){
					vobject.codeContact=dijit.byId("addContactcodeContact").getValue();
				}else{
					passAll=1;
				}
										
			if(dijit.byId("addContactcustomer").isValid(true)){
			//vobject.customer=dijit.byId("addcustomer").getValue();
			var manageable=new Object();
			manageable.id=dijit.byId("addContactcustomer").getValue();
			vobject.customer=manageable;
		}else{
			passAll=1;
		}
		
if(passAll==0){
		var addrow=[];
														addrow.push(vobject.codeContact);
																							addrow.push([false,addContactcustomer.getValue(),addContactcustomer.getDisplayedValue()]);
						 if(vobject.id==0){//create new row
		padd.add('ContactVO',vobject);
		SOAPClient.invoke(urlContact, "createContact", padd, false,  function GetEnu_callBack(ul, soapResponse){
			addrow.splice(0,0,false,ul);
			querydataContact[querydataContact.length]=addrow;
			document.getElementById('erowIndexContact').value=querydataContact.length-1;
			gridContact.updateRowCount(querydataContact.length);
			document.getElementById('ContactId').value=ul;
			});
	 }else{//modify row
		padd.add('ContactVO',vobject);
		SOAPClient.invoke(urlContact, "updateContact", padd, false,  function GetEnu_callBack(ul, soapResponse){
		});
		addrow.splice(0,0,false,vobject.id);
		querydataContact[document.getElementById('erowIndexContact').value]=addrow;
	 }
	}   call_funUpdGridSub();
	gridContact.updateRow(document.getElementById('erowIndexContact').value); 
}

 function addDivRemove(){
     if(window.confirm(i18nStr.deleteConfirm)){
       var s = dijit.byId("gridContact").rowCount;
		console.log("sss:"+s);
        	  var delrowIndex=document.getElementById('erowIndexContact').value;
              var sId=document.getElementById('ContactId').value;
              var pdel = new SOAPClientParameters();      
               pdel.add('id',sId);
               SOAPClient.invoke(urlContact, "deleteContact", pdel, false,  function GetEnu_callBack(ul, soapResponse){
               if(s-1!=delrowIndex){
					var e =document.createEvent("HTMLEvents");
					e.rowIndex=delrowIndex;
					dijit.byId("gridContact").dodblclick(e);
			   }else{if(document.getElementById('addDivContact').style.display=='')document.getElementById('addDivContact').style.display='none';}
			   dijit.byId("gridContact").model.remove(delrowIndex);
			   totalCountContact--;
			   var totalpage=Math.ceil(new Number(new Number(totalCountContact))/pagesizeContact);
			   document.getElementById("rowCountContact").innerHTML=i18nStr.di+" "+pagenumberContact+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountContact+" "+i18nStr.rowSize; 
               
	        });   
      }
 }    
 
 function adddis(){
	
	querydisplay("addDivContact");
	if(document.getElementById('addDivContact').style.display!='none')addDivAdd();
} 
//addDiv---------------end---------------------------------------	 
function allopen(){
          for(var i =0;i<querydataContact.length;i++){
            toggleContact(i,true);
          }
 }  

function allclose(){
          for(var i =0;i<querydataContact.length;i++){
            toggleContact(i,false);
          }
}

function pageSizeChangeContact(mylabel){
	pagesizeContact=mylabel;
	pagenumberContact=1;
	getContactVO(queryvoContact);
}

function allpageContact(){
	pagesizeContact=0;
	getContactVO(queryvoContact);
}

function upPageContact(){
	pagenumberContact--;
	getContactVO(queryvoContact);
}
function downPageContact(){
	pagenumberContact++;
	getContactVO(queryvoContact);
}

</script>
</head>	 
<body class="tundra">
 <!--rowinum=$rowinum-->
 <!--addHeight=$addHeight-->
<div id="addDivContact" style="margin-right: 0px;  height: 280px; display:none;" >
              <table align="center" width="100%" id="0" class="editorTable"  >
                <tr >
				<td align="center" style="{width:11%}" i18n="addNote" ></td>
                <td style="{width:22%}" ><input id="ContactId" style="{display:none}"  type="text"  /></td>
                <td style="{width:11%}"><input id="erowIndexContact" style="{display:none}"  type="text"  /></td>
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
				<td align="right" i18n="codeContact" >codeContact:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addContactcodeContact"  jsId="addContactcodeContact"   dojoType="dijit.form.ValidationTextBox" required="true" />
							</td>
	
								<td align="right"  i18n="customer"  ></td>
					<td align="left" ><!--colspan="3" --><input  id="addContactcustomer"  jsId="addContactcustomer" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoContact.customerStore" onchange="customerSet(0,arguments[0]);" /></td>  
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

<div id="queryDivContact" style="margin-right: 0px;  height: 80px; display:none;" >
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
							<td align="right" i18n="codeContact" >codeContact:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryContactcodeContact"  jsId="queryContactcodeContact"   dojoType="dijit.form.TextBox"  />
													</td>
				
			
					<td align="right"  i18n="customer"  ></td>
					<td align="left" colspan="3"  ><!----><input  id="queryContactcustomer"  jsId="queryContactcustomer" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoContact.customerStore"  /><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryCustomerFloat.html"title="detail" execute="" ></div></div></td>  
					
	    <td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybuttonContact();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
	    </div>	

<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   Contact List</b></td>
		<td align="right" >
	<!--button dojoType="dijit.form.Button" onclick="addRowContact();" iconClass="addIcon" i18n="add"  >add</button>
	<button dojoType="dijit.form.Button" onclick="removeSelectedRowsContact();" iconClass="delIcon" i18n="delete" >delete</button>
	<button dojoType="dijit.form.Button"  onclick="call_funUpdContact();" i18n="save" iconClass="saveIcon">save</button>
	<button dojoType="dijit.form.Button" onclick="addDivAdd();" iconClass="addIcon"  >add</button-->
	<button dojoType="dijit.form.Button" onclick="adddis();" iconClass="openDivIcon"  i18n="edit" >openAdd</button>
	<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivContact');" iconClass="queryIcon"  i18n="openQuery" >query</button>
	<span id="rowCountContact"></span>
		<button dojoType="dijit.form.myButton" onclick="upPageContact();"  id="but6Contact" disabled='true' jsId="but6Contact" iconClass="upPageIcon" >pageup</button><!--span dojoType="dijit.Tooltip" connectId="but6">pageup</span-->
		<button dojoType="dijit.form.myButton" onclick="downPageContact();" id="but7Contact" disabled='true' jsId="but7Contact" iconClass="downPageIcon" >pagedown</button><!--span dojoType="dijit.Tooltip" connectId="but7">pagedown</span-->
		<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
			  <div dojoType="dijit.Menu">
				  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangeContact(this.label);"></div>
				  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangeContact(this.label);"></div>
			  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangeContact(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangeContact(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpageContact();"></div>
			  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
		</div>
		<button dojoType="dijit.form.myButton" onclick="allopen();"  iconClass="allopenIcon" i18n="allopen" >allopen</button>
		<button dojoType="dijit.form.myButton" onclick="allclose();" iconClass="allcloseIcon" i18n="allclose"  >allclose</button>
		</td>
	</tr>
</table>	   

<div id="gridContact"  dojoType="dojox.Grid"  autoWidth="false" style="{width:100%;height:85%}" 	jsId="gridContact"	model="modelContact" structure="mainLayout"  ></div>
</body>
<script type="text/javascript">trans18tag();</script>
</html>					 





















					