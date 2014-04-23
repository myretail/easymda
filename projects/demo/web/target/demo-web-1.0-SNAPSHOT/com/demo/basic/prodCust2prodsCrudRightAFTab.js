	  //±¾Ä£°åµÄÔª±íÊÇ4.1µÄÔª±í£¬---begin---------ÅÐ¶Ï"¼ýÎ²±í/ÒýÓÃ±í"£¨"Ôª±í"Îª"¼ýÍ·±í"/"±»ÒýÓÃ±í"£©ÊÇ·ñÎª¶à¶Ô¶àµÄ¹ØÏµ±í
											//---begin---------ÅÐ¶ÏÊÇ·ñÖ±½Ó¹ØÁªÁËtree½á¹¹±ísno,¼´"ÒýÓÃ±í"ÎªÊ÷±í
						//ÅÐ¶Ï"ÒýÓÃ±í"ÊÇ·ñÊÇÖ÷±íbegin
		//ÅÐ¶Ï"ÒýÓÃ±í"ÊÇ·ñÊÇ×Ó±íbegin
//ÅÐ¶Ï"ÒýÓÃ±í"ÊÇ·ñÊÇ×Ó±íend
//ÒÔÏÂÊÇ"ÒýÓÃ±í"ÊÇÆÕÍ¨±í
//set (= prodCust2prods)
	//name =prodCust2prodsCrudRightAFTab.js  manageable.name=Prod
												  var NUprodCust2prods = false;//needUpdate
  var urlprodCust2prods = getUrl()+ "services/ProdManageService";
  var deletedataprodCust2prods =  new Array();
  var querydataprodCust2prods =  new Array();
  var pagenumberprodCust2prods=1;
  var totalCountprodCust2prods=0;
  var pagesizeprodCust2prods=10;
  var orderByprodCust2prods='0';
  var queryvoprodCust2prods=new Object();
  var oddstyle='';
  var modelprodCust2prods = new dojox.grid.data.Table(null, querydataprodCust2prods);
  var gridprodCust2prods;
  var urle2 = getUrl()+ "services/BasicManageService";   

/*						  */


  
  
var getVOprodCust2prods=function(queryvo){

	var pu = new SOAPClientParameters2();
	pu.add('ProdVO',queryvo) ;
	pu.add('pageNumber',pagenumberprodCust2prods) ;
	pu.add('pageSize',pagesizeprodCust2prods) ;
	pu.add('orderBy',orderByprodCust2prods) ;
	SOAPClient.invoke(urlprodCust2prods,"getProd", pu, false,  function GetEnu_callBack(ul, soapResponse){     
//ÅÐ¶Ï±¾±íÊÇ·ñÎª×Ó±í,µ±Ò»¸ö±íÊÇ¶à¸ö±íµÄ×Ó±íÊ±£¬´Ë´¦¿ÉÄÜÓÐ´íÎó¡£	
	querydataprodCust2prods=dojoProd.ProdVOtoArray_fun(ul,true);
	totalCountprodCust2prods=ul[ul.length-1]["ns:id"]; 
	}); 
	var totalpage=Math.ceil(new Number(totalCountprodCust2prods)/pagesizeprodCust2prods);
	
	if(totalpage>1){
		if(pagenumberprodCust2prods==1){
			dijit.byId("but6prodCust2prods").setDisabled(true);
			dijit.byId("but7prodCust2prods").setDisabled(false);
		}else if(pagenumberprodCust2prods==totalpage){
			dijit.byId("but6prodCust2prods").setDisabled(false);
			dijit.byId("but7prodCust2prods").setDisabled(true);
		}else{
			dijit.byId("but6prodCust2prods").setDisabled(false);
			dijit.byId("but7prodCust2prods").setDisabled(false);
		}
	}else{
		dijit.byId("but6prodCust2prods").setDisabled(true);
		dijit.byId("but7prodCust2prods").setDisabled(true);
	
	}
	if(pagesizeprodCust2prods==0){
		totalpage=1;
		dijit.byId("but6prodCust2prods").setDisabled(true);
		dijit.byId("but7prodCust2prods").setDisabled(true);
	}
	if(totalpage==1)pagenumberprodCust2prods=1;
	
	 document.getElementById("rowCountprodCust2prods").innerHTML=i18nStr.di+" "+pagenumberprodCust2prods+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountprodCust2prods+" "+i18nStr.rowSize; 	

	querydataprodCust2prods.splice(querydataprodCust2prods.length-1,1);
	modelprodCust2prods.setData(querydataprodCust2prods);
}

var buildprodCust2prods=function(){
	if(NUprodCust2prods && mainID!=undefined && mainID!=''){
		var queryFloatCustomer=new Object();
		queryFloatCustomer.id=mainID;
		queryvoprodCust2prods.prodCust=queryFloatCustomer;
		getVOprodCust2prods(queryvoprodCust2prods);
		if(dijit.byId("gridprodCust2prods")==undefined){
			  gridprodCust2prods = new dojox.Grid({
						title: "",
						id: "gridprodCust2prods",
						jsId: "gridprodCust2prods",
						structure: layoutprodCust2prods,
						rowCount:querydataprodCust2prods.length,
						model:modelprodCust2prods
					}, dojo.byId("gridprodCust2prods"));
				gridprodCust2prods.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100}); 
				
		}else{
			gridprodCust2prods.updateRowCount(querydataprodCust2prods.length); 
		}
		NUprodCust2prods=false;
	}

}

																								var layoutprodCust2prods=[{
           //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydateÖÐÈ¡Êý¾Ý
   
			 cells: [ [
					   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
     					  {name: i18nStr.prodName, field: 2,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
					           					,   {name: i18nStr.code, field: 3,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					                 ,  {name: i18nStr.price,field:4, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		    		,   {name: i18nStr.datef,field:5, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
				,   {name: i18nStr.datefTime,field:6, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
		       					,   {name: i18nStr.prodType, field: 7,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					      


//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
												//,   {name: i18nStr.prodCust,field: 8,get:function(inRowIndex){ var str='';var strid;if(querydataprodCust2prods[inRowIndex]!=undefined && querydataprodCust2prods[inRowIndex][8]!=undefined && querydataprodCust2prods[inRowIndex][8][2]!=undefined){str=querydataprodCust2prods[inRowIndex][8][2];strid=querydataprodCust2prods[inRowIndex][8][1];} return str;} ,width: 10 }
						//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
												,   {name: i18nStr.principal,field: 9,get:function(inRowIndex){ var str='';var strid;if(querydataprodCust2prods[inRowIndex]!=undefined && querydataprodCust2prods[inRowIndex][9]!=undefined && querydataprodCust2prods[inRowIndex][9][2]!=undefined){str=querydataprodCust2prods[inRowIndex][9][2];strid=querydataprodCust2prods[inRowIndex][9][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="dojoProd.selectPeoples('+strid+','+inRowIndex+',9,0,event);"   >';} ,width: 10 }
						                                        ] ]
                           }]; 

//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
						//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
						
			   
						   
var addRowprodCust2prods = function(){

	var addrow=[];
														addrow.push('');
																					addrow.push('');
																					addrow.push('');
																					addrow.push('');
					addrow.push('');
																					addrow.push('');
																							//{ass.otherEnd.name}=prodCust
					addrow.push([false,mainID]);
																					addrow.push([]);
											addrow.splice(0,0,false,0);
	gridprodCust2prods.addRow(addrow,gridprodCust2prods.model.getRowCount());
} 

function removeprodCust2prods(){
       var s= new Array();
       var sall=gridprodCust2prods.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            deletedataprodCust2prods.splice(deletedataprodCust2prods.length,0,thisCell[1]);
       }}}
       gridprodCust2prods.model.remove(s);//grid.removeSelectedRows();
 }
function call_funUpdprodCust2prods() {
       var sall=gridprodCust2prods.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];
              if(dojox.validate.isText(thisCell[2], {minlength: 1})){vobject.prodName=thisCell[2];
             }else{gridprodCust2prods.getCell(gridprodCust2prods.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
               vobject.code=thisCell[3];
 
             if(dojox.validate.isInRange(thisCell[4],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[4];vobject.price=n;
             }else{gridprodCust2prods.getCell(gridprodCust2prods.model.fieldArray[4]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

var  d=new DateTimeQuery();
             if(thisCell[5] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[5], gridprodCust2prods.getCell(gridprodCust2prods.model.fieldArray[5]).constraint);
             }else{gridprodCust2prods.getCell(gridprodCust2prods.model.fieldArray[5]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[6] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[6], gridprodCust2prods.getCell(gridprodCust2prods.model.fieldArray[6]).constraint);
             vobject.datef=d;
             }else{gridprodCust2prods.getCell(gridprodCust2prods.model.fieldArray[6]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null
 

               vobject.prodType=thisCell[7];
 

								var manageable=new Object();
			 if(querydataprodCust2prods[i][8]!=''&&querydataprodCust2prods[i][8]!=undefined){
             manageable.id=querydataprodCust2prods[i][8][1];
             vobject.prodCust=manageable;
			 }else{
			 gridprodCust2prods.getCell(gridprodCust2prods.model.fieldArray[8]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
														var manageable=new Object();
			 if(querydataprodCust2prods[i][9]!=''&&querydataprodCust2prods[i][9]!=undefined){
             manageable.id=querydataprodCust2prods[i][9][1];
             vobject.principal=manageable;
			 }else{
			 gridprodCust2prods.getCell(gridprodCust2prods.model.fieldArray[9]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
						


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('ProdVO',vobject);
                SOAPClient.invoke(urlprodCust2prods, "createProd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                gridprodCust2prods.model.setDatum(ul,i,1);
				});
	         }else{//modify row
                padd.add('ProdVO',vobject);
                SOAPClient.invoke(urlprodCust2prods, "updateProd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
        } }}//for
//submit delete
          for(var i=0;i<deletedataprodCust2prods.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedataprodCust2prods[i]);
               SOAPClient.invoke(urlprodCust2prods, "deleteProd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          deletedataprodCust2prods=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
 } 
 
	function selectCustomerFun(rep){
		querydataprodCust2prods[dojoProd.selectCustomerInRow][dojoProd.noCustomer]=rep;
		gridprodCust2prods.updateRow(dojoProd.selectCustomerInRow);	
			
	}
	function selectPeoplesFun(rep){
		querydataprodCust2prods[dojoProd.selectPeoplesInRow][dojoProd.noPeoples]=rep;
		gridprodCust2prods.updateRow(dojoProd.selectPeoplesInRow);	
			
	}

function pageSizeChangeprodCust2prods(mylabel){
	pagesizeprodCust2prods=mylabel;
	getVOprodCust2prods(queryvoprodCust2prods);
}

function allpageprodCust2prods(){
	pagesizeprodCust2prods=0;
	getVOprodCust2prods(queryvoprodCust2prods);
}

function upPageprodCust2prods(){
	pagenumberprodCust2prods--;
	getVOprodCust2prods(queryvoprodCust2prods);
}
function downPageprodCust2prods(){
	pagenumberprodCust2prods++;
	getVOprodCust2prods(queryvoprodCust2prods);
}

	  