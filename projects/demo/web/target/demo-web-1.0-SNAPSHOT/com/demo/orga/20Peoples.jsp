<%
String peopleId = request.getParameter("peopleId");
%>
<html>
<!--Ò»Ô¶à£¬Ö»Ò»Ò»Ó±í£¬Ã»Ð¿Ò»Ô¶Ó±var dataChild=querydataPeoples[inRowIndex]-->
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
	//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
							 var dojoProd= new  projectDojo.Prod();
			dojoProd.initProd();
				//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
							 var dojoOrgaPeoples= new  projectDojo.OrgaPeoples();
			dojoOrgaPeoples.initOrgaPeoples();
			</script>
	 	 	<script type="text/javascript" >
	  var urlPeoples = getUrl()+ "services/PeoplesManageService";
	  var deletedataPeoples =  new Array();
	  var querydataPeoples =  new Array();
	  var pagenumberPeoples=1;
	  var totalCountPeoples=0;
	  var pagesizePeoples=10;
	  var orderByPeoples='0';
	  var queryvoPeoples=new Object();
	  var oddstyle='';
	  var modelPeoples = new dojox.grid.data.Table(null, querydataPeoples);
	  var urle = getUrl()+ "services/BasicManageService";
	  var modelPeoplesDetail;
	  var modelPeoplesChild;
	  

																																																					                  // totleinum = 14 
 //		(14 >= 12)
	  //rowinum=8
			var mainLayout =[{//?????????colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
						{ name: i18nStr.detail, width: 3, get: getCheckPeoples, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				//---------------------------------------------------------------------//rowinum=9   inum=2
					  			  ////////////////////////////////////////
			    											  {name: i18nStr.peopleName, field: 2,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
																		  			//--------------  if (3 == 9)
						//---------------------------------------------------------------------//rowinum=9   inum=3
					  			  ////////////////////////////////////////
			    											,   {name: i18nStr.peoplePassword, field: 3,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  			//--------------  if (4 == 9)
						//---------------------------------------------------------------------//rowinum=9   inum=4
					  			  ////////////////////////////////////////
			    											,   {name: i18nStr.peopleStatus, field: 4,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  			//--------------  if (5 == 9)
						//---------------------------------------------------------------------//rowinum=9   inum=5
					  					,   {name: i18nStr.birthDay,field:5, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
														 ,   {name: i18nStr.birthDayTime,field:6, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
					 							  			//--------------  if (7 == 9)
						//---------------------------------------------------------------------//rowinum=9   inum=7
		//
												  					    				
															,   {name: i18nStr.sex, field: 7,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
																										  								],[
													//---------------------------------------------------------------------//rowinum=9   inum=8
		                     //----------------(inum:8)  (rowinum: 9)
			//delete1
			 			  ////////////////////////////////////////
			    											  {name: i18nStr.birthPlace, field: 8,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  						//---------------------------------------------------------------------//rowinum=9   inum=9
		                     //----------------(inum:9)  (rowinum: 9)
			//delete1
			 			  ////////////////////////////////////////
			    											,   {name: i18nStr.address, field: 9,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  						//---------------------------------------------------------------------//rowinum=9   inum=10
		                     //----------------(inum:10)  (rowinum: 9)
			//delete1
			 			  ////////////////////////////////////////
			    											,   {name: i18nStr.tel, field: 10,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  						//---------------------------------------------------------------------//rowinum=9   inum=11
		                     //----------------(inum:11)  (rowinum: 9)
			//delete1
			 			  ////////////////////////////////////////
			    											,   {name: i18nStr.engageMode, field: 11,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  						//---------------------------------------------------------------------//rowinum=9   inum=12
		                     //----------------(inum:12)  (rowinum: 9)
			//delete1
			 					,   {name: i18nStr.engageDate,field:12, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
										,   {name: i18nStr.engageDateTime,field:13, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
					 			  						//---------------------------------------------------------------------//rowinum=9   inum=14
		                     //----------------(inum:14)  (rowinum: 9)
			//delete1
			 			  ////////////////////////////////////////
			    					,   {name: i18nStr.gradeEnum, field: 14,width: 10 , editor: mydojo.FilteringSelect ,options:dojoPeoples.itemgradeEnumOption,required:false ,invalidMessage:'can not be empty'}
												  						//---------------------------------------------------------------------//rowinum=9   inum=15
		                     //----------------(inum:15)  (rowinum: 9)
			//delete1
			 			  ////////////////////////////////////////
			    											,   {name: i18nStr.remark, field: 15,width: 10, editor: dojox.grid.editors.Editor,required:false, editorToolbar: true  }
																		  							
				,   {name: ' ',colSpan: 1 ,value:' ' ,width: 10 }
			
	
],[
				{ name: '\u8be6\u7ec6', colSpan: 9 ,styles: 'padding: 0; margin: 0;', get: getDetailPeoples }//value: '<div style="height:0px; background-color: white;"></div>'
			  ]
		  ]

		}];	 


var detailRowsPeoples=[];
function onBeforeRow(inDataIndex, inRow) {	if (inRow[2]!=undefined)inRow[2].hidden = !detailRowsPeoples[inDataIndex];}	
function togglePeoples(inIndex, inShow) {
        			//if (!inShow) destroySubGridIdGeneral('',querydataPeoples[inIndex][1],"PeoplesMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataPeoples[inIndex][1],"PeoplesChild");
				    detailRowsPeoples[inIndex] = inShow;
				    dijit.byId("gridPeoples").updateRow(inIndex); 
				    
    } 

function getCheckPeoples(inRowIndex) {
	var image = (detailRowsPeoples[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsPeoples[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="togglePeoples(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}

function getDetailPeoples(inRowIndex){
	if(detailRowsPeoples[inRowIndex]){
		var cell = this;
		setTimeout(function() { buildSubgridPeoples(inRowIndex, cell); }, 0);  }
		var h =0;
		if(detailRowsPeoples[inRowIndex]&&querydataPeoples[inRowIndex][$childRow]!=undefined &&querydataPeoples[inRowIndex][$childRow].length>0){
							h=65+25*querydataPeoples[inRowIndex][$childRow].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}

//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}
var childRow= ${childRow};
var layoutInRowIndex;	  



var addrow=[];
				
addrow.splice(0,0,false,0);




function buildSubgridPeoples(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)Ç¸idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		//var child = inCell.getNode(inRowIndex).lastChild;
		//var idmainDetail = makeSubGridIdGeneral('',querydataPeoples[inRowIndex][1],"PeoplesMainDetail");//makeSubgridIdMainDetail(querydataPeoples[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataPeoples[inRowIndex][1],"PeoplesChild");
		//var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataPeoples[inRowIndex][$childRow];
		if(dataChild!=undefined){
			if (subGridChild){
				subGridChild.model.setData(dataChild);
				child.appendChild(subGridChild.domNode);
			}else{
				modelPeoplesChild=new dojox.grid.data.Table(null, dataChild);
				var childProps= {
								autoHeight: true, 
								autoRender: false,
								rowCount:dataChild.length,
								model:modelPeoplesChild,							};
				childProps.dataRow = inRowIndex;
				childProps.id = idchild;
				if(Math.ceil(inRowIndex/2)>inRowIndex/2){
					childLayoutOdd=buildChildLayout(pre,headerstyleodd,inRowIndex);	
					childProps.structure=childLayoutOdd;
				}else{
					childLayout=buildChildLayout(pre,headerstyle,inRowIndex);
					childProps.structure=childLayout;
				}
				subGridChild = new dojox.Grid(childProps, child);//gridÎªÇ¶×±Ê±Ô¶DIVÄ´Ð¡
			}
			if (subGridChild) {
				subGridChild.render();
				subGridChild.cacheHeight = subGridChild.domNode.offsetHeight;
			}	      				
		}
		
		/*var detailDate=[];
		detailDate[0]=querydataPeoples[inRowIndex];  
	    modelPeoplesDetail=new dojox.grid.data.Table(null, detailDate);
		if (subGridMainDetail) {
			subGridMainDetail.model.setData(detailDate);
			mainDetail.appendChild(subGridMainDetail.domNode);
		} else {
			var mainDetailProps = {
				rowCount: 1, 
				autoHeight: true, 
				autoRender: false,
				model:modelPeoplesDetail
				};
				mainDetailProps.dataRow = inRowIndex;
				mainDetailProps.id = idmainDetail;//	tasksubGridProps.widgetId = id;
				if(Math.ceil(inRowIndex/2)>inRowIndex/2){
					mainDetailProps.structure=mainDetailLayoutOdd;
				}else{
					mainDetailProps.structure=mainDetailLayout;
				}
				subGridMainDetail = new dojox.Grid(mainDetailProps, mainDetail );
		}
			
		if (subGridMainDetail) {
				subGridMainDetail.render();
				subGridMainDetail.cacheHeight = subGridMainDetail.domNode.offsetHeight;
			}*/	
		inCell.grid.rowHeightChanged(inRowIndex);
    }   
}
//var childLayout=//???????????????????????????????/ Ö±É£jshtml

function querybuttonPeoples(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvoPeoples=new Object();
	          if(queryPeoplespeopleName.getDisplayedValue()!="")queryvoPeoples.peopleName=queryPeoplespeopleName.getDisplayedValue();//
	          if(queryPeoplespeoplePassword.getDisplayedValue()!="")queryvoPeoples.peoplePassword=queryPeoplespeoplePassword.getDisplayedValue();//
	          if(queryPeoplespeopleStatus.getDisplayedValue()!="")queryvoPeoples.peopleStatus=queryPeoplespeopleStatus.getDisplayedValue();//
              d=queryDate_fun("PeoplesbirthDay");
              if(d==null){validstate=1;}else if(d.upSign!="%"){queryvoPeoples.birthDay=d;}
	          if(queryPeoplessex.getDisplayedValue()!="")queryvoPeoples.sex=queryPeoplessex.getDisplayedValue();//
	          if(queryPeoplesbirthPlace.getDisplayedValue()!="")queryvoPeoples.birthPlace=queryPeoplesbirthPlace.getDisplayedValue();//
	          if(queryPeoplesaddress.getDisplayedValue()!="")queryvoPeoples.address=queryPeoplesaddress.getDisplayedValue();//
	          if(queryPeoplestel.getDisplayedValue()!="")queryvoPeoples.tel=queryPeoplestel.getDisplayedValue();//
	          if(queryPeoplesengageMode.getDisplayedValue()!="")queryvoPeoples.engageMode=queryPeoplesengageMode.getDisplayedValue();//
              d=queryDate_fun("PeoplesengageDate");
              if(d==null){validstate=1;}else if(d.upSign!="%"){queryvoPeoples.engageDate=d;}
	          if(queryPeoplesgradeEnum.getDisplayedValue()!="")queryvoPeoples.gradeEnum=queryPeoplesgradeEnum.getDisplayedValue();//
	          if(queryPeoplesremark.getDisplayedValue()!="")queryvoPeoples.remark=queryPeoplesremark.getDisplayedValue();//
			

			if(validstate==0){
              pagenumberPeoples=1;
              getPeoplesVO(queryvoPeoples); 
             }      
       }

function getPeoplesVO(queryvo){
	var totalCount=0;
	deletedataPeoples =new Array();
      var pu = new SOAPClientParameters2();
      pu.add('PeoplesVO',queryvo) ;
      pu.add('pageNumber',pagenumberPeoples) ;
	    pu.add('pageSize',pagesizePeoples) ;
	    pu.add('orderBy',orderByPeoples) ;
      SOAPClient.invoke(urlPeoples,"getPeoples", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydataPeoples=new Array();
		   querydataPeoples=dojoPeoples.PeoplesVOtoArray_fun(ul,true);
           totalCountPeoples=ul[ul.length-1]["ns:id"]; 
      }); 
      querydataPeoples.splice(querydataPeoples.length-1,1);
	  gridPeoples.selection.clear();
      modelPeoples.setData(querydataPeoples);
      //dijit.byId("grid").updateRowCount(querydataPeoples.length); 
	   var totalpage=Math.ceil(new Number(totalCountPeoples)/pagesizePeoples);
	  
	if(totalpage>1){
		if(pagenumberPeoples==1){
			dijit.byId("but6Peoples").setDisabled(true);
			dijit.byId("but7Peoples").setDisabled(false);
		}else if(pagenumberPeoples==totalpage){
			dijit.byId("but6Peoples").setDisabled(false);
			dijit.byId("but7Peoples").setDisabled(true);
		}else{
			dijit.byId("but6Peoples").setDisabled(false);
			dijit.byId("but7Peoples").setDisabled(false);
		}
	}else{
		dijit.byId("but6Peoples").setDisabled(true);
		dijit.byId("but7Peoples").setDisabled(true);
	
	}
	if(pagesizePeoples==0){
		totalpage=1;
		dijit.byId("but6Peoples").setDisabled(true);
		dijit.byId("but7Peoples").setDisabled(true);
	}
	if(totalpage==1)pagenumberPeoples=1;
	
	 document.getElementById("rowCountPeoples").innerHTML=i18nStr.di+" "+pagenumberPeoples+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountPeoples+" "+i18nStr.rowSize; 	
}

function init(){
	
 	gridPeoples.onStyleRow=OnStyleRowClassBlue();
	getPeoplesVO(queryvoPeoples);
}

 dojo.addOnLoad(init);   



function allopen(){
          for(var i =0;i<querydataPeoples.length;i++){
            togglePeoples(i,true);
          }
 }  

function allclose(){
          for(var i =0;i<querydataPeoples.length;i++){
            togglePeoples(i,false);
          }
}


function pageSizeChangePeoples(mylabel){
	pagesizePeoples=mylabel;
	pagenumberPeoples=1;
	getPeoplesVO(queryvoPeoples);
}

function allpagePeoples(){
	pagesizePeoples=0;
	getPeoplesVO(queryvoPeoples);
}

function upPagePeoples(){
	pagenumberPeoples--;
	getPeoplesVO(queryvoPeoples);
}
function downPagePeoples(){
	pagenumberPeoples++;
	getPeoplesVO(queryvoPeoples);
}


var addRowPeoples = function(){
	gridPeoples.addRow([false,0,"","",""],gridPeoples.model.getRowCount());
} 

function removePeoples(){
       var s= new Array();
       var sall=gridPeoples.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            deletedataPeoples.splice(deletedataPeoples.length,0,thisCell[1]);
       }}}
       gridPeoples.model.remove(s);//grid.removeSelectedRows();
 }
function call_funUpdPeoples() {
       var sall=gridPeoples.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];
              if(dojox.validate.isText(thisCell[2], {minlength: 1})){vobject.peopleName=thisCell[2];
             }else{gridPeoples.getCell(gridPeoples.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
               vobject.peoplePassword=thisCell[3];
 
               vobject.peopleStatus=thisCell[4];
 
var  d=new DateTimeQuery();
             if(thisCell[5] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[5], gridPeoples.getCell(gridPeoples.model.fieldArray[5]).constraint);
             }else{gridPeoples.getCell(gridPeoples.model.fieldArray[5]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[6] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[6], gridPeoples.getCell(gridPeoples.model.fieldArray[6]).constraint);
             vobject.birthDay=d;
             }else{gridPeoples.getCell(gridPeoples.model.fieldArray[6]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null
 

              if(dojox.validate.isText(thisCell[7], {minlength: 1})){vobject.sex=thisCell[7];
             }else{gridPeoples.getCell(gridPeoples.model.fieldArray[7]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
               vobject.birthPlace=thisCell[8];
 
               vobject.address=thisCell[9];
 
               vobject.tel=thisCell[10];
 
               vobject.engageMode=thisCell[11];
 
var  d=new DateTimeQuery();
             if(thisCell[12] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[12], gridPeoples.getCell(gridPeoples.model.fieldArray[12]).constraint);
             }else{gridPeoples.getCell(gridPeoples.model.fieldArray[12]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[13] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[13], gridPeoples.getCell(gridPeoples.model.fieldArray[13]).constraint);
             vobject.engageDate=d;
             }else{gridPeoples.getCell(gridPeoples.model.fieldArray[13]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null
 

               vobject.gradeEnum=thisCell[14];
 
               vobject.remark=thisCell[15];
 




       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('PeoplesVO',vobject);
                SOAPClient.invoke(urlPeoples, "createPeoples", padd, false,  function GetEnu_callBack(ul, soapResponse){
                gridPeoples.model.setDatum(ul,i,1);
				querydataPeoples[i][${childRow}]=[addrow];
				});
	         }else{//modify row
                padd.add('PeoplesVO',vobject);
                SOAPClient.invoke(urlPeoples, "updatePeoples", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
			 call_funUpdGridSub(i);
        } }}//for
//submit delete
          for(var i=0;i<deletedataPeoples.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedataPeoples[i]);
               SOAPClient.invoke(urlPeoples, "deletePeoples", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          deletedataPeoples=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
	
 } 

																																																					//totleinum=14
 //rowinum=4

 
</script>
</head>	 
<body class="tundra">
<div id="queryDivPeoples"  style="margin-right: 0px;  height: 160px; display:none;"  >
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
						
															<input type="text" class="editerInput"  id="queryPeoplespeopleName"  jsId="queryPeoplespeopleName"   dojoType="dijit.form.TextBox"  />
													</td>
														<td align="right"  i18n="peoplePassword" >peoplePassword:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="queryPeoplespeoplePassword"  jsId="queryPeoplespeoplePassword"   dojoType="dijit.form.TextBox"  />
												</td>  
													<td align="right"  i18n="peopleStatus" >peopleStatus:</td>
						<td align="left"  >
													<input type="text" class="editerInput"  id="queryPeoplespeopleStatus"  jsId="queryPeoplespeopleStatus"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			                <tr>
							<td align="right" i18n="birthDay"  >birthDay:</td> 
						<td align="left"  colspan="3"><span id="queryPeoplesbirthDayImg0"  ><input class="editerDate"   jsId="queryPeoplesbirthDay" id="queryPeoplesbirthDay"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsid="queryPeoplesbirthDayTime" id="queryPeoplesbirthDayTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="queryPeoplesbirthDayImg1" style="{display:none}" ><input class="editerDateSmaller"   jsId="query1PeoplesbirthDay" id="query1PeoplesbirthDay"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query1PeoplesbirthDayTime" id="query1PeoplesbirthDayTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryPeoplesbirthDayImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryPeoplesbirthDayImgdown" >></span>
							<span id="queryPeoplesbirthDayImg2div" style="{display:none}"><input class="editerDateSmaller"   jsId="query2PeoplesbirthDay" id="query2PeoplesbirthDay"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query2PeoplesbirthDayTime" id="query2PeoplesbirthDayTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="queryPeoplesbirthDayImg" class="imgStyle">
						</td>
													<td align="right" colspan="2" ></td>
						<td align="right"  i18n="sex" >sex:</td>
						<td align="left"  >
															<input type="text" class="editerInput"  id="queryPeoplessex"  jsId="queryPeoplessex"   dojoType="dijit.form.TextBox"  />  
													</td></tr>
					                <tr>
							<td align="right" i18n="birthPlace" >birthPlace:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryPeoplesbirthPlace"  jsId="queryPeoplesbirthPlace"   dojoType="dijit.form.TextBox"  />
													</td>
														<td align="right"  i18n="address" >address:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="queryPeoplesaddress"  jsId="queryPeoplesaddress"   dojoType="dijit.form.TextBox"  />
												</td>  
													<td align="right"  i18n="tel" >tel:</td>
						<td align="left"  >
													<input type="text" class="editerInput"  id="queryPeoplestel"  jsId="queryPeoplestel"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			                <tr>
							<td align="right" i18n="engageMode" >engageMode:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryPeoplesengageMode"  jsId="queryPeoplesengageMode"   dojoType="dijit.form.TextBox"  />
													</td>
																<td align="right"  i18n="engageDate" >engageDate:</td>
						<td align="left"   colspan="5"><span id="queryPeoplesengageDateImg0"  ><input class="editerDate"   jsId="queryPeoplesengageDate" id="queryPeoplesengageDate"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsid="queryPeoplesengageDateTime" id="queryPeoplesengageDateTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="queryPeoplesengageDateImg1" style="{display:none}" ><input class="editerDateSmall"   jsId="query1PeoplesengageDate" id="query1PeoplesengageDate"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmall" jsId="query1PeoplesengageDateTime" id="query1PeoplesengageDateTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryPeoplesengageDateImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryPeoplesengageDateImgdown" >></span>
							<span id="queryPeoplesengageDateImg2div" style="{display:none}"><input class="editerDateSmall"   jsId="query2PeoplesengageDate" id="query2PeoplesengageDate"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmall" jsId="query2PeoplesengageDateTime" id="query2PeoplesengageDateTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="queryPeoplesengageDateImg" class="imgStyle">
						</td></tr>
			                <tr>
							<td align="right" i18n="gradeEnum" >gradeEnum:</td>
						<td align="left"  >
						
														<input  id="queryPeoplesgradeEnum"  jsId="queryPeoplesgradeEnum" class="editerInput"  dojoType="dijit.form.FilteringSelect" store="dojoPeoples.gradeEnumStore" />
													</td>
														<td align="right"  i18n="remark" >remark:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="queryPeoplesremark"  jsId="queryPeoplesremark"   dojoType="dijit.form.TextBox"  />
												</td>  
				

    </tr>

    <td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybuttonPeoples();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
</div>	

<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   Peoples List</b></td>
		<td align="right" >
	<button dojoType="dijit.form.Button" onclick="addRowPeoples();" iconClass="addIcon" i18n="add"  >add</button>
	<button dojoType="dijit.form.Button" onclick="removePeoples();" iconClass="delIcon" i18n="delete" >delete</button>
	<button dojoType="dijit.form.Button"  onclick="call_funUpdPeoples();" i18n="save" iconClass="saveIcon">save</button>
	<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivPeoples');" iconClass="queryIcon"  i18n="openQuery" >query</button>
	<span id="rowCountPeoples"></span>
		<button dojoType="dijit.form.myButton" onclick="upPagePeoples();"  id="but6Peoples" disabled='true' jsId="but6Peoples" iconClass="upPageIcon" ></button>
		<button dojoType="dijit.form.myButton" onclick="downPagePeoples();" id="but7Peoples" disabled='true' jsId="but7Peoples" iconClass="downPageIcon" ></button>
		<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
			  <div dojoType="dijit.Menu">
				  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangePeoples(this.label);"></div>
				  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangePeoples(this.label);"></div>
			  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangePeoples(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangePeoples(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpagePeoples();"></div>
			  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
		</div>
		<button dojoType="dijit.form.myButton" onclick="allopen();"  iconClass="allopenIcon" i18n="allopen" ></button>
		<button dojoType="dijit.form.myButton" onclick="allclose();" iconClass="allcloseIcon" i18n="allclose"  ></button>
		</td>
	</tr>
</table>	   

<div id="gridPeoples"  dojoType="dojox.Grid"  autoWidth="false" style="{width:100%;height:85%}" 	jsId="gridPeoples"	model="modelPeoples" structure="mainLayout"  ></div>
</body>
<script type="text/javascript">trans18tag();</script>
</html>		