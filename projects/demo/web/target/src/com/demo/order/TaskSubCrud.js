//${member.type.name}SubCrud.js==TaskSubCrud.js
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
              var  n=new NumberQuery(); n.upNumber=thisCell[2];vobject.num=n;
             }else{gridSub.getCell(gridSub.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[3],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[3];vobject.volumne=n;
             }else{gridSub.getCell(gridSub.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

               vobject.remark=thisCell[4];
 
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11
/*var mainTable=new TaskFormVOJs();
				 mainTable.id=document.getElementById('TaskFormId').value;
             vobject.contract=mainTable;*/
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11
																var mainTable=new Object();
			mainTable.id=document.getElementById('TaskFormId').value;
            vobject.taskForm=mainTable;
			


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('TaskVO',vobject);
                SOAPClient.invoke(urlTaskForm, "createTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
                gridSub.model.setDatum(ul,i,1);
                });
	         }else{//modify row
                padd.add('TaskVO',vobject);
                SOAPClient.invoke(urlTaskForm, "updateTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
			 querydataTaskForm[document.getElementById('erowIndexTaskForm').value][subInt]=querydataSub;//????????????????????????????????????????????????????????????????????????????/
        } }}//for
//submit delete
          for(var i=0;i<deletedataSub.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedataSub[i]);
               SOAPClient.invoke(urlTaskForm, "deleteTask", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          deletedataSub=new Array();
}		  

var addRowSub = function(){
var addrow=[];
														addrow.push('');
																					addrow.push('');
																					addrow.push('');
																							addrow.push([]);
						addrow.splice(0,0,false,0);
	  gridSub.addRow(addrow,gridSub.model.getRowCount());
	  if(querydataSub.length==0){
		querydataSub=[addrow];
	  }
	  //var t=new Array(6);
	  //querydataSub.push(t);
}

//var urlTask = getUrl()+ "services/TaskFormManageService";
//var deletedataTask =  new Array();
var querydataTask =  new Array();
var deletedataSub =  new Array();
var querydataSub=  new Array();
var pagenumberTask=1;
var pagesizeTask=10;
var orderByTask='0';
var queryvoTask=new Object();
var oddstyle='';
var modelChildAdd = new dojox.grid.data.Table(null, querydataSub);
var childLayout;
var childLayoutOdd;
function buildChildLayout(pre,mystyle){
	var myLayout=[{  
				//noscroll: true,
				cells: [//ÓÅ»¯Ê±¿É¼ÓÈë£ºÈç¹ý¼ÇÂ¼Êý³¬¹ý12£¬¼´±äÎªÁ½ÐÐ
                      [
				  				  {name: pre+i18nStr.num,field:2, width: 8,headerStyles:mystyle}
						  						  				 ,  {name: pre+i18nStr.volumne,field:3, width: 8,headerStyles:mystyle}
						  						  				,   {name: pre+i18nStr.remark, field: 4,width: 10,headerStyles:mystyle}
						  				
//?????????????????????????????????????????????????/´ÓmanageableAssociationEndsÖÐÏÈÈ¥µôfalseÎªtrue£»ÔÙÈ¥³ýÖ÷±í£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡
				     
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
            {name: i18nStr.num,field:2, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		             ,  {name: i18nStr.volumne,field:3, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		        					,   {name: i18nStr.remark, field: 4,width: 10, editor: dojox.grid.editors.Editor,required:false, editorToolbar: true  }
						  
//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
		                                        ] ]
                           }]; 

//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
		function selectTaskFormFun(rep){
		querydataSub[dojoTaskForm.selectTaskFormInRow][dojoTaskForm.noTaskForm]=rep;
		gridSub.updateRow(dojoTaskForm.selectTaskFormInRow);		
	}
