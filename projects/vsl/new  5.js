#if ($totleinum<=9)//begin buildLayout


var mainLayout =[{//?????????colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: i18nStr.detail, width: 3, get: getCheck${manageable.name}, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
#set ($comma = "")
#set ($inum = 2)                       
#foreach($member in $manageable.manageableAttributes)
		#if ($member.name != ${manageable.manageableIdentifier.name})
		  #if ($member.type.fullyQualifiedName == 'double' || $member.type.fullyQualifiedName == 'long')
				 ${comma} {name: i18nStr.$member.name,field:${inum}, width: 8}
				#set ($inum= $inum + 1)
		  #elseif ($member.type.dateType)
				${comma}  {name: i18nStr.${member.name},field:${inum}, width: 8}
				#set ($inum= $inum + 1)
		  #else
				${comma}  {name: i18nStr.$member.name, field: ${inum},width: 10}
				#set ($inum= $inum + 1)
		  #end
		  #set ($comma = ", ")
		#end
#end  

#foreach($member in $manageable.manageableAssociationEnds)//
		#if(!${member.many})                                             
			 ${comma}  {name: i18nStr.$member.name,field: ${inum},get:function(inRowIndex){ var str='';if(querydata${manageable.name}[inRowIndex]!=undefined && querydata${manageable.name}[inRowIndex][${inum}]!=undefined){str=querydata${manageable.name}[inRowIndex][${inum}][2];} return str;} ,width: 10 }
			#set ($inum= $inum + 1)
		#set ($comma = ", ")
		#else
			#set ($childRow = $inum) 
			#set ($inum= $inum + 1)
		#end
#end                        
					],[
		#set ($inumcolSpan= $totleinum + 2)		
							{ name: '\u8be6\u7ec6', colSpan: $inumcolSpan ,styles: 'padding: 0; margin: 0;', get: getSub${manageable.name} }//value: '<div style="height:0px; background-color: white;"></div>'
						  ]
				  ]
	  
				}];	 
var subInt=	$childRow;			
function getSub${manageable.name}(inRowIndex){
		var cell = this;
		setTimeout(function() { buildSubgrid${manageable.name}(inRowIndex, cell); }, 0);
		var h =0;
		if(detailRows${manageable.name}[inRowIndex]&&querydata${manageable.name}[inRowIndex][$childRow].length>0){
							h=65+25*querydata${manageable.name}[inRowIndex][$childRow].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}				

#else
#if($totleinum>9 && $totleinum<=20 )
#set($rowint=($totleinum+2)/2) <!--rowint======$totleinum====$rowint-->


var mainLayout =[{//?????????colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: i18nStr.detail, width: 3, get: getCheck${manageable.name}, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
#set ($comma = "")
#set ($inum = 2)                       
#foreach($member in $manageable.manageableAttributes)
	#if ($inum<=$rowint)
		#if ($member.name != ${manageable.manageableIdentifier.name})
		  #if ($member.type.fullyQualifiedName == 'double' || $member.type.fullyQualifiedName == 'long')
				 ${comma} {name: i18nStr.$member.name,field:${inum}, width: 8}
				#set ($inum= $inum + 1)
		  #elseif ($member.type.dateType)
				${comma}  {name: i18nStr.${member.name},field:${inum}, width: 8}
				#set ($inum= $inum + 1)
		  #else
				, {name: i18nStr.$member.name, field: ${inum},width: 10}
				#set ($inum= $inum + 1)
		  #end
		  #set ($comma = ", ")
		#end
	#end
#end  

#foreach($member in $manageable.manageableAssociationEnds)//
	#if ($inum<=$rowint)
		#if(!${member.many})                                             
			 ${comma}  {name: i18nStr.$member.name,field: ${inum},get:function(inRowIndex){ var str='';if(querydata${manageable.name}[inRowIndex]!=undefined && querydata${manageable.name}[inRowIndex][${inum}]!=undefined){str=querydata${manageable.name}[inRowIndex][${inum}][2];} return str;} ,width: 10 }
			#set ($comma = ", ")
			#set ($inum= $inum + 1)
		#else
			#set ($childRow = $inum) 
			#set ($inum= $inum + 1)
		#end
	#end
#end                        
					],[
							{ name: '\u8be6\u7ec6', colSpan: 11,styles: 'padding: 0; margin: 0;', get: getDetail${manageable.name} }//value: '<div style="height:0px; background-color: white;"></div>'
						  ]
				  ]
	  
				}];	 

var subInt=	$childRow;	
function buildMainDetailLayout(pre,mystyle){
var myLayout=[{noscroll: true,
					 cells: [
                      [
#set ($comma = "")
#set ($inum = 2)                       
#foreach($member in $manageable.manageableAttributes)
		#if ($member.name != ${manageable.manageableIdentifier.name})
			  #if ($member.type.fullyQualifiedName == 'double' || $member.type.fullyQualifiedName == 'long')
				#if($inum > $rowint)    
					 ${comma} {name: pre+i18nStr.$member.name,field:${inum}, width: 8,headerStyles:mystyle}
					 #set ($comma = ", ")		
				#end
					#set ($inum= $inum + 1)
			  #elseif ($member.type.dateType)
				#if($inum > $rowint)
					
					${comma}  {name: pre+i18nStr.${member.name},field:${inum}, width: 8,headerStyles:mystyle}
					#set ($comma = ", ")
				#end
					#set ($inum= $inum + 1)
			  #else
				#if($inum > $rowint)
					
					${comma}  {name: pre+i18nStr.$member.name, field: ${inum},width: 10,headerStyles:mystyle}
					#set ($comma = ", ")
				#end
					#set ($inum= $inum + 1)
			  #end
			  
		#end
#end  

#foreach($member in $manageable.manageableAssociationEnds)//

		#if(!${member.many}) 
			#if($inum > $rowint)
				${comma}  {name: i18nStr.$member.name,field: ${inum},get:function(inRowIndex){ var str='';if(querydata${manageable.name}[inRowIndex]!=undefined && querydata${manageable.name}[inRowIndex][${inum}]!=undefined){str=querydata${manageable.name}[inRowIndex][${inum}][2];} return str;} ,width: 10,headerStyles:mystyle }
				#set ($comma = ", ")
			#end
			#set ($inum= $inum + 1)
		#else
			#set ($childRow = $inum) 
			#set ($inum= $inum + 1)
		#end
#end                        
					]]}];	 
	return  myLayout;
}

#else
//$totleinum>20
var mainLayout =[{//?????????colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: i18nStr.detail, width: 3, get: getCheck${manageable.name}, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
#set ($comma = "")
#set ($inum = 2)                       
#foreach($member in $manageable.manageableAttributes)
	#if ($inum<=9)
		#if ($member.name != ${manageable.manageableIdentifier.name})
		  #if ($member.type.fullyQualifiedName == 'double' || $member.type.fullyQualifiedName == 'long')
				 ${comma} {name: i18nStr.$member.name,field:${inum}, width: 8}
				#set ($inum= $inum + 1)
		  #elseif ($member.type.dateType)
				${comma}  {name: i18nStr.${member.name},field:${inum}, width: 8}
				#set ($inum= $inum + 1)
		  #else
				${comma}  {name: i18nStr.$member.name, field: ${inum},width: 10}
				#set ($inum= $inum + 1)
		  #end
		  #set ($comma = ", ")
		#end
	#end
#end  

#foreach($member in $manageable.manageableAssociationEnds)//
	#if ($inum<=9)
		#if(!${member.many})                                             
			 ${comma}  {name: i18nStr.$member.name,field: ${inum},get:function(inRowIndex){ var str='';if(querydata${manageable.name}[inRowIndex]!=undefined && querydata${manageable.name}[inRowIndex][${inum}]!=undefined){str=querydata${manageable.name}[inRowIndex][${inum}][2];} return str;} ,width: 10 }
			#set ($comma = ", ")
			#set ($inum= $inum + 1)
		#else
			#set ($childRow = $inum) 
			#set ($inum= $inum + 1)
		#end
	#end
#end    

                  
					],[
							{ name: '\u8be6\u7ec6', colSpan: 11,styles: 'padding: 0; margin: 0;', get: getDetail${manageable.name} }//value: '<div style="height:0px; background-color: white;"></div>'
						  ]
				  ]
	  
				}];	 

var subInt=	$childRow;	
function buildMainDetailLayout(pre,mystyle){
var myLayout=[{noscroll: true,
					 cells: [
                      [
#set ($comma = "")
#set ($inum = 2)     



#foreach($member in $manageable.manageableAttributes)
	#if ($inum>9 && $inum<=20)
		#if ($member.name != ${manageable.manageableIdentifier.name})
		  #if ($member.type.fullyQualifiedName == 'double' || $member.type.fullyQualifiedName == 'long')
				 ${comma} {name: i18nStr.$member.name,field:${inum}, width: 8}
				#set ($inum= $inum + 1)
		  #elseif ($member.type.dateType)
				${comma}  {name: i18nStr.${member.name},field:${inum}, width: 8}
				#set ($inum= $inum + 1)
		  #else
				${comma}  {name: i18nStr.$member.name, field: ${inum},width: 10}
				#set ($inum= $inum + 1)
		  #end
		  #set ($comma = ", ")
		#end
	#end
#end  

#foreach($member in $manageable.manageableAssociationEnds)//
	#if ($inum>9 && $inum<=20)
		#if(!${member.many})                                             
			 ${comma}  {name: i18nStr.$member.name,field: ${inum},get:function(inRowIndex){ var str='';if(querydata${manageable.name}[inRowIndex]!=undefined && querydata${manageable.name}[inRowIndex][${inum}]!=undefined){str=querydata${manageable.name}[inRowIndex][${inum}][2];} return str;} ,width: 10 }
			#set ($comma = ", ")
			#set ($inum= $inum + 1)
		#else
			#set ($childRow = $inum) 
			#set ($inum= $inum + 1)
		#end
	#end
#end    
  ],[                
#foreach($member in $manageable.manageableAttributes)
		#if ($member.name != ${manageable.manageableIdentifier.name})
			  #if ($member.type.fullyQualifiedName == 'double' || $member.type.fullyQualifiedName == 'long')
				#if($inum >20)    
					//#set ($comma = ", ")				
					 ${comma} {name: pre+i18nStr.$member.name,field:${inum}, width: 8,headerStyles:mystyle}
				#end
					#set ($inum= $inum + 1)
			  #elseif ($member.type.dateType)
				#if($inum > 20)
					#set ($comma = ", ")
					${comma}  {name: pre+i18nStr.${member.name},field:${inum}, width: 8,headerStyles:mystyle}
				#end
					#set ($inum= $inum + 1)
			  #else
				#if($inum > 20)
					#set ($comma = ", ")
					${comma}  {name: pre+i18nStr.$member.name, field: ${inum},width: 10,headerStyles:mystyle}
				#end
					#set ($inum= $inum + 1)
			  #end
			  
		#end
#end  

#foreach($member in $manageable.manageableAssociationEnds)//

		#if(!${member.many}) 
			#if($inum > 20)
			 ${comma}  {name: i18nStr.$member.name,field: ${inum},get:function(inRowIndex){ var str='';if(querydata${manageable.name}[inRowIndex]!=undefined && querydata${manageable.name}[inRowIndex][${inum}]!=undefined){str=querydata${manageable.name}[inRowIndex][${inum}][2];} return str;} ,width: 10,headerStyles:mystyle }
			#set ($comma = ", ")
			#end
			#set ($inum= $inum + 1)
		#else
			#set ($childRow = $inum) 
			#set ($inum= $inum + 1)
		#end
#end                        
					]]}];	 
	return  myLayout;
}
#end
var mainDetailLayout;
var mainDetailLayoutOdd;
mainDetailLayout= buildMainDetailLayout(pre,headerstyle);
mainDetailLayoutOdd=buildMainDetailLayout(pre,headerstyleodd);

function getDetail${manageable.name}(inRowIndex){
		var cell = this;
		setTimeout(function() { buildSubgrid${manageable.name}(inRowIndex, cell); }, 0);
		var h =0;
		if(detailRows${manageable.name}[inRowIndex]&&querydata${manageable.name}[inRowIndex][$childRow].length>0){
							h=65+25*querydata${manageable.name}[inRowIndex][$childRow].length;  		}
	return '<div style="height:45px; background-color: white;"></div><div style="height:'+h+'px; background-color: white;"></div>';
}

#end//end buildLayout