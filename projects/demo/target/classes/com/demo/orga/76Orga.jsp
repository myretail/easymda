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
			@import "../dojo/dojo-release-1.0.0/dojox/layout/tests/_expando.css"; 
      </style>
      <script type="text/javascript" src="../dojo/dojo-release-1.0.0/dojo/dojo.js"  
                djConfig="parseOnLoad: true, isDebug: true,locale: 'zh-cn', extraLocale: ['zh-TW', 'fr']"></script>
      <script>
    
            dojo.require("dojo.data.ItemFileWriteStore");
            dojo.require("dojo.parser");
            dojo.require("dijit.form.Button");
			dojo.require("dojox.layout.FloatingPane");
			dojo.require("dijit.layout.TabContainer");
			dojo.require("dijit.layout.BorderContainer");
			dojo.require("dijit.layout.ContentPane");
			dojo.require("dojox.layout.ExpandoPane");
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
			dojo.require("dijit.Dialog");
            dojo.registerModulePath("mydojo", "../../../js/mydojo");
            dojo.require("mydojo.FilteringSelect");
            dojo.require("mydojo.ValidationTextBox");
            dojo.require("mydojo.NumberTextBox");
			dojo.registerModulePath("projectDojo", "../../../dojo/projectDojo");
			dojo.require("projectDojo.Orga");
				//??¡è???????????????¨¨?¡§		
							dojo.require("projectDojo.OrgaPeoples");
			     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	<script type="text/javascript" >
		var dojoOrga= new  projectDojo.Orga();
	    dojoOrga.initOrga();
	//??¡è???????????????¨¨?¡§		
							 var dojoOrgaPeoples= new  projectDojo.OrgaPeoples();
			dojoOrgaPeoples.initOrgaPeoples();
			     </script>
 			<script type="text/javascript" src="../orga/orga2orgaPeoplesTreeRightCrudAFTab.js"></script>
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
//------begin--------for tree----------------
	var selectNode;
	var data =new Array();
	var poptarts ={ label:'name',identifier:'eId',items:data};
	var popStore = new dojo.data.ItemFileWriteStore({data: poptarts});
	var treeModel = new dijit.tree.ForestStoreModel({
  				store: popStore,
  				rootId: "root",
  				rootLabel: "",
  				childrenAttrs: ["children"]
  			});
	
	function addTreeNode(pid,nodeName,nodeType,id){
               var pInfo = {
								parent: (pid.item.root? null:pid.item),		
								attribute: "children"	
							};
               popStore.newItem({name: nodeName,type:nodeType ,eId:id,haveChild:"0"}, pInfo);
    }  
    
	function delTreeNode(id){
		var node = dijit.byId("tree")._itemNodeMap[id];
		popStore.deleteItem(node.item);//???¡À??????
	  }  
	  
	function setTreeNode(id,nodeName,nodeType){
		var node = dijit.byId("tree")._itemNodeMap[id];
		popStore.setValue(node.item,"name",nodeName);         
		popStore.setValue(node.item,"type",nodeType);      
		node.setLabelNode(nodeName);
	}  
    
	function getTreeNodes(queryvoOrga,chitem,layerInt,layerSum){//¡Á?layerInt=0   (0,1,null,0,2);
	
             var pl = new SOAPClientParameters2();
             pl.add('OrgaVO',queryvoOrga) ;
             pl.add('pageNumber',pagenumberOrga) ;
             pl.add('pageSize',pagesizeOrga) ;
             pl.add('orderBy',orderByOrga) ;
             SOAPClient.invoke(urlOrga, "getOrga", pl, false,  function GetEnu_callBack(ul, soapResponse){
               var pInfo = {
                   					parent: chitem,		
                   					attribute: "children"	
                   		};
               if(ul!=null && ul.length-1>0 ){
                     var tempArr=dojoOrga.OrgaVOtoArray_fun(ul,false);
                     for(var i = 0; i < ul.length-1; i++){		
                                  var ulo=ul[i];
								  var newitem=popStore.newItem({name: tempArr[i][2],type:ulo["ns:parentId"] ,eId:ulo["ns:id"],haveChild:"0"}, pInfo);				//haveChild=0??1?????2??
                                  queryvoOrga=new Object();
								  queryvoOrga.parentId=ulo["ns:id"];
								  if(layerInt<layerSum)getTreeNodes(queryvoOrga,newitem,layerInt+1,layerSum);
                            }
                      if(chitem!=null){
                            popStore.setValue(chitem,"haveChild","1"); 
                            var node = dijit.byId("tree")._itemNodeMap[chitem.eId];
                            node._updateItemClasses(node.item);
                      }
                }else{
                    popStore.setValue(chitem,"haveChild","2");  
                }       
          });
        
        }
	function expandAllChildrenNode(tree,treeNode,layerInt,layerSum){
		  tree._expandNode(treeNode);
          var childrenArray=treeNode.getChildren();
          for (var i=0; i<childrenArray.length; i++){	
             if(layerInt<layerSum) expandAllChildrenNode(tree,childrenArray[i],layerInt+1,layerSum);
             if(layerInt==layerSum)childrenArray[i]._updateItemClasses(childrenArray[i].item);
          }
	}  	
//--end -----for tree------------------------------
	
	function call_funUpdOrga() {
       //var s = grid.selection.getSelected();
       //var  d=new DateTimeQuery();
       //var n=new NumberQuery();
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
 
	




       if(passAll==0){
			
			vobject.parentId=queryvoOrga.parentId;
			
             if(thisCell[1]==0){//create new row
                padd.add('OrgaVO',vobject);
                SOAPClient.invoke(urlOrga, "createOrga", padd, false,  function GetEnu_callBack(ul, soapResponse){
                gridOrga.model.setDatum(ul,i,1);
				addTreeNode(selectNode,thisCell[2],vobject.parentId,ul);
				});
	         }else{//modify row
                padd.add('OrgaVO',vobject);
                SOAPClient.invoke(urlOrga, "updateOrga", padd, false,  function GetEnu_callBack(ul, soapResponse){
                setTreeNode(vobject.id,thisCell[2],vobject.parentId);
				});
	         }
        } }}//for
//submit delete
          for(var i=0;i<deletedataOrga.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedataOrga[i]);
               SOAPClient.invoke(urlOrga, "deleteOrga", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             delTreeNode(deletedataOrga[i]);
	           });
          }
          deletedataOrga=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
 } 
 
 function removeSelectedRowsOrga(){
       //var s = gridOrga.selection.getSelected();
       var s= new Array();
       var sall=gridOrga.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            deletedataOrga.splice(deletedataOrga.length,0,thisCell[1]);
		 }}}
       gridOrga.model.remove(s);//gridOrga.removeSelectedRows();
 }
        
addRowOrga = function(){
          	gridOrga.addRow([false,0,"","",""],gridOrga.model.getRowCount());
	        } 	 
	 

	

																						
var layoutSingleRowOrga=[{
          
 //field????????¨°???js??toArray¡Á???querydate??
	   
				 cells: [ [
							//{name: '??', width: 3, get:getChoise},
						   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
						   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
      					  {name: i18nStr.orgaName, field: 2,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
					            					,   {name: i18nStr.orgaCode, field: 3,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
					            					,   {name: i18nStr.sno, field: 4,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            				    ,   {name: i18nStr.remark, field: 5,width: 10, editor: dojox.grid.editors.Editor,required:false, editorToolbar: true  }
					        	  
                                        ] ]
                           }]; 


/*	dojo.connect(dijit.byId("OrgaAFTab"), "selectChild", function(e){
			if (dijit.byId("OrgaAFTab").selectedChildWidget.id=="orga2orgaPeoples"){
			buildorga2orgaPeoples();
				}
		}); */
function myOnLoad(){
	dojo.connect(dijit.byId("OrgaAFTab"), "selectChild", function(e){
	clickRowTab();
	}); 
}
function resetNU(trueTab){
						NUorga2orgaPeoples=true;
				NUgridOrga=true;
}

function clickRowTab(){
		if(dijit.byId("OrgaAFTab").selectedChildWidget.id=='OrgaCrud'){
		if(mainID!=undefined && mainID!=''&& NUgridOrga ){
			queryvoOrga=new Object();
			queryvoOrga.parentId=mainID+'';
			getVOOrga(queryvoOrga);
			NUgridOrga =false;
		}

									}else if (dijit.byId("OrgaAFTab").selectedChildWidget.id=="orga2orgaPeoples"){
					buildorga2orgaPeoples();
													}
		}
				

function getVOOrga(queryvo){
	var totalCount=0;
      var pu = new SOAPClientParameters2();
      pu.add('OrgaVO',queryvo) ;
      pu.add('pageNumber',pagenumberOrga) ;
	    pu.add('pageSize',pagesizeOrga) ;
	    pu.add('orderBy',orderByOrga) ;
      SOAPClient.invoke(urlOrga,"getOrga", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydataOrga=new Array();
		   querydataOrga=dojoOrga.OrgaVOtoArray_fun(ul,false);
           totalCountOrga=ul[ul.length-1]["ns:id"]; 
      }); 
      querydataOrga.splice(querydataOrga.length-1,1);
      modelOrga.setData(querydataOrga);
	  gridOrga.refresh();
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
var connecthandle=0 ;
var handle ;
var mainID;
var NUgridOrga=false;

function init(){
 var _tree=dijit.byId("tree");  
	//queryvoOrga=new Object();
    queryvoOrga.parentId=0;
	getTreeNodes(queryvoOrga,null,0,2);
	expandAllChildrenNode(_tree,_tree.rootNode,0,1);
	
	dojo.connect(dijit.byId("tree"), "_onExpandoClick", function(message){
		   var node = message.node;
		   var ch2node=node.getChildren();
		   for (var i=0; i<ch2node.length; i++){	
		   if(ch2node[i].getChildren().length==0&&ch2node[i].item.haveChild=="0"){
			 var ch2item =ch2node[i].item;
			 queryvoOrga=new Object();
			 queryvoOrga.parentId=ch2item.eId;
			 getTreeNodes(queryvoOrga,ch2item,0,1);
		   }}
	});   
	 dojo.connect(_tree, "onClick", function(item,node){
	 //????tab??
			selectNode=node;
			selectNodeIdentity = _tree.store.getIdentity(item);
			mainID=item["eId"];
			if(mainID!=undefined){
				resetNU();
				clickRowTab();	
			}else{
				queryvoOrga=new Object();
				queryvoOrga.parentId=0;
				getVOOrga(queryvoOrga);
			}
   }); 
  
setTimeout(function(){
	dijit.byId("gridOrga").resize({w:dojo.byId("gridOrga").parentNode.clientWidth,h: dojo.byId("gridOrga").parentNode.clientHeight-40});
	myOnLoad();
	dojo.connect(dijit.byId("topPane"), "_afterResize", function(e){resizeAll();}); 
	dojo.connect(dijit.byId("rightPane"), "resize", function(e){resizeAll();}); 
	 
	
	
	   /*dojo.connect(dijit.byId("rightPane"), "_afterResize", function(e){
			OrgaAFTab.resize({w: dijit.byId("rightPane").domNode.clientWidth-10,h: document.body.clientHeight-40});
			if(dijit.byId("gridorga2orgaPeoples")!=undefined)dijit.byId("gridorga2orgaPeoples").resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100});
	 		dijit.byId("gridOrga").resize({w:document.body.clientWidth-dijit.byId("rightPane").domNode.clientWidth-36});
	  }); */
	  
	},0);
  
}

function resizeAll(){
	OrgaAFTab.resize({w: dojo.byId("OrgaAFTab").parentNode.clientWidth});
	var wresize;
	resetNU();
	
	if(dijit.byId("OrgaAFTab").selectedChildWidget.id=='OrgaCrud'){
		wresize=dojo.byId("gridOrga").parentNode.clientWidth;

			}else if (dijit.byId("OrgaAFTab").selectedChildWidget.id=="orga2orgaPeoples"){
			NUorga2orgaPeoples=false;
			wresize=dojo.byId("grid"+dijit.byId("OrgaAFTab").selectedChildWidget.id).parentNode.clientWidth;
			}
	
		if(dijit.byId("gridorga2orgaPeoples")!=undefined){gridorga2orgaPeoples.resize({w:wresize});}
		gridOrga.resize({w:wresize});
}


dojo.addOnLoad(init);   
 
 
function querybuttonOrga(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvoOrga.id=0 ;
              queryvoOrga=new Object();
								  if(queryOrgaorgaName.getDisplayedValue()!="")queryvoOrga.orgaName=queryOrgaorgaName.getDisplayedValue();//
											  if(queryOrgaorgaCode.getDisplayedValue()!="")queryvoOrga.orgaCode=queryOrgaorgaCode.getDisplayedValue();//
											  if(queryOrgasno.getDisplayedValue()!="")queryvoOrga.sno=queryOrgasno.getDisplayedValue();//
											  if(queryOrgaremark.getDisplayedValue()!="")queryvoOrga.remark=queryOrgaremark.getDisplayedValue();//
											  n=queryNumber_fun("OrgaparentId");
					  if(n==null){validstate=1;}else if(n.upSign!="%"){queryvoOrga.parentId=n;}  
							

			if(validstate==0){
              pagenumber=1;
			  getVOOrga(queryvoOrga);
              //getVO(queryvoOrga,pagenumber,pagesize,'0'); 
              //if(totalpage>1){dijit.byId("but7").setDisabled(false);}else{dijit.byId("but7").setDisabled(true);} 
             }      
       }

function pageSizeChangeOrga(mylabel){
	pagesizeOrga=mylabel;
	getVOOrga(queryvoOrga);
}

function allpageOrga(){
	pagesizeOrga=0;
	getVOOrga(queryvoOrga);
}

function upPageOrga(){
	pagenumberOrga--;
	getVOOrga(queryvoOrga);
}
function downPageOrga(){
	pagenumberOrga++;
	getVOOrga(queryvoOrga);
}

//totleinum=5

</script>
</head>
<body class="tundra">
<div id="bc" style="width:100%; height:100%;" dojoType="dijit.layout.BorderContainer">
<div id="topPane"  dojoType="dojox.layout.ExpandoPane" splitter="true" duration="125" region="left" title=""	style="width:375px;" >
<div id="tree" showRoot="true" persist="false" dojoType="dijit.Tree"  store="popStore" labelAttr="name"  childrenAttr="children"  model="treeModel" ></div> 
   </div>   
	<div   dojoType="dijit.layout.ContentPane"  title="" region="center"  id="rightPane" jsId="rightPane" >
	
	
	
	
	
	
											

		<div dojoType="dijit.layout.TabContainer" style="height:100%; width:100%;"   id="OrgaAFTab" jsId="OrgaAFTab"  >
		<div dojoType="dijit.layout.ContentPane" title="Orga"  id="OrgaCrud" jsId="OrgaCrud" selected="true" >
		<div id="queryDivOrga" style="margin-right: 0px;  height: 100px; display:none;" >
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
								<span id="queryOrgaparentIdImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="queryOrgaparentId1"  id="queryOrgaparentId1"  dojoType="mydojo.NumberTextBox"  /></span>
								<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryOrgaparentIdImgup">></span>
								<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryOrgaparentIdImgdown" >></span>
								<span id="queryOrgaparentIdImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="queryOrgaparentId2"  id="queryOrgaparentId2"  dojoType="mydojo.NumberTextBox"  /></span>
								<img src="../image/nStart.gif" onclick="queryType(this);" id="queryOrgaparentIdImg" style="vertical-align:middle;margin-top:0px;">
							</td>  
							
    <td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
		 
           <td colspan="2"> <button dojoType="dijit.form.Button" onclick="querybuttonOrga();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="3"></td><td colspan="2"></td></tr>
         </table>
	    </div>		
<table  style=" width:90%;">		
	<tr height="25px" width="100%">
		<td align="left" >
			<span id="OrgaGridTitle"></span>
		</td>
		<td align="right" >
			<button dojoType="dijit.form.Button" onclick="addRowOrga();" iconClass="addIcon" i18n="add"  >add</button>
			<button dojoType="dijit.form.Button" onclick="removeSelectedRowsOrga();" iconClass="delIcon" i18n="delete" >delete</button>
			<button dojoType="dijit.form.Button"  onclick="call_funUpdOrga();" i18n="save" iconClass="saveIcon">save</button>
			<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivOrga');" iconClass="openQueryIcon"  i18n="openQuery" >query</button>
    		 <span id="rowCountOrga"></span>
						<button dojoType="dijit.form.myButton" onclick="upPageOrga();"  id="but6Orga" disabled='true' jsId="but6Orga" iconClass="upPageIcon" >pageup</button><!--span dojoType="dijit.Tooltip" connectId="but6">pageup</span-->
						<button dojoType="dijit.form.myButton" onclick="downPageOrga();" id="but7Orga" disabled='true' jsId="but7Orga" iconClass="downPageIcon" >pagedown</button><!--span dojoType="dijit.Tooltip" connectId="but7">pagedown</span-->
						<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
							  <div dojoType="dijit.Menu">
								  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangeOrga(this.label);"></div>
								  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangeOrga(this.label);"></div>
							  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangeOrga(this.label);"></div>
									<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangeOrga(this.label);"></div>
									<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpageOrga();"></div>
							  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
						</div>
						<div dojoType="dijit.form.myDropDownButton" iconClass="pageStyleIcon"><span>pageStyle</span>
						   <div dojoType="dijit.Menu">
							 <div dojoType="dijit.MenuItem"  iconClass="rowIcon"		label="row"	onClick="pageStyleOrga(this.label);"></div>
							 <div dojoType="dijit.MenuItem"  iconClass="colIcon"		label="col"	onClick="pageStyleOrga(this.label);"></div>
						</div></div>
		</td>
	</tr>
</table>
    
	         <div id="gridOrga"  dojoType="dojox.Grid" autoWidth="false"  jsId="gridOrga"	model="modelOrga"  structure="layoutSingleRowOrga" singleClickEdit="true" ></div>
	</div>
		
				<div dojoType="dijit.layout.ContentPane" title="orga2orgaPeoples"  id="orga2orgaPeoples" jsId="orga2orgaPeoples" >
<table  style="width:90%;">		
	<tr height="25px" width="100%">
		<td align="left" >
			<span id="gridorga2orgaPeoplesTitle"></span>
		</td>
		<td align="right" >

					<span id="rowCountorga2orgaPeoples"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button dojoType="dijit.form.myButton" onclick="upPageorga2orgaPeoples();"  id="but6orga2orgaPeoples" disabled='true' jsId="but6orga2orgaPeoples" iconClass="upPageIcon" >pageup</button>
					<button dojoType="dijit.form.myButton" onclick="downPageorga2orgaPeoples();" id="but7orga2orgaPeoples" disabled='true' jsId="but7orga2orgaPeoples" iconClass="downPageIcon" >pagedown</button>
																															<button dojoType="dijit.form.myButton" onclick="saveorga2orgaPeoples();"  iconClass="saveIcon" ></button>
							</td>
	</tr>
</table>
				  
				<div id="gridorga2orgaPeoples"  ></div>
			</div>
			</div>	
	
	
	
	
	
	
	
	
	
	</div> 
</div>	
</body>
<script type="text/javascript">trans18tag();</script>
</html>
