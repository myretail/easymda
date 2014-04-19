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
			dojo.require("projectDojo.Prod");
     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
	 <script type="text/javascript" >
	//manageablePackageName=com.demo.entity.basic.crud
	//packageName=com.demo.entity.basic
	  
	  </script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 <script type="text/javascript" >
	  var url = getUrl()+ "services/ProdManageService";
	  var dojoProd= new  projectDojo.Prod();
	  dojoProd.initProd();
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
					function setCustomerDetailFun(inrow,CustomerColNo){
					return querydata[inrow][CustomerColNo];
				}
			//????¡ã?
					function setPeoplesDetailFun(inrow,PeoplesColNo){
					return querydata[inrow][PeoplesColNo];
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
      				  {name: i18nStr.prodName, field: 2,width: 8}
					       				,   {name: i18nStr.code, field: 3,width: 8}
					            ,  {name: i18nStr.price,field:4, width: 8 }
		    		,   {name: i18nStr.datef,field:5, width: 8}
		        				,   {name: i18nStr.prodType, field: 6,width: 8}
					 
//??¨ª????
					 ,   {name: i18nStr.prodCust,field: 7,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][7]!=undefined && querydata[inRowIndex][7][2]){str=querydata[inRowIndex][7][2];strid=querydata[inRowIndex][7][1];} return str+'<img src="../image/detailFloat.jpg" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoProd.detailFloatCustomerData=querydata['+inRowIndex+'][7];dojoProd.detailCustomer('+querydata[inRowIndex][7][1]+','+inRowIndex+',7,0,event,0);"   >';} ,width: 10 }
			//??¨ª????
					 ,   {name: i18nStr.principal,field: 8,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][8]!=undefined && querydata[inRowIndex][8][2]){str=querydata[inRowIndex][8][2];strid=querydata[inRowIndex][8][1];} return str+'<img src="../image/detailFloat.jpg" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoProd.detailFloatPeoplesData=querydata['+inRowIndex+'][8];dojoProd.detailPeoples('+querydata[inRowIndex][8][1]+','+inRowIndex+',8,0,event,0);"   >';} ,width: 10 }
			                                        ] ]
                           }]; 
						   
						   

	 
function querybutton(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvo=new Object();
	          if(queryprodName.getDisplayedValue()!="")queryvo.prodName=queryprodName.getDisplayedValue();//
	          if(querycode.getDisplayedValue()!="")queryvo.code=querycode.getDisplayedValue();//
              n=queryNumber_fun("price");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvo.price=n;}  
              d=queryDate_fun("datef");
              if(d==null){validstate=1;}else if(d.upSign!="%"){queryvo.datef=d;}
	          if(queryprodType.getDisplayedValue()!="")queryvo.prodType=queryprodType.getDisplayedValue();//
			
	var prodCustQuery= new Object();
	if(dojo.byId("queryprodCustForProdDiv")!=undefined && getQueryCondprodCustForProd(prodCustQuery)){
		queryvo.prodCust=prodCustQuery;
	}else if(queryprodCust.getDisplayedValue()!=""){
		//var prodCustQuery= new Object();
		//prodCustQuery.ProdName=queryprodCust.getDisplayedValue();
		prodCustQuery.id=queryprodCust.getValue();
		queryvo.prodCust=prodprodCust;
	}
	var principalQuery= new Object();
	if(dojo.byId("queryprincipalForProdDiv")!=undefined && getQueryCondprincipalForProd(principalQuery)){
		queryvo.principal=principalQuery;
	}else if(queryprincipal.getDisplayedValue()!=""){
		//var prodCustQuery= new Object();
		//prodCustQuery.ProdName=queryprodCust.getDisplayedValue();
		principalQuery.id=queryprincipal.getValue();
		queryvo.principal=prodprincipal;
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
      pu.add('ProdVO',queryvo) ;
      pu.add('pageNumber',pagenumber) ;
	    pu.add('pageSize',pagesize) ;
	    pu.add('orderBy',orderBy) ;
      SOAPClient.invoke(url,"getProd", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydata=new Array();
		   querydata=dojoProd.ProdVOtoArray_fun(ul,false);
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
		 document.getElementById('ProdId').value=querydata[e.rowIndex][1];
		 	 									//enumeration ?¡§String??¨ª??
				dijit.byId("addprodName").setValue(querydata[e.rowIndex][2]);
						 									//enumeration ?¡§String??¨ª??
				dijit.byId("addcode").setValue(querydata[e.rowIndex][3]);
						 									//enumeration ?¡§String??¨ª??
				dijit.byId("addprice").setValue(querydata[e.rowIndex][4]);
						 									 dijit.byId("adddatef").setValue(dojo.date.locale.parse(querydata[e.rowIndex][5],{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
				 dijit.byId("adddatefTime").setValue(dojo.date.locale.parse(querydata[e.rowIndex][5],{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
						 									//enumeration ?¡§String??¨ª??
				dijit.byId("addprodType").setValue(querydata[e.rowIndex][6]);
						 			 
								dijit.byId("addprodCust").setValue(querydata[e.rowIndex][7][1]);
			//dijit.byId("addprodCust").setDisplayedValue('');
											dijit.byId("addprincipal").setValue(querydata[e.rowIndex][8][1]);
			//dijit.byId("addprincipal").setDisplayedValue('');
						});     
}

 dojo.addOnLoad(init);   

	function selectCustomerFun(rep){
		querydata[dojoProd.selectCustomerInRow][dojoProd.noCustomer]=rep;
		grid.updateRow(dojoProd.selectCustomerInRow);		
	}
	function selectPeoplesFun(rep){
		querydata[dojoProd.selectPeoplesInRow][dojoProd.noPeoples]=rep;
		grid.updateRow(dojoProd.selectPeoplesInRow);		
	}
//addDiv---------------begin-------------------------------------
var addDivAdd = function(){
	 //if(document.getElementById('queryDiv').style.display=='')document.getElementById('queryDiv').style.display='none';
	 //if(document.getElementById('addDiv').style.display=='none')document.getElementById('addDiv').style.display='';
	 //add
										//enumeration ?¡§String??¨ª??
				
									dijit.byId("addprodName").setValue('');
																			//enumeration ?¡§String??¨ª??
				
									dijit.byId("addcode").setValue('');
																			//enumeration ?¡§String??¨ª??
				
									dijit.byId("addprice").setValue('');
																			dijit.byId("adddatef").setValue('');
				dijit.byId("adddatefTime").setValue('');
															//enumeration ?¡§String??¨ª??
				
									dijit.byId("addprodType").setValue('');
														
					dijit.byId("addprodCust").setValue('');
	    dijit.byId("addprodCust").setDisplayedValue('');
							dijit.byId("addprincipal").setValue('');
	    dijit.byId("addprincipal").setDisplayedValue('');
				
	document.getElementById('ProdId').value='0';
	//document.getElementById('referTimeAdd1').value=dojo.date.locale.format(new Date(),{ datePattern: "yyyy-MM-dd", selector: "date"});
	//document.getElementById('referTimeAdd2').value=dojo.date.locale.format(new Date(),{ timePattern: "HH:mm", selector: "time"});
} 
function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new Object();
    vobject.id=document.getElementById('ProdId').value;
	var passAll=0;
										//enumeration ?¡§String??¨ª??
				if(dijit.byId("addprodName").validate(true)){
					vobject.prodName=dijit.byId("addprodName").getValue();
				}else{
					setErrorClass(dijit.byId("addprodName")); passAll=1;
				}
															//enumeration ?¡§String??¨ª??
				if(dijit.byId("addcode").validate(true)){
					vobject.code=dijit.byId("addcode").getValue();
				}else{
					setErrorClass(dijit.byId("addcode")); passAll=1;
				}
															if(dijit.byId("addprice").validate(true)){
					var nprice=new NumberQuery();
					nprice.upNumber=dijit.byId("addprice").getValue();
					vobject.price=nprice;
				}else{
					setErrorClass(dijit.byId("addprice")); passAll=1;
				}
															if(dijit.byId("adddatef").validate(true)){ 
					if(dijit.byId("adddatef").getValue()!=''&&dijit.byId("adddatef").getValue()!=undefined){	
					if(dijit.byId("adddatefTime").validate(true)){
						if(dijit.byId("adddatefTime").getValue()==''||dijit.byId("adddatefTime").getValue()==undefined)dijit.byId("adddatefTime").setValue(new Date(2000,1,1,0,0,0,0));
						var ddatef=new DateTimeQuery();
						ddatef.upDate=dojo.date.locale.format(dijit.byId("adddatef").getValue(), dijit.byId("adddatef").constraints)+" "+dojo.date.locale.format(dijit.byId("adddatefTime").getValue(), dijit.byId("adddatefTime").constraints);
						vobject.datef=ddatef;
					}else{setErrorClass(dijit.byId("adddatefTime")); passAll=1;}
				}}else{
					setErrorClass(dijit.byId("adddatef")); passAll=1;}
															//enumeration ?¡§String??¨ª??
				if(dijit.byId("addprodType").validate(true)){
					vobject.prodType=dijit.byId("addprodType").getValue();
				}else{
					setErrorClass(dijit.byId("addprodType")); passAll=1;
				}
										
		if(dijit.byId("addprodCust").validate(true)){
		//vobject.prodCust=dijit.byId("addprodCust").getValue();
		var manageable=new Object();
		manageable.id=dijit.byId("addprodCust").getValue();
		vobject.prodCust=manageable;
	}else{
		setErrorClass(dijit.byId("addprodCust")); passAll=1;
	}
			if(dijit.byId("addprincipal").validate(true)){
		//vobject.principal=dijit.byId("addprincipal").getValue();
		var manageable=new Object();
		manageable.id=dijit.byId("addprincipal").getValue();
		vobject.principal=manageable;
	}else{
		setErrorClass(dijit.byId("addprincipal")); passAll=1;
	}
		
if(passAll==0){
		//var addrow='';
		var addrow=[];
														//addrow=addrow+","+vobject.prodName;
					addrow.push(vobject.prodName);
																					//addrow=addrow+","+vobject.code;
					addrow.push(vobject.code);
																					isNaN(vobject.price.upNumber)?addrow.push(0):addrow.push(vobject.price.upNumber);
																					vobject.datef?addrow.push(vobject.datef.upDate):addrow.push('');
																					//addrow=addrow+","+vobject.prodType;
					addrow.push(vobject.prodType);
																						//addrow=addrow+","+CustomerVOtoArray_fun(vobject.prodCust,true);//addrow.push(CustomerVOtoArray_fun(vobject.prodCust,true));
			addrow.push([false,addprodCust.getValue(),addprodCust.getDisplayedValue()]);
											//addrow=addrow+","+PeoplesVOtoArray_fun(vobject.principal,true);//addrow.push(PeoplesVOtoArray_fun(vobject.principal,true));
			addrow.push([false,addprincipal.getValue(),addprincipal.getDisplayedValue()]);
						 if(vobject.id==0){//create new row
		padd.add('ProdVO',vobject);
		SOAPClient.invoke(url, "createProd", padd, false,  function GetEnu_callBack(ul, soapResponse){
		//addrow='false,ul'+addrow;
		addrow.splice(0,0,false,ul);
				console.log("addrow.lenght:"+addrow.length);
				console.log("addrow:"+addrow);
		grid.addRow(addrow ,grid.model.getRowCount());//grid.addRow([addrow]);
		});
	 }else{//modify row
		padd.add('ProdVO',vobject);
		SOAPClient.invoke(url, "updateProd", padd, false,  function GetEnu_callBack(ul, soapResponse){
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
               SOAPClient.invoke(url, "deleteProd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
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
//totleinum=7
 //rowinum=2
 //addHeight=150
</script>
</head>	 
<body class="tundra">
	<div id="addDiv" style="margin:25px 0px 20px 0px;  height:150px; display:none;" >
		<div  class="titleDiv"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font i18n="addNote">add</font></div>
              <table align="center" width="100%" id="0" class="editorTable"  >
                <tr >
				<td align="center" style="{width:11%}">&nbsp;</td>
                <td style="{width:22%}" ><input id="ProdId" style="{display:none}"  type="text"  /></td>
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
				<td align="right" i18n="prodName" >prodName:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addprodName"  jsId="addprodName"   dojoType="dijit.form.ValidationTextBox" required="true" />
							</td>
					<td align="right" i18n="code" >code:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addcode"  jsId="addcode"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="price" >price:</td>
			<td align="left"  >
							<input type="text" class="editerNumber"   jsId="addprice"  id="addprice"  dojoType="mydojo.NumberTextBox" constraints="{min:0,max:9999999,places:4 }" />
			</td>
		</tr>	
                <tr>
				<td align="right" i18n="datef"  >datef:</td> 
			<td align="left" >
				<input class="addDate"   jsId="adddatef" id="adddatef"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox" required="false" />
				<input class="addTime" jsId="adddatefTime" id="adddatefTime"  dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"  >
			</td>
					<td align="right" i18n="prodType" >prodType:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addprodType"  jsId="addprodType"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
	
 <!--//if (3==1)     
//   /tr
//end

//set ($inume =1) -->
								<td align="right"  i18n="prodCust"  ></td>
					<td align="left" ><input  id="addprodCust"  jsId="addprodCust" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoProd.prodCustStore" onchange="prodCustSet(0,arguments[0]);" required="true" /></td>
					</tr>
														<tr><td align="right"  i18n="principal"  ></td>
					<td align="left" ><input  id="addprincipal"  jsId="addprincipal" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoProd.principalStore" onchange="principalSet(0,arguments[0]);" required="true"/></td>  
						    <td align="right"    ></td><td align="right"    ></td><td align="right"    ></td><td align="right"    ></td></tr>
 <tr align="center"><td></td>
           <td colspan="5"><button dojoType="dijit.form.Button" onclick="addDivAdd();" iconClass="addIcon"  i18n="add" >add</button>
				<button dojoType="dijit.form.Button" onclick="addDivRemove();" iconClass="delIcon"  i18n="delete" >remove</button>
				<button dojoType="dijit.form.Button" onclick="addDivSave();" iconClass="saveIcon"   i18n="save">save</button></td>
           <td colspan="2"></td></tr>
</table></div>
<div id="queryDiv" style="margin:25px 0px 20px 0px; height: 150px; display:none;" >
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
							<td align="right" i18n="prodName" >prodName:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryprodName"  jsId="queryprodName"   dojoType="dijit.form.TextBox"  />
													</td>
														<td align="right"  i18n="code" >code:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="querycode"  jsId="querycode"   dojoType="dijit.form.TextBox"  />
												</td>  
											<td align="right"  i18n="price" >price:</td>
						<td align="left"  >
							<span id="querypriceImg0"  ><input type="text" class="selectNumber" jsId="queryprice"  id="queryprice"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="querypriceImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="queryprice1"  id="queryprice1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querypriceImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querypriceImgdown" >></span>
							<span id="querypriceImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="queryprice2"  id="queryprice2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/nStart.gif" onclick="queryType(this);" id="querypriceImg" class="imgStyle">
							
						</td>  
								  </tr>
			                <tr>
							<td align="right" i18n="datef"  >datef:</td> 
						<td align="left"  colspan="3"><span id="querydatefImg0"  ><input class="addDate"   jsId="querydatef" id="querydatef"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="addTime" jsId="querydatefTime" id="querydatefTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="querydatefImg1" style="{display:none}" ><input class="editerDateSmaller"   jsId="query1datef" id="query1datef"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query1datefTime" id="query1datefTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querydatefImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querydatefImgdown" >></span>
							<span id="querydatefImg2div" style="{display:none}"><input class="editerDateSmaller"   jsId="query2datef" id="query2datef"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query2datefTime" id="query2datefTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="querydatefImg" class="imgStyle">
						</td>
													<td align="right" colspan="2" ></td>
						<td align="right"  i18n="prodType" >prodType:</td>
						<td align="left"  >
							 								<input type="text" class="editerInput"  id="queryprodType"  jsId="queryprodType"   dojoType="dijit.form.TextBox"  />  
													</td></tr>
					<!--
//if (!="over" && 1!=1)     
/tr
//end 
//set ($inume =1) -->
			
					<tr><td align="right"  i18n="prodCust"  ></td>
					<td align="left" ><table class="innerTable">
							<tr>
								<td><input  id="queryprodCust"  jsId="queryprodCust" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoProd.prodCustStore"  /></td><td align="left" ><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon" class="downButtonStyle"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryprodCustForProdFloat.html"title="detail" execute="" ></div></div></td>
							</tr>
						</table></td>  
					
				
					<td align="right"  i18n="principal"  ></td>
					<td align="left" colspan="3"  ><!----><table class="innerTable">
							<tr>
								<td   ><input  id="queryprincipal"  jsId="queryprincipal" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoProd.principalStore"  /></td><td align="left" ><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon" class="downButtonStyle"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryprincipalForProdFloat.html"title="detail" execute="" ></div></div>
					</td>
							</tr>
						</table></td>  
					
	    <td align="right"    ></td><td align="right"    ></td></tr>

          <tr align="center"><td ></td>
           <td colspan="3"></td><td colspan="3" align="left"> <button dojoType="dijit.form.Button" onclick="querybutton();" iconClass="queryIcon"  i18n="query" >query</button>&nbsp;&nbsp;&nbsp;
           <button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="2"></td></tr>
         </table>
	     </div>
<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   Prod List</b></td>
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
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
