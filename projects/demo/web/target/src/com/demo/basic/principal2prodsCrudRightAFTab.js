	  	  //±¾Ä£°åµÄÔª±íÊÇ4.1µÄÔª±í£¬---begin---------ÅÐ¶Ï"¼ýÎ²±í/ÒýÓÃ±í"£¨"Ôª±í"Îª"¼ýÍ·±í"/"±»ÒýÓÃ±í"£©ÊÇ·ñÎª¶à¶Ô¶àµÄ¹ØÏµ±í
											//---begin---------ÅÐ¶ÏÊÇ·ñÖ±½Ó¹ØÁªÁËtree½á¹¹±ísno,¼´"ÒýÓÃ±í"ÎªÊ÷±í
						//ÅÐ¶Ï"ÒýÓÃ±í"ÊÇ·ñÊÇÖ÷±íbegin
		//ÅÐ¶Ï"ÒýÓÃ±í"ÊÇ·ñÊÇ×Ó±íbegin
//ÅÐ¶Ï"ÒýÓÃ±í"ÊÇ·ñÊÇ×Ó±íend
//ÒÔÏÂÊÇ"ÒýÓÃ±í"ÊÇÆÕÍ¨±í
//set (= principal2prods)
	//name =principal2prodsCrudRightAFTab.js  manageable.name=Prod
												  var NUprincipal2prods = false;//needUpdate
  var urlprincipal2prods = getUrl()+ "services/ProdManageService";
  var deletedataprincipal2prods =  new Array();
  var querydataprincipal2prods =  new Array();
  var pagenumberprincipal2prods=1;
  var totalCountprincipal2prods=0;
  var pagesizeprincipal2prods=10;
  var orderByprincipal2prods='0';
  var queryvoprincipal2prods=new Object();
  var oddstyle='';
  var modelprincipal2prods = new dojox.grid.data.Table(null, querydataprincipal2prods);
  var gridprincipal2prods;
  var urle2 = getUrl()+ "services/BasicManageService";   

/*						  */


  
  
var getVOprincipal2prods=function(queryvo){

	var pu = new SOAPClientParameters2();
	pu.add('ProdVO',queryvo) ;
	pu.add('pageNumber',pagenumberprincipal2prods) ;
	pu.add('pageSize',pagesizeprincipal2prods) ;
	pu.add('orderBy',orderByprincipal2prods) ;
	SOAPClient.invoke(urlprincipal2prods,"getProd", pu, false,  function GetEnu_callBack(ul, soapResponse){     
//ÅÐ¶Ï±¾±íÊÇ·ñÎª×Ó±í,µ±Ò»¸ö±íÊÇ¶à¸ö±íµÄ×Ó±íÊ±£¬´Ë´¦¿ÉÄÜÓÐ´íÎó¡£	
	querydataprincipal2prods=dojoProd.ProdVOtoArray_fun(ul,true);
	totalCountprincipal2prods=ul[ul.length-1]["ns:id"]; 
	}); 
	var totalpage=Math.ceil(new Number(totalCountprincipal2prods)/pagesizeprincipal2prods);
	
	if(totalpage>1){
		if(pagenumberprincipal2prods==1){
			dijit.byId("but6principal2prods").setDisabled(true);
			dijit.byId("but7principal2prods").setDisabled(false);
		}else if(pagenumberprincipal2prods==totalpage){
			dijit.byId("but6principal2prods").setDisabled(false);
			dijit.byId("but7principal2prods").setDisabled(true);
		}else{
			dijit.byId("but6principal2prods").setDisabled(false);
			dijit.byId("but7principal2prods").setDisabled(false);
		}
	}else{
		dijit.byId("but6principal2prods").setDisabled(true);
		dijit.byId("but7principal2prods").setDisabled(true);
	
	}
	if(pagesizeprincipal2prods==0){
		totalpage=1;
		dijit.byId("but6principal2prods").setDisabled(true);
		dijit.byId("but7principal2prods").setDisabled(true);
	}
	if(totalpage==1)pagenumberprincipal2prods=1;
	
	 document.getElementById("rowCountprincipal2prods").innerHTML=i18nStr.di+" "+pagenumberprincipal2prods+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountprincipal2prods+" "+i18nStr.rowSize; 	

	querydataprincipal2prods.splice(querydataprincipal2prods.length-1,1);
	modelprincipal2prods.setData(querydataprincipal2prods);
}

var buildprincipal2prods=function(){
	if(NUprincipal2prods && mainID!=undefined && mainID!=''){
		var queryFloatPeoples=new Object();
		queryFloatPeoples.id=mainID;
		queryvoprincipal2prods.principal=queryFloatPeoples;
		getVOprincipal2prods(queryvoprincipal2prods);
		if(dijit.byId("gridprincipal2prods")==undefined){
			  gridprincipal2prods = new dojox.Grid({
						title: "",
						id: "gridprincipal2prods",
						jsId: "gridprincipal2prods",
						structure: layoutprincipal2prods,
						rowCount:querydataprincipal2prods.length,
						model:modelprincipal2prods
					}, dojo.byId("gridprincipal2prods"));
				gridprincipal2prods.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100}); 
				
		}else{
			gridprincipal2prods.updateRowCount(querydataprincipal2prods.length); 
		}
		NUprincipal2prods=false;
	}

}

																								var layoutprincipal2prods=[{
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
												,   {name: i18nStr.prodCust,field: 8,get:function(inRowIndex){ var str='';var strid;if(querydataprincipal2prods[inRowIndex]!=undefined && querydataprincipal2prods[inRowIndex][8]!=undefined && querydataprincipal2prods[inRowIndex][8][2]!=undefined){str=querydataprincipal2prods[inRowIndex][8][2];strid=querydataprincipal2prods[inRowIndex][8][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="dojoProd.selectCustomer('+strid+','+inRowIndex+',8,0,event);"   >';} ,width: 10 }
						//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
												//,   {name: i18nStr.principal,field: 9,get:function(inRowIndex){ var str='';var strid;if(querydataprincipal2prods[inRowIndex]!=undefined && querydataprincipal2prods[inRowIndex][9]!=undefined && querydataprincipal2prods[inRowIndex][9][2]!=undefined){str=querydataprincipal2prods[inRowIndex][9][2];strid=querydataprincipal2prods[inRowIndex][9][1];} return str;} ,width: 10 }
						                                        ] ]
                           }]; 

//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
						//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
						
			   
						   
var addRowprincipal2prods = function(){

	var addrow=[];
														addrow.push('');
																					addrow.push('');
																					addrow.push('');
																					addrow.push('');
					addrow.push('');
																					addrow.push('');
																												addrow.push([]);
																//{ass.otherEnd.name}=principal
					addrow.push([false,mainID]);
											addrow.splice(0,0,false,0);
	gridprincipal2prods.addRow(addrow,gridprincipal2prods.model.getRowCount());
} 

function removeprincipal2prods(){
       var s= new Array();
       var sall=gridprincipal2prods.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            deletedataprincipal2prods.splice(deletedataprincipal2prods.length,0,thisCell[1]);
       }}}
       gridprincipal2prods.model.remove(s);//grid.removeSelectedRows();
 }
function call_funUpdprincipal2prods() {
       var sall=gridprincipal2prods.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];
              if(dojox.validate.isText(thisCell[2], {minlength: 1})){vobject.prodName=thisCell[2];
             }else{gridprincipal2prods.getCell(gridprincipal2prods.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
               vobject.code=thisCell[3];
 
             if(dojox.validate.isInRange(thisCell[4],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[4];vobject.price=n;
             }else{gridprincipal2prods.getCell(gridprincipal2prods.model.fieldArray[4]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

var  d=new DateTimeQuery();
             if(thisCell[5] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[5], gridprincipal2prods.getCell(gridprincipal2prods.model.fieldArray[5]).constraint);
             }else{gridprincipal2prods.getCell(gridprincipal2prods.model.fieldArray[5]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[6] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[6], gridprincipal2prods.getCell(gridprincipal2prods.model.fieldArray[6]).constraint);
             vobject.datef=d;
             }else{gridprincipal2prods.getCell(gridprincipal2prods.model.fieldArray[6]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null
 

               vobject.prodType=thisCell[7];
 

								var manageable=new Object();
			 if(querydataprincipal2prods[i][8]!=''&&querydataprincipal2prods[i][8]!=undefined){
             manageable.id=querydataprincipal2prods[i][8][1];
             vobject.prodCust=manageable;
			 }else{
			 gridprincipal2prods.getCell(gridprincipal2prods.model.fieldArray[8]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
														var manageable=new Object();
			 if(querydataprincipal2prods[i][9]!=''&&querydataprincipal2prods[i][9]!=undefined){
             manageable.id=querydataprincipal2prods[i][9][1];
             vobject.principal=manageable;
			 }else{
			 gridprincipal2prods.getCell(gridprincipal2prods.model.fieldArray[9]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
						


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('ProdVO',vobject);
                SOAPClient.invoke(urlprincipal2prods, "createProd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                gridprincipal2prods.model.setDatum(ul,i,1);
				});
	         }else{//modify row
                padd.add('ProdVO',vobject);
                SOAPClient.invoke(urlprincipal2prods, "updateProd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
        } }}//for
//submit delete
          for(var i=0;i<deletedataprincipal2prods.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedataprincipal2prods[i]);
               SOAPClient.invoke(urlprincipal2prods, "deleteProd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          deletedataprincipal2prods=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
 } 
 
	function selectCustomerFun(rep){
		querydataprincipal2prods[dojoProd.selectCustomerInRow][dojoProd.noCustomer]=rep;
		gridprincipal2prods.updateRow(dojoProd.selectCustomerInRow);	
			
	}
	function selectPeoplesFun(rep){
		querydataprincipal2prods[dojoProd.selectPeoplesInRow][dojoProd.noPeoples]=rep;
		gridprincipal2prods.updateRow(dojoProd.selectPeoplesInRow);	
			
	}

function pageSizeChangeprincipal2prods(mylabel){
	pagesizeprincipal2prods=mylabel;
	getVOprincipal2prods(queryvoprincipal2prods);
}

function allpageprincipal2prods(){
	pagesizeprincipal2prods=0;
	getVOprincipal2prods(queryvoprincipal2prods);
}

function upPageprincipal2prods(){
	pagenumberprincipal2prods--;
	getVOprincipal2prods(queryvoprincipal2prods);
}
function downPageprincipal2prods(){
	pagenumberprincipal2prods++;
	getVOprincipal2prods(queryvoprincipal2prods);
}

