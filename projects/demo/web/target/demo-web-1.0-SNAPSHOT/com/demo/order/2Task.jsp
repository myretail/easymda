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
			dojo.require("projectDojo.Task");
     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 <script type="text/javascript" >
	  var dojoTask= new  projectDojo.Task();
	  dojoTask.initTask();
	  var url = getUrl()+ "services/TaskManageService";
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
           {name: i18nStr.num,field:2, width: 8}
		            ,  {name: i18nStr.volumne,field:3, width: 8}
		    		,  {name: i18nStr.remark,field:4, width: 10}
		  
//Úµí²»Ð¶
					 ,   {name: i18nStr.taskForm,field: 5,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][5]!=undefined && querydata[inRowIndex][5][2]!=undefined){str=querydata[inRowIndex][5][2];strid=querydata[inRowIndex][5][1];} return str+'<img src="../image/detailFloat.jpg" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoTask.detailFloatTaskFormData=querydata['+inRowIndex+'][5];dojoTask.detailTaskForm('+querydata[inRowIndex][5][1]+','+inRowIndex+',5,0,event,0);"   >';} ,width: 10 }
			                                        ] ]
                           }]; 


						   
function querybutton(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvo=new Object();
              n=queryNumber_fun("num");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvo.num=n;}  
              n=queryNumber_fun("volumne");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvo.volumne=n;}  
	          if(queryremark.getDisplayedValue()!="")queryvo.remark=queryremark.getDisplayedValue();//
			
	if(querytaskForm.getDisplayedValue()!=""){
				var taskFormQuery= new Object();
				//taskFormQuery.TaskName=querytaskForm.getDisplayedValue();
				taskFormQuery.id=querytaskForm.getValue();
				queryvo.taskForm=taskFormQuery;
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
      pu.add('TaskVO',queryvo) ;
      pu.add('pageNumber',pagenumber) ;
	    pu.add('pageSize',pagesize) ;
	    pu.add('orderBy',orderBy) ;
      SOAPClient.invoke(url,"getTask", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydata=new Array();
		   querydata=dojoTask.TaskVOtoArray_fun(ul,false);
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

	function selectTaskFormFun(rep){
		querydata[dojoTask.selectTaskFormInRow][dojoTask.noTaskForm]=rep;
		grid.updateRow(dojoTask.selectTaskFormInRow);		
	}

//totleinum=4
 //rowinum=1

</script>
</head>	 
<body class="tundra">
<div id="queryDiv" style="margin-right: 0px;  height: 100px; display:none;" >
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
				<td align="right" i18n="num" >num:</td>
			<td align="left"  >
							<span id="querynumImg0"  ><input type="text" class="editerNumber"   jsId="querynum"  id="querynum"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="querynumImg1" style="{display:none}" ><input type="text"  class="editerNumberSmall" jsId="querynum1"  id="querynum1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querynumImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querynumImgdown" >></span>
							<span id="querynumImg2div" style="{display:none}"> <input type="text"  class="editerNumberSmall"  jsId="querynum2"  id="querynum2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/nStart.gif" onclick="queryType(this);" id="querynumImg" class="imgStyle">
							
						</td>
														<td align="right" i18n="volumne" >volumne:</td>
							<td align="left" colspan="3" >
								<span id="queryvolumneImg0"  ><input type="text" class="editerNumber" jsId="queryvolumne"  id="queryvolumne"  dojoType="mydojo.NumberTextBox"  /></span>
								<span id="queryvolumneImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="queryvolumne1"  id="queryvolumne1"  dojoType="mydojo.NumberTextBox"  /></span>
								<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryvolumneImgup">></span>
								<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryvolumneImgdown" >></span>
								<span id="queryvolumneImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="queryvolumne2"  id="queryvolumne2"  dojoType="mydojo.NumberTextBox"  /></span>
								<img src="../image/nStart.gif" onclick="queryType(this);" id="queryvolumneImg" class="imgStyle">
							</td>  
																				<td align="right"  i18n="remark" >remark:</td>
						<td align="left"  >
													<input type="text" class="editerInput"  id="queryremark"  jsId="queryremark"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			
			
					<tr><td align="right"  i18n="taskForm"  ></td>
					<td align="left" ><input  id="querytaskForm"  jsId="querytaskForm" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoTask.taskFormStore"  /><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryTaskFormFloat.html"title="detail" execute="" ></div></div></td>  
					
	    <td align="right"    ></td><td align="right"    ></td><td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybutton();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
	    </div>	
<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   Task List</b></td>
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