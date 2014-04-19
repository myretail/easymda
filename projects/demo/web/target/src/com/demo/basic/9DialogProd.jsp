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
			dojo.require("projectDojo.Prod");
     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 <script type="text/javascript" >
		var dojoProd= new  projectDojo.Prod();
	    dojoProd.initProd();

</script>
	<script type="text/javascript" >
	//manageablePackageName=com.demo.entity.basic.crud
	//packageName=com.demo.entity.basic
	  var url = getUrl()+ "services/ProdManageService";
	  var deletedata =  new Array();
	  var querydata =  new Array();
	  var pagenumber=1;
	  var pagesize=10;
	  var totalCount=0;
	  var queryvo=new Object();
	  var oddstyle='';
	  var model = new dojox.grid.data.Table(null, querydata);
	  var urle = getUrl()+ "services/BasicManageService";        

	function prodCustSet(id,value){
        	/*var itemselect=prodCustStore._getItemByIdentity(value);
        	if(itemselect!='undefined'&& itemselect!=null){
        	}*/
        }
	function principalSet(id,value){
        	/*var itemselect=principalStore._getItemByIdentity(value);
        	if(itemselect!='undefined'&& itemselect!=null){
        	}*/
        }
 
//??????¡À¨ª??¡Á??????????¨®??12???????¨®??12???¨°?¨²??????layout??????layout????structure
//enumeration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
																											
var layoutSingleRow=[{
          
 //?¨´??field???????????????????¨°????js????toArray¡Á??????¡§??????querydate????????
	   
				 cells: [ [
							{ name: '<img src="../image/addsmall.gif" onclick="addRow();"   height="18" width="18" border="0">&nbsp;&nbsp;&nbsp;<img src="../image/saveAll.jpg" onclick="call_funUpd();"   height="18" width="18" border="0">' ,get:function(inRowIndex) {return '<img src="../image/delsmall.gif" onclick="removeRows('+inRowIndex+','+querydata[inRowIndex][1]+');"  height="18" width="18" border="0">&nbsp;&nbsp;&nbsp;<img src="../image/savesmall.gif" onclick="call_funUpdSingle('+inRowIndex+');"  height="18" width="18" border="0">';}, width: 6,styles: 'text-align: center;'},//,headerStyles:mystyle
						   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
						   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
      					  {name: i18nStr.prodName, field: 2,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
					            					,   {name: i18nStr.code, field: 3,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					                 ,  {name: i18nStr.price,field:4, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		    		,   {name: i18nStr.datef,field:5, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
				,   {name: i18nStr.datefTime,field:6, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
		        					,   {name: i18nStr.prodType, field: 7,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					      
//??????¡À¨ª???¨ª????????
					 ,   {name: i18nStr.prodCust,field: 8,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][8]!=undefined && querydata[inRowIndex][8][2]){str=querydata[inRowIndex][8][2];strid=querydata[inRowIndex][8][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="dojoProd.selectCustomer('+strid+','+inRowIndex+',8,0,event);"  >';} ,width: 10 }
			//??????¡À¨ª???¨ª????????
					 ,   {name: i18nStr.principal,field: 9,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][9]!=undefined && querydata[inRowIndex][9][2]){str=querydata[inRowIndex][9][2];strid=querydata[inRowIndex][9][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="dojoProd.selectPeoples('+strid+','+inRowIndex+',9,0,event);"  >';} ,width: 10 }
			                                        ] ]
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
              if(dojox.validate.isText(thisCell[2], {minlength: 1})){vobject.prodName=thisCell[2];
             }else{grid.getCell(grid.model.fieldArray[2]).getNode(saveRowIndex).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
               vobject.code=thisCell[3];
 
             if(dojox.validate.isInRange(thisCell[4],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[4];vobject.price=n;
             }else{grid.getCell(grid.model.fieldArray[4]).getNode(saveRowIndex).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

 var  d=new DateTimeQuery();
             if(thisCell[5] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[5], grid.getCell(grid.model.fieldArray[5]).constraint);
             }else{grid.getCell(grid.model.fieldArray[5]).getNode(saveRowIndex).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[6] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[6], grid.getCell(grid.model.fieldArray[6]).constraint);
             vobject.datef=d;
             }else{grid.getCell(grid.model.fieldArray[6]).getNode(saveRowIndex).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null


               vobject.prodType=thisCell[7];
 

				var manageable=new Object();
			 if(querydata[saveRowIndex][8]!=''&&querydata[saveRowIndex][8]!=undefined){
             manageable.id=querydata[saveRowIndex][8][1];
             vobject.prodCust=manageable;
			 }else{
			 grid.getCell(grid.model.fieldArray[8]).getNode(saveRowIndex).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
							var manageable=new Object();
			 if(querydata[saveRowIndex][9]!=''&&querydata[saveRowIndex][9]!=undefined){
             manageable.id=querydata[saveRowIndex][9][1];
             vobject.principal=manageable;
			 }else{
			 grid.getCell(grid.model.fieldArray[9]).getNode(saveRowIndex).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
			


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('ProdVO',vobject);
                SOAPClient.invoke(url, "createProd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                grid.model.setDatum(ul,saveRowIndex,1);
                });
	         }else{//modify row
                padd.add('ProdVO',vobject);
                SOAPClient.invoke(url, "updateProd", padd, false,  function GetEnu_callBack(ul, soapResponse){
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
	          if(queryprodName.getDisplayedValue()!="")queryvo.prodName=queryprodName.getDisplayedValue();//
	          if(querycode.getDisplayedValue()!="")queryvo.code=querycode.getDisplayedValue();//
              n=queryNumber_fun("price");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvo.price=n;}  
              d=queryDate_fun("datef");
              if(d==null){validstate=1;}else if(d.upSign!="%"){queryvo.datef=d;}
	          if(queryprodType.getDisplayedValue()!="")queryvo.prodType=queryprodType.getDisplayedValue();//
			
	if(queryprodCust.getDisplayedValue()!=""){
				var prodCustQuery= new Object();
				//prodCustQuery.ProdName=queryprodCust.getDisplayedValue();
				prodCustQuery.id=queryprodCust.getValue();
				queryvo.prodCust=prodCustQuery;
			  }
	if(queryprincipal.getDisplayedValue()!=""){
				var principalQuery= new Object();
				//principalQuery.ProdName=queryprincipal.getDisplayedValue();
				principalQuery.id=queryprincipal.getValue();
				queryvo.principal=principalQuery;
			  }

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
      pu.add('ProdVO',queryvo) ;
      pu.add('pageNumber',pagenumber) ;
	    pu.add('pageSize',pagesize) ;
	    pu.add('orderBy',orderBy) ;
      SOAPClient.invoke(url,"getProd", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydata=new Array();
		   querydata=dojoProd.ProdVOtoArray_fun(ul,true);
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
	 document.getElementById('ProdId').value=querydata[e.rowIndex][1];
		 	 									//enumeration ?????¡§??String?¨¤?????¨ª??
				dijit.byId("addprodName").setValue(querydata[e.rowIndex][2]);
						 									//enumeration ?????¡§??String?¨¤?????¨ª??
				dijit.byId("addcode").setValue(querydata[e.rowIndex][3]);
						 									//enumeration ?????¡§??String?¨¤?????¨ª??
				dijit.byId("addprice").setValue(querydata[e.rowIndex][4]);
						 									 dijit.byId("adddatef").setValue(querydata[e.rowIndex][5]);
				 				 dijit.byId("adddatefTime").setValue(querydata[e.rowIndex][6]);
						 									//enumeration ?????¡§??String?¨¤?????¨ª??
				dijit.byId("addprodType").setValue(querydata[e.rowIndex][7]);
						 			 
								dijit.byId("addprodCust").setValue(querydata[e.rowIndex][8][1]);
			//dijit.byId("addprodCust").setDisplayedValue('');
											dijit.byId("addprincipal").setValue(querydata[e.rowIndex][9][1]);
			//dijit.byId("addprincipal").setDisplayedValue('');
						
	 });  
}

 dojo.addOnLoad(init);   

	function selectCustomerFun(rep){
		querydata[dojoProd.selectCustomerInRow][dojoProd.noCustomer]=rep;
		grid.updateRow(dojoProd.selectCustomerInRow);		
	}
	function selectPeoplesFun(rep){
		querydata[dojoProd.selectPeoplesInRow][dojoProd.noPeoples]=rep;
		grid.updateRow(dojoProd.selectPeoplesInRow);		
	}
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
										//enumeration ?????¡§??String?¨¤?????¨ª??
				
									dijit.byId("addprodName").setValue('');
																			//enumeration ?????¡§??String?¨¤?????¨ª??
				
									dijit.byId("addcode").setValue('');
																			//enumeration ?????¡§??String?¨¤?????¨ª??
				
									dijit.byId("addprice").setValue('');
																			dijit.byId("adddatef").setValue('');
				dijit.byId("adddatefTime").setValue('');
															//enumeration ?????¡§??String?¨¤?????¨ª??
				
									dijit.byId("addprodType").setValue('');
														
					dijit.byId("addprodCust").setValue('');
	    dijit.byId("addprodCust").setDisplayedValue('');
							dijit.byId("addprincipal").setValue('');
	    dijit.byId("addprincipal").setDisplayedValue('');
				
	document.getElementById('ProdId').value='0';
} 

function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new Object();
    vobject.id=document.getElementById('ProdId').value;
	var passAll=0;
										//enumeration ?????¡§??String?¨¤?????¨ª??
				if(dijit.byId("addprodName").validate(true)){
					vobject.prodName=dijit.byId("addprodName").getValue();
				}else{
					setErrorClass(dijit.byId("addprodName")); passAll=1;
				}
															//enumeration ?????¡§??String?¨¤?????¨ª??
				if(dijit.byId("addcode").validate(true)){
					vobject.code=dijit.byId("addcode").getValue();
				}else{
					setErrorClass(dijit.byId("addcode")); passAll=1;
				}
															if(dijit.byId("addprice").validate(true)){
					var nprice=new NumberQuery();
					nprice.upNumber=dijit.byId("addprice").getValue();
					vobject.price=nprice;
				}else{
					setErrorClass(dijit.byId("addprice")); passAll=1;
				}
															if(dijit.byId("adddatef").validate(true)){ 
					if(dijit.byId("adddatef").getValue()!=''&&dijit.byId("adddatef").getValue()!=undefined){	
					if(dijit.byId("adddatefTime").validate(true)){
						if(dijit.byId("adddatefTime").getValue()==''||dijit.byId("adddatefTime").getValue()==undefined)dijit.byId("adddatefTime").setValue(new Date(2000,1,1,0,0,0,0));
						var ddatef=new DateTimeQuery();
						ddatef.upDate=dojo.date.locale.format(dijit.byId("adddatef").getValue(), dijit.byId("adddatef").constraints)+" "+dojo.date.locale.format(dijit.byId("adddatefTime").getValue(), dijit.byId("adddatefTime").constraints);
						vobject.datef=ddatef;
					}else{setErrorClass(dijit.byId("adddatefTime")); passAll=1;}
				}}else{
					setErrorClass(dijit.byId("adddatef")); passAll=1;}
															//enumeration ?????¡§??String?¨¤?????¨ª??
				if(dijit.byId("addprodType").validate(true)){
					vobject.prodType=dijit.byId("addprodType").getValue();
				}else{
					setErrorClass(dijit.byId("addprodType")); passAll=1;
				}
										
		if(dijit.byId("addprodCust").validate(true)){
		//vobject.prodCust=dijit.byId("addprodCust").getValue();
		var manageable=new Object();
		manageable.id=dijit.byId("addprodCust").getValue();
		vobject.prodCust=manageable;
	}else{
		setErrorClass(dijit.byId("addprodCust")); passAll=1;
	}
			if(dijit.byId("addprincipal").validate(true)){
		//vobject.principal=dijit.byId("addprincipal").getValue();
		var manageable=new Object();
		manageable.id=dijit.byId("addprincipal").getValue();
		vobject.principal=manageable;
	}else{
		setErrorClass(dijit.byId("addprincipal")); passAll=1;
	}
		
if(passAll==0){
		//var addrow='';
		var addrow=[];
														//addrow=addrow+","+vobject.prodName;
					addrow.push(vobject.prodName);
																					//addrow=addrow+","+vobject.code;
					addrow.push(vobject.code);
																					isNaN(vobject.price.upNumber)?addrow.push(0):addrow.push(vobject.price.upNumber);
																					if(vobject.datef){
						addrow.push(dijit.byId("adddatef").getValue());
						addrow.push(dijit.byId("adddatefTime").getValue());
					}else{addrow.push('');addrow.push('');}
																					//addrow=addrow+","+vobject.prodType;
					addrow.push(vobject.prodType);
																						//addrow=addrow+","+CustomerVOtoArray_fun(vobject.prodCust,true);//addrow.push(CustomerVOtoArray_fun(vobject.prodCust,true));
			addrow.push([false,addprodCust.getValue(),addprodCust.getDisplayedValue()]);
											//addrow=addrow+","+PeoplesVOtoArray_fun(vobject.principal,true);//addrow.push(PeoplesVOtoArray_fun(vobject.principal,true));
			addrow.push([false,addprincipal.getValue(),addprincipal.getDisplayedValue()]);
						 if(vobject.id==0){//create new row
		padd.add('ProdVO',vobject);
		SOAPClient.invoke(url, "createProd", padd, false,  function GetEnu_callBack(ul, soapResponse){
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
		padd.add('ProdVO',vobject);
		SOAPClient.invoke(url, "updateProd", padd, false,  function GetEnu_callBack(ul, soapResponse){
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
               SOAPClient.invoke(url, "deleteProd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
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
//totleinum=8
 //rowinum=2
 //addHeight=120
</script>
</head>	 
<body class="tundra">
		
<div id="queryDiv" style="margin-right: 0px;  height: 120px; display:none;" >
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
							<td align="right" i18n="prodName" >prodName:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryprodName"  jsId="queryprodName"   dojoType="dijit.form.TextBox"  />
													</td>
														<td align="right"  i18n="code" >code:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="querycode"  jsId="querycode"   dojoType="dijit.form.TextBox"  />
												</td>  
											<td align="right"  i18n="price" >price:</td>
						<td align="left"  >
							<span id="querypriceImg0"  ><input type="text" class="editerNumber" jsId="queryprice"  id="queryprice"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="querypriceImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="queryprice1"  id="queryprice1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querypriceImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querypriceImgdown" >></span>
							<span id="querypriceImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="queryprice2"  id="queryprice2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/nStart.gif" onclick="queryType(this);" id="querypriceImg" class="imgStyle">
							
						</td>  
								  </tr>
			                <tr>
							<td align="right" i18n="datef"  >datef:</td> 
						<td align="left"  colspan="3"><span id="querydatefImg0"  ><input class="editerDate"   jsId="querydatef" id="querydatef"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="querydatefTime" id="querydatefTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="querydatefImg1" style="{display:none}" ><input class="editerDateSmaller"   jsId="query1datef" id="query1datef"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query1datefTime" id="query1datefTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querydatefImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querydatefImgdown" >></span>
							<span id="querydatefImg2div" style="{display:none}"><input class="editerDateSmaller"   jsId="query2datef" id="query2datef"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query2datefTime" id="query2datefTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="querydatefImg" class="imgStyle">
						</td>
													<td align="right" colspan="2" ></td>
						<td align="right"  i18n="prodType" >prodType:</td>
						<td align="left"  >
							 								<input type="text" class="editerInput"  id="queryprodType"  jsId="queryprodType"   dojoType="dijit.form.TextBox"  />  
													</td></tr>
					<!--
//if (!="over" && 1!=1)     
/tr
//end 
//set ($inume =1) -->
			
					<tr><td align="right"  i18n="prodCust"  ></td>
					<td align="left" ><input  id="queryprodCust"  jsId="queryprodCust" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoProd.prodCustStore"  /></td>  
					
				
					<td align="right"  i18n="principal"  ></td>
					<td align="left" colspan="3"  ><!----><input  id="queryprincipal"  jsId="queryprincipal" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoProd.principalStore"  /></td>  
					
	    <td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybutton();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
	     </div>
<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   Prod List</b></td>
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
<div id="Dlg"  style="width: 1000px;height:150px;display: none;" >
	<table align="center" width="100%" id="0" class="editorTableDialog"  >
                <tr >
				<td align="center" style="{width:11%}">&nbsp;</td>
                <td style="{width:22%}" ><input id="ProdId" style="{display:none}"  type="text"  /></td>
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
				<td align="right" i18n="prodName" >prodName:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addprodName"  jsId="addprodName"   dojoType="dijit.form.ValidationTextBox" required="true" />
							</td>
					<td align="right" i18n="code" >code:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addcode"  jsId="addcode"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="price" >price:</td>
			<td align="left"  >
							<input type="text" class="editerNumber"   jsId="addprice"  id="addprice"  dojoType="mydojo.NumberTextBox" constraints="{min:0,max:9999999,places:4 }" />
			</td>
		</tr>	
                <tr>
				<td align="right" i18n="datef"  >datef:</td> 
			<td align="left" >
				<input class="addDate"   jsId="adddatef" id="adddatef"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox" required="false" />
				<input class="addTime" jsId="adddatefTime" id="adddatefTime"  dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"  >
			</td>
					<td align="right" i18n="prodType" >prodType:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addprodType"  jsId="addprodType"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
	
 <!--//if (3==1)     
//   /tr
//end

//set ($inume =1) -->
								<td align="right"  i18n="prodCust"  ></td>
					<td align="left" ><input  id="addprodCust"  jsId="addprodCust" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoProd.prodCustStore" onchange="prodCustSet(0,arguments[0]);" required="true" /></td>
					</tr>
														<tr><td align="right"  i18n="principal"  ></td>
					<td align="left" ><input  id="addprincipal"  jsId="addprincipal" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoProd.principalStore" onchange="principalSet(0,arguments[0]);" required="true"/></td>  
						    <td align="right"    ></td><td align="right"    ></td><td align="right"    ></td><td align="right"    ></td></tr>
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
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
