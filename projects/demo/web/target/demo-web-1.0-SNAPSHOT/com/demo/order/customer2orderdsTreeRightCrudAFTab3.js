		  
//??????"????¡À¨ª"?????¡§¡À¨ª
        //set (= customer2orderds)
//????????????layout??($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orderRow], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[customer]])??if(!${member.many})  ??¡Á?????????Float???????¡ã????????
								  var NUcustomer2orderds = false;//needUpdate
  var urlcustomer2orderds = getUrl()+ "services/OrderdManageService";
  var deletedatacustomer2orderds =  new Array();
  var querydatacustomer2orderds =  new Array();
  var pagenumbercustomer2orderds=1;
  var totalCountcustomer2orderds=0;
  var pagesizecustomer2orderds=10;
  var orderBycustomer2orderds='0';
  var queryvocustomer2orderds=new Object();
  var oddstyle='';
  var modelcustomer2orderds = new dojox.grid.data.Table(null, querydatacustomer2orderds);
  var gridcustomer2orderds;
  var urle2 = getUrl()+ "services/BasicManageService";   

//have set function's manageableAssociationEnds
 
  
var getVOcustomer2orderds=function(queryvo){

	var pu = new SOAPClientParameters2();
	pu.add('OrderdVO',queryvo) ;
	pu.add('pageNumber',pagenumbercustomer2orderds) ;
	pu.add('pageSize',pagesizecustomer2orderds) ;
	pu.add('orderBy',orderBycustomer2orderds) ;
	SOAPClient.invoke(urlcustomer2orderds,"getOrderd", pu, false,  function GetEnu_callBack(ul, soapResponse){      
//????¡À?¡À¨ª??????¡Á?¡À¨ª,?¡À????¡À¨ª???¨¤??¡À¨ª??¡Á?¡À¨ª?¡À?????????????¨ª?¨®??	
	querydatacustomer2orderds=dojoOrderd.OrderdVOtoArray_fun(ul,true);
	totalCountcustomer2orderds=ul[ul.length-1]["ns:id"]; 
	}); 
	var totalpage=Math.ceil(new Number(totalCountcustomer2orderds)/pagesizecustomer2orderds);
	
	if(totalpage>1){
		if(pagenumbercustomer2orderds==1){
			dijit.byId("but6customer2orderds").setDisabled(true);
			dijit.byId("but7customer2orderds").setDisabled(false);
		}else if(pagenumbercustomer2orderds==totalpage){
			dijit.byId("but6customer2orderds").setDisabled(false);
			dijit.byId("but7customer2orderds").setDisabled(true);
		}else{
			dijit.byId("but6customer2orderds").setDisabled(false);
			dijit.byId("but7customer2orderds").setDisabled(false);
		}
	}else{
		dijit.byId("but6customer2orderds").setDisabled(true);
		dijit.byId("but7customer2orderds").setDisabled(true);
	
	}
	if(pagesizecustomer2orderds==0){
		totalpage=1;
		dijit.byId("but6customer2orderds").setDisabled(true);
		dijit.byId("but7customer2orderds").setDisabled(true);
	}
	if(totalpage==1)pagenumbercustomer2orderds=1;
	
	 document.getElementById("rowCountcustomer2orderds").innerHTML=i18nStr.di+" "+pagenumbercustomer2orderds+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountcustomer2orderds+" "+i18nStr.rowSize; 	

	querydatacustomer2orderds.splice(querydatacustomer2orderds.length-1,1);
	modelcustomer2orderds.setData(querydatacustomer2orderds);
}

var buildcustomer2orderds=function(){
	if(NUcustomer2orderds && mainID!=undefined && mainID!=''){
		var queryFloatCustomer=new Object();
		queryFloatCustomer.id=mainID+'';
		queryvocustomer2orderds.customer=queryFloatCustomer;
		getVOcustomer2orderds(queryvocustomer2orderds);
		if(dijit.byId("gridcustomer2orderds")==undefined){
			  gridcustomer2orderds = new dojox.Grid({
						title: "",
						id: "gridcustomer2orderds",
						jsId: "gridcustomer2orderds",
						structure: layoutcustomer2orderds,
						rowCount:querydatacustomer2orderds.length,
						model:modelcustomer2orderds
					}, dojo.byId("gridcustomer2orderds"));
				gridcustomer2orderds.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100});
				
		}else{
			gridcustomer2orderds.updateRowCount(querydatacustomer2orderds.length); 
		}
		NUcustomer2orderds=false;
	}

}

																																																															
	var layoutcustomer2orderds=[{
           //?¨´??field???????????????????¨°????js????toArray¡Á??????¡§??????querydate????????
   
			 cells: [ [
					   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
      					  {name: i18nStr.customerOrderNo, field: 2,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            					,   {name: i18nStr.contractNo, field: 3,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            	    ,   {name: i18nStr.conveyanceEnum, field: 4,width: 10 , editor: mydojo.FilteringSelect ,options:itemOrderdconveyanceEnumOption,required:true ,invalidMessage:'can not be empty'}
			        	    ,   {name: i18nStr.carryTypeEnum, field: 5,width: 10 , editor: mydojo.FilteringSelect ,options:itemOrderdcarryTypeEnumOption,required:false ,invalidMessage:'can not be empty'}
			        					,   {name: i18nStr.shipperRemark, field: 6,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            					,   {name: i18nStr.carrierRemark, field: 7,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            	    ,   {name: i18nStr.levelEnum, field: 8,width: 10 , editor: mydojo.FilteringSelect ,options:itemOrderdlevelEnumOption,required:false ,invalidMessage:'can not be empty'}
			        	    ,   {name: i18nStr.customerTypeEnum, field: 9,width: 10 , editor: mydojo.FilteringSelect ,options:itemOrderdcustomerTypeEnumOption,required:false ,invalidMessage:'can not be empty'}
			    		,   {name: i18nStr.referTime,field:10, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
				,   {name: i18nStr.referTimeTime,field:11, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
		        					,   {name: i18nStr.linkMan, field: 12,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            					,   {name: i18nStr.tel, field: 13,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					        		,   {name: i18nStr.bookTime,field:14, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
				,   {name: i18nStr.bookTimeTime,field:15, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
		    		,   {name: i18nStr.completeTime,field:16, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
				,   {name: i18nStr.completeTimeTime,field:17, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
		        				    ,   {name: i18nStr.remark, field: 18,width: 10, editor: dojox.grid.editors.Editor,required:false, editorToolbar: true  }
					      
//??????¡À¨ª???¨ª????????
		//??????¡À¨ª???¨ª????????
												//,   {name: i18nStr.customer,field: 20,get:function(inRowIndex){ var str='';var strid;if(querydatacustomer2orderds[inRowIndex]!=undefined && querydatacustomer2orderds[inRowIndex][20]!=undefined && querydatacustomer2orderds[inRowIndex][20][2]!=undefined){str=querydatacustomer2orderds[inRowIndex][20][2];strid=querydatacustomer2orderds[inRowIndex][20][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoOrderd.selectCustomer('+strid+','+inRowIndex+',20,0,event);"   >';} ,width: 10 }
						                                        ] ]
                           }]; 


var addRowcustomer2orderds = function(){

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
																					addrow.push('');
																					addrow.push('');
																					addrow.push('');
					addrow.push('');
																					addrow.push('');
					addrow.push('');
																					addrow.push('');
																								addrow.push([]);
												//{ass.otherEnd.name}=customer
					addrow.push([false,mainID]);
											addrow.splice(0,0,false,0);
	gridcustomer2orderds.addRow(addrow,gridcustomer2orderds.model.getRowCount());
} 

function removecustomer2orderds(){
       var s= new Array();
       var sall=gridcustomer2orderds.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            deletedatacustomer2orderds.splice(deletedatacustomer2orderds.length,0,thisCell[1]);
       }}}
       gridcustomer2orderds.model.remove(s);//grid.removeSelectedRows();
 }
function call_funUpdcustomer2orderds() {
       var sall=gridcustomer2orderds.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1]+'';
               vobject.customerOrderNo=thisCell[2];
 
               vobject.contractNo=thisCell[3];
 
              if(dojox.validate.isText(thisCell[4], {minlength: 1})){vobject.conveyanceEnum=thisCell[4];
             }else{gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[4]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
               vobject.carryTypeEnum=thisCell[5];
 
               vobject.shipperRemark=thisCell[6];
 
               vobject.carrierRemark=thisCell[7];
 
               vobject.levelEnum=thisCell[8];
 
               vobject.customerTypeEnum=thisCell[9];
 
var  d=new DateTimeQuery();
             if(thisCell[10] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[10], gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[10]).constraint);
             }else{gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[10]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[11] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[11], gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[11]).constraint);
             vobject.referTime=d;
             }else{gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[11]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null
 

               vobject.linkMan=thisCell[12];
 
               vobject.tel=thisCell[13];
 
var  d=new DateTimeQuery();
             if(thisCell[14] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[14], gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[14]).constraint);
             }else{gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[14]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[15] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[15], gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[15]).constraint);
             vobject.bookTime=d;
             }else{gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[15]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null
 

var  d=new DateTimeQuery();
             if(thisCell[16] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[16], gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[16]).constraint);
             }else{gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[16]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[17] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[17], gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[17]).constraint);
             vobject.completeTime=d;
             }else{gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[17]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null
 

               vobject.remark=thisCell[18];
 

										var manageable=new Object();
			 if(querydatacustomer2orderds[i][20]!=''&&querydatacustomer2orderds[i][20]!=undefined){
             manageable.id=querydatacustomer2orderds[i][20][1] +'';
             vobject.customer=manageable;
			 }else{
			 gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[20]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
						


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('OrderdVO',vobject);
                SOAPClient.invoke(urlcustomer2orderds, "createOrderd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                gridcustomer2orderds.model.setDatum(ul,i,1);
				});
	         }else{//modify row
                padd.add('OrderdVO',vobject);
                SOAPClient.invoke(urlcustomer2orderds, "updateOrderd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
        } }}//for
//submit delete
          for(var i=0;i<deletedatacustomer2orderds.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedatacustomer2orderds[i]);
               SOAPClient.invoke(urlcustomer2orderds, "deleteOrderd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          deletedatacustomer2orderds=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
 } 
 
	function selectOrderRowdFun(rep){
		querydatacustomer2orderds[dojoOrderd.selectOrderRowdInRow][dojoOrderd.noOrderRowd]=rep;
		gridcustomer2orderds.updateRow(dojoOrderd.selectOrderRowdInRow);		
	}
	function selectCustomerFun(rep){
		querydatacustomer2orderds[dojoOrderd.selectCustomerInRow][dojoOrderd.noCustomer]=rep;
		gridcustomer2orderds.updateRow(dojoOrderd.selectCustomerInRow);		
	}

function pageSizeChangecustomer2orderds(mylabel){
	pagesizecustomer2orderds=mylabel;
	getVOcustomer2orderds(queryvocustomer2orderds);
}

function allpagecustomer2orderds(){
	pagesizecustomer2orderds=0;
	getVOcustomer2orderds(queryvocustomer2orderds);
}

function upPagecustomer2orderds(){
	pagenumbercustomer2orderds--;
	getVOcustomer2orderds(queryvocustomer2orderds);
}
function downPagecustomer2orderds(){
	pagenumbercustomer2orderds++;
	getVOcustomer2orderds(queryvocustomer2orderds);
}

	//buildcustomer2orderds();
