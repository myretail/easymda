		<%
String peopleId = request.getParameter("peopleId");
%>
<html>
<!--Ò»Ô¶à£¬Ö»Ò»Ò»Ó±í£¬Ã»Ð¿Ò»Ô¶Ó±var dataChild=querydataContact[inRowIndex]-->
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
			@import "../dojo/dojo-release-1.0.0/dojox/layout/tests/_expando.css";
      </style>
      <script type="text/javascript" src="../dojo/dojo-release-1.0.0/dojo/dojo.js"  
                djConfig="parseOnLoad: true, isDebug: true,locale: 'zh-cn', extraLocale: ['zh-TW', 'fr']"></script>
      <script>
    
            dojo.require("dojo.data.ItemFileWriteStore");
            dojo.require("dojo.parser");
            dojo.require("dijit.form.Button");
            dojo.require("dijit.Menu");
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
			dojo.require("dijit.layout.TabContainer");
			dojo.require("dijit.layout.BorderContainer");
			dojo.require("dijit.layout.ContentPane");
			dojo.require("dojox.layout.ExpandoPane");
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

	 		<script type="text/javascript" src="CustomerSelectPane.js"></script><!--Ò»Òª,Ò»Ô¶Â£Í²Òª-->
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
	  

//have set function's manageableAssociationEnds
	function customerSet(id,value){
        	/*var itemselect=customerStore._getItemByIdentity(value);
				if(itemselect!='undefined'&& itemselect!=null){
				}*/
	}

							                  // totleinum = 2 
	var mainLayout =[{//è·æ¯è¦æ¯ä¾æ¶è¦è·åºcolSpantoggle
					//onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
						//{ name: i18nStr.detail, width: 3, get: getCheckContact, styles: 'text-align: center;' },
							{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
						  												  {name: i18nStr.codeContact, field: 2,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
														  							 

	//
							 ,   {name: i18nStr.customer,field: 3,get:function(inRowIndex){ var str='';var strid;if(querydataContact[inRowIndex]!=undefined && querydataContact[inRowIndex][3]!=undefined && querydataContact[inRowIndex][3][1]!=undefined){str=querydataContact[inRowIndex][3][2];strid=querydataContact[inRowIndex][3][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="dojoContact.selectCustomer('+strid+','+inRowIndex+',3,0,event);"   >';} ,width: 10 }
								]/*,[
				{ name: '\u8be6\u7ec6', colSpan: 4 ,styles: 'padding: 0; margin: 0;', get: getDetailContact }//value: '<div style="height:0px; background-color: white;"></div>'
			  ]*/
		  ]

		}];	 





/*var detailRowsContact=[];

function onBeforeRow(inDataIndex, inRow) {	if (inRow[1]!=undefined)inRow[1].hidden = !detailRowsContact[inDataIndex];}	

function toggleContact(inIndex, inShow) {
        			//if (!inShow) destroySubGridIdGeneral('',querydataContact[inIndex][1],"ContactMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataContact[inIndex][1],"ContactChild");
				    detailRowsContact[inIndex] = inShow;
				    dijit.byId("gridContact").updateRow(inIndex); 
				    
    } 

function getCheckContact(inRowIndex) {
	var image = (detailRowsContact[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsContact[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleContact(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}

function getDetailContact(inRowIndex){
	if(detailRowsWlTaskRow[inRowIndex]){
		var cell = this;
		setTimeout(function() { buildSubgridContact(inRowIndex, cell); }, 0);  }
		var h =0;
		if(detailRowsContact[inRowIndex]&&querydataContact[inRowIndex][$childRow].length>0){
							h=65+25*querydataContact[inRowIndex][$childRow].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}

//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}
var childRow= ${childRow};
var layoutInRowIndex;	  
function buildSubgridContact(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)Ç¸idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		//var child = inCell.getNode(inRowIndex).lastChild;
		//var idmainDetail = makeSubGridIdGeneral('',querydataContact[inRowIndex][1],"ContactMainDetail");//makeSubgridIdMainDetail(querydataContact[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataContact[inRowIndex][1],"ContactChild");
		//var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataContact[inRowIndex][$childRow];
		//if(dataChild.length!=0){
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
					childLayoutOdd=buildChildLayout(pre,headerstyleodd,inRowIndex);	
					childProps.structure=childLayoutOdd;
				}else{
					childLayout=buildChildLayout(pre,headerstyle,inRowIndex);
					childProps.structure=childLayout;
				}
				subGridChild = new dojox.Grid(childProps, child);//gridÎªÇ¶×±Ê±Ô¶DIVÄ´Ð¡
			}
			if (subGridChild) {
				subGridChild.render();
				subGridChild.cacheHeight = subGridChild.domNode.offsetHeight;
			}	      				
		//}
		
		////////////////////////////////////////////////////////////////////////////////var detailDate=[];//Í¡/
		detailDate[0]=querydataContact[inRowIndex];  
	    modelContactDetail=new dojox.grid.data.Table(null, detailDate);
		if (subGridMainDetail) {
			subGridMainDetail.model.setData(detailDate);
			mainDetail.appendChild(subGridMainDetail.domNode);
		} else {
			var mainDetailProps = {
				rowCount: 1, 
				autoHeight: true, 
				autoRender: false,
				model:modelContactDetail
				};
				mainDetailProps.dataRow = inRowIndex;
				mainDetailProps.id = idmainDetail;//	tasksubGridProps.widgetId = id;
				if(Math.ceil(inRowIndex/2)>inRowIndex/2){
					mainDetailProps.structure=mainDetailLayoutOdd;
				}else{
					mainDetailProps.structure=mainDetailLayout;
				}
				subGridMainDetail = new dojox.Grid(mainDetailProps, mainDetail );
		}
			
		if (subGridMainDetail) {
				subGridMainDetail.render();
				subGridMainDetail.cacheHeight = subGridMainDetail.domNode.offsetHeight;
			}//////////////////////////////////////////////////////////////////////////////////	
		inCell.grid.rowHeightChanged(inRowIndex);
    }   
}
//var childLayout=//???????????????????????????????/ Ö±É£jshtml
*/
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
		   querydataContact=dojoContact.ContactVOtoArray_fun(ul,true);
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
	
 	gridContact.onStyleRow=OnStyleRowClassBlue();
	getContactVO(queryvoContact);
	
}

 dojo.addOnLoad(init);   

	function selectCustomerFun(rep){
		querydataContact[dojoContact.selectCustomerInRow][dojoContact.noCustomer]=rep;
		gridContact.updateRow(dojoContact.selectCustomerInRow);		
	}


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
var addRowContact = function(){
var addrow=[];
														addrow.push('');
																							if(ifMultPanecontacts2customer!=undefined){
					var re=selectcontacts2customerFunClick();
					addrow.push(re);}
						addrow.splice(0,0,false,0);
	gridContact.addRow(addrow,gridContact.model.getRowCount());
} 

function removeContact(){
       var s= new Array();
       var sall=gridContact.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            deletedataContact.splice(deletedataContact.length,0,thisCell[1]);
       }}}
       gridContact.model.remove(s);//grid.removeSelectedRows();
 }
function call_funUpdContact() {
       var sall=gridContact.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];
              if(dojox.validate.isText(thisCell[2], {minlength: 1})){vobject.codeContact=thisCell[2];
             }else{gridContact.getCell(gridContact.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 

								var manageable=new Object();
			 if(querydataContact[i][3]!=''&&querydataContact[i][3]!=undefined){
             manageable.id=querydataContact[i][3][1];
             vobject.customer=manageable;
			 }else{
			 gridContact.getCell(gridContact.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
			


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('ContactVO',vobject);
                SOAPClient.invoke(urlContact, "createContact", padd, false,  function GetEnu_callBack(ul, soapResponse){
                gridContact.model.setDatum(ul,i,1);
				});
	         }else{//modify row
                padd.add('ContactVO',vobject);
                SOAPClient.invoke(urlContact, "updateContact", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
			 //call_funUpdGridSub();
        } }}//for
//submit delete
          for(var i=0;i<deletedataContact.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedataContact[i]);
               SOAPClient.invoke(urlContact, "deleteContact", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          deletedataContact=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
	
 } 
 					//totleinum=2
 //rowinum=0

</script>
</head>	 
<body class="tundra">
<div id="bc" style="width:100%; height:100%;" dojoType="dijit.layout.BorderContainer">
<div dojoType="dijit.layout.ContentPane"  title="" region="center" id="topPane" 	 >
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
				

    </tr>
//
								<tr><td align="right"  i18n="customer"  ></td>
					<td align="left" ><input  id="queryContactcustomer"  jsId="queryContactcustomer" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoContact.customerStore"  /></td>  
						    </tr>

         <tr align="center"><td></td>
           <td colspan="2"> <button dojoType="dijit.form.Button" onclick="querybutton();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="3"></td><td colspan="2"></td></tr>
         </table>
</div>	

<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   Contact List</b></td>
		<td align="right" >
	<button dojoType="dijit.form.Button" onclick="addRowContact();" iconClass="addIcon" i18n="add"  >add</button>
	<button dojoType="dijit.form.Button" onclick="removeContact();" iconClass="delIcon" i18n="delete" >delete</button>
	<button dojoType="dijit.form.Button"  onclick="call_funUpdContact();" i18n="save" iconClass="saveIcon">save</button>
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
</div>  
    
<div dojoType="dojox.layout.ExpandoPane" splitter="true" duration="125" region="bottom" title="" style="height:375px;"  onLoad="myOnLoad" id="bottomPane" jsId="bottomPane" ><!--href="ContactSelectTab.html"-->
								<table id="contacts2customerTable"  style=" position:absolute;top:0px; width:90%; visibility:visible ">
				<tr height="25px" width="100%">
		<td align="right" >
					<span id="rowCountpanecontacts2customer"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button dojoType="dijit.form.myButton" onclick="upPagepanecontacts2customer();"  id="but6panecontacts2customer" disabled='true' jsId="but6panecontacts2customer" iconClass="upPageIcon" >pageup</button>
					<button dojoType="dijit.form.myButton" onclick="downPagepanecontacts2customer();" id="but7panecontacts2customer" disabled='true' jsId="but7panecontacts2customer" iconClass="downPageIcon" >pagedown</button>
	</td></tr></table>
						<div dojoType="dojox.layout.ContentPane" href="../common/contacts2customerSelectPane.html"  >  </div>
	</div>

</div>
</body>
<script type="text/javascript">trans18tag();</script>
</html>		
