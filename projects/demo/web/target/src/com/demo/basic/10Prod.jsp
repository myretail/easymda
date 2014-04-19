<%
String peopleId = request.getParameter("peopleId");
%>
<html>
<!--????¨¤?????????¡À¨ª???????????¡Àvar dataChild=querydataProd[inRowIndex]-->
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
			dojo.require("projectDojo.Prod");
     </script>
        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 	<script type="text/javascript" >
		var dojoProd= new  projectDojo.Prod();
	    dojoProd.initProd();
			//??¡è???????????????¨¨?¡§		
																	 var dojoOrderRowd= new  projectDojo.OrderRowd();
			dojoOrderRowd.initOrderRowd();
			</script>

	 	 							 
	<script type="text/javascript" >
	  var urlProd = getUrl()+ "services/ProdManageService";
	  var deletedataProd =  new Array();
	  var querydataProd =  new Array();
	  var pagenumberProd=1;
	  var totalCountProd=0;
	  var pagesizeProd=10;
	  var orderByProd='0';
	  var queryvoProd=new Object();
	  var oddstyle='';
	  var modelProd = new dojox.grid.data.Table(null, querydataProd);
	  var urle = getUrl()+ "services/BasicManageService";
	  var modelProdDetail;
	  var modelProdChild;
	  
	function prodCustSet(id,value){
        	/*var itemselect=prodCustStore._getItemByIdentity(value);
				if(itemselect!='undefined'&& itemselect!=null){
				}*/
	}
	function principalSet(id,value){
        	/*var itemselect=principalStore._getItemByIdentity(value);
				if(itemselect!='undefined'&& itemselect!=null){
				}*/
	}


															//begin buildLayout


var mainLayout =[{//?????????colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: i18nStr.detail, width: 3, get: getCheckProd, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				  				  {name: i18nStr.prodName, field: 2,width: 10}
						  						  				,   {name: i18nStr.code, field: 3,width: 10}
						  						  				 ,  {name: i18nStr.price,field:4, width: 8}
						  						  				,   {name: i18nStr.datef,field:5, width: 8}
						  						  				,   {name: i18nStr.prodType, field: 6,width: 10}
						  				
//
					 ,   {name: i18nStr.prodCust,field: 7,get:function(inRowIndex){ var str='';if(querydataProd[inRowIndex]!=undefined && querydataProd[inRowIndex][7]!=undefined){str=querydataProd[inRowIndex][7][2];} return str;} ,width: 10 }
					//
					 ,   {name: i18nStr.principal,field: 8,get:function(inRowIndex){ var str='';if(querydataProd[inRowIndex]!=undefined && querydataProd[inRowIndex][8]!=undefined){str=querydataProd[inRowIndex][8][2];} return str;} ,width: 10 }
										],[
									{ name: '\u8be6\u7ec6', colSpan: 9 ,styles: 'padding: 0; margin: 0;', get: getSubProd }//value: '<div style="height:0px; background-color: white;"></div>'
						  ]
				  ]
	  
				}];	 
var subInt=	$childRow;			
function getSubProd(inRowIndex){
		var cell = this;
		setTimeout(function() { buildSubgridProd(inRowIndex, cell); }, 0);
		var h =0;
		if(detailRowsProd[inRowIndex]&&querydataProd[inRowIndex][$childRow].length>0){
							h=65+25*querydataProd[inRowIndex][$childRow].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}				

//end buildLayout

var detailRowsProd=[];

function onBeforeRow(inDataIndex, inRow) {	if (inRow[1]!=undefined)inRow[1].hidden = !detailRowsProd[inDataIndex];}	

function toggleProd(inIndex, inShow) {
        			if (!inShow) destroySubGridIdGeneral('',querydataProd[inIndex][1],"ProdMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataProd[inIndex][1],"ProdChild");
				    detailRowsProd[inIndex] = inShow;
				    dijit.byId("gridProd").updateRow(inIndex); 
				    
    } 

function getCheckProd(inRowIndex) {
	var image = (detailRowsProd[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsProd[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleProd(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}





//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}

	  
function buildSubgridProd(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)??idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		var idmainDetail = makeSubGridIdGeneral('',querydataProd[inRowIndex][1],"ProdMainDetail");//makeSubgridIdMainDetail(querydataProd[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataProd[inRowIndex][1],"ProdChild");
		var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataProd[inRowIndex][$childRow];
		if(dataChild.length!=0){
			if (subGridChild){
				subGridChild.model.setData(dataChild);
				child.appendChild(subGridChild.domNode);
			}else{
				modelProdChild=new dojox.grid.data.Table(null, dataChild);
				var childProps= {
								autoHeight: true, 
								autoRender: false,
								rowCount:dataChild.length,
								model:modelProdChild,							};
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

function querybuttonProd(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvoProd=new Object();
	          if(queryProdprodName.getDisplayedValue()!="")queryvoProd.prodName=queryProdprodName.getDisplayedValue();//
	          if(queryProdcode.getDisplayedValue()!="")queryvoProd.code=queryProdcode.getDisplayedValue();//
              n=queryNumber_fun("Prodprice");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvoProd.price=n;}  
              d=queryDate_fun("Proddatef");
              if(d==null){validstate=1;}else if(d.upSign!="%"){queryvoProd.datef=d;}
	          if(queryProdprodType.getDisplayedValue()!="")queryvoProd.prodType=queryProdprodType.getDisplayedValue();//
			
	if(queryProdprodCust.getDisplayedValue()!=""){
				var prodCustQuery= new Object();
				//prodCustQuery.ProdName=queryProdprodCust.getDisplayedValue();
				prodCustQuery.id=queryProdprodCust.getValue();
				queryvoProd.prodCust=prodCustQuery;
			  }
	if(queryProdprincipal.getDisplayedValue()!=""){
				var principalQuery= new Object();
				//principalQuery.ProdName=queryProdprincipal.getDisplayedValue();
				principalQuery.id=queryProdprincipal.getValue();
				queryvoProd.principal=principalQuery;
			  }

			if(validstate==0){
              pagenumberProd=1;
              getProdVO(queryvoProd); 
             }      
       }

function getProdVO(queryvo){
	var totalCount=0;
	deletedataProd =new Array();
      var pu = new SOAPClientParameters2();
      pu.add('ProdVO',queryvo) ;
      pu.add('pageNumber',pagenumberProd) ;
	    pu.add('pageSize',pagesizeProd) ;
	    pu.add('orderBy',orderByProd) ;
      SOAPClient.invoke(urlProd,"getProd", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydataProd=new Array();
		   querydataProd=dojoProd.ProdVOtoArray_fun(ul,false);
           totalCountProd=ul[ul.length-1]["ns:id"]; 
      }); 
      querydataProd.splice(querydataProd.length-1,1);
	  gridProd.selection.clear();
      modelProd.setData(querydataProd);
      //dijit.byId("grid").updateRowCount(querydataProd.length); 
	   var totalpage=Math.ceil(new Number(totalCountProd)/pagesizeProd);
	  
	if(totalpage>1){
		if(pagenumberProd==1){
			dijit.byId("but6Prod").setDisabled(true);
			dijit.byId("but7Prod").setDisabled(false);
		}else if(pagenumberProd==totalpage){
			dijit.byId("but6Prod").setDisabled(false);
			dijit.byId("but7Prod").setDisabled(true);
		}else{
			dijit.byId("but6Prod").setDisabled(false);
			dijit.byId("but7Prod").setDisabled(false);
		}
	}else{
		dijit.byId("but6Prod").setDisabled(true);
		dijit.byId("but7Prod").setDisabled(true);
	
	}
	if(pagesizeProd==0){
		totalpage=1;
		dijit.byId("but6Prod").setDisabled(true);
		dijit.byId("but7Prod").setDisabled(true);
	}
	if(totalpage==1)pagenumberProd=1;
	
	 document.getElementById("rowCountProd").innerHTML=i18nStr.di+" "+pagenumberProd+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountProd+" "+i18nStr.rowSize; 	
}

function init(){
	
 	dojo.connect(dijit.byId("gridProd"), "dodblclick", function(e){
	   if(document.getElementById('queryDivProd').style.display=='')document.getElementById('queryDivProd').style.display='none';
	   if(document.getElementById('addDivProd').style.display=='none')document.getElementById('addDivProd').style.display='';
		 document.getElementById('erowIndexProd').value=e.rowIndex;
		 document.getElementById('ProdId').value=querydataProd[e.rowIndex][1];
		 	 									dijit.byId("addProdprodName").setValue(querydataProd[e.rowIndex][2]);
						 									dijit.byId("addProdcode").setValue(querydataProd[e.rowIndex][3]);
						 									dijit.byId("addProdprice").setValue(querydataProd[e.rowIndex][4]);
						 									  dijit.byId("addProddatef").setValue(dojo.date.locale.parse(new String(querydataProd[e.rowIndex][5]),{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
				  dijit.byId("addProddatefTime").setValue(dojo.date.locale.parse(new String(querydataProd[e.rowIndex][5]),{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
						 									dijit.byId("addProdprodType").setValue(querydataProd[e.rowIndex][6]);
						 			 
									dijit.byId("addProdprodCust").setValue(querydataProd[e.rowIndex][7][1]);
												dijit.byId("addProdprincipal").setValue(querydataProd[e.rowIndex][8][1]);
								   
	});  
	gridProd.onStyleRow=OnStyleRowClassBlue();
	getProdVO(queryvoProd);
}

 dojo.addOnLoad(init);   

	function selectCustomerFun(rep){
		querydataProd[dojoProd.selectCustomerInRow][dojoProd.noCustomer]=rep;
		gridProd.updateRow(dojoProd.selectCustomerInRow);		
	}
	function selectPeoplesFun(rep){
		querydataProd[dojoProd.selectPeoplesInRow][dojoProd.noPeoples]=rep;
		gridProd.updateRow(dojoProd.selectPeoplesInRow);		
	}


 
//addDiv---------------begin-------------------------------------
var addDivAdd = function(){
	 //if(document.getElementById('queryDivProd').style.display=='')document.getElementById('queryDivProd').style.display='none';
	 //if(document.getElementById('addDivProd').style.display=='none')document.getElementById('addDivProd').style.display='';
	  document.getElementById('gridSub').style.height='60px';
	 //add
															dijit.byId("addProdprodName").setValue('');
																								dijit.byId("addProdcode").setValue('');
																								dijit.byId("addProdprice").setValue('');
																			dijit.byId("addProddatef").setValue('');
				dijit.byId("addProddatefTime").setValue('');
																				dijit.byId("addProdprodType").setValue('');
														
						dijit.byId("addProdprodCust").setValue('');
			dijit.byId("addProdprodCust").setDisplayedValue('');
								dijit.byId("addProdprincipal").setValue('');
			dijit.byId("addProdprincipal").setDisplayedValue('');
				
	document.getElementById('ProdId').value='0';
	
} 
function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new Object();
    vobject.id=document.getElementById('ProdId').value;
	var passAll=0;
										if(dijit.byId("addProdprodName").isValid(true)){
					vobject.prodName=dijit.byId("addProdprodName").getValue();
				}else{
					passAll=1;
				}
															if(dijit.byId("addProdcode").isValid(true)){
					vobject.code=dijit.byId("addProdcode").getValue();
				}else{
					passAll=1;
				}
															if(dijit.byId("addProdprice").isValid(true)){
					var nprice=new NumberQuery();
					nprice.upNumber=dijit.byId("addProdprice").getValue();
					vobject.price=nprice;
				}else{
					passAll=1;
				}
															if(dijit.byId("addProddatef").getValue() instanceof Date){ 
					if(dijit.byId("addProddatefTime").getValue() instanceof Date){
						var ddatef=new DateTimeQuery();
						ddatef.upDate=dojo.date.locale.format(dijit.byId("addProddatef").getValue(), dijit.byId("addProddatef").constraints)+" "+dojo.date.locale.format(dijit.byId("addProddatefTime").getValue(), dijit.byId("addProddatefTime").constraints);
						vobject.datef=ddatef;
					}else if(dijit.byId("addProddatefTime").getValue()==undefined){
						var ddatef=new DateTimeQuery();
						ddatef.upDate=dojo.date.locale.format(dijit.byId("addProddatef").getValue(), dijit.byId("addProddatef").constraints)+" 00:00";
						vobject.datef=ddatef;
					}else{passAll=1;}
				}else{
					passAll=1;}
															if(dijit.byId("addProdprodType").isValid(true)){
					vobject.prodType=dijit.byId("addProdprodType").getValue();
				}else{
					passAll=1;
				}
										
			if(dijit.byId("addProdprodCust").isValid(true)){
			//vobject.prodCust=dijit.byId("addprodCust").getValue();
			var manageable=new Object();
			manageable.id=dijit.byId("addProdprodCust").getValue();
			vobject.prodCust=manageable;
		}else{
			passAll=1;
		}
				if(dijit.byId("addProdprincipal").isValid(true)){
			//vobject.principal=dijit.byId("addprincipal").getValue();
			var manageable=new Object();
			manageable.id=dijit.byId("addProdprincipal").getValue();
			vobject.principal=manageable;
		}else{
			passAll=1;
		}
		
if(passAll==0){
		var addrow=[];
														addrow.push(vobject.prodName);
																					addrow.push(vobject.code);
																					addrow.push(vobject.price.upNumber);
																					addrow.push(vobject.datef.upDate);
																					addrow.push(vobject.prodType);
																							addrow.push([false,addProdprodCust.getValue(),addProdprodCust.getDisplayedValue()]);
												addrow.push([false,addProdprincipal.getValue(),addProdprincipal.getDisplayedValue()]);
						 if(vobject.id==0){//create new row
		padd.add('ProdVO',vobject);
		SOAPClient.invoke(urlProd, "createProd", padd, false,  function GetEnu_callBack(ul, soapResponse){
			addrow.splice(0,0,false,ul);
			querydataProd[querydataProd.length]=addrow;
			document.getElementById('erowIndexProd').value=querydataProd.length-1;
			gridProd.updateRowCount(querydataProd.length);
			document.getElementById('ProdId').value=ul;
			});
	 }else{//modify row
		padd.add('ProdVO',vobject);
		SOAPClient.invoke(urlProd, "updateProd", padd, false,  function GetEnu_callBack(ul, soapResponse){
		});
		addrow.splice(0,0,false,vobject.id);
		querydataProd[document.getElementById('erowIndexProd').value]=addrow;
	 }
	}   call_funUpdGridSub();
	gridProd.updateRow(document.getElementById('erowIndexProd').value); 
}

 function addDivRemove(){
     if(window.confirm(i18nStr.deleteConfirm)){
       var s = dijit.byId("gridProd").rowCount;
		console.log("sss:"+s);
        	  var delrowIndex=document.getElementById('erowIndexProd').value;
              var sId=document.getElementById('ProdId').value;
              var pdel = new SOAPClientParameters();      
               pdel.add('id',sId);
               SOAPClient.invoke(urlProd, "deleteProd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
               if(s-1!=delrowIndex){
					var e =document.createEvent("HTMLEvents");
					e.rowIndex=delrowIndex;
					dijit.byId("gridProd").dodblclick(e);
			   }else{if(document.getElementById('addDivProd').style.display=='')document.getElementById('addDivProd').style.display='none';}
			   dijit.byId("gridProd").model.remove(delrowIndex);
			   totalCountProd--;
			   var totalpage=Math.ceil(new Number(new Number(totalCountProd))/pagesizeProd);
			   document.getElementById("rowCountProd").innerHTML=i18nStr.di+" "+pagenumberProd+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountProd+" "+i18nStr.rowSize; 
               
	        });   
      }
 }    
 
 function adddis(){
	
	querydisplay("addDivProd");
	if(document.getElementById('addDivProd').style.display!='none')addDivAdd();
} 
//addDiv---------------end---------------------------------------	 
function allopen(){
          for(var i =0;i<querydataProd.length;i++){
            toggleProd(i,true);
          }
 }  

function allclose(){
          for(var i =0;i<querydataProd.length;i++){
            toggleProd(i,false);
          }
}

function pageSizeChangeProd(mylabel){
	pagesizeProd=mylabel;
	pagenumberProd=1;
	getProdVO(queryvoProd);
}

function allpageProd(){
	pagesizeProd=0;
	getProdVO(queryvoProd);
}

function upPageProd(){
	pagenumberProd--;
	getProdVO(queryvoProd);
}
function downPageProd(){
	pagenumberProd++;
	getProdVO(queryvoProd);
}

</script>
</head>	 
<body class="tundra">
 <!--rowinum=$rowinum-->
 <!--addHeight=$addHeight-->
<div id="addDivProd" style="margin-right: 0px;  height: 320px; display:none;" >
              <table align="center" width="100%" id="0" class="editorTable"  >
                <tr >
				<td align="center" style="{width:11%}" i18n="addNote" ></td>
                <td style="{width:22%}" ><input id="ProdId" style="{display:none}"  type="text"  /></td>
                <td style="{width:11%}"><input id="erowIndexProd" style="{display:none}"  type="text"  /></td>
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
										<input type="text" class="editerInput"  id="addProdprodName"  jsId="addProdprodName"   dojoType="dijit.form.ValidationTextBox" required="true" />
							</td>
					<td align="right" i18n="code" >code:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addProdcode"  jsId="addProdcode"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="price" >price:</td>
			<td align="left"  >
							<input type="text" class="editerNumber"   jsId="addProdprice"  id="addProdprice"  dojoType="mydojo.NumberTextBox" constraints="{min:0,max:9999999,places:4 }" />
			</td>
		</tr>	
                <tr>
				<td align="right" i18n="datef"  >datef:</td> 
			<td align="left" >
				<input class="editerDate"   jsId="addProddatef" id="addProddatef"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
				<input class="editerTime" jsId="addProddatefTime" id="addProddatefTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours.">
			</td>
					<td align="right" i18n="prodType" >prodType:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addProdprodType"  jsId="addProdprodType"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
	
								<td align="right"  i18n="prodCust"  ></td>
					<td align="left" ><input  id="addProdprodCust"  jsId="addProdprodCust" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoProd.prodCustStore" onchange="prodCustSet(0,arguments[0]);" /></td>
					</tr>
														<tr><td align="right"  i18n="principal"  ></td>
					<td align="left" ><input  id="addProdprincipal"  jsId="addProdprincipal" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoProd.principalStore" onchange="principalSet(0,arguments[0]);" /></td>  
						    <td align="right"    ></td><td align="right"    ></td><td align="right"    ></td><td align="right"    ></td></tr>

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

<div id="queryDivProd" style="margin-right: 0px;  height: 120px; display:none;" >
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
							<td align="right" i18n="prodName" >prodName:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryProdprodName"  jsId="queryProdprodName"   dojoType="dijit.form.TextBox"  />
													</td>
														<td align="right"  i18n="code" >code:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="queryProdcode"  jsId="queryProdcode"   dojoType="dijit.form.TextBox"  />
												</td>  
											<td align="right"  i18n="price" >price:</td>
						<td align="left"  >
							<span id="queryProdpriceImg0"  ><input type="text" class="editerNumber" jsId="queryProdprice"  id="queryProdprice"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="queryProdpriceImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="queryProdprice1"  id="queryProdprice1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryProdpriceImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryProdpriceImgdown" >></span>
							<span id="queryProdpriceImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="queryProdprice2"  id="queryProdprice2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/nStart.gif" onclick="queryType(this);" id="queryProdpriceImg" class="imgStyle">
							
						</td>  
								  </tr>
			                <tr>
							<td align="right" i18n="datef"  >datef:</td> 
						<td align="left"  colspan="3"><span id="queryProddatefImg0"  ><input class="editerDate"   jsId="queryProddatef" id="queryProddatef"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="queryProddatefTime" id="queryProddatefTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="queryProddatefImg1" style="{display:none}" ><input class="editerDateSmaller"   jsId="query1Proddatef" id="query1Proddatef"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query1ProddatefTime" id="query1ProddatefTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryProddatefImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryProddatefImgdown" >></span>
							<span id="queryProddatefImg2div" style="{display:none}"><input class="editerDateSmaller"   jsId="query2Proddatef" id="query2Proddatef"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query2ProddatefTime" id="query2ProddatefTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="queryProddatefImg" class="imgStyle">
						</td>
													<td align="right" colspan="2" ></td>
						<td align="right"  i18n="prodType" >prodType:</td>
						<td align="left"  >
							 								<input type="text" class="editerInput"  id="queryProdprodType"  jsId="queryProdprodType"   dojoType="dijit.form.TextBox"  />  
													</td></tr>
					
			
					<tr><td align="right"  i18n="prodCust"  ></td>
					<td align="left" ><input  id="queryProdprodCust"  jsId="queryProdprodCust" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoProd.prodCustStore"  /><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryCustomerFloat.html"title="detail" execute="" ></div></div></td>  
					
				
					<td align="right"  i18n="principal"  ></td>
					<td align="left" colspan="3"  ><!----><input  id="queryProdprincipal"  jsId="queryProdprincipal" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoProd.principalStore"  /><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryPeoplesFloat.html"title="detail" execute="" ></div></div></td>  
					
	    <td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybuttonProd();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
	    </div>	

<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   Prod List</b></td>
		<td align="right" >
	<!--button dojoType="dijit.form.Button" onclick="addRowProd();" iconClass="addIcon" i18n="add"  >add</button>
	<button dojoType="dijit.form.Button" onclick="removeSelectedRowsProd();" iconClass="delIcon" i18n="delete" >delete</button>
	<button dojoType="dijit.form.Button"  onclick="call_funUpdProd();" i18n="save" iconClass="saveIcon">save</button>
	<button dojoType="dijit.form.Button" onclick="addDivAdd();" iconClass="addIcon"  >add</button-->
	<button dojoType="dijit.form.Button" onclick="adddis();" iconClass="openDivIcon"  i18n="edit" >openAdd</button>
	<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivProd');" iconClass="queryIcon"  i18n="openQuery" >query</button>
	<span id="rowCountProd"></span>
		<button dojoType="dijit.form.myButton" onclick="upPageProd();"  id="but6Prod" disabled='true' jsId="but6Prod" iconClass="upPageIcon" >pageup</button><!--span dojoType="dijit.Tooltip" connectId="but6">pageup</span-->
		<button dojoType="dijit.form.myButton" onclick="downPageProd();" id="but7Prod" disabled='true' jsId="but7Prod" iconClass="downPageIcon" >pagedown</button><!--span dojoType="dijit.Tooltip" connectId="but7">pagedown</span-->
		<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
			  <div dojoType="dijit.Menu">
				  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangeProd(this.label);"></div>
				  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangeProd(this.label);"></div>
			  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangeProd(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangeProd(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpageProd();"></div>
			  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
		</div>
		<button dojoType="dijit.form.myButton" onclick="allopen();"  iconClass="allopenIcon" i18n="allopen" >allopen</button>
		<button dojoType="dijit.form.myButton" onclick="allclose();" iconClass="allcloseIcon" i18n="allclose"  >allclose</button>
		</td>
	</tr>
</table>	   

<div id="gridProd"  dojoType="dojox.Grid"  autoWidth="false" style="{width:100%;height:85%}" 	jsId="gridProd"	model="modelProd" structure="mainLayout"  ></div>
</body>
<script type="text/javascript">trans18tag();</script>
</html>					 





















					