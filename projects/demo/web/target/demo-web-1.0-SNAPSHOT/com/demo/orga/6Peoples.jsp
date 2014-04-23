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
			@import "../dojo/dojo-release-1.0.0/dojox/layout/resources/ExpandoPane.css"; 

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
            dojo.registerModulePath("mydojo", "../../../js/mydojo");
            dojo.require("mydojo.FilteringSelect");
            dojo.require("mydojo.ValidationTextBox");
            dojo.require("mydojo.NumberTextBox");
			dojo.require("dijit.Dialog");
			dojo.registerModulePath("projectDojo", "../../../dojo/projectDojo");
			dojo.require("projectDojo.Peoples");
	//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
							dojo.require("projectDojo.Prod");
				//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
							dojo.require("projectDojo.OrgaPeoples");
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
 			<script type="text/javascript" src="../basic/principal2prodsRightCrudAFTab.js"></script>
	 			<script type="text/javascript" src="../orga/orgaPeoples2peopleRightCrudAFTab.js"></script>
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
//begin-----Ð¶Ç·Ó±í£¨Ç·Îªí£©-------------------------------------------------------------------------------------------	  

//end-----Ð¶Ç·Ó±í£¨Ç·Îª)-------------------------------------------------------------------------------------------
//begin-----Ã¶Ö¶Enumeration storeÄ»Ã·-------------------------------------------------------------------------------------------

//end-----Ã¶Ö¶Enumeration storeÄ»Ã·------------------------------------------------------------------------------------------- 

//begin-----Î²ÃµÄ± storeÄ»Ã·  	have set function's manageableAssociationEnds-------------------------------------------------------------------------------------------

//end-----Î²ÃµÄ± storeÄ»Ã·  	have set function's manageableAssociationEnds-------------------------------------------------------------------------------------------
 
//begin-------Ê¾Ñ¯Ð±í£¬Í·,Ó´floatÚµÍ¼------------------------------------------------------------------------------------
 //Ð¶Ï±Ö¶Ç·1212ÉµlayoutÛµlayoutstructure  (Ú²Ñ¯layoutenumerationÖ¶Î²â´¦í£©!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
																									
	var layoutSingleRowQuery=[{
		//fieldÖµÄ¬ÏµË³ò£¬´jsÐµtoArray×ªØµquerydateÈ¡
	    cells: [ [

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
				// { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
				   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} }
		]]},{
          
 //field??????jsÐµtoArray??querydate?
	   
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
  //rowinum=6
function getCheckPeoples(){}

var layoutTwoRow=[{
          
 //field??????jsÐµtoArray??querydate?
	   
				 cells: [
                      [
						//{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
						//{ name: i18nStr.detail, width: 3, get: getCheckPeoples, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
										  											  {name: i18nStr.peopleName, field: 2 , width: 8 }
														  			//--------------  if (3 == 5)
														  											,   {name: i18nStr.peoplePassword, field: 3 , width: 8 }
														  			//--------------  if (4 == 5)
														  											,   {name: i18nStr.peopleStatus, field: 4 , width: 8 }
														  			//--------------  if (5 == 5)
								//
												  							,   {name: i18nStr.birthDay,field:5, width: 8}
												  								]
												                     //----------------(inum:6)  (rowinum: 5)
									                     //----------------(inum:6)  (rowinum: 5)
									                     //----------------(inum:6)  (rowinum: 5)
									                     //----------------(inum:6)  (rowinum: 5)
									                     //----------------(inum:6)  (rowinum: 5)
									                     //----------------(inum:6)  (rowinum: 5)
									                     //----------------(inum:6)  (rowinum: 5)
									                     //----------------(inum:6)  (rowinum: 5)
									                     //----------------(inum:6)  (rowinum: 5)
								
		,[
	 //  22222222222inum= 2   inum2=6
																													  													  {name: i18nStr.sex, field: 6,width: 8 }
																  														  													,   {name: i18nStr.birthPlace, field: 7,width: 8 }
																  														  													,   {name: i18nStr.address, field: 8,width: 8 }
																  														  													,   {name: i18nStr.tel, field: 9,width: 8 }
																  														  													,   {name: i18nStr.engageMode, field: 10,width: 8 }
																  														  					,   {name: i18nStr.engageDate,field:11, width: 8}
								  														  													,   {name: i18nStr.gradeEnum, field: 12,width: 8 }
																  														  													,   {name: i18nStr.remark, field: 13,width: 10 }
																  														
	 	
		]]
                           }]; 						   
						   

//end-------Ê¾Ñ¯Ð±í£¬Í·,Ó´floatÚµÍ¼------------------------------------------------------------------------------------

/*	dojo.connect(dijit.byId("PeoplesAFTab"), "selectChild", function(e){
			if (dijit.byId("PeoplesAFTab").selectedChildWidget.id=="principal2prods"){
			buildprincipal2prods();
						}else if (dijit.byId("PeoplesAFTab").selectedChildWidget.id=="orgaPeoples2people"){
			buildorgaPeoples2people();
				}
		}); */

function resetNU(trueTab){
						NUprincipal2prods=true;
								NUorgaPeoples2people=true;
			}
function clickRowTab(){

										if (dijit.byId("PeoplesAFTab").selectedChildWidget.id=="principal2prods"){
					buildprincipal2prods();
																}else if (dijit.byId("PeoplesAFTab").selectedChildWidget.id=="orgaPeoples2people"){
					buildorgaPeoples2people();
													}
		}
				
var mainID;
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
var connecthandle=0 ;
var handle ;
function gridResize(){
	PeoplesAFTab.resize({w: dijit.byId("rightPane").domNode.clientWidth-10,h: document.body.clientHeight-40});
			if(gridprincipal2prods!=undefined)gridprincipal2prods.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100});
	 			if(gridorgaPeoples2people!=undefined)gridorgaPeoples2people.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100});
	 		gridPeoples.resize({w:document.body.clientWidth-dijit.byId("rightPane").domNode.clientWidth-36});
}
function init(){
  getVOPeoples(queryvoPeoples);
  var m = dijit.byId("rightPane"); 
  if(m._showing)m.toggle();
  
setTimeout(function(){
	gridPeoples.resize({w: document.body.clientWidth-60,h: document.body.clientHeight-40});
		dojo.connect(dijit.byId("PeoplesAFTab"), "selectChild", function(e){
		dojo.byId("principal2prodsTable").style.visibility="hidden";
			dojo.byId("orgaPeoples2peopleTable").style.visibility="hidden";
	dojo.byId(dijit.byId("PeoplesAFTab").selectedChildWidget.id+"Table").style.visibility="visible";
	clickRowTab();
	}); 
	
	dojo.connect(dijit.byId("rightPane"), "_showEnd", function(e){
	gridResize();
		if(connecthandle==0){
			handle=dojo.connect(dijit.byId("gridPeoples"), "doclick", function(e){
				mainID=querydataPeoples[e.rowIndex][1];
				resetNU();
				clickRowTab();		
			});
			connecthandle=1;
		}
	  });
	  dojo.connect(dijit.byId("rightPane"), "_hideEnd", function(e){
	  gridResize();
		if(connecthandle==1){
			dojo.disconnect(handle);
			connecthandle=0;
		}
	  });	
	  
	   dojo.connect(dijit.byId("rightPane"), "_afterResize", function(e){
			gridResize();
	  }); 
	  
	},0);
  
}

 dojo.addOnLoad(init);   
function querybuttonPeoples(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvoPeoples.id=0 ;
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
              pagenumber=1;
			  getVOPeoples(queryvoPeoples);
              //getVO(queryvoPeoples,pagenumber,pagesize,'0'); 
              //if(totalpage>1){dijit.byId("but7").setDisabled(false);}else{dijit.byId("but7").setDisabled(true);} 
             }      
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

//totleinum=12
 //rowinum=4

</script>
</head>
<body class="tundra">
<div id="bc" style="width:100%; height:100%;" dojoType="dijit.layout.BorderContainer">
<div dojoType="dijit.layout.ContentPane"  title="" region="center" id="topPane" 	 >

<div id="queryDivPeoples" style="margin-right: 0px;  height: 140px; display:none;" >
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
							<input class="editerTime" jsId="queryPeoplesbirthDayTime" id="queryPeoplesbirthDayTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
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
							<input class="editerTime" jsId="queryPeoplesengageDateTime" id="queryPeoplesengageDateTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
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

				<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivPeoples');" iconClass="openQueryIcon"  i18n="openQuery" >query</button>
				<span id="rowCountPeoples"></span>
						<button dojoType="dijit.form.myButton" onclick="upPagePeoples();"  id="but6Peoples" disabled='true' jsId="but6Peoples" iconClass="upPageIcon" >pageup</button><!--span dojoType="dijit.Tooltip" connectId="but6">pageup</span-->
						<button dojoType="dijit.form.myButton" onclick="downPagePeoples();" id="but7Peoples" disabled='true' jsId="but7Peoples" iconClass="downPageIcon" >pagedown</button><!--span dojoType="dijit.Tooltip" connectId="but7">pagedown</span-->
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
		</td>
	</tr>
</table>	       	
   
	         <div id="gridPeoples"  dojoType="dojox.Grid" autoWidth="false"  jsId="gridPeoples"	model="modelPeoples"  structure="layoutSingleRowQuery" singleClickEdit="true" ></div>
    </div>      

		<div dojoType="dojox.layout.ExpandoPane" splitter="true" duration="125" region="left" title="" style="width:400px;" id="rightPane" jsId="rightPane" >
								<table id="principal2prodsTable"  style=" position:absolute;top:30px; width:90%; visibility:visible ">
				<tr height="25px" width="100%">
		<td align="right" >
					<span id="rowCountprincipal2prods"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button dojoType="dijit.form.myButton" onclick="upPageprincipal2prods();"  id="but6principal2prods" disabled='true' jsId="but6principal2prods" iconClass="upPageIcon" >pageup</button>
					<button dojoType="dijit.form.myButton" onclick="downPageprincipal2prods();" id="but7principal2prods" disabled='true' jsId="but7principal2prods" iconClass="downPageIcon" >pagedown</button>
																																																																																																																				<button dojoType="dijit.form.Button" onclick="addRowprincipal2prods();" iconClass="addIcon" >add</button>
					<button dojoType="dijit.form.Button" onclick="removeprincipal2prods();" iconClass="delIcon" >delete</button>
					<button dojoType="dijit.form.Button" id="but3principal2prods" jsId="but3principal2prods" onclick="call_funUpdprincipal2prods();"  iconClass="saveIcon">save</button>
						</td></tr></table>
									<table id="orgaPeoples2peopleTable"  style=" position:absolute;top:30px; width:90%; visibility:hidden ">		
				<tr height="25px" width="100%">
		<td align="right" >
					<span id="rowCountorgaPeoples2people"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button dojoType="dijit.form.myButton" onclick="upPageorgaPeoples2people();"  id="but6orgaPeoples2people" disabled='true' jsId="but6orgaPeoples2people" iconClass="upPageIcon" >pageup</button>
					<button dojoType="dijit.form.myButton" onclick="downPageorgaPeoples2people();" id="but7orgaPeoples2people" disabled='true' jsId="but7orgaPeoples2people" iconClass="downPageIcon" >pagedown</button>
																															<button dojoType="dijit.form.myButton" onclick="saveorgaPeoples2people();"  iconClass="saveIcon" ></button>
						</td></tr></table>
				<div dojoType="dijit.layout.TabContainer" style="height:100%; width:100%;position:absolute;top:30px;"   id="PeoplesAFTab" jsId="PeoplesAFTab"  >
						<div dojoType="dijit.layout.ContentPane" title="principal2prods"  id="principal2prods" jsId="principal2prods" >
				<div id="gridprincipal2prods" dojoType="dojox.Grid" autoWidth="false"  jsId="gridprincipal2prods"	model="modelprincipal2prods"  structure="layoutprincipal2prods"  ></div>
			</div>
								<div dojoType="dijit.layout.ContentPane" title="orgaPeoples2people"  id="orgaPeoples2people" jsId="orgaPeoples2people" >
				<div id="gridorgaPeoples2people" dojoType="dojox.Grid" autoWidth="false"  jsId="gridorgaPeoples2people"	model="modelorgaPeoples2people"  structure="layoutorgaPeoples2people"  ></div>
			</div>
				</div> 

	</div> 
</div>	
</body>
<script type="text/javascript">trans18tag();</script>
</html>
