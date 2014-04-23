	  //---begin---------ÅÐ¶ÏÊÇ·ñÎª¶à¶Ô¶àµÄ¹ØÏµ±í
			//---begin---------ÅÐ¶ÏÊÇ·ñÖ±½Ó¹ØÁªÁËtree½á¹¹±ísno
		//ÒÔÏÂÊÇÆÕÍ¨±í
//set (= contacts2customer)
					  var NUcontacts2customer = false;//needUpdate
  var urlcontacts2customer = getUrl()+ "services/ContactManageService";
 /* var deletedatacontacts2customer =  new Array();
  var querydatacontacts2customer =  new Array();
  var pagenumbercontacts2customer=1;
  var totalCountcontacts2customer=0;
  var pagesizecontacts2customer=10;
  var orderBycontacts2customer='0';
  var queryvocontacts2customer=new Object();
  var oddstyle='';
  var modelcontacts2customer = new dojox.grid.data.Table(null, querydatacontacts2customer);
  var gridcontacts2customer;
  var urle2 = getUrl()+ "services/BasicManageService";   */
  
 
  
var getVOcontacts2customer=function(queryvo,id){

	var pu = new SOAPClientParameters2();
	pu.add('ContactVO',queryvo) ;
	pu.add('pageNumber',contacts2customerFloatArray[id].pagenumbercontacts2customer) ;
	pu.add('pageSize',contacts2customerFloatArray[id].pagesizecontacts2customer) ;
	pu.add('orderBy',contacts2customerFloatArray[id].orderBycontacts2customer) ;
	SOAPClient.invoke(urlcontacts2customer,"getContact", pu, false,  function GetEnu_callBack(ul, soapResponse){      
	//ÅÐ¶Ï±¾±íÊÇ·ñÎª×Ó±í,µ±Ò»¸ö±íÊÇ¶à¸ö±íµÄ×Ó±íÊ±£¬´Ë´¦¿ÉÄÜÓÐ´íÎó¡£	
	contacts2customerFloatArray[id].querydatacontacts2customer=dojoContact.ContactVOtoArray_fun(ul,true);
	contacts2customerFloatArray[id].totalCountcontacts2customer=ul[ul.length-1]["ns:id"]; 
	}); 
	var totalpage=Math.ceil(new Number(contacts2customerFloatArray[id].totalCountcontacts2customer)/contacts2customerFloatArray[id].pagesizecontacts2customer);
	
	if(totalpage>1){
		if(contacts2customerFloatArray[id].pagenumbercontacts2customer==1){
			dijit.byId("but6contacts2customer"+id).setDisabled(true);
			dijit.byId("but7contacts2customer"+id).setDisabled(false);
		}else if(contacts2customerFloatArray[id].pagenumbercontacts2customer==totalpage){
			dijit.byId("but6contacts2customer"+id).setDisabled(false);
			dijit.byId("but7contacts2customer"+id).setDisabled(true);
		}else{
			dijit.byId("but6contacts2customer"+id).setDisabled(false);
			dijit.byId("but7contacts2customer"+id).setDisabled(false);
		}
	}else{
		dijit.byId("but6contacts2customer"+id).setDisabled(true);
		dijit.byId("but7contacts2customer"+id).setDisabled(true);
	
	}
	if(contacts2customerFloatArray[id].pagesizecontacts2customer==0){
		totalpage=1;
		dijit.byId("but6contacts2customer"+id).setDisabled(true);
		dijit.byId("but7contacts2customer"+id).setDisabled(true);
	}
	if(totalpage==1)contacts2customerFloatArray[id].pagenumbercontacts2customer=1;
	
	 document.getElementById("rowCountcontacts2customer"+id).innerHTML=i18nStr.di+" "+contacts2customerFloatArray[id].pagenumbercontacts2customer+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+contacts2customerFloatArray[id].totalCountcontacts2customer+" "+i18nStr.rowSize; 	

	contacts2customerFloatArray[id].querydatacontacts2customer.splice(contacts2customerFloatArray[id].querydatacontacts2customer.length-1,1);
	contacts2customerFloatArray[id].modelcontacts2customer.setData(contacts2customerFloatArray[id].querydatacontacts2customer);
}

var buildcontacts2customer=function(mainID){
	if( mainID!=undefined && mainID!=''){//NUcontacts2customer &&
	    var openFloat=dijit.byId("openFloat_"+mainID);
		var openGrid=dijit.byId("gridcontacts2customer"+mainID);
		if(openGrid==undefined){
		openFloat.setContent("<table style=\"width:80%; position:absolute;top:0px;\"><tr height=\"25px\" width=\"100%\"><td align=\"left\" style=\"background:transparent\"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   contacts2customer List&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align=\"right\" ><span ></span>&nbsp;&nbsp;<div ></div><div > </div><div ></div><div ></div><div ></div></td></tr></table><div style=\"{width:999px;height:500px; position:absolute;top:30px;}\" ><div ></div></div>");

	  	contacts2customerFloatArray[mainID] = new contacts2customerFloatPara(mainID);
		var openContainerTable=openFloat.containerNode.children[0].children[0].children[0].children[1].childNodes;
		openContainerTable[0].innerHTML="<span id=\"rowCountcontacts2customer"+mainID+"\"></span>";
var but1 = new dijit.form.myButton({label:"pageup",id:"but6contacts2customer"+mainID,disabled:"true",onclick:"upPagecontacts2customer("+mainID+");",iconClass:"upPageIcon"},openContainerTable[1]);
var but2= new dijit.form.myButton({label:"pagedown",id:"but7contacts2customer"+mainID,disabled:"true",onclick:"downPagecontacts2customer("+mainID+");",iconClass:"downPageIcon"},openContainerTable[2]);
	var but3 = new dijit.form.Button({label:"add",iconClass:"addIcon"},openContainerTable[3]);
	var but4 = new dijit.form.Button({label:"delete",iconClass:"delIcon"},openContainerTable[4]);//,onClick:"removecontacts2customer("+mainID+")"
	var but5 = new dijit.form.Button({label:"save",iconClass:"saveIcon",id:"but3contacts2customer"+mainID },openContainerTable[5]);//,onclick:but3contacts2customer(mainID)
		dojo.connect(but3, "onClick", function(e){  addRowcontacts2customer(""+mainID); });
		dojo.connect(but4, "onClick", function(e){  removecontacts2customer(""+mainID); });
		dojo.connect(but5, "onClick", function(e){  call_funUpdcontacts2customer(""+mainID); });
		var openContainerGrid=openFloat.containerNode.children[1].children[0];
		var queryFloatCustomer=new Object();
		queryFloatCustomer.id=mainID;
		contacts2customerFloatArray[mainID].queryvocontacts2customer.customer=queryFloatCustomer;
		getVOcontacts2customer(contacts2customerFloatArray[mainID].queryvocontacts2customer,mainID);
		//if(contacts2customerFloatArray[mainID].gridcontacts2customer==""){
			  contacts2customerFloatArray[mainID].gridcontacts2customer = new dojox.Grid({
					title: "",
					id: "gridcontacts2customer"+mainID,
					jsId: "gridcontacts2customer"+mainID,
					structure: buildLayoutcontacts2customer(mainID),
					rowCount:contacts2customerFloatArray[mainID].querydatacontacts2customer.length,
					model:contacts2customerFloatArray[mainID].modelcontacts2customer
				},openContainerGrid);
				//gridcontacts2customer.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100});
				
		}else{
			contacts2customerFloatArray[mainID].gridcontacts2customer.updateRowCount(contacts2customerFloatArray[mainID].querydatacontacts2customer.length); 
		}}
}

					//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
						var buildLayoutcontacts2customer = function(floatMainID){		
	var layoutcontacts2customer=[{
           //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydateÖÐÈ¡Êý¾Ý
   
			 cells: [ [
					   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
      					  {name: i18nStr.codeContact, field: 2,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
					      
//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
												//,   {name: i18nStr.customer,field: 3,get:function(inRowIndex){ var str='';var strid;if(querydatacontacts2customer[inRowIndex]!=undefined && querydatacontacts2customer[inRowIndex][3]!=undefined && querydatacontacts2customer[inRowIndex][3][2]!=undefined){str=querydatacontacts2customer[inRowIndex][3][2];strid=querydatacontacts2customer[inRowIndex][3][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="selectCustomer('+strid+','+inRowIndex+',3,0,event);"   >';} ,width: 10 }
						                                        ] ]
                           }]; 
return layoutcontacts2customer;
}
var addRowcontacts2customer = function(id){

	var addrow=[];
														addrow.push('');
																							//{ass.otherEnd.name}=customer
					addrow.push([false,id]);
											addrow.splice(0,0,false,0);
	dijit.byId("gridcontacts2customer"+id).addRow(addrow,contacts2customerFloatArray[id].gridcontacts2customer.model.getRowCount());
} 

function removecontacts2customer(id){
       var s= new Array();
       var sall=contacts2customerFloatArray[id].gridcontacts2customer.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            contacts2customerFloatArray[id].deletedatacontacts2customer.splice(contacts2customerFloatArray[id].deletedatacontacts2customer.length,0,thisCell[1]);
       }}}
       contacts2customerFloatArray[id].gridcontacts2customer.model.remove(s);//grid.removeSelectedRows();
 }
function call_funUpdcontacts2customer(id) {
       var sall=contacts2customerFloatArray[id].gridcontacts2customer.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];
              if(dojox.validate.isText(thisCell[2], {minlength: 1})){vobject.codeContact=thisCell[2];
             }else{contacts2customerFloatArray[id].gridcontacts2customer.getCell(contacts2customerFloatArray[id].gridcontacts2customer.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 

								var manageable=new Object();
			 if(contacts2customerFloatArray[id].querydatacontacts2customer[i][3]!=''&&contacts2customerFloatArray[id].querydatacontacts2customer[i][3]!=undefined){
             manageable.id=contacts2customerFloatArray[id].querydatacontacts2customer[i][3][1];
             vobject.customer=manageable;
			 }else{
			 contacts2customerFloatArray[id].gridcontacts2customer.getCell(contacts2customerFloatArray[id].gridcontacts2customer.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
						


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('ContactVO',vobject);
                SOAPClient.invoke(urlcontacts2customer, "createContact", padd, false,  function GetEnu_callBack(ul, soapResponse){
                contacts2customerFloatArray[id].gridcontacts2customer.model.setDatum(ul,i,1);
				});
	         }else{//modify row
                padd.add('ContactVO',vobject);
                SOAPClient.invoke(urlcontacts2customer, "updateContact", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
        } }}//for
//submit delete
          for(var i=0;i<contacts2customerFloatArray[id].deletedatacontacts2customer.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',contacts2customerFloatArray[id].deletedatacontacts2customer[i]);
               SOAPClient.invoke(urlcontacts2customer, "deleteContact", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          contacts2customerFloatArray[id].deletedatacontacts2customer=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
 } 
 
	function selectCustomerFun(rep){
		contacts2customerFloatArray[dojoContact.mainRowIndexCustomer].querydatacontacts2customer[dojoContact.selectCustomerInRow][dojoContact.noCustomer]=rep;
		contacts2customerFloatArray[dojoContact.mainRowIndexCustomer].gridcontacts2customer.updateRow(dojoContact.selectCustomerInRow);	
			
	}

function pageSizeChangecontacts2customer(mylabel){
	contacts2customerFloatArray[id].pagesizecontacts2customer=mylabel;
	getVOcontacts2customer(contacts2customerFloatArray[id].queryvocontacts2customer,mainID);
}

function allpagecontacts2customer(id){
	contacts2customerFloatArray[id].pagesizecontacts2customer=0;
	getVOcontacts2customer(contacts2customerFloatArray[id].queryvocontacts2customer,mainID);
}

function upPagecontacts2customer(id){
	pagenumbercontacts2customer--;
	getVOcontacts2customer(contacts2customerFloatArray[id].queryvocontacts2customer,mainID);
}
function downPagecontacts2customer(id){
	pagenumbercontacts2customer++;
	getVOcontacts2customer(contacts2customerFloatArray[id].queryvocontacts2customer,mainID);
}


