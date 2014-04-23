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
      </style>
      <script type="text/javascript" src="../dojo/dojo-release-1.0.0/dojo/dojo.js"  
                djConfig="parseOnLoad: true, isDebug: true,locale: 'zh-cn', extraLocale: ['zh-TW', 'fr']"></script>
      <script>
    
            dojo.require("dojo.data.ItemFileWriteStore");
            dojo.require("dojo.parser");
            dojo.require("dijit.form.Button");
            dojo.require("dijit.Menu");
			dojo.require("dijit.Tree");
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
			dojo.require("projectDojo.OrgaPeoples");
     </script>
        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 	<script type="text/javascript" >
		var dojoOrgaPeoples= new  projectDojo.OrgaPeoples();
	    dojoOrgaPeoples.initOrgaPeoples();
		</script>

	 	 							 
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


					//begin buildLayout


var mainLayout =[{//?????????colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: i18nStr.detail, width: 3, get: getCheckOrgaPeoples, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
		
//
					   {name: i18nStr.orga,field: 2,get:function(inRowIndex){ var str='';if(querydataOrgaPeoples[inRowIndex]!=undefined && querydataOrgaPeoples[inRowIndex][2]!=undefined){str=querydataOrgaPeoples[inRowIndex][2][2];} return str;} ,width: 10 }
					//
					 ,   {name: i18nStr.people,field: 3,get:function(inRowIndex){ var str='';if(querydataOrgaPeoples[inRowIndex]!=undefined && querydataOrgaPeoples[inRowIndex][3]!=undefined){str=querydataOrgaPeoples[inRowIndex][3][2];} return str;} ,width: 10 }
										],[
									{ name: '\u8be6\u7ec6', colSpan: 4 ,styles: 'padding: 0; margin: 0;', get: getSubOrgaPeoples }//value: '<div style="height:0px; background-color: white;"></div>'
						  ]
				  ]
	  
				}];	 
var subInt=	$childRow;			
function getSubOrgaPeoples(inRowIndex){
		var cell = this;
		setTimeout(function() { buildSubgridOrgaPeoples(inRowIndex, cell); }, 0);
		var h =0;
		if(detailRowsOrgaPeoples[inRowIndex]&&querydataOrgaPeoples[inRowIndex][$childRow].length>0){
							h=65+25*querydataOrgaPeoples[inRowIndex][$childRow].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}				

//end buildLayout

var detailRowsOrgaPeoples=[];

function onBeforeRow(inDataIndex, inRow) {	if (inRow[1]!=undefined)inRow[1].hidden = !detailRowsOrgaPeoples[inDataIndex];}	

function toggleOrgaPeoples(inIndex, inShow) {
        			if (!inShow) destroySubGridIdGeneral('',querydataOrgaPeoples[inIndex][1],"OrgaPeoplesMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataOrgaPeoples[inIndex][1],"OrgaPeoplesChild");
				    detailRowsOrgaPeoples[inIndex] = inShow;
				    dijit.byId("gridOrgaPeoples").updateRow(inIndex); 
				    
    } 

function getCheckOrgaPeoples(inRowIndex) {
	var image = (detailRowsOrgaPeoples[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsOrgaPeoples[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleOrgaPeoples(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}





//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}

	  
function buildSubgridOrgaPeoples(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)Ç¸idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		var idmainDetail = makeSubGridIdGeneral('',querydataOrgaPeoples[inRowIndex][1],"OrgaPeoplesMainDetail");//makeSubgridIdMainDetail(querydataOrgaPeoples[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataOrgaPeoples[inRowIndex][1],"OrgaPeoplesChild");
		var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataOrgaPeoples[inRowIndex][$childRow];
		if(dataChild.length!=0){
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
					childProps.structure=childLayoutOdd;
				}else{
					childProps.structure=childLayout;
				}
				subGridChild = new dojox.Grid(childProps, child);//gridÎªÇ¶×±Ê±Ô¶DIVÄ´Ð¡
			}
			if (subGridChild) {
				subGridChild.render();
				subGridChild.cacheHeight = subGridChild.domNode.offsetHeight;
			}	      				
		}
		inCell.grid.rowHeightChanged(inRowIndex);
    }   
}
//var childLayout=//???????????????????????????????/ Ö±É£jshtml

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
		   querydataOrgaPeoples=dojoOrgaPeoples.OrgaPeoplesVOtoArray_fun(ul,false);
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
	
 	dojo.connect(dijit.byId("gridOrgaPeoples"), "dodblclick", function(e){
	   if(document.getElementById('queryDivOrgaPeoples').style.display=='')document.getElementById('queryDivOrgaPeoples').style.display='none';
	   if(document.getElementById('addDivOrgaPeoples').style.display=='none')document.getElementById('addDivOrgaPeoples').style.display='';
		 document.getElementById('erowIndexOrgaPeoples').value=e.rowIndex;
		 document.getElementById('OrgaPeoplesId').value=querydataOrgaPeoples[e.rowIndex][1];
		 	 			 
									dijit.byId("addOrgaPeoplesorga").setValue(querydataOrgaPeoples[e.rowIndex][2][1]);
												dijit.byId("addOrgaPeoplespeople").setValue(querydataOrgaPeoples[e.rowIndex][3][1]);
								   
	});  
	gridOrgaPeoples.onStyleRow=OnStyleRowClassBlue();
	getOrgaPeoplesVO(queryvoOrgaPeoples);
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


 
//addDiv---------------begin-------------------------------------
var addDivAdd = function(){
	 //if(document.getElementById('queryDivOrgaPeoples').style.display=='')document.getElementById('queryDivOrgaPeoples').style.display='none';
	 //if(document.getElementById('addDivOrgaPeoples').style.display=='none')document.getElementById('addDivOrgaPeoples').style.display='';
	  document.getElementById('gridSub').style.height='60px';
	 //add
					
						dijit.byId("addOrgaPeoplesorga").setValue('');
			dijit.byId("addOrgaPeoplesorga").setDisplayedValue('');
								dijit.byId("addOrgaPeoplespeople").setValue('');
			dijit.byId("addOrgaPeoplespeople").setDisplayedValue('');
				
	document.getElementById('OrgaPeoplesId').value='0';
	
} 
function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new Object();
    vobject.id=document.getElementById('OrgaPeoplesId').value;
	var passAll=0;
					
			if(dijit.byId("addOrgaPeoplesorga").isValid(true)){
			//vobject.orga=dijit.byId("addorga").getValue();
			var manageable=new Object();
			manageable.id=dijit.byId("addOrgaPeoplesorga").getValue();
			vobject.orga=manageable;
		}else{
			passAll=1;
		}
				if(dijit.byId("addOrgaPeoplespeople").isValid(true)){
			//vobject.people=dijit.byId("addpeople").getValue();
			var manageable=new Object();
			manageable.id=dijit.byId("addOrgaPeoplespeople").getValue();
			vobject.people=manageable;
		}else{
			passAll=1;
		}
		
if(passAll==0){
		var addrow=[];
																addrow.push([false,addOrgaPeoplesorga.getValue(),addOrgaPeoplesorga.getDisplayedValue()]);
												addrow.push([false,addOrgaPeoplespeople.getValue(),addOrgaPeoplespeople.getDisplayedValue()]);
						 if(vobject.id==0){//create new row
		padd.add('OrgaPeoplesVO',vobject);
		SOAPClient.invoke(urlOrgaPeoples, "createOrgaPeoples", padd, false,  function GetEnu_callBack(ul, soapResponse){
			addrow.splice(0,0,false,ul);
			querydataOrgaPeoples[querydataOrgaPeoples.length]=addrow;
			document.getElementById('erowIndexOrgaPeoples').value=querydataOrgaPeoples.length-1;
			gridOrgaPeoples.updateRowCount(querydataOrgaPeoples.length);
			document.getElementById('OrgaPeoplesId').value=ul;
			});
	 }else{//modify row
		padd.add('OrgaPeoplesVO',vobject);
		SOAPClient.invoke(urlOrgaPeoples, "updateOrgaPeoples", padd, false,  function GetEnu_callBack(ul, soapResponse){
		});
		addrow.splice(0,0,false,vobject.id);
		querydataOrgaPeoples[document.getElementById('erowIndexOrgaPeoples').value]=addrow;
	 }
	}   call_funUpdGridSub();
	gridOrgaPeoples.updateRow(document.getElementById('erowIndexOrgaPeoples').value); 
}

 function addDivRemove(){
     if(window.confirm(i18nStr.deleteConfirm)){
       var s = dijit.byId("gridOrgaPeoples").rowCount;
		console.log("sss:"+s);
        	  var delrowIndex=document.getElementById('erowIndexOrgaPeoples').value;
              var sId=document.getElementById('OrgaPeoplesId').value;
              var pdel = new SOAPClientParameters();      
               pdel.add('id',sId);
               SOAPClient.invoke(urlOrgaPeoples, "deleteOrgaPeoples", pdel, false,  function GetEnu_callBack(ul, soapResponse){
               if(s-1!=delrowIndex){
					var e =document.createEvent("HTMLEvents");
					e.rowIndex=delrowIndex;
					dijit.byId("gridOrgaPeoples").dodblclick(e);
			   }else{if(document.getElementById('addDivOrgaPeoples').style.display=='')document.getElementById('addDivOrgaPeoples').style.display='none';}
			   dijit.byId("gridOrgaPeoples").model.remove(delrowIndex);
			   totalCountOrgaPeoples--;
			   var totalpage=Math.ceil(new Number(new Number(totalCountOrgaPeoples))/pagesizeOrgaPeoples);
			   document.getElementById("rowCountOrgaPeoples").innerHTML=i18nStr.di+" "+pagenumberOrgaPeoples+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountOrgaPeoples+" "+i18nStr.rowSize; 
               
	        });   
      }
 }    
 
 function adddis(){
	
	querydisplay("addDivOrgaPeoples");
	if(document.getElementById('addDivOrgaPeoples').style.display!='none')addDivAdd();
} 
//addDiv---------------end---------------------------------------	 
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

</script>
</head>	 
<body class="tundra">
 <!--rowinum=$rowinum-->
 <!--addHeight=$addHeight-->
<div id="addDivOrgaPeoples" style="margin-right: 0px;  height: 280px; display:none;" >
              <table align="center" width="100%" id="0" class="editorTable"  >
                <tr >
				<td align="center" style="{width:11%}" i18n="addNote" ></td>
                <td style="{width:22%}" ><input id="OrgaPeoplesId" style="{display:none}"  type="text"  /></td>
                <td style="{width:11%}"><input id="erowIndexOrgaPeoples" style="{display:none}"  type="text"  /></td>
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

								<tr><td align="right"  i18n="orga"  ></td>
					<td align="left" ><input  id="addOrgaPeoplesorga"  jsId="addOrgaPeoplesorga" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrgaPeoples.orgaStore" onchange="orgaSet(0,arguments[0]);" /></td>  
														<td align="right"  i18n="people"  ></td>
					<td align="left" ><!--colspan="3" --><input  id="addOrgaPeoplespeople"  jsId="addOrgaPeoplespeople" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrgaPeoples.peopleStore" onchange="peopleSet(0,arguments[0]);" /></td>  
						    <td align="right"    ></td><td align="right"    ></td></tr>
	

<tr><td align="right"> &nbsp;</td></tr>
	</table>
	<div style="{height:200px;}"  >
		<div id="gridSub"   dojoType="dojox.Grid" autoWidth="false" style="{width:1200px;height:200px;left:30px;}"  jsId="gridSub"	model="modelChildAdd"  structure="childAddLayout" singleClickEdit="true" ></div>
	 </div>
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button dojoType="dijit.form.Button" id="but1" jsId="but1" onclick="addRowSub();"  disabled='false' iconClass="addIcon" i18n="addRow" >addSub</button>
	 <button dojoType="dijit.form.Button" id="but2" jsId="but2" onclick="deleteSub();" disabled='false' iconClass="delIcon" i18n="delRow" >deleteSub</button>
	 <button dojoType="dijit.form.Button" onclick="addDivRemove();" iconClass="delIcon"  i18n="delete" >remove</button>
	 <button dojoType="dijit.form.Button" onclick="addDivSave();" iconClass="saveIcon"  i18n="save">save</button>
			 
</div>

 <!--rowinum=$rowinum-->

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

			
					<tr><td align="right"  i18n="orga"  ></td>
					<td align="left" ><input  id="queryOrgaPeoplesorga"  jsId="queryOrgaPeoplesorga" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrgaPeoples.orgaStore"  /><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryOrgaFloat.html"title="detail" execute="" ></div></div></td>  
					
				
					<td align="right"  i18n="people"  ></td>
					<td align="left" colspan="3"  ><!----><input  id="queryOrgaPeoplespeople"  jsId="queryOrgaPeoplespeople" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrgaPeoples.peopleStore"  /><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryPeoplesFloat.html"title="detail" execute="" ></div></div></td>  
					
	    <td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybuttonOrgaPeoples();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
	    </div>	

<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   OrgaPeoples List</b></td>
		<td align="right" >
	<!--button dojoType="dijit.form.Button" onclick="addRowOrgaPeoples();" iconClass="addIcon" i18n="add"  >add</button>
	<button dojoType="dijit.form.Button" onclick="removeSelectedRowsOrgaPeoples();" iconClass="delIcon" i18n="delete" >delete</button>
	<button dojoType="dijit.form.Button"  onclick="call_funUpdOrgaPeoples();" i18n="save" iconClass="saveIcon">save</button>
	<button dojoType="dijit.form.Button" onclick="addDivAdd();" iconClass="addIcon"  >add</button-->
	<button dojoType="dijit.form.Button" onclick="adddis();" iconClass="openDivIcon"  i18n="edit" >openAdd</button>
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
</body>
<script type="text/javascript">trans18tag();</script>
</html>					 





















					