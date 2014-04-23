	//±¾Ä£°åµÄÔª±íÊÇ4.1µÄÔª±í£¬---begin---------ÅÐ¶Ï"¼ýÎ²±í/ÒýÓÃ±í"£¨"Ôª±í"Îª"¼ýÍ·±í"/"±»ÒýÓÃ±í"£©ÊÇ·ñÎª¶à¶Ô¶àµÄ¹ØÏµ±í
	   //true£º"¼ýÎ²±í/ÒýÓÃ±í"£¨"Ôª±í"Îª"¼ýÍ·±í"/"±»ÒýÓÃ±í"£©ÊÇ¶à¶Ô¶à¹ØÏµ±í
//---end---------ÅÐ¶Ï"¼ýÎ²±í/ÒýÓÃ±í"£¨"Ôª±í"Îª"¼ýÍ·±í"/"±»ÒýÓÃ±í"£©ÊÇ·ñÎª¶à¶Ô¶àµÄ¹ØÏµ±í
																																								//set (= orga2orgaPeoples)

	//----------lastMenber = org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orga]   firstMenber=org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[people]
	//orga2orgaPeoplesRightAFTab.js	
	
	//---begin---------ÅÐ¶Ï"ÒýÓÃ±í" µÄ "ÒýÓÃ±í"ÊÇ·ñÎªtree½á¹¹±ísno('ÒýÓÃ±í'ÊÇ¶à¶Ô¶à¹ØÏµ±í)
																																																																																																																																	    //---end---------ÅÐ¶Ï"ÒýÓÃ±í" µÄ "ÒýÓÃ±í"ÊÇ·ñÎªtree½á¹¹±ísno
//begin--ÅÐ¶Ï"ÒýÓÃ±í" µÄ "ÒýÓÃ±í"ÊÇ·ñÎªÖ÷±í('ÒýÓÃ±í'ÊÇ¶à¶Ô¶à¹ØÏµ±í)
//begin--ÅÐ¶Ï"ÒýÓÃ±í" µÄ "ÒýÓÃ±í"ÊÇ·ñÎª×Ó±í('ÒýÓÃ±í'ÊÇ¶à¶Ô¶à¹ØÏµ±í)
//end--ÅÐ¶Ï"ÒýÓÃ±í" µÄ "ÒýÓÃ±í"ÊÇ·ñÎª×Ó±í	
	//ÒÔÏÂÊÇ"ÒýÓÃ±í"Îª¶à¶Ô¶à±í£¬"ÒýÓÃ±í" µÄ "ÒýÓÃ±í"Îªµ¥´¿±íµÄÇé¿ö	('ÒýÓÃ±í'ÊÇ¶à¶Ô¶à¹ØÏµ±í)
			  var NUorga2orgaPeoples = false;//needUpdate
		  var urlorgaPeoples2people = getUrl()+ "services/OrgaPeoplesManageService";
		  var deletedataorgaPeoples2people =   ",";
		  var adddataorgaPeoples2people =    ",";
		  var querydataorgaPeoples2peoplePeoples =  new Array();
		  var pagenumberorgaPeoples2people=1;
		  var totalCountorgaPeoples2people=0;
		  var pagesizeorgaPeoples2people=10;
		  var orderByorgaPeoples2people='0';
		  var queryvoorgaPeoples2people=new Object();
		  var oddstyle='';
		  var modelorga2orgaPeoples = new dojox.grid.data.Table(null, querydataorgaPeoples2peoplePeoples);
		  var gridorga2orgaPeoples;

		var getVOorgaPeoples2peoplePeoples=function(id){

			var pu = new SOAPClientParameters2();
			pu.add('id',id) ;
			SOAPClient.invoke(urlorgaPeoples2people,"getPeoplesByOrgaId", pu, false,  function GetEnu_callBack(ul, soapResponse){      
			querydataorgaPeoples2peoplePeoples=dojoOrgaPeoples.PeoplesVOtoArray_fun(ul,false);
			totalCountorgaPeoples2people=ul[ul.length-1]["ns:id"]; 
			querydataorgaPeoples2peoplePeoples.splice(querydataorgaPeoples2peoplePeoples.length-1,1);
			querydataorgaPeoples2peoplePeoples=selected_fun(querydataorgaPeoples2peoplePeoples);
			}); 
			modelorga2orgaPeoples.setData(querydataorgaPeoples2peoplePeoples);
			var totalpage=Math.ceil(new Number(totalCountorgaPeoples2people)/pagesizeorgaPeoples2people);
		
		if(totalpage>1){
			if(pagenumberorgaPeoples2people==1){
				dijit.byId("but6orga2orgaPeoples").setDisabled(true);
				dijit.byId("but7orga2orgaPeoples").setDisabled(false);
			}else if(pagenumberorga2orgaPeoples==totalpage){
				dijit.byId("but6orga2orgaPeoples").setDisabled(false);
				dijit.byId("but7orga2orgaPeoples").setDisabled(true);
			}else{
				dijit.byId("but6orga2orgaPeoples").setDisabled(false);
				dijit.byId("but7orga2orgaPeoples").setDisabled(false);
			}
		}else{
			dijit.byId("but6orga2orgaPeoples").setDisabled(true);
			dijit.byId("but7orga2orgaPeoples").setDisabled(true);
		
		}
		if(pagesizeorgaPeoples2people==0){
			totalpage=1;
			dijit.byId("but6orga2orgaPeoples").setDisabled(true);
			dijit.byId("but7orga2orgaPeoples").setDisabled(true);
		}
		if(totalpage==1)pagenumberorgaPeoples2people=1;
		
		 document.getElementById("rowCountorga2orgaPeoples").innerHTML=i18nStr.di+" "+pagenumberorgaPeoples2people+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountorgaPeoples2people+" "+i18nStr.rowSize; 	

	}
	  
	function selected_fun(transData){
			 for(var i = 0; i < transData.length; i++){		
                        var row = transData[i];
                        if(row[row.length-1]==undefined||row[row.length-1]==''){
							row[0] = false;
						}else{
							row[0] = true;
						}
						transData[i]=row;
						}
				return 		transData;
		  }
	
	/*function saveorga2orgaPeoples(){
		var delArray=deletedataorgaPeoples2people.split(",");
		for(var i=1;i<delArray.length-1;i++){
			var pdel = new SOAPClientParameters();  
			pdel.add('id',delArray[i]);
				SOAPClient.invoke(urlorgaPeoples2people, "deleteOrgaPeoples", pdel, false,  function GetEnu_callBack(ul, soapResponse){
			});
		}
		deletedataorgaPeoples2people=",";
		
		var addArray=adddataorgaPeoples2people.split(",");
					  
		for(var i=1;i<addArray.length-1;i++){
			var vobject=new Object();
			var Orgavo=new Object();
			Orgavo.id=mainID;
			vobject.orga=Orgavo;
			var Peoplesvo=new Object();
			Peoplesvo.id=addArray[i];
			vobject.people=Peoplesvo;
			var padd = new SOAPClientParameters2(); 
			padd.add('OrgaPeoplesVO',vobject);
			SOAPClient.invoke(urlorgaPeoples2people, "createOrgaPeoples", padd, false,  function GetEnu_callBack(ul, soapResponse){
				for(var j=0;j<querydataorgaPeoples2peoplePeoples.length;j++){
					if(querydataorgaPeoples2peoplePeoples[j][1]==addArray[i]){
						querydataorgaPeoples2peoplePeoples[j][querydataorgaPeoples2peoplePeoples[j].length-1]=ul;
						break;
						}
				}
			});
		}
		
		adddataorgaPeoples2people=",";
		
	}*/
	
	
	var queryvopeople=new Object();
	var buildorga2orgaPeoples=function(){
		if(NUorga2orgaPeoples && mainID!=undefined && mainID!=''){
			getVOorgaPeoples2peoplePeoples(mainID);
			if(gridorga2orgaPeoples==undefined){
				gridorga2orgaPeoples = new dojox.Grid({
							title: "",
							id: "gridorga2orgaPeoples",
							jsId: "gridorga2orgaPeoples",
							structure: layoutorga2orgaPeoples,
							rowCount:querydataorgaPeoples2peoplePeoples.length,
							model:modelorga2orgaPeoples
						}, dojo.byId("gridorga2orgaPeoples"));
						
				gridorga2orgaPeoples.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100});
		
			}else{
				gridorga2orgaPeoples.updateRowCount(querydataorgaPeoples2peoplePeoples.length); 
			}
			
			NUorga2orgaPeoples=false;
		}

	}
	
	/*function pageSizeChangeorga2orgaPeoples(mylabel){
			pagesizeorga2orgaPeoples=mylabel;
			getVOorga2orgaPeoplesOrgaPeoples(queryvoorga2orgaPeoplesOrgaPeoples);
		}

		function allpageorga2orgaPeoples(){
			pagesizeorga2orgaPeoples=0;
			getVOorga2orgaPeoplesOrgaPeoples(queryvoorga2orgaPeoplesOrgaPeoples);
		}*/

		function upPageorga2orgaPeoples(){
			pagenumberorga2orgaPeoples--;
			getVOorga2orgaPeoplesOrgaPeoples(queryvoorga2orgaPeoplesOrgaPeoples);
		}
		function downPageorga2orgaPeoples(){
			pagenumberorga2orgaPeoples++;
			getVOorga2orgaPeoplesOrgaPeoples(queryvoorga2orgaPeoplesOrgaPeoples);
		}
	

	                    //associatedClass==manageable
		
        //¶ÔÓÚ¿ÉÐÞ¸ÄµÄlayout£¬($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orga], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[people]])²¢if(!${member.many})  µÄ×Ö¶ÎÓ¦µ¯³öFloatµÄÑ¡Ôñ´°¿Ú´ý²âÊÔ
	                                          //¶ÔÓÚ¿ÉÐÞ¸ÄµÄlayout£¬($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orga], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[people]])²¢if(!${member.many})  µÄ×Ö¶ÎÓ¦µ¯³öFloatµÄÑ¡Ôñ´°¿Ú´ý²âÊÔ
	                                     
              //begin from 41.4
		var querydataorgaPeoples2peoplePeoples =  new Array();
		
		var getChoiseorgaPeoples2people= function(inRowIndex) {
			if(true==querydataorgaPeoples2peoplePeoples[inRowIndex][0]){//'+querydataorgaPeoples2peoplePeoples[inRowIndex][1]+'
				 return  '<input class="dojoxGrid-input"  name="selectorgaPeoples2people" id="" checked="true" type="checkbox" />';
			 }else{
				 return  '<input class="dojoxGrid-input"  name="selectorgaPeoples2people" id=""  type="checkbox"  />';
			 }
		}

/*function clickorgaPeoples2people(row){//  
			
			if(querydataorgaPeoples2peoplePeoples[row][querydataorgaPeoples2peoplePeoples[row].length-1]==undefined){
				var idStr=","+querydataorgaPeoples2peoplePeoples[row][1]+",";
			
				if(adddataorgaPeoples2people.indexOf(idStr)==-1){
					adddataorgaPeoples2people=adddataorgaPeoples2people+querydataorgaPeoples2peoplePeoples[row][1]+",";
				}else{
					
					adddataorgaPeoples2people=adddataorgaPeoples2people.substring(0,adddataorgaPeoples2people.indexOf(idStr))+adddataorgaPeoples2people.substring(adddataorgaPeoples2people.indexOf(idStr)+idStr.length-1);
				}
			
			}else{
				
				var idStr=","+querydataorgaPeoples2peoplePeoples[row][querydataorgaPeoples2peoplePeoples[row].length-1]+",";
				
				if(deletedataorgaPeoples2people.indexOf(idStr)==-1){
					deletedataorgaPeoples2people=deletedataorgaPeoples2people+querydataorgaPeoples2peoplePeoples[row][querydataorgaPeoples2peoplePeoples[row].length-1]+",";
				}else{
					deletedataorgaPeoples2people=deletedataorgaPeoples2people.substring(0,deletedataorgaPeoples2people.indexOf(idStr))+deletedataorgaPeoples2people.substring(deletedataorgaPeoples2people.indexOf(idStr)+idStr.length-1);
				}
			}
	}		*/
			var layoutorga2orgaPeoples=[{
				   //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydateÖÐÈ¡Êý¾Ý
		   
					 cells: [ [
							   //{ name: i18nStr.chose, width: 3, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
							   { name: i18nStr.chose, width: 3,styles: 'text-align: center;', get:getChoiseorgaPeoples2people},
							   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
								  				  {name: i18nStr.peopleName, field: 2,width: 10 }
							  								  				,   {name: i18nStr.peoplePassword, field: 3,width: 10 }
							  								  				,   {name: i18nStr.peopleStatus, field: 4,width: 10 }
							  								  				,   {name: i18nStr.birthDay,field:5, width: 8}
						  								  				,   {name: i18nStr.sex, field: 6,width: 10 }
							  								  				,   {name: i18nStr.birthPlace, field: 7,width: 10 }
							  								  				,   {name: i18nStr.address, field: 8,width: 10 }
							  								  				,   {name: i18nStr.tel, field: 9,width: 10 }
							  								  				,   {name: i18nStr.engageMode, field: 10,width: 10 }
							  								  				,   {name: i18nStr.engageDate,field:11, width: 8}
						  								  				,   {name: i18nStr.gradeEnum, field: 12,width: 10 }
							  								  				,   {name: i18nStr.remark, field: 13,width: 10 }
							  								
					   ] ]
								   }]; 
								 //end from 41.4
                                 	    	