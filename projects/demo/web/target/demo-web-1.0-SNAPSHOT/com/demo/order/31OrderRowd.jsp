				<%
String peopleId = request.getParameter("peopleId");
%>
<html>
<!--????¨¤?????????¡À¨ª???????????¡Àvar dataChild=querydataOrderRowd[inRowIndex]-->
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
			dojo.require("projectDojo.OrderRowd");

     </script>
        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 <script type="text/javascript" >
		var dojoOrderRowd= new  projectDojo.OrderRowd();
	    dojoOrderRowd.initOrderRowd();
			//??¡è???????????????¨¨?¡§		
																	 //var dojoOrderRowTask= new  projectDojo.OrderRowTask();
			//dojoOrderRowTask.initOrderRowTask();
				//??¡è???????????????¨¨?¡§		
																	 //var dojoPayment= new  projectDojo.Payment();
			//dojoPayment.initPayment();
			     </script>

	 		<script type="text/javascript" src="OrderdSelectPane.js"></script><!--????,??????????-->
	 		<script type="text/javascript" src="ProdSelectPane.js"></script><!--????,??????????-->
	 	 							<script type="text/javascript" >
	  var urlOrderRowd = getUrl()+ "services/OrderRowdManageService";
	  var deletedataOrderRowd =  new Array();
	  var querydataOrderRowd =  new Array();
	  var pagenumberOrderRowd=1;
	  var totalCountOrderRowd=0;
	  var pagesizeOrderRowd=10;
	  var orderByOrderRowd='0';
	  var queryvoOrderRowd=new Object();
	  var oddstyle='';
	  var modelOrderRowd = new dojox.grid.data.Table(null, querydataOrderRowd);
	  var urle = getUrl()+ "services/BasicManageService";
	  var modelOrderRowdDetail;
	  var modelOrderRowdChild;
	  

//have set function's manageableAssociationEnds
	function orderSet(id,value){
        	/*var itemselect=orderStore._getItemByIdentity(value);
				if(itemselect!='undefined'&& itemselect!=null){
				}*/
	}
	function productSet(id,value){
        	/*var itemselect=productStore._getItemByIdentity(value);
				if(itemselect!='undefined'&& itemselect!=null){
				}*/
	}

																																													                  // totleinum = 12 
 //		(12 >= 12)
	  //rowinum=7
	//=====
		var mainLayout =[{//?????????colSpantoggle
					//onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
						//{ name: i18nStr.detail, width: 3, get: getCheckOrderRowd, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				//---------------------------------------------------------------------//rowinum=7   inum=2
					  					  {name: i18nStr.productNum,field:2, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
								  			//--------------  if (3 == 7)
						//---------------------------------------------------------------------//rowinum=7   inum=3
					  					 ,  {name: i18nStr.unitNum,field:3, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
								  			//--------------  if (4 == 7)
						//---------------------------------------------------------------------//rowinum=7   inum=4
					  					 ,  {name: i18nStr.goodsSuttle,field:4, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
								  			//--------------  if (5 == 7)
						//---------------------------------------------------------------------//rowinum=7   inum=5
					  					 ,  {name: i18nStr.goodsWeight,field:5, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
								  			//--------------  if (6 == 7)
						//---------------------------------------------------------------------//rowinum=7   inum=6
		//
												  							 ,  {name: i18nStr.goodsVolume,field:6, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
												  								],[
													//---------------------------------------------------------------------//rowinum=7   inum=7
		                     //----------------(inum:7)  (rowinum: 7)
			//delete1
			 			  ////////////////////////////////////////
			    											  {name: i18nStr.label, field: 7,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  						//---------------------------------------------------------------------//rowinum=7   inum=8
		                     //----------------(inum:8)  (rowinum: 7)
			//delete1
			 					 ,  {name: i18nStr.carriage,field:8, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
								  						//---------------------------------------------------------------------//rowinum=7   inum=9
		                     //----------------(inum:9)  (rowinum: 7)
			//delete1
			 			  ////////////////////////////////////////
			    											,   {name: i18nStr.especial, field: 9,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  						//---------------------------------------------------------------------//rowinum=7   inum=10
		                     //----------------(inum:10)  (rowinum: 7)
			//delete1
			 			  ////////////////////////////////////////
			    											,   {name: i18nStr.goodsState, field: 10,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  						//---------------------------------------------------------------------//rowinum=7   inum=11
		                     //----------------(inum:11)  (rowinum: 7)
			//delete1
			 			  ////////////////////////////////////////
			    											,   {name: i18nStr.remark, field: 11,width: 10, editor: dojox.grid.editors.Editor,required:false, editorToolbar: true  }
																		  							
	//
		  //(13 > 7)
			//delete2
								 ,   {name: i18nStr.order,field: 12,get:function(inRowIndex){ var str='';var strid;if(querydataOrderRowd[inRowIndex]!=undefined && querydataOrderRowd[inRowIndex][12]!=undefined && querydataOrderRowd[inRowIndex][12][1]!=undefined){str=querydataOrderRowd[inRowIndex][12][2];strid=querydataOrderRowd[inRowIndex][12][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="dojoOrderRowd.selectOrderd('+strid+','+inRowIndex+',12,0,event);"   >';} ,width: 10 }
												//
		  //(14 > 7)
			//delete2
								 ,   {name: i18nStr.product,field: 13,get:function(inRowIndex){ var str='';var strid;if(querydataOrderRowd[inRowIndex]!=undefined && querydataOrderRowd[inRowIndex][13]!=undefined && querydataOrderRowd[inRowIndex][13][1]!=undefined){str=querydataOrderRowd[inRowIndex][13][2];strid=querydataOrderRowd[inRowIndex][13][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="dojoOrderRowd.selectProd('+strid+','+inRowIndex+',13,0,event);"   >';} ,width: 10 }
													
	
]/*,[
				{ name: '\u8be6\u7ec6', colSpan: 7 ,styles: 'padding: 0; margin: 0;', get: getDetailOrderRowd }//value: '<div style="height:0px; background-color: white;"></div>'
			  ]*/
		  ]

		}];	 





/*var detailRowsOrderRowd=[];

function onBeforeRow(inDataIndex, inRow) {	if (inRow[1]!=undefined)inRow[1].hidden = !detailRowsOrderRowd[inDataIndex];}	

function toggleOrderRowd(inIndex, inShow) {
        			//if (!inShow) destroySubGridIdGeneral('',querydataOrderRowd[inIndex][1],"OrderRowdMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataOrderRowd[inIndex][1],"OrderRowdChild");
				    detailRowsOrderRowd[inIndex] = inShow;
				    dijit.byId("gridOrderRowd").updateRow(inIndex); 
				    
    } 

function getCheckOrderRowd(inRowIndex) {
	var image = (detailRowsOrderRowd[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsOrderRowd[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleOrderRowd(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}

function getDetailOrderRowd(inRowIndex){
	if(detailRowsWlTaskRow[inRowIndex]){
		var cell = this;
		setTimeout(function() { buildSubgridOrderRowd(inRowIndex, cell); }, 0);  }
		var h =0;
		if(detailRowsOrderRowd[inRowIndex]&&querydataOrderRowd[inRowIndex][$childRow].length>0){
							h=65+25*querydataOrderRowd[inRowIndex][$childRow].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}

//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}
var childRow= ${childRow};
var layoutInRowIndex;	  
function buildSubgridOrderRowd(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)??idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		//var child = inCell.getNode(inRowIndex).lastChild;
		//var idmainDetail = makeSubGridIdGeneral('',querydataOrderRowd[inRowIndex][1],"OrderRowdMainDetail");//makeSubgridIdMainDetail(querydataOrderRowd[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataOrderRowd[inRowIndex][1],"OrderRowdChild");
		//var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataOrderRowd[inRowIndex][$childRow];
		//if(dataChild.length!=0){
			if (subGridChild){
				subGridChild.model.setData(dataChild);
				child.appendChild(subGridChild.domNode);
			}else{
				modelOrderRowdChild=new dojox.grid.data.Table(null, dataChild);
				var childProps= {
								autoHeight: true, 
								autoRender: false,
								rowCount:dataChild.length,
								model:modelOrderRowdChild,							};
				childProps.dataRow = inRowIndex;
				childProps.id = idchild;
				if(Math.ceil(inRowIndex/2)>inRowIndex/2){
					childLayoutOdd=buildChildLayout(pre,headerstyleodd,inRowIndex);	
					childProps.structure=childLayoutOdd;
				}else{
					childLayout=buildChildLayout(pre,headerstyle,inRowIndex);
					childProps.structure=childLayout;
				}
				subGridChild = new dojox.Grid(childProps, child);//grid????¡Á¡À?¡À??DIV????
			}
			if (subGridChild) {
				subGridChild.render();
				subGridChild.cacheHeight = subGridChild.domNode.offsetHeight;
			}	      				
		//}
		
		////////////////////////////////////////////////////////////////////////////////var detailDate=[];//??/
		detailDate[0]=querydataOrderRowd[inRowIndex];  
	    modelOrderRowdDetail=new dojox.grid.data.Table(null, detailDate);
		if (subGridMainDetail) {
			subGridMainDetail.model.setData(detailDate);
			mainDetail.appendChild(subGridMainDetail.domNode);
		} else {
			var mainDetailProps = {
				rowCount: 1, 
				autoHeight: true, 
				autoRender: false,
				model:modelOrderRowdDetail
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
//var childLayout=//???????????????????????????????/ ?¡À??jshtml
*/
function querybuttonOrderRowd(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvoOrderRowd=new Object();
              n=queryNumber_fun("OrderRowdproductNum");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvoOrderRowd.productNum=n;}  
              n=queryNumber_fun("OrderRowdunitNum");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvoOrderRowd.unitNum=n;}  
              n=queryNumber_fun("OrderRowdgoodsSuttle");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvoOrderRowd.goodsSuttle=n;}  
              n=queryNumber_fun("OrderRowdgoodsWeight");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvoOrderRowd.goodsWeight=n;}  
              n=queryNumber_fun("OrderRowdgoodsVolume");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvoOrderRowd.goodsVolume=n;}  
	          if(queryOrderRowdlabel.getDisplayedValue()!="")queryvoOrderRowd.label=queryOrderRowdlabel.getDisplayedValue();//
              n=queryNumber_fun("OrderRowdcarriage");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvoOrderRowd.carriage=n;}  
	          if(queryOrderRowdespecial.getDisplayedValue()!="")queryvoOrderRowd.especial=queryOrderRowdespecial.getDisplayedValue();//
	          if(queryOrderRowdgoodsState.getDisplayedValue()!="")queryvoOrderRowd.goodsState=queryOrderRowdgoodsState.getDisplayedValue();//
	          if(queryOrderRowdremark.getDisplayedValue()!="")queryvoOrderRowd.remark=queryOrderRowdremark.getDisplayedValue();//
			
	if(queryOrderRowdorder.getDisplayedValue()!=""){
				var orderQuery= new Object();
				//orderQuery.OrderRowdName=queryOrderRowdorder.getDisplayedValue();
				orderQuery.id=queryOrderRowdorder.getValue();
				queryvoOrderRowd.order=orderQuery;
			  }
	if(queryOrderRowdproduct.getDisplayedValue()!=""){
				var productQuery= new Object();
				//productQuery.OrderRowdName=queryOrderRowdproduct.getDisplayedValue();
				productQuery.id=queryOrderRowdproduct.getValue();
				queryvoOrderRowd.product=productQuery;
			  }

			if(validstate==0){
              pagenumberOrderRowd=1;
              getOrderRowdVO(queryvoOrderRowd); 
             }      
       }

function getOrderRowdVO(queryvo){
	var totalCount=0;
	deletedataOrderRowd =new Array();
      var pu = new SOAPClientParameters2();
      pu.add('OrderRowdVO',queryvo) ;
      pu.add('pageNumber',pagenumberOrderRowd) ;
	    pu.add('pageSize',pagesizeOrderRowd) ;
	    pu.add('orderBy',orderByOrderRowd) ;
      SOAPClient.invoke(urlOrderRowd,"getOrderRowd", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydataOrderRowd=new Array();
		   querydataOrderRowd=dojoOrderRowd.OrderRowdVOtoArray_fun(ul,true);
           totalCountOrderRowd=ul[ul.length-1]["ns:id"]; 
      }); 
      querydataOrderRowd.splice(querydataOrderRowd.length-1,1);
	  gridOrderRowd.selection.clear();
      modelOrderRowd.setData(querydataOrderRowd);
      //dijit.byId("grid").updateRowCount(querydataOrderRowd.length); 
	   var totalpage=Math.ceil(new Number(totalCountOrderRowd)/pagesizeOrderRowd);
	  
	if(totalpage>1){
		if(pagenumberOrderRowd==1){
			dijit.byId("but6OrderRowd").setDisabled(true);
			dijit.byId("but7OrderRowd").setDisabled(false);
		}else if(pagenumberOrderRowd==totalpage){
			dijit.byId("but6OrderRowd").setDisabled(false);
			dijit.byId("but7OrderRowd").setDisabled(true);
		}else{
			dijit.byId("but6OrderRowd").setDisabled(false);
			dijit.byId("but7OrderRowd").setDisabled(false);
		}
	}else{
		dijit.byId("but6OrderRowd").setDisabled(true);
		dijit.byId("but7OrderRowd").setDisabled(true);
	
	}
	if(pagesizeOrderRowd==0){
		totalpage=1;
		dijit.byId("but6OrderRowd").setDisabled(true);
		dijit.byId("but7OrderRowd").setDisabled(true);
	}
	if(totalpage==1)pagenumberOrderRowd=1;
	
	 document.getElementById("rowCountOrderRowd").innerHTML=i18nStr.di+" "+pagenumberOrderRowd+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountOrderRowd+" "+i18nStr.rowSize; 	
}

function init(){
	
 	gridOrderRowd.onStyleRow=OnStyleRowClassBlue();
	getOrderRowdVO(queryvoOrderRowd);
	
		dojo.connect(dijit.byId("OrderRowdSelectTab"), "selectChild", function(e){
			dojo.byId("order2orderRowTable").style.visibility="hidden";
				dojo.byId("orderRowds2productTable").style.visibility="hidden";
	dojo.byId(dijit.byId("OrderRowdSelectTab").selectedChildWidget.id+"Table").style.visibility="visible";
  });	
}

 dojo.addOnLoad(init);   

	function selectOrderdFun(rep){
		querydataOrderRowd[dojoOrderRowd.selectOrderdInRow][dojoOrderRowd.noOrderd]=rep;
		gridOrderRowd.updateRow(dojoOrderRowd.selectOrderdInRow);		
	}
	function selectProdFun(rep){
		querydataOrderRowd[dojoOrderRowd.selectProdInRow][dojoOrderRowd.noProd]=rep;
		gridOrderRowd.updateRow(dojoOrderRowd.selectProdInRow);		
	}


function allopen(){
          for(var i =0;i<querydataOrderRowd.length;i++){
            toggleOrderRowd(i,true);
          }
 }  

function allclose(){
          for(var i =0;i<querydataOrderRowd.length;i++){
            toggleOrderRowd(i,false);
          }
}

function pageSizeChangeOrderRowd(mylabel){
	pagesizeOrderRowd=mylabel;
	pagenumberOrderRowd=1;
	getOrderRowdVO(queryvoOrderRowd);
}

function allpageOrderRowd(){
	pagesizeOrderRowd=0;
	getOrderRowdVO(queryvoOrderRowd);
}

function upPageOrderRowd(){
	pagenumberOrderRowd--;
	getOrderRowdVO(queryvoOrderRowd);
}
function downPageOrderRowd(){
	pagenumberOrderRowd++;
	getOrderRowdVO(queryvoOrderRowd);
}
var addRowOrderRowd = function(){
var addrow=[];
														addrow.push('');
																					addrow.push('');
																					addrow.push('');
																					addrow.push('');
																					addrow.push('');
																					addrow.push('');
																					addrow.push('');
																					addrow.push('');
																					addrow.push('');
																					addrow.push('');
																							if(ifMultPaneorder2orderRow!=undefined){
					var re=selectorder2orderRowFunClick();
					addrow.push(re);}
												if(ifMultPaneorderRowds2product!=undefined){
					var re=selectorderRowds2productFunClick();
					addrow.push(re);}
						addrow.splice(0,0,false,0);
	gridOrderRowd.addRow(addrow,gridOrderRowd.model.getRowCount());
} 

function removeOrderRowd(){
       var s= new Array();
       var sall=gridOrderRowd.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            deletedataOrderRowd.splice(deletedataOrderRowd.length,0,thisCell[1]);
       }}}
       gridOrderRowd.model.remove(s);//grid.removeSelectedRows();
 }
function call_funUpdOrderRowd() {
       var sall=gridOrderRowd.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];
             if(dojox.validate.isInRange(thisCell[2],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[2];vobject.productNum=n;
             }else{gridOrderRowd.getCell(gridOrderRowd.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[3],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[3];vobject.unitNum=n;
             }else{gridOrderRowd.getCell(gridOrderRowd.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[4],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[4];vobject.goodsSuttle=n;
             }else{gridOrderRowd.getCell(gridOrderRowd.model.fieldArray[4]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[5],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[5];vobject.goodsWeight=n;
             }else{gridOrderRowd.getCell(gridOrderRowd.model.fieldArray[5]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[6],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[6];vobject.goodsVolume=n;
             }else{gridOrderRowd.getCell(gridOrderRowd.model.fieldArray[6]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

               vobject.label=thisCell[7];
 
             if(dojox.validate.isInRange(thisCell[8],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[8];vobject.carriage=n;
             }else{gridOrderRowd.getCell(gridOrderRowd.model.fieldArray[8]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

               vobject.especial=thisCell[9];
 
               vobject.goodsState=thisCell[10];
 
               vobject.remark=thisCell[11];
 

													//
			var manageable=new Object();
			 if(querydataOrderRowd[i][12]!=''&&querydataOrderRowd[i][12]!=undefined){
             manageable.id=querydataOrderRowd[i][12][1];
             vobject.order=manageable;
			 }else{
			 gridOrderRowd.getCell(gridOrderRowd.model.fieldArray[12]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
																var manageable=new Object();
			 if(querydataOrderRowd[i][13]!=''&&querydataOrderRowd[i][13]!=undefined){
             manageable.id=querydataOrderRowd[i][13][1];
             vobject.product=manageable;
			 }else{
			 gridOrderRowd.getCell(gridOrderRowd.model.fieldArray[13]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
			


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('OrderRowdVO',vobject);
                SOAPClient.invoke(urlOrderRowd, "createOrderRowd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                gridOrderRowd.model.setDatum(ul,i,1);
				});
	         }else{//modify row
                padd.add('OrderRowdVO',vobject);
                SOAPClient.invoke(urlOrderRowd, "updateOrderRowd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
			 //call_funUpdGridSub();
        } }}//for
//submit delete
          for(var i=0;i<deletedataOrderRowd.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedataOrderRowd[i]);
               SOAPClient.invoke(urlOrderRowd, "deleteOrderRowd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          deletedataOrderRowd=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
	
 } 
 																																									//totleinum=12
 //rowinum=4

</script>
</head>	 
<body class="tundra">
<div id="bc" style="width:100%; height:100%;" dojoType="dijit.layout.BorderContainer">
<div dojoType="dijit.layout.ContentPane"  title="" region="center" id="topPane" 	 >
<div id="queryDivOrderRowd" style="margin-right: 0px;  height: 140px; display:none;" >
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
				<td align="right" i18n="productNum" >productNum:</td>
			<td align="left"  >
							<span id="queryOrderRowdproductNumImg0"  ><input type="text" class="editerNumber"   jsId="queryOrderRowdproductNum"  id="queryOrderRowdproductNum"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="queryOrderRowdproductNumImg1" style="{display:none}" ><input type="text"  class="editerNumberSmall" jsid="queryOrderRowdproductNum1"  id="queryOrderRowdproductNum1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryOrderRowdproductNumImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryOrderRowdproductNumImgdown" >></span>
							<span id="queryOrderRowdproductNumImg2div" style="{display:none}"> <input type="text"  class="editerNumberSmall"  jsid="queryOrderRowdproductNum2"  id="queryOrderRowdproductNum2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="queryOrderRowdproductNumImg" class="imgStyle">
							
						</td>
														<td align="right" i18n="unitNum" >unitNum:</td>
							<td align="left" colspan="3" >
								<span id="queryOrderRowdunitNumImg0"  ><input type="text" class="editerNumber" jsId="queryOrderRowdunitNum"  id="queryOrderRowdunitNum"  dojoType="mydojo.NumberTextBox"  /></span>
								<span id="queryOrderRowdunitNumImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsid="queryOrderRowdunitNum1"  id="queryOrderRowdunitNum1"  dojoType="mydojo.NumberTextBox"  /></span>
								<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryOrderRowdunitNumImgup">></span>
								<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryOrderRowdunitNumImgdown" >></span>
								<span id="queryOrderRowdunitNumImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsid="queryOrderRowdunitNum2"  id="queryOrderRowdunitNum2"  dojoType="mydojo.NumberTextBox"  /></span>
								<img src="../image/start.gif" onclick="queryType(this);" id="queryOrderRowdunitNumImg" class="imgStyle">
							</td>  
																		<td align="right"  i18n="goodsSuttle" >goodsSuttle:</td>
						<td align="left"  >
							<span id="queryOrderRowdgoodsSuttleImg0"  ><input type="text" class="editerNumber" jsId="queryOrderRowdgoodsSuttle"  id="queryOrderRowdgoodsSuttle"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="queryOrderRowdgoodsSuttleImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsid="queryOrderRowdgoodsSuttle1"  id="queryOrderRowdgoodsSuttle1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryOrderRowdgoodsSuttleImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryOrderRowdgoodsSuttleImgdown" >></span>
							<span id="queryOrderRowdgoodsSuttleImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsid="queryOrderRowdgoodsSuttle2"  id="queryOrderRowdgoodsSuttle2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="queryOrderRowdgoodsSuttleImg" class="imgStyle">
							
						</td>  
								  </tr>
			                <tr>
				<td align="right" i18n="goodsWeight" >goodsWeight:</td>
			<td align="left"  >
							<span id="queryOrderRowdgoodsWeightImg0"  ><input type="text" class="editerNumber"   jsId="queryOrderRowdgoodsWeight"  id="queryOrderRowdgoodsWeight"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="queryOrderRowdgoodsWeightImg1" style="{display:none}" ><input type="text"  class="editerNumberSmall" jsid="queryOrderRowdgoodsWeight1"  id="queryOrderRowdgoodsWeight1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryOrderRowdgoodsWeightImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryOrderRowdgoodsWeightImgdown" >></span>
							<span id="queryOrderRowdgoodsWeightImg2div" style="{display:none}"> <input type="text"  class="editerNumberSmall"  jsid="queryOrderRowdgoodsWeight2"  id="queryOrderRowdgoodsWeight2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="queryOrderRowdgoodsWeightImg" class="imgStyle">
							
						</td>
														<td align="right" i18n="goodsVolume" >goodsVolume:</td>
							<td align="left" colspan="3" >
								<span id="queryOrderRowdgoodsVolumeImg0"  ><input type="text" class="editerNumber" jsId="queryOrderRowdgoodsVolume"  id="queryOrderRowdgoodsVolume"  dojoType="mydojo.NumberTextBox"  /></span>
								<span id="queryOrderRowdgoodsVolumeImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsid="queryOrderRowdgoodsVolume1"  id="queryOrderRowdgoodsVolume1"  dojoType="mydojo.NumberTextBox"  /></span>
								<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryOrderRowdgoodsVolumeImgup">></span>
								<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryOrderRowdgoodsVolumeImgdown" >></span>
								<span id="queryOrderRowdgoodsVolumeImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsid="queryOrderRowdgoodsVolume2"  id="queryOrderRowdgoodsVolume2"  dojoType="mydojo.NumberTextBox"  /></span>
								<img src="../image/start.gif" onclick="queryType(this);" id="queryOrderRowdgoodsVolumeImg" class="imgStyle">
							</td>  
																				<td align="right"  i18n="label" >label:</td>
						<td align="left"  >
																				<input type="text" class="editerInput"  id="queryOrderRowdlabel"  jsId="queryOrderRowdlabel"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			                <tr>
				<td align="right" i18n="carriage" >carriage:</td>
			<td align="left"  >
							<span id="queryOrderRowdcarriageImg0"  ><input type="text" class="editerNumber"   jsId="queryOrderRowdcarriage"  id="queryOrderRowdcarriage"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="queryOrderRowdcarriageImg1" style="{display:none}" ><input type="text"  class="editerNumberSmall" jsid="queryOrderRowdcarriage1"  id="queryOrderRowdcarriage1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryOrderRowdcarriageImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryOrderRowdcarriageImgdown" >></span>
							<span id="queryOrderRowdcarriageImg2div" style="{display:none}"> <input type="text"  class="editerNumberSmall"  jsid="queryOrderRowdcarriage2"  id="queryOrderRowdcarriage2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="queryOrderRowdcarriageImg" class="imgStyle">
							
						</td>
												<td align="right"  i18n="especial" >especial:</td>
						<td align="left" colspan="3" >
																					<input type="text" class="editerInput"  id="queryOrderRowdespecial"  jsId="queryOrderRowdespecial"   dojoType="dijit.form.TextBox"  />
													</td>  
															<td align="right"  i18n="goodsState" >goodsState:</td>
						<td align="left"  >
																				<input type="text" class="editerInput"  id="queryOrderRowdgoodsState"  jsId="queryOrderRowdgoodsState"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			                <tr>
							<td align="right" i18n="remark" >remark:</td>
						<td align="left"  >
						
																						<input type="text" class="editerInput"  id="queryOrderRowdremark"  jsId="queryOrderRowdremark"   dojoType="dijit.form.TextBox"  />
													</td>
				

    </tr>
//
								<tr><td align="right"  i18n="order"  ></td>
					<td align="left" ><input  id="queryOrderRowdorder"  jsId="queryOrderRowdorder" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderRowd.orderStore"  /></td>  
														<td align="right"  i18n="product"  ></td>
					<td align="left" colspan="3" ><input  id="queryOrderRowdproduct"  jsId="queryOrderRowdproduct" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderRowd.productStore"  /></td>  
						    </tr>

         <tr align="center"><td></td>
           <td colspan="2"> <button dojoType="dijit.form.Button" onclick="querybutton();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="3"></td><td colspan="2"></td></tr>
         </table>
</div>	

<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   OrderRowd List</b></td>
		<td align="right" >
	<button dojoType="dijit.form.Button" onclick="addRowOrderRowd();" iconClass="addIcon" i18n="add"  >add</button>
	<button dojoType="dijit.form.Button" onclick="removeOrderRowd();" iconClass="delIcon" i18n="delete" >delete</button>
	<button dojoType="dijit.form.Button"  onclick="call_funUpdOrderRowd();" i18n="save" iconClass="saveIcon">save</button>
	<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivOrderRowd');" iconClass="queryIcon"  i18n="openQuery" >query</button>
	<span id="rowCountOrderRowd"></span>
		<button dojoType="dijit.form.myButton" onclick="upPageOrderRowd();"  id="but6OrderRowd" disabled='true' jsId="but6OrderRowd" iconClass="upPageIcon" >pageup</button><!--span dojoType="dijit.Tooltip" connectId="but6">pageup</span-->
		<button dojoType="dijit.form.myButton" onclick="downPageOrderRowd();" id="but7OrderRowd" disabled='true' jsId="but7OrderRowd" iconClass="downPageIcon" >pagedown</button><!--span dojoType="dijit.Tooltip" connectId="but7">pagedown</span-->
		<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
			  <div dojoType="dijit.Menu">
				  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangeOrderRowd(this.label);"></div>
				  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangeOrderRowd(this.label);"></div>
			  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangeOrderRowd(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangeOrderRowd(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpageOrderRowd();"></div>
			  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
		</div>

		<button dojoType="dijit.form.myButton" onclick="allopen();"  iconClass="allopenIcon" i18n="allopen" >allopen</button>
		<button dojoType="dijit.form.myButton" onclick="allclose();" iconClass="allcloseIcon" i18n="allclose"  >allclose</button>
		</td>
	</tr>
</table> 

<div id="gridOrderRowd"  dojoType="dojox.Grid"  autoWidth="false" style="{width:100%;height:85%}" 	jsId="gridOrderRowd"	model="modelOrderRowd" structure="mainLayout"  ></div>
</div>  
    
<div dojoType="dojox.layout.ExpandoPane" splitter="true" duration="125" region="bottom" title="" style="height:375px;"  onLoad="myOnLoad" id="bottomPane" jsId="bottomPane" ><!--href="OrderRowdSelectTab.html"-->
								<table id="order2orderRowTable"  style=" position:absolute;top:0px; width:90%; visibility:visible ">
				<tr height="25px" width="100%">
		<td align="right" >
					<span id="rowCountpaneorder2orderRow"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button dojoType="dijit.form.myButton" onclick="upPagepaneorder2orderRow();"  id="but6paneorder2orderRow" disabled='true' jsId="but6paneorder2orderRow" iconClass="upPageIcon" >pageup</button>
					<button dojoType="dijit.form.myButton" onclick="downPagepaneorder2orderRow();" id="but7paneorder2orderRow" disabled='true' jsId="but7paneorder2orderRow" iconClass="downPageIcon" >pagedown</button>
	</td></tr></table>
									<table id="orderRowds2productTable"  style=" position:absolute;top:0px; width:90%; visibility:hidden ">		
				<tr height="25px" width="100%">
		<td align="right" >
					<span id="rowCountpaneorderRowds2product"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button dojoType="dijit.form.myButton" onclick="upPagepaneorderRowds2product();"  id="but6paneorderRowds2product" disabled='true' jsId="but6paneorderRowds2product" iconClass="upPageIcon" >pageup</button>
					<button dojoType="dijit.form.myButton" onclick="downPagepaneorderRowds2product();" id="but7paneorderRowds2product" disabled='true' jsId="but7paneorderRowds2product" iconClass="downPageIcon" >pagedown</button>
	</td></tr></table>
				<div dojoType="dijit.layout.TabContainer" style="height:100%; width:100%;"   id="OrderRowdSelectTab" jsId="OrderRowdSelectTab"  >
			<div dojoType="dojox.layout.ContentPane" href="../common/order2orderRowSelectPane.html" title="order"  id="order2orderRow" jsId="orderSelectPane" >
		</div>
				<div dojoType="dojox.layout.ContentPane" href="../common/orderRowds2productSelectPane.html" title="product"  id="orderRowds2product" jsId="productSelectPane" >
		</div>
		</div>
</div>

</div>
</body>
<script type="text/javascript">trans18tag();</script>
</html>		
