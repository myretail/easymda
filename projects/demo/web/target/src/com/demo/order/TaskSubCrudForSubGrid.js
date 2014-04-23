
//${member.type.name}SubCrudForSubGrid.js==TaskSubCrudForSubGrid.js
//»ñµÃÖ÷±íÀàÐÍvar mainTable=new VO();

var addRowSub = function(addindex){
	  var subGrid = dijit.byId(makeSubGridIdGeneral('',querydataTaskForm[addindex][1],"TaskFormChild"));
	  subGrid.addRow([false,0,"","","","","","","","","","","","","","","","","",""],subGrid.model.getRowCount());
}


var deleteSub= function(mainRow,subIndexRow,subId){
	var subGrid = dijit.byId(makeSubGridIdGeneral('',querydataTaskForm[mainRow][1],"TaskFormChild"));
	var s= new Array();
	s[0]=subIndexRow;
	if(subId!=0){
		var pdel = new SOAPClientParameters();      
	    pdel.add('id',subId);
	    SOAPClient.invoke(urlTaskForm, "deleteTask", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	});}
	subGrid.model.remove(s);
 }

function saveSubRow(subGrid,thisCell,i){		 
         var vobject=new Object();
		 var passAll=0;
         var padd = new SOAPClientParameters2();
	     vobject.id=thisCell[1];
             if(dojox.validate.isInRange(thisCell[2],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[2];vobject.num=n;
             }else{subGrid.getCell(subGrid.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[3],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[3];vobject.volumne=n;
             }else{subGrid.getCell(subGrid.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

               vobject.remark=thisCell[4];
 

																var mainTable=new Object();
			mainTable.id=querydataTaskForm[subGrid.dataRow][1];
            vobject.taskForm=mainTable;
			


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('TaskVO',vobject);
                SOAPClient.invoke(urlTask, "createTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
                subGrid.model.setDatum(ul,i,1);
				
                });
	         }else{//modify row
                padd.add('TaskVO',vobject);
                SOAPClient.invoke(urlTask, "updateTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
			 //querydataTaskForm[document.getElementById('erowIndexTask').value][childRow]=querydataSub;//????????????????????????????????????????????????????????????????????????????/
        } }
		
function call_funUpdGridSub(mainRow,subIndexRow) {
var subGrid = dijit.byId(makeSubGridIdGeneral('',querydataTaskForm[mainRow][1],"TaskFormChild"));
	
	if(subGrid){
	var sall=subGrid.model.data;
	if(subIndexRow==undefined || subIndexRow==''){
		for(var i=0;i<sall.length;i++){
         var thisCell=sall[i];
         saveSubRow(subGrid,thisCell,i);
		}//for
	}else{
		 var thisCell=sall[subIndexRow];
		saveSubRow(subGrid,thisCell,subIndexRow);
	}}
}		  

var urlTask = getUrl()+ "services/TaskFormManageService";
//var deletedataTask =  new Array();
//var querydataTask =  new Array();
var deletedataSub =  new Array();
//var querydataSub=  new Array();
var pagenumberTask=1;
var pagesizeTask=10;
var orderByTask='0';
var queryvoTask=new Object();
var oddstyle='';
//var modelChildAdd = new dojox.grid.data.Table(null, querydataSub);
var childLayout;
var childLayoutOdd;

function buildChildLayout(pre,mystyle,addRowIndex){
	var myLayout=[{
          
                 //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydataÖÐÈ¡Êý¾Ý
                       
 cells: [ [
			{ name: '<img src="../image/addsmall.gif" onclick="addRowSub('+addRowIndex +');"   height="18" width="18" border="0">' ,get:function(inRowIndex) {return '<img src="../image/delsmall.gif" onclick="deleteSub('+addRowIndex +','+inRowIndex+','+(querydataTaskForm[addRowIndex][childRow]!=undefined ? 0:querydataTaskForm[addRowIndex][childRow][inRowIndex][1])+');"  height="18" width="18" border="0">&nbsp;&nbsp;&nbsp;<img src="../image/savesmall.gif" onclick="call_funUpdGridSub('+addRowIndex +','+inRowIndex+');"  height="18" width="18" border="0">';}, width: 6,styles: 'text-align: center;',headerStyles:mystyle},//
			{ name: pre+i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool,headerStyles:mystyle },//
		    { name: pre+i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} ,headerStyles:mystyle},//
            {name: pre+i18nStr.num,field:2, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 },headerStyles:mystyle }
		             ,  {name: pre+i18nStr.volumne,field:3, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 },headerStyles:mystyle }
		        				    ,   {name: pre+i18nStr.remark, field: 4,width: 20, editor: dojox.grid.editors.Editor, editorToolbar: true  ,headerStyles:mystyle}
					      
//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
				                                        ] ]
                           }];  
						   
			return myLayout;			   
}

	
