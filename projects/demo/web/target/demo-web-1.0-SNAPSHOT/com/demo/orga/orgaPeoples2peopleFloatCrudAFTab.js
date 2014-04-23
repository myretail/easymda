	  	  //---begin---------ÅÐ¶ÏÊÇ·ñÎª¶à¶Ô¶àµÄ¹ØÏµ±í
	//---end---------ÅÐ¶ÏÊÇ·ñÎª¶à¶Ô¶àµÄ¹ØÏµ±í
																																								//set (= orgaPeoples2people)
	//----------lastMenber = org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[people]   firstMenber=org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orga]
	//orgaPeoples2peopleAFTab.js	
	
	//---begin---------ÅÐ¶ÏÊÇ·ñÎªtree½á¹¹±ísno
																																																																							//isTree	
			  var NUorgaPeoples2people = false;//needUpdate
		  var urlorga2orgaPeoples = getUrl()+ "services/OrgaPeoplesManageService";
		  /*var deletedataorga2orgaPeoples =   ",";
		  var adddataorga2orgaPeoples =    ",";
		  var querydataorga2orgaPeoples =  new Array();
		  var pagenumberorga2orgaPeoples=1;
		  var totalCountorga2orgaPeoples=0;
		  var pagesizeorga2orgaPeoples=10;
		  var orderByorga2orgaPeoples='0';
		  var queryvoorga2orgaPeoples=new Object();
		  var oddstyle='';
		  var modelorga2orgaPeoples = new dojox.grid.data.Table(null, querydataorga2orgaPeoples);
		  var gridorgaPeoples2people;*/

	var getVOorga2orgaPeoplesOrga=function(id){

			var pu = new SOAPClientParameters2();
			pu.add('peopleId',id) ;
			pu.add('parentId',0) ;
			SOAPClient.invoke(urlorga2orgaPeoples,"getOrgaByPeoplesIdAndParentId", pu, false,  function GetEnu_callBack(ul, soapResponse){      
			 
			querydataorga2orgaPeoplesOrga=dojoOrgaPeoples.OrgaVOtoArray_fun(ul,false);
			 totalCountorga2orgaPeoples=ul[ul.length-1]["ns:id"]; 
			 querydataorga2orgaPeoplesOrga.splice(querydataorga2orgaPeoplesOrga.length-1,1);
			}); 
			modelorga2orgaPeoples.setData(querydataorga2orgaPeoplesOrga);
			
	/*var totalpage=Math.ceil(new Number(totalCountorga2orgaPeoples)/pagesizeorga2orgaPeoples);
		
		if(totalpage>1){
			if(pagenumberorga2orgaPeoples==1){
				dijit.byId("but6orgaPeoples2people").setDisabled(true);
				dijit.byId("but7orgaPeoples2people").setDisabled(false);
			}else if(pagenumberorgaPeoples2people==totalpage){
				dijit.byId("but6orgaPeoples2people").setDisabled(false);
				dijit.byId("but7orgaPeoples2people").setDisabled(true);
			}else{
				dijit.byId("but6orgaPeoples2people").setDisabled(false);
				dijit.byId("but7orgaPeoples2people").setDisabled(false);
			}
		}else{
			dijit.byId("but6orgaPeoples2people").setDisabled(true);
			dijit.byId("but7orgaPeoples2people").setDisabled(true);
		
		}
		if(pagesizeorga2orgaPeoples==0){
			totalpage=1;
			dijit.byId("but6orgaPeoples2people").setDisabled(true);
			dijit.byId("but7orgaPeoples2people").setDisabled(true);
		}
		if(totalpage==1)pagenumberorga2orgaPeoples=1;
		
		 document.getElementById("rowCountorgaPeoples2people").innerHTML=i18nStr.di+" "+pagenumberorga2orgaPeoples+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountorga2orgaPeoples+" "+i18nStr.rowSize; 	
	*/
	}
	  

	
	function saveorgaPeoples2people(){
		var delArray=deletedataorga2orgaPeoples.split(",");
		for(var i=1;i<delArray.length-1;i++){
			var pdel = new SOAPClientParameters();  
			pdel.add('id',delArray[i]);
				SOAPClient.invoke(urlorga2orgaPeoples, "deleteOrgaPeoples", pdel, false,  function GetEnu_callBack(ul, soapResponse){
			});
		}
		deletedataorga2orgaPeoples=",";
		
		var addArray=adddataorga2orgaPeoples.split(",");
					  
		for(var i=1;i<addArray.length-1;i++){
			var vobject=new Object();
			var Peoplesvo=new Object();
			Peoplesvo.id=mainID;
			vobject.people=Peoplesvo;
			var Orgavo=new Object();
			Orgavo.id=addArray[i];
			vobject.orga=Orgavo;
			var padd = new SOAPClientParameters2(); 
			padd.add('OrgaPeoplesVO',vobject);
			SOAPClient.invoke(urlorga2orgaPeoples, "createOrgaPeoples", padd, false,  function GetEnu_callBack(ul, soapResponse){
				var node = _tree._itemNodeMap[addArray[i]];
				popStore.setValue(node.item,"selectIf",ul); 
			});
		}
		
		adddataorga2orgaPeoples=",";
		
	}
	
	var _tree;
	var queryvoorga=new Object();
	
	var buildorgaPeoples2people=function(){
	
		if( mainID!=undefined && mainID!=''){
		
			if(gridorgaPeoples2people==undefined){
				_tree = new dijit.Tree({
				id: "tree",
				getIconClass:selIconClass,
				model: myModel//,
				//dndController: "dijit._tree.dndSource" 
			});
			dojo.byId("gridorgaPeoples2people").appendChild(_tree.domNode);
			_tree.startup();
				
				
				getTreeNodes(mainID,0,null,0,1);
				expandAllChildrenNode(_tree,_tree.rootNode,0,1);
	 
				 dojo.connect(dijit.byId("gridorgaPeoples2people"), "_onExpandoClick", function(message){
							   // _expandNode
							   var node = message.node;
							   var ch2node=node.getChildren();
							   for (var i=0; i<ch2node.length; i++){	
							   //alert(ch2node.length);
							   if(ch2node[i].getChildren().length==0&&ch2node[i].item.haveChild=="0"){
								 var ch2item =ch2node[i].item;
								 getTreeNodes(mainID,ch2item.eId,ch2item,0,1);
							   }}
				});   
			  
				//²éÑ¯ÁÐ±í----begin
				/*alert("Execute of node " + continentStore.getLabel(item)
				+", population=" + continentStore.getValue(item, "population"));*/
				 dojo.connect(_tree, "onClick", function(item,node){
					changeIconClass(item,node);
					if(item.selectIf==undefined || item.selectIf==''){
						var idStr=","+item.eId+",";
					
						if(adddataorga2orgaPeoples.indexOf(idStr)==-1){
							adddataorga2orgaPeoples=adddataorga2orgaPeoples+item.eId+",";
						}else{
							adddataorga2orgaPeoples=adddataorga2orgaPeoples.substring(0,adddataorga2orgaPeoples.indexOf(idStr))+adddataorga2orgaPeoples.substring(adddataorga2orgaPeoples.indexOf(idStr)+idStr.length-1);
						}
					}else{
						var idStr=","+item.selectIf+",";
						if(deletedataorga2orgaPeoples.indexOf(idStr)==-1){
							deletedataorga2orgaPeoples=deletedataorga2orgaPeoples+item.selectIf+",";
						}else{
							deletedataorga2orgaPeoples=deletedataorga2orgaPeoples.substring(0,deletedataorga2orgaPeoples.indexOf(idStr))+deletedataorga2orgaPeoples.substring(deletedataorga2orgaPeoples.indexOf(idStr)+idStr.length-1);
						}
					}
				}); 
			}}
	}
	
	/*function pageSizeChangeorgaPeoples2people(mylabel){
			pagesizeorgaPeoples2people=mylabel;
			getVOorgaPeoples2peopleOrgaPeoples(queryvoorgaPeoples2peopleOrgaPeoples);
		}

		function allpageorgaPeoples2people(){
			pagesizeorgaPeoples2people=0;
			getVOorgaPeoples2peopleOrgaPeoples(queryvoorgaPeoples2peopleOrgaPeoples);
		}*/

		function upPageorgaPeoples2people(){
			pagenumberorgaPeoples2people--;
			getVOorgaPeoples2peopleOrgaPeoples(queryvoorgaPeoples2peopleOrgaPeoples);
		}
		function downPageorgaPeoples2people(){
			pagenumberorgaPeoples2people++;
			getVOorgaPeoples2peopleOrgaPeoples(queryvoorgaPeoples2peopleOrgaPeoples);
		}
	
	var selIconClass= function(/*dojo.data.Item*/ item, /*Boolean*/ opened){
		// summary: user overridable function to return CSS class name to display icon
		//return (!item || this.model.mayHaveChildren(item)) ? (opened ? "dijitFolderOpened" : "dijitFolderClosed") : "dijitLeaf"
		//console.log("item.selectIf:"+item.selectIf);
		//for(var t in item){console.log(t+":"+item[t]);}
		return (!item.root)?((item.selectIf==undefined|| item.selectIf=='') ? "dijitUnSelected" : "dijitSelected"): (opened ? "dijitFolderOpened" : "dijitFolderClosed") ;
	}
	
	var changeIconClass= function(/*dojo.data.Item*/ item,node){
		// summary: user overridable function to return CSS class name to display icon
		//return (!item || this.model.mayHaveChildren(item)) ? (opened ? "dijitFolderOpened" : "dijitFolderClosed") : "dijitLeaf"
		//console.log("item.item._iconClass:"+item.iconNode.class  );
		//console.log("itemnode._iconClass:"+node.iconNode.class);
		//for(var t in node.iconNode){console.log(t+":"+node.iconNode[t]);}
		//for(var t in item.iconNode){console.log(t+"::::"+item.iconNode[t]);}
		var classNameTemp=node.iconNode.className;
		if(classNameTemp.indexOf("dijitSelected")==-1){
		// "dijitUnSelected" : "dijitSelected";
			node.iconNode.className=classNameTemp.replace("dijitUnSelected","dijitSelected");
		}else{
			node.iconNode.className=classNameTemp.replace("dijitSelected","dijitUnSelected");
		}
		console.log("node.iconNode.className:"+node.iconNode.className  );
	}


	
	          //associatedClass==manageable
        //¶ÔÓÚ¿ÉÐÞ¸ÄµÄlayout£¬($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orga], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[people]])²¢if(!${member.many})  µÄ×Ö¶ÎÓ¦µ¯³öFloatµÄÑ¡Ôñ´°¿Ú´ý²âÊÔ
	                                     
              //begin from 41.4
                  	var querydataorga2orgaPeoplesOrga =  new Array();//???????????
					function getTreeNodes(peopleId,ParentSno,chitem,layerInt,layerSum){//Ê×²ãlayerInt=0
						var pu = new SOAPClientParameters2();
						pu.add('id',peopleId) ;
						pu.add('pid',ParentSno) ;
						SOAPClient.invoke(urlorga2orgaPeoples,"getOrgaByPeoplesIdAndParentId", pu, false,  function GetEnu_callBack(ul, soapResponse){      //Ó¦ÎªHandleForRoleOperateByParentId
									   var pInfo = {
													parent: chitem,		
													attribute: "children"	
										};
							   if(ul!=null && ul.length>1 ){
							   
			var re=dojoOrgaPeoples.OrgaVOtoArray_fun(ul,false);
									 for(var i = 0; i < ul.length-1; i++){		
					  //var newitem=popStore.newItem({name:ulo["ns:handleName"] ,type:ulo["ns:handleSno"] ,eId:ulo["ns:id"],haveChild:"0",selectIf:ulo["ns:selected"]}, pInfo);//haveChild=0³õÊ¼£¬1ÓÐ×Ó½áµã£¬2ÎÞ×Ó½áµã
					  //if(layerInt<layerSum)getTreeNodes(peopleId,ulo["ns:handleSno"]+"___",newitem,layerInt+1,layerSum);
							  var newitem=popStore.newItem({name:re[i][2] ,type:ul[i]["ns:parentId"] ,eId:re[i][1],haveChild:"0",selectIf:ul[i]["ns:selected"]}, pInfo);
							  if(layerInt<layerSum)getTreeNodes(peopleId,re[i][1],newitem,layerInt+1,layerSum);
									  }
									 if(chitem!=null){
											popStore.setValue(chitem,"haveChild","1"); 
											var node = dijit.byId("tree")._itemNodeMap[chitem.eId];
											node._updateItemClasses(node.item);
											//node.expand();       
									  }
								}else{
									popStore.setValue(chitem,"haveChild","2");  
								}       
						  });
					
					}
		
		function expandAllChildrenNode(tree,treeNode,layerInt,layerSum){
		      //treeNode.expand();
		      var childrenArray=treeNode.getChildren();
          if(childrenArray.length>0)tree._expandNode(treeNode);
          for (var i=0; i<childrenArray.length; i++){//begin	
             if(layerInt<layerSum) expandAllChildrenNode(tree,childrenArray[i],layerInt+1,layerSum);
             //if(layerInt==layerSum&&tree.model.mayHaveChildren(childrenArray[i].item))childrenArray[i].
             if(layerInt==layerSum)childrenArray[i]._updateItemClasses(childrenArray[i].item);
          }
        }       
		
		var poptarts ={ label:'name',identifier:'eId',items:querydataorga2orgaPeoplesOrga};
         var popStore = new dojo.data.ItemFileWriteStore({data: poptarts});
		 var myModel = new dijit.tree.ForestStoreModel({
  				store: popStore,
  				rootId: "root",
  				rootLabel: "tree",
  				childrenAttrs: ["children"]
  			});      
					
								 //end from 41.4
                                                     		
