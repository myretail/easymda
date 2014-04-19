		  //---begin---------???????????¨¤???¨¤??????¡À¨ª
																													//---begin---------?????????¡À????????tree?¨¢??¡À¨ªsno
															//?????????¡§¡À¨ª
//set (= customer2orderds)
								  var NUcustomer2orderds = false;//needUpdate
  var urlcustomer2orderds = getUrl()+ "services/OrderdManageService";
 /* var deletedatacustomer2orderds =  new Array();
  var querydatacustomer2orderds =  new Array();
  var pagenumbercustomer2orderds=1;
  var totalCountcustomer2orderds=0;
  var pagesizecustomer2orderds=10;
  var orderBycustomer2orderds='0';
  var queryvocustomer2orderds=new Object();
  var oddstyle='';
  var modelcustomer2orderds = new dojox.grid.data.Table(null, querydatacustomer2orderds);
  var gridcustomer2orderds;
  var urle2 = getUrl()+ "services/BasicManageService";   */
  
 
  
var getVOcustomer2orderds=function(queryvo,id){

	var pu = new SOAPClientParameters2();
	pu.add('OrderdVO',queryvo) ;
	pu.add('pageNumber',customer2orderdsFloatArray[id].pagenumbercustomer2orderds) ;
	pu.add('pageSize',customer2orderdsFloatArray[id].pagesizecustomer2orderds) ;
	pu.add('orderBy',customer2orderdsFloatArray[id].orderBycustomer2orderds) ;
	SOAPClient.invoke(urlcustomer2orderds,"getOrderd", pu, false,  function GetEnu_callBack(ul, soapResponse){      
	//????¡À?¡À¨ª??????¡Á?¡À¨ª,?¡À????¡À¨ª???¨¤??¡À¨ª??¡Á?¡À¨ª?¡À?????????????¨ª?¨®??	
	customer2orderdsFloatArray[id].querydatacustomer2orderds=dojoOrderd.OrderdVOtoArray_fun(ul,true);
	customer2orderdsFloatArray[id].totalCountcustomer2orderds=ul[ul.length-1]["ns:id"]; 
	}); 
	var totalpage=Math.ceil(new Number(customer2orderdsFloatArray[id].totalCountcustomer2orderds)/customer2orderdsFloatArray[id].pagesizecustomer2orderds);
	
	if(totalpage>1){
		if(customer2orderdsFloatArray[id].pagenumbercustomer2orderds==1){
			dijit.byId("but6customer2orderds"+id).setDisabled(true);
			dijit.byId("but7customer2orderds"+id).setDisabled(false);
		}else if(customer2orderdsFloatArray[id].pagenumbercustomer2orderds==totalpage){
			dijit.byId("but6customer2orderds"+id).setDisabled(false);
			dijit.byId("but7customer2orderds"+id).setDisabled(true);
		}else{
			dijit.byId("but6customer2orderds"+id).setDisabled(false);
			dijit.byId("but7customer2orderds"+id).setDisabled(false);
		}
	}else{
		dijit.byId("but6customer2orderds"+id).setDisabled(true);
		dijit.byId("but7customer2orderds"+id).setDisabled(true);
	
	}
	if(customer2orderdsFloatArray[id].pagesizecustomer2orderds==0){
		totalpage=1;
		dijit.byId("but6customer2orderds"+id).setDisabled(true);
		dijit.byId("but7customer2orderds"+id).setDisabled(true);
	}
	if(totalpage==1)customer2orderdsFloatArray[id].pagenumbercustomer2orderds=1;
	
	 document.getElementById("rowCountcustomer2orderds"+id).innerHTML=i18nStr.di+" "+customer2orderdsFloatArray[id].pagenumbercustomer2orderds+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+customer2orderdsFloatArray[id].totalCountcustomer2orderds+" "+i18nStr.rowSize; 	

	customer2orderdsFloatArray[id].querydatacustomer2orderds.splice(customer2orderdsFloatArray[id].querydatacustomer2orderds.length-1,1);
	customer2orderdsFloatArray[id].modelcustomer2orderds.setData(customer2orderdsFloatArray[id].querydatacustomer2orderds);
}

var buildcustomer2orderds=function(mainID){
	if( mainID!=undefined && mainID!=''){//NUcustomer2orderds &&
	    var openFloat=dijit.byId("gridcustomer2orderds"+mainID);
		if(openFloat==undefined){
			customer2orderdsFloatArray[mainID] = new customer2orderdsFloatPara(mainID);
			var newTab = dijit.byId("customer2orderds"+mainID);
			newTab.setContent("<table   style=\"width:80%; position:absolute;top:0px;\"><tr height=\"25px\" width=\"100%\">	<td align=\"left\" style=\"background:transparent\"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   customer2orderds List&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align=\"right\" ><span ></span>&nbsp;&nbsp;	<div > </div><div > </div><div > </div>	<div > </div><div > </div>	</td></tr></table><div style=\"{width:500px;height:500px; position:absolute;top:30px;}\" ><div > </div></div>");
			var openContainerTable=newTab.containerNode.children[0].children[0].children[0].children[1].childNodes;
	
		openContainerTable[0].innerHTML="<span id=\"rowCountcustomer2orderds"+mainID+"\"></span>";
var but1 = new dijit.form.myButton({label:"pageup",id:"but6customer2orderds"+mainID,disabled:"true",onclick:"upPagecustomer2orderds("+mainID+");",iconClass:"upPageIcon"},openContainerTable[1]);
var but2= new dijit.form.myButton({label:"pagedown",id:"but7customer2orderds"+mainID,disabled:"true",onclick:"downPagecustomer2orderds("+mainID+");",iconClass:"downPageIcon"},openContainerTable[2]);
	var but3 = new dijit.form.Button({label:"add",iconClass:"addIcon"},openContainerTable[3]);
	var but4 = new dijit.form.Button({label:"delete",iconClass:"delIcon"},openContainerTable[4]);       //,onClick:"removecustomer2orderds("+mainID+")"
	var but5 = new dijit.form.Button({label:"save",iconClass:"saveIcon",id:"but3customer2orderds"+mainID },openContainerTable[5]);//,onclick:but3customer2orderds(mainID)
		dojo.connect(but3, "onClick", function(e){  addRowcustomer2orderds(""+mainID); });
		dojo.connect(but4, "onClick", function(e){  removecustomer2orderds(""+mainID); });
		dojo.connect(but5, "onClick", function(e){  call_funUpdcustomer2orderds(""+mainID); });
		var openContainerGrid=newTab.domNode.children[1].children[0];
		var queryFloatCustomer=new Object();
		queryFloatCustomer.id=mainID;
		customer2orderdsFloatArray[mainID].queryvocustomer2orderds.customer=queryFloatCustomer;
		getVOcustomer2orderds(customer2orderdsFloatArray[mainID].queryvocustomer2orderds,mainID);
		//if(customer2orderdsFloatArray[mainID].gridcustomer2orderds==""){
			  customer2orderdsFloatArray[mainID].gridcustomer2orderds = new dojox.Grid({
					title: "",
					id: "gridcustomer2orderds"+mainID,
					jsId: "gridcustomer2orderds"+mainID,
					structure: buildLayoutcustomer2orderds(mainID),
					rowCount:customer2orderdsFloatArray[mainID].querydatacustomer2orderds.length,
					model:customer2orderdsFloatArray[mainID].modelcustomer2orderds
				},openContainerGrid);
				//gridcustomer2orderds.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100});
				customer2orderdsFloatArray[mainID].gridcustomer2orderds.resize({w:999,h:500});
		}else{
			getVOcustomer2orderds(customer2orderdsFloatArray[mainID].queryvocustomer2orderds,mainID);
			customer2orderdsFloatArray[mainID].gridcustomer2orderds.modelAllChange();

		}}
}

																																																															//??????¡À¨ª???¨ª????????
	//??????¡À¨ª???¨ª????????
						
var buildLayoutcustomer2orderds = function(floatMainID){		
	var layoutcustomer2orderds=[{
           //?¨´??field???????????????????¨°????js????toArray¡Á??????¡§??????querydate????????
   
			 cells: [ [
					   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
      					  {name: i18nStr.customerOrderNo, field: 2,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            					,   {name: i18nStr.contractNo, field: 3,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            	    			,   {name: i18nStr.conveyanceEnum, field: 4,width: 10 , editor: mydojo.FilteringSelect ,options:dojoOrderd.itemconveyanceEnumOption,required:true ,invalidMessage:'can not be empty'}
			        	    			,   {name: i18nStr.carryTypeEnum, field: 5,width: 10 , editor: mydojo.FilteringSelect ,options:dojoOrderd.itemcarryTypeEnumOption,required:false ,invalidMessage:'can not be empty'}
			        					,   {name: i18nStr.shipperRemark, field: 6,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            					,   {name: i18nStr.carrierRemark, field: 7,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            	    			,   {name: i18nStr.levelEnum, field: 8,width: 10 , editor: mydojo.FilteringSelect ,options:dojoOrderd.itemlevelEnumOption,required:false ,invalidMessage:'can not be empty'}
			        	    			,   {name: i18nStr.customerTypeEnum, field: 9,width: 10 , editor: mydojo.FilteringSelect ,options:dojoOrderd.itemcustomerTypeEnumOption,required:false ,invalidMessage:'can not be empty'}
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
												//,   {name: i18nStr.customer,field: 20,get:function(inRowIndex){ var str='';var strid;if(querydatacustomer2orderds[inRowIndex]!=undefined && querydatacustomer2orderds[inRowIndex][20]!=undefined && querydatacustomer2orderds[inRowIndex][20][2]!=undefined){str=querydatacustomer2orderds[inRowIndex][20][2];strid=querydatacustomer2orderds[inRowIndex][20][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="selectCustomer('+strid+','+inRowIndex+',20,0,event);"   >';} ,width: 10 }
						                                        ] ]
                           }]; 
return layoutcustomer2orderds;
}

var addRowcustomer2orderds = function(id){

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
					addrow.push([false,id]);
											addrow.splice(0,0,false,0);
	dijit.byId("gridcustomer2orderds"+id).addRow(addrow,customer2orderdsFloatArray[id].gridcustomer2orderds.model.getRowCount());
} 

function removecustomer2orderds(id){
       var s= new Array();
       var sall=customer2orderdsFloatArray[id].gridcustomer2orderds.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            customer2orderdsFloatArray[id].deletedatacustomer2orderds.splice(customer2orderdsFloatArray[id].deletedatacustomer2orderds.length,0,thisCell[1]);
       }}}
       customer2orderdsFloatArray[id].gridcustomer2orderds.model.remove(s);//grid.removeSelectedRows();
 }
function call_funUpdcustomer2orderds(id) {
       var sall=customer2orderdsFloatArray[id].gridcustomer2orderds.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];
               vobject.customerOrderNo=thisCell[2];
 
               vobject.contractNo=thisCell[3];
 
              if(dojox.validate.isText(thisCell[4], {minlength: 1})){vobject.conveyanceEnum=thisCell[4];
             }else{customer2orderdsFloatArray[id].gridcustomer2orderds.getCell(customer2orderdsFloatArray[id].gridcustomer2orderds.model.fieldArray[4]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
               vobject.carryTypeEnum=thisCell[5];
 
               vobject.shipperRemark=thisCell[6];
 
               vobject.carrierRemark=thisCell[7];
 
               vobject.levelEnum=thisCell[8];
 
               vobject.customerTypeEnum=thisCell[9];
 
var  d=new DateTimeQuery();
             if(thisCell[10] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[10], customer2orderdsFloatArray[id].gridcustomer2orderds.getCell(customer2orderdsFloatArray[id].gridcustomer2orderds.model.fieldArray[10]).constraint);
             }else{customer2orderdsFloatArray[id].gridcustomer2orderds.getCell(customer2orderdsFloatArray[id].gridcustomer2orderds.model.fieldArray[10]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[11] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[11], customer2orderdsFloatArray[id].gridcustomer2orderds.getCell(customer2orderdsFloatArray[id].gridcustomer2orderds.model.fieldArray[11]).constraint);
             vobject.referTime=d;
             }else{customer2orderdsFloatArray[id].gridcustomer2orderds.getCell(customer2orderdsFloatArray[id].gridcustomer2orderds.model.fieldArray[11]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null
 

               vobject.linkMan=thisCell[12];
 
               vobject.tel=thisCell[13];
 
var  d=new DateTimeQuery();
             if(thisCell[14] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[14], customer2orderdsFloatArray[id].gridcustomer2orderds.getCell(customer2orderdsFloatArray[id].gridcustomer2orderds.model.fieldArray[14]).constraint);
             }else{customer2orderdsFloatArray[id].gridcustomer2orderds.getCell(customer2orderdsFloatArray[id].gridcustomer2orderds.model.fieldArray[14]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[15] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[15], customer2orderdsFloatArray[id].gridcustomer2orderds.getCell(customer2orderdsFloatArray[id].gridcustomer2orderds.model.fieldArray[15]).constraint);
             vobject.bookTime=d;
             }else{customer2orderdsFloatArray[id].gridcustomer2orderds.getCell(customer2orderdsFloatArray[id].gridcustomer2orderds.model.fieldArray[15]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null
 

var  d=new DateTimeQuery();
             if(thisCell[16] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[16], customer2orderdsFloatArray[id].gridcustomer2orderds.getCell(customer2orderdsFloatArray[id].gridcustomer2orderds.model.fieldArray[16]).constraint);
             }else{customer2orderdsFloatArray[id].gridcustomer2orderds.getCell(customer2orderdsFloatArray[id].gridcustomer2orderds.model.fieldArray[16]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[17] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[17], customer2orderdsFloatArray[id].gridcustomer2orderds.getCell(customer2orderdsFloatArray[id].gridcustomer2orderds.model.fieldArray[17]).constraint);
             vobject.completeTime=d;
             }else{customer2orderdsFloatArray[id].gridcustomer2orderds.getCell(customer2orderdsFloatArray[id].gridcustomer2orderds.model.fieldArray[17]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null
 

               vobject.remark=thisCell[18];
 

										var manageable=new Object();
			 if(customer2orderdsFloatArray[id].querydatacustomer2orderds[i][20]!=''&&customer2orderdsFloatArray[id].querydatacustomer2orderds[i][20]!=undefined){
             manageable.id=customer2orderdsFloatArray[id].querydatacustomer2orderds[i][20][1];
             vobject.customer=manageable;
			 }else{
			 customer2orderdsFloatArray[id].gridcustomer2orderds.getCell(customer2orderdsFloatArray[id].gridcustomer2orderds.model.fieldArray[20]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
						


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('OrderdVO',vobject);
                SOAPClient.invoke(urlcustomer2orderds, "createOrderd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                customer2orderdsFloatArray[id].gridcustomer2orderds.model.setDatum(ul,i,1);
				});
	         }else{//modify row
                padd.add('OrderdVO',vobject);
                SOAPClient.invoke(urlcustomer2orderds, "updateOrderd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
        } }}//for
//submit delete
          for(var i=0;i<customer2orderdsFloatArray[id].deletedatacustomer2orderds.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',customer2orderdsFloatArray[id].deletedatacustomer2orderds[i]);
               SOAPClient.invoke(urlcustomer2orderds, "deleteOrderd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          customer2orderdsFloatArray[id].deletedatacustomer2orderds=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
 } 
 
		function selectOrderRowdFun(rep){
		customer2orderdsFloatArray[dojoOrderd.mainRowIndexOrderRowd].querydatacustomer2orderds[dojoOrderd.selectOrderRowdInRow][dojoOrderd.noOrderRowd]=rep;
		customer2orderdsFloatArray[dojoOrderd.mainRowIndexOrderRowd].gridcustomer2orderds.updateRow(dojoOrderd.selectOrderRowdInRow);	
			
	}
		function selectCustomerFun(rep){
		customer2orderdsFloatArray[dojoOrderd.mainRowIndexCustomer].querydatacustomer2orderds[dojoOrderd.selectCustomerInRow][dojoOrderd.noCustomer]=rep;
		customer2orderdsFloatArray[dojoOrderd.mainRowIndexCustomer].gridcustomer2orderds.updateRow(dojoOrderd.selectCustomerInRow);	
			
	}

function pageSizeChangecustomer2orderds(mylabel){
	customer2orderdsFloatArray[id].pagesizecustomer2orderds=mylabel;
	getVOcustomer2orderds(customer2orderdsFloatArray[id].queryvocustomer2orderds,mainID);
}

function allpagecustomer2orderds(id){
	customer2orderdsFloatArray[id].pagesizecustomer2orderds=0;
	getVOcustomer2orderds(customer2orderdsFloatArray[id].queryvocustomer2orderds,mainID);
}

function upPagecustomer2orderds(id){
	pagenumbercustomer2orderds--;
	getVOcustomer2orderds(customer2orderdsFloatArray[id].queryvocustomer2orderds,mainID);
}
function downPagecustomer2orderds(id){
	pagenumbercustomer2orderds++;
	getVOcustomer2orderds(customer2orderdsFloatArray[id].queryvocustomer2orderds,mainID);
}


