	  
//ÒÔÏÂÊÇ"ÒýÓÃ±í"ÊÇÆÕÍ¨±í
        //set (= order2orderRow)
//¶ÔÓÚ¿ÉÐÞ¸ÄµÄlayout£¬($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[order], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[product]])²¢if(!${member.many})  µÄ×Ö¶ÎÓ¦µ¯³öFloatµÄÑ¡Ôñ´°¿Ú´ý²âÊÔ
														  var NUorder2orderRow = false;//needUpdate
  var urlorder2orderRow = getUrl()+ "services/OrderRowdManageService";
  var deletedataorder2orderRow =  new Array();
  var querydataorder2orderRow =  new Array();
  var pagenumberorder2orderRow=1;
  var totalCountorder2orderRow=0;
  var pagesizeorder2orderRow=10;
  var orderByorder2orderRow='0';
  var queryvoorder2orderRow=new Object();
  var oddstyle='';
  var modelorder2orderRow = new dojox.grid.data.Table(null, querydataorder2orderRow);
  var gridorder2orderRow;
  var urle2 = getUrl()+ "services/BasicManageService";   

//have set function's manageableAssociationEnds
 
  
var getVOorder2orderRow=function(queryvo){

	var pu = new SOAPClientParameters2();
	pu.add('OrderRowdVO',queryvo) ;
	pu.add('pageNumber',pagenumberorder2orderRow) ;
	pu.add('pageSize',pagesizeorder2orderRow) ;
	pu.add('orderBy',orderByorder2orderRow) ;
	SOAPClient.invoke(urlorder2orderRow,"getOrderRowd", pu, false,  function GetEnu_callBack(ul, soapResponse){      
//ÅÐ¶Ï±¾±íÊÇ·ñÎª×Ó±í,µ±Ò»¸ö±íÊÇ¶à¸ö±íµÄ×Ó±íÊ±£¬´Ë´¦¿ÉÄÜÓÐ´íÎó¡£	
						//Orderd-----Orderd
			querydataorder2orderRow=dojoOrderd.OrderRowdVOtoArray_fun(ul,true);
				totalCountorder2orderRow=ul[ul.length-1]["ns:id"]; 
	}); 
	var totalpage=Math.ceil(new Number(totalCountorder2orderRow)/pagesizeorder2orderRow);
	
	if(totalpage>1){
		if(pagenumberorder2orderRow==1){
			dijit.byId("but6order2orderRow").setDisabled(true);
			dijit.byId("but7order2orderRow").setDisabled(false);
		}else if(pagenumberorder2orderRow==totalpage){
			dijit.byId("but6order2orderRow").setDisabled(false);
			dijit.byId("but7order2orderRow").setDisabled(true);
		}else{
			dijit.byId("but6order2orderRow").setDisabled(false);
			dijit.byId("but7order2orderRow").setDisabled(false);
		}
	}else{
		dijit.byId("but6order2orderRow").setDisabled(true);
		dijit.byId("but7order2orderRow").setDisabled(true);
	
	}
	if(pagesizeorder2orderRow==0){
		totalpage=1;
		dijit.byId("but6order2orderRow").setDisabled(true);
		dijit.byId("but7order2orderRow").setDisabled(true);
	}
	if(totalpage==1)pagenumberorder2orderRow=1;
	
	 document.getElementById("rowCountorder2orderRow").innerHTML=i18nStr.di+" "+pagenumberorder2orderRow+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountorder2orderRow+" "+i18nStr.rowSize; 	

	querydataorder2orderRow.splice(querydataorder2orderRow.length-1,1);
	modelorder2orderRow.setData(querydataorder2orderRow);
}

var buildorder2orderRow=function(){
	if(NUorder2orderRow && mainID!=undefined && mainID!=''){
		var queryFloatOrderd=new Object();
		queryFloatOrderd.id=mainID+'';
		queryvoorder2orderRow.order=queryFloatOrderd;
		getVOorder2orderRow(queryvoorder2orderRow);
		if(dijit.byId("gridorder2orderRow")==undefined){
			  gridorder2orderRow = new dojox.Grid({
						title: "",
						id: "gridorder2orderRow",
						jsId: "gridorder2orderRow",
						structure: layoutorder2orderRow,
						rowCount:querydataorder2orderRow.length,
						model:modelorder2orderRow
					}, dojo.byId("gridorder2orderRow"));
				gridorder2orderRow.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100});
				
		}else{
			gridorder2orderRow.updateRowCount(querydataorder2orderRow.length); 
		}
		NUorder2orderRow=false;
	}

}

																																									
	var layoutorder2orderRow=[{
           //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydateÖÐÈ¡Êý¾Ý
   
			 cells: [ [
					   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
            {name: i18nStr.productNum,field:2, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		             ,  {name: i18nStr.unitNum,field:3, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		             ,  {name: i18nStr.goodsSuttle,field:4, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		             ,  {name: i18nStr.goodsWeight,field:5, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		             ,  {name: i18nStr.goodsVolume,field:6, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		        					,   {name: i18nStr.label, field: 7,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					                 ,  {name: i18nStr.carriage,field:8, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		        					,   {name: i18nStr.especial, field: 9,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            					,   {name: i18nStr.goodsState, field: 10,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            				    ,   {name: i18nStr.remark, field: 11,width: 10, editor: dojox.grid.editors.Editor,required:false, editorToolbar: true  }
					      
//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
																//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
																	,   {name: i18nStr.product,field: 13,get:function(inRowIndex){ var str='';var strid;if(querydataorder2orderRow[inRowIndex]!=undefined && querydataorder2orderRow[inRowIndex][13]!=undefined && querydataorder2orderRow[inRowIndex][13][2]!=undefined){str=querydataorder2orderRow[inRowIndex][13][2];strid=querydataorder2orderRow[inRowIndex][13][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoOrderRowd.selectProd('+strid+','+inRowIndex+',13,0,event);"   >';} ,width: 10 }
										                                        ] ]
                           }]; 


var addRoworder2orderRow = function(){

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
																							//{ass.otherEnd.name}=order
					addrow.push([false,mainID]);
																					addrow.push([]);
											addrow.splice(0,0,false,0);
	gridorder2orderRow.addRow(addrow,gridorder2orderRow.model.getRowCount());
} 

function removeorder2orderRow(){
       var s= new Array();
       var sall=gridorder2orderRow.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            deletedataorder2orderRow.splice(deletedataorder2orderRow.length,0,thisCell[1]);
       }}}
       gridorder2orderRow.model.remove(s);//grid.removeSelectedRows();
 }
function call_funUpdorder2orderRow() {
       var sall=gridorder2orderRow.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1]+'';
             if(dojox.validate.isInRange(thisCell[2],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[2];vobject.productNum=n;
             }else{gridorder2orderRow.getCell(gridorder2orderRow.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[3],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[3];vobject.unitNum=n;
             }else{gridorder2orderRow.getCell(gridorder2orderRow.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[4],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[4];vobject.goodsSuttle=n;
             }else{gridorder2orderRow.getCell(gridorder2orderRow.model.fieldArray[4]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[5],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[5];vobject.goodsWeight=n;
             }else{gridorder2orderRow.getCell(gridorder2orderRow.model.fieldArray[5]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[6],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[6];vobject.goodsVolume=n;
             }else{gridorder2orderRow.getCell(gridorder2orderRow.model.fieldArray[6]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

               vobject.label=thisCell[7];
 
             if(dojox.validate.isInRange(thisCell[8],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[8];vobject.carriage=n;
             }else{gridorder2orderRow.getCell(gridorder2orderRow.model.fieldArray[8]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

               vobject.especial=thisCell[9];
 
               vobject.goodsState=thisCell[10];
 
               vobject.remark=thisCell[11];
 

																var manageable=new Object();
			 manageable.id=mainID+'';
             vobject.order=manageable;
			 																var manageable=new Object();
			 if(querydataorder2orderRow[i][13]!=''&&querydataorder2orderRow[i][13]!=undefined){
             manageable.id=querydataorder2orderRow[i][13][1] +'';
             vobject.product=manageable;
			 }else{
			 gridorder2orderRow.getCell(gridorder2orderRow.model.fieldArray[13]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
						


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('OrderRowdVO',vobject);
                SOAPClient.invoke(urlorder2orderRow, "createOrderRowd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                gridorder2orderRow.model.setDatum(ul,i,1);
				});
	         }else{//modify row
                padd.add('OrderRowdVO',vobject);
                SOAPClient.invoke(urlorder2orderRow, "updateOrderRowd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
        } }}//for
//submit delete
          for(var i=0;i<deletedataorder2orderRow.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedataorder2orderRow[i]);
               SOAPClient.invoke(urlorder2orderRow, "deleteOrderRowd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          deletedataorder2orderRow=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
 } 
 
	function selectOrderdFun(rep){
		querydataorder2orderRow[dojoOrderRowd.selectOrderdInRow][dojoOrderRowd.noOrderd]=rep;
		gridorder2orderRow.updateRow(dojoOrderRowd.selectOrderdInRow);		
	}
	function selectProdFun(rep){
		querydataorder2orderRow[dojoOrderRowd.selectProdInRow][dojoOrderRowd.noProd]=rep;
		gridorder2orderRow.updateRow(dojoOrderRowd.selectProdInRow);		
	}

function pageSizeChangeorder2orderRow(mylabel){
	pagesizeorder2orderRow=mylabel;
	getVOorder2orderRow(queryvoorder2orderRow);
}

function allpageorder2orderRow(){
	pagesizeorder2orderRow=0;
	getVOorder2orderRow(queryvoorder2orderRow);
}

function upPageorder2orderRow(){
	pagenumberorder2orderRow--;
	getVOorder2orderRow(queryvoorder2orderRow);
}
function downPageorder2orderRow(){
	pagenumberorder2orderRow++;
	getVOorder2orderRow(queryvoorder2orderRow);
}

	//buildorder2orderRow();
	  	//buildorderRowds2product();
