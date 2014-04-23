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
			dojo.require("projectDojo.Orderd");
     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 <script type="text/javascript" >
		var dojoOrderd= new  projectDojo.Orderd();
	    dojoOrderd.initOrderd();

</script>
	<script type="text/javascript" >
	//manageablePackageName=com.demo.entity.order.crud
	//packageName=com.demo.entity.order
	  var url = getUrl()+ "services/OrderdManageService";
	  var deletedata =  new Array();
	  var querydata =  new Array();
	  var pagenumber=1;
	  var pagesize=10;
	  var totalCount=0;
	  var queryvo=new Object();
	  var oddstyle='';
	  var model = new dojox.grid.data.Table(null, querydata);
	  var urle = getUrl()+ "services/BasicManageService";        

	function orderRowSet(id,value){
        	/*var itemselect=orderRowStore._getItemByIdentity(value);
        	if(itemselect!='undefined'&& itemselect!=null){
        	}*/
        }
	function customerSet(id,value){
        	/*var itemselect=customerStore._getItemByIdentity(value);
        	if(itemselect!='undefined'&& itemselect!=null){
        	}*/
        }
 
//ÏÈÅÐ¶Ï±íµÄ×Ö¶ÎÊýÊÇ·ñ´óÓÚ12£¬Èç¹û´óÓÚ12£¬ÔòÉú³Éµ¥ÐÐlayoutºÍÕÛµþlayoutÁ½¸östructure
//enumeration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
																																																																		
var layoutSingleRow=[{
          
 //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydateÖÐÈ¡Êý¾Ý
	   
				 cells: [ [
							{ name: '<img src="../image/addsmall.gif" onclick="addRow();"   height="18" width="18" border="0">&nbsp;&nbsp;&nbsp;<img src="../image/saveAll.jpg" onclick="call_funUpd();"   height="18" width="18" border="0">' ,get:function(inRowIndex) {return '<img src="../image/delsmall.gif" onclick="removeRows('+inRowIndex+','+querydata[inRowIndex][1]+');"  height="18" width="18" border="0">&nbsp;&nbsp;&nbsp;<img src="../image/savesmall.gif" onclick="call_funUpdSingle('+inRowIndex+');"  height="18" width="18" border="0">';}, width: 6,styles: 'text-align: center;'},//,headerStyles:mystyle
						   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
						   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
      					  {name: i18nStr.customerOrderNo, field: 2,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            					,   {name: i18nStr.contractNo, field: 3,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            	    ,   {name: i18nStr.conveyanceEnum, field: 4,width: 10 , editor: mydojo.FilteringSelect ,options:dojoOrderd.itemconveyanceEnumOption,required:true ,invalidMessage:'can not be empty'}
			        	    ,   {name: i18nStr.carryTypeEnum, field: 5,width: 10 , editor: mydojo.FilteringSelect ,options:dojoOrderd.itemcarryTypeEnumOption,required:false ,invalidMessage:'can not be empty'}
			        					,   {name: i18nStr.shipperRemark, field: 6,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            					,   {name: i18nStr.carrierRemark, field: 7,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            	    ,   {name: i18nStr.levelEnum, field: 8,width: 10 , editor: mydojo.FilteringSelect ,options:dojoOrderd.itemlevelEnumOption,required:false ,invalidMessage:'can not be empty'}
			        	    ,   {name: i18nStr.customerTypeEnum, field: 9,width: 10 , editor: mydojo.FilteringSelect ,options:dojoOrderd.itemcustomerTypeEnumOption,required:false ,invalidMessage:'can not be empty'}
			    		,   {name: i18nStr.referTime,field:10, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
				,   {name: i18nStr.referTimeTime,field:11, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
		        					,   {name: i18nStr.linkMan, field: 12,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            					,   {name: i18nStr.tel, field: 13,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					        		,   {name: i18nStr.bookTime,field:14, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
				,   {name: i18nStr.bookTimeTime,field:15, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
		    		,   {name: i18nStr.completeTime,field:16, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
				,   {name: i18nStr.completeTimeTime,field:17, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
		        				    ,   {name: i18nStr.remark, field: 18,width: 10, editor: dojox.grid.editors.Editor,required:false, editorToolbar: true  }
					      
//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
		//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
					 ,   {name: i18nStr.customer,field: 20,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][20]!=undefined && querydata[inRowIndex][20][2]){str=querydata[inRowIndex][20][2];strid=querydata[inRowIndex][20][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="dojoOrderd.selectCustomer('+strid+','+inRowIndex+',20,0,event);"  >';} ,width: 10 }
			                                        ] ]
                           }]; 

  //rowinum=9

function getCheckOrderd(){}

var layoutTwoRow=[{
          
 //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydateÖÐÈ¡Êý¾Ý
	   
				 cells: [
                      [
						{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
						{ name: i18nStr.detail, width: 3, get: getCheckOrderd, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
										  															  {name: i18nStr.customerOrderNo, field: 2,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  			//--------------  if (3 == 8)
														  															,   {name: i18nStr.contractNo, field: 3,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  			//--------------  if (4 == 8)
														  									,   {name: i18nStr.conveyanceEnum, field: 4,width: 10 , editor: mydojo.FilteringSelect ,options:dojoOrderd.itemconveyanceEnumOption,required:true ,invalidMessage:'can not be empty'}
												  			//--------------  if (5 == 8)
														  									,   {name: i18nStr.carryTypeEnum, field: 5,width: 10 , editor: mydojo.FilteringSelect ,options:dojoOrderd.itemcarryTypeEnumOption,required:false ,invalidMessage:'can not be empty'}
												  			//--------------  if (6 == 8)
														  															,   {name: i18nStr.shipperRemark, field: 6,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  			//--------------  if (7 == 8)
														  															,   {name: i18nStr.carrierRemark, field: 7,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  			//--------------  if (8 == 8)
								//
												  															,   {name: i18nStr.levelEnum, field: 8,width: 10 , editor: mydojo.FilteringSelect ,options:dojoOrderd.itemlevelEnumOption,required:false ,invalidMessage:'can not be empty'}
																				  								]
												                     //----------------(inum:9)  (rowinum: 8)
									                     //----------------(inum:9)  (rowinum: 8)
									                     //----------------(inum:9)  (rowinum: 8)
									                     //----------------(inum:9)  (rowinum: 8)
									                     //----------------(inum:9)  (rowinum: 8)
									                     //----------------(inum:9)  (rowinum: 8)
									                     //----------------(inum:9)  (rowinum: 8)
									                     //----------------(inum:9)  (rowinum: 8)
								
	//
		  //(9 > 8)
						//
		  //(9 > 8)
							,[
	 //  22222222222inum= 2   inum2=9
																																																																	  											  {name: i18nStr.customerTypeEnum, field: 9,width: 10 , editor: mydojo.FilteringSelect ,options:dojoOrderd.itemcustomerTypeEnumOption,required:false ,invalidMessage:'can not be empty'}
														  														  					,   {name: i18nStr.referTime,field:10, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
										,   {name: i18nStr.referTimeTime,field:11, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
								  														  																		,   {name: i18nStr.linkMan, field: 12,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																					  														  																		,   {name: i18nStr.tel, field: 13,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																					  														  					,   {name: i18nStr.bookTime,field:14, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
										,   {name: i18nStr.bookTimeTime,field:15, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
								  														  					,   {name: i18nStr.completeTime,field:16, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
										,   {name: i18nStr.completeTimeTime,field:17, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
								  														  																		,   {name: i18nStr.remark, field: 18,width: 10, editor: dojox.grid.editors.Editor,required:false, editorToolbar: true  }
																					  														
	//¶ÔÓÚ
											//¶ÔÓÚ
									 ,   {name: i18nStr.customer,field: 20,get:function(inRowIndex){ var str='';var strid;if(querydataOrderd[inRowIndex]!=undefined && querydataOrderd[inRowIndex][20]!=undefined && querydataOrderd[inRowIndex][20][1]!=undefined){str=querydataOrderd[inRowIndex][20][2];strid=querydataOrderd[inRowIndex][20][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="dojoOrderd.selectCustomer('+strid+','+inRowIndex+',20,0,event);"   >';} ,width: 10 }
										 	
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
               vobject.customerOrderNo=thisCell[2];
 
               vobject.contractNo=thisCell[3];
 
              if(dojox.validate.isText(thisCell[4], {minlength: 1})){vobject.conveyanceEnum=thisCell[4];
             }else{grid.getCell(grid.model.fieldArray[4]).getNode(saveRowIndex).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
               vobject.carryTypeEnum=thisCell[5];
 
               vobject.shipperRemark=thisCell[6];
 
               vobject.carrierRemark=thisCell[7];
 
               vobject.levelEnum=thisCell[8];
 
               vobject.customerTypeEnum=thisCell[9];
 
 var  d=new DateTimeQuery();
             if(thisCell[10] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[10], grid.getCell(grid.model.fieldArray[10]).constraint);
             }else{grid.getCell(grid.model.fieldArray[10]).getNode(saveRowIndex).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[11] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[11], grid.getCell(grid.model.fieldArray[11]).constraint);
             vobject.referTime=d;
             }else{grid.getCell(grid.model.fieldArray[11]).getNode(saveRowIndex).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null


               vobject.linkMan=thisCell[12];
 
               vobject.tel=thisCell[13];
 
 var  d=new DateTimeQuery();
             if(thisCell[14] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[14], grid.getCell(grid.model.fieldArray[14]).constraint);
             }else{grid.getCell(grid.model.fieldArray[14]).getNode(saveRowIndex).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[15] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[15], grid.getCell(grid.model.fieldArray[15]).constraint);
             vobject.bookTime=d;
             }else{grid.getCell(grid.model.fieldArray[15]).getNode(saveRowIndex).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null


 var  d=new DateTimeQuery();
             if(thisCell[16] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[16], grid.getCell(grid.model.fieldArray[16]).constraint);
             }else{grid.getCell(grid.model.fieldArray[16]).getNode(saveRowIndex).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[17] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[17], grid.getCell(grid.model.fieldArray[17]).constraint);
             vobject.completeTime=d;
             }else{grid.getCell(grid.model.fieldArray[17]).getNode(saveRowIndex).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null


               vobject.remark=thisCell[18];
 

						var manageable=new Object();
			 if(querydata[saveRowIndex][20]!=''&&querydata[saveRowIndex][20]!=undefined){
             manageable.id=querydata[saveRowIndex][20][1];
             vobject.customer=manageable;
			 }else{
			 grid.getCell(grid.model.fieldArray[20]).getNode(saveRowIndex).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
			


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('OrderdVO',vobject);
                SOAPClient.invoke(url, "createOrderd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                grid.model.setDatum(ul,saveRowIndex,1);
                });
	         }else{//modify row
                padd.add('OrderdVO',vobject);
                SOAPClient.invoke(url, "updateOrderd", padd, false,  function GetEnu_callBack(ul, soapResponse){
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
	          if(querycustomerOrderNo.getDisplayedValue()!="")queryvo.customerOrderNo=querycustomerOrderNo.getDisplayedValue();//
	          if(querycontractNo.getDisplayedValue()!="")queryvo.contractNo=querycontractNo.getDisplayedValue();//
	          if(queryconveyanceEnum.getDisplayedValue()!="")queryvo.conveyanceEnum=queryconveyanceEnum.getDisplayedValue();//
	          if(querycarryTypeEnum.getDisplayedValue()!="")queryvo.carryTypeEnum=querycarryTypeEnum.getDisplayedValue();//
	          if(queryshipperRemark.getDisplayedValue()!="")queryvo.shipperRemark=queryshipperRemark.getDisplayedValue();//
	          if(querycarrierRemark.getDisplayedValue()!="")queryvo.carrierRemark=querycarrierRemark.getDisplayedValue();//
	          if(querylevelEnum.getDisplayedValue()!="")queryvo.levelEnum=querylevelEnum.getDisplayedValue();//
	          if(querycustomerTypeEnum.getDisplayedValue()!="")queryvo.customerTypeEnum=querycustomerTypeEnum.getDisplayedValue();//
              d=queryDate_fun("referTime");
              if(d==null){validstate=1;}else if(d.upSign!="%"){queryvo.referTime=d;}
	          if(querylinkMan.getDisplayedValue()!="")queryvo.linkMan=querylinkMan.getDisplayedValue();//
	          if(querytel.getDisplayedValue()!="")queryvo.tel=querytel.getDisplayedValue();//
              d=queryDate_fun("bookTime");
              if(d==null){validstate=1;}else if(d.upSign!="%"){queryvo.bookTime=d;}
              d=queryDate_fun("completeTime");
              if(d==null){validstate=1;}else if(d.upSign!="%"){queryvo.completeTime=d;}
	          if(queryremark.getDisplayedValue()!="")queryvo.remark=queryremark.getDisplayedValue();//
			
	if(queryorderRow.getDisplayedValue()!=""){
				var orderRowQuery= new Object();
				//orderRowQuery.OrderdName=queryorderRow.getDisplayedValue();
				orderRowQuery.id=queryorderRow.getValue();
				queryvo.orderRow=orderRowQuery;
			  }
	if(querycustomer.getDisplayedValue()!=""){
				var customerQuery= new Object();
				//customerQuery.OrderdName=querycustomer.getDisplayedValue();
				customerQuery.id=querycustomer.getValue();
				queryvo.customer=customerQuery;
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
      pu.add('OrderdVO',queryvo) ;
      pu.add('pageNumber',pagenumber) ;
	    pu.add('pageSize',pagesize) ;
	    pu.add('orderBy',orderBy) ;
      SOAPClient.invoke(url,"getOrderd", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydata=new Array();
		   querydata=dojoOrderd.OrderdVOtoArray_fun(ul,true);
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
	 document.getElementById('OrderdId').value=querydata[e.rowIndex][1];
		 	 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addcustomerOrderNo").setValue(querydata[e.rowIndex][2]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addcontractNo").setValue(querydata[e.rowIndex][3]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addconveyanceEnum").setValue(querydata[e.rowIndex][4]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addcarryTypeEnum").setValue(querydata[e.rowIndex][5]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addshipperRemark").setValue(querydata[e.rowIndex][6]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addcarrierRemark").setValue(querydata[e.rowIndex][7]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addlevelEnum").setValue(querydata[e.rowIndex][8]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addcustomerTypeEnum").setValue(querydata[e.rowIndex][9]);
						 									 dijit.byId("addreferTime").setValue(querydata[e.rowIndex][10]);
				 				 dijit.byId("addreferTimeTime").setValue(querydata[e.rowIndex][11]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addlinkMan").setValue(querydata[e.rowIndex][12]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addtel").setValue(querydata[e.rowIndex][13]);
						 									 dijit.byId("addbookTime").setValue(querydata[e.rowIndex][14]);
				 				 dijit.byId("addbookTimeTime").setValue(querydata[e.rowIndex][15]);
						 									 dijit.byId("addcompleteTime").setValue(querydata[e.rowIndex][16]);
				 				 dijit.byId("addcompleteTimeTime").setValue(querydata[e.rowIndex][17]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addremark").setValue(querydata[e.rowIndex][18]);
						 			 
													dijit.byId("addcustomer").setValue(querydata[e.rowIndex][20][1]);
			//dijit.byId("addcustomer").setDisplayedValue('');
						
	 });  
}

 dojo.addOnLoad(init);   

	function selectOrderRowdFun(rep){
		querydata[dojoOrderd.selectOrderRowdInRow][dojoOrderd.noOrderRowd]=rep;
		grid.updateRow(dojoOrderd.selectOrderRowdInRow);		
	}
	function selectCustomerFun(rep){
		querydata[dojoOrderd.selectCustomerInRow][dojoOrderd.noCustomer]=rep;
		grid.updateRow(dojoOrderd.selectCustomerInRow);		
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
										//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				
									dijit.byId("addcustomerOrderNo").setValue('');
																			//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				
									dijit.byId("addcontractNo").setValue('');
																			//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				
									//dijit.byId("addconveyanceEnum").setValue('');
																			//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				
									//dijit.byId("addcarryTypeEnum").setValue('');
																			//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				
									dijit.byId("addshipperRemark").setValue('');
																			//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				
									dijit.byId("addcarrierRemark").setValue('');
																			//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				
									//dijit.byId("addlevelEnum").setValue('');
																			//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				
									//dijit.byId("addcustomerTypeEnum").setValue('');
																			dijit.byId("addreferTime").setValue('');
				dijit.byId("addreferTimeTime").setValue('');
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				
									dijit.byId("addlinkMan").setValue('');
																			//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				
									dijit.byId("addtel").setValue('');
																			dijit.byId("addbookTime").setValue('');
				dijit.byId("addbookTimeTime").setValue('');
															dijit.byId("addcompleteTime").setValue('');
				dijit.byId("addcompleteTimeTime").setValue('');
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				
									dijit.byId("addremark").setValue('');
														
								dijit.byId("addcustomer").setValue('');
	    dijit.byId("addcustomer").setDisplayedValue('');
				
	document.getElementById('OrderdId').value='0';
} 

function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new Object();
    vobject.id=document.getElementById('OrderdId').value;
	var passAll=0;
										//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addcustomerOrderNo").validate(true)){
					vobject.customerOrderNo=dijit.byId("addcustomerOrderNo").getValue();
				}else{
					setErrorClass(dijit.byId("addcustomerOrderNo")); passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addcontractNo").validate(true)){
					vobject.contractNo=dijit.byId("addcontractNo").getValue();
				}else{
					setErrorClass(dijit.byId("addcontractNo")); passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addconveyanceEnum").validate(true)){
					vobject.conveyanceEnum=dijit.byId("addconveyanceEnum").getValue();
				}else{
					setErrorClass(dijit.byId("addconveyanceEnum")); passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addcarryTypeEnum").validate(true)){
					vobject.carryTypeEnum=dijit.byId("addcarryTypeEnum").getValue();
				}else{
					setErrorClass(dijit.byId("addcarryTypeEnum")); passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addshipperRemark").validate(true)){
					vobject.shipperRemark=dijit.byId("addshipperRemark").getValue();
				}else{
					setErrorClass(dijit.byId("addshipperRemark")); passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addcarrierRemark").validate(true)){
					vobject.carrierRemark=dijit.byId("addcarrierRemark").getValue();
				}else{
					setErrorClass(dijit.byId("addcarrierRemark")); passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addlevelEnum").validate(true)){
					vobject.levelEnum=dijit.byId("addlevelEnum").getValue();
				}else{
					setErrorClass(dijit.byId("addlevelEnum")); passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addcustomerTypeEnum").validate(true)){
					vobject.customerTypeEnum=dijit.byId("addcustomerTypeEnum").getValue();
				}else{
					setErrorClass(dijit.byId("addcustomerTypeEnum")); passAll=1;
				}
															if(dijit.byId("addreferTime").validate(true)){ 
					if(dijit.byId("addreferTime").getValue()!=''&&dijit.byId("addreferTime").getValue()!=undefined){	
					if(dijit.byId("addreferTimeTime").validate(true)){
						if(dijit.byId("addreferTimeTime").getValue()==''||dijit.byId("addreferTimeTime").getValue()==undefined)dijit.byId("addreferTimeTime").setValue(new Date(2000,1,1,0,0,0,0));
						var dreferTime=new DateTimeQuery();
						dreferTime.upDate=dojo.date.locale.format(dijit.byId("addreferTime").getValue(), dijit.byId("addreferTime").constraints)+" "+dojo.date.locale.format(dijit.byId("addreferTimeTime").getValue(), dijit.byId("addreferTimeTime").constraints);
						vobject.referTime=dreferTime;
					}else{setErrorClass(dijit.byId("addreferTimeTime")); passAll=1;}
				}}else{
					setErrorClass(dijit.byId("addreferTime")); passAll=1;}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addlinkMan").validate(true)){
					vobject.linkMan=dijit.byId("addlinkMan").getValue();
				}else{
					setErrorClass(dijit.byId("addlinkMan")); passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addtel").validate(true)){
					vobject.tel=dijit.byId("addtel").getValue();
				}else{
					setErrorClass(dijit.byId("addtel")); passAll=1;
				}
															if(dijit.byId("addbookTime").validate(true)){ 
					if(dijit.byId("addbookTime").getValue()!=''&&dijit.byId("addbookTime").getValue()!=undefined){	
					if(dijit.byId("addbookTimeTime").validate(true)){
						if(dijit.byId("addbookTimeTime").getValue()==''||dijit.byId("addbookTimeTime").getValue()==undefined)dijit.byId("addbookTimeTime").setValue(new Date(2000,1,1,0,0,0,0));
						var dbookTime=new DateTimeQuery();
						dbookTime.upDate=dojo.date.locale.format(dijit.byId("addbookTime").getValue(), dijit.byId("addbookTime").constraints)+" "+dojo.date.locale.format(dijit.byId("addbookTimeTime").getValue(), dijit.byId("addbookTimeTime").constraints);
						vobject.bookTime=dbookTime;
					}else{setErrorClass(dijit.byId("addbookTimeTime")); passAll=1;}
				}}else{
					setErrorClass(dijit.byId("addbookTime")); passAll=1;}
															if(dijit.byId("addcompleteTime").validate(true)){ 
					if(dijit.byId("addcompleteTime").getValue()!=''&&dijit.byId("addcompleteTime").getValue()!=undefined){	
					if(dijit.byId("addcompleteTimeTime").validate(true)){
						if(dijit.byId("addcompleteTimeTime").getValue()==''||dijit.byId("addcompleteTimeTime").getValue()==undefined)dijit.byId("addcompleteTimeTime").setValue(new Date(2000,1,1,0,0,0,0));
						var dcompleteTime=new DateTimeQuery();
						dcompleteTime.upDate=dojo.date.locale.format(dijit.byId("addcompleteTime").getValue(), dijit.byId("addcompleteTime").constraints)+" "+dojo.date.locale.format(dijit.byId("addcompleteTimeTime").getValue(), dijit.byId("addcompleteTimeTime").constraints);
						vobject.completeTime=dcompleteTime;
					}else{setErrorClass(dijit.byId("addcompleteTimeTime")); passAll=1;}
				}}else{
					setErrorClass(dijit.byId("addcompleteTime")); passAll=1;}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addremark").validate(true)){
					vobject.remark=dijit.byId("addremark").getValue();
				}else{
					setErrorClass(dijit.byId("addremark")); passAll=1;
				}
										
			if(dijit.byId("addcustomer").validate(true)){
		//vobject.customer=dijit.byId("addcustomer").getValue();
		var manageable=new Object();
		manageable.id=dijit.byId("addcustomer").getValue();
		vobject.customer=manageable;
	}else{
		setErrorClass(dijit.byId("addcustomer")); passAll=1;
	}
		
if(passAll==0){
		//var addrow='';
		var addrow=[];
														//addrow=addrow+","+vobject.customerOrderNo;
					addrow.push(vobject.customerOrderNo);
																					//addrow=addrow+","+vobject.contractNo;
					addrow.push(vobject.contractNo);
																					//addrow=addrow+","+vobject.conveyanceEnum;
					addrow.push(vobject.conveyanceEnum);
																					//addrow=addrow+","+vobject.carryTypeEnum;
					addrow.push(vobject.carryTypeEnum);
																					//addrow=addrow+","+vobject.shipperRemark;
					addrow.push(vobject.shipperRemark);
																					//addrow=addrow+","+vobject.carrierRemark;
					addrow.push(vobject.carrierRemark);
																					//addrow=addrow+","+vobject.levelEnum;
					addrow.push(vobject.levelEnum);
																					//addrow=addrow+","+vobject.customerTypeEnum;
					addrow.push(vobject.customerTypeEnum);
																					if(vobject.referTime){
						addrow.push(dijit.byId("addreferTime").getValue());
						addrow.push(dijit.byId("addreferTimeTime").getValue());
					}else{addrow.push('');addrow.push('');}
																					//addrow=addrow+","+vobject.linkMan;
					addrow.push(vobject.linkMan);
																					//addrow=addrow+","+vobject.tel;
					addrow.push(vobject.tel);
																					if(vobject.bookTime){
						addrow.push(dijit.byId("addbookTime").getValue());
						addrow.push(dijit.byId("addbookTimeTime").getValue());
					}else{addrow.push('');addrow.push('');}
																					if(vobject.completeTime){
						addrow.push(dijit.byId("addcompleteTime").getValue());
						addrow.push(dijit.byId("addcompleteTimeTime").getValue());
					}else{addrow.push('');addrow.push('');}
																					//addrow=addrow+","+vobject.remark;
					addrow.push(vobject.remark);
																						addrow.push([false,'','']);
											//addrow=addrow+","+CustomerVOtoArray_fun(vobject.customer,true);//addrow.push(CustomerVOtoArray_fun(vobject.customer,true));
			addrow.push([false,addcustomer.getValue(),addcustomer.getDisplayedValue()]);
						 if(vobject.id==0){//create new row
		padd.add('OrderdVO',vobject);
		SOAPClient.invoke(url, "createOrderd", padd, false,  function GetEnu_callBack(ul, soapResponse){
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
		padd.add('OrderdVO',vobject);
		SOAPClient.invoke(url, "updateOrderd", padd, false,  function GetEnu_callBack(ul, soapResponse){
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
               SOAPClient.invoke(url, "deleteOrderd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
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
//totleinum=18
 //rowinum=6
 //addHeight=180
</script>
</head>	 
<body class="tundra">
		
<div id="queryDiv" style="margin-right: 0px;  height: 180px; display:none;" >
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
							<td align="right" i18n="customerOrderNo" >customerOrderNo:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="querycustomerOrderNo"  jsId="querycustomerOrderNo"   dojoType="dijit.form.TextBox"  />
													</td>
														<td align="right"  i18n="contractNo" >contractNo:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="querycontractNo"  jsId="querycontractNo"   dojoType="dijit.form.TextBox"  />
												</td>  
													<td align="right"  i18n="conveyanceEnum" >conveyanceEnum:</td>
						<td align="left"  >
													<input  id="queryconveyanceEnum" jsId="queryconveyanceEnum" class="editerInput"  dojoType="dijit.form.FilteringSelect" store="dojoOrderd.conveyanceEnumStore" />
												</td>  
										  </tr>
			                <tr>
							<td align="right" i18n="carryTypeEnum" >carryTypeEnum:</td>
						<td align="left"  >
						
														<input  id="querycarryTypeEnum"  jsId="querycarryTypeEnum" class="editerInput"  dojoType="dijit.form.FilteringSelect" store="dojoOrderd.carryTypeEnumStore" />
													</td>
														<td align="right"  i18n="shipperRemark" >shipperRemark:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="queryshipperRemark"  jsId="queryshipperRemark"   dojoType="dijit.form.TextBox"  />
												</td>  
													<td align="right"  i18n="carrierRemark" >carrierRemark:</td>
						<td align="left"  >
													<input type="text" class="editerInput"  id="querycarrierRemark"  jsId="querycarrierRemark"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			                <tr>
							<td align="right" i18n="levelEnum" >levelEnum:</td>
						<td align="left"  >
						
														<input  id="querylevelEnum"  jsId="querylevelEnum" class="editerInput"  dojoType="dijit.form.FilteringSelect" store="dojoOrderd.levelEnumStore" />
													</td>
														<td align="right"  i18n="customerTypeEnum" >customerTypeEnum:</td>
						<td align="left"  colspan="3" >
												<input  id="querycustomerTypeEnum" jsId="querycustomerTypeEnum" class="editerInput"  dojoType="dijit.form.FilteringSelect" store="dojoOrderd.customerTypeEnumStore" />
												</td>  
											<td align="right"  > </td>
						<td align="right"  ></td>
					</tr><tr >
						<td align="right"  i18n="referTime" >referTime:</td>
						<td align="left"  colspan="3"><span id="queryreferTimeImg0"  ><input class="editerDate"   jsId="queryreferTime" id="queryreferTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="queryreferTimeTime" id="queryreferTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="queryreferTimeImg1" style="{display:none}" ><input class="editerDateSmaller"   jsId="query1referTime" id="query1referTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query1referTimeTime" id="query1referTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryreferTimeImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryreferTimeImgdown" >></span>
							<span id="queryreferTimeImg2div" style="{display:none}"><input class="editerDateSmaller"   jsId="query2referTime" id="query2referTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query2referTimeTime" id="query2referTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="queryreferTimeImg" class="imgStyle">
							
						</td>
															<td align="right" colspan="2" ></td>
						<td align="right"  i18n="linkMan" >linkMan:</td>
						<td align="left"  >
							 								<input type="text" class="editerInput"  id="querylinkMan"  jsId="querylinkMan"   dojoType="dijit.form.TextBox"  />  
													</td></tr>
					                <tr>
							<td align="right" i18n="tel" >tel:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="querytel"  jsId="querytel"   dojoType="dijit.form.TextBox"  />
													</td>
																<td align="right"  i18n="bookTime" >bookTime:</td>
						<td align="left"   colspan="5"><span id="querybookTimeImg0"  ><input class="editerDate"   jsId="querybookTime" id="querybookTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="querybookTimeTime" id="querybookTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="querybookTimeImg1" style="{display:none}" ><input class="editerDateSmall"   jsId="query1bookTime" id="query1bookTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmall" jsId="query1bookTimeTime" id="query1bookTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querybookTimeImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querybookTimeImgdown" >></span>
							<span id="querybookTimeImg2div" style="{display:none}"><input class="editerDateSmall"   jsId="query2bookTime" id="query2bookTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmall" jsId="query2bookTimeTime" id="query2bookTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="querybookTimeImg" class="imgStyle">
						</td></tr>
			                <tr>
							<td align="right" i18n="completeTime"  >completeTime:</td> 
						<td align="left"  colspan="3"><span id="querycompleteTimeImg0"  ><input class="editerDate"   jsId="querycompleteTime" id="querycompleteTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="querycompleteTimeTime" id="querycompleteTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="querycompleteTimeImg1" style="{display:none}" ><input class="editerDateSmaller"   jsId="query1completeTime" id="query1completeTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query1completeTimeTime" id="query1completeTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querycompleteTimeImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querycompleteTimeImgdown" >></span>
							<span id="querycompleteTimeImg2div" style="{display:none}"><input class="editerDateSmaller"   jsId="query2completeTime" id="query2completeTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query2completeTimeTime" id="query2completeTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="querycompleteTimeImg" class="imgStyle">
						</td>
													<td align="right" colspan="2" ></td>
						<td align="right"  i18n="remark" >remark:</td>
						<td align="left"  >
							 								<input type="text" class="editerInput"  id="queryremark"  jsId="queryremark"   dojoType="dijit.form.TextBox"  />  
													</td></tr>
					<!--
//if (!="over" && 1!=1)     
/tr
//end 
//set ($inume =1) -->
			
					<tr><td align="right"  i18n="orderRow"  ></td>
					<td align="left" ><input  id="queryorderRow"  jsId="queryorderRow" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderd.orderRowStore"  /></td>  
					
				
					<td align="right"  i18n="customer"  ></td>
					<td align="left" colspan="3"  ><!----><input  id="querycustomer"  jsId="querycustomer" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderd.customerStore"  /></td>  
					
	    <td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybutton();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
	     </div>
<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   Orderd List</b></td>
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
<div id="Dlg"  style="width: 1000px;height:210px;display: none;" >
	<table align="center" width="100%" id="0" class="editorTableDialog"  >
                <tr >
				<td align="center" style="{width:11%}">&nbsp;</td>
                <td style="{width:22%}" ><input id="OrderdId" style="{display:none}"  type="text"  /></td>
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
				<td align="right" i18n="customerOrderNo" >customerOrderNo:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addcustomerOrderNo"  jsId="addcustomerOrderNo"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="contractNo" >contractNo:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addcontractNo"  jsId="addcontractNo"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="conveyanceEnum" >conveyanceEnum:</td>
			<td align="left"  >
									<input  id="addconveyanceEnum"  jsId="addconveyanceEnum" class="editerInput"  dojoType="dijit.form.myFilteringSelect" store="dojoOrderd.conveyanceEnumStore" required="true" />
							</td>
		</tr>	
                <tr>
				<td align="right" i18n="carryTypeEnum" >carryTypeEnum:</td>
			<td align="left"  >
									<input  id="addcarryTypeEnum"  jsId="addcarryTypeEnum" class="editerInput"  dojoType="dijit.form.myFilteringSelect" store="dojoOrderd.carryTypeEnumStore" required="false" />
							</td>
					<td align="right" i18n="shipperRemark" >shipperRemark:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addshipperRemark"  jsId="addshipperRemark"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="carrierRemark" >carrierRemark:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addcarrierRemark"  jsId="addcarrierRemark"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
		</tr>	
                <tr>
				<td align="right" i18n="levelEnum" >levelEnum:</td>
			<td align="left"  >
									<input  id="addlevelEnum"  jsId="addlevelEnum" class="editerInput"  dojoType="dijit.form.myFilteringSelect" store="dojoOrderd.levelEnumStore" required="false" />
							</td>
					<td align="right" i18n="customerTypeEnum" >customerTypeEnum:</td>
			<td align="left"  >
									<input  id="addcustomerTypeEnum"  jsId="addcustomerTypeEnum" class="editerInput"  dojoType="dijit.form.myFilteringSelect" store="dojoOrderd.customerTypeEnumStore" required="false" />
							</td>
					<td align="right" i18n="referTime"  >referTime:</td> 
			<td align="left" >
				<input class="addDate"   jsId="addreferTime" id="addreferTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox" required="false" />
				<input class="addTime" jsId="addreferTimeTime" id="addreferTimeTime"  dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}" >
			</td>
		</tr>	
                <tr>
				<td align="right" i18n="linkMan" >linkMan:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addlinkMan"  jsId="addlinkMan"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="tel" >tel:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addtel"  jsId="addtel"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="bookTime"  >bookTime:</td> 
			<td align="left" >
				<input class="addDate"   jsId="addbookTime" id="addbookTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox" required="true" />
				<input class="addTime" jsId="addbookTimeTime" id="addbookTimeTime"  dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}" >
			</td>
		</tr>	
                <tr>
				<td align="right" i18n="completeTime"  >completeTime:</td> 
			<td align="left" >
				<input class="addDate"   jsId="addcompleteTime" id="addcompleteTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox" required="false" />
				<input class="addTime" jsId="addcompleteTimeTime" id="addcompleteTimeTime"  dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"  >
			</td>
					<td align="right" i18n="remark" >remark:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addremark"  jsId="addremark"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
	
 <!--//if (3==1)     
//   /tr
//end

//set ($inume =1) -->
												<td align="right"  i18n="customer"  ></td>
					<td align="left" ><input  id="addcustomer"  jsId="addcustomer" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderd.customerStore" onchange="customerSet(0,arguments[0]);" required="true" /></td>
					</tr>
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
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
