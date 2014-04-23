//±¾ÎÄ¼þÃûÓ¦ÐÞ¸Ä${member.type.name}SubQuery.js==OrderRowdSubQuery.js
//var urlOrderRowd = getUrl()+ "services/OrderdManageService";
//var deletedataOrderRowd =  new Array();
var querydataOrderRowd =  new Array();
var deletedataSub =  new Array();
var querydataSub=  new Array();
var pagenumberOrderRowd=1;
var pagesizeOrderRowd=10;
var orderByOrderRowd='0';
var queryvoOrderRowd=new Object();
var oddstyle='';
var modelChildAdd = new dojox.grid.data.Table(null, querydataSub);
var childLayout;
var childLayoutOdd;
function buildChildLayout(pre,mystyle){
	var myLayout=[{  
				//noscroll: true,
				cells: [//ÓÅ»¯Ê±¿É¼ÓÈë£ºÈç¹ý¼ÇÂ¼Êý³¬¹ý12£¬¼´±äÎªÁ½ÐÐ
                      [
				  				  {name: pre+i18nStr.productNum,field:2, width: 8,headerStyles:mystyle}
						  						  				 ,  {name: pre+i18nStr.unitNum,field:3, width: 8,headerStyles:mystyle}
						  						  				 ,  {name: pre+i18nStr.goodsSuttle,field:4, width: 8,headerStyles:mystyle}
						  						  				 ,  {name: pre+i18nStr.goodsWeight,field:5, width: 8,headerStyles:mystyle}
						  						  				 ,  {name: pre+i18nStr.goodsVolume,field:6, width: 8,headerStyles:mystyle}
						  						  				,   {name: pre+i18nStr.label, field: 7,width: 10,headerStyles:mystyle}
						  						  				 ,  {name: pre+i18nStr.carriage,field:8, width: 8,headerStyles:mystyle}
						  						  				,   {name: pre+i18nStr.especial, field: 9,width: 10,headerStyles:mystyle}
						  						  				,   {name: pre+i18nStr.goodsState, field: 10,width: 10,headerStyles:mystyle}
						  						  				,   {name: pre+i18nStr.remark, field: 11,width: 10,headerStyles:mystyle}
						  				
//?????????????????????????????????????????????????/´ÓmanageableAssociationEndsÖÐÏÈÈ¥µôfalseÎªtrue£»ÔÙÈ¥³ýÖ÷±í£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡
				//?????????????????????????????????????????????????/´ÓmanageableAssociationEndsÖÐÏÈÈ¥µôfalseÎªtrue£»ÔÙÈ¥³ýÖ÷±í£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡
					
				,   {name: pre+i18nStr.product,field: 13,get:function(inRowIndex){ var str='';if(querydataSub[inRowIndex]!=undefined && querydataSub[inRowIndex][13]!=undefined){str=querydataSub[inRowIndex][13][2];} return str;} ,width: 10,headerStyles:mystyle }
											]]}];	 
					return myLayout;      
}
childLayout=buildChildLayout(pre,headerstyle);
childLayoutOdd=buildChildLayout(pre,headerstyleodd);		
/*function SubClickRowTab(){
																				if (dijit.byId("$myMainTableAFTab").selectedChildWidget.id=="orderRow2orderRowTasks"){
					buildorderRow2orderRowTasks();
																}else if (dijit.byId("$myMainTableAFTab").selectedChildWidget.id=="payment2payments"){
					buildpayment2payments();
											}

}	

function SubResetNU(trueTab){
					NUorderRow2orderRowTasks=true;
				NUpayment2payments=true;
	}*/


