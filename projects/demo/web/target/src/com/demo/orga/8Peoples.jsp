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
			dojo.require("projectDojo.Peoples");
	//??¡è???????????????¨¨?¡§		
							dojo.require("projectDojo.Prod");
				//??¡è???????????????¨¨?¡§		
							dojo.require("projectDojo.OrgaPeoples");
			
		 function principal2prodsFloatPara(id){
		  //this.ID=id;
		  this.deletedataprincipal2prods=new Array();
		  this.querydataprincipal2prods=new Array();
		  this.pagenumberprincipal2prods=1;
		  this.totalCountprincipal2prods=0;
		  this.pagesizeprincipal2prods=10;
		  this.orderByprincipal2prods='0';
		  this.queryvoprincipal2prods=new Object();
		  //this.oddstyle='';
		  this.modelprincipal2prods = new dojox.grid.data.Table(null, this.querydataprincipal2prods);
		  this.gridprincipal2prods=''
	 }
	 
	 var principal2prodsFloatArray=new Array();
			 function orgaPeoples2peopleFloatPara(id){
		  //this.ID=id;
		  this.deletedataorgaPeoples2people=new Array();
		  this.querydataorgaPeoples2people=new Array();
		  this.pagenumberorgaPeoples2people=1;
		  this.totalCountorgaPeoples2people=0;
		  this.pagesizeorgaPeoples2people=10;
		  this.orderByorgaPeoples2people='0';
		  this.queryvoorgaPeoples2people=new Object();
		  //this.oddstyle='';
		  this.modelorgaPeoples2people = new dojox.grid.data.Table(null, this.querydataorgaPeoples2people);
		  this.gridorgaPeoples2people=''
	 }
	 
	 var orgaPeoples2peopleFloatArray=new Array();
	
     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>

 					<script type="text/javascript" src="../basic/principal2prodsFloatAFTab_n.js"></script>
		
	 					<script type="text/javascript" src="../orga/orgaPeoples2peopleFloatAFTab_n.js"></script>
		
	  	<script type="text/javascript" >
	  var dojoPeoples= new  projectDojo.Peoples();
	  dojoPeoples.initPeoples();
	//??¡è???????????????¨¨?¡§		
							 var dojoProd= new  projectDojo.Prod();
			dojoProd.initProd();
				//??¡è???????????????¨¨?¡§		
							 var dojoOrgaPeoples= new  projectDojo.OrgaPeoples();
			dojoOrgaPeoples.initOrgaPeoples();
			
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
//begin-----?????¡À¨ª?¡§????¨ª??-------------------------------------------------------------------------------------------	  

//end-----?????¡À¨ª?¡§????)-------------------------------------------------------------------------------------------

 
//begin-------?????¡À¨ª????,??float????------------------------------------------------------------------------------------
 //???¡À????1212??layout??layoutstructure  (????layoutenumeration???????¨ª??!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 																										var layoutSingleRowQuery=[{
		//field????????¨°???js??toArray¡Á???querydate??
	    cells: [ [
								{name: 'openFloat', styles: 'text-align: center;', width: 3, get:function(inRowIndex){return '<img src="../image/EmbedLink.gif" style="cursor:pointer"  onclick="openFloat('+inRowIndex+',event);"  height="16" width="16" >';}},
                { name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				  				  {name: i18nStr.peopleName, field: 2,width: 10}
						  						  				,   {name: i18nStr.peoplePassword, field: 3,width: 10}
						  						  				,   {name: i18nStr.peopleStatus, field: 4,width: 10}
						  						  				,   {name: i18nStr.birthDay,field:5, width: 8}
						  						  				,   {name: i18nStr.sex, field: 6,width: 10}
						  						  				,   {name: i18nStr.birthPlace, field: 7,width: 10}
						  						  				,   {name: i18nStr.address, field: 8,width: 10}
						  						  				,   {name: i18nStr.tel, field: 9,width: 10}
						  						  				,   {name: i18nStr.engageMode, field: 10,width: 10}
						  						  				,   {name: i18nStr.engageDate,field:11, width: 8}
						  						  				,   {name: i18nStr.gradeEnum, field: 12,width: 10}
						  						  				,   {name: i18nStr.remark, field: 13,width: 10}
						  				
					]]}];	 
					
					
var layoutNoscroll=[ {
			noscroll: true,
			cells: [[
				{name: 'openFloat', styles: 'text-align: center;', width: 3, get:function(inRowIndex){return '<img src="../image/EmbedLink.gif" style="cursor:pointer" onclick="openFloat('+inRowIndex+',event);"  height="16" width="16" >';}},
				   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} }
		]]},{
          
 //field??????js??toArray??querydate?
	   
				 cells: [ [
							//{name: '?', width: 3, get:getChoise},
						  // { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
						  // { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
      				  {name: i18nStr.peopleName, field: 2,width: 8}
					       				,   {name: i18nStr.peoplePassword, field: 3,width: 8}
					       				,   {name: i18nStr.peopleStatus, field: 4,width: 8}
					   		,   {name: i18nStr.birthDay,field:5, width: 8}
		        				,   {name: i18nStr.sex, field: 6,width: 8}
					       				,   {name: i18nStr.birthPlace, field: 7,width: 8}
					       				,   {name: i18nStr.address, field: 8,width: 8}
					       				,   {name: i18nStr.tel, field: 9,width: 8}
					       				,   {name: i18nStr.engageMode, field: 10,width: 8}
					   		,   {name: i18nStr.engageDate,field:11, width: 8}
		        				,   {name: i18nStr.gradeEnum, field: 12,width: 8}
					       			    ,   {name: i18nStr.remark, field: 13,width: 10 }
					 
                                        ] ]
                           }]; 
function pageStylePeoples(style){//nomarl,col,noscroll
	gridPeoples.scrollToRow(0);
	if(style=="nomarl"){
		gridPeoples.setStructure(layoutSingleRowQuery);
	}else if(style=="col"){
		gridPeoples.setStructure(layoutTwoRow);
	}else if(style=="noscroll"){
		gridPeoples.setStructure(layoutNoscroll);
	}
}						   
						   

//totleinum=12
  //rowinum=7
function getCheckPeoples(){}

var layoutTwoRow=[{
          
 //field??????js??toArray??querydate?
	   
				 cells: [
                      [
						{name: 'openFloat', styles: 'text-align: center;', width: 3, get:function(inRowIndex){return '<img src="../image/EmbedLink.gif" style="cursor:pointer" onclick="openFloat('+inRowIndex+',event);"  height="16" width="16" >';}},
						//{ name: i18nStr.detail, width: 3, get: getCheckPeoples, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
										  											  {name: i18nStr.peopleName, field: 2 , width: 8 }
														  			//--------------  if (3 == 7)
														  											,   {name: i18nStr.peoplePassword, field: 3 , width: 8 }
														  			//--------------  if (4 == 7)
														  											,   {name: i18nStr.peopleStatus, field: 4 , width: 8 }
														  			//--------------  if (5 == 7)
														  					,   {name: i18nStr.birthDay,field:5, width: 8}
										
			  			//--------------  if (6 == 7)
														  											,   {name: i18nStr.sex, field: 6 , width: 8 }
														  			//--------------  if (7 == 7)
								//
												  																	,   {name: i18nStr.birthPlace, field: 7,width: 8}
																						  								]
												                     //----------------(inum:8)  (rowinum: 7)
									                     //----------------(inum:8)  (rowinum: 7)
									                     //----------------(inum:8)  (rowinum: 7)
									                     //----------------(inum:8)  (rowinum: 7)
									                     //----------------(inum:8)  (rowinum: 7)
									                     //----------------(inum:8)  (rowinum: 7)
									                     //----------------(inum:8)  (rowinum: 7)
								
		,[
	 //  22222222222inum= 2   inum2=8
																																							  													  {name: i18nStr.address, field: 8,width: 8 }
																  														  													,   {name: i18nStr.tel, field: 9,width: 8 }
																  														  													,   {name: i18nStr.engageMode, field: 10,width: 8 }
																  														  					,   {name: i18nStr.engageDate,field:11, width: 8}
								  														  													,   {name: i18nStr.gradeEnum, field: 12,width: 8 }
																  														  													,   {name: i18nStr.remark, field: 13,width: 10 }
																  														
	 	
			,   {name: ' ',value:' ' ,width: 10 }
		]]
                           }]; 						   
						   
					
					
					
//end-------?????¡À¨ª????,??float????------------------------------------------------------------------------------------
var onloadmy=function(){
	
	dojo.connect(dijit.byId("PeoplesAFFloat"), "selectChild", function(e){
			if (dijit.byId("PeoplesAFFloat").selectedChildWidget.id=="principal2prods"){
			buildprincipal2prods();
						}else if (dijit.byId("PeoplesAFFloat").selectedChildWidget.id=="orgaPeoples2people"){
			buildorgaPeoples2people();
				}
		}); 
						dijit.byId("PeoplesAFFloat").selectChild(dijit.byId("principal2prods"));
							
}					
var mainID;
var floatIndex=0;
var flag=0;//0,1

function openFloat(indexRow,e){
	mainID=querydataPeoples[indexRow][1];
	var FloatID ="openFloat_"+mainID;//??¨°???float????
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
			//href:"PeoplesQueryAFFloat.html"
		},div);
		dojo.style(fp.domNode,{
			width:"1000px",
			height:"600px",
			top:80+30*floatIndex, left:120+30*floatIndex,
			position:"absolute",
			zIndex:"980"
		});
		openFloat=fp;
					var divTap = dojo.doc.createElement('div');
	openFloat.domNode.children[1].children[0].appendChild(divTap);
			var tab = new dijit.layout.TabContainer({
				id:"PeoplesAFFloat"+mainID,
				jsId:"PeoplesAFFloat"+mainID,
				title:""
			},divTap);
						var newTabprincipal2prods = new dijit.layout.ContentPane({
				title: "principal2prods",
				id:"principal2prods"+mainID,
				jsId:"principal2prods"+mainID,
				style: "height:100%;width:100%"
			},dojo.doc.createElement('div'));
			tab.addChild(newTabprincipal2prods);
								var newTaborgaPeoples2people = new dijit.layout.ContentPane({
				title: "orgaPeoples2people",
				id:"orgaPeoples2people"+mainID,
				jsId:"orgaPeoples2people"+mainID,
				style: "height:100%;width:100%"
			},dojo.doc.createElement('div'));
			tab.addChild(newTaborgaPeoples2people);
				fp.startup();
	fp.show();
	var curfloat=dijit.byId("PeoplesAFFloat"+mainID);
		dojo.connect(curfloat, "selectChild", function(e){
			var innerID=""+curfloat.id.replace("PeoplesAFFloat","");
						if (dijit.byId("PeoplesAFFloat"+innerID).selectedChildWidget.id=="principal2prods"+innerID){
			buildprincipal2prods(innerID);
						}else if (dijit.byId("PeoplesAFFloat"+innerID).selectedChildWidget.id=="orgaPeoples2people"+innerID){
			buildorgaPeoples2people(innerID);
				}		
		}); 
						dijit.byId("PeoplesAFFloat"+mainID).selectChild(dijit.byId("principal2prods"+mainID));
							
dojo.connect(openFloat, "resize", function(e){
	var innerID=""+openFloat.id.replace("Peoples","");
			principal2prodsFloatArray[""+innerID].gridprincipal2prods.resize({w: openFloat.domNode.clientWidth-16,h:openFloat.domNode.clientHeight-100});
				orgaPeoples2peopleFloatArray[""+innerID].gridorgaPeoples2people.resize({w: openFloat.domNode.clientWidth-16,h:openFloat.domNode.clientHeight-100});
		
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
		var signHeight = dijit.byId("gridPeoples").domNode.clientHeight/allFloatArray.length;
		var tt=0;
		for (var i=0; i<allFloatArray.length;i++){
			dojo.style(allFloatArray[i].domNode,{
			width:dijit.byId("gridPeoples").domNode.clientWidth,
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
		var signWidth = dijit.byId("gridPeoples").domNode.clientWidth/allFloatArray.length;
		var tt=0;
		for (var i=0; i<allFloatArray.length;i++){
			//allFloatArray[i].resize({t:tt ,l : 0,w:dijit.byId("gridPeoples").domNode.clientWidth,h:signHeight});
			dojo.style(allFloatArray[i].domNode,{
			width:signWidth,
			height:dijit.byId("gridPeoples").domNode.clientHeight,
			top:0, left:tt,
			position:"absolute",
			zIndex:"980"
		});
			allFloatArray[i].show();
			tt=tt+signWidth;
		}
	}
}




function getVOPeoples(queryvo){
	var totalCount=0;
      var pu = new SOAPClientParameters2();
      pu.add('PeoplesVO',queryvo) ;
      pu.add('pageNumber',pagenumberPeoples) ;
	    pu.add('pageSize',pagesizePeoples) ;
	    pu.add('orderBy',orderByPeoples) ;
      SOAPClient.invoke(urlPeoples,"getPeoples", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydataPeoples=new Array();
		   querydataPeoples=dojoPeoples.PeoplesVOtoArray_fun(ul,false);
           totalCountPeoples=ul[ul.length-1]["ns:id"]; 
      }); 
      querydataPeoples.splice(querydataPeoples.length-1,1);
      modelPeoples.setData(querydataPeoples);
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
 
 function pageSizeChangePeoples(mylabel){
	pagesizePeoples=mylabel;
	pagenumberPeoples=1;
	getVOPeoples(queryvoPeoples);
}

function allpagePeoples(){
	pagesizePeoples=0;
	getVOPeoples(queryvoPeoples);
}

function upPagePeoples(){
	pagenumberPeoples--;
	getVOPeoples(queryvoPeoples);
}
function downPagePeoples(){
	pagenumberPeoples++;
	getVOPeoples(queryvoPeoples);
}
 
function init(){
  getVOPeoples(queryvoPeoples);
}

 dojo.addOnLoad(init);   
function querybutton(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvoPeoples.id=0 ;
              queryvoPeoples=new Object();
								  if(querypeopleName.getDisplayedValue()!="")queryvoPeoples.peopleName=querypeopleName.getDisplayedValue();//
											  if(querypeoplePassword.getDisplayedValue()!="")queryvoPeoples.peoplePassword=querypeoplePassword.getDisplayedValue();//
											  if(querypeopleStatus.getDisplayedValue()!="")queryvoPeoples.peopleStatus=querypeopleStatus.getDisplayedValue();//
											  d=queryDate_fun("birthDay");
					  if(d==null){validstate=1;}else if(d.upSign!="%"){queryvoPeoples.birthDay=d;}
											  if(querysex.getDisplayedValue()!="")queryvoPeoples.sex=querysex.getDisplayedValue();//
											  if(querybirthPlace.getDisplayedValue()!="")queryvoPeoples.birthPlace=querybirthPlace.getDisplayedValue();//
											  if(queryaddress.getDisplayedValue()!="")queryvoPeoples.address=queryaddress.getDisplayedValue();//
											  if(querytel.getDisplayedValue()!="")queryvoPeoples.tel=querytel.getDisplayedValue();//
											  if(queryengageMode.getDisplayedValue()!="")queryvoPeoples.engageMode=queryengageMode.getDisplayedValue();//
											  d=queryDate_fun("engageDate");
					  if(d==null){validstate=1;}else if(d.upSign!="%"){queryvoPeoples.engageDate=d;}
											  if(querygradeEnum.getDisplayedValue()!="")queryvoPeoples.gradeEnum=querygradeEnum.getDisplayedValue();//
											  if(queryremark.getDisplayedValue()!="")queryvoPeoples.remark=queryremark.getDisplayedValue();//
							

			if(validstate==0){
              pagenumber=1;
			  getVOPeoples(queryvoPeoples);
              //getVO(queryvoPeoples,pagenumber,pagesize,'0'); 
              //if(totalpage>1){dijit.byId("but7").setDisabled(false);}else{dijit.byId("but7").setDisabled(true);} 
             }      
       }
//totleinum=12
 //rowinum=4

</script>
</head>
<body class="tundra">

<div id="queryDiv" style="margin-right: 0px;  height: 140px; display:none;" >
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
						
															<input type="text" class="editerInput"  id="querypeopleName"  jsId="querypeopleName"   dojoType="dijit.form.TextBox"  />
													</td>
														<td align="right"  i18n="peoplePassword" >peoplePassword:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="querypeoplePassword"  jsId="querypeoplePassword"   dojoType="dijit.form.TextBox"  />
												</td>  
													<td align="right"  i18n="peopleStatus" >peopleStatus:</td>
						<td align="left"  >
													<input type="text" class="editerInput"  id="querypeopleStatus"  jsId="querypeopleStatus"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			                <tr>
							<td align="right" i18n="birthDay"  >birthDay:</td> 
						<td align="left"  colspan="3"><span id="querybirthDayImg0"  ><input class="editerDate"   jsId="querybirthDay" id="querybirthDay"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="querybirthDayTime" id="querybirthDayTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="querybirthDayImg1" style="{display:none}" ><input class="editerDateSmaller"   jsId="query1birthDay" id="query1birthDay"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query1birthDayTime" id="query1birthDayTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querybirthDayImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querybirthDayImgdown" >></span>
							<span id="querybirthDayImg2div" style="{display:none}"><input class="editerDateSmaller"   jsId="query2birthDay" id="query2birthDay"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query2birthDayTime" id="query2birthDayTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="querybirthDayImg" class="imgStyle">
						</td>
													<td align="right" colspan="2" ></td>
						<td align="right"  i18n="sex" >sex:</td>
						<td align="left"  >
							 								<input type="text" class="editerInput"  id="querysex"  jsId="querysex"   dojoType="dijit.form.TextBox"  />  
													</td></tr>
					                <tr>
							<td align="right" i18n="birthPlace" >birthPlace:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="querybirthPlace"  jsId="querybirthPlace"   dojoType="dijit.form.TextBox"  />
													</td>
														<td align="right"  i18n="address" >address:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="queryaddress"  jsId="queryaddress"   dojoType="dijit.form.TextBox"  />
												</td>  
													<td align="right"  i18n="tel" >tel:</td>
						<td align="left"  >
													<input type="text" class="editerInput"  id="querytel"  jsId="querytel"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			                <tr>
							<td align="right" i18n="engageMode" >engageMode:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryengageMode"  jsId="queryengageMode"   dojoType="dijit.form.TextBox"  />
													</td>
																<td align="right"  i18n="engageDate" >engageDate:</td>
						<td align="left"   colspan="5"><span id="queryengageDateImg0"  ><input class="editerDate"   jsId="queryengageDate" id="queryengageDate"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="queryengageDateTime" id="queryengageDateTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="queryengageDateImg1" style="{display:none}" ><input class="editerDateSmall"   jsId="query1engageDate" id="query1engageDate"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmall" jsId="query1engageDateTime" id="query1engageDateTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryengageDateImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryengageDateImgdown" >></span>
							<span id="queryengageDateImg2div" style="{display:none}"><input class="editerDateSmall"   jsId="query2engageDate" id="query2engageDate"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmall" jsId="query2engageDateTime" id="query2engageDateTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="queryengageDateImg" class="imgStyle">
						</td></tr>
			                <tr>
							<td align="right" i18n="gradeEnum" >gradeEnum:</td>
						<td align="left"  >
						
														<input  id="querygradeEnum"  jsId="querygradeEnum" class="editerInput"  dojoType="dijit.form.FilteringSelect" store="dojoPeoples.gradeEnumStore" />
													</td>
														<td align="right"  i18n="remark" >remark:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="queryremark"  jsId="queryremark"   dojoType="dijit.form.TextBox"  />
												</td>  
				
    <td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybutton();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
	    </div>	
 <table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   Peoples List</b></td>
		<td align="right" >
				<button dojoType="dijit.form.Button" onclick="querydisplay('queryDiv');" iconClass="openQueryIcon"  i18n="openQuery" >query</button>
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
						<div dojoType="dijit.form.myDropDownButton" iconClass="pageStyleIcon"><span>pageStyle</span>
						   <div dojoType="dijit.Menu">
							 <div dojoType="dijit.MenuItem"  iconClass="rowIcon"		label="normal"	onClick="pageStylePeoples(this.label);"></div>
							 <div dojoType="dijit.MenuItem"  iconClass="colIcon"		label="col"	onClick="pageStylePeoples(this.label);"></div>
							 <div dojoType="dijit.MenuItem"  iconClass="colIcon"		label="noscroll"	onClick="pageStylePeoples(this.label);"></div>
						</div></div>
			</div>    
	    <div style="{height:90%;width:100%}"  >
	         <div id="gridPeoples"  dojoType="dojox.Grid" autoWidth="false"  jsId="gridPeoples"	model="modelPeoples"  structure="layoutSingleRowQuery" singleClickEdit="true" ></div>
		</td>
	</tr>
</table>    
      
</body>
<script type="text/javascript">trans18tag();</script>
</html>
