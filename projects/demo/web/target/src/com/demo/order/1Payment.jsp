<%
String peopleId = request.getParameter("peopleId");
%>
<html>
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
			dojo.require("dijit.Dialog");
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
            dojo.registerModulePath("mydojo", "../../../js/mydojo");
            dojo.require("mydojo.FilteringSelect");
            dojo.require("mydojo.ValidationTextBox");
            dojo.require("mydojo.NumberTextBox");
			dojo.registerModulePath("projectDojo", "../../../dojo/projectDojo");
			dojo.require("projectDojo.Payment");
     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
	 <script type="text/javascript" >
	//manageablePackageName=com.demo.entity.order.crud
	//packageName=com.demo.entity.order
	  
	  </script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 <script type="text/javascript" >
	  var url = getUrl()+ "services/PaymentManageService";
	  var dojoPayment= new  projectDojo.Payment();
	  dojoPayment.initPayment();
	  var deletedata =  new Array();
	  var querydata =  new Array();
	  var pagenumber=1;
	  var pagesize=10;
	  var totalCount=0;
	  var queryvo=new Object();
	  var oddstyle='';
	  var model = new dojox.grid.data.Table(null, querydata);
	  var urle = getUrl()+ "services/BasicManageService"; 

 
//???¡À????1212??layout??layoutstructure
//enumeration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
							
/*//????¡ã?
					function setOrderRowdDetailFun(inrow,OrderRowdColNo){
					return querydata[inrow][OrderRowdColNo];
				}
			*/
/*function setDetailFloatFun(inrow,ColNo){
	return querydata[inrow][ColNo];
}	*/

var layoutSingleRow=[{
          
 //field????????¨°???js??toArray¡Á???querydate??
	   
				 cells: [ [
							//{name: '??', width: 3, get:getChoise},
						   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
						   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
      				  {name: i18nStr.newAttr1, field: 2,width: 8}
					       				,   {name: i18nStr.newAttr2, field: 3,width: 8}
					 
//??¨ª????
					 ,   {name: i18nStr.payment,field: 4,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][4]!=undefined && querydata[inRowIndex][4][2]){str=querydata[inRowIndex][4][2];strid=querydata[inRowIndex][4][1];} return str+'<img src="../image/detailFloat.jpg" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoPayment.detailFloatOrderRowdData=querydata['+inRowIndex+'][4];dojoPayment.detailOrderRowd('+querydata[inRowIndex][4][1]+','+inRowIndex+',4,0,event,0);"   >';} ,width: 10 }
			                                        ] ]
                           }]; 
						   
						   

	 
function querybutton(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvo=new Object();
	          if(querynewAttr1.getDisplayedValue()!="")queryvo.newAttr1=querynewAttr1.getDisplayedValue();//
	          if(querynewAttr2.getDisplayedValue()!="")queryvo.newAttr2=querynewAttr2.getDisplayedValue();//
			
	var paymentQuery= new Object();
	if(dojo.byId("querypaymentForPaymentDiv")!=undefined && getQueryCondpaymentForPayment(paymentQuery)){
		queryvo.payment=paymentQuery;
	}else if(querypayment.getDisplayedValue()!=""){
		//var prodCustQuery= new Object();
		//prodCustQuery.ProdName=queryprodCust.getDisplayedValue();
		paymentQuery.id=querypayment.getValue();
		queryvo.payment=prodpayment;
	}

			if(validstate==0){
              pagenumber=1;
              getVO(queryvo,pagenumber,pagesize,'0'); 
              //if(totalpage>1){dijit.byId("but7").setDisabled(false);}else{dijit.byId("but7").setDisabled(true);} 
             }      
}
	 
querydis = function(){
               querydisplay("queryDiv");
            }
 
 


function getVO(queryvo,pagenumber,pagesize,orderBy){
	
      var pu = new SOAPClientParameters2();
      pu.add('PaymentVO',queryvo) ;
      pu.add('pageNumber',pagenumber) ;
	    pu.add('pageSize',pagesize) ;
	    pu.add('orderBy',orderBy) ;
      SOAPClient.invoke(url,"getPayment", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydata=new Array();
		   querydata=dojoPayment.PaymentVOtoArray_fun(ul,false);
           totalCount=ul[ul.length-1]["ns:id"]; 
           //totalpage=Math.ceil(new Number(totalCount)/pagesize);
           //document.getElementById("rowCount").innerHTML=" "+pagenumber+" / "+totalpage+" / "+totalCount+" " ;
      }); 
      querydata.splice(querydata.length-1,1);
      model.setData(querydata);
      //dijit.byId("grid").updateRowCount(querydata.length); 
	   var totalpage=Math.ceil(new Number(totalCount)/pagesize);
	  
	if(totalpage>1){
		if(pagenumber==1){
			dijit.byId("but6").setDisabled(true);
			dijit.byId("but7").setDisabled(false);
		}else if(pagenumber==totalpage){
			dijit.byId("but6").setDisabled(false);
			dijit.byId("but7").setDisabled(true);
		}else{
			dijit.byId("but6").setDisabled(false);
			dijit.byId("but7").setDisabled(false);
		}
	}else{
		dijit.byId("but6").setDisabled(true);
		dijit.byId("but7").setDisabled(true);
	
	}
	if(pagesize==0){
		totalpage=1;
		dijit.byId("but6").setDisabled(true);
		dijit.byId("but7").setDisabled(true);
	}
	if(totalpage==1)pagenumber=1;
	
	 document.getElementById("rowCount").innerHTML=i18nStr.di+" "+pagenumber+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCount+" "+i18nStr.rowSize; 	
	  
	  
 }
 
function init(){
  getVO(queryvo,pagenumber,pagesize,'0');
  //if(totalpage>1)dijit.byId("but7").setDisabled(false);
  
 	dojo.connect(dijit.byId("grid"), "dodblclick", function(e){
	   if(document.getElementById('queryDiv').style.display=='')document.getElementById('queryDiv').style.display='none';
	   if(document.getElementById('addDiv').style.display=='none')document.getElementById('addDiv').style.display='';
		 document.getElementById('erowIndex').value=e.rowIndex;
		 document.getElementById('PaymentId').value=querydata[e.rowIndex][1];
		 	 									//enumeration ?¡§String??¨ª??
				dijit.byId("addnewAttr1").setValue(querydata[e.rowIndex][2]);
						 									//enumeration ?¡§String??¨ª??
				dijit.byId("addnewAttr2").setValue(querydata[e.rowIndex][3]);
						 			 
								dijit.byId("addpayment").setValue(querydata[e.rowIndex][4][1]);
			//dijit.byId("addpayment").setDisplayedValue('');
						});     
}

 dojo.addOnLoad(init);   

	function selectOrderRowdFun(rep){
		querydata[dojoPayment.selectOrderRowdInRow][dojoPayment.noOrderRowd]=rep;
		grid.updateRow(dojoPayment.selectOrderRowdInRow);		
	}
//addDiv---------------begin-------------------------------------
var addDivAdd = function(){
	 //if(document.getElementById('queryDiv').style.display=='')document.getElementById('queryDiv').style.display='none';
	 //if(document.getElementById('addDiv').style.display=='none')document.getElementById('addDiv').style.display='';
	 //add
										//enumeration ?¡§String??¨ª??
				
									dijit.byId("addnewAttr1").setValue('');
																			//enumeration ?¡§String??¨ª??
				
									dijit.byId("addnewAttr2").setValue('');
														
					dijit.byId("addpayment").setValue('');
	    dijit.byId("addpayment").setDisplayedValue('');
				
	document.getElementById('PaymentId').value='0';
	//document.getElementById('referTimeAdd1').value=dojo.date.locale.format(new Date(),{ datePattern: "yyyy-MM-dd", selector: "date"});
	//document.getElementById('referTimeAdd2').value=dojo.date.locale.format(new Date(),{ timePattern: "HH:mm", selector: "time"});
} 
function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new Object();
    vobject.id=document.getElementById('PaymentId').value;
	var passAll=0;
										//enumeration ?¡§String??¨ª??
				if(dijit.byId("addnewAttr1").validate(true)){
					vobject.newAttr1=dijit.byId("addnewAttr1").getValue();
				}else{
					setErrorClass(dijit.byId("addnewAttr1")); passAll=1;
				}
															//enumeration ?¡§String??¨ª??
				if(dijit.byId("addnewAttr2").validate(true)){
					vobject.newAttr2=dijit.byId("addnewAttr2").getValue();
				}else{
					setErrorClass(dijit.byId("addnewAttr2")); passAll=1;
				}
										
		if(dijit.byId("addpayment").validate(true)){
		//vobject.payment=dijit.byId("addpayment").getValue();
		var manageable=new Object();
		manageable.id=dijit.byId("addpayment").getValue();
		vobject.payment=manageable;
	}else{
		setErrorClass(dijit.byId("addpayment")); passAll=1;
	}
		
if(passAll==0){
		//var addrow='';
		var addrow=[];
														//addrow=addrow+","+vobject.newAttr1;
					addrow.push(vobject.newAttr1);
																					//addrow=addrow+","+vobject.newAttr2;
					addrow.push(vobject.newAttr2);
																						//addrow=addrow+","+OrderRowdVOtoArray_fun(vobject.payment,true);//addrow.push(OrderRowdVOtoArray_fun(vobject.payment,true));
			addrow.push([false,addpayment.getValue(),addpayment.getDisplayedValue()]);
						 if(vobject.id==0){//create new row
		padd.add('PaymentVO',vobject);
		SOAPClient.invoke(url, "createPayment", padd, false,  function GetEnu_callBack(ul, soapResponse){
		//addrow='false,ul'+addrow;
		addrow.splice(0,0,false,ul);
				console.log("addrow.lenght:"+addrow.length);
				console.log("addrow:"+addrow);
		grid.addRow(addrow ,grid.model.getRowCount());//grid.addRow([addrow]);
		});
	 }else{//modify row
		padd.add('PaymentVO',vobject);
		SOAPClient.invoke(url, "updatePayment", padd, false,  function GetEnu_callBack(ul, soapResponse){
		});
		//addrow='false,vobject.id'+addrow;
		addrow.splice(0,0,false,vobject.id);
		querydata[document.getElementById('erowIndex').value]=addrow;//[addrow];
		grid.updateRow(document.getElementById('erowIndex').value);
	 }
}   }

 function addDivRemove(){
     if(window.confirm(i18nStr.deleteConfirm)){
        //var s = dijit.byId("grid").selection.getSelected();
		var s = dijit.byId("grid").rowCount;
        //for(var i=0;i<s.length;i++){ 
              //var ii=s[i];
			  var ii=s.length;
              var si=document.getElementById('erowIndex').value;
              var pdel = new SOAPClientParameters();      
               //pdel.add('id',querydata[ii][1]);
			   pdel.add('id',si);
               SOAPClient.invoke(url, "deletePayment", pdel, false,  function GetEnu_callBack(ul, soapResponse){
               if(si>ii){
					if(si-1>=0){document.getElementById('erowIndex').value=si-1;}//else{document.getElementById('erowIndex').value='';}//????????????????????????????????//
               }
			   totalCount--;
               var totalpage=Math.ceil(new Number(totalCount)/pagesize);
               document.getElementById("rowCount").innerHTML = i18nStr.di+" "+pagenumber+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCount+" "+i18nStr.rowSize; 	
               if(si=ii){if(document.getElementById('addDiv').style.display=='')document.getElementById('addDiv').style.display='none';}
	        });   
          //}             
           dijit.byId("grid").removeSelectedRows();
      }
 }    
 
function adddis(){
	
	querydisplay("addDiv");
	if(document.getElementById('addDiv').style.display!='none')addDivAdd();
} 
//addDiv---------------end---------------------------------------	 
//totleinum=3
 //rowinum=1
 //addHeight=100
</script>
</head>	 
<body class="tundra">
	<div id="addDiv" style="margin:25px 0px 20px 0px;  height:100px; display:none;" >
		<div  class="titleDiv"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font i18n="addNote">add</font></div>
              <table align="center" width="100%" id="0" class="editorTable"  >
                <tr >
				<td align="center" style="{width:11%}">&nbsp;</td>
                <td style="{width:22%}" ><input id="PaymentId" style="{display:none}"  type="text"  /></td>
                <td style="{width:11%}"><input id="erowIndex" style="{display:none}"  type="text"  /></td>
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
										<input type="text" class="editerInput"  id="addnewAttr1"  jsId="addnewAttr1"   dojoType="dijit.form.ValidationTextBox" required="true" />
							</td>
					<td align="right" i18n="newAttr2" >newAttr2:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addnewAttr2"  jsId="addnewAttr2"   dojoType="dijit.form.ValidationTextBox" required="true" />
							</td>
	
 <!--//if (3==1)     
//   /tr
//end

//set ($inume =1) -->
								<td align="right"  i18n="payment"  ></td>
					<td align="left" ><input  id="addpayment"  jsId="addpayment" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoPayment.paymentStore" onchange="paymentSet(0,arguments[0]);" required="true" /></td>
					</tr>
						 <tr align="center"><td></td>
           <td colspan="5"><button dojoType="dijit.form.Button" onclick="addDivAdd();" iconClass="addIcon"  i18n="add" >add</button>
				<button dojoType="dijit.form.Button" onclick="addDivRemove();" iconClass="delIcon"  i18n="delete" >remove</button>
				<button dojoType="dijit.form.Button" onclick="addDivSave();" iconClass="saveIcon"   i18n="save">save</button></td>
           <td colspan="2"></td></tr>
</table></div>
<div id="queryDiv" style="margin:25px 0px 20px 0px; height: 100px; display:none;" >
 <div  class="titleDiv"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font i18n="queryNote"></font></div>
  <table align="center" width=100% class="queryTable"  >
	<tr >
	<td align="center" style="{width:11%}"  >&nbsp;</td>
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
						
															<input type="text" class="editerInput"  id="querynewAttr1"  jsId="querynewAttr1"   dojoType="dijit.form.TextBox"  />
													</td>
														<td align="right"  i18n="newAttr2" >newAttr2:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="querynewAttr2"  jsId="querynewAttr2"   dojoType="dijit.form.TextBox"  />
												</td>  
				<!--
//if (!="over" && 3!=1)     
/tr
//end 
//set ($inume =1) -->
			
					<td align="right"  i18n="payment"  ></td>
					<td align="left" ><table class="innerTable">
							<tr>
								<td   ><input  id="querypayment"  jsId="querypayment" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoPayment.paymentStore"  /></td><td align="left" ><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon" class="downButtonStyle"  ><div dojoType="dijit.TooltipDialog"  href="../common/querypaymentForPaymentFloat.html"title="detail" execute="" ></div></div></td>
							</tr>
						</table></td>
					</tr>
					
	
          <tr align="center"><td ></td>
           <td colspan="3"></td><td colspan="3" align="left"> <button dojoType="dijit.form.Button" onclick="querybutton();" iconClass="queryIcon"  i18n="query" >query</button>&nbsp;&nbsp;&nbsp;
           <button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="2"></td></tr>
         </table>
	     </div>
<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   Payment List</b></td>
		<td align="right" >
				<button dojoType="dijit.form.Button" onclick="adddis();" iconClass="openDivIcon"  i18n="edit" >openAdd</button>&nbsp;
				<button dojoType="dijit.form.Button" onclick="querydis();" iconClass="openQueryIcon"  i18n="openQuery" >query</button>
				<span id="rowCount"></span>
	  <button dojoType="dijit.form.myButton" onclick="upPage();"  id="but6" disabled='true' jsId="but6" iconClass="upPageIcon" ></button>
        <button dojoType="dijit.form.myButton" onclick="downPage();" id="but7" disabled='true' jsId="but7" iconClass="downPageIcon" ></button>
        <div id="668" dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
  			  <div dojoType="dijit.Menu">
				  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChange(this.label);"></div>
				  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChange(this.label);"></div>
		      <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChange(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChange(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpage();"></div>
		      </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
        </div>
			          	     <!--button dojoType="dijit.form.Button" onclick="addRow();" iconClass="addIcon" i18n="add" >add</button-->
					 <!--button dojoType="dijit.form.Button" onclick="addDivAdd();" iconClass="addIcon"  >add</button-->
	                 <!--button dojoType="dijit.form.Button" onclick="removeSelectedRowsGrid();" iconClass="delIcon" i18n="delete" >delete</button>
	                 <button dojoType="dijit.form.Button" id="but3" jsId="but3" onclick="call_funUpd();" i18n="save" iconClass="saveIcon">save</button-->
		</td>
	</tr>
</table>    
	    <div style="{height:90%;width:100%}"  >
	         <div id="grid"  dojoType="dojox.Grid" autoWidth="false"  jsId="grid"	model="model"  structure="layoutSingleRow" singleClickEdit="true" ></div>
      </div>      
    
			  
</body>
<script type="text/javascript">trans18tag();</script>
</html>		 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
