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
			dojo.require("dijit.Dialog");
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
            dojo.registerModulePath("mydojo", "../../../js/mydojo");
            dojo.require("mydojo.FilteringSelect");
            dojo.require("mydojo.ValidationTextBox");
            dojo.require("mydojo.NumberTextBox");
			dojo.registerModulePath("projectDojo", "../../../dojo/projectDojo");
			dojo.require("projectDojo.Peoples");
     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
	 <script type="text/javascript" >
	//manageablePackageName=com.demo.entity.orga.crud
	//packageName=com.demo.entity.orga
	  
	  </script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 <script type="text/javascript" >
	  var url = getUrl()+ "services/PeoplesManageService";
	  var dojoPeoples= new  projectDojo.Peoples();
	  dojoPeoples.initPeoples();
	  var deletedata =  new Array();
	  var querydata =  new Array();
	  var pagenumber=1;
	  var pagesize=10;
	  var totalCount=0;
	  var queryvo=new Object();
	  var oddstyle='';
	  var model = new dojox.grid.data.Table(null, querydata);
	  var urle = getUrl()+ "services/BasicManageService"; 

 
//???¡À????1212??layout??layoutstructure
//enumeration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
																									
/**/
/*function setDetailFloatFun(inrow,ColNo){
	return querydata[inrow][ColNo];
}	*/

var layoutSingleRow=[{
          
 //field????????¨°???js??toArray¡Á???querydate??
	   
				 cells: [ [
							//{name: '??', width: 3, get:getChoise},
						   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
						   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
      				  {name: i18nStr.peopleName, field: 2,width: 8}
					       				,   {name: i18nStr.peoplePassword, field: 3,width: 8}
					       				,   {name: i18nStr.peopleStatus, field: 4,width: 8}
					   		,   {name: i18nStr.birthDay,field:5, width: 8}
		        				,   {name: i18nStr.sex, field: 6,width: 8}
					       				,   {name: i18nStr.birthPlace, field: 7,width: 8}
					       				,   {name: i18nStr.address, field: 8,width: 8}
					       				,   {name: i18nStr.tel, field: 9,width: 8}
					       				,   {name: i18nStr.engageMode, field: 10,width: 8}
					   		,   {name: i18nStr.engageDate,field:11, width: 8}
		        				,   {name: i18nStr.gradeEnum, field: 12,width: 8}
					       			    ,   {name: i18nStr.remark, field: 13,width: 10 }
					 
                                        ] ]
                           }]; 
						   
var layoutNoscroll=[ {
			noscroll: true,
			cells: [[
				 { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
				   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} }
		]]},{
          
 //field????????¨°???js??toArray¡Á???querydate??
	   
				 cells: [ [
							//{name: '??', width: 3, get:getChoise},
						  // { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
						  // { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
      				  {name: i18nStr.peopleName, field: 2,width: 8}
					       				,   {name: i18nStr.peoplePassword, field: 3,width: 8}
					       				,   {name: i18nStr.peopleStatus, field: 4,width: 8}
					   		,   {name: i18nStr.birthDay,field:5, width: 8}
		        				,   {name: i18nStr.sex, field: 6,width: 8}
					       				,   {name: i18nStr.birthPlace, field: 7,width: 8}
					       				,   {name: i18nStr.address, field: 8,width: 8}
					       				,   {name: i18nStr.tel, field: 9,width: 8}
					       				,   {name: i18nStr.engageMode, field: 10,width: 8}
					   		,   {name: i18nStr.engageDate,field:11, width: 8}
		        				,   {name: i18nStr.gradeEnum, field: 12,width: 8}
					       			    ,   {name: i18nStr.remark, field: 13,width: 10 }
					 
                                        ] ]
                           }]; 
function pageStyle(style){//nomarl,col,noscroll
	grid.scrollToRow(0);
	if(style=="nomarl"){
		grid.setStructure(layoutSingleRow);
	}else if(style=="col"){
		grid.setStructure(layoutTwoRow);
	}else if(style=="noscroll"){
		grid.setStructure(layoutNoscroll);
	}
}						   
						   

//totleinum=12
  //rowinum=7
function getCheckPeoples(){}

var layoutTwoRow=[{
          
 //field????????¨°???js??toArray¡Á???querydate??
	   
				 cells: [
                      [
						{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
						//{ name: i18nStr.detail, width: 3, get: getCheckPeoples, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
										  											  {name: i18nStr.peopleName, field: 2 , width: 8 }
														  			//--------------  if (3 == 7)
														  											,   {name: i18nStr.peoplePassword, field: 3 , width: 8 }
														  			//--------------  if (4 == 7)
														  											,   {name: i18nStr.peopleStatus, field: 4 , width: 8 }
														  			//--------------  if (5 == 7)
														  					,   {name: i18nStr.birthDay,field:5, width: 8}
										
			  			//--------------  if (6 == 7)
														  											,   {name: i18nStr.sex, field: 6 , width: 8 }
														  			//--------------  if (7 == 7)
								//
												  																	,   {name: i18nStr.birthPlace, field: 7,width: 8}
																						  								]
												                     //----------------(inum:8)  (rowinum: 7)
									                     //----------------(inum:8)  (rowinum: 7)
									                     //----------------(inum:8)  (rowinum: 7)
									                     //----------------(inum:8)  (rowinum: 7)
									                     //----------------(inum:8)  (rowinum: 7)
									                     //----------------(inum:8)  (rowinum: 7)
									                     //----------------(inum:8)  (rowinum: 7)
								
		,[
	 //  22222222222inum= 2   inum2=8
																																							  													  {name: i18nStr.address, field: 8,width: 8 }
																  														  													,   {name: i18nStr.tel, field: 9,width: 8 }
																  														  													,   {name: i18nStr.engageMode, field: 10,width: 8 }
																  														  					,   {name: i18nStr.engageDate,field:11, width: 8}
								  														  													,   {name: i18nStr.gradeEnum, field: 12,width: 8 }
																  														  													,   {name: i18nStr.remark, field: 13,width: 10 }
																  														
	 	
			,   {name: ' ',value:' ' ,width: 10 }
		]]
                           }]; 						   
						   
						   

	 
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
		   querydata=dojoPeoples.PeoplesVOtoArray_fun(ul,false);
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
 
function init(){
  getVO(queryvo,pagenumber,pagesize,'0');
  //if(totalpage>1)dijit.byId("but7").setDisabled(false);
  
 	dojo.connect(dijit.byId("grid"), "dodblclick", function(e){
	   if(document.getElementById('queryDiv').style.display=='')document.getElementById('queryDiv').style.display='none';
	   if(document.getElementById('addDiv').style.display=='none')document.getElementById('addDiv').style.display='';
		 document.getElementById('erowIndex').value=e.rowIndex;
		 document.getElementById('PeoplesId').value=querydata[e.rowIndex][1];
		 	 									//enumeration ?¡§String??¨ª??
				dijit.byId("addpeopleName").setValue(querydata[e.rowIndex][2]);
						 									//enumeration ?¡§String??¨ª??
				dijit.byId("addpeoplePassword").setValue(querydata[e.rowIndex][3]);
						 									//enumeration ?¡§String??¨ª??
				dijit.byId("addpeopleStatus").setValue(querydata[e.rowIndex][4]);
						 									 dijit.byId("addbirthDay").setValue(dojo.date.locale.parse(querydata[e.rowIndex][5],{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
				 dijit.byId("addbirthDayTime").setValue(dojo.date.locale.parse(querydata[e.rowIndex][5],{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
						 									//enumeration ?¡§String??¨ª??
				dijit.byId("addsex").setValue(querydata[e.rowIndex][6]);
						 									//enumeration ?¡§String??¨ª??
				dijit.byId("addbirthPlace").setValue(querydata[e.rowIndex][7]);
						 									//enumeration ?¡§String??¨ª??
				dijit.byId("addaddress").setValue(querydata[e.rowIndex][8]);
						 									//enumeration ?¡§String??¨ª??
				dijit.byId("addtel").setValue(querydata[e.rowIndex][9]);
						 									//enumeration ?¡§String??¨ª??
				dijit.byId("addengageMode").setValue(querydata[e.rowIndex][10]);
						 									 dijit.byId("addengageDate").setValue(dojo.date.locale.parse(querydata[e.rowIndex][11],{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
				 dijit.byId("addengageDateTime").setValue(dojo.date.locale.parse(querydata[e.rowIndex][11],{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
						 									//enumeration ?¡§String??¨ª??
				dijit.byId("addgradeEnum").setValue(querydata[e.rowIndex][12]);
						 									//enumeration ?¡§String??¨ª??
				dijit.byId("addremark").setValue(querydata[e.rowIndex][13]);
						 			 
			});     
}

 dojo.addOnLoad(init);   

//addDiv---------------begin-------------------------------------
var addDivAdd = function(){
	 //if(document.getElementById('queryDiv').style.display=='')document.getElementById('queryDiv').style.display='none';
	 //if(document.getElementById('addDiv').style.display=='none')document.getElementById('addDiv').style.display='';
	 //add
										//enumeration ?¡§String??¨ª??
				
									dijit.byId("addpeopleName").setValue('');
																			//enumeration ?¡§String??¨ª??
				
									dijit.byId("addpeoplePassword").setValue('');
																			//enumeration ?¡§String??¨ª??
				
									dijit.byId("addpeopleStatus").setValue('');
																			dijit.byId("addbirthDay").setValue('');
				dijit.byId("addbirthDayTime").setValue('');
															//enumeration ?¡§String??¨ª??
				
									dijit.byId("addsex").setValue('');
																			//enumeration ?¡§String??¨ª??
				
									dijit.byId("addbirthPlace").setValue('');
																			//enumeration ?¡§String??¨ª??
				
									dijit.byId("addaddress").setValue('');
																			//enumeration ?¡§String??¨ª??
				
									dijit.byId("addtel").setValue('');
																			//enumeration ?¡§String??¨ª??
				
									dijit.byId("addengageMode").setValue('');
																			dijit.byId("addengageDate").setValue('');
				dijit.byId("addengageDateTime").setValue('');
															//enumeration ?¡§String??¨ª??
				
									//dijit.byId("addgradeEnum").setValue('');
																			//enumeration ?¡§String??¨ª??
				
									dijit.byId("addremark").setValue('');
														
		
	document.getElementById('PeoplesId').value='0';
	//document.getElementById('referTimeAdd1').value=dojo.date.locale.format(new Date(),{ datePattern: "yyyy-MM-dd", selector: "date"});
	//document.getElementById('referTimeAdd2').value=dojo.date.locale.format(new Date(),{ timePattern: "HH:mm", selector: "time"});
} 
function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new Object();
    vobject.id=document.getElementById('PeoplesId').value;
	var passAll=0;
										//enumeration ?¡§String??¨ª??
				if(dijit.byId("addpeopleName").validate(true)){
					vobject.peopleName=dijit.byId("addpeopleName").getValue();
				}else{
					setErrorClass(dijit.byId("addpeopleName")); passAll=1;
				}
															//enumeration ?¡§String??¨ª??
				if(dijit.byId("addpeoplePassword").validate(true)){
					vobject.peoplePassword=dijit.byId("addpeoplePassword").getValue();
				}else{
					setErrorClass(dijit.byId("addpeoplePassword")); passAll=1;
				}
															//enumeration ?¡§String??¨ª??
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
															//enumeration ?¡§String??¨ª??
				if(dijit.byId("addsex").validate(true)){
					vobject.sex=dijit.byId("addsex").getValue();
				}else{
					setErrorClass(dijit.byId("addsex")); passAll=1;
				}
															//enumeration ?¡§String??¨ª??
				if(dijit.byId("addbirthPlace").validate(true)){
					vobject.birthPlace=dijit.byId("addbirthPlace").getValue();
				}else{
					setErrorClass(dijit.byId("addbirthPlace")); passAll=1;
				}
															//enumeration ?¡§String??¨ª??
				if(dijit.byId("addaddress").validate(true)){
					vobject.address=dijit.byId("addaddress").getValue();
				}else{
					setErrorClass(dijit.byId("addaddress")); passAll=1;
				}
															//enumeration ?¡§String??¨ª??
				if(dijit.byId("addtel").validate(true)){
					vobject.tel=dijit.byId("addtel").getValue();
				}else{
					setErrorClass(dijit.byId("addtel")); passAll=1;
				}
															//enumeration ?¡§String??¨ª??
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
															//enumeration ?¡§String??¨ª??
				if(dijit.byId("addgradeEnum").validate(true)){
					vobject.gradeEnum=dijit.byId("addgradeEnum").getValue();
				}else{
					setErrorClass(dijit.byId("addgradeEnum")); passAll=1;
				}
															//enumeration ?¡§String??¨ª??
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
																					vobject.birthDay?addrow.push(vobject.birthDay.upDate):addrow.push('');
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
																					vobject.engageDate?addrow.push(vobject.engageDate.upDate):addrow.push('');
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
		grid.addRow(addrow ,grid.model.getRowCount());//grid.addRow([addrow]);
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
			   pdel.add('id',si);
               SOAPClient.invoke(url, "deletePeoples", pdel, false,  function GetEnu_callBack(ul, soapResponse){
               if(si>ii){
					if(si-1>=0){document.getElementById('erowIndex').value=si-1;}//else{document.getElementById('erowIndex').value='';}//????????????????????????????????//
               }
			   totalCount--;
               var totalpage=Math.ceil(new Number(totalCount)/pagesize);
               document.getElementById("rowCount").innerHTML = i18nStr.di+" "+pagenumber+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCount+" "+i18nStr.rowSize; 	
               if(si=ii){if(document.getElementById('addDiv').style.display=='')document.getElementById('addDiv').style.display='none';}
	        });   
          //}             
           dijit.byId("grid").removeSelectedRows();
      }
 }    
 
function adddis(){
	
	querydisplay("addDiv");
	if(document.getElementById('addDiv').style.display!='none')addDivAdd();
} 
//addDiv---------------end---------------------------------------	 
//totleinum=12
 //rowinum=4
 //addHeight=175
</script>
</head>	 
<body class="tundra">
	<div id="addDiv" style="margin:25px 0px 20px 0px;  height:175px; display:none;" >
		<div  class="titleDiv"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font i18n="addNote">add</font></div>
              <table align="center" width="100%" id="0" class="editorTable"  >
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
</table></div>
<div id="queryDiv" style="margin:25px 0px 20px 0px; height: 175px; display:none;" >
 <div  class="titleDiv"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font i18n="queryNote"></font></div>
  <table align="center" width=100% class="queryTable"  >
	<tr >
	<td align="center" style="{width:11%}"  >&nbsp;</td>
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
						<td align="left"  colspan="3"><span id="querybirthDayImg0"  ><input class="addDate"   jsId="querybirthDay" id="querybirthDay"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="addTime" jsId="querybirthDayTime" id="querybirthDayTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
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
						<td align="left"   colspan="5"><span id="queryengageDateImg0"  ><input class="addDate"   jsId="queryengageDate" id="queryengageDate"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="addTime" jsId="queryengageDateTime" id="queryengageDateTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
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

          <tr align="center"><td ></td>
           <td colspan="3"></td><td colspan="3" align="left"> <button dojoType="dijit.form.Button" onclick="querybutton();" iconClass="queryIcon"  i18n="query" >query</button>&nbsp;&nbsp;&nbsp;
           <button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="2"></td></tr>
         </table>
	     </div>
<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   Peoples List</b></td>
		<td align="right" >
				<button dojoType="dijit.form.Button" onclick="adddis();" iconClass="openDivIcon"  i18n="edit" >openAdd</button>&nbsp;
				<button dojoType="dijit.form.Button" onclick="querydis();" iconClass="openQueryIcon"  i18n="openQuery" >query</button>
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
  				 <div dojoType="dijit.MenuItem"  iconClass="rowIcon"		label="normal"	onClick="pageStyle(this.label);"></div>
  				 <div dojoType="dijit.MenuItem"  iconClass="colIcon"		label="col"	onClick="pageStyle(this.label);"></div>
				 <div dojoType="dijit.MenuItem"  iconClass="colIcon"		label="noscroll"	onClick="pageStyle(this.label);"></div>
		    </div></div>
			          	     <!--button dojoType="dijit.form.Button" onclick="addRow();" iconClass="addIcon" i18n="add" >add</button-->
					 <!--button dojoType="dijit.form.Button" onclick="addDivAdd();" iconClass="addIcon"  >add</button-->
	                 <!--button dojoType="dijit.form.Button" onclick="removeSelectedRowsGrid();" iconClass="delIcon" i18n="delete" >delete</button>
	                 <button dojoType="dijit.form.Button" id="but3" jsId="but3" onclick="call_funUpd();" i18n="save" iconClass="saveIcon">save</button-->
		</td>
	</tr>
</table>    
	    <div style="{height:90%;width:100%}"  >
	         <div id="grid"  dojoType="dojox.Grid" autoWidth="false"  jsId="grid"	model="model"  structure="layoutSingleRow" singleClickEdit="true" ></div>
      </div>      
    
			  
</body>
<script type="text/javascript">trans18tag();</script>
</html>		 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
