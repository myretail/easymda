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
			dojo.require("dojox.layout.FloatingPane");
			dojo.require("dijit.layout.TabContainer");
			dojo.require("dijit.layout.ContentPane");
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
	//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
							dojo.require("projectDojo.TaskForm");
			
		 function car2taskFormsFloatPara(id){
		  //this.ID=id;
		  this.deletedatacar2taskForms=new Array();
		  this.querydatacar2taskForms=new Array();
		  this.pagenumbercar2taskForms=1;
		  this.totalCountcar2taskForms=0;
		  this.pagesizecar2taskForms=10;
		  this.orderBycar2taskForms='0';
		  this.queryvocar2taskForms=new Object();
		  //this.oddstyle='';
		  this.modelcar2taskForms = new dojox.grid.data.Table(null, this.querydatacar2taskForms);
		  this.gridcar2taskForms=''
	 }
	 
	 var car2taskFormsFloatArray=new Array();
	
     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>

 					<script type="text/javascript" src="../order/car2taskFormsFloatAFTab.js"></script>
		
	  	<script type="text/javascript" >
	  var dojocar= new  projectDojo.car();
	  dojocar.initcar();
	//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
							 var dojoTaskForm= new  projectDojo.TaskForm();
			dojoTaskForm.initTaskForm();
			
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
//begin-----Ð¶Ç·Ó±í£¨Ç·Îªí£©-------------------------------------------------------------------------------------------	  

//end-----Ð¶Ç·Ó±í£¨Ç·Îª)-------------------------------------------------------------------------------------------

 
//begin-------Ê¾Ñ¯Ð±í£¬Í·,Ó´floatÚµÍ¼------------------------------------------------------------------------------------
 //Ð¶Ï±Ö¶Ç·1212ÉµlayoutÛµlayoutstructure  (Ú²Ñ¯layoutenumerationÖ¶Î²â´¦í£©!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 				var layoutSingleRowQuery=[{
		//fieldÖµÄ¬ÏµË³ò£¬´jsÐµtoArray×ªØµquerydateÈ¡
	    cells: [ [
						{name: 'openFloat', styles: 'text-align: center;', width: 3, get:function(inRowIndex){return '<img src="../image/EmbedLink.gif" style="cursor:pointer"  onclick="openFloat('+inRowIndex+',event);"  height="16" width="16" >';}},
                { name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				  				  {name: i18nStr.load,field:2, width: 8}
						  				
					]]}];	 
					
					
					
					
					
//end-------Ê¾Ñ¯Ð±í£¬Í·,Ó´floatÚµÍ¼------------------------------------------------------------------------------------
var onloadmy=function(){
										buildcar2taskForms(mainID);
						}					
var mainID;
var floatIndex=0;
var flag=0;//0,1

function openFloat(indexRow,e){
	mainID=querydatacar[indexRow][1];
	var FloatID ="openFloat_"+mainID;//É´ò¿ª¶floatÎ´Êµ
	var openFloat = dijit.byId(FloatID);
	if(openFloat==undefined){
			if(floatIndex==5){
			floatIndex=floatIndex-1;
			flag=0;
		}else if(floatIndex==0){
			floatIndex=floatIndex+1;
			flag=1;
		}else if(flag==0){
			floatIndex=floatIndex-1;
		}else if(flag==1){
			floatIndex=floatIndex+1;
		}

		var div = dojo.doc.createElement('div');
		dojo.body().appendChild(div);
		var fp = new dojox.layout.FloatingPane({
			id:FloatID,
			title:"float",
			maxable: true,
			closable: true,
			resizable: true ,
			dockable:true//,
			//onLoad:onloadmy,
			//href:"carQueryAFFloat.html"
		},div);
		dojo.style(fp.domNode,{
			width:"1000px",
			height:"600px",
			top:80+30*floatIndex, left:120+30*floatIndex,
			position:"absolute",
			zIndex:"980"
		});
		openFloat=fp;
											buildcar2taskForms(mainID);
								fp.startup();
	fp.show();


dojo.connect(openFloat, "resize", function(e){
	var innerID=""+openFloat.id.replace("car","");
			car2taskFormsFloatArray[""+innerID].gridcar2taskForms.resize({w: openFloat.domNode.clientWidth-16,h:openFloat.domNode.clientHeight-100});
		
}); 

	}else{
		openFloat.show();
		dojo.style(openFloat.domNode,{
			width:"1000px",
			height:"600px",
			//top:100, left:150,
			position:"absolute",
			zIndex:"980"});
		}
	
	
	if(dijit.byId("progMenu")==undefined){
		var pMenu = new dijit.Menu({contextMenuForWindow:true, id:"progMenu"});
		pMenu.addChild(new dijit.MenuItem({label:"width",iconClass:"dijitEditorIcon dijitEditorIconCut", onClick:heightFloat}));
		pMenu.addChild(new dijit.MenuItem({label:"height", iconClass:"dijitEditorIcon dijitEditorIconCut", onClick:widthFloat}));
		//pMenu.addChild(new dijit.MenuItem({label:"close all",  disabled:false , onClick:closeFloat}));
	}

}

function getAllOpenFloat(){
	var allFloatArray= [];
	for(var t in  $firstTabNameFloatArray){
		var tFloat=dijit.byId("openFloat_"+t);
		if(tFloat!=undefined){
			allFloatArray.push(tFloat);
		}
	}
	return allFloatArray;
}

function heightFloat(){
	var allFloatArray = getAllOpenFloat();
	if(allFloatArray.length!=0){
		var signHeight = dijit.byId("gridcar").domNode.clientHeight/allFloatArray.length;
		var tt=0;
		for (var i=0; i<allFloatArray.length;i++){
			dojo.style(allFloatArray[i].domNode,{
			width:dijit.byId("gridcar").domNode.clientWidth,
			height:signHeight,
			top:tt, left:0,
			position:"absolute",
			zIndex:"980"
		});
			allFloatArray[i].show();
			tt=tt+signHeight;
		}
	}
}

function widthFloat(){
	var allFloatArray = getAllOpenFloat();
	if(allFloatArray.length!=0){
		var signWidth = dijit.byId("gridcar").domNode.clientWidth/allFloatArray.length;
		var tt=0;
		for (var i=0; i<allFloatArray.length;i++){
			//allFloatArray[i].resize({t:tt ,l : 0,w:dijit.byId("gridcar").domNode.clientWidth,h:signHeight});
			dojo.style(allFloatArray[i].domNode,{
			width:signWidth,
			height:dijit.byId("gridcar").domNode.clientHeight,
			top:0, left:tt,
			position:"absolute",
			zIndex:"980"
		});
			allFloatArray[i].show();
			tt=tt+signWidth;
		}
	}
}




function getVOcar(queryvo){
	var totalCount=0;
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
      modelcar.setData(querydatacar);
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
 
 function pageSizeChangecar(mylabel){
	pagesizecar=mylabel;
	pagenumbercar=1;
	getVOcar(queryvocar);
}

function allpagecar(){
	pagesizecar=0;
	getVOcar(queryvocar);
}

function upPagecar(){
	pagenumbercar--;
	getVOcar(queryvocar);
}
function downPagecar(){
	pagenumbercar++;
	getVOcar(queryvocar);
}
 
function init(){
  getVOcar(queryvocar);
}

 dojo.addOnLoad(init);   
function querybutton(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvocar.id=0 ;
              queryvocar=new Object();
								  n=queryNumber_fun("load");
					  if(n==null){validstate=1;}else if(n.upSign!="%"){queryvocar.load=n;}  
							

			if(validstate==0){
              pagenumber=1;
			  getVOcar(queryvocar);
              //getVO(queryvocar,pagenumber,pagesize,'0'); 
              //if(totalpage>1){dijit.byId("but7").setDisabled(false);}else{dijit.byId("but7").setDisabled(true);} 
             }      
       }
//totleinum=1
 //rowinum=0

</script>
</head>
<body class="tundra">

<div id="queryDiv" style="margin-right: 0px;  height: 80px; display:none;" >
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
							<span id="queryloadImg0"  ><input type="text" class="editerNumber"   jsId="queryload"  id="queryload"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="queryloadImg1" style="{display:none}" ><input type="text"  class="editerNumberSmall" jsId="queryload1"  id="queryload1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryloadImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryloadImgdown" >></span>
							<span id="queryloadImg2div" style="{display:none}"> <input type="text"  class="editerNumberSmall"  jsId="queryload2"  id="queryload2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/nStart.gif" onclick="queryType(this);" id="queryloadImg" class="imgStyle">
							
						</td>
				
    <td align="right"    ></td><td align="right"    ></td><td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybutton();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
	    </div>	
 <table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   car List</b></td>
		<td align="right" >
				<button dojoType="dijit.form.Button" onclick="querydisplay('queryDiv');" iconClass="openQueryIcon"  i18n="openQuery" >query</button>
				<span id="rowCountcar"></span>
						<button dojoType="dijit.form.myButton" onclick="upPagecar();"  id="but6car" disabled='true' jsId="but6car" iconClass="upPageIcon" ></button>
						<button dojoType="dijit.form.myButton" onclick="downPagecar();" id="but7car" disabled='true' jsId="but7car" iconClass="downPageIcon" ></button>
						<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
							  <div dojoType="dijit.Menu">
								  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangecar(this.label);"></div>
								  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangecar(this.label);"></div>
							  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangecar(this.label);"></div>
									<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangecar(this.label);"></div>
									<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpagecar();"></div>
							  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
						</div>
			</div>    
	    <div style="{height:90%;width:100%}"  >
	         <div id="gridcar"  dojoType="dojox.Grid" autoWidth="false"  jsId="gridcar"	model="modelcar"  structure="layoutSingleRowQuery" singleClickEdit="true" ></div>
		</td>
	</tr>
</table>    
      
</body>
<script type="text/javascript">trans18tag();</script>
</html>
