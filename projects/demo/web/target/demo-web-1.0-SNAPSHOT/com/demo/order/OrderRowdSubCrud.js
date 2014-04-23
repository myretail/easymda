//${member.type.name}SubCrud.js==OrderRowdSubCrud.js
//»ñµÃÖ÷±íÀàÐÍvar mainTable=new VO();

/*var urle2 = getUrl()+ "services/BasicManageService";   
											*/




var deleteSub= function(){
	   var s= new Array();
   var sall=gridSub.model.data;
   for(var i=0;i<sall.length;i++){
   if(sall[i][0]==true){
	  s.push(i);
	  var thisCell=sall[i];
	  if(thisCell[1]!=0){//the row which will be deleted
		deletedataSub.splice(deletedataSub.length,0,thisCell[1]);
   }}}
   gridSub.model.remove(s);
 }
function call_funUpdGridSub() {
var sall=gridSub.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];
             if(dojox.validate.isInRange(thisCell[2],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[2];vobject.productNum=n;
             }else{gridSub.getCell(gridSub.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[3],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[3];vobject.unitNum=n;
             }else{gridSub.getCell(gridSub.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[4],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[4];vobject.goodsSuttle=n;
             }else{gridSub.getCell(gridSub.model.fieldArray[4]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[5],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[5];vobject.goodsWeight=n;
             }else{gridSub.getCell(gridSub.model.fieldArray[5]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[6],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[6];vobject.goodsVolume=n;
             }else{gridSub.getCell(gridSub.model.fieldArray[6]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

               vobject.label=thisCell[7];
 
             if(dojox.validate.isInRange(thisCell[8],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[8];vobject.carriage=n;
             }else{gridSub.getCell(gridSub.model.fieldArray[8]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

               vobject.especial=thisCell[9];
 
               vobject.goodsState=thisCell[10];
 
               vobject.remark=thisCell[11];
 
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11
/*var mainTable=new OrderdVOJs();
				 mainTable.id=document.getElementById('OrderdId').value;
             vobject.contract=mainTable;*/
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11
																var mainTable=new Object();
			mainTable.id=document.getElementById('OrderdId').value;
            vobject.order=mainTable;
																var manageable=new Object();
			 if(querydataSub[i][13]!=''&&querydataSub[i][13]!=undefined){
             manageable.id=querydataSub[i][13][1];
             vobject.product=manageable;
			 }else{
			 gridSub.getCell(gridSub.model.fieldArray[13]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
			


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('OrderRowdVO',vobject);
                SOAPClient.invoke(urlOrderd, "createOrderRowd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                gridSub.model.setDatum(ul,i,1);
                });
	         }else{//modify row
                padd.add('OrderRowdVO',vobject);
                SOAPClient.invoke(urlOrderd, "updateOrderRowd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
			 querydataOrderd[document.getElementById('erowIndexOrderd').value][subInt]=querydataSub;//????????????????????????????????????????????????????????????????????????????/
        } }}//for
//submit delete
          for(var i=0;i<deletedataSub.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedataSub[i]);
               SOAPClient.invoke(urlOrderd, "deleteOrderRowd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          deletedataSub=new Array();
}		  

var addRowSub = function(){
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
																							addrow.push([]);
												addrow.push([]);
						addrow.splice(0,0,false,0);
	  gridSub.addRow(addrow,gridSub.model.getRowCount());
	  if(querydataSub.length==0){
		querydataSub=[addrow];
	  }
	  //var t=new Array(14);
	  //querydataSub.push(t);
}

//var urlOrderRowd = getUrl()+ "services/OrderdManageService";
//var deletedataOrderRowd =  new Array();
var querydataOrderRowd =  new Array();
var deletedataSub =  new Array();
var querydataSub=  new Array();
var pagenumberOrderRowd=1;
var pagesizeOrderRowd=10;
var orderByOrderRowd='0';
var queryvoOrderRowd=new Object();
var oddstyle='';
var modelChildAdd = new dojox.grid.data.Table(null, querydataSub);
var childLayout;
var childLayoutOdd;
function buildChildLayout(pre,mystyle){
	var myLayout=[{  
				//noscroll: true,
				cells: [//ÓÅ»¯Ê±¿É¼ÓÈë£ºÈç¹ý¼ÇÂ¼Êý³¬¹ý12£¬¼´±äÎªÁ½ÐÐ
                      [
				  				  {name: pre+i18nStr.productNum,field:2, width: 8,headerStyles:mystyle}
						  						  				 ,  {name: pre+i18nStr.unitNum,field:3, width: 8,headerStyles:mystyle}
						  						  				 ,  {name: pre+i18nStr.goodsSuttle,field:4, width: 8,headerStyles:mystyle}
						  						  				 ,  {name: pre+i18nStr.goodsWeight,field:5, width: 8,headerStyles:mystyle}
						  						  				 ,  {name: pre+i18nStr.goodsVolume,field:6, width: 8,headerStyles:mystyle}
						  						  				,   {name: pre+i18nStr.label, field: 7,width: 10,headerStyles:mystyle}
						  						  				 ,  {name: pre+i18nStr.carriage,field:8, width: 8,headerStyles:mystyle}
						  						  				,   {name: pre+i18nStr.especial, field: 9,width: 10,headerStyles:mystyle}
						  						  				,   {name: pre+i18nStr.goodsState, field: 10,width: 10,headerStyles:mystyle}
						  						  				,   {name: pre+i18nStr.remark, field: 11,width: 10,headerStyles:mystyle}
						  				
//?????????????????????????????????????????????????/´ÓmanageableAssociationEndsÖÐÏÈÈ¥µôfalseÎªtrue£»ÔÙÈ¥³ýÖ÷±í£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡
				//?????????????????????????????????????????????????/´ÓmanageableAssociationEndsÖÐÏÈÈ¥µôfalseÎªtrue£»ÔÙÈ¥³ýÖ÷±í£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡
					
				,   {name: pre+i18nStr.product,field: 13,get:function(inRowIndex){ var str='';if(querydataSub[inRowIndex]!=undefined && querydataSub[inRowIndex][13]!=undefined){str=querydataSub[inRowIndex][13][2];} return str;} ,width: 10,headerStyles:mystyle }
						     
					]]}];	 
					return myLayout; 
}
childLayout=buildChildLayout(pre,headerstyle);
childLayoutOdd=buildChildLayout(pre,headerstyleodd);	
			
var childAddLayout=[{
          
                 //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydateÖÐÈ¡Êý¾Ý
                       
                                 cells: [ [
                                            //{name: 'Ñ¡Ôñ', width: 3, get:getChoise},
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
					 ,   {name: i18nStr.product,field: 13,get:function(inRowIndex){ var str='';var strid;if(querydataSub[inRowIndex]!=undefined && querydataSub[inRowIndex][13]!=undefined && querydataSub[inRowIndex][13][2]!=undefined ){str=querydataSub[inRowIndex][13][2];strid=querydataSub[inRowIndex][13][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoOrderd.selectProd('+strid+','+inRowIndex+',13,0,event);"   >';} ,width: 10 }
			                                        ] ]
                           }]; 

//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
	//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
					var dojoProdSelect;	
		function selectOrderdFun(rep){
		querydataSub[dojoOrderd.selectOrderdInRow][dojoOrderd.noOrderd]=rep;
		gridSub.updateRow(dojoOrderd.selectOrderdInRow);		
	}
	function selectProdFun(rep){
		querydataSub[dojoOrderd.selectProdInRow][dojoOrderd.noProd]=rep;
		gridSub.updateRow(dojoOrderd.selectProdInRow);		
	}
