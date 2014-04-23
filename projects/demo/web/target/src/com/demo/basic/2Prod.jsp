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
			
      </style>
      <script type="text/javascript" src="../dojo/dojo-release-1.0.0/dojo/dojo.js"  
                djConfig="parseOnLoad: true, isDebug: true,locale: 'zh-cn', extraLocale: ['zh-TW', 'fr']"></script>
      <script>
    
            dojo.require("dojo.data.ItemFileWriteStore");
            dojo.require("dojo.parser");
            dojo.require("dijit.form.Button");
            dojo.require("dijit.Menu");
			dojo.require("dijit.Dialog");
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
			dojo.registerModulePath("mydojo", "../../../js/mydojo");
            dojo.require("mydojo.FilteringSelect");
            dojo.require("mydojo.ValidationTextBox");
            dojo.require("mydojo.NumberTextBox");
			dojo.registerModulePath("projectDojo", "../../../dojo/projectDojo");
			dojo.require("projectDojo.Prod");
     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 <script type="text/javascript" >
	  var dojoProd= new  projectDojo.Prod();
	  dojoProd.initProd();
	  var url = getUrl()+ "services/ProdManageService";
	  var deletedata =  new Array();
	  var querydata =  new Array();
	  var totalCount=0;
	  var pagenumber=1;
	  var pagesize=10;
	  var orderBy='0';
	  var queryvo=new Object();
	  var oddstyle='';
	  var model = new dojox.grid.data.Table(null, querydata);
	  var urle = getUrl()+ "services/BasicManageService";        

	 //Ð¶Ï±Ö¶Ç·1212ÉµlayoutÛµlayoutstructure
	 //enumeration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 																

	var layoutSingleRow=[{
          
                 //fieldÖµÄ¬ÏµË³ò£¬´jsÐµtoArray×ªØµquerydateÈ¡
                       
                                 cells: [ [
                                           { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
  		 {name: i18nStr.prodName,field:2, width: 10}
		    		,  {name: i18nStr.code,field:3, width: 10}
		            ,  {name: i18nStr.price,field:4, width: 8}
		    		,  {name: i18nStr.datef,field:5, width: 10}
		    		,  {name: i18nStr.prodType,field:6, width: 10}
		  
//Úµí²»Ð¶
					 ,   {name: i18nStr.prodCust,field: 7,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][7]!=undefined && querydata[inRowIndex][7][2]!=undefined){str=querydata[inRowIndex][7][2];strid=querydata[inRowIndex][7][1];} return str+'<img src="../image/detailFloat.jpg" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoProd.detailFloatCustomerData=querydata['+inRowIndex+'][7];dojoProd.detailCustomer('+querydata[inRowIndex][7][1]+','+inRowIndex+',7,0,event,0);"   >';} ,width: 10 }
			//Úµí²»Ð¶
					 ,   {name: i18nStr.principal,field: 8,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][8]!=undefined && querydata[inRowIndex][8][2]!=undefined){str=querydata[inRowIndex][8][2];strid=querydata[inRowIndex][8][1];} return str+'<img src="../image/detailFloat.jpg" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoProd.detailFloatPeoplesData=querydata['+inRowIndex+'][8];dojoProd.detailPeoples('+querydata[inRowIndex][8][1]+','+inRowIndex+',8,0,event,0);"   >';} ,width: 10 }
			                                        ] ]
                           }]; 


						   
function querybutton(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvo=new Object();
	          if(queryprodName.getDisplayedValue()!="")queryvo.prodName=queryprodName.getDisplayedValue();//
	          if(querycode.getDisplayedValue()!="")queryvo.code=querycode.getDisplayedValue();//
              n=queryNumber_fun("price");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvo.price=n;}  
              d=queryDate_fun("datef");
              if(d==null){validstate=1;}else if(d.upSign!="%"){queryvo.datef=d;}
	          if(queryprodType.getDisplayedValue()!="")queryvo.prodType=queryprodType.getDisplayedValue();//
			
	if(queryprodCust.getDisplayedValue()!=""){
				var prodCustQuery= new Object();
				//prodCustQuery.ProdName=queryprodCust.getDisplayedValue();
				prodCustQuery.id=queryprodCust.getValue();
				queryvo.prodCust=prodCustQuery;
			  }
	if(queryprincipal.getDisplayedValue()!=""){
				var principalQuery= new Object();
				//principalQuery.ProdName=queryprincipal.getDisplayedValue();
				principalQuery.id=queryprincipal.getValue();
				queryvo.principal=principalQuery;
			  }

			if(validstate==0){
              pagenumber=1;
              getVO(queryvo); 
              //if(totalpage>1){dijit.byId("but7").setDisabled(false);}else{dijit.byId("but7").setDisabled(true);} 
             }      
       }
 
 
function getVO(queryvo){
	  totalCount=0;
      var pu = new SOAPClientParameters2();
      pu.add('ProdVO',queryvo) ;
      pu.add('pageNumber',pagenumber) ;
	    pu.add('pageSize',pagesize) ;
	    pu.add('orderBy',orderBy) ;
      SOAPClient.invoke(url,"getProd", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydata=new Array();
		   querydata=dojoProd.ProdVOtoArray_fun(ul,false);
           totalCount=ul[ul.length-1]["ns:id"]; 
      }); 
      querydata.splice(querydata.length-1,1);
      model.setData(querydata);
      //dijit.byId("grid").updateRowCount(querydata.length); 
	   var totalpage=Math.ceil(new Number(totalCount)/pagesize);
	  
	if(totalpage>1){
		if(pagenumber==1){
			dijit.byId("but6").setDisabled(true);
			dijit.byId("but7").setDisabled(false);
		}else if(pagenumber==totalpage){
			dijit.byId("but6").setDisabled(false);
			dijit.byId("but7").setDisabled(true);
		}else{
			dijit.byId("but6").setDisabled(false);
			dijit.byId("but7").setDisabled(false);
		}
	}else{
		dijit.byId("but6").setDisabled(true);
		dijit.byId("but7").setDisabled(true);
	
	}
	if(pagesize==0){
		totalpage=1;
		dijit.byId("but6").setDisabled(true);
		dijit.byId("but7").setDisabled(true);
	}
	if(totalpage==1)pagenumber=1;
	
	 document.getElementById("rowCount").innerHTML=i18nStr.di+" "+pagenumber+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCount+" "+i18nStr.rowSize; 	
	  
	  
 }
 
function init(){
  getVO(queryvo);
}

 dojo.addOnLoad(init);   

	function selectCustomerFun(rep){
		querydata[dojoProd.selectCustomerInRow][dojoProd.noCustomer]=rep;
		grid.updateRow(dojoProd.selectCustomerInRow);		
	}
	function selectPeoplesFun(rep){
		querydata[dojoProd.selectPeoplesInRow][dojoProd.noPeoples]=rep;
		grid.updateRow(dojoProd.selectPeoplesInRow);		
	}

//totleinum=7
 //rowinum=2

</script>
</head>	 
<body class="tundra">
<div id="queryDiv" style="margin-right: 0px;  height: 120px; display:none;" >
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
							<td align="right" i18n="prodName" >prodName:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryprodName"  jsId="queryprodName"   dojoType="dijit.form.TextBox"  />
													</td>
														<td align="right"  i18n="code" >code:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="querycode"  jsId="querycode"   dojoType="dijit.form.TextBox"  />
												</td>  
											<td align="right"  i18n="price" >price:</td>
						<td align="left"  >
							<span id="querypriceImg0"  ><input type="text" class="editerNumber" jsId="queryprice"  id="queryprice"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="querypriceImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="queryprice1"  id="queryprice1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querypriceImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querypriceImgdown" >></span>
							<span id="querypriceImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="queryprice2"  id="queryprice2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/nStart.gif" onclick="queryType(this);" id="querypriceImg" class="imgStyle" >
							
						</td>  
								  </tr>
			                <tr>
							<td align="right" i18n="datef"  >datef:</td> 
						<td align="left"  colspan="3"><span id="querydatefImg0"  ><input class="editerDate"   jsId="querydatef" id="querydatef"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="querydatefTime" id="querydatefTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="querydatefImg1" style="{display:none}" ><input class="editerDateSmaller"   jsId="query1datef" id="query1datef"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query1datefTime" id="query1datefTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querydatefImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querydatefImgdown" >></span>
							<span id="querydatefImg2div" style="{display:none}"><input class="editerDateSmaller"   jsId="query2datef" id="query2datef"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query2datefTime" id="query2datefTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="querydatefImg" class="imgStyle">
						</td>
													<td align="right" colspan="2" ></td>
						<td align="right"  i18n="prodType" >prodType:</td>
						<td align="left"  >
							 								<input type="text" class="editerInput"  id="queryprodType"  jsId="queryprodType"   dojoType="dijit.form.TextBox"  />  
													</td></tr>
					
			
					<tr><td align="right"  i18n="prodCust"  ></td>
					<td align="left" ><input  id="queryprodCust"  jsId="queryprodCust" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoProd.prodCustStore"  /><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryCustomerFloat.html"title="detail" execute="" ></div></div></td>  
					
				
					<td align="right"  i18n="principal"  ></td>
					<td align="left" colspan="3"  ><!----><input  id="queryprincipal"  jsId="queryprincipal" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoProd.principalStore"  /><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryPeoplesFloat.html"title="detail" execute="" ></div></div></td>  
					
	    <td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybutton();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
	    </div>	
<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   Prod List</b></td>
		<td align="right" >
				<button dojoType="dijit.form.Button" onclick="querydisplay('queryDiv');" iconClass="openQueryIcon"  i18n="openQuery" >query</button>
            <span id="rowCount"></span>
        <button dojoType="dijit.form.myButton" onclick="upPage();"  id="but6" disabled='true' jsId="but6" iconClass="upPageIcon" ></button>
        <button dojoType="dijit.form.myButton" onclick="downPage();" id="but7" disabled='true' jsId="but7" iconClass="downPageIcon" ></button>
        <div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
  			  <div dojoType="dijit.Menu">
				  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChange(this.label);"></div>
				  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChange(this.label);"></div>
		      <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChange(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChange(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpage();"></div>
		      </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
        </div>
		</td>
	</tr>
</table>   
	    <div style="{height:90%;width:100%}"  >
	         <div id="grid"  dojoType="dojox.Grid" autoWidth="false"  jsId="grid"	model="model"  structure="layoutSingleRow" ></div>
      </div>      
       
</body>
<script type="text/javascript">trans18tag();</script>
</html>		 