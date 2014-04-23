<%
String peopleId = request.getParameter("peopleId");
%>
<html>
<!--Ò»Ô¶à£¬Ö»Ò»Ò»Ó±í£¬Ã»Ð¿Ò»Ô¶Ó±var dataChild=querydatacar[inRowIndex]-->
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
			dojo.require("projectDojo.car");
     </script>
        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 	<script type="text/javascript" >
		var dojocar= new  projectDojo.car();
	    dojocar.initcar();
	//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
							 var dojoTaskForm= new  projectDojo.TaskForm();
			dojoTaskForm.initTaskForm();
			</script>

	 	 	 
	<script type="text/javascript" >
	  var urlcar = getUrl()+ "services/carManageService";
	  var deletedatacar =  new Array();
	  var querydatacar =  new Array();
	  var pagenumbercar=1;
	  var totalCountcar=0;
	  var pagesizecar=10;
	  var orderBycar='0';
	  var queryvocar=new Object();
	  var oddstyle='';
	  var modelcar = new dojox.grid.data.Table(null, querydatacar);
	  var urle = getUrl()+ "services/BasicManageService";
	  var modelcarDetail;
	  var modelcarChild;
	  


			//begin buildLayout


var mainLayout =[{//?????????colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: i18nStr.detail, width: 3, get: getCheckcar, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				  				  {name: i18nStr.load,field:2, width: 8}
						  				
					],[
									{ name: '\u8be6\u7ec6', colSpan: 3 ,styles: 'padding: 0; margin: 0;', get: getSubcar }//value: '<div style="height:0px; background-color: white;"></div>'
						  ]
				  ]
	  
				}];	 
var subInt=	$childRow;			
function getSubcar(inRowIndex){
		var cell = this;
		setTimeout(function() { buildSubgridcar(inRowIndex, cell); }, 0);
		var h =0;
		if(detailRowscar[inRowIndex]&&querydatacar[inRowIndex][$childRow].length>0){
							h=65+25*querydatacar[inRowIndex][$childRow].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}				

//end buildLayout

var detailRowscar=[];

function onBeforeRow(inDataIndex, inRow) {	if (inRow[1]!=undefined)inRow[1].hidden = !detailRowscar[inDataIndex];}	

function togglecar(inIndex, inShow) {
        			if (!inShow) destroySubGridIdGeneral('',querydatacar[inIndex][1],"carMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydatacar[inIndex][1],"carChild");
				    detailRowscar[inIndex] = inShow;
				    dijit.byId("gridcar").updateRow(inIndex); 
				    
    } 

function getCheckcar(inRowIndex) {
	var image = (detailRowscar[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowscar[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="togglecar(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}





//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}

	  
function buildSubgridcar(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)Ç¸idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		var idmainDetail = makeSubGridIdGeneral('',querydatacar[inRowIndex][1],"carMainDetail");//makeSubgridIdMainDetail(querydatacar[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydatacar[inRowIndex][1],"carChild");
		var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydatacar[inRowIndex][$childRow];
		if(dataChild.length!=0){
			if (subGridChild){
				subGridChild.model.setData(dataChild);
				child.appendChild(subGridChild.domNode);
			}else{
				modelcarChild=new dojox.grid.data.Table(null, dataChild);
				var childProps= {
								autoHeight: true, 
								autoRender: false,
								rowCount:dataChild.length,
								model:modelcarChild,							};
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

function querybuttoncar(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvocar=new Object();
              n=queryNumber_fun("carload");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvocar.load=n;}  
			

			if(validstate==0){
              pagenumbercar=1;
              getcarVO(queryvocar); 
             }      
       }

function getcarVO(queryvo){
	var totalCount=0;
	deletedatacar =new Array();
      var pu = new SOAPClientParameters2();
      pu.add('carVO',queryvo) ;
      pu.add('pageNumber',pagenumbercar) ;
	    pu.add('pageSize',pagesizecar) ;
	    pu.add('orderBy',orderBycar) ;
      SOAPClient.invoke(urlcar,"getcar", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydatacar=new Array();
		   querydatacar=dojocar.carVOtoArray_fun(ul,false);
           totalCountcar=ul[ul.length-1]["ns:id"]; 
      }); 
      querydatacar.splice(querydatacar.length-1,1);
	  gridcar.selection.clear();
      modelcar.setData(querydatacar);
      //dijit.byId("grid").updateRowCount(querydatacar.length); 
	   var totalpage=Math.ceil(new Number(totalCountcar)/pagesizecar);
	  
	if(totalpage>1){
		if(pagenumbercar==1){
			dijit.byId("but6car").setDisabled(true);
			dijit.byId("but7car").setDisabled(false);
		}else if(pagenumbercar==totalpage){
			dijit.byId("but6car").setDisabled(false);
			dijit.byId("but7car").setDisabled(true);
		}else{
			dijit.byId("but6car").setDisabled(false);
			dijit.byId("but7car").setDisabled(false);
		}
	}else{
		dijit.byId("but6car").setDisabled(true);
		dijit.byId("but7car").setDisabled(true);
	
	}
	if(pagesizecar==0){
		totalpage=1;
		dijit.byId("but6car").setDisabled(true);
		dijit.byId("but7car").setDisabled(true);
	}
	if(totalpage==1)pagenumbercar=1;
	
	 document.getElementById("rowCountcar").innerHTML=i18nStr.di+" "+pagenumbercar+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountcar+" "+i18nStr.rowSize; 	
}

function init(){
	
 	dojo.connect(dijit.byId("gridcar"), "dodblclick", function(e){
	   if(document.getElementById('queryDivcar').style.display=='')document.getElementById('queryDivcar').style.display='none';
	   if(document.getElementById('addDivcar').style.display=='none')document.getElementById('addDivcar').style.display='';
		 document.getElementById('erowIndexcar').value=e.rowIndex;
		 document.getElementById('carId').value=querydatacar[e.rowIndex][1];
		 	 									dijit.byId("addcarload").setValue(querydatacar[e.rowIndex][2]);
						 			 
					   
	});  
	gridcar.onStyleRow=OnStyleRowClassBlue();
	getcarVO(queryvocar);
}

 dojo.addOnLoad(init);   



 
//addDiv---------------begin-------------------------------------
var addDivAdd = function(){
	 //if(document.getElementById('queryDivcar').style.display=='')document.getElementById('queryDivcar').style.display='none';
	 //if(document.getElementById('addDivcar').style.display=='none')document.getElementById('addDivcar').style.display='';
	  document.getElementById('gridSub').style.height='60px';
	 //add
															dijit.byId("addcarload").setValue('');
														
		
	document.getElementById('carId').value='0';
	
} 
function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new Object();
    vobject.id=document.getElementById('carId').value;
	var passAll=0;
										if(dijit.byId("addcarload").isValid(true)){
					var nload=new NumberQuery();
					nload.upNumber=dijit.byId("addcarload").getValue();
					vobject.load=nload;
				}else{
					passAll=1;
				}
										
	
if(passAll==0){
		var addrow=[];
														addrow.push(vobject.load.upNumber);
																	 if(vobject.id==0){//create new row
		padd.add('carVO',vobject);
		SOAPClient.invoke(urlcar, "createcar", padd, false,  function GetEnu_callBack(ul, soapResponse){
			addrow.splice(0,0,false,ul);
			querydatacar[querydatacar.length]=addrow;
			document.getElementById('erowIndexcar').value=querydatacar.length-1;
			gridcar.updateRowCount(querydatacar.length);
			document.getElementById('carId').value=ul;
			});
	 }else{//modify row
		padd.add('carVO',vobject);
		SOAPClient.invoke(urlcar, "updatecar", padd, false,  function GetEnu_callBack(ul, soapResponse){
		});
		addrow.splice(0,0,false,vobject.id);
		querydatacar[document.getElementById('erowIndexcar').value]=addrow;
	 }
	}   call_funUpdGridSub();
	gridcar.updateRow(document.getElementById('erowIndexcar').value); 
}

 function addDivRemove(){
     if(window.confirm(i18nStr.deleteConfirm)){
       var s = dijit.byId("gridcar").rowCount;
		console.log("sss:"+s);
        	  var delrowIndex=document.getElementById('erowIndexcar').value;
              var sId=document.getElementById('carId').value;
              var pdel = new SOAPClientParameters();      
               pdel.add('id',sId);
               SOAPClient.invoke(urlcar, "deletecar", pdel, false,  function GetEnu_callBack(ul, soapResponse){
               if(s-1!=delrowIndex){
					var e =document.createEvent("HTMLEvents");
					e.rowIndex=delrowIndex;
					dijit.byId("gridcar").dodblclick(e);
			   }else{if(document.getElementById('addDivcar').style.display=='')document.getElementById('addDivcar').style.display='none';}
			   dijit.byId("gridcar").model.remove(delrowIndex);
			   totalCountcar--;
			   var totalpage=Math.ceil(new Number(new Number(totalCountcar))/pagesizecar);
			   document.getElementById("rowCountcar").innerHTML=i18nStr.di+" "+pagenumbercar+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountcar+" "+i18nStr.rowSize; 
               
	        });   
      }
 }    
 
 function adddis(){
	
	querydisplay("addDivcar");
	if(document.getElementById('addDivcar').style.display!='none')addDivAdd();
} 
//addDiv---------------end---------------------------------------	 
function allopen(){
          for(var i =0;i<querydatacar.length;i++){
            togglecar(i,true);
          }
 }  

function allclose(){
          for(var i =0;i<querydatacar.length;i++){
            togglecar(i,false);
          }
}

function pageSizeChangecar(mylabel){
	pagesizecar=mylabel;
	pagenumbercar=1;
	getcarVO(queryvocar);
}

function allpagecar(){
	pagesizecar=0;
	getcarVO(queryvocar);
}

function upPagecar(){
	pagenumbercar--;
	getcarVO(queryvocar);
}
function downPagecar(){
	pagenumbercar++;
	getcarVO(queryvocar);
}

</script>
</head>	 
<body class="tundra">
 <!--rowinum=$rowinum-->
 <!--addHeight=$addHeight-->
<div id="addDivcar" style="margin-right: 0px;  height: 280px; display:none;" >
              <table align="center" width="100%" id="0" class="editorTable"  >
                <tr >
				<td align="center" style="{width:11%}" i18n="addNote" ></td>
                <td style="{width:22%}" ><input id="carId" style="{display:none}"  type="text"  /></td>
                <td style="{width:11%}"><input id="erowIndexcar" style="{display:none}"  type="text"  /></td>
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
				<td align="right" i18n="load" >load:</td>
			<td align="left"  >
							<input type="text" class="editerNumber"   jsId="addcarload"  id="addcarload"  dojoType="mydojo.NumberTextBox" constraints="{min:0,max:9999999,places:4 }" />
			</td>
	
    <td align="right"    ></td><td align="right"    ></td><td align="right"    ></td><td align="right"    ></td></tr>

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

<div id="queryDivcar" style="margin-right: 0px;  height: 80px; display:none;" >
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
				<td align="right" i18n="load" >load:</td>
			<td align="left"  >
							<span id="querycarloadImg0"  ><input type="text" class="editerNumber"   jsId="querycarload"  id="querycarload"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="querycarloadImg1" style="{display:none}" ><input type="text"  class="editerNumberSmall" jsId="querycarload1"  id="querycarload1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querycarloadImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querycarloadImgdown" >></span>
							<span id="querycarloadImg2div" style="{display:none}"> <input type="text"  class="editerNumberSmall"  jsId="querycarload2"  id="querycarload2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/nStart.gif" onclick="queryType(this);" id="querycarloadImg" class="imgStyle">
							
						</td>
				
    <td align="right"    ></td><td align="right"    ></td><td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybuttoncar();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
	    </div>	

<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   car List</b></td>
		<td align="right" >
	<!--button dojoType="dijit.form.Button" onclick="addRowcar();" iconClass="addIcon" i18n="add"  >add</button>
	<button dojoType="dijit.form.Button" onclick="removeSelectedRowscar();" iconClass="delIcon" i18n="delete" >delete</button>
	<button dojoType="dijit.form.Button"  onclick="call_funUpdcar();" i18n="save" iconClass="saveIcon">save</button>
	<button dojoType="dijit.form.Button" onclick="addDivAdd();" iconClass="addIcon"  >add</button-->
	<button dojoType="dijit.form.Button" onclick="adddis();" iconClass="openDivIcon"  i18n="edit" >openAdd</button>
	<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivcar');" iconClass="queryIcon"  i18n="openQuery" >query</button>
	<span id="rowCountcar"></span>
		<button dojoType="dijit.form.myButton" onclick="upPagecar();"  id="but6car" disabled='true' jsId="but6car" iconClass="upPageIcon" >pageup</button><!--span dojoType="dijit.Tooltip" connectId="but6">pageup</span-->
		<button dojoType="dijit.form.myButton" onclick="downPagecar();" id="but7car" disabled='true' jsId="but7car" iconClass="downPageIcon" >pagedown</button><!--span dojoType="dijit.Tooltip" connectId="but7">pagedown</span-->
		<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
			  <div dojoType="dijit.Menu">
				  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangecar(this.label);"></div>
				  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangecar(this.label);"></div>
			  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangecar(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangecar(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpagecar();"></div>
			  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
		</div>
		<button dojoType="dijit.form.myButton" onclick="allopen();"  iconClass="allopenIcon" i18n="allopen" >allopen</button>
		<button dojoType="dijit.form.myButton" onclick="allclose();" iconClass="allcloseIcon" i18n="allclose"  >allclose</button>
		</td>
	</tr>
</table>	   

<div id="gridcar"  dojoType="dojox.Grid"  autoWidth="false" style="{width:100%;height:85%}" 	jsId="gridcar"	model="modelcar" structure="mainLayout"  ></div>
</body>
<script type="text/javascript">trans18tag();</script>
</html>					 





















					