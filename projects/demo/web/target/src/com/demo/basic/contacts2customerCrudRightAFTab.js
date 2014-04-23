	  //±¾Ä£°åµÄÔª±íÊÇ4.1µÄÔª±í£¬---begin---------ÅÐ¶Ï"¼ýÎ²±í/ÒýÓÃ±í"£¨"Ôª±í"Îª"¼ýÍ·±í"/"±»ÒýÓÃ±í"£©ÊÇ·ñÎª¶à¶Ô¶àµÄ¹ØÏµ±í
			//---begin---------ÅÐ¶ÏÊÇ·ñÖ±½Ó¹ØÁªÁËtree½á¹¹±ísno,¼´"ÒýÓÃ±í"ÎªÊ÷±í
		//ÅÐ¶Ï"ÒýÓÃ±í"ÊÇ·ñÊÇÖ÷±íbegin
	//ÅÐ¶Ï"ÒýÓÃ±í"ÊÇ·ñÊÇ×Ó±íbegin
//ÅÐ¶Ï"ÒýÓÃ±í"ÊÇ·ñÊÇ×Ó±íend
//ÒÔÏÂÊÇ"ÒýÓÃ±í"ÊÇÆÕÍ¨±í
//set (= contacts2customer)
	//name =contacts2customerCrudRightAFTab.js  manageable.name=Contact
						  var NUcontacts2customer = false;//needUpdate
  var urlcontacts2customer = getUrl()+ "services/ContactManageService";
  var deletedatacontacts2customer =  new Array();
  var querydatacontacts2customer =  new Array();
  var pagenumbercontacts2customer=1;
  var totalCountcontacts2customer=0;
  var pagesizecontacts2customer=10;
  var orderBycontacts2customer='0';
  var queryvocontacts2customer=new Object();
  var oddstyle='';
  var modelcontacts2customer = new dojox.grid.data.Table(null, querydatacontacts2customer);
  var gridcontacts2customer;
  var urle2 = getUrl()+ "services/BasicManageService";   

/*		  */


  
  
var getVOcontacts2customer=function(queryvo){

	var pu = new SOAPClientParameters2();
	pu.add('ContactVO',queryvo) ;
	pu.add('pageNumber',pagenumbercontacts2customer) ;
	pu.add('pageSize',pagesizecontacts2customer) ;
	pu.add('orderBy',orderBycontacts2customer) ;
	SOAPClient.invoke(urlcontacts2customer,"getContact", pu, false,  function GetEnu_callBack(ul, soapResponse){     
//ÅÐ¶Ï±¾±íÊÇ·ñÎª×Ó±í,µ±Ò»¸ö±íÊÇ¶à¸ö±íµÄ×Ó±íÊ±£¬´Ë´¦¿ÉÄÜÓÐ´íÎó¡£	
	querydatacontacts2customer=dojoContact.ContactVOtoArray_fun(ul,true);
	totalCountcontacts2customer=ul[ul.length-1]["ns:id"]; 
	}); 
	var totalpage=Math.ceil(new Number(totalCountcontacts2customer)/pagesizecontacts2customer);
	
	if(totalpage>1){
		if(pagenumbercontacts2customer==1){
			dijit.byId("but6contacts2customer").setDisabled(true);
			dijit.byId("but7contacts2customer").setDisabled(false);
		}else if(pagenumbercontacts2customer==totalpage){
			dijit.byId("but6contacts2customer").setDisabled(false);
			dijit.byId("but7contacts2customer").setDisabled(true);
		}else{
			dijit.byId("but6contacts2customer").setDisabled(false);
			dijit.byId("but7contacts2customer").setDisabled(false);
		}
	}else{
		dijit.byId("but6contacts2customer").setDisabled(true);
		dijit.byId("but7contacts2customer").setDisabled(true);
	
	}
	if(pagesizecontacts2customer==0){
		totalpage=1;
		dijit.byId("but6contacts2customer").setDisabled(true);
		dijit.byId("but7contacts2customer").setDisabled(true);
	}
	if(totalpage==1)pagenumbercontacts2customer=1;
	
	 document.getElementById("rowCountcontacts2customer").innerHTML=i18nStr.di+" "+pagenumbercontacts2customer+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountcontacts2customer+" "+i18nStr.rowSize; 	

	querydatacontacts2customer.splice(querydatacontacts2customer.length-1,1);
	modelcontacts2customer.setData(querydatacontacts2customer);
}

var buildcontacts2customer=function(){
	if(NUcontacts2customer && mainID!=undefined && mainID!=''){
		var queryFloatCustomer=new Object();
		queryFloatCustomer.id=mainID;
		queryvocontacts2customer.customer=queryFloatCustomer;
		getVOcontacts2customer(queryvocontacts2customer);
		if(dijit.byId("gridcontacts2customer")==undefined){
			  gridcontacts2customer = new dojox.Grid({
						title: "",
						id: "gridcontacts2customer",
						jsId: "gridcontacts2customer",
						structure: layoutcontacts2customer,
						rowCount:querydatacontacts2customer.length,
						model:modelcontacts2customer
					}, dojo.byId("gridcontacts2customer"));
				gridcontacts2customer.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100}); 
				
		}else{
			gridcontacts2customer.updateRowCount(querydatacontacts2customer.length); 
		}
		NUcontacts2customer=false;
	}

}

						var layoutcontacts2customer=[{
           //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydateÖÐÈ¡Êý¾Ý
   
			 cells: [ [
					   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
     					  {name: i18nStr.codeContact, field: 2,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
					      


//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
												//,   {name: i18nStr.customer,field: 3,get:function(inRowIndex){ var str='';var strid;if(querydatacontacts2customer[inRowIndex]!=undefined && querydatacontacts2customer[inRowIndex][3]!=undefined && querydatacontacts2customer[inRowIndex][3][2]!=undefined){str=querydatacontacts2customer[inRowIndex][3][2];strid=querydatacontacts2customer[inRowIndex][3][1];} return str;} ,width: 10 }
						                                        ] ]
                           }]; 

//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
						
			   
						   
var addRowcontacts2customer = function(){

	var addrow=[];
														addrow.push('');
																							//{ass.otherEnd.name}=customer
					addrow.push([false,mainID]);
											addrow.splice(0,0,false,0);
	gridcontacts2customer.addRow(addrow,gridcontacts2customer.model.getRowCount());
} 

function removecontacts2customer(){
       var s= new Array();
       var sall=gridcontacts2customer.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            deletedatacontacts2customer.splice(deletedatacontacts2customer.length,0,thisCell[1]);
       }}}
       gridcontacts2customer.model.remove(s);//grid.removeSelectedRows();
 }
function call_funUpdcontacts2customer() {
       var sall=gridcontacts2customer.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];
              if(dojox.validate.isText(thisCell[2], {minlength: 1})){vobject.codeContact=thisCell[2];
             }else{gridcontacts2customer.getCell(gridcontacts2customer.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 

								var manageable=new Object();
			 if(querydatacontacts2customer[i][3]!=''&&querydatacontacts2customer[i][3]!=undefined){
             manageable.id=querydatacontacts2customer[i][3][1];
             vobject.customer=manageable;
			 }else{
			 gridcontacts2customer.getCell(gridcontacts2customer.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
						


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('ContactVO',vobject);
                SOAPClient.invoke(urlcontacts2customer, "createContact", padd, false,  function GetEnu_callBack(ul, soapResponse){
                gridcontacts2customer.model.setDatum(ul,i,1);
				});
	         }else{//modify row
                padd.add('ContactVO',vobject);
                SOAPClient.invoke(urlcontacts2customer, "updateContact", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
        } }}//for
//submit delete
          for(var i=0;i<deletedatacontacts2customer.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedatacontacts2customer[i]);
               SOAPClient.invoke(urlcontacts2customer, "deleteContact", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          deletedatacontacts2customer=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
 } 
 
	function selectCustomerFun(rep){
		querydatacontacts2customer[dojoContact.selectCustomerInRow][dojoContact.noCustomer]=rep;
		gridcontacts2customer.updateRow(dojoContact.selectCustomerInRow);	
			
	}

function pageSizeChangecontacts2customer(mylabel){
	pagesizecontacts2customer=mylabel;
	getVOcontacts2customer(queryvocontacts2customer);
}

function allpagecontacts2customer(){
	pagesizecontacts2customer=0;
	getVOcontacts2customer(queryvocontacts2customer);
}

function upPagecontacts2customer(){
	pagenumbercontacts2customer--;
	getVOcontacts2customer(queryvocontacts2customer);
}
function downPagecontacts2customer(){
	pagenumbercontacts2customer++;
	getVOcontacts2customer(queryvocontacts2customer);
}

