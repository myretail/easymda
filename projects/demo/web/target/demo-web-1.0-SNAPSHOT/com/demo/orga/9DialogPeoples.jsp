<%
String peopleId = request.getParameter("peopleId");
%>
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
     <style type="text/css">
            @import "../dojo/dojo-release-1.0.0/dijit/themes/tundra/tundra.css";
            @import "../dojo/dojo-release-1.0.0/dojo/resources/dojo.css";
            @import "../dojo/dojo-release-1.0.0/dojox/grid/_grid/tundraGrid.css";
            @import "../dojo/dojo-release-1.0.0/dojox/grid/_grid/Grid.css";
            @import "../js/dijitTests.css";
            @import "../js/wlProject.css";
			@import "../dojo/dojo-release-1.0.0/dojox/layout/resources/FloatingPane.css"; 
		    @import "../dojo/dojo-release-1.0.0/dojox/layout/resources/ResizeHandle.css"; 
      </style>
      <script type="text/javascript" src="../dojo/dojo-release-1.0.0/dojo/dojo.js"  
                djConfig="parseOnLoad: true, isDebug: true,locale: 'zh-cn', extraLocale: ['zh-TW', 'fr']"></script>
      <script>
    
            dojo.require("dojo.data.ItemFileWriteStore");
            dojo.require("dojo.parser");
            dojo.require("dijit.form.Button");
            dojo.require("dijit.Menu");
            dojo.require("dojox.grid.Grid");
            dojo.require("dojox.validate._base");
            dojo.require("dojox.grid._data.model");
            dojo.require("dijit.form.ValidationTextBox");
            dojo.require("dijit.form.TextBox");
            dojo.require("dijit.form.FilteringSelect");
            dojo.require("dijit.form.ComboBox");
            dojo.require("dijit.form.Textarea");
            dojo.require("dojox.grid._data.dijitEditors");
            dojo.require("dojox.layout.FloatingPane");
			dojo.require("dijit.Dialog");
            dojo.registerModulePath("mydojo", "../../../js/mydojo");
            dojo.require("mydojo.FilteringSelect");
            dojo.require("mydojo.ValidationTextBox");
            dojo.require("mydojo.NumberTextBox");
			dojo.registerModulePath("projectDojo", "../../../dojo/projectDojo");
			dojo.require("projectDojo.Peoples");
     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 <script type="text/javascript" >
		var dojoPeoples= new  projectDojo.Peoples();
	    dojoPeoples.initPeoples();

</script>
	<script type="text/javascript" >
	//manageablePackageName=com.demo.entity.orga.crud
	//packageName=com.demo.entity.orga
	  var url = getUrl()+ "services/PeoplesManageService";
	  var deletedata =  new Array();
	  var querydata =  new Array();
	  var pagenumber=1;
	  var pagesize=10;
	  var totalCount=0;
	  var queryvo=new Object();
	  var oddstyle='';
	  var model = new dojox.grid.data.Table(null, querydata);
	  var urle = getUrl()+ "services/BasicManageService";        

 
//ÏÈÅÐ¶Ï±íµÄ×Ö¶ÎÊýÊÇ·ñ´óÓÚ12£¬Èç¹û´óÓÚ12£¬ÔòÉú³Éµ¥ÐÐlayoutºÍÕÛµþlayoutÁ½¸östructure
//enumeration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
																																																					
var layoutSingleRow=[{
          
 //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydateÖÐÈ¡Êý¾Ý
	   
				 cells: [ [
							{ name: '<img src="../image/addsmall.gif" onclick="addRow();"   height="18" width="18" border="0">&nbsp;&nbsp;&nbsp;<img src="../image/saveAll.jpg" onclick="call_funUpd();"   height="18" width="18" border="0">' ,get:function(inRowIndex) {return '<img src="../image/delsmall.gif" onclick="removeRows('+inRowIndex+','+querydata[inRowIndex][1]+');"  height="18" width="18" border="0">&nbsp;&nbsp;&nbsp;<img src="../image/savesmall.gif" onclick="call_funUpdSingle('+inRowIndex+');"  height="18" width="18" border="0">';}, width: 6,styles: 'text-align: center;'},//,headerStyles:mystyle
						   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
						   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
      					  {name: i18nStr.peopleName, field: 2,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
					            					,   {name: i18nStr.peoplePassword, field: 3,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            					,   {name: i18nStr.peopleStatus, field: 4,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					        		,   {name: i18nStr.birthDay,field:5, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
				,   {name: i18nStr.birthDayTime,field:6, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
		        					,   {name: i18nStr.sex, field: 7,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
					            					,   {name: i18nStr.birthPlace, field: 8,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            					,   {name: i18nStr.address, field: 9,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            					,   {name: i18nStr.tel, field: 10,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            					,   {name: i18nStr.engageMode, field: 11,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					        		,   {name: i18nStr.engageDate,field:12, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
				,   {name: i18nStr.engageDateTime,field:13, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
		        	    ,   {name: i18nStr.gradeEnum, field: 14,width: 10 , editor: mydojo.FilteringSelect ,options:dojoPeoples.itemgradeEnumOption,required:false ,invalidMessage:'can not be empty'}
			        				    ,   {name: i18nStr.remark, field: 15,width: 10, editor: dojox.grid.editors.Editor,required:false, editorToolbar: true  }
					      
                                        ] ]
                           }]; 

  //rowinum=7

function getCheckPeoples(){}

var layoutTwoRow=[{
          
 //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydateÖÐÈ¡Êý¾Ý
	   
				 cells: [
                      [
						{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
						{ name: i18nStr.detail, width: 3, get: getCheckPeoples, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
										  															  {name: i18nStr.peopleName, field: 2,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
																		  			//--------------  if (3 == 6)
														  															,   {name: i18nStr.peoplePassword, field: 3,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  			//--------------  if (4 == 6)
														  															,   {name: i18nStr.peopleStatus, field: 4,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  			//--------------  if (5 == 6)
														  					,   {name: i18nStr.birthDay,field:5, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
														 ,   {name: i18nStr.birthDayTime,field:6, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
					 					 ]
							  			//--------------  if (7 == 6)
								                     //----------------(inum:7)  (rowinum: 6)
									                     //----------------(inum:7)  (rowinum: 6)
									                     //----------------(inum:7)  (rowinum: 6)
									                     //----------------(inum:7)  (rowinum: 6)
									                     //----------------(inum:7)  (rowinum: 6)
									                     //----------------(inum:7)  (rowinum: 6)
									                     //----------------(inum:7)  (rowinum: 6)
									                     //----------------(inum:7)  (rowinum: 6)
									                     //----------------(inum:7)  (rowinum: 6)
								
		,[
	 //  22222222222inum= 2   inum2=7
																																												  																		  {name: i18nStr.sex, field: 7,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
																					  														  																		,   {name: i18nStr.birthPlace, field: 8,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																					  														  																		,   {name: i18nStr.address, field: 9,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																					  														  																		,   {name: i18nStr.tel, field: 10,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																					  														  																		,   {name: i18nStr.engageMode, field: 11,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																					  														  					,   {name: i18nStr.engageDate,field:12, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
										,   {name: i18nStr.engageDateTime,field:13, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
								  														  											,   {name: i18nStr.gradeEnum, field: 14,width: 10 , editor: mydojo.FilteringSelect ,options:dojoPeoples.itemgradeEnumOption,required:false ,invalidMessage:'can not be empty'}
														  														  																		,   {name: i18nStr.remark, field: 15,width: 10, editor: dojox.grid.editors.Editor,required:false, editorToolbar: true  }
																					  														
	 	
		]]
                           }]; 						   
						   


function call_funUpd() {
       var sall=grid.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
			call_funUpdSingle(i);
	   }}//for
 } 
						   
function call_funUpdSingle(saveRowIndex){
         var passAll=0;
         var thisCell=grid.model.data[saveRowIndex];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];
              if(dojox.validate.isText(thisCell[2], {minlength: 1})){vobject.peopleName=thisCell[2];
             }else{grid.getCell(grid.model.fieldArray[2]).getNode(saveRowIndex).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
               vobject.peoplePassword=thisCell[3];
 
               vobject.peopleStatus=thisCell[4];
 
 var  d=new DateTimeQuery();
             if(thisCell[5] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[5], grid.getCell(grid.model.fieldArray[5]).constraint);
             }else{grid.getCell(grid.model.fieldArray[5]).getNode(saveRowIndex).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[6] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[6], grid.getCell(grid.model.fieldArray[6]).constraint);
             vobject.birthDay=d;
             }else{grid.getCell(grid.model.fieldArray[6]).getNode(saveRowIndex).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null


              if(dojox.validate.isText(thisCell[7], {minlength: 1})){vobject.sex=thisCell[7];
             }else{grid.getCell(grid.model.fieldArray[7]).getNode(saveRowIndex).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
               vobject.birthPlace=thisCell[8];
 
               vobject.address=thisCell[9];
 
               vobject.tel=thisCell[10];
 
               vobject.engageMode=thisCell[11];
 
 var  d=new DateTimeQuery();
             if(thisCell[12] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[12], grid.getCell(grid.model.fieldArray[12]).constraint);
             }else{grid.getCell(grid.model.fieldArray[12]).getNode(saveRowIndex).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[13] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[13], grid.getCell(grid.model.fieldArray[13]).constraint);
             vobject.engageDate=d;
             }else{grid.getCell(grid.model.fieldArray[13]).getNode(saveRowIndex).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null


               vobject.gradeEnum=thisCell[14];
 
               vobject.remark=thisCell[15];
 




       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('PeoplesVO',vobject);
                SOAPClient.invoke(url, "createPeoples", padd, false,  function GetEnu_callBack(ul, soapResponse){
                grid.model.setDatum(ul,saveRowIndex,1);
                });
	         }else{//modify row
                padd.add('PeoplesVO',vobject);
                SOAPClient.invoke(url, "updatePeoples", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
        } 

 } 
 
 function removeRows(delRowIndex,id){
	//if(id!=0)deletedata.splice(deletedata.length,0,id);
    grid.model.remove([delRowIndex]);
	if(id!=0){
		var pdel = new SOAPClientParameters();      
		pdel.add('id',id);
		SOAPClient.invoke(url, "deleteProd", pdel, false,  function GetEnu_callBack(ul, soapResponse){ });
	}
}
 
 function removeSelectedRowsGrid(){
       //var s = grid.selection.getSelected();
       var s= new Array();
       var sall=grid.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            deletedata.splice(deletedata.length,0,thisCell[1]);
       }}}
       grid.model.remove(s);//grid.removeSelectedRows();
 }
        
	 
function querybutton(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvo=new Object();
	          if(querypeopleName.getDisplayedValue()!="")queryvo.peopleName=querypeopleName.getDisplayedValue();//
	          if(querypeoplePassword.getDisplayedValue()!="")queryvo.peoplePassword=querypeoplePassword.getDisplayedValue();//
	          if(querypeopleStatus.getDisplayedValue()!="")queryvo.peopleStatus=querypeopleStatus.getDisplayedValue();//
              d=queryDate_fun("birthDay");
              if(d==null){validstate=1;}else if(d.upSign!="%"){queryvo.birthDay=d;}
	          if(querysex.getDisplayedValue()!="")queryvo.sex=querysex.getDisplayedValue();//
	          if(querybirthPlace.getDisplayedValue()!="")queryvo.birthPlace=querybirthPlace.getDisplayedValue();//
	          if(queryaddress.getDisplayedValue()!="")queryvo.address=queryaddress.getDisplayedValue();//
	          if(querytel.getDisplayedValue()!="")queryvo.tel=querytel.getDisplayedValue();//
	          if(queryengageMode.getDisplayedValue()!="")queryvo.engageMode=queryengageMode.getDisplayedValue();//
              d=queryDate_fun("engageDate");
              if(d==null){validstate=1;}else if(d.upSign!="%"){queryvo.engageDate=d;}
	          if(querygradeEnum.getDisplayedValue()!="")queryvo.gradeEnum=querygradeEnum.getDisplayedValue();//
	          if(queryremark.getDisplayedValue()!="")queryvo.remark=queryremark.getDisplayedValue();//
			

			if(validstate==0){
              pagenumber=1;
              getVO(queryvo,pagenumber,pagesize,'0'); 
              //if(totalpage>1){dijit.byId("but7").setDisabled(false);}else{dijit.byId("but7").setDisabled(true);} 
             }      
       }
	 
querydis = function(){
               querydisplay("queryDiv");
            }
 
 


function getVO(queryvo,pagenumber,pagesize,orderBy){
	
      var pu = new SOAPClientParameters2();
      pu.add('PeoplesVO',queryvo) ;
      pu.add('pageNumber',pagenumber) ;
	    pu.add('pageSize',pagesize) ;
	    pu.add('orderBy',orderBy) ;
      SOAPClient.invoke(url,"getPeoples", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydata=new Array();
		   querydata=dojoPeoples.PeoplesVOtoArray_fun(ul,true);
           totalCount=ul[ul.length-1]["ns:id"]; 
           //totalpage=Math.ceil(new Number(totalCount)/pagesize);
           //document.getElementById("rowCount").innerHTML=" "+pagenumber+" / "+totalpage+" / "+totalCount+" " ;
      }); 
      querydata.splice(querydata.length-1,1);
      model.setData(querydata);
      //dijit.byId("grid").updateRowCount(querydata.length); 
	   var totalpage=Math.ceil(new Number(totalCount)/pagesize);
	  
	if(totalpage>1){
		if(pagenumber==1){
			dijit.byId("but6").setDisabled(true);
			dijit.byId("but7").setDisabled(false);
		}else if(pagenumber==totalpage){
			dijit.byId("but6").setDisabled(false);
			dijit.byId("but7").setDisabled(true);
		}else{
			dijit.byId("but6").setDisabled(false);
			dijit.byId("but7").setDisabled(false);
		}
	}else{
		dijit.byId("but6").setDisabled(true);
		dijit.byId("but7").setDisabled(true);
	
	}
	if(pagesize==0){
		totalpage=1;
		dijit.byId("but6").setDisabled(true);
		dijit.byId("but7").setDisabled(true);
	}
	if(totalpage==1)pagenumber=1;
	
	 document.getElementById("rowCount").innerHTML=i18nStr.di+" "+pagenumber+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCount+" "+i18nStr.rowSize; 	
	  
	  
 }
 
var dlg; 
var dlgm; 

function init(){
  getVO(queryvo,pagenumber,pagesize,'0');
   	dojo.connect(dijit.byId("grid"), "dodblclick", function(e){
	if(!dlg){	
				var pane = dojo.byId('Dlg');
				pane.style.display = ''; 	
				dlgm = new dijit.Dialog({
					id: 'Dlg',
					refocus:false,
					title: i18nStr.addNote
				},pane);
	}
	dlgm.show();
	document.getElementById('erowIndex').value=e.rowIndex;
	 document.getElementById('PeoplesId').value=querydata[e.rowIndex][1];
		 	 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addpeopleName").setValue(querydata[e.rowIndex][2]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addpeoplePassword").setValue(querydata[e.rowIndex][3]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addpeopleStatus").setValue(querydata[e.rowIndex][4]);
						 									 dijit.byId("addbirthDay").setValue(querydata[e.rowIndex][5]);
				 				 dijit.byId("addbirthDayTime").setValue(querydata[e.rowIndex][6]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addsex").setValue(querydata[e.rowIndex][7]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addbirthPlace").setValue(querydata[e.rowIndex][8]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addaddress").setValue(querydata[e.rowIndex][9]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addtel").setValue(querydata[e.rowIndex][10]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addengageMode").setValue(querydata[e.rowIndex][11]);
						 									 dijit.byId("addengageDate").setValue(querydata[e.rowIndex][12]);
				 				 dijit.byId("addengageDateTime").setValue(querydata[e.rowIndex][13]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addgradeEnum").setValue(querydata[e.rowIndex][14]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addremark").setValue(querydata[e.rowIndex][15]);
						 			 
			
	 });  
}

 dojo.addOnLoad(init);   

var  ifNewAdd=false; 
addRow = function(){
 	grid.addRow([false,0,"","",""],grid.model.getRowCount());
 	if(!dlg){
		var pane = dojo.byId('Dlg');
		pane.style.display = ''; 	
		dlg = new dijit.Dialog({
			id: 0,
			refocus:false,
			title: i18nStr.addNote
		},pane);
	} 
	dlg.show();
	ifNewAdd=true;
	addDivAdd();
} 

//addDiv---------------begin-------------------------------------
var addDivAdd = function(){
										//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				
									dijit.byId("addpeopleName").setValue('');
																			//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				
									dijit.byId("addpeoplePassword").setValue('');
																			//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				
									dijit.byId("addpeopleStatus").setValue('');
																			dijit.byId("addbirthDay").setValue('');
				dijit.byId("addbirthDayTime").setValue('');
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				
									dijit.byId("addsex").setValue('');
																			//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				
									dijit.byId("addbirthPlace").setValue('');
																			//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				
									dijit.byId("addaddress").setValue('');
																			//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				
									dijit.byId("addtel").setValue('');
																			//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				
									dijit.byId("addengageMode").setValue('');
																			dijit.byId("addengageDate").setValue('');
				dijit.byId("addengageDateTime").setValue('');
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				
									//dijit.byId("addgradeEnum").setValue('');
																			//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				
									dijit.byId("addremark").setValue('');
														
		
	document.getElementById('PeoplesId').value='0';
} 

function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new Object();
    vobject.id=document.getElementById('PeoplesId').value;
	var passAll=0;
										//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addpeopleName").validate(true)){
					vobject.peopleName=dijit.byId("addpeopleName").getValue();
				}else{
					setErrorClass(dijit.byId("addpeopleName")); passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addpeoplePassword").validate(true)){
					vobject.peoplePassword=dijit.byId("addpeoplePassword").getValue();
				}else{
					setErrorClass(dijit.byId("addpeoplePassword")); passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addpeopleStatus").validate(true)){
					vobject.peopleStatus=dijit.byId("addpeopleStatus").getValue();
				}else{
					setErrorClass(dijit.byId("addpeopleStatus")); passAll=1;
				}
															if(dijit.byId("addbirthDay").validate(true)){ 
					if(dijit.byId("addbirthDay").getValue()!=''&&dijit.byId("addbirthDay").getValue()!=undefined){	
					if(dijit.byId("addbirthDayTime").validate(true)){
						if(dijit.byId("addbirthDayTime").getValue()==''||dijit.byId("addbirthDayTime").getValue()==undefined)dijit.byId("addbirthDayTime").setValue(new Date(2000,1,1,0,0,0,0));
						var dbirthDay=new DateTimeQuery();
						dbirthDay.upDate=dojo.date.locale.format(dijit.byId("addbirthDay").getValue(), dijit.byId("addbirthDay").constraints)+" "+dojo.date.locale.format(dijit.byId("addbirthDayTime").getValue(), dijit.byId("addbirthDayTime").constraints);
						vobject.birthDay=dbirthDay;
					}else{setErrorClass(dijit.byId("addbirthDayTime")); passAll=1;}
				}}else{
					setErrorClass(dijit.byId("addbirthDay")); passAll=1;}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addsex").validate(true)){
					vobject.sex=dijit.byId("addsex").getValue();
				}else{
					setErrorClass(dijit.byId("addsex")); passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addbirthPlace").validate(true)){
					vobject.birthPlace=dijit.byId("addbirthPlace").getValue();
				}else{
					setErrorClass(dijit.byId("addbirthPlace")); passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addaddress").validate(true)){
					vobject.address=dijit.byId("addaddress").getValue();
				}else{
					setErrorClass(dijit.byId("addaddress")); passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addtel").validate(true)){
					vobject.tel=dijit.byId("addtel").getValue();
				}else{
					setErrorClass(dijit.byId("addtel")); passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addengageMode").validate(true)){
					vobject.engageMode=dijit.byId("addengageMode").getValue();
				}else{
					setErrorClass(dijit.byId("addengageMode")); passAll=1;
				}
															if(dijit.byId("addengageDate").validate(true)){ 
					if(dijit.byId("addengageDate").getValue()!=''&&dijit.byId("addengageDate").getValue()!=undefined){	
					if(dijit.byId("addengageDateTime").validate(true)){
						if(dijit.byId("addengageDateTime").getValue()==''||dijit.byId("addengageDateTime").getValue()==undefined)dijit.byId("addengageDateTime").setValue(new Date(2000,1,1,0,0,0,0));
						var dengageDate=new DateTimeQuery();
						dengageDate.upDate=dojo.date.locale.format(dijit.byId("addengageDate").getValue(), dijit.byId("addengageDate").constraints)+" "+dojo.date.locale.format(dijit.byId("addengageDateTime").getValue(), dijit.byId("addengageDateTime").constraints);
						vobject.engageDate=dengageDate;
					}else{setErrorClass(dijit.byId("addengageDateTime")); passAll=1;}
				}}else{
					setErrorClass(dijit.byId("addengageDate")); passAll=1;}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addgradeEnum").validate(true)){
					vobject.gradeEnum=dijit.byId("addgradeEnum").getValue();
				}else{
					setErrorClass(dijit.byId("addgradeEnum")); passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addremark").validate(true)){
					vobject.remark=dijit.byId("addremark").getValue();
				}else{
					setErrorClass(dijit.byId("addremark")); passAll=1;
				}
										
	
if(passAll==0){
		//var addrow='';
		var addrow=[];
														//addrow=addrow+","+vobject.peopleName;
					addrow.push(vobject.peopleName);
																					//addrow=addrow+","+vobject.peoplePassword;
					addrow.push(vobject.peoplePassword);
																					//addrow=addrow+","+vobject.peopleStatus;
					addrow.push(vobject.peopleStatus);
																					if(vobject.birthDay){
						addrow.push(dijit.byId("addbirthDay").getValue());
						addrow.push(dijit.byId("addbirthDayTime").getValue());
					}else{addrow.push('');addrow.push('');}
																					//addrow=addrow+","+vobject.sex;
					addrow.push(vobject.sex);
																					//addrow=addrow+","+vobject.birthPlace;
					addrow.push(vobject.birthPlace);
																					//addrow=addrow+","+vobject.address;
					addrow.push(vobject.address);
																					//addrow=addrow+","+vobject.tel;
					addrow.push(vobject.tel);
																					//addrow=addrow+","+vobject.engageMode;
					addrow.push(vobject.engageMode);
																					if(vobject.engageDate){
						addrow.push(dijit.byId("addengageDate").getValue());
						addrow.push(dijit.byId("addengageDateTime").getValue());
					}else{addrow.push('');addrow.push('');}
																					//addrow=addrow+","+vobject.gradeEnum;
					addrow.push(vobject.gradeEnum);
																					//addrow=addrow+","+vobject.remark;
					addrow.push(vobject.remark);
																	 if(vobject.id==0){//create new row
		padd.add('PeoplesVO',vobject);
		SOAPClient.invoke(url, "createPeoples", padd, false,  function GetEnu_callBack(ul, soapResponse){
		//addrow='false,ul'+addrow;
		addrow.splice(0,0,false,ul);
				console.log("addrow.lenght:"+addrow.length);
				console.log("addrow:"+addrow);
		if(ifNewAdd){
			querydata[grid.model.getRowCount()-1]=addrow;//[addrow];
			grid.updateRow(grid.model.getRowCount()-1);
			ifNewAdd=false;
		}else{
			grid.addRow(addrow ,grid.model.getRowCount());//grid.addRow([addrow]);
		}
		
		document.getElementById('erowIndex').value=grid.model.getRowCount()-1;		
		});
	 }else{//modify row
		padd.add('PeoplesVO',vobject);
		SOAPClient.invoke(url, "updatePeoples", padd, false,  function GetEnu_callBack(ul, soapResponse){
		});
		//addrow='false,vobject.id'+addrow;
		addrow.splice(0,0,false,vobject.id);
		querydata[document.getElementById('erowIndex').value]=addrow;//[addrow];
		grid.updateRow(document.getElementById('erowIndex').value);
	 }
}   }

function addDivRemove(){
     if(window.confirm(i18nStr.deleteConfirm)){
        //var s = dijit.byId("grid").selection.getSelected();
		var s = dijit.byId("grid").rowCount;
        //for(var i=0;i<s.length;i++){ 
              //var ii=s[i];
			  var ii=s.length;
              var si=document.getElementById('erowIndex').value;
              var pdel = new SOAPClientParameters();      
               //pdel.add('id',querydata[ii][1]);
			   pdel.add('id',querydata[si][1]);
               SOAPClient.invoke(url, "deletePeoples", pdel, false,  function GetEnu_callBack(ul, soapResponse){
               /*if(si>ii){
					if(si-1>=0){document.getElementById('erowIndex').value=si-1;}//else{document.getElementById('erowIndex').value='';}//????????????????????????????????//
					}*/
			   totalCount--;
               var totalpage=Math.ceil(new Number(totalCount)/pagesize);
               document.getElementById("rowCount").innerHTML = i18nStr.di+" "+pagenumber+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCount+" "+i18nStr.rowSize; 	
               if(dlg)dlg.hide();
	        });   
          //}             
           grid.model.remove([si]);
      }
 }    
//addDiv---------------end---------------------------------------	 
//totleinum=14
 //rowinum=4
 //addHeight=160
</script>
</head>	 
<body class="tundra">
		
<div id="queryDiv" style="margin-right: 0px;  height: 160px; display:none;" >
  <table align="center" width=100% class="queryTable"  >
	<tr >
	<td align="center" style="{width:11%}" i18n="queryNote" >Please input criterial:</td>
	<td style="{width:22%}" ></td>
	<td style="{width:11%}"></td>
	<td style="{width:6%}" ></td>
	<td style="{width:11%}" ></td>
	<td style="{width:6%}" ></td>
	<td style="{width:11%}"></td>
	<td style="{width:22%}"></td>
	</tr> 
	<tr ><td align="center" style="{width:11%}"></td>
	<td style="{width:22%}" ></td>
	<td style="{width:11%}"></td>
	<td style="{width:6%}" ></td>
	<td style="{width:11%}" ></td>
	<td style="{width:6%}" ></td>
	<td style="{width:11%}"></td>
	<td style="{width:22%}"></td></tr>  
                <tr>
							<td align="right" i18n="peopleName" >peopleName:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="querypeopleName"  jsId="querypeopleName"   dojoType="dijit.form.TextBox"  />
													</td>
														<td align="right"  i18n="peoplePassword" >peoplePassword:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="querypeoplePassword"  jsId="querypeoplePassword"   dojoType="dijit.form.TextBox"  />
												</td>  
													<td align="right"  i18n="peopleStatus" >peopleStatus:</td>
						<td align="left"  >
													<input type="text" class="editerInput"  id="querypeopleStatus"  jsId="querypeopleStatus"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			                <tr>
							<td align="right" i18n="birthDay"  >birthDay:</td> 
						<td align="left"  colspan="3"><span id="querybirthDayImg0"  ><input class="editerDate"   jsId="querybirthDay" id="querybirthDay"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="querybirthDayTime" id="querybirthDayTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="querybirthDayImg1" style="{display:none}" ><input class="editerDateSmaller"   jsId="query1birthDay" id="query1birthDay"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query1birthDayTime" id="query1birthDayTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querybirthDayImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querybirthDayImgdown" >></span>
							<span id="querybirthDayImg2div" style="{display:none}"><input class="editerDateSmaller"   jsId="query2birthDay" id="query2birthDay"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query2birthDayTime" id="query2birthDayTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="querybirthDayImg" class="imgStyle">
						</td>
													<td align="right" colspan="2" ></td>
						<td align="right"  i18n="sex" >sex:</td>
						<td align="left"  >
							 								<input type="text" class="editerInput"  id="querysex"  jsId="querysex"   dojoType="dijit.form.TextBox"  />  
													</td></tr>
					                <tr>
							<td align="right" i18n="birthPlace" >birthPlace:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="querybirthPlace"  jsId="querybirthPlace"   dojoType="dijit.form.TextBox"  />
													</td>
														<td align="right"  i18n="address" >address:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="queryaddress"  jsId="queryaddress"   dojoType="dijit.form.TextBox"  />
												</td>  
													<td align="right"  i18n="tel" >tel:</td>
						<td align="left"  >
													<input type="text" class="editerInput"  id="querytel"  jsId="querytel"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			                <tr>
							<td align="right" i18n="engageMode" >engageMode:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryengageMode"  jsId="queryengageMode"   dojoType="dijit.form.TextBox"  />
													</td>
																<td align="right"  i18n="engageDate" >engageDate:</td>
						<td align="left"   colspan="5"><span id="queryengageDateImg0"  ><input class="editerDate"   jsId="queryengageDate" id="queryengageDate"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="queryengageDateTime" id="queryengageDateTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="queryengageDateImg1" style="{display:none}" ><input class="editerDateSmall"   jsId="query1engageDate" id="query1engageDate"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmall" jsId="query1engageDateTime" id="query1engageDateTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryengageDateImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryengageDateImgdown" >></span>
							<span id="queryengageDateImg2div" style="{display:none}"><input class="editerDateSmall"   jsId="query2engageDate" id="query2engageDate"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmall" jsId="query2engageDateTime" id="query2engageDateTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="queryengageDateImg" class="imgStyle">
						</td></tr>
			                <tr>
							<td align="right" i18n="gradeEnum" >gradeEnum:</td>
						<td align="left"  >
						
														<input  id="querygradeEnum"  jsId="querygradeEnum" class="editerInput"  dojoType="dijit.form.FilteringSelect" store="dojoPeoples.gradeEnumStore" />
													</td>
														<td align="right"  i18n="remark" >remark:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="queryremark"  jsId="queryremark"   dojoType="dijit.form.TextBox"  />
												</td>  
				<!--
//if (!="over" && 3!=1)     
/tr
//end 
//set ($inume =1) -->
    <td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybutton();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
	     </div>
<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   Peoples List</b></td>
		<td align="right" >
				<!--button dojoType="dijit.form.Button" onclick="adddis();" iconClass="openDivIcon"  i18n="edit" >openAdd</button-->
				 &nbsp;&nbsp;&nbsp;
					<button dojoType="dijit.form.Button" onclick="querydis();" iconClass="openQueryIcon"  i18n="openQuery" >query</button>
	          	     <!--button dojoType="dijit.form.Button" onclick="addRow();" iconClass="addIcon" i18n="add" >add</button-->
					 <!--button dojoType="dijit.form.Button" onclick="addDivAdd();" iconClass="addIcon"  >add</button-->
	                 <!--button dojoType="dijit.form.Button" onclick="removeSelectedRowsGrid();" iconClass="delIcon" i18n="delete" >delete</button>
	                 <button dojoType="dijit.form.Button" id="but3" jsId="but3" onclick="call_funUpd();" i18n="save" iconClass="saveIcon">save</button-->
					 <span id="rowCount"></span>
        <button dojoType="dijit.form.myButton" onclick="upPage();"  id="but6" disabled='true' jsId="but6" iconClass="upPageIcon" ></button>
        <button dojoType="dijit.form.myButton" onclick="downPage();" id="but7" disabled='true' jsId="but7" iconClass="downPageIcon" ></button>
        <div id="668" dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
  			  <div dojoType="dijit.Menu">
				  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChange(this.label);"></div>
				  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChange(this.label);"></div>
		      <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChange(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChange(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpage();"></div>
		      </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
        </div>
		    <div id="669" dojoType="dijit.form.myDropDownButton" iconClass="pageStyleIcon"><span>pageStyle</span>
  			   <div dojoType="dijit.Menu">
  				 <div dojoType="dijit.MenuItem"  iconClass="rowIcon"		label="row"	onClick="pageStyle(this.label);"></div>
  				 <div dojoType="dijit.MenuItem"  iconClass="colIcon"		label="col"	onClick="pageStyle(this.label);"></div>
		    </div></div>
	          	     
		</td>
	</tr>
</table>    
	    <div style="{height:90%;width:100%}"  >
	         <div id="grid"  dojoType="dojox.Grid" autoWidth="false"  jsId="grid"	model="model"  structure="layoutSingleRow" singleClickEdit="true" ></div>
      </div>      
<div id="Dlg"  style="width: 1000px;height:190px;display: none;" >
	<table align="center" width="100%" id="0" class="editorTableDialog"  >
                <tr >
				<td align="center" style="{width:11%}">&nbsp;</td>
                <td style="{width:22%}" ><input id="PeoplesId" style="{display:none}"  type="text"  /></td>
                <td style="{width:11%}"><input id="erowIndex" style="{display:none}"  type="text"  /></td>
                <td style="{width:23%}" ></td>
                <td style="{width:11%}"></td>
                <td style="{width:22%}"></td>
				</tr> 
                <tr ><td align="center" style="{width:11%}"></td>
                <td style="{width:22%}" ></td>
                <td style="{width:11%}"></td>
				<td style="{width:23%}" ></td>
                <td style="{width:11%}"></td>
                <td style="{width:22%}"></td></tr>  
                <tr>
				<td align="right" i18n="peopleName" >peopleName:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addpeopleName"  jsId="addpeopleName"   dojoType="dijit.form.ValidationTextBox" required="true" />
							</td>
					<td align="right" i18n="peoplePassword" >peoplePassword:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addpeoplePassword"  jsId="addpeoplePassword"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="peopleStatus" >peopleStatus:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addpeopleStatus"  jsId="addpeopleStatus"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
		</tr>	
                <tr>
				<td align="right" i18n="birthDay"  >birthDay:</td> 
			<td align="left" >
				<input class="addDate"   jsId="addbirthDay" id="addbirthDay"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox" required="false" />
				<input class="addTime" jsId="addbirthDayTime" id="addbirthDayTime"  dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"  >
			</td>
					<td align="right" i18n="sex" >sex:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addsex"  jsId="addsex"   dojoType="dijit.form.ValidationTextBox" required="true" />
							</td>
					<td align="right" i18n="birthPlace" >birthPlace:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addbirthPlace"  jsId="addbirthPlace"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
		</tr>	
                <tr>
				<td align="right" i18n="address" >address:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addaddress"  jsId="addaddress"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="tel" >tel:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addtel"  jsId="addtel"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="engageMode" >engageMode:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addengageMode"  jsId="addengageMode"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
		</tr>	
                <tr>
				<td align="right" i18n="engageDate"  >engageDate:</td> 
			<td align="left" >
				<input class="addDate"   jsId="addengageDate" id="addengageDate"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox" required="false" />
				<input class="addTime" jsId="addengageDateTime" id="addengageDateTime"  dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"  >
			</td>
					<td align="right" i18n="gradeEnum" >gradeEnum:</td>
			<td align="left"  >
									<input  id="addgradeEnum"  jsId="addgradeEnum" class="editerInput"  dojoType="dijit.form.myFilteringSelect" store="dojoPeoples.gradeEnumStore" required="false" />
							</td>
					<td align="right" i18n="remark" >remark:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addremark"  jsId="addremark"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
		</tr>	

 <!--//if (1==1)     
//   /tr
//end

//set ($inume =1) -->
 <tr align="center"><td></td>
           <td colspan="5"><button dojoType="dijit.form.Button" onclick="addDivAdd();" iconClass="addIcon"  i18n="add" >add</button>
				<button dojoType="dijit.form.Button" onclick="addDivRemove();" iconClass="delIcon"  i18n="delete" >remove</button>
				<button dojoType="dijit.form.Button" onclick="addDivSave();" iconClass="saveIcon"   i18n="save">save</button></td>
           <td colspan="2"></td></tr>
</table>  
	  
</div>          
    
</body>
<script type="text/javascript">trans18tag();</script>
</html>		 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
