//±¾ÎÄ¼þÃûÓ¦ÐÞ¸Ä${member.type.name}SubQuery.js==TaskSubQuery.js
//var urlTask = getUrl()+ "services/TaskFormManageService";
//var deletedataTask =  new Array();
var querydataTask =  new Array();
var deletedataSub =  new Array();
var querydataSub=  new Array();
var pagenumberTask=1;
var pagesizeTask=10;
var orderByTask='0';
var queryvoTask=new Object();
var oddstyle='';
var modelChildAdd = new dojox.grid.data.Table(null, querydataSub);
var childLayout;
var childLayoutOdd;
function buildChildLayout(pre,mystyle){
	var myLayout=[{  
				//noscroll: true,
				cells: [//ÓÅ»¯Ê±¿É¼ÓÈë£ºÈç¹ý¼ÇÂ¼Êý³¬¹ý12£¬¼´±äÎªÁ½ÐÐ
                      [
				  				  {name: pre+i18nStr.num,field:2, width: 8,headerStyles:mystyle}
						  						  				 ,  {name: pre+i18nStr.volumne,field:3, width: 8,headerStyles:mystyle}
						  						  				,   {name: pre+i18nStr.remark, field: 4,width: 10,headerStyles:mystyle}
						  				
//?????????????????????????????????????????????????/´ÓmanageableAssociationEndsÖÐÏÈÈ¥µôfalseÎªtrue£»ÔÙÈ¥³ýÖ÷±í£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡
									]]}];	 
					return myLayout;      
}
childLayout=buildChildLayout(pre,headerstyle);
childLayoutOdd=buildChildLayout(pre,headerstyleodd);		
/*function SubClickRowTab(){
										if (dijit.byId("$myMainTableAFTab").selectedChildWidget.id=="orderRowTasks2task"){
					buildorderRowTasks2task();
																}

}	

function SubResetNU(trueTab){
			NUorderRowTasks2task=true;
		}*/


