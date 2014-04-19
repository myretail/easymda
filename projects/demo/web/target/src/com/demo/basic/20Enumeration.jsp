<%
String peopleId = request.getParameter("peopleId");
%>
<html>
<!--????¨¤?????????¡À¨ª???????????¡Àvar dataChild=querydataEnumeration[inRowIndex]-->
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
			dojo.require("projectDojo.Enumeration");
     </script>
        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	<script type="text/javascript" >
		var dojoEnumeration= new  projectDojo.Enumeration();
	    dojoEnumeration.initEnumeration();
</script>
	 	 	<script type="text/javascript" >
	  var urlEnumeration = getUrl()+ "services/EnumerationManageService";
	  var deletedataEnumeration =  new Array();
	  var querydataEnumeration =  new Array();
	  var pagenumberEnumeration=1;
	  var totalCountEnumeration=0;
	  var pagesizeEnumeration=10;
	  var orderByEnumeration='0';
	  var queryvoEnumeration=new Object();
	  var oddstyle='';
	  var modelEnumeration = new dojox.grid.data.Table(null, querydataEnumeration);
	  var urle = getUrl()+ "services/BasicManageService";
	  var modelEnumerationDetail;
	  var modelEnumerationChild;
	  

									                  // totleinum = 2 
	var mainLayout =[{//???????????¡À??????colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
						{ name: i18nStr.detail, width: 3, get: getCheckEnumeration, styles: 'text-align: center;' },
							{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
						  												  {name: i18nStr.fieldName, field: 2,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
														  							  												,   {name: i18nStr.enumerationType, field: 3,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
														  							 

	],[
				{ name: '\u8be6\u7ec6', colSpan: 5 ,styles: 'padding: 0; margin: 0;', get: getDetailEnumeration }//value: '<div style="height:0px; background-color: white;"></div>'
			  ]
		  ]

		}];	 


var detailRowsEnumeration=[];
function onBeforeRow(inDataIndex, inRow) {	if (inRow[1]!=undefined)inRow[1].hidden = !detailRowsEnumeration[inDataIndex];}	
function toggleEnumeration(inIndex, inShow) {
        			//if (!inShow) destroySubGridIdGeneral('',querydataEnumeration[inIndex][1],"EnumerationMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataEnumeration[inIndex][1],"EnumerationChild");
				    detailRowsEnumeration[inIndex] = inShow;
				    dijit.byId("gridEnumeration").updateRow(inIndex); 
				    
    } 

function getCheckEnumeration(inRowIndex) {
	var image = (detailRowsEnumeration[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsEnumeration[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleEnumeration(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}

function getDetailEnumeration(inRowIndex){
	if(detailRowsEnumeration[inRowIndex]){
		var cell = this;
		setTimeout(function() { buildSubgridEnumeration(inRowIndex, cell); }, 0);  }
		var h =0;
		if(detailRowsEnumeration[inRowIndex]&&querydataEnumeration[inRowIndex][$childRow]!=undefined &&querydataEnumeration[inRowIndex][$childRow].length>0){
							h=65+25*querydataEnumeration[inRowIndex][$childRow].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}

//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}
var childRow= ${childRow};
var layoutInRowIndex;	  



var addrow=[];
				
addrow.splice(0,0,false,0);




function buildSubgridEnumeration(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)??idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		//var child = inCell.getNode(inRowIndex).lastChild;
		//var idmainDetail = makeSubGridIdGeneral('',querydataEnumeration[inRowIndex][1],"EnumerationMainDetail");//makeSubgridIdMainDetail(querydataEnumeration[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataEnumeration[inRowIndex][1],"EnumerationChild");
		//var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataEnumeration[inRowIndex][$childRow];
		if(dataChild!=undefined){
			if (subGridChild){
				subGridChild.model.setData(dataChild);
				child.appendChild(subGridChild.domNode);
			}else{
				modelEnumerationChild=new dojox.grid.data.Table(null, dataChild);
				var childProps= {
								autoHeight: true, 
								autoRender: false,
								rowCount:dataChild.length,
								model:modelEnumerationChild,							};
				childProps.dataRow = inRowIndex;
				childProps.id = idchild;
				if(Math.ceil(inRowIndex/2)>inRowIndex/2){
					childLayoutOdd=buildChildLayout(pre,headerstyleodd,inRowIndex);	
					childProps.structure=childLayoutOdd;
				}else{
					childLayout=buildChildLayout(pre,headerstyle,inRowIndex);
					childProps.structure=childLayout;
				}
				subGridChild = new dojox.Grid(childProps, child);//grid????¡Á¡À?¡À??DIV????
			}
			if (subGridChild) {
				subGridChild.render();
				subGridChild.cacheHeight = subGridChild.domNode.offsetHeight;
			}	      				
		}
		
		/*var detailDate=[];
		detailDate[0]=querydataEnumeration[inRowIndex];  
	    modelEnumerationDetail=new dojox.grid.data.Table(null, detailDate);
		if (subGridMainDetail) {
			subGridMainDetail.model.setData(detailDate);
			mainDetail.appendChild(subGridMainDetail.domNode);
		} else {
			var mainDetailProps = {
				rowCount: 1, 
				autoHeight: true, 
				autoRender: false,
				model:modelEnumerationDetail
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
//var childLayout=//???????????????????????????????/ ?¡À??jshtml

function querybuttonEnumeration(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvoEnumeration=new Object();
	          if(queryEnumerationfieldName.getDisplayedValue()!="")queryvoEnumeration.fieldName=queryEnumerationfieldName.getDisplayedValue();//
	          if(queryEnumerationenumerationType.getDisplayedValue()!="")queryvoEnumeration.enumerationType=queryEnumerationenumerationType.getDisplayedValue();//
			

			if(validstate==0){
              pagenumberEnumeration=1;
              getEnumerationVO(queryvoEnumeration); 
             }      
       }

function getEnumerationVO(queryvo){
	var totalCount=0;
	deletedataEnumeration =new Array();
      var pu = new SOAPClientParameters2();
      pu.add('EnumerationVO',queryvo) ;
      pu.add('pageNumber',pagenumberEnumeration) ;
	    pu.add('pageSize',pagesizeEnumeration) ;
	    pu.add('orderBy',orderByEnumeration) ;
      SOAPClient.invoke(urlEnumeration,"getEnumeration", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydataEnumeration=new Array();
		   querydataEnumeration=dojoEnumeration.EnumerationVOtoArray_fun(ul,true);
           totalCountEnumeration=ul[ul.length-1]["ns:id"]; 
      }); 
      querydataEnumeration.splice(querydataEnumeration.length-1,1);
	  gridEnumeration.selection.clear();
      modelEnumeration.setData(querydataEnumeration);
      //dijit.byId("grid").updateRowCount(querydataEnumeration.length); 
	   var totalpage=Math.ceil(new Number(totalCountEnumeration)/pagesizeEnumeration);
	  
	if(totalpage>1){
		if(pagenumberEnumeration==1){
			dijit.byId("but6Enumeration").setDisabled(true);
			dijit.byId("but7Enumeration").setDisabled(false);
		}else if(pagenumberEnumeration==totalpage){
			dijit.byId("but6Enumeration").setDisabled(false);
			dijit.byId("but7Enumeration").setDisabled(true);
		}else{
			dijit.byId("but6Enumeration").setDisabled(false);
			dijit.byId("but7Enumeration").setDisabled(false);
		}
	}else{
		dijit.byId("but6Enumeration").setDisabled(true);
		dijit.byId("but7Enumeration").setDisabled(true);
	
	}
	if(pagesizeEnumeration==0){
		totalpage=1;
		dijit.byId("but6Enumeration").setDisabled(true);
		dijit.byId("but7Enumeration").setDisabled(true);
	}
	if(totalpage==1)pagenumberEnumeration=1;
	
	 document.getElementById("rowCountEnumeration").innerHTML=i18nStr.di+" "+pagenumberEnumeration+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountEnumeration+" "+i18nStr.rowSize; 	
}

function init(){
	
 	gridEnumeration.onStyleRow=OnStyleRowClassBlue();
	getEnumerationVO(queryvoEnumeration);
}

 dojo.addOnLoad(init);   



function allopen(){
          for(var i =0;i<querydataEnumeration.length;i++){
            toggleEnumeration(i,true);
          }
 }  

function allclose(){
          for(var i =0;i<querydataEnumeration.length;i++){
            toggleEnumeration(i,false);
          }
}


function pageSizeChangeEnumeration(mylabel){
	pagesizeEnumeration=mylabel;
	pagenumberEnumeration=1;
	getEnumerationVO(queryvoEnumeration);
}

function allpageEnumeration(){
	pagesizeEnumeration=0;
	getEnumerationVO(queryvoEnumeration);
}

function upPageEnumeration(){
	pagenumberEnumeration--;
	getEnumerationVO(queryvoEnumeration);
}
function downPageEnumeration(){
	pagenumberEnumeration++;
	getEnumerationVO(queryvoEnumeration);
}


var addRowEnumeration = function(){
	gridEnumeration.addRow([false,0,"","",""],gridEnumeration.model.getRowCount());
} 

function removeEnumeration(){
       var s= new Array();
       var sall=gridEnumeration.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            deletedataEnumeration.splice(deletedataEnumeration.length,0,thisCell[1]);
       }}}
       gridEnumeration.model.remove(s);//grid.removeSelectedRows();
 }
function call_funUpdEnumeration() {
       var sall=gridEnumeration.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];
              if(dojox.validate.isText(thisCell[2], {minlength: 1})){vobject.fieldName=thisCell[2];
             }else{gridEnumeration.getCell(gridEnumeration.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
              if(dojox.validate.isText(thisCell[3], {minlength: 1})){vobject.enumerationType=thisCell[3];
             }else{gridEnumeration.getCell(gridEnumeration.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 




       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('EnumerationVO',vobject);
                SOAPClient.invoke(urlEnumeration, "createEnumeration", padd, false,  function GetEnu_callBack(ul, soapResponse){
                gridEnumeration.model.setDatum(ul,i,1);
				querydataEnumeration[i][${childRow}]=[addrow];
				});
	         }else{//modify row
                padd.add('EnumerationVO',vobject);
                SOAPClient.invoke(urlEnumeration, "updateEnumeration", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
			 call_funUpdGridSub(i);
        } }}//for
//submit delete
          for(var i=0;i<deletedataEnumeration.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedataEnumeration[i]);
               SOAPClient.invoke(urlEnumeration, "deleteEnumeration", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          deletedataEnumeration=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
	
 } 

									//totleinum=2
 //rowinum=0

 
</script>
</head>	 
<body class="tundra">
<div id="queryDivEnumeration"  style="margin-right: 0px;  height: 80px; display:none;"  >
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
							<td align="right" i18n="fieldName" >fieldName:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryEnumerationfieldName"  jsId="queryEnumerationfieldName"   dojoType="dijit.form.TextBox"  />
													</td>
														<td align="right"  i18n="enumerationType" >enumerationType:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="queryEnumerationenumerationType"  jsId="queryEnumerationenumerationType"   dojoType="dijit.form.TextBox"  />
												</td>  
				

    </tr>

    <td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybuttonEnumeration();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
</div>	

<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   Enumeration List</b></td>
		<td align="right" >
	<button dojoType="dijit.form.Button" onclick="addRowEnumeration();" iconClass="addIcon" i18n="add"  >add</button>
	<button dojoType="dijit.form.Button" onclick="removeEnumeration();" iconClass="delIcon" i18n="delete" >delete</button>
	<button dojoType="dijit.form.Button"  onclick="call_funUpdEnumeration();" i18n="save" iconClass="saveIcon">save</button>
	<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivEnumeration');" iconClass="queryIcon"  i18n="openQuery" >query</button>
	<span id="rowCountEnumeration"></span>
		<button dojoType="dijit.form.myButton" onclick="upPageEnumeration();"  id="but6Enumeration" disabled='true' jsId="but6Enumeration" iconClass="upPageIcon" ></button>
		<button dojoType="dijit.form.myButton" onclick="downPageEnumeration();" id="but7Enumeration" disabled='true' jsId="but7Enumeration" iconClass="downPageIcon" ></button>
		<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
			  <div dojoType="dijit.Menu">
				  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangeEnumeration(this.label);"></div>
				  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangeEnumeration(this.label);"></div>
			  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangeEnumeration(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangeEnumeration(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpageEnumeration();"></div>
			  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
		</div>
		<button dojoType="dijit.form.myButton" onclick="allopen();"  iconClass="allopenIcon" i18n="allopen" ></button>
		<button dojoType="dijit.form.myButton" onclick="allclose();" iconClass="allcloseIcon" i18n="allclose"  ></button>
		</td>
	</tr>
</table>	   

<div id="gridEnumeration"  dojoType="dojox.Grid"  autoWidth="false" style="{width:100%;height:85%}" 	jsId="gridEnumeration"	model="modelEnumeration" structure="mainLayout"  ></div>
</body>
<script type="text/javascript">trans18tag();</script>
</html>		