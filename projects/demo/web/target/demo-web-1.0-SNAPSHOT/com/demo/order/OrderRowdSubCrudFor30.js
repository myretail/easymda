//{member.type.name}SubCrud.js=={manageable.name}SubCrudFor30.js
//»ñµÃÖ÷±íÀàÐÍvar mainTable=new VO();

var addRowSub = function(addindex){
	  var subGrid = dijit.byId(makeSubGridIdGeneral('',querydataOrderd[addindex][1],"OrderdChild"));
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
											
				if(ifMultPaneorderRowds2product!=undefined){
					var re=selectorderRowds2productFunClick();
					addrow.push(re);}
						addrow.splice(0,0,false,0);
	
	  subGrid.addRow(addrow,subGrid.model.getRowCount());
}


var deleteSub= function(mainRow,subIndexRow,subId){
	var subGrid = dijit.byId(makeSubGridIdGeneral('',querydataOrderd[mainRow][1],"OrderdChild"));
	var s= new Array();
	s[0]=subIndexRow;
	if(subId!=0){
		var pdel = new SOAPClientParameters();      
	    pdel.add('id',subId);
	    SOAPClient.invoke(urlOrderd, "deleteOrderRowd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	});}
	subGrid.model.remove(s);
 }

function saveSubRow(subGrid,thisCell,i){		 
         var vobject=new Object();
		 var passAll=0;
         var padd = new SOAPClientParameters2();
	     vobject.id=thisCell[1];
             if(dojox.validate.isInRange(thisCell[2],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[2];vobject.productNum=n;
             }else{subGrid.getCell(subGrid.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[3],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[3];vobject.unitNum=n;
             }else{subGrid.getCell(subGrid.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[4],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[4];vobject.goodsSuttle=n;
             }else{subGrid.getCell(subGrid.model.fieldArray[4]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[5],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[5];vobject.goodsWeight=n;
             }else{subGrid.getCell(subGrid.model.fieldArray[5]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[6],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[6];vobject.goodsVolume=n;
             }else{subGrid.getCell(subGrid.model.fieldArray[6]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

               vobject.label=thisCell[7];
 
             if(dojox.validate.isInRange(thisCell[8],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[8];vobject.carriage=n;
             }else{subGrid.getCell(subGrid.model.fieldArray[8]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

               vobject.especial=thisCell[9];
 
               vobject.goodsState=thisCell[10];
 
               vobject.remark=thisCell[11];
 

																var mainTable=new Object();
			mainTable.id=querydataOrderd[subGrid.dataRow][1];
            vobject.order=mainTable;
																var manageable=new Object();
			 if(querydataOrderd[subGrid.dataRow][childRow][i]!=''&&querydataOrderd[subGrid.dataRow][childRow][i][13]!=undefined){
				manageable.id=querydataOrderd[subGrid.dataRow][childRow][i][13][1];
				vobject.product=manageable;
			 }else{
			 subGrid.getCell(subGrid.model.fieldArray[13]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
			


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('OrderRowdVO',vobject);
                SOAPClient.invoke(urlOrderRowd, "createOrderRowd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                subGrid.model.setDatum(ul,i,1);
				
                });
	         }else{//modify row
                padd.add('OrderRowdVO',vobject);
                SOAPClient.invoke(urlOrderRowd, "updateOrderRowd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
			 //querydataOrderd[document.getElementById('erowIndexOrderRowd').value][childRow]=querydataSub;//????????????????????????????????????????????????????????????????????????????/
        } }
		
function call_funUpdGridSub(mainRow,subIndexRow) {
var subGrid = dijit.byId(makeSubGridIdGeneral('',querydataOrderd[mainRow][1],"OrderdChild"));
	if(subGrid){
	
	var sall=subGrid.model.data;
	if(subIndexRow==undefined && subIndexRow==''){
		for(var i=0;i<sall.length;i++){
         var thisCell=sall[i];
         saveSubRow(subGrid,thisCell,i);
		}//for
	}else{
		 var thisCell=sall[subIndexRow];
		saveSubRow(subGrid,thisCell,subIndexRow);
	}}
}		  

var urlOrderRowd = getUrl()+ "services/OrderRowdManageService";
//var deletedataOrderRowd =  new Array();
//var querydataOrderRowd =  new Array();
var deletedataSub =  new Array();
//var querydataSub=  new Array();
var pagenumberOrderRowd=1;
var pagesizeOrderRowd=10;
var orderByOrderRowd='0';
var queryvoOrderRowd=new Object();
var oddstyle='';
//var modelChildAdd = new dojox.grid.data.Table(null, querydataSub);
var childLayout;
var childLayoutOdd;

function buildChildLayout(pre,mystyle,addRowIndex){
	var myLayout=[{
          
                 //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydataÖÐÈ¡Êý¾Ý
                       
 cells: [ [
			{ name: '<img src="../image/addsmall.gif" onclick="addRowSub('+addRowIndex +');"   height="18" width="18" border="0">' ,get:function(inRowIndex) {return '<img src="../image/delsmall.gif" onclick="deleteSub('+addRowIndex +','+inRowIndex+','+(querydataOrderd[addRowIndex][childRow]!=undefined ? 0:querydataOrderd[addRowIndex][childRow][inRowIndex][1])+');"  height="18" width="18" border="0">&nbsp;&nbsp;&nbsp;<img src="../image/savesmall.gif" onclick="call_funUpdGridSub('+addRowIndex +','+inRowIndex+');"  height="18" width="18" border="0">';}, width: 6,styles: 'text-align: center;',headerStyles:mystyle},//
			{ name: pre+i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool,headerStyles:mystyle },//
		    { name: pre+i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} ,headerStyles:mystyle},//
            {name: pre+i18nStr.productNum,field:2, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 },headerStyles:mystyle }
		             ,  {name: pre+i18nStr.unitNum,field:3, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 },headerStyles:mystyle }
		             ,  {name: pre+i18nStr.goodsSuttle,field:4, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 },headerStyles:mystyle }
		             ,  {name: pre+i18nStr.goodsWeight,field:5, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 },headerStyles:mystyle }
		             ,  {name: pre+i18nStr.goodsVolume,field:6, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 },headerStyles:mystyle }
		        					,   {name: pre+i18nStr.label, field: 7,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30,headerStyles:mystyle}
					                 ,  {name: pre+i18nStr.carriage,field:8, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 },headerStyles:mystyle }
		        					,   {name: pre+i18nStr.especial, field: 9,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30,headerStyles:mystyle}
					            					,   {name: pre+i18nStr.goodsState, field: 10,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30,headerStyles:mystyle}
					            				    ,   {name: pre+i18nStr.remark, field: 11,width: 20, editor: dojox.grid.editors.Editor, editorToolbar: true  ,headerStyles:mystyle}
					      
//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
				//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
							 ,   {name: pre+i18nStr.product,field: 13,get:function(inRowIndex){ var str='';var strid;if(querydataOrderd[addRowIndex][childRow][inRowIndex]!=undefined && querydataOrderd[addRowIndex][childRow][inRowIndex][13]!=undefined){str=querydataOrderd[addRowIndex][childRow][inRowIndex][13][2];strid=querydataOrderd[addRowIndex][childRow][inRowIndex][13][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoOrderd.selectProd('+strid+','+inRowIndex+',13,0,event,'+addRowIndex+');"   >';} ,width: 10 ,headerStyles:mystyle}
			                                        ] ]
                           }];  
						   
			return myLayout;			   
}

				function selectProdFun(rep){
			querydataOrderd[dojoOrderd.mainRowIndexProd][childRow][dojoOrderd.selectProdInRow][dojoOrderd.noProd]=rep;
			var subGrid = dijit.byId(makeSubGridIdGeneral('',querydataOrderd[dojoOrderd.mainRowIndexProd][1],"OrderdChild"));
			subGrid.model.setDatum(rep,dojoOrderd.selectProdInRow,dojoOrderd.noProd);	
		}
	
