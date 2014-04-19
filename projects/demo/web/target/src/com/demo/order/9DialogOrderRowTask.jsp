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
			dojo.require("projectDojo.OrderRowTask");
     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 <script type="text/javascript" >
		var dojoOrderRowTask= new  projectDojo.OrderRowTask();
	    dojoOrderRowTask.initOrderRowTask();

</script>
	<script type="text/javascript" >
	//manageablePackageName=com.demo.entity.order.crud
	//packageName=com.demo.entity.order
	  var url = getUrl()+ "services/OrderRowTaskManageService";
	  var deletedata =  new Array();
	  var querydata =  new Array();
	  var pagenumber=1;
	  var pagesize=10;
	  var totalCount=0;
	  var queryvo=new Object();
	  var oddstyle='';
	  var model = new dojox.grid.data.Table(null, querydata);
	  var urle = getUrl()+ "services/BasicManageService";        

	function orderRowSet(id,value){
        	/*var itemselect=orderRowStore._getItemByIdentity(value);
        	if(itemselect!='undefined'&& itemselect!=null){
        	}*/
        }
	function taskSet(id,value){
        	/*var itemselect=taskStore._getItemByIdentity(value);
        	if(itemselect!='undefined'&& itemselect!=null){
        	}*/
        }
 
//??????¡À¨ª??¡Á??????????¨®??12???????¨®??12???¨°?¨²??????layout??????layout????structure
//enumeration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
					
var layoutSingleRow=[{
          
 //?¨´??field???????????????????¨°????js????toArray¡Á??????¡§??????querydate????????
	   
				 cells: [ [
							{ name: '<img src="../image/addsmall.gif" onclick="addRow();"   height="18" width="18" border="0">&nbsp;&nbsp;&nbsp;<img src="../image/saveAll.jpg" onclick="call_funUpd();"   height="18" width="18" border="0">' ,get:function(inRowIndex) {return '<img src="../image/delsmall.gif" onclick="removeRows('+inRowIndex+','+querydata[inRowIndex][1]+');"  height="18" width="18" border="0">&nbsp;&nbsp;&nbsp;<img src="../image/savesmall.gif" onclick="call_funUpdSingle('+inRowIndex+');"  height="18" width="18" border="0">';}, width: 6,styles: 'text-align: center;'},//,headerStyles:mystyle
						   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
						   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//

//??????¡À¨ª???¨ª????????
					   {name: i18nStr.orderRow,field: 2,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][2]!=undefined && querydata[inRowIndex][2][2]){str=querydata[inRowIndex][2][2];strid=querydata[inRowIndex][2][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="dojoOrderRowTask.selectOrderRowd('+strid+','+inRowIndex+',2,0,event);"  >';} ,width: 10 }
			//??????¡À¨ª???¨ª????????
					   {name: i18nStr.task,field: 3,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][3]!=undefined && querydata[inRowIndex][3][2]){str=querydata[inRowIndex][3][2];strid=querydata[inRowIndex][3][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="dojoOrderRowTask.selectTask('+strid+','+inRowIndex+',3,0,event);"  >';} ,width: 10 }
			                                        ] ]
                           }]; 



function call_funUpd() {
       var sall=grid.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
			call_funUpdSingle(i);
	   }}//for
 } 
						   
function call_funUpdSingle(saveRowIndex){
         var passAll=0;
         var thisCell=grid.model.data[saveRowIndex];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];

				var manageable=new Object();
			 if(querydata[saveRowIndex][2]!=''&&querydata[saveRowIndex][2]!=undefined){
             manageable.id=querydata[saveRowIndex][2][1];
             vobject.orderRow=manageable;
			 }else{
			 grid.getCell(grid.model.fieldArray[2]).getNode(saveRowIndex).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
							var manageable=new Object();
			 if(querydata[saveRowIndex][3]!=''&&querydata[saveRowIndex][3]!=undefined){
             manageable.id=querydata[saveRowIndex][3][1];
             vobject.task=manageable;
			 }else{
			 grid.getCell(grid.model.fieldArray[3]).getNode(saveRowIndex).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
			


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('OrderRowTaskVO',vobject);
                SOAPClient.invoke(url, "createOrderRowTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
                grid.model.setDatum(ul,saveRowIndex,1);
                });
	         }else{//modify row
                padd.add('OrderRowTaskVO',vobject);
                SOAPClient.invoke(url, "updateOrderRowTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
        } 

 } 
 
 function removeRows(delRowIndex,id){
	//if(id!=0)deletedata.splice(deletedata.length,0,id);
    grid.model.remove([delRowIndex]);
	if(id!=0){
		var pdel = new SOAPClientParameters();      
		pdel.add('id',id);
		SOAPClient.invoke(url, "deleteProd", pdel, false,  function GetEnu_callBack(ul, soapResponse){ });
	}
}
 
 function removeSelectedRowsGrid(){
       //var s = grid.selection.getSelected();
       var s= new Array();
       var sall=grid.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            deletedata.splice(deletedata.length,0,thisCell[1]);
       }}}
       grid.model.remove(s);//grid.removeSelectedRows();
 }
        
	 
function querybutton(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvo=new Object();
			
	if(queryorderRow.getDisplayedValue()!=""){
				var orderRowQuery= new Object();
				//orderRowQuery.OrderRowTaskName=queryorderRow.getDisplayedValue();
				orderRowQuery.id=queryorderRow.getValue();
				queryvo.orderRow=orderRowQuery;
			  }
	if(querytask.getDisplayedValue()!=""){
				var taskQuery= new Object();
				//taskQuery.OrderRowTaskName=querytask.getDisplayedValue();
				taskQuery.id=querytask.getValue();
				queryvo.task=taskQuery;
			  }

			if(validstate==0){
              pagenumber=1;
              getVO(queryvo,pagenumber,pagesize,'0'); 
              //if(totalpage>1){dijit.byId("but7").setDisabled(false);}else{dijit.byId("but7").setDisabled(true);} 
             }      
       }
	 
querydis = function(){
               querydisplay("queryDiv");
            }
 
 


function getVO(queryvo,pagenumber,pagesize,orderBy){
	
      var pu = new SOAPClientParameters2();
      pu.add('OrderRowTaskVO',queryvo) ;
      pu.add('pageNumber',pagenumber) ;
	    pu.add('pageSize',pagesize) ;
	    pu.add('orderBy',orderBy) ;
      SOAPClient.invoke(url,"getOrderRowTask", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydata=new Array();
		   querydata=dojoOrderRowTask.OrderRowTaskVOtoArray_fun(ul,true);
           totalCount=ul[ul.length-1]["ns:id"]; 
           //totalpage=Math.ceil(new Number(totalCount)/pagesize);
           //document.getElementById("rowCount").innerHTML=" "+pagenumber+" / "+totalpage+" / "+totalCount+" " ;
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
 
var dlg; 
var dlgm; 

function init(){
  getVO(queryvo,pagenumber,pagesize,'0');
   	dojo.connect(dijit.byId("grid"), "dodblclick", function(e){
	if(!dlg){	
				var pane = dojo.byId('Dlg');
				pane.style.display = ''; 	
				dlgm = new dijit.Dialog({
					id: 'Dlg',
					refocus:false,
					title: i18nStr.addNote
				},pane);
	}
	dlgm.show();
	document.getElementById('erowIndex').value=e.rowIndex;
	 document.getElementById('OrderRowTaskId').value=querydata[e.rowIndex][1];
		 	 			 
								dijit.byId("addorderRow").setValue(querydata[e.rowIndex][2][1]);
			//dijit.byId("addorderRow").setDisplayedValue('');
											dijit.byId("addtask").setValue(querydata[e.rowIndex][3][1]);
			//dijit.byId("addtask").setDisplayedValue('');
						
	 });  
}

 dojo.addOnLoad(init);   

	function selectOrderRowdFun(rep){
		querydata[dojoOrderRowTask.selectOrderRowdInRow][dojoOrderRowTask.noOrderRowd]=rep;
		grid.updateRow(dojoOrderRowTask.selectOrderRowdInRow);		
	}
	function selectTaskFun(rep){
		querydata[dojoOrderRowTask.selectTaskInRow][dojoOrderRowTask.noTask]=rep;
		grid.updateRow(dojoOrderRowTask.selectTaskInRow);		
	}
var  ifNewAdd=false; 
addRow = function(){
 	grid.addRow([false,0,"","",""],grid.model.getRowCount());
 	if(!dlg){
		var pane = dojo.byId('Dlg');
		pane.style.display = ''; 	
		dlg = new dijit.Dialog({
			id: 0,
			refocus:false,
			title: i18nStr.addNote
		},pane);
	} 
	dlg.show();
	ifNewAdd=true;
	addDivAdd();
} 

//addDiv---------------begin-------------------------------------
var addDivAdd = function(){
					
					dijit.byId("addorderRow").setValue('');
	    dijit.byId("addorderRow").setDisplayedValue('');
							dijit.byId("addtask").setValue('');
	    dijit.byId("addtask").setDisplayedValue('');
				
	document.getElementById('OrderRowTaskId').value='0';
} 

function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new Object();
    vobject.id=document.getElementById('OrderRowTaskId').value;
	var passAll=0;
					
		if(dijit.byId("addorderRow").validate(true)){
		//vobject.orderRow=dijit.byId("addorderRow").getValue();
		var manageable=new Object();
		manageable.id=dijit.byId("addorderRow").getValue();
		vobject.orderRow=manageable;
	}else{
		setErrorClass(dijit.byId("addorderRow")); passAll=1;
	}
			if(dijit.byId("addtask").validate(true)){
		//vobject.task=dijit.byId("addtask").getValue();
		var manageable=new Object();
		manageable.id=dijit.byId("addtask").getValue();
		vobject.task=manageable;
	}else{
		setErrorClass(dijit.byId("addtask")); passAll=1;
	}
		
if(passAll==0){
		//var addrow='';
		var addrow=[];
															//addrow=addrow+","+OrderRowdVOtoArray_fun(vobject.orderRow,true);//addrow.push(OrderRowdVOtoArray_fun(vobject.orderRow,true));
			addrow.push([false,addorderRow.getValue(),addorderRow.getDisplayedValue()]);
											//addrow=addrow+","+TaskVOtoArray_fun(vobject.task,true);//addrow.push(TaskVOtoArray_fun(vobject.task,true));
			addrow.push([false,addtask.getValue(),addtask.getDisplayedValue()]);
						 if(vobject.id==0){//create new row
		padd.add('OrderRowTaskVO',vobject);
		SOAPClient.invoke(url, "createOrderRowTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
		//addrow='false,ul'+addrow;
		addrow.splice(0,0,false,ul);
				console.log("addrow.lenght:"+addrow.length);
				console.log("addrow:"+addrow);
		if(ifNewAdd){
			querydata[grid.model.getRowCount()-1]=addrow;//[addrow];
			grid.updateRow(grid.model.getRowCount()-1);
			ifNewAdd=false;
		}else{
			grid.addRow(addrow ,grid.model.getRowCount());//grid.addRow([addrow]);
		}
		
		document.getElementById('erowIndex').value=grid.model.getRowCount()-1;		
		});
	 }else{//modify row
		padd.add('OrderRowTaskVO',vobject);
		SOAPClient.invoke(url, "updateOrderRowTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
		});
		//addrow='false,vobject.id'+addrow;
		addrow.splice(0,0,false,vobject.id);
		querydata[document.getElementById('erowIndex').value]=addrow;//[addrow];
		grid.updateRow(document.getElementById('erowIndex').value);
	 }
}   }

function addDivRemove(){
     if(window.confirm(i18nStr.deleteConfirm)){
        //var s = dijit.byId("grid").selection.getSelected();
		var s = dijit.byId("grid").rowCount;
        //for(var i=0;i<s.length;i++){ 
              //var ii=s[i];
			  var ii=s.length;
              var si=document.getElementById('erowIndex').value;
              var pdel = new SOAPClientParameters();      
               //pdel.add('id',querydata[ii][1]);
			   pdel.add('id',querydata[si][1]);
               SOAPClient.invoke(url, "deleteOrderRowTask", pdel, false,  function GetEnu_callBack(ul, soapResponse){
               /*if(si>ii){
					if(si-1>=0){document.getElementById('erowIndex').value=si-1;}//else{document.getElementById('erowIndex').value='';}//????????????????????????????????//
					}*/
			   totalCount--;
               var totalpage=Math.ceil(new Number(totalCount)/pagesize);
               document.getElementById("rowCount").innerHTML = i18nStr.di+" "+pagenumber+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCount+" "+i18nStr.rowSize; 	
               if(dlg)dlg.hide();
	        });   
          //}             
           grid.model.remove([si]);
      }
 }    
//addDiv---------------end---------------------------------------	 
//totleinum=2
 //rowinum=0
 //addHeight=80
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
<!--
//if (!="over" && 1!=1)     
/tr
//end 
//set ($inume =1) -->
			
					<tr><td align="right"  i18n="orderRow"  ></td>
					<td align="left" ><input  id="queryorderRow"  jsId="queryorderRow" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderRowTask.orderRowStore"  /></td>  
					
				
					<td align="right"  i18n="task"  ></td>
					<td align="left" colspan="3"  ><!----><input  id="querytask"  jsId="querytask" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderRowTask.taskStore"  /></td>  
					
	    <td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybutton();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
	     </div>
<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   OrderRowTask List</b></td>
		<td align="right" >
				<!--button dojoType="dijit.form.Button" onclick="adddis();" iconClass="openDivIcon"  i18n="edit" >openAdd</button-->
				 &nbsp;&nbsp;&nbsp;
					<button dojoType="dijit.form.Button" onclick="querydis();" iconClass="openQueryIcon"  i18n="openQuery" >query</button>
	          	     <!--button dojoType="dijit.form.Button" onclick="addRow();" iconClass="addIcon" i18n="add" >add</button-->
					 <!--button dojoType="dijit.form.Button" onclick="addDivAdd();" iconClass="addIcon"  >add</button-->
	                 <!--button dojoType="dijit.form.Button" onclick="removeSelectedRowsGrid();" iconClass="delIcon" i18n="delete" >delete</button>
	                 <button dojoType="dijit.form.Button" id="but3" jsId="but3" onclick="call_funUpd();" i18n="save" iconClass="saveIcon">save</button-->
					 <span id="rowCount"></span>
        <button dojoType="dijit.form.myButton" onclick="upPage();"  id="but6" disabled='true' jsId="but6" iconClass="upPageIcon" ></button>
        <button dojoType="dijit.form.myButton" onclick="downPage();" id="but7" disabled='true' jsId="but7" iconClass="downPageIcon" ></button>
        <div id="668" dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
  			  <div dojoType="dijit.Menu">
				  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChange(this.label);"></div>
				  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChange(this.label);"></div>
		      <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChange(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChange(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpage();"></div>
		      </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
        </div>
		    <div id="669" dojoType="dijit.form.myDropDownButton" iconClass="pageStyleIcon"><span>pageStyle</span>
  			   <div dojoType="dijit.Menu">
  				 <div dojoType="dijit.MenuItem"  iconClass="rowIcon"		label="row"	onClick="pageStyle(this.label);"></div>
  				 <div dojoType="dijit.MenuItem"  iconClass="colIcon"		label="col"	onClick="pageStyle(this.label);"></div>
		    </div></div>
	          	     
		</td>
	</tr>
</table>    
	    <div style="{height:90%;width:100%}"  >
	         <div id="grid"  dojoType="dojox.Grid" autoWidth="false"  jsId="grid"	model="model"  structure="layoutSingleRow" singleClickEdit="true" ></div>
      </div>      
<div id="Dlg"  style="width: 1000px;height:110px;display: none;" >
	<table align="center" width="100%" id="0" class="editorTableDialog"  >
                <tr >
				<td align="center" style="{width:11%}">&nbsp;</td>
                <td style="{width:22%}" ><input id="OrderRowTaskId" style="{display:none}"  type="text"  /></td>
                <td style="{width:11%}"><input id="erowIndex" style="{display:none}"  type="text"  /></td>
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

 <!--//if (1==1)     
//   /tr
//end

//set ($inume =1) -->
								<tr><td align="right"  i18n="orderRow"  ></td>
					<td align="left" ><input  id="addorderRow"  jsId="addorderRow" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderRowTask.orderRowStore" onchange="orderRowSet(0,arguments[0]);" required="true"/></td>  
														<td align="right"  i18n="task"  ></td>
					<td align="left" ><!--colspan="3" --><input  id="addtask"  jsId="addtask" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderRowTask.taskStore" onchange="taskSet(0,arguments[0]);" required="true" /></td>  
						    <td align="right"    ></td><td align="right"    ></td></tr>
 <tr align="center"><td></td>
           <td colspan="5"><button dojoType="dijit.form.Button" onclick="addDivAdd();" iconClass="addIcon"  i18n="add" >add</button>
				<button dojoType="dijit.form.Button" onclick="addDivRemove();" iconClass="delIcon"  i18n="delete" >remove</button>
				<button dojoType="dijit.form.Button" onclick="addDivSave();" iconClass="saveIcon"   i18n="save">save</button></td>
           <td colspan="2"></td></tr>
</table>  
	  
</div>          
    
</body>
<script type="text/javascript">trans18tag();</script>
</html>		 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
