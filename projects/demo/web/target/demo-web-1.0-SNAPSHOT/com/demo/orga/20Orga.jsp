<%
String peopleId = request.getParameter("peopleId");
%>
<html>
<!--Ò»Ô¶à£¬Ö»Ò»Ò»Ó±í£¬Ã»Ð¿Ò»Ô¶Ó±var dataChild=querydataOrga[inRowIndex]-->
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
			dojo.require("projectDojo.Orga");
     </script>
        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	<script type="text/javascript" >
		var dojoOrga= new  projectDojo.Orga();
	    dojoOrga.initOrga();
	//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
							 var dojoOrgaPeoples= new  projectDojo.OrgaPeoples();
			dojoOrgaPeoples.initOrgaPeoples();
			</script>
	 	 	<script type="text/javascript" >
	  var urlOrga = getUrl()+ "services/OrgaManageService";
	  var deletedataOrga =  new Array();
	  var querydataOrga =  new Array();
	  var pagenumberOrga=1;
	  var totalCountOrga=0;
	  var pagesizeOrga=10;
	  var orderByOrga='0';
	  var queryvoOrga=new Object();
	  var oddstyle='';
	  var modelOrga = new dojox.grid.data.Table(null, querydataOrga);
	  var urle = getUrl()+ "services/BasicManageService";
	  var modelOrgaDetail;
	  var modelOrgaChild;
	  

																					                  // totleinum = 5 
	var mainLayout =[{//Þ¸Ä¸ÒªÏ¢Ö¶Ê±ÒªÞ¸Ó¦colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
						{ name: i18nStr.detail, width: 3, get: getCheckOrga, styles: 'text-align: center;' },
							{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
						  												  {name: i18nStr.orgaName, field: 2,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
														  							  												,   {name: i18nStr.orgaCode, field: 3,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
														  							  												,   {name: i18nStr.sno, field: 4,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
														  							  												,   {name: i18nStr.remark, field: 5,width: 10, editor: dojox.grid.editors.Editor,required:false, editorToolbar: true  }
														  							  				 ,  {name: i18nStr.parentId,field:6, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
						  							 

	],[
				{ name: '\u8be6\u7ec6', colSpan: 8 ,styles: 'padding: 0; margin: 0;', get: getDetailOrga }//value: '<div style="height:0px; background-color: white;"></div>'
			  ]
		  ]

		}];	 


var detailRowsOrga=[];
function onBeforeRow(inDataIndex, inRow) {	if (inRow[1]!=undefined)inRow[1].hidden = !detailRowsOrga[inDataIndex];}	
function toggleOrga(inIndex, inShow) {
        			//if (!inShow) destroySubGridIdGeneral('',querydataOrga[inIndex][1],"OrgaMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataOrga[inIndex][1],"OrgaChild");
				    detailRowsOrga[inIndex] = inShow;
				    dijit.byId("gridOrga").updateRow(inIndex); 
				    
    } 

function getCheckOrga(inRowIndex) {
	var image = (detailRowsOrga[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsOrga[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleOrga(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}

function getDetailOrga(inRowIndex){
	if(detailRowsOrga[inRowIndex]){
		var cell = this;
		setTimeout(function() { buildSubgridOrga(inRowIndex, cell); }, 0);  }
		var h =0;
		if(detailRowsOrga[inRowIndex]&&querydataOrga[inRowIndex][$childRow]!=undefined &&querydataOrga[inRowIndex][$childRow].length>0){
							h=65+25*querydataOrga[inRowIndex][$childRow].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}

//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}
var childRow= ${childRow};
var layoutInRowIndex;	  



var addrow=[];
				
addrow.splice(0,0,false,0);




function buildSubgridOrga(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)Ç¸idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		//var child = inCell.getNode(inRowIndex).lastChild;
		//var idmainDetail = makeSubGridIdGeneral('',querydataOrga[inRowIndex][1],"OrgaMainDetail");//makeSubgridIdMainDetail(querydataOrga[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataOrga[inRowIndex][1],"OrgaChild");
		//var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataOrga[inRowIndex][$childRow];
		if(dataChild!=undefined){
			if (subGridChild){
				subGridChild.model.setData(dataChild);
				child.appendChild(subGridChild.domNode);
			}else{
				modelOrgaChild=new dojox.grid.data.Table(null, dataChild);
				var childProps= {
								autoHeight: true, 
								autoRender: false,
								rowCount:dataChild.length,
								model:modelOrgaChild,							};
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
		detailDate[0]=querydataOrga[inRowIndex];  
	    modelOrgaDetail=new dojox.grid.data.Table(null, detailDate);
		if (subGridMainDetail) {
			subGridMainDetail.model.setData(detailDate);
			mainDetail.appendChild(subGridMainDetail.domNode);
		} else {
			var mainDetailProps = {
				rowCount: 1, 
				autoHeight: true, 
				autoRender: false,
				model:modelOrgaDetail
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

function querybuttonOrga(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvoOrga=new Object();
	          if(queryOrgaorgaName.getDisplayedValue()!="")queryvoOrga.orgaName=queryOrgaorgaName.getDisplayedValue();//
	          if(queryOrgaorgaCode.getDisplayedValue()!="")queryvoOrga.orgaCode=queryOrgaorgaCode.getDisplayedValue();//
	          if(queryOrgasno.getDisplayedValue()!="")queryvoOrga.sno=queryOrgasno.getDisplayedValue();//
	          if(queryOrgaremark.getDisplayedValue()!="")queryvoOrga.remark=queryOrgaremark.getDisplayedValue();//
              n=queryNumber_fun("OrgaparentId");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvoOrga.parentId=n;}  
			

			if(validstate==0){
              pagenumberOrga=1;
              getOrgaVO(queryvoOrga); 
             }      
       }

function getOrgaVO(queryvo){
	var totalCount=0;
	deletedataOrga =new Array();
      var pu = new SOAPClientParameters2();
      pu.add('OrgaVO',queryvo) ;
      pu.add('pageNumber',pagenumberOrga) ;
	    pu.add('pageSize',pagesizeOrga) ;
	    pu.add('orderBy',orderByOrga) ;
      SOAPClient.invoke(urlOrga,"getOrga", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydataOrga=new Array();
		   querydataOrga=dojoOrga.OrgaVOtoArray_fun(ul,true);
           totalCountOrga=ul[ul.length-1]["ns:id"]; 
      }); 
      querydataOrga.splice(querydataOrga.length-1,1);
	  gridOrga.selection.clear();
      modelOrga.setData(querydataOrga);
      //dijit.byId("grid").updateRowCount(querydataOrga.length); 
	   var totalpage=Math.ceil(new Number(totalCountOrga)/pagesizeOrga);
	  
	if(totalpage>1){
		if(pagenumberOrga==1){
			dijit.byId("but6Orga").setDisabled(true);
			dijit.byId("but7Orga").setDisabled(false);
		}else if(pagenumberOrga==totalpage){
			dijit.byId("but6Orga").setDisabled(false);
			dijit.byId("but7Orga").setDisabled(true);
		}else{
			dijit.byId("but6Orga").setDisabled(false);
			dijit.byId("but7Orga").setDisabled(false);
		}
	}else{
		dijit.byId("but6Orga").setDisabled(true);
		dijit.byId("but7Orga").setDisabled(true);
	
	}
	if(pagesizeOrga==0){
		totalpage=1;
		dijit.byId("but6Orga").setDisabled(true);
		dijit.byId("but7Orga").setDisabled(true);
	}
	if(totalpage==1)pagenumberOrga=1;
	
	 document.getElementById("rowCountOrga").innerHTML=i18nStr.di+" "+pagenumberOrga+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountOrga+" "+i18nStr.rowSize; 	
}

function init(){
	
 	gridOrga.onStyleRow=OnStyleRowClassBlue();
	getOrgaVO(queryvoOrga);
}

 dojo.addOnLoad(init);   



function allopen(){
          for(var i =0;i<querydataOrga.length;i++){
            toggleOrga(i,true);
          }
 }  

function allclose(){
          for(var i =0;i<querydataOrga.length;i++){
            toggleOrga(i,false);
          }
}


function pageSizeChangeOrga(mylabel){
	pagesizeOrga=mylabel;
	pagenumberOrga=1;
	getOrgaVO(queryvoOrga);
}

function allpageOrga(){
	pagesizeOrga=0;
	getOrgaVO(queryvoOrga);
}

function upPageOrga(){
	pagenumberOrga--;
	getOrgaVO(queryvoOrga);
}
function downPageOrga(){
	pagenumberOrga++;
	getOrgaVO(queryvoOrga);
}


var addRowOrga = function(){
	gridOrga.addRow([false,0,"","",""],gridOrga.model.getRowCount());
} 

function removeOrga(){
       var s= new Array();
       var sall=gridOrga.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            deletedataOrga.splice(deletedataOrga.length,0,thisCell[1]);
       }}}
       gridOrga.model.remove(s);//grid.removeSelectedRows();
 }
function call_funUpdOrga() {
       var sall=gridOrga.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];
              if(dojox.validate.isText(thisCell[2], {minlength: 1})){vobject.orgaName=thisCell[2];
             }else{gridOrga.getCell(gridOrga.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
              if(dojox.validate.isText(thisCell[3], {minlength: 1})){vobject.orgaCode=thisCell[3];
             }else{gridOrga.getCell(gridOrga.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
               vobject.sno=thisCell[4];
 
               vobject.remark=thisCell[5];
 
             if(dojox.validate.isInRange(thisCell[6],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[6];vobject.parentId=n;
             }else{gridOrga.getCell(gridOrga.model.fieldArray[6]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double





       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('OrgaVO',vobject);
                SOAPClient.invoke(urlOrga, "createOrga", padd, false,  function GetEnu_callBack(ul, soapResponse){
                gridOrga.model.setDatum(ul,i,1);
				querydataOrga[i][${childRow}]=[addrow];
				});
	         }else{//modify row
                padd.add('OrgaVO',vobject);
                SOAPClient.invoke(urlOrga, "updateOrga", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
			 call_funUpdGridSub(i);
        } }}//for
//submit delete
          for(var i=0;i<deletedataOrga.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedataOrga[i]);
               SOAPClient.invoke(urlOrga, "deleteOrga", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          deletedataOrga=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
	
 } 

																					//totleinum=5
 //rowinum=1

 
</script>
</head>	 
<body class="tundra">
<div id="queryDivOrga"  style="margin-right: 0px;  height: 100px; display:none;"  >
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
							<td align="right" i18n="orgaName" >orgaName:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryOrgaorgaName"  jsId="queryOrgaorgaName"   dojoType="dijit.form.TextBox"  />
													</td>
														<td align="right"  i18n="orgaCode" >orgaCode:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="queryOrgaorgaCode"  jsId="queryOrgaorgaCode"   dojoType="dijit.form.TextBox"  />
												</td>  
													<td align="right"  i18n="sno" >sno:</td>
						<td align="left"  >
													<input type="text" class="editerInput"  id="queryOrgasno"  jsId="queryOrgasno"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			                <tr>
							<td align="right" i18n="remark" >remark:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryOrgaremark"  jsId="queryOrgaremark"   dojoType="dijit.form.TextBox"  />
													</td>
																		<td align="right"  i18n="parentId" >parentId:</td>
							<td align="left" colspan="3" >
								<span id="queryOrgaparentIdImg0"  ><input type="text" class="editerNumber" jsId="queryOrgaparentId"  id="queryOrgaparentId"  dojoType="mydojo.NumberTextBox"  /></span>
								<span id="queryOrgaparentIdImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsid="queryOrgaparentId1"  id="queryOrgaparentId1"  dojoType="mydojo.NumberTextBox"  /></span>
								<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryOrgaparentIdImgup">></span>
								<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryOrgaparentIdImgdown" >></span>
								<span id="queryOrgaparentIdImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsid="queryOrgaparentId2"  id="queryOrgaparentId2"  dojoType="mydojo.NumberTextBox"  /></span>
								<img src="../image/start.gif" onclick="queryType(this);" id="queryOrgaparentIdImg" class="imgStyle">
							</td>  
							

    </tr>

    <td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybuttonOrga();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
</div>	

<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   Orga List</b></td>
		<td align="right" >
	<button dojoType="dijit.form.Button" onclick="addRowOrga();" iconClass="addIcon" i18n="add"  >add</button>
	<button dojoType="dijit.form.Button" onclick="removeOrga();" iconClass="delIcon" i18n="delete" >delete</button>
	<button dojoType="dijit.form.Button"  onclick="call_funUpdOrga();" i18n="save" iconClass="saveIcon">save</button>
	<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivOrga');" iconClass="queryIcon"  i18n="openQuery" >query</button>
	<span id="rowCountOrga"></span>
		<button dojoType="dijit.form.myButton" onclick="upPageOrga();"  id="but6Orga" disabled='true' jsId="but6Orga" iconClass="upPageIcon" ></button>
		<button dojoType="dijit.form.myButton" onclick="downPageOrga();" id="but7Orga" disabled='true' jsId="but7Orga" iconClass="downPageIcon" ></button>
		<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
			  <div dojoType="dijit.Menu">
				  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangeOrga(this.label);"></div>
				  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangeOrga(this.label);"></div>
			  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangeOrga(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangeOrga(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpageOrga();"></div>
			  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
		</div>
		<button dojoType="dijit.form.myButton" onclick="allopen();"  iconClass="allopenIcon" i18n="allopen" ></button>
		<button dojoType="dijit.form.myButton" onclick="allclose();" iconClass="allcloseIcon" i18n="allclose"  ></button>
		</td>
	</tr>
</table>	   

<div id="gridOrga"  dojoType="dojox.Grid"  autoWidth="false" style="{width:100%;height:85%}" 	jsId="gridOrga"	model="modelOrga" structure="mainLayout"  ></div>
</body>
<script type="text/javascript">trans18tag();</script>
</html>		