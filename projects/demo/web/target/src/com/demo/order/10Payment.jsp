<%
String peopleId = request.getParameter("peopleId");
%>
<html>
<!--Ò»Ô¶à£¬Ö»Ò»Ò»Ó±í£¬Ã»Ð¿Ò»Ô¶Ó±var dataChild=querydataPayment[inRowIndex]-->
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
			dojo.require("projectDojo.Payment");
     </script>
        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 	<script type="text/javascript" >
		var dojoPayment= new  projectDojo.Payment();
	    dojoPayment.initPayment();
	</script>

	 	 				 
	<script type="text/javascript" >
	  var urlPayment = getUrl()+ "services/PaymentManageService";
	  var deletedataPayment =  new Array();
	  var querydataPayment =  new Array();
	  var pagenumberPayment=1;
	  var totalCountPayment=0;
	  var pagesizePayment=10;
	  var orderByPayment='0';
	  var queryvoPayment=new Object();
	  var oddstyle='';
	  var modelPayment = new dojox.grid.data.Table(null, querydataPayment);
	  var urle = getUrl()+ "services/BasicManageService";
	  var modelPaymentDetail;
	  var modelPaymentChild;
	  
	function paymentSet(id,value){
        	/*var itemselect=paymentStore._getItemByIdentity(value);
				if(itemselect!='undefined'&& itemselect!=null){
				}*/
	}


							//begin buildLayout


var mainLayout =[{//?????????colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: i18nStr.detail, width: 3, get: getCheckPayment, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				  				  {name: i18nStr.newAttr1, field: 2,width: 10}
						  						  				,   {name: i18nStr.newAttr2, field: 3,width: 10}
						  				
//
					 ,   {name: i18nStr.payment,field: 4,get:function(inRowIndex){ var str='';if(querydataPayment[inRowIndex]!=undefined && querydataPayment[inRowIndex][4]!=undefined){str=querydataPayment[inRowIndex][4][2];} return str;} ,width: 10 }
										],[
									{ name: '\u8be6\u7ec6', colSpan: 5 ,styles: 'padding: 0; margin: 0;', get: getSubPayment }//value: '<div style="height:0px; background-color: white;"></div>'
						  ]
				  ]
	  
				}];	 
var subInt=	$childRow;			
function getSubPayment(inRowIndex){
		var cell = this;
		setTimeout(function() { buildSubgridPayment(inRowIndex, cell); }, 0);
		var h =0;
		if(detailRowsPayment[inRowIndex]&&querydataPayment[inRowIndex][$childRow].length>0){
							h=65+25*querydataPayment[inRowIndex][$childRow].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}				

//end buildLayout

var detailRowsPayment=[];

function onBeforeRow(inDataIndex, inRow) {	if (inRow[1]!=undefined)inRow[1].hidden = !detailRowsPayment[inDataIndex];}	

function togglePayment(inIndex, inShow) {
        			if (!inShow) destroySubGridIdGeneral('',querydataPayment[inIndex][1],"PaymentMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataPayment[inIndex][1],"PaymentChild");
				    detailRowsPayment[inIndex] = inShow;
				    dijit.byId("gridPayment").updateRow(inIndex); 
				    
    } 

function getCheckPayment(inRowIndex) {
	var image = (detailRowsPayment[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsPayment[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="togglePayment(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}





//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}

	  
function buildSubgridPayment(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)Ç¸idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		var idmainDetail = makeSubGridIdGeneral('',querydataPayment[inRowIndex][1],"PaymentMainDetail");//makeSubgridIdMainDetail(querydataPayment[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataPayment[inRowIndex][1],"PaymentChild");
		var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataPayment[inRowIndex][$childRow];
		if(dataChild.length!=0){
			if (subGridChild){
				subGridChild.model.setData(dataChild);
				child.appendChild(subGridChild.domNode);
			}else{
				modelPaymentChild=new dojox.grid.data.Table(null, dataChild);
				var childProps= {
								autoHeight: true, 
								autoRender: false,
								rowCount:dataChild.length,
								model:modelPaymentChild,							};
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

function querybuttonPayment(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvoPayment=new Object();
	          if(queryPaymentnewAttr1.getDisplayedValue()!="")queryvoPayment.newAttr1=queryPaymentnewAttr1.getDisplayedValue();//
	          if(queryPaymentnewAttr2.getDisplayedValue()!="")queryvoPayment.newAttr2=queryPaymentnewAttr2.getDisplayedValue();//
			
	if(queryPaymentpayment.getDisplayedValue()!=""){
				var paymentQuery= new Object();
				//paymentQuery.PaymentName=queryPaymentpayment.getDisplayedValue();
				paymentQuery.id=queryPaymentpayment.getValue();
				queryvoPayment.payment=paymentQuery;
			  }

			if(validstate==0){
              pagenumberPayment=1;
              getPaymentVO(queryvoPayment); 
             }      
       }

function getPaymentVO(queryvo){
	var totalCount=0;
	deletedataPayment =new Array();
      var pu = new SOAPClientParameters2();
      pu.add('PaymentVO',queryvo) ;
      pu.add('pageNumber',pagenumberPayment) ;
	    pu.add('pageSize',pagesizePayment) ;
	    pu.add('orderBy',orderByPayment) ;
      SOAPClient.invoke(urlPayment,"getPayment", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydataPayment=new Array();
		   querydataPayment=dojoPayment.PaymentVOtoArray_fun(ul,false);
           totalCountPayment=ul[ul.length-1]["ns:id"]; 
      }); 
      querydataPayment.splice(querydataPayment.length-1,1);
	  gridPayment.selection.clear();
      modelPayment.setData(querydataPayment);
      //dijit.byId("grid").updateRowCount(querydataPayment.length); 
	   var totalpage=Math.ceil(new Number(totalCountPayment)/pagesizePayment);
	  
	if(totalpage>1){
		if(pagenumberPayment==1){
			dijit.byId("but6Payment").setDisabled(true);
			dijit.byId("but7Payment").setDisabled(false);
		}else if(pagenumberPayment==totalpage){
			dijit.byId("but6Payment").setDisabled(false);
			dijit.byId("but7Payment").setDisabled(true);
		}else{
			dijit.byId("but6Payment").setDisabled(false);
			dijit.byId("but7Payment").setDisabled(false);
		}
	}else{
		dijit.byId("but6Payment").setDisabled(true);
		dijit.byId("but7Payment").setDisabled(true);
	
	}
	if(pagesizePayment==0){
		totalpage=1;
		dijit.byId("but6Payment").setDisabled(true);
		dijit.byId("but7Payment").setDisabled(true);
	}
	if(totalpage==1)pagenumberPayment=1;
	
	 document.getElementById("rowCountPayment").innerHTML=i18nStr.di+" "+pagenumberPayment+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountPayment+" "+i18nStr.rowSize; 	
}

function init(){
	
 	dojo.connect(dijit.byId("gridPayment"), "dodblclick", function(e){
	   if(document.getElementById('queryDivPayment').style.display=='')document.getElementById('queryDivPayment').style.display='none';
	   if(document.getElementById('addDivPayment').style.display=='none')document.getElementById('addDivPayment').style.display='';
		 document.getElementById('erowIndexPayment').value=e.rowIndex;
		 document.getElementById('PaymentId').value=querydataPayment[e.rowIndex][1];
		 	 									dijit.byId("addPaymentnewAttr1").setValue(querydataPayment[e.rowIndex][2]);
						 									dijit.byId("addPaymentnewAttr2").setValue(querydataPayment[e.rowIndex][3]);
						 			 
									dijit.byId("addPaymentpayment").setValue(querydataPayment[e.rowIndex][4][1]);
								   
	});  
	gridPayment.onStyleRow=OnStyleRowClassBlue();
	getPaymentVO(queryvoPayment);
}

 dojo.addOnLoad(init);   

	function selectOrderRowdFun(rep){
		querydataPayment[dojoPayment.selectOrderRowdInRow][dojoPayment.noOrderRowd]=rep;
		gridPayment.updateRow(dojoPayment.selectOrderRowdInRow);		
	}


 
//addDiv---------------begin-------------------------------------
var addDivAdd = function(){
	 //if(document.getElementById('queryDivPayment').style.display=='')document.getElementById('queryDivPayment').style.display='none';
	 //if(document.getElementById('addDivPayment').style.display=='none')document.getElementById('addDivPayment').style.display='';
	  document.getElementById('gridSub').style.height='60px';
	 //add
															dijit.byId("addPaymentnewAttr1").setValue('');
																								dijit.byId("addPaymentnewAttr2").setValue('');
														
						dijit.byId("addPaymentpayment").setValue('');
			dijit.byId("addPaymentpayment").setDisplayedValue('');
				
	document.getElementById('PaymentId').value='0';
	
} 
function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new Object();
    vobject.id=document.getElementById('PaymentId').value;
	var passAll=0;
										if(dijit.byId("addPaymentnewAttr1").isValid(true)){
					vobject.newAttr1=dijit.byId("addPaymentnewAttr1").getValue();
				}else{
					passAll=1;
				}
															if(dijit.byId("addPaymentnewAttr2").isValid(true)){
					vobject.newAttr2=dijit.byId("addPaymentnewAttr2").getValue();
				}else{
					passAll=1;
				}
										
			if(dijit.byId("addPaymentpayment").isValid(true)){
			//vobject.payment=dijit.byId("addpayment").getValue();
			var manageable=new Object();
			manageable.id=dijit.byId("addPaymentpayment").getValue();
			vobject.payment=manageable;
		}else{
			passAll=1;
		}
		
if(passAll==0){
		var addrow=[];
														addrow.push(vobject.newAttr1);
																					addrow.push(vobject.newAttr2);
																							addrow.push([false,addPaymentpayment.getValue(),addPaymentpayment.getDisplayedValue()]);
						 if(vobject.id==0){//create new row
		padd.add('PaymentVO',vobject);
		SOAPClient.invoke(urlPayment, "createPayment", padd, false,  function GetEnu_callBack(ul, soapResponse){
			addrow.splice(0,0,false,ul);
			querydataPayment[querydataPayment.length]=addrow;
			document.getElementById('erowIndexPayment').value=querydataPayment.length-1;
			gridPayment.updateRowCount(querydataPayment.length);
			document.getElementById('PaymentId').value=ul;
			});
	 }else{//modify row
		padd.add('PaymentVO',vobject);
		SOAPClient.invoke(urlPayment, "updatePayment", padd, false,  function GetEnu_callBack(ul, soapResponse){
		});
		addrow.splice(0,0,false,vobject.id);
		querydataPayment[document.getElementById('erowIndexPayment').value]=addrow;
	 }
	}   call_funUpdGridSub();
	gridPayment.updateRow(document.getElementById('erowIndexPayment').value); 
}

 function addDivRemove(){
     if(window.confirm(i18nStr.deleteConfirm)){
       var s = dijit.byId("gridPayment").rowCount;
		console.log("sss:"+s);
        	  var delrowIndex=document.getElementById('erowIndexPayment').value;
              var sId=document.getElementById('PaymentId').value;
              var pdel = new SOAPClientParameters();      
               pdel.add('id',sId);
               SOAPClient.invoke(urlPayment, "deletePayment", pdel, false,  function GetEnu_callBack(ul, soapResponse){
               if(s-1!=delrowIndex){
					var e =document.createEvent("HTMLEvents");
					e.rowIndex=delrowIndex;
					dijit.byId("gridPayment").dodblclick(e);
			   }else{if(document.getElementById('addDivPayment').style.display=='')document.getElementById('addDivPayment').style.display='none';}
			   dijit.byId("gridPayment").model.remove(delrowIndex);
			   totalCountPayment--;
			   var totalpage=Math.ceil(new Number(new Number(totalCountPayment))/pagesizePayment);
			   document.getElementById("rowCountPayment").innerHTML=i18nStr.di+" "+pagenumberPayment+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountPayment+" "+i18nStr.rowSize; 
               
	        });   
      }
 }    
 
 function adddis(){
	
	querydisplay("addDivPayment");
	if(document.getElementById('addDivPayment').style.display!='none')addDivAdd();
} 
//addDiv---------------end---------------------------------------	 
function allopen(){
          for(var i =0;i<querydataPayment.length;i++){
            togglePayment(i,true);
          }
 }  

function allclose(){
          for(var i =0;i<querydataPayment.length;i++){
            togglePayment(i,false);
          }
}

function pageSizeChangePayment(mylabel){
	pagesizePayment=mylabel;
	pagenumberPayment=1;
	getPaymentVO(queryvoPayment);
}

function allpagePayment(){
	pagesizePayment=0;
	getPaymentVO(queryvoPayment);
}

function upPagePayment(){
	pagenumberPayment--;
	getPaymentVO(queryvoPayment);
}
function downPagePayment(){
	pagenumberPayment++;
	getPaymentVO(queryvoPayment);
}

</script>
</head>	 
<body class="tundra">
 <!--rowinum=$rowinum-->
 <!--addHeight=$addHeight-->
<div id="addDivPayment" style="margin-right: 0px;  height: 280px; display:none;" >
              <table align="center" width="100%" id="0" class="editorTable"  >
                <tr >
				<td align="center" style="{width:11%}" i18n="addNote" ></td>
                <td style="{width:22%}" ><input id="PaymentId" style="{display:none}"  type="text"  /></td>
                <td style="{width:11%}"><input id="erowIndexPayment" style="{display:none}"  type="text"  /></td>
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
				<td align="right" i18n="newAttr1" >newAttr1:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addPaymentnewAttr1"  jsId="addPaymentnewAttr1"   dojoType="dijit.form.ValidationTextBox" required="true" />
							</td>
					<td align="right" i18n="newAttr2" >newAttr2:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addPaymentnewAttr2"  jsId="addPaymentnewAttr2"   dojoType="dijit.form.ValidationTextBox" required="true" />
							</td>
	
								<td align="right"  i18n="payment"  ></td>
					<td align="left" ><input  id="addPaymentpayment"  jsId="addPaymentpayment" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoPayment.paymentStore" onchange="paymentSet(0,arguments[0]);" /></td>
					</tr>
						
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

<div id="queryDivPayment" style="margin-right: 0px;  height: 80px; display:none;" >
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
							<td align="right" i18n="newAttr1" >newAttr1:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryPaymentnewAttr1"  jsId="queryPaymentnewAttr1"   dojoType="dijit.form.TextBox"  />
													</td>
														<td align="right"  i18n="newAttr2" >newAttr2:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="queryPaymentnewAttr2"  jsId="queryPaymentnewAttr2"   dojoType="dijit.form.TextBox"  />
												</td>  
				
			
					<td align="right"  i18n="payment"  ></td>
					<td align="left" ><input  id="queryPaymentpayment"  jsId="queryPaymentpayment" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoPayment.paymentStore"  /><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryOrderRowdFloat.html"title="detail" execute="" ></div></div></td>
					</tr>
					
	
         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybuttonPayment();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
	    </div>	

<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   Payment List</b></td>
		<td align="right" >
	<!--button dojoType="dijit.form.Button" onclick="addRowPayment();" iconClass="addIcon" i18n="add"  >add</button>
	<button dojoType="dijit.form.Button" onclick="removeSelectedRowsPayment();" iconClass="delIcon" i18n="delete" >delete</button>
	<button dojoType="dijit.form.Button"  onclick="call_funUpdPayment();" i18n="save" iconClass="saveIcon">save</button>
	<button dojoType="dijit.form.Button" onclick="addDivAdd();" iconClass="addIcon"  >add</button-->
	<button dojoType="dijit.form.Button" onclick="adddis();" iconClass="openDivIcon"  i18n="edit" >openAdd</button>
	<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivPayment');" iconClass="queryIcon"  i18n="openQuery" >query</button>
	<span id="rowCountPayment"></span>
		<button dojoType="dijit.form.myButton" onclick="upPagePayment();"  id="but6Payment" disabled='true' jsId="but6Payment" iconClass="upPageIcon" >pageup</button><!--span dojoType="dijit.Tooltip" connectId="but6">pageup</span-->
		<button dojoType="dijit.form.myButton" onclick="downPagePayment();" id="but7Payment" disabled='true' jsId="but7Payment" iconClass="downPageIcon" >pagedown</button><!--span dojoType="dijit.Tooltip" connectId="but7">pagedown</span-->
		<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
			  <div dojoType="dijit.Menu">
				  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangePayment(this.label);"></div>
				  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangePayment(this.label);"></div>
			  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangePayment(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangePayment(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpagePayment();"></div>
			  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
		</div>
		<button dojoType="dijit.form.myButton" onclick="allopen();"  iconClass="allopenIcon" i18n="allopen" >allopen</button>
		<button dojoType="dijit.form.myButton" onclick="allclose();" iconClass="allcloseIcon" i18n="allclose"  >allclose</button>
		</td>
	</tr>
</table>	   

<div id="gridPayment"  dojoType="dojox.Grid"  autoWidth="false" style="{width:100%;height:85%}" 	jsId="gridPayment"	model="modelPayment" structure="mainLayout"  ></div>
</body>
<script type="text/javascript">trans18tag();</script>
</html>					 





















					