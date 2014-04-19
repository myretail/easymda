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
			dojo.require("projectDojo.OrderRowd");
     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 <script type="text/javascript" >
	  var dojoOrderRowd= new  projectDojo.OrderRowd();
	  dojoOrderRowd.initOrderRowd();
	  var url = getUrl()+ "services/OrderRowdManageService";
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

	 //???¡À????1212??layout??layoutstructure
	 //enumeration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 																										

	var layoutSingleRow=[{
          
                 //field????????¨°???js??toArray¡Á???querydate??
                       
                                 cells: [ [
                                           { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
           {name: i18nStr.productNum,field:2, width: 8}
		            ,  {name: i18nStr.unitNum,field:3, width: 8}
		            ,  {name: i18nStr.goodsSuttle,field:4, width: 8}
		            ,  {name: i18nStr.goodsWeight,field:5, width: 8}
		            ,  {name: i18nStr.goodsVolume,field:6, width: 8}
		    		,  {name: i18nStr.label,field:7, width: 10}
		            ,  {name: i18nStr.carriage,field:8, width: 8}
		    		,  {name: i18nStr.especial,field:9, width: 10}
		    		,  {name: i18nStr.goodsState,field:10, width: 10}
		    		,  {name: i18nStr.remark,field:11, width: 10}
		  
//??¨ª????
					 ,   {name: i18nStr.order,field: 12,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][12]!=undefined && querydata[inRowIndex][12][2]!=undefined){str=querydata[inRowIndex][12][2];strid=querydata[inRowIndex][12][1];} return str+'<img src="../image/detailFloat.jpg" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoOrderRowd.detailFloatOrderdData=querydata['+inRowIndex+'][12];dojoOrderRowd.detailOrderd('+querydata[inRowIndex][12][1]+','+inRowIndex+',12,0,event,0);"   >';} ,width: 10 }
			//??¨ª????
					 ,   {name: i18nStr.product,field: 13,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][13]!=undefined && querydata[inRowIndex][13][2]!=undefined){str=querydata[inRowIndex][13][2];strid=querydata[inRowIndex][13][1];} return str+'<img src="../image/detailFloat.jpg" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoOrderRowd.detailFloatProdData=querydata['+inRowIndex+'][13];dojoOrderRowd.detailProd('+querydata[inRowIndex][13][1]+','+inRowIndex+',13,0,event,0);"   >';} ,width: 10 }
			                                        ] ]
                           }]; 

var layoutNoscroll=[ {
			noscroll: true,
			cells: [[
				 { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
				   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} }
		]]},{
          
 //field????????¨°???js??toArray¡Á???querydate??
	   
				 cells: [ [
							//{name: '??', width: 3, get:getChoise},
						  // { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
						  // { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
            {name: i18nStr.productNum,field:2, width: 8 }
		             ,  {name: i18nStr.unitNum,field:3, width: 8 }
		             ,  {name: i18nStr.goodsSuttle,field:4, width: 8 }
		             ,  {name: i18nStr.goodsWeight,field:5, width: 8 }
		             ,  {name: i18nStr.goodsVolume,field:6, width: 8 }
		        				,   {name: i18nStr.label, field: 7,width: 8}
					            ,  {name: i18nStr.carriage,field:8, width: 8 }
		        				,   {name: i18nStr.especial, field: 9,width: 8}
					       				,   {name: i18nStr.goodsState, field: 10,width: 8}
					       			    ,   {name: i18nStr.remark, field: 11,width: 10 }
					 
//????¡ã?
					 ,   {name: i18nStr.order,field: 12,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][12]!=undefined && querydata[inRowIndex][12][2]){str=querydata[inRowIndex][12][2];strid=querydata[inRowIndex][12][1];} return str+'<img src="../image/detailFloat.jpg" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoOrderRowd.detailFloatOrderdData=querydata['+inRowIndex+'][12];dojoOrderRowd.detailOrderd('+querydata[inRowIndex][12][1]+','+inRowIndex+',12,0,event,0);" ';} ,width: 10 }
			//????¡ã?
					 ,   {name: i18nStr.product,field: 13,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][13]!=undefined && querydata[inRowIndex][13][2]){str=querydata[inRowIndex][13][2];strid=querydata[inRowIndex][13][1];} return str+'<img src="../image/detailFloat.jpg" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoOrderRowd.detailFloatProdData=querydata['+inRowIndex+'][13];dojoOrderRowd.detailProd('+querydata[inRowIndex][13][1]+','+inRowIndex+',13,0,event,0);" ';} ,width: 10 }
			                                        ] ]
                           }]; 
function pageStyle(style){//nomarl,col,noscroll
	grid.scrollToRow(0);
	if(style=="nomarl"){
		grid.setStructure(layoutSingleRow);
	}else if(style=="col"){
		grid.setStructure(layoutTwoRow);
	}else if(style=="noscroll"){
		grid.setStructure(layoutNoscroll);
	}
}						   
						   

//totleinum=12
  //rowinum=7
function getCheckOrderRowd(){}

var layoutTwoRow=[{
          
 //field????????¨°???js??toArray¡Á???querydate??
	   
				 cells: [
                      [
						{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
						//{ name: i18nStr.detail, width: 3, get: getCheckOrderRowd, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
										  					  {name: i18nStr.productNum,field:2, width: 8 }
								  			//--------------  if (3 == 7)
														  					 ,  {name: i18nStr.unitNum,field:3, width: 8 }
								  			//--------------  if (4 == 7)
														  					 ,  {name: i18nStr.goodsSuttle,field:4, width: 8 }
								  			//--------------  if (5 == 7)
														  					 ,  {name: i18nStr.goodsWeight,field:5, width: 8 }
								  			//--------------  if (6 == 7)
														  					 ,  {name: i18nStr.goodsVolume,field:6, width: 8 }
								  			//--------------  if (7 == 7)
								//
												  																	,   {name: i18nStr.label, field: 7,width: 8}
																						  								]
												                     //----------------(inum:8)  (rowinum: 7)
									                     //----------------(inum:8)  (rowinum: 7)
									                     //----------------(inum:8)  (rowinum: 7)
									                     //----------------(inum:8)  (rowinum: 7)
									                     //----------------(inum:8)  (rowinum: 7)
								
	//
		  //(8 > 7)
						//
		  //(8 > 7)
							,[
	 //  22222222222inum= 2   inum2=8
																																							  					  {name: i18nStr.carriage,field:8, width: 8}
								  														  													,   {name: i18nStr.especial, field: 9,width: 8 }
																  														  													,   {name: i18nStr.goodsState, field: 10,width: 8 }
																  														  													,   {name: i18nStr.remark, field: 11,width: 10 }
																  														
	//
									 ,   {name: i18nStr.order,field: 12,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][12]!=undefined && querydata[inRowIndex][12][1]!=undefined){str=querydata[inRowIndex][12][2];strid=querydata[inRowIndex][12][1];} return str+'<img src="../image/detailFloat.jpg" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoOrderRowd.detailFloatOrderdData=querydata['+inRowIndex+'][12];dojoOrderRowd.detailOrderd('+querydata[inRowIndex][12][1]+','+inRowIndex+',12,0,event,0);"   >';} ,width: 10 }
										//
									 ,   {name: i18nStr.product,field: 13,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][13]!=undefined && querydata[inRowIndex][13][1]!=undefined){str=querydata[inRowIndex][13][2];strid=querydata[inRowIndex][13][1];} return str+'<img src="../image/detailFloat.jpg" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoOrderRowd.detailFloatProdData=querydata['+inRowIndex+'][13];dojoOrderRowd.detailProd('+querydata[inRowIndex][13][1]+','+inRowIndex+',13,0,event,0);"   >';} ,width: 10 }
										 	
			,   {name: ' ',value:' ' ,width: 10 }
		]]
                           }]; 						   
						   

						   
function querybutton(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvo=new Object();
              n=queryNumber_fun("productNum");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvo.productNum=n;}  
              n=queryNumber_fun("unitNum");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvo.unitNum=n;}  
              n=queryNumber_fun("goodsSuttle");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvo.goodsSuttle=n;}  
              n=queryNumber_fun("goodsWeight");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvo.goodsWeight=n;}  
              n=queryNumber_fun("goodsVolume");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvo.goodsVolume=n;}  
	          if(querylabel.getDisplayedValue()!="")queryvo.label=querylabel.getDisplayedValue();//
              n=queryNumber_fun("carriage");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvo.carriage=n;}  
	          if(queryespecial.getDisplayedValue()!="")queryvo.especial=queryespecial.getDisplayedValue();//
	          if(querygoodsState.getDisplayedValue()!="")queryvo.goodsState=querygoodsState.getDisplayedValue();//
	          if(queryremark.getDisplayedValue()!="")queryvo.remark=queryremark.getDisplayedValue();//
			
	if(queryorder.getDisplayedValue()!=""){
				var orderQuery= new Object();
				//orderQuery.OrderRowdName=queryorder.getDisplayedValue();
				orderQuery.id=queryorder.getValue();
				queryvo.order=orderQuery;
			  }
	if(queryproduct.getDisplayedValue()!=""){
				var productQuery= new Object();
				//productQuery.OrderRowdName=queryproduct.getDisplayedValue();
				productQuery.id=queryproduct.getValue();
				queryvo.product=productQuery;
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
      pu.add('OrderRowdVO',queryvo) ;
      pu.add('pageNumber',pagenumber) ;
	    pu.add('pageSize',pagesize) ;
	    pu.add('orderBy',orderBy) ;
      SOAPClient.invoke(url,"getOrderRowd", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydata=new Array();
		   querydata=dojoOrderRowd.OrderRowdVOtoArray_fun(ul,false);
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

	function selectOrderdFun(rep){
		querydata[dojoOrderRowd.selectOrderdInRow][dojoOrderRowd.noOrderd]=rep;
		grid.updateRow(dojoOrderRowd.selectOrderdInRow);		
	}
	function selectProdFun(rep){
		querydata[dojoOrderRowd.selectProdInRow][dojoOrderRowd.noProd]=rep;
		grid.updateRow(dojoOrderRowd.selectProdInRow);		
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
				<td align="right" i18n="productNum" >productNum:</td>
			<td align="left"  >
							<span id="queryproductNumImg0"  ><input type="text" class="editerNumber"   jsId="queryproductNum"  id="queryproductNum"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="queryproductNumImg1" style="{display:none}" ><input type="text"  class="editerNumberSmall" jsId="queryproductNum1"  id="queryproductNum1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryproductNumImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryproductNumImgdown" >></span>
							<span id="queryproductNumImg2div" style="{display:none}"> <input type="text"  class="editerNumberSmall"  jsId="queryproductNum2"  id="queryproductNum2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/nStart.gif" onclick="queryType(this);" id="queryproductNumImg" class="imgStyle">
							
						</td>
														<td align="right" i18n="unitNum" >unitNum:</td>
							<td align="left" colspan="3" >
								<span id="queryunitNumImg0"  ><input type="text" class="editerNumber" jsId="queryunitNum"  id="queryunitNum"  dojoType="mydojo.NumberTextBox"  /></span>
								<span id="queryunitNumImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="queryunitNum1"  id="queryunitNum1"  dojoType="mydojo.NumberTextBox"  /></span>
								<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryunitNumImgup">></span>
								<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryunitNumImgdown" >></span>
								<span id="queryunitNumImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="queryunitNum2"  id="queryunitNum2"  dojoType="mydojo.NumberTextBox"  /></span>
								<img src="../image/nStart.gif" onclick="queryType(this);" id="queryunitNumImg" class="imgStyle">
							</td>  
																		<td align="right"  i18n="goodsSuttle" >goodsSuttle:</td>
						<td align="left"  >
							<span id="querygoodsSuttleImg0"  ><input type="text" class="editerNumber" jsId="querygoodsSuttle"  id="querygoodsSuttle"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="querygoodsSuttleImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="querygoodsSuttle1"  id="querygoodsSuttle1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querygoodsSuttleImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querygoodsSuttleImgdown" >></span>
							<span id="querygoodsSuttleImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="querygoodsSuttle2"  id="querygoodsSuttle2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/nStart.gif" onclick="queryType(this);" id="querygoodsSuttleImg" class="imgStyle" >
							
						</td>  
								  </tr>
			                <tr>
				<td align="right" i18n="goodsWeight" >goodsWeight:</td>
			<td align="left"  >
							<span id="querygoodsWeightImg0"  ><input type="text" class="editerNumber"   jsId="querygoodsWeight"  id="querygoodsWeight"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="querygoodsWeightImg1" style="{display:none}" ><input type="text"  class="editerNumberSmall" jsId="querygoodsWeight1"  id="querygoodsWeight1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querygoodsWeightImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querygoodsWeightImgdown" >></span>
							<span id="querygoodsWeightImg2div" style="{display:none}"> <input type="text"  class="editerNumberSmall"  jsId="querygoodsWeight2"  id="querygoodsWeight2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/nStart.gif" onclick="queryType(this);" id="querygoodsWeightImg" class="imgStyle">
							
						</td>
														<td align="right" i18n="goodsVolume" >goodsVolume:</td>
							<td align="left" colspan="3" >
								<span id="querygoodsVolumeImg0"  ><input type="text" class="editerNumber" jsId="querygoodsVolume"  id="querygoodsVolume"  dojoType="mydojo.NumberTextBox"  /></span>
								<span id="querygoodsVolumeImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="querygoodsVolume1"  id="querygoodsVolume1"  dojoType="mydojo.NumberTextBox"  /></span>
								<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querygoodsVolumeImgup">></span>
								<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querygoodsVolumeImgdown" >></span>
								<span id="querygoodsVolumeImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="querygoodsVolume2"  id="querygoodsVolume2"  dojoType="mydojo.NumberTextBox"  /></span>
								<img src="../image/nStart.gif" onclick="queryType(this);" id="querygoodsVolumeImg" class="imgStyle">
							</td>  
																				<td align="right"  i18n="label" >label:</td>
						<td align="left"  >
													<input type="text" class="editerInput"  id="querylabel"  jsId="querylabel"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			                <tr>
				<td align="right" i18n="carriage" >carriage:</td>
			<td align="left"  >
							<span id="querycarriageImg0"  ><input type="text" class="editerNumber"   jsId="querycarriage"  id="querycarriage"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="querycarriageImg1" style="{display:none}" ><input type="text"  class="editerNumberSmall" jsId="querycarriage1"  id="querycarriage1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querycarriageImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querycarriageImgdown" >></span>
							<span id="querycarriageImg2div" style="{display:none}"> <input type="text"  class="editerNumberSmall"  jsId="querycarriage2"  id="querycarriage2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/nStart.gif" onclick="queryType(this);" id="querycarriageImg" class="imgStyle">
							
						</td>
												<td align="right"  i18n="especial" >especial:</td>
						<td align="left" colspan="3" >
														<input type="text" class="editerInput"  id="queryespecial"  jsId="queryespecial"   dojoType="dijit.form.TextBox"  />
													</td>  
															<td align="right"  i18n="goodsState" >goodsState:</td>
						<td align="left"  >
													<input type="text" class="editerInput"  id="querygoodsState"  jsId="querygoodsState"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			                <tr>
							<td align="right" i18n="remark" >remark:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryremark"  jsId="queryremark"   dojoType="dijit.form.TextBox"  />
													</td>
				
			
					<td align="right"  i18n="order"  ></td>
					<td align="left" colspan="3"  ><!----><input  id="queryorder"  jsId="queryorder" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderRowd.orderStore"  /><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryOrderdFloat.html"title="detail" execute="" ></div></div></td>  
					
				
					<td align="right"  i18n="product"  ></td>
					<td align="left" ><input  id="queryproduct"  jsId="queryproduct" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderRowd.productStore"  /><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryProdFloat.html"title="detail" execute="" ></div></div></td>
					</tr>
					
	
         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybutton();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
	    </div>	
<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   OrderRowd List</b></td>
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
		    <div id="669" dojoType="dijit.form.myDropDownButton" iconClass="pageStyleIcon"><span>pageStyle</span>
  			   <div dojoType="dijit.Menu">
  				 <div dojoType="dijit.MenuItem"  iconClass="rowIcon"		label="normal"	onClick="pageStyle(this.label);"></div>
  				 <div dojoType="dijit.MenuItem"  iconClass="colIcon"		label="col"	onClick="pageStyle(this.label);"></div>
				<div dojoType="dijit.MenuItem"  iconClass="colIcon"		label="noscroll"	onClick="pageStyle(this.label);"></div>
		    </div></div>
		</td>
	</tr>
</table>   
	    <div style="{height:90%;width:100%}"  >
	         <div id="grid"  dojoType="dojox.Grid" autoWidth="false"  jsId="grid"	model="model"  structure="layoutSingleRow" ></div>
      </div>      
       
</body>
<script type="text/javascript">trans18tag();</script>
</html>		 