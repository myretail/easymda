function querybutton(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //${manageable.name}queryvo.id=0 ;
              ${manageable.name}queryvo=new ${manageable.name}VOJs();
#foreach($member in $manageable.manageableAttributes)
#if ($member.name != ${manageable.manageableIdentifier.name})
#if ($member.type.fullyQualifiedName == 'double' || $member.type.fullyQualifiedName == 'long')
              n=queryNumber_fun("${manageable.name}${member.name}");
              if(n==null){validstate=1;}else if(n.upSign!="%"){${manageable.name}queryvo.${member.name}=n;}  
#elseif ($member.type.fullyQualifiedName == 'java.util.Calendar'||$member.type.fullyQualifiedName == 'java.util.Date')   
              d=queryDate_fun("${manageable.name}${member.name}");
              if(d==null){validstate=1;}else if(d.upSign!="%"){${manageable.name}queryvo.${member.name}=d;}
#else
	          if(query${manageable.name}${member.name}.getDisplayedValue()!="")${manageable.name}queryvo.${member.name}=query${manageable.name}${member.name}.getDisplayedValue();//
#end
#end
#end
			
#foreach($member in $manageable.manageableAssociationEnds)
	if(query${manageable.name}${member.name}.getDisplayedValue()!=""){
				var ${manageable.name}${member.name}Query= new ${member.type.name}VOJs();
				//${manageable.name}${member.name}Query.${manageable.name}Name=query${manageable.name}${member.name}.getDisplayedValue();
				${manageable.name}${member.name}Query.id=query${manageable.name}${member.name}.getValue();
				${manageable.name}queryvo.${member.name}=${manageable.name}${member.name}Query;
			  }
#end

			if(validstate==0){
              pagenumber=1;
              getVO(${manageable.name}queryvo,pagenumber,pagesize,'0'); 
              //if(totalpage>1){dijit.byId("but7").setDisabled(false);}else{dijit.byId("but7").setDisabled(true);} 
             }      
       }


 

     
     	<div id="queryDiv" style="margin-right: 0px;  height: 460px; display:none;" >
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
#set ($inum =1 ) 
#set ($thirtype="")
#foreach($member in $manageable.manageableAttributes)
#if ($member.name != ${manageable.manageableIdentifier.name})
#if ($inum==1)
	#set ($firsttype="")
	#set ($sectype="")
	#set ($thirtype="")
	#set ($inum=2) 
                <tr>
	#if ($member.type.fullyQualifiedName == 'double' || $member.type.fullyQualifiedName == 'long')
			<td align="right" i18n="${member.name}" >${manageable.name}${member.name}:</td>
			<td align="left"  >
							<span id="query${manageable.name}${member.name}Img0"  ><input type="text" class="editerNumber"   jsId="query${manageable.name}${member.name}"  id="query${manageable.name}${member.name}"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="query${manageable.name}${member.name}Img1" style="{display:none}" ><input type="text"  class="editerNumberSmall" jsId="query${manageable.name}${member.name}1"  id="query${manageable.name}${member.name}1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="query${manageable.name}${member.name}Imgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="query${manageable.name}${member.name}Imgdown" >></span>
							<span id="query${manageable.name}${member.name}Img2div" style="{display:none}"> <input type="text"  class="editerNumberSmall"  jsId="query${manageable.name}${member.name}2"  id="query${manageable.name}${member.name}2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="query${manageable.name}${member.name}Img" style="vertical-align:middle;margin-top:0px;">
							
						</td>
		#set ($firsttype="double")          
	#elseif ($member.type.dateType)
						<td align="right" i18n="${member.name}"  >${manageable.name}${member.name}:</td> 
						<td align="left"  colspan="3"><span id="query${manageable.name}${member.name}Img0"  ><input class="editerDate"   jsId="query${manageable.name}${member.name}" id="query${manageable.name}${member.name}"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="query${manageable.name}${member.name}Time" id="query${manageable.name}${member.name}Time" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="query${manageable.name}${member.name}Img1" style="{display:none}" ><input class="editerDateSmaller"   jsId="query1${manageable.name}${member.name}" id="query1${manageable.name}${member.name}"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query1${manageable.name}${member.name}Time" id="query1${manageable.name}${member.name}Time" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="query${manageable.name}${member.name}Imgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="query${manageable.name}${member.name}Imgdown" >></span>
							<span id="query${manageable.name}${member.name}Img2div" style="{display:none}"><input class="editerDateSmaller"   jsId="query2${manageable.name}${member.name}" id="query2${manageable.name}${member.name}"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query2${manageable.name}${member.name}Time" id="query2${manageable.name}${member.name}Time" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="query${manageable.name}${member.name}Img" style="vertical-align:middle;margin-top:0px;">
						</td>
		#set ($firsttype="date") 
	#else
						<td align="right" i18n="${member.name}" >${manageable.name}${member.name}:</td>
						<td align="left"  >
						
							#if ($member.type.fullyQualifiedName=='com.logistics.entity.order.StringEnum')
							<input  id="query${manageable.name}${member.name}"  jsId="query${manageable.name}${member.name}" class="editerInput"  dojoType="dijit.form.FilteringSelect" store="${manageable.name}${member.name}Store" />
							#else
								<input type="text" class="editerInput"  id="query${manageable.name}${member.name}"  jsId="query${manageable.name}${member.name}"   dojoType="dijit.form.TextBox"  />
							#end
						</td>
		#set ($firsttype="str") 
	#end
#elseif ($inum==2)
	#set ($inum=3) 
	#if ($member.type.fullyQualifiedName == 'double' || $member.type.fullyQualifiedName == 'long')
		#if ($firsttype=='double')
							<td align="right" i18n="${member.name}" >${manageable.name}${member.name}:</td>
							<td align="left" colspan="3" >
								<span id="query${manageable.name}${member.name}Img0"  ><input type="text" class="editerNumber" jsId="query${manageable.name}${member.name}"  id="query${manageable.name}${member.name}"  dojoType="mydojo.NumberTextBox"  /></span>
								<span id="query${manageable.name}${member.name}Img1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="query${manageable.name}${member.name}1"  id="query${manageable.name}${member.name}1"  dojoType="mydojo.NumberTextBox"  /></span>
								<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="query${manageable.name}${member.name}Imgup">></span>
								<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="query${manageable.name}${member.name}Imgdown" >></span>
								<span id="query${manageable.name}${member.name}Img2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="query${manageable.name}${member.name}2"  id="query${manageable.name}${member.name}2"  dojoType="mydojo.NumberTextBox"  /></span>
								<img src="../image/start.gif" onclick="queryType(this);" id="query${manageable.name}${member.name}Img" style="vertical-align:middle;margin-top:0px;">
							</td>  
			#set ($sectype="str")
		#end
		#if ($firsttype=='date')
							<td align="right" colspan="2" > </td>
							<td align="right" i18n="${member.name}" >${manageable.name}${member.name}:</td>
							<td align="left"  >
								<span id="query${manageable.name}${member.name}Img0"  ><input type="text" class="editerNumber" jsId="query${manageable.name}${member.name}"  id="query${manageable.name}${member.name}"  dojoType="mydojo.NumberTextBox"  /></span>
								<span id="query${manageable.name}${member.name}Img1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="query${manageable.name}${member.name}1"  id="query${manageable.name}${member.name}1"  dojoType="mydojo.NumberTextBox"  /></span>
								<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="query${manageable.name}${member.name}Imgup">></span>
								<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="query${manageable.name}${member.name}Imgdown" >></span>
								<span id="query${manageable.name}${member.name}Img2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="query${manageable.name}${member.name}2"  id="query${manageable.name}${member.name}2"  dojoType="mydojo.NumberTextBox"  /></span>
								<img src="../image/start.gif" onclick="queryType(this);" id="query${manageable.name}${member.name}Img" style="vertical-align:middle;margin-top:0px;">
							</td> 
			#set ($sectype="")
			#set ($inum=1)
		#end                  
		#if ($firsttype=='str')
							<td align="right"  i18n="${member.name}" >${manageable.name}${member.name}:</td>
							<td align="left" colspan="3" >
								<span id="query${manageable.name}${member.name}Img0"  ><input type="text" class="editerNumber" jsId="query${manageable.name}${member.name}"  id="query${manageable.name}${member.name}"  dojoType="mydojo.NumberTextBox"  /></span>
								<span id="query${manageable.name}${member.name}Img1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="query${manageable.name}${member.name}1"  id="query${manageable.name}${member.name}1"  dojoType="mydojo.NumberTextBox"  /></span>
								<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="query${manageable.name}${member.name}Imgup">></span>
								<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="query${manageable.name}${member.name}Imgdown" >></span>
								<span id="query${manageable.name}${member.name}Img2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="query${manageable.name}${member.name}2"  id="query${manageable.name}${member.name}2"  dojoType="mydojo.NumberTextBox"  /></span>
								<img src="../image/start.gif" onclick="queryType(this);" id="query${manageable.name}${member.name}Img" style="vertical-align:middle;margin-top:0px;">
							</td>  
			#set ($sectype="str")
		#end                 
	#elseif ($member.type.dateType)
		#if ($firsttype=='double')
						<td align="right"  i18n="${member.name}" >${manageable.name}${member.name}:</td>
						<td align="left"  colspan="5"><span id="query${manageable.name}${member.name}Img0"  ><input class="editerDate"   jsId="query${manageable.name}${member.name}" id="query${manageable.name}${member.name}"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="query${manageable.name}${member.name}Time" id="query${manageable.name}${member.name}Time" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="query${manageable.name}${member.name}Img1" style="{display:none}" ><input class="editerDateSmall"   jsId="query1${manageable.name}${member.name}" id="query1${manageable.name}${member.name}"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmall" jsId="query1${manageable.name}${member.name}Time" id="query1${manageable.name}${member.name}Time" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="query${manageable.name}${member.name}Imgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="query${manageable.name}${member.name}Imgdown" >></span>
							<span id="query${manageable.name}${member.name}Img2div" style="{display:none}"><input class="editerDateSmall"   jsId="query2${manageable.name}${member.name}" id="query2${manageable.name}${member.name}"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmall" jsId="query2${manageable.name}${member.name}Time" id="query2${manageable.name}${member.name}Time" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="query${manageable.name}${member.name}Img" style="vertical-align:middle;margin-top:0px;">
						</td>
			#set ($sectype="")
			#set ($inum=1)
		#end
		#if ($firsttype=='date')
						<td align="right"  i18n="${member.name}" >${manageable.name}${member.name}:</td>
						<td align="left"  colspan="3" ><span id="query${manageable.name}${member.name}Img0"  ><input class="editerDate"   jsId="query${manageable.name}${member.name}" id="query${manageable.name}${member.name}"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="query${manageable.name}${member.name}Time" id="query${manageable.name}${member.name}Time" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="query${manageable.name}${member.name}Img1" style="{display:none}" ><input class="editerDateSmaller"   jsId="query1${manageable.name}${member.name}" id="query1${manageable.name}${member.name}"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query1${manageable.name}${member.name}Time" id="query1${manageable.name}${member.name}Time" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="query${manageable.name}${member.name}Imgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="query${manageable.name}${member.name}Imgdown" >></span>
							<span id="query${manageable.name}${member.name}Img2div" style="{display:none}">
							<input class="editerDateSmaller"   jsId="query2${manageable.name}${member.name}" id="query2${manageable.name}${member.name}"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query2${manageable.name}${member.name}Time" id="query2${manageable.name}${member.name}Time" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="query${manageable.name}${member.name}Img" style="vertical-align:middle;margin-top:0px;">
						</td> </tr><!--new modify-->
			#set ($sectype="")
			#set ($inum=1)
		#end                  
	#if ($firsttype=='str')
						<td align="right"  i18n="${member.name}" >${manageable.name}${member.name}:</td>
						<td align="left"   colspan="5"><span id="query${manageable.name}${member.name}Img0"  ><input class="editerDate"   jsId="query${manageable.name}${member.name}" id="query${manageable.name}${member.name}"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="query${manageable.name}${member.name}Time" id="query${manageable.name}${member.name}Time" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="query${manageable.name}${member.name}Img1" style="{display:none}" ><input class="editerDateSmall"   jsId="query1${manageable.name}${member.name}" id="query1${manageable.name}${member.name}"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmall" jsId="query1${manageable.name}${member.name}Time" id="query1${manageable.name}${member.name}Time" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="query${manageable.name}${member.name}Imgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="query${manageable.name}${member.name}Imgdown" >></span>
							<span id="query${manageable.name}${member.name}Img2div" style="{display:none}"><input class="editerDateSmall"   jsId="query2${manageable.name}${member.name}" id="query2${manageable.name}${member.name}"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmall" jsId="query2${manageable.name}${member.name}Time" id="query2${manageable.name}${member.name}Time" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="query${manageable.name}${member.name}Img" style="vertical-align:middle;margin-top:0px;">
						</td></tr>
	#set ($sectype="")
	#set ($inum=1)
	#end 
#else
	#if ($firsttype=='double')
						<td align="right"  i18n="${member.name}" >${manageable.name}${member.name}:</td>
						<td align="left" colspan="3" >
						#if ($member.type.fullyQualifiedName=='com.logistics.entity.order.StringEnum')
							<input  id="query${manageable.name}${member.name}" jsId="query${manageable.name}${member.name}" class="editerInput"  dojoType="dijit.form.FilteringSelect" store="${manageable.name}${member.name}Store" />
							#else
								<input type="text" class="editerInput"  id="query${manageable.name}${member.name}"  jsId="query${manageable.name}${member.name}"   dojoType="dijit.form.TextBox"  />
							#end
						</td>  
	#set ($sectype="str")
	#end
	#if ($firsttype=='date')
						<td align="right" colspan="2" ></td>
						<td align="right"  i18n="${member.name}" >${manageable.name}${member.name}:</td>
						<td align="left"  >
							 #if ($member.type.fullyQualifiedName=='com.logistics.entity.order.StringEnum')
							 <input  id="query${manageable.name}${member.name}" jsId="query${manageable.name}${member.name}" class="editerInput"  dojoType="dijit.form.FilteringSelect" store="${manageable.name}${member.name}Store" />
							#else
								<input type="text" class="editerInput"  id="query${manageable.name}${member.name}"  jsId="query${manageable.name}${member.name}"   dojoType="dijit.form.TextBox"  />  
							#end
						</td></tr>
	#set ($sectype="")
	#set ($inum=1)
	#end                  
	#if ($firsttype=='str')
						<td align="right"  i18n="${member.name}" >${manageable.name}${member.name}:</td>
						<td align="left"  colspan="3" >
						#if ($member.type.fullyQualifiedName=='com.logistics.entity.order.StringEnum')
						<input  id="query${manageable.name}${member.name}" jsId="query${manageable.name}${member.name}" class="editerInput"  dojoType="dijit.form.FilteringSelect" store="${manageable.name}${member.name}Store" />
						#else
							<input type="text" class="editerInput"  id="query${manageable.name}${member.name}"  jsId="query${manageable.name}${member.name}"   dojoType="dijit.form.TextBox"  />
						#end
						</td>  
	#set ($sectype="str")
	#end 
	#end
#elseif($inum==3)
	#set ($inum=1) 
	#if ($member.type.fullyQualifiedName == 'double' || $member.type.fullyQualifiedName == 'long')
						<td align="right"  i18n="${member.name}" >${manageable.name}${member.name}:</td>
						<td align="left"  >
							<span id="query${manageable.name}${member.name}Img0"  ><input type="text" class="editerNumber" jsId="query${manageable.name}${member.name}"  id="query${manageable.name}${member.name}"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="query${manageable.name}${member.name}Img1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="query${manageable.name}${member.name}1"  id="query${manageable.name}${member.name}1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="query${manageable.name}${member.name}Imgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="query${manageable.name}${member.name}Imgdown" >></span>
							<span id="query${manageable.name}${member.name}Img2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="query${manageable.name}${member.name}2"  id="query${manageable.name}${member.name}2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="query${manageable.name}${member.name}Img" style="vertical-align:middle;margin-top:0px;">
							
						</td>  
		#set ($thirtype="over")
	#elseif ($member.type.dateType)
						<td align="right"  > </td>
						<td align="right"  ></td>
					</tr><tr >
						<td align="right"  i18n="${member.name}" >${manageable.name}${member.name}:</td>
						<td align="left"  colspan="3"><span id="query${manageable.name}${member.name}Img0"  ><input class="editerDate"   jsId="query${manageable.name}${member.name}" id="query${manageable.name}${member.name}"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="query${manageable.name}${member.name}Time" id="query${manageable.name}${member.name}Time" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="query${manageable.name}${member.name}Img1" style="{display:none}" ><input class="editerDateSmaller"   jsId="query1${manageable.name}${member.name}" id="query1${manageable.name}${member.name}"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query1${manageable.name}${member.name}Time" id="query1${manageable.name}${member.name}Time" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="query${manageable.name}${member.name}Imgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="query${manageable.name}${member.name}Imgdown" >></span>
							<span id="query${manageable.name}${member.name}Img2div" style="{display:none}"><input class="editerDateSmaller"   jsId="query2${manageable.name}${member.name}" id="query2${manageable.name}${member.name}"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query2${manageable.name}${member.name}Time" id="query2${manageable.name}${member.name}Time" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="query${manageable.name}${member.name}Img" style="vertical-align:middle;margin-top:0px;">
							
						</td>
		#set ($firsttype="date")
		#set ($inum=2)
	#else            
		#if ($sectype=='str')
						<td align="right"  i18n="${member.name}" >${manageable.name}${member.name}:</td>
						<td align="left"  >
						#if ($member.type.fullyQualifiedName=='com.logistics.entity.order.StringEnum')
							<input  id="query${manageable.name}${member.name}" jsId="query${manageable.name}${member.name}" class="editerInput"  dojoType="dijit.form.FilteringSelect" store="${manageable.name}${member.name}Store" />
						#else
							<input type="text" class="editerInput"  id="query${manageable.name}${member.name}"  jsId="query${manageable.name}${member.name}"   dojoType="dijit.form.TextBox"  />
						#end
						</td>  
		#set ($thirtype="over")
		#end       
	#end
	#if ($thirtype=="over"||$inum==1)        
				  </tr>
	#end      
	#end
	#end                       
#end

#if ($thirtype!="over" && $inum!=1)     
    </tr>
#end 
//-------------------------------------------新加入的：当字段为引用其他表的记录（主表、子表箭尾）    有set function
#set ($inume =1) 
#foreach($member in $manageable.manageableAssociationEnds)
	#if($inume ==1)
					<tr><td align="right"  i18n="${member.name}"  ></td>
					<td align="left" ><input  id="query${manageable.name}${member.name}"  jsId="query${manageable.name}${member.name}" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="${manageable.name}${member.name}Store" onchange="${manageable.name}${member.name}Set(0,arguments[0]);" /></td>  
		#set ($inume =2)
	#elseif ($inume ==2)		
					<td align="right"  i18n="${member.name}"  ></td>
					<td align="left" colspan="3" ><input  id="query${manageable.name}${member.name}"  jsId="query${manageable.name}${member.name}" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="${manageable.name}${member.name}Store" onchange="${manageable.name}${member.name}Set(0,arguments[0]);" /></td>  
		#set ($inume =3)
	#elseif ($inume ==3)		
					<td align="right"  i18n="${member.name}"  ></td>
					<td align="left" ><input  id="query${manageable.name}${member.name}"  jsId="query${manageable.name}${member.name}" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="${manageable.name}${member.name}Store" onchange="${manageable.name}${member.name}Set(0,arguments[0]);" /></td>
					</tr>
		#set ($inume =1)
	#end	
#end
#if ($inume!=1)     
    </tr>
#end 
//---------------------------------------------	


          <tr align="center"><td></td>
           <td colspan="2"><a onclick="querybutton();"><img src="../image/queryIcon.png" height="16" width="16" border="0">OK</a></td>
           <td colspan="3"></td><td colspan="2"></td></tr>
         </table>
	     </div>
	       	<div align="right">
	          	 &nbsp;&nbsp;&nbsp;
	          	     <button dojoType="dijit.form.Button" onclick="querydis();" iconClass="queryIcon" >query</button>
          </div>  
	        <div id="rowCount"></div>
	    <div style="{height:90%;width:100%}"  >
	         <div id="grid"  dojoType="dojox.Grid" autoWidth="false"  jsId="grid"	model="model"  structure="querylayoutfield" singleClickEdit="true" ></div>
      </div>      
      <div align="right" ><span id="rowCount"></span>
        <button dojoType="dijit.form.myButton" onclick="upPage();"  id="but6" disabled='true' jsId="but6" iconClass="upPageIcon" >pageup</button><!--span dojoType="dijit.Tooltip" connectId="but6">pageup</span-->
        <button dojoType="dijit.form.myButton" onclick="downPage();" id="but7" disabled='true' jsId="but7" iconClass="downPageIcon" >pagedown</button><!--span dojoType="dijit.Tooltip" connectId="but7">pagedown</span-->
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
     </div> 
</body></html>	
