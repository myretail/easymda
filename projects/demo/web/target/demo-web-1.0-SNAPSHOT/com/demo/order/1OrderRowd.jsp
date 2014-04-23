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
			dojo.require("projectDojo.OrderRowd");
     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
	 <script type="text/javascript" >
	//manageablePackageName=com.demo.entity.order.crud
	//packageName=com.demo.entity.order
	  
	  </script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 <script type="text/javascript" >
	  var url = getUrl()+ "services/OrderRowdManageService";
	  var dojoOrderRowd= new  projectDojo.OrderRowd();
	  dojoOrderRowd.initOrderRowd();
	  var deletedata =  new Array();
	  var querydata =  new Array();
	  var pagenumber=1;
	  var pagesize=10;
	  var totalCount=0;
	  var queryvo=new Object();
	  var oddstyle='';
	  var model = new dojox.grid.data.Table(null, querydata);
	  var urle = getUrl()+ "services/BasicManageService"; 

 
//Ð¶Ï±Ö¶Ç·1212ÉµlayoutÛµlayoutstructure
//enumeration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
																									
/*//Úµð¾°¶
					function setOrderdDetailFun(inrow,OrderdColNo){
					return querydata[inrow][OrderdColNo];
				}
			//Úµð¾°¶
					function setProdDetailFun(inrow,ProdColNo){
					return querydata[inrow][ProdColNo];
				}
			*/
/*function setDetailFloatFun(inrow,ColNo){
	return querydata[inrow][ColNo];
}	*/

var layoutSingleRow=[{
          
 //fieldÖµÄ¬ÏµË³ò£¬´jsÐµtoArray×ªØµquerydateÈ¡
	   
				 cells: [ [
							//{name: 'Ñ¡', width: 3, get:getChoise},
						   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
						   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
            {name: i18nStr.productNum,field:2, width: 8 }
		             ,  {name: i18nStr.unitNum,field:3, width: 8 }
		             ,  {name: i18nStr.goodsSuttle,field:4, width: 8 }
		             ,  {name: i18nStr.goodsWeight,field:5, width: 8 }
		             ,  {name: i18nStr.goodsVolume,field:6, width: 8 }
		        				,   {name: i18nStr.label, field: 7,width: 8}
					            ,  {name: i18nStr.carriage,field:8, width: 8 }
		        				,   {name: i18nStr.especial, field: 9,width: 8}
					       				,   {name: i18nStr.goodsState, field: 10,width: 8}
					       			    ,   {name: i18nStr.remark, field: 11,width: 10 }
					 
//Úµí²»Ð¶
					 ,   {name: i18nStr.order,field: 12,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][12]!=undefined && querydata[inRowIndex][12][2]){str=querydata[inRowIndex][12][2];strid=querydata[inRowIndex][12][1];} return str+'<img src="../image/detailFloat.jpg" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoOrderRowd.detailFloatOrderdData=querydata['+inRowIndex+'][12];dojoOrderRowd.detailOrderd('+querydata[inRowIndex][12][1]+','+inRowIndex+',12,0,event,0);"   >';} ,width: 10 }
			//Úµí²»Ð¶
					 ,   {name: i18nStr.product,field: 13,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][13]!=undefined && querydata[inRowIndex][13][2]){str=querydata[inRowIndex][13][2];strid=querydata[inRowIndex][13][1];} return str+'<img src="../image/detailFloat.jpg" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoOrderRowd.detailFloatProdData=querydata['+inRowIndex+'][13];dojoOrderRowd.detailProd('+querydata[inRowIndex][13][1]+','+inRowIndex+',13,0,event,0);"   >';} ,width: 10 }
			                                        ] ]
                           }]; 
						   
var layoutNoscroll=[ {
			noscroll: true,
			cells: [[
				 { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
				   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} }
		]]},{
          
 //fieldÖµÄ¬ÏµË³ò£¬´jsÐµtoArray×ªØµquerydateÈ¡
	   
				 cells: [ [
							//{name: 'Ñ¡', width: 3, get:getChoise},
						  // { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
						  // { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
            {name: i18nStr.productNum,field:2, width: 8 }
		             ,  {name: i18nStr.unitNum,field:3, width: 8 }
		             ,  {name: i18nStr.goodsSuttle,field:4, width: 8 }
		             ,  {name: i18nStr.goodsWeight,field:5, width: 8 }
		             ,  {name: i18nStr.goodsVolume,field:6, width: 8 }
		        				,   {name: i18nStr.label, field: 7,width: 8}
					            ,  {name: i18nStr.carriage,field:8, width: 8 }
		        				,   {name: i18nStr.especial, field: 9,width: 8}
					       				,   {name: i18nStr.goodsState, field: 10,width: 8}
					       			    ,   {name: i18nStr.remark, field: 11,width: 10 }
					 
//Úµð¾°¶
					 ,   {name: i18nStr.order,field: 12,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][12]!=undefined && querydata[inRowIndex][12][2]){str=querydata[inRowIndex][12][2];strid=querydata[inRowIndex][12][1];} return str+'<img src="../image/detailFloat.jpg" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoOrderRowd.detailFloatOrderdData=querydata['+inRowIndex+'][12];dojoOrderRowd.detailOrderd('+querydata[inRowIndex][12][1]+','+inRowIndex+',12,0,event,0);"   >';} ,width: 10 }
			//Úµð¾°¶
					 ,   {name: i18nStr.product,field: 13,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][13]!=undefined && querydata[inRowIndex][13][2]){str=querydata[inRowIndex][13][2];strid=querydata[inRowIndex][13][1];} return str+'<img src="../image/detailFloat.jpg" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoOrderRowd.detailFloatProdData=querydata['+inRowIndex+'][13];dojoOrderRowd.detailProd('+querydata[inRowIndex][13][1]+','+inRowIndex+',13,0,event,0);"   >';} ,width: 10 }
			                                        ] ]
                           }]; 
function pageStyle(style){//nomarl,col,noscroll
	grid.scrollToRow(0);
	if(style=="nomarl"){
		grid.setStructure(layoutSingleRow);
	}else if(style=="col"){
		grid.setStructure(layoutTwoRow);
	}else if(style=="noscroll"){
		grid.setStructure(layoutNoscroll);
	}
}						   
						   

//totleinum=12
  //rowinum=7
function getCheckOrderRowd(){}

var layoutTwoRow=[{
          
 //fieldÖµÄ¬ÏµË³ò£¬´jsÐµtoArray×ªØµquerydateÈ¡
	   
				 cells: [
                      [
						{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
						//{ name: i18nStr.detail, width: 3, get: getCheckOrderRowd, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
										  					  {name: i18nStr.productNum,field:2, width: 8 }
								  			//--------------  if (3 == 7)
														  					 ,  {name: i18nStr.unitNum,field:3, width: 8 }
								  			//--------------  if (4 == 7)
														  					 ,  {name: i18nStr.goodsSuttle,field:4, width: 8 }
								  			//--------------  if (5 == 7)
														  					 ,  {name: i18nStr.goodsWeight,field:5, width: 8 }
								  			//--------------  if (6 == 7)
														  					 ,  {name: i18nStr.goodsVolume,field:6, width: 8 }
								  			//--------------  if (7 == 7)
								//
												  																	,   {name: i18nStr.label, field: 7,width: 8}
																						  								]
												                     //----------------(inum:8)  (rowinum: 7)
									                     //----------------(inum:8)  (rowinum: 7)
									                     //----------------(inum:8)  (rowinum: 7)
									                     //----------------(inum:8)  (rowinum: 7)
									                     //----------------(inum:8)  (rowinum: 7)
								
	//
		  //(8 > 7)
						//
		  //(8 > 7)
							,[
	 //  22222222222inum= 2   inum2=8
																																							  					  {name: i18nStr.carriage,field:8, width: 8}
								  														  													,   {name: i18nStr.especial, field: 9,width: 8 }
																  														  													,   {name: i18nStr.goodsState, field: 10,width: 8 }
																  														  													,   {name: i18nStr.remark, field: 11,width: 10 }
																  														
	//
									 ,   {name: i18nStr.order,field: 12,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][12]!=undefined && querydata[inRowIndex][12][1]!=undefined){str=querydata[inRowIndex][12][2];strid=querydata[inRowIndex][12][1];} return str+'<img src="../image/detailFloat.jpg" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoOrderRowd.detailFloatOrderdData=querydata['+inRowIndex+'][12];dojoOrderRowd.detailOrderd('+querydata[inRowIndex][12][1]+','+inRowIndex+',12,0,event,0);"   >';} ,width: 10 }
										//
									 ,   {name: i18nStr.product,field: 13,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][13]!=undefined && querydata[inRowIndex][13][1]!=undefined){str=querydata[inRowIndex][13][2];strid=querydata[inRowIndex][13][1];} return str+'<img src="../image/detailFloat.jpg" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoOrderRowd.detailFloatProdData=querydata['+inRowIndex+'][13];dojoOrderRowd.detailProd('+querydata[inRowIndex][13][1]+','+inRowIndex+',13,0,event,0);"   >';} ,width: 10 }
										 	
			,   {name: ' ',value:' ' ,width: 10 }
		]]
                           }]; 						   
						   
						   

	 
function querybutton(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvo=new Object();
              n=queryNumber_fun("productNum");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvo.productNum=n;}  
              n=queryNumber_fun("unitNum");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvo.unitNum=n;}  
              n=queryNumber_fun("goodsSuttle");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvo.goodsSuttle=n;}  
              n=queryNumber_fun("goodsWeight");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvo.goodsWeight=n;}  
              n=queryNumber_fun("goodsVolume");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvo.goodsVolume=n;}  
	          if(querylabel.getDisplayedValue()!="")queryvo.label=querylabel.getDisplayedValue();//
              n=queryNumber_fun("carriage");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvo.carriage=n;}  
	          if(queryespecial.getDisplayedValue()!="")queryvo.especial=queryespecial.getDisplayedValue();//
	          if(querygoodsState.getDisplayedValue()!="")queryvo.goodsState=querygoodsState.getDisplayedValue();//
	          if(queryremark.getDisplayedValue()!="")queryvo.remark=queryremark.getDisplayedValue();//
			
	var orderQuery= new Object();
	if(dojo.byId("queryorderForOrderRowdDiv")!=undefined && getQueryCondorderForOrderRowd(orderQuery)){
		queryvo.order=orderQuery;
	}else if(queryorder.getDisplayedValue()!=""){
		//var prodCustQuery= new Object();
		//prodCustQuery.ProdName=queryprodCust.getDisplayedValue();
		orderQuery.id=queryorder.getValue();
		queryvo.order=prodorder;
	}
	var productQuery= new Object();
	if(dojo.byId("queryproductForOrderRowdDiv")!=undefined && getQueryCondproductForOrderRowd(productQuery)){
		queryvo.product=productQuery;
	}else if(queryproduct.getDisplayedValue()!=""){
		//var prodCustQuery= new Object();
		//prodCustQuery.ProdName=queryprodCust.getDisplayedValue();
		productQuery.id=queryproduct.getValue();
		queryvo.product=prodproduct;
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
      pu.add('OrderRowdVO',queryvo) ;
      pu.add('pageNumber',pagenumber) ;
	    pu.add('pageSize',pagesize) ;
	    pu.add('orderBy',orderBy) ;
      SOAPClient.invoke(url,"getOrderRowd", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydata=new Array();
		   querydata=dojoOrderRowd.OrderRowdVOtoArray_fun(ul,false);
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
		 document.getElementById('OrderRowdId').value=querydata[e.rowIndex][1];
		 	 									//enumeration Í¨StringÍ¬í£¿
				dijit.byId("addproductNum").setValue(querydata[e.rowIndex][2]);
						 									//enumeration Í¨StringÍ¬í£¿
				dijit.byId("addunitNum").setValue(querydata[e.rowIndex][3]);
						 									//enumeration Í¨StringÍ¬í£¿
				dijit.byId("addgoodsSuttle").setValue(querydata[e.rowIndex][4]);
						 									//enumeration Í¨StringÍ¬í£¿
				dijit.byId("addgoodsWeight").setValue(querydata[e.rowIndex][5]);
						 									//enumeration Í¨StringÍ¬í£¿
				dijit.byId("addgoodsVolume").setValue(querydata[e.rowIndex][6]);
						 									//enumeration Í¨StringÍ¬í£¿
				dijit.byId("addlabel").setValue(querydata[e.rowIndex][7]);
						 									//enumeration Í¨StringÍ¬í£¿
				dijit.byId("addcarriage").setValue(querydata[e.rowIndex][8]);
						 									//enumeration Í¨StringÍ¬í£¿
				dijit.byId("addespecial").setValue(querydata[e.rowIndex][9]);
						 									//enumeration Í¨StringÍ¬í£¿
				dijit.byId("addgoodsState").setValue(querydata[e.rowIndex][10]);
						 									//enumeration Í¨StringÍ¬í£¿
				dijit.byId("addremark").setValue(querydata[e.rowIndex][11]);
						 			 
								dijit.byId("addorder").setValue(querydata[e.rowIndex][12][1]);
			//dijit.byId("addorder").setDisplayedValue('');
											dijit.byId("addproduct").setValue(querydata[e.rowIndex][13][1]);
			//dijit.byId("addproduct").setDisplayedValue('');
						});     
}

 dojo.addOnLoad(init);   

	function selectOrderdFun(rep){
		querydata[dojoOrderRowd.selectOrderdInRow][dojoOrderRowd.noOrderd]=rep;
		grid.updateRow(dojoOrderRowd.selectOrderdInRow);		
	}
	function selectProdFun(rep){
		querydata[dojoOrderRowd.selectProdInRow][dojoOrderRowd.noProd]=rep;
		grid.updateRow(dojoOrderRowd.selectProdInRow);		
	}
//addDiv---------------begin-------------------------------------
var addDivAdd = function(){
	 //if(document.getElementById('queryDiv').style.display=='')document.getElementById('queryDiv').style.display='none';
	 //if(document.getElementById('addDiv').style.display=='none')document.getElementById('addDiv').style.display='';
	 //add
										//enumeration Í¨StringÍ¬í£¿
				
									dijit.byId("addproductNum").setValue('');
																			//enumeration Í¨StringÍ¬í£¿
				
									dijit.byId("addunitNum").setValue('');
																			//enumeration Í¨StringÍ¬í£¿
				
									dijit.byId("addgoodsSuttle").setValue('');
																			//enumeration Í¨StringÍ¬í£¿
				
									dijit.byId("addgoodsWeight").setValue('');
																			//enumeration Í¨StringÍ¬í£¿
				
									dijit.byId("addgoodsVolume").setValue('');
																			//enumeration Í¨StringÍ¬í£¿
				
									dijit.byId("addlabel").setValue('');
																			//enumeration Í¨StringÍ¬í£¿
				
									dijit.byId("addcarriage").setValue('');
																			//enumeration Í¨StringÍ¬í£¿
				
									dijit.byId("addespecial").setValue('');
																			//enumeration Í¨StringÍ¬í£¿
				
									dijit.byId("addgoodsState").setValue('');
																			//enumeration Í¨StringÍ¬í£¿
				
									dijit.byId("addremark").setValue('');
														
					dijit.byId("addorder").setValue('');
	    dijit.byId("addorder").setDisplayedValue('');
							dijit.byId("addproduct").setValue('');
	    dijit.byId("addproduct").setDisplayedValue('');
				
	document.getElementById('OrderRowdId').value='0';
	//document.getElementById('referTimeAdd1').value=dojo.date.locale.format(new Date(),{ datePattern: "yyyy-MM-dd", selector: "date"});
	//document.getElementById('referTimeAdd2').value=dojo.date.locale.format(new Date(),{ timePattern: "HH:mm", selector: "time"});
} 
function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new Object();
    vobject.id=document.getElementById('OrderRowdId').value;
	var passAll=0;
										if(dijit.byId("addproductNum").validate(true)){
					var nproductNum=new NumberQuery();
					nproductNum.upNumber=dijit.byId("addproductNum").getValue();
					vobject.productNum=nproductNum;
				}else{
					setErrorClass(dijit.byId("addproductNum")); passAll=1;
				}
															if(dijit.byId("addunitNum").validate(true)){
					var nunitNum=new NumberQuery();
					nunitNum.upNumber=dijit.byId("addunitNum").getValue();
					vobject.unitNum=nunitNum;
				}else{
					setErrorClass(dijit.byId("addunitNum")); passAll=1;
				}
															if(dijit.byId("addgoodsSuttle").validate(true)){
					var ngoodsSuttle=new NumberQuery();
					ngoodsSuttle.upNumber=dijit.byId("addgoodsSuttle").getValue();
					vobject.goodsSuttle=ngoodsSuttle;
				}else{
					setErrorClass(dijit.byId("addgoodsSuttle")); passAll=1;
				}
															if(dijit.byId("addgoodsWeight").validate(true)){
					var ngoodsWeight=new NumberQuery();
					ngoodsWeight.upNumber=dijit.byId("addgoodsWeight").getValue();
					vobject.goodsWeight=ngoodsWeight;
				}else{
					setErrorClass(dijit.byId("addgoodsWeight")); passAll=1;
				}
															if(dijit.byId("addgoodsVolume").validate(true)){
					var ngoodsVolume=new NumberQuery();
					ngoodsVolume.upNumber=dijit.byId("addgoodsVolume").getValue();
					vobject.goodsVolume=ngoodsVolume;
				}else{
					setErrorClass(dijit.byId("addgoodsVolume")); passAll=1;
				}
															//enumeration Í¨StringÍ¬í£¿
				if(dijit.byId("addlabel").validate(true)){
					vobject.label=dijit.byId("addlabel").getValue();
				}else{
					setErrorClass(dijit.byId("addlabel")); passAll=1;
				}
															if(dijit.byId("addcarriage").validate(true)){
					var ncarriage=new NumberQuery();
					ncarriage.upNumber=dijit.byId("addcarriage").getValue();
					vobject.carriage=ncarriage;
				}else{
					setErrorClass(dijit.byId("addcarriage")); passAll=1;
				}
															//enumeration Í¨StringÍ¬í£¿
				if(dijit.byId("addespecial").validate(true)){
					vobject.especial=dijit.byId("addespecial").getValue();
				}else{
					setErrorClass(dijit.byId("addespecial")); passAll=1;
				}
															//enumeration Í¨StringÍ¬í£¿
				if(dijit.byId("addgoodsState").validate(true)){
					vobject.goodsState=dijit.byId("addgoodsState").getValue();
				}else{
					setErrorClass(dijit.byId("addgoodsState")); passAll=1;
				}
															//enumeration Í¨StringÍ¬í£¿
				if(dijit.byId("addremark").validate(true)){
					vobject.remark=dijit.byId("addremark").getValue();
				}else{
					setErrorClass(dijit.byId("addremark")); passAll=1;
				}
										
		if(dijit.byId("addorder").validate(true)){
		//vobject.order=dijit.byId("addorder").getValue();
		var manageable=new Object();
		manageable.id=dijit.byId("addorder").getValue();
		vobject.order=manageable;
	}else{
		setErrorClass(dijit.byId("addorder")); passAll=1;
	}
			if(dijit.byId("addproduct").validate(true)){
		//vobject.product=dijit.byId("addproduct").getValue();
		var manageable=new Object();
		manageable.id=dijit.byId("addproduct").getValue();
		vobject.product=manageable;
	}else{
		setErrorClass(dijit.byId("addproduct")); passAll=1;
	}
		
if(passAll==0){
		//var addrow='';
		var addrow=[];
														isNaN(vobject.productNum.upNumber)?addrow.push(0):addrow.push(vobject.productNum.upNumber);
																					isNaN(vobject.unitNum.upNumber)?addrow.push(0):addrow.push(vobject.unitNum.upNumber);
																					isNaN(vobject.goodsSuttle.upNumber)?addrow.push(0):addrow.push(vobject.goodsSuttle.upNumber);
																					isNaN(vobject.goodsWeight.upNumber)?addrow.push(0):addrow.push(vobject.goodsWeight.upNumber);
																					isNaN(vobject.goodsVolume.upNumber)?addrow.push(0):addrow.push(vobject.goodsVolume.upNumber);
																					//addrow=addrow+","+vobject.label;
					addrow.push(vobject.label);
																					isNaN(vobject.carriage.upNumber)?addrow.push(0):addrow.push(vobject.carriage.upNumber);
																					//addrow=addrow+","+vobject.especial;
					addrow.push(vobject.especial);
																					//addrow=addrow+","+vobject.goodsState;
					addrow.push(vobject.goodsState);
																					//addrow=addrow+","+vobject.remark;
					addrow.push(vobject.remark);
																						//addrow=addrow+","+OrderdVOtoArray_fun(vobject.order,true);//addrow.push(OrderdVOtoArray_fun(vobject.order,true));
			addrow.push([false,addorder.getValue(),addorder.getDisplayedValue()]);
											//addrow=addrow+","+ProdVOtoArray_fun(vobject.product,true);//addrow.push(ProdVOtoArray_fun(vobject.product,true));
			addrow.push([false,addproduct.getValue(),addproduct.getDisplayedValue()]);
						 if(vobject.id==0){//create new row
		padd.add('OrderRowdVO',vobject);
		SOAPClient.invoke(url, "createOrderRowd", padd, false,  function GetEnu_callBack(ul, soapResponse){
		//addrow='false,ul'+addrow;
		addrow.splice(0,0,false,ul);
				console.log("addrow.lenght:"+addrow.length);
				console.log("addrow:"+addrow);
		grid.addRow(addrow ,grid.model.getRowCount());//grid.addRow([addrow]);
		});
	 }else{//modify row
		padd.add('OrderRowdVO',vobject);
		SOAPClient.invoke(url, "updateOrderRowd", padd, false,  function GetEnu_callBack(ul, soapResponse){
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
               SOAPClient.invoke(url, "deleteOrderRowd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
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
//totleinum=12
 //rowinum=4
 //addHeight=175
</script>
</head>	 
<body class="tundra">
	<div id="addDiv" style="margin:25px 0px 20px 0px;  height:175px; display:none;" >
		<div  class="titleDiv"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font i18n="addNote">add</font></div>
              <table align="center" width="100%" id="0" class="editorTable"  >
                <tr >
				<td align="center" style="{width:11%}">&nbsp;</td>
                <td style="{width:22%}" ><input id="OrderRowdId" style="{display:none}"  type="text"  /></td>
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
				<td align="right" i18n="productNum" >productNum:</td>
			<td align="left"  >
							<input type="text" class="editerNumber"   jsId="addproductNum"  id="addproductNum"  dojoType="mydojo.NumberTextBox" constraints="{min:0,max:9999999,places:4 }" />
			</td>
					<td align="right" i18n="unitNum" >unitNum:</td>
			<td align="left"  >
							<input type="text" class="editerNumber"   jsId="addunitNum"  id="addunitNum"  dojoType="mydojo.NumberTextBox" constraints="{min:0,max:9999999,places:4 }" />
			</td>
					<td align="right" i18n="goodsSuttle" >goodsSuttle:</td>
			<td align="left"  >
							<input type="text" class="editerNumber"   jsId="addgoodsSuttle"  id="addgoodsSuttle"  dojoType="mydojo.NumberTextBox" constraints="{min:0,max:9999999,places:4 }" />
			</td>
		</tr>	
                <tr>
				<td align="right" i18n="goodsWeight" >goodsWeight:</td>
			<td align="left"  >
							<input type="text" class="editerNumber"   jsId="addgoodsWeight"  id="addgoodsWeight"  dojoType="mydojo.NumberTextBox" constraints="{min:0,max:9999999,places:4 }" />
			</td>
					<td align="right" i18n="goodsVolume" >goodsVolume:</td>
			<td align="left"  >
							<input type="text" class="editerNumber"   jsId="addgoodsVolume"  id="addgoodsVolume"  dojoType="mydojo.NumberTextBox" constraints="{min:0,max:9999999,places:4 }" />
			</td>
					<td align="right" i18n="label" >label:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addlabel"  jsId="addlabel"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
		</tr>	
                <tr>
				<td align="right" i18n="carriage" >carriage:</td>
			<td align="left"  >
							<input type="text" class="editerNumber"   jsId="addcarriage"  id="addcarriage"  dojoType="mydojo.NumberTextBox" constraints="{min:0,max:9999999,places:4 }" />
			</td>
					<td align="right" i18n="especial" >especial:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addespecial"  jsId="addespecial"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="goodsState" >goodsState:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addgoodsState"  jsId="addgoodsState"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
		</tr>	
                <tr>
				<td align="right" i18n="remark" >remark:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addremark"  jsId="addremark"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
	
 <!--//if (2==1)     
//   /tr
//end

//set ($inume =1) -->
								<td align="right"  i18n="order"  ></td>
					<td align="left" ><!--colspan="3" --><input  id="addorder"  jsId="addorder" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderRowd.orderStore" onchange="orderSet(0,arguments[0]);" required="true" /></td>  
														<td align="right"  i18n="product"  ></td>
					<td align="left" ><input  id="addproduct"  jsId="addproduct" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderRowd.productStore" onchange="productSet(0,arguments[0]);" required="true" /></td>
					</tr>
						 <tr align="center"><td></td>
           <td colspan="5"><button dojoType="dijit.form.Button" onclick="addDivAdd();" iconClass="addIcon"  i18n="add" >add</button>
				<button dojoType="dijit.form.Button" onclick="addDivRemove();" iconClass="delIcon"  i18n="delete" >remove</button>
				<button dojoType="dijit.form.Button" onclick="addDivSave();" iconClass="saveIcon"   i18n="save">save</button></td>
           <td colspan="2"></td></tr>
</table></div>
<div id="queryDiv" style="margin:25px 0px 20px 0px; height: 175px; display:none;" >
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
				<td align="right" i18n="productNum" >productNum:</td>
			<td align="left"  >
							<span id="queryproductNumImg0"  ><input type="text" class="selectNumber"   jsId="queryproductNum"  id="queryproductNum"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="queryproductNumImg1" style="{display:none}" ><input type="text"  class="editerNumberSmall" jsId="queryproductNum1"  id="queryproductNum1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryproductNumImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryproductNumImgdown" >></span>
							<span id="queryproductNumImg2div" style="{display:none}"> <input type="text"  class="editerNumberSmall"  jsId="queryproductNum2"  id="queryproductNum2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/nStart.gif" onclick="queryType(this);" id="queryproductNumImg" class="imgStyle">
							
						</td>
														<td align="right" i18n="unitNum" >unitNum:</td>
							<td align="left" colspan="3" >
								<span id="queryunitNumImg0"  ><input type="text" class="selectNumber" jsId="queryunitNum"  id="queryunitNum"  dojoType="mydojo.NumberTextBox"  /></span>
								<span id="queryunitNumImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="queryunitNum1"  id="queryunitNum1"  dojoType="mydojo.NumberTextBox"  /></span>
								<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryunitNumImgup">></span>
								<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryunitNumImgdown" >></span>
								<span id="queryunitNumImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="queryunitNum2"  id="queryunitNum2"  dojoType="mydojo.NumberTextBox"  /></span>
								<img src="../image/nStart.gif" onclick="queryType(this);" id="queryunitNumImg" class="imgStyle">
							</td>  
																		<td align="right"  i18n="goodsSuttle" >goodsSuttle:</td>
						<td align="left"  >
							<span id="querygoodsSuttleImg0"  ><input type="text" class="selectNumber" jsId="querygoodsSuttle"  id="querygoodsSuttle"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="querygoodsSuttleImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="querygoodsSuttle1"  id="querygoodsSuttle1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querygoodsSuttleImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querygoodsSuttleImgdown" >></span>
							<span id="querygoodsSuttleImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="querygoodsSuttle2"  id="querygoodsSuttle2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/nStart.gif" onclick="queryType(this);" id="querygoodsSuttleImg" class="imgStyle">
							
						</td>  
								  </tr>
			                <tr>
				<td align="right" i18n="goodsWeight" >goodsWeight:</td>
			<td align="left"  >
							<span id="querygoodsWeightImg0"  ><input type="text" class="selectNumber"   jsId="querygoodsWeight"  id="querygoodsWeight"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="querygoodsWeightImg1" style="{display:none}" ><input type="text"  class="editerNumberSmall" jsId="querygoodsWeight1"  id="querygoodsWeight1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querygoodsWeightImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querygoodsWeightImgdown" >></span>
							<span id="querygoodsWeightImg2div" style="{display:none}"> <input type="text"  class="editerNumberSmall"  jsId="querygoodsWeight2"  id="querygoodsWeight2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/nStart.gif" onclick="queryType(this);" id="querygoodsWeightImg" class="imgStyle">
							
						</td>
														<td align="right" i18n="goodsVolume" >goodsVolume:</td>
							<td align="left" colspan="3" >
								<span id="querygoodsVolumeImg0"  ><input type="text" class="selectNumber" jsId="querygoodsVolume"  id="querygoodsVolume"  dojoType="mydojo.NumberTextBox"  /></span>
								<span id="querygoodsVolumeImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="querygoodsVolume1"  id="querygoodsVolume1"  dojoType="mydojo.NumberTextBox"  /></span>
								<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querygoodsVolumeImgup">></span>
								<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querygoodsVolumeImgdown" >></span>
								<span id="querygoodsVolumeImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="querygoodsVolume2"  id="querygoodsVolume2"  dojoType="mydojo.NumberTextBox"  /></span>
								<img src="../image/nStart.gif" onclick="queryType(this);" id="querygoodsVolumeImg" class="imgStyle">
							</td>  
																				<td align="right"  i18n="label" >label:</td>
						<td align="left"  >
													<input type="text" class="editerInput"  id="querylabel"  jsId="querylabel"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			                <tr>
				<td align="right" i18n="carriage" >carriage:</td>
			<td align="left"  >
							<span id="querycarriageImg0"  ><input type="text" class="selectNumber"   jsId="querycarriage"  id="querycarriage"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="querycarriageImg1" style="{display:none}" ><input type="text"  class="editerNumberSmall" jsId="querycarriage1"  id="querycarriage1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querycarriageImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querycarriageImgdown" >></span>
							<span id="querycarriageImg2div" style="{display:none}"> <input type="text"  class="editerNumberSmall"  jsId="querycarriage2"  id="querycarriage2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/nStart.gif" onclick="queryType(this);" id="querycarriageImg" class="imgStyle">
							
						</td>
												<td align="right"  i18n="especial" >especial:</td>
						<td align="left" colspan="3" >
														<input type="text" class="editerInput"  id="queryespecial"  jsId="queryespecial"   dojoType="dijit.form.TextBox"  />
													</td>  
															<td align="right"  i18n="goodsState" >goodsState:</td>
						<td align="left"  >
													<input type="text" class="editerInput"  id="querygoodsState"  jsId="querygoodsState"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			                <tr>
							<td align="right" i18n="remark" >remark:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryremark"  jsId="queryremark"   dojoType="dijit.form.TextBox"  />
													</td>
				<!--
//if (!="over" && 2!=1)     
/tr
//end 
//set ($inume =1) -->
			
					<td align="right"  i18n="order"  ></td>
					<td align="left" colspan="3"  ><!----><table class="innerTable">
							<tr>
								<td   ><input  id="queryorder"  jsId="queryorder" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderRowd.orderStore"  /></td><td align="left" ><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon" class="downButtonStyle"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryorderForOrderRowdFloat.html"title="detail" execute="" ></div></div>
					</td>
							</tr>
						</table></td>  
					
				
					<td align="right"  i18n="product"  ></td>
					<td align="left" ><table class="innerTable">
							<tr>
								<td   ><input  id="queryproduct"  jsId="queryproduct" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderRowd.productStore"  /></td><td align="left" ><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon" class="downButtonStyle"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryproductForOrderRowdFloat.html"title="detail" execute="" ></div></div></td>
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
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   OrderRowd List</b></td>
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
				    <div id="669" dojoType="dijit.form.myDropDownButton" iconClass="pageStyleIcon"><span>pageStyle</span>
  			   <div dojoType="dijit.Menu">
  				 <div dojoType="dijit.MenuItem"  iconClass="rowIcon"		label="normal"	onClick="pageStyle(this.label);"></div>
  				 <div dojoType="dijit.MenuItem"  iconClass="colIcon"		label="col"	onClick="pageStyle(this.label);"></div>
				 <div dojoType="dijit.MenuItem"  iconClass="colIcon"		label="noscroll"	onClick="pageStyle(this.label);"></div>
		    </div></div>
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
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
