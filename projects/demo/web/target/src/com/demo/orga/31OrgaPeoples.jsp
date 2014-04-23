				<%
String peopleId = request.getParameter("peopleId");
%>
<html>
<!--Ò»Ô¶à£¬Ö»Ò»Ò»Ó±í£¬Ã»Ð¿Ò»Ô¶Ó±var dataChild=querydataOrgaPeoples[inRowIndex]-->
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
			@import "../dojo/dojo-release-1.0.0/dojox/layout/tests/_expando.css";
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
			dojo.require("dijit.layout.TabContainer");
			dojo.require("dijit.layout.BorderContainer");
			dojo.require("dijit.layout.ContentPane");
			dojo.require("dojox.layout.ExpandoPane");
			dojo.require("dijit.Dialog");
            dojo.registerModulePath("mydojo", "../../../js/mydojo");
            dojo.require("mydojo.FilteringSelect");
            dojo.require("mydojo.ValidationTextBox");
            dojo.require("mydojo.NumberTextBox");
			dojo.registerModulePath("projectDojo", "../../../dojo/projectDojo");
			dojo.require("projectDojo.OrgaPeoples");

     </script>
        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 <script type="text/javascript" >
		var dojoOrgaPeoples= new  projectDojo.OrgaPeoples();
	    dojoOrgaPeoples.initOrgaPeoples();
		     </script>

	 		<script type="text/javascript" src="OrgaSelectPane.js"></script><!--Ò»Òª,Ò»Ô¶Â£Í²Òª-->
	 		<script type="text/javascript" src="PeoplesSelectPane.js"></script><!--Ò»Òª,Ò»Ô¶Â£Í²Òª-->
	 	 							<script type="text/javascript" >
	  var urlOrgaPeoples = getUrl()+ "services/OrgaPeoplesManageService";
	  var deletedataOrgaPeoples =  new Array();
	  var querydataOrgaPeoples =  new Array();
	  var pagenumberOrgaPeoples=1;
	  var totalCountOrgaPeoples=0;
	  var pagesizeOrgaPeoples=10;
	  var orderByOrgaPeoples='0';
	  var queryvoOrgaPeoples=new Object();
	  var oddstyle='';
	  var modelOrgaPeoples = new dojox.grid.data.Table(null, querydataOrgaPeoples);
	  var urle = getUrl()+ "services/BasicManageService";
	  var modelOrgaPeoplesDetail;
	  var modelOrgaPeoplesChild;
	  

//have set function's manageableAssociationEnds
	function orgaSet(id,value){
        	/*var itemselect=orgaStore._getItemByIdentity(value);
				if(itemselect!='undefined'&& itemselect!=null){
				}*/
	}
	function peopleSet(id,value){
        	/*var itemselect=peopleStore._getItemByIdentity(value);
				if(itemselect!='undefined'&& itemselect!=null){
				}*/
	}

					                  // totleinum = 2 
	var mainLayout =[{//è·æ¯è¦æ¯ä¾æ¶è¦è·åºcolSpantoggle
					//onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
						//{ name: i18nStr.detail, width: 3, get: getCheckOrgaPeoples, styles: 'text-align: center;' },
							{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
						 

	//
							   {name: i18nStr.orga,field: 2,get:function(inRowIndex){ var str='';var strid;if(querydataOrgaPeoples[inRowIndex]!=undefined && querydataOrgaPeoples[inRowIndex][2]!=undefined && querydataOrgaPeoples[inRowIndex][2][1]!=undefined){str=querydataOrgaPeoples[inRowIndex][2][2];strid=querydataOrgaPeoples[inRowIndex][2][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="dojoOrgaPeoples.selectOrga('+strid+','+inRowIndex+',2,0,event);"   >';} ,width: 10 }
								//
							 ,   {name: i18nStr.people,field: 3,get:function(inRowIndex){ var str='';var strid;if(querydataOrgaPeoples[inRowIndex]!=undefined && querydataOrgaPeoples[inRowIndex][3]!=undefined && querydataOrgaPeoples[inRowIndex][3][1]!=undefined){str=querydataOrgaPeoples[inRowIndex][3][2];strid=querydataOrgaPeoples[inRowIndex][3][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="dojoOrgaPeoples.selectPeoples('+strid+','+inRowIndex+',3,0,event);"   >';} ,width: 10 }
								]/*,[
				{ name: '\u8be6\u7ec6', colSpan: 4 ,styles: 'padding: 0; margin: 0;', get: getDetailOrgaPeoples }//value: '<div style="height:0px; background-color: white;"></div>'
			  ]*/
		  ]

		}];	 





/*var detailRowsOrgaPeoples=[];

function onBeforeRow(inDataIndex, inRow) {	if (inRow[1]!=undefined)inRow[1].hidden = !detailRowsOrgaPeoples[inDataIndex];}	

function toggleOrgaPeoples(inIndex, inShow) {
        			//if (!inShow) destroySubGridIdGeneral('',querydataOrgaPeoples[inIndex][1],"OrgaPeoplesMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataOrgaPeoples[inIndex][1],"OrgaPeoplesChild");
				    detailRowsOrgaPeoples[inIndex] = inShow;
				    dijit.byId("gridOrgaPeoples").updateRow(inIndex); 
				    
    } 

function getCheckOrgaPeoples(inRowIndex) {
	var image = (detailRowsOrgaPeoples[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsOrgaPeoples[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleOrgaPeoples(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}

function getDetailOrgaPeoples(inRowIndex){
	if(detailRowsWlTaskRow[inRowIndex]){
		var cell = this;
		setTimeout(function() { buildSubgridOrgaPeoples(inRowIndex, cell); }, 0);  }
		var h =0;
		if(detailRowsOrgaPeoples[inRowIndex]&&querydataOrgaPeoples[inRowIndex][$childRow].length>0){
							h=65+25*querydataOrgaPeoples[inRowIndex][$childRow].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}

//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}
var childRow= ${childRow};
var layoutInRowIndex;	  
function buildSubgridOrgaPeoples(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)Ç¸idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		//var child = inCell.getNode(inRowIndex).lastChild;
		//var idmainDetail = makeSubGridIdGeneral('',querydataOrgaPeoples[inRowIndex][1],"OrgaPeoplesMainDetail");//makeSubgridIdMainDetail(querydataOrgaPeoples[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataOrgaPeoples[inRowIndex][1],"OrgaPeoplesChild");
		//var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataOrgaPeoples[inRowIndex][$childRow];
		//if(dataChild.length!=0){
			if (subGridChild){
				subGridChild.model.setData(dataChild);
				child.appendChild(subGridChild.domNode);
			}else{
				modelOrgaPeoplesChild=new dojox.grid.data.Table(null, dataChild);
				var childProps= {
								autoHeight: true, 
								autoRender: false,
								rowCount:dataChild.length,
								model:modelOrgaPeoplesChild,							};
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
		//}
		
		////////////////////////////////////////////////////////////////////////////////var detailDate=[];//Í¡/
		detailDate[0]=querydataOrgaPeoples[inRowIndex];  
	    modelOrgaPeoplesDetail=new dojox.grid.data.Table(null, detailDate);
		if (subGridMainDetail) {
			subGridMainDetail.model.setData(detailDate);
			mainDetail.appendChild(subGridMainDetail.domNode);
		} else {
			var mainDetailProps = {
				rowCount: 1, 
				autoHeight: true, 
				autoRender: false,
				model:modelOrgaPeoplesDetail
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
			}//////////////////////////////////////////////////////////////////////////////////	
		inCell.grid.rowHeightChanged(inRowIndex);
    }   
}
//var childLayout=//???????????????????????????????/ Ö±É£jshtml
*/
function querybuttonOrgaPeoples(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvoOrgaPeoples=new Object();
			
	if(queryOrgaPeoplesorga.getDisplayedValue()!=""){
				var orgaQuery= new Object();
				//orgaQuery.OrgaPeoplesName=queryOrgaPeoplesorga.getDisplayedValue();
				orgaQuery.id=queryOrgaPeoplesorga.getValue();
				queryvoOrgaPeoples.orga=orgaQuery;
			  }
	if(queryOrgaPeoplespeople.getDisplayedValue()!=""){
				var peopleQuery= new Object();
				//peopleQuery.OrgaPeoplesName=queryOrgaPeoplespeople.getDisplayedValue();
				peopleQuery.id=queryOrgaPeoplespeople.getValue();
				queryvoOrgaPeoples.people=peopleQuery;
			  }

			if(validstate==0){
              pagenumberOrgaPeoples=1;
              getOrgaPeoplesVO(queryvoOrgaPeoples); 
             }      
       }

function getOrgaPeoplesVO(queryvo){
	var totalCount=0;
	deletedataOrgaPeoples =new Array();
      var pu = new SOAPClientParameters2();
      pu.add('OrgaPeoplesVO',queryvo) ;
      pu.add('pageNumber',pagenumberOrgaPeoples) ;
	    pu.add('pageSize',pagesizeOrgaPeoples) ;
	    pu.add('orderBy',orderByOrgaPeoples) ;
      SOAPClient.invoke(urlOrgaPeoples,"getOrgaPeoples", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydataOrgaPeoples=new Array();
		   querydataOrgaPeoples=dojoOrgaPeoples.OrgaPeoplesVOtoArray_fun(ul,true);
           totalCountOrgaPeoples=ul[ul.length-1]["ns:id"]; 
      }); 
      querydataOrgaPeoples.splice(querydataOrgaPeoples.length-1,1);
	  gridOrgaPeoples.selection.clear();
      modelOrgaPeoples.setData(querydataOrgaPeoples);
      //dijit.byId("grid").updateRowCount(querydataOrgaPeoples.length); 
	   var totalpage=Math.ceil(new Number(totalCountOrgaPeoples)/pagesizeOrgaPeoples);
	  
	if(totalpage>1){
		if(pagenumberOrgaPeoples==1){
			dijit.byId("but6OrgaPeoples").setDisabled(true);
			dijit.byId("but7OrgaPeoples").setDisabled(false);
		}else if(pagenumberOrgaPeoples==totalpage){
			dijit.byId("but6OrgaPeoples").setDisabled(false);
			dijit.byId("but7OrgaPeoples").setDisabled(true);
		}else{
			dijit.byId("but6OrgaPeoples").setDisabled(false);
			dijit.byId("but7OrgaPeoples").setDisabled(false);
		}
	}else{
		dijit.byId("but6OrgaPeoples").setDisabled(true);
		dijit.byId("but7OrgaPeoples").setDisabled(true);
	
	}
	if(pagesizeOrgaPeoples==0){
		totalpage=1;
		dijit.byId("but6OrgaPeoples").setDisabled(true);
		dijit.byId("but7OrgaPeoples").setDisabled(true);
	}
	if(totalpage==1)pagenumberOrgaPeoples=1;
	
	 document.getElementById("rowCountOrgaPeoples").innerHTML=i18nStr.di+" "+pagenumberOrgaPeoples+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountOrgaPeoples+" "+i18nStr.rowSize; 	
}

function init(){
	
 	gridOrgaPeoples.onStyleRow=OnStyleRowClassBlue();
	getOrgaPeoplesVO(queryvoOrgaPeoples);
	
		dojo.connect(dijit.byId("OrgaPeoplesSelectTab"), "selectChild", function(e){
			dojo.byId("orga2orgaPeoplesTable").style.visibility="hidden";
				dojo.byId("orgaPeoples2peopleTable").style.visibility="hidden";
	dojo.byId(dijit.byId("OrgaPeoplesSelectTab").selectedChildWidget.id+"Table").style.visibility="visible";
  });	
}

 dojo.addOnLoad(init);   

	function selectOrgaFun(rep){
		querydataOrgaPeoples[dojoOrgaPeoples.selectOrgaInRow][dojoOrgaPeoples.noOrga]=rep;
		gridOrgaPeoples.updateRow(dojoOrgaPeoples.selectOrgaInRow);		
	}
	function selectPeoplesFun(rep){
		querydataOrgaPeoples[dojoOrgaPeoples.selectPeoplesInRow][dojoOrgaPeoples.noPeoples]=rep;
		gridOrgaPeoples.updateRow(dojoOrgaPeoples.selectPeoplesInRow);		
	}


function allopen(){
          for(var i =0;i<querydataOrgaPeoples.length;i++){
            toggleOrgaPeoples(i,true);
          }
 }  

function allclose(){
          for(var i =0;i<querydataOrgaPeoples.length;i++){
            toggleOrgaPeoples(i,false);
          }
}

function pageSizeChangeOrgaPeoples(mylabel){
	pagesizeOrgaPeoples=mylabel;
	pagenumberOrgaPeoples=1;
	getOrgaPeoplesVO(queryvoOrgaPeoples);
}

function allpageOrgaPeoples(){
	pagesizeOrgaPeoples=0;
	getOrgaPeoplesVO(queryvoOrgaPeoples);
}

function upPageOrgaPeoples(){
	pagenumberOrgaPeoples--;
	getOrgaPeoplesVO(queryvoOrgaPeoples);
}
function downPageOrgaPeoples(){
	pagenumberOrgaPeoples++;
	getOrgaPeoplesVO(queryvoOrgaPeoples);
}
var addRowOrgaPeoples = function(){
var addrow=[];
																if(ifMultPaneorga2orgaPeoples!=undefined){
					var re=selectorga2orgaPeoplesFunClick();
					addrow.push(re);}
												if(ifMultPaneorgaPeoples2people!=undefined){
					var re=selectorgaPeoples2peopleFunClick();
					addrow.push(re);}
						addrow.splice(0,0,false,0);
	gridOrgaPeoples.addRow(addrow,gridOrgaPeoples.model.getRowCount());
} 

function removeOrgaPeoples(){
       var s= new Array();
       var sall=gridOrgaPeoples.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            deletedataOrgaPeoples.splice(deletedataOrgaPeoples.length,0,thisCell[1]);
       }}}
       gridOrgaPeoples.model.remove(s);//grid.removeSelectedRows();
 }
function call_funUpdOrgaPeoples() {
       var sall=gridOrgaPeoples.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];

								var manageable=new Object();
			 if(querydataOrgaPeoples[i][2]!=''&&querydataOrgaPeoples[i][2]!=undefined){
             manageable.id=querydataOrgaPeoples[i][2][1];
             vobject.orga=manageable;
			 }else{
			 gridOrgaPeoples.getCell(gridOrgaPeoples.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
											var manageable=new Object();
			 if(querydataOrgaPeoples[i][3]!=''&&querydataOrgaPeoples[i][3]!=undefined){
             manageable.id=querydataOrgaPeoples[i][3][1];
             vobject.people=manageable;
			 }else{
			 gridOrgaPeoples.getCell(gridOrgaPeoples.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
			


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('OrgaPeoplesVO',vobject);
                SOAPClient.invoke(urlOrgaPeoples, "createOrgaPeoples", padd, false,  function GetEnu_callBack(ul, soapResponse){
                gridOrgaPeoples.model.setDatum(ul,i,1);
				});
	         }else{//modify row
                padd.add('OrgaPeoplesVO',vobject);
                SOAPClient.invoke(urlOrgaPeoples, "updateOrgaPeoples", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
			 //call_funUpdGridSub();
        } }}//for
//submit delete
          for(var i=0;i<deletedataOrgaPeoples.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedataOrgaPeoples[i]);
               SOAPClient.invoke(urlOrgaPeoples, "deleteOrgaPeoples", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          deletedataOrgaPeoples=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
	
 } 
 	//totleinum=2
 //rowinum=0

</script>
</head>	 
<body class="tundra">
<div id="bc" style="width:100%; height:100%;" dojoType="dijit.layout.BorderContainer">
<div dojoType="dijit.layout.ContentPane"  title="" region="center" id="topPane" 	 >
<div id="queryDivOrgaPeoples" style="margin-right: 0px;  height: 80px; display:none;" >
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


//
								<tr><td align="right"  i18n="orga"  ></td>
					<td align="left" ><input  id="queryOrgaPeoplesorga"  jsId="queryOrgaPeoplesorga" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrgaPeoples.orgaStore"  /></td>  
														<td align="right"  i18n="people"  ></td>
					<td align="left" colspan="3" ><input  id="queryOrgaPeoplespeople"  jsId="queryOrgaPeoplespeople" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrgaPeoples.peopleStore"  /></td>  
						    </tr>

         <tr align="center"><td></td>
           <td colspan="2"> <button dojoType="dijit.form.Button" onclick="querybutton();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="3"></td><td colspan="2"></td></tr>
         </table>
</div>	

<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   OrgaPeoples List</b></td>
		<td align="right" >
	<button dojoType="dijit.form.Button" onclick="addRowOrgaPeoples();" iconClass="addIcon" i18n="add"  >add</button>
	<button dojoType="dijit.form.Button" onclick="removeOrgaPeoples();" iconClass="delIcon" i18n="delete" >delete</button>
	<button dojoType="dijit.form.Button"  onclick="call_funUpdOrgaPeoples();" i18n="save" iconClass="saveIcon">save</button>
	<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivOrgaPeoples');" iconClass="queryIcon"  i18n="openQuery" >query</button>
	<span id="rowCountOrgaPeoples"></span>
		<button dojoType="dijit.form.myButton" onclick="upPageOrgaPeoples();"  id="but6OrgaPeoples" disabled='true' jsId="but6OrgaPeoples" iconClass="upPageIcon" >pageup</button><!--span dojoType="dijit.Tooltip" connectId="but6">pageup</span-->
		<button dojoType="dijit.form.myButton" onclick="downPageOrgaPeoples();" id="but7OrgaPeoples" disabled='true' jsId="but7OrgaPeoples" iconClass="downPageIcon" >pagedown</button><!--span dojoType="dijit.Tooltip" connectId="but7">pagedown</span-->
		<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
			  <div dojoType="dijit.Menu">
				  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangeOrgaPeoples(this.label);"></div>
				  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangeOrgaPeoples(this.label);"></div>
			  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangeOrgaPeoples(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangeOrgaPeoples(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpageOrgaPeoples();"></div>
			  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
		</div>

		<button dojoType="dijit.form.myButton" onclick="allopen();"  iconClass="allopenIcon" i18n="allopen" >allopen</button>
		<button dojoType="dijit.form.myButton" onclick="allclose();" iconClass="allcloseIcon" i18n="allclose"  >allclose</button>
		</td>
	</tr>
</table> 

<div id="gridOrgaPeoples"  dojoType="dojox.Grid"  autoWidth="false" style="{width:100%;height:85%}" 	jsId="gridOrgaPeoples"	model="modelOrgaPeoples" structure="mainLayout"  ></div>
</div>  
    
<div dojoType="dojox.layout.ExpandoPane" splitter="true" duration="125" region="bottom" title="" style="height:375px;"  onLoad="myOnLoad" id="bottomPane" jsId="bottomPane" ><!--href="OrgaPeoplesSelectTab.html"-->
								<table id="orga2orgaPeoplesTable"  style=" position:absolute;top:0px; width:90%; visibility:visible ">
				<tr height="25px" width="100%">
		<td align="right" >
					<span id="rowCountpaneorga2orgaPeoples"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button dojoType="dijit.form.myButton" onclick="upPagepaneorga2orgaPeoples();"  id="but6paneorga2orgaPeoples" disabled='true' jsId="but6paneorga2orgaPeoples" iconClass="upPageIcon" >pageup</button>
					<button dojoType="dijit.form.myButton" onclick="downPagepaneorga2orgaPeoples();" id="but7paneorga2orgaPeoples" disabled='true' jsId="but7paneorga2orgaPeoples" iconClass="downPageIcon" >pagedown</button>
	</td></tr></table>
									<table id="orgaPeoples2peopleTable"  style=" position:absolute;top:0px; width:90%; visibility:hidden ">		
				<tr height="25px" width="100%">
		<td align="right" >
					<span id="rowCountpaneorgaPeoples2people"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button dojoType="dijit.form.myButton" onclick="upPagepaneorgaPeoples2people();"  id="but6paneorgaPeoples2people" disabled='true' jsId="but6paneorgaPeoples2people" iconClass="upPageIcon" >pageup</button>
					<button dojoType="dijit.form.myButton" onclick="downPagepaneorgaPeoples2people();" id="but7paneorgaPeoples2people" disabled='true' jsId="but7paneorgaPeoples2people" iconClass="downPageIcon" >pagedown</button>
	</td></tr></table>
				<div dojoType="dijit.layout.TabContainer" style="height:100%; width:100%;"   id="OrgaPeoplesSelectTab" jsId="OrgaPeoplesSelectTab"  >
			<div dojoType="dojox.layout.ContentPane" href="../common/orga2orgaPeoplesSelectPane.html" title="orga"  id="orga2orgaPeoples" jsId="orgaSelectPane" >
		</div>
				<div dojoType="dojox.layout.ContentPane" href="../common/orgaPeoples2peopleSelectPane.html" title="people"  id="orgaPeoples2people" jsId="peopleSelectPane" >
		</div>
		</div>
</div>

</div>
</body>
<script type="text/javascript">trans18tag();</script>
</html>		
