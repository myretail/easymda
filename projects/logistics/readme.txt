	  
//��һ֡	 ���� @@@@�򵥵�˵�����׹��ߵĹ��ܾ��ǣ��û�ֻҪͨ��umlͼ�����ʵ������ƣ������ݿ���ƣ��������£������дһ�д��룬���ɵõ�һ������������ȫ�桢�ȶ���ԭ��ϵͳ�����ԭ��ϵͳ���õļܹ��ǣ������Ϊhibernate��spring��webService���ͻ��˲��õ���dojo��
	  
@@@@����������ʾһ�£��û���Ҫ��ʲô���͹���ʵ�ֵ�ԭ��ϵͳ��ʲô���ġ�

@@@@�û���Ҫ����ֻ�ǻ�һ���ǳ��򵥵�umlͼ������ǿ�ҵ��Ƽ�argouml-0.28����Ϊ��������������˫�����ͼ�꣬�򿪹��ߣ�

//�ڶ�֡
���ǿ����Ľ��������һ��������������ڵ��������δ�����ģ�ͣ����ȸ����ģ��ȡһ�����֣��������ｫ������Ϊdemo��

Ȼ�����Լ��������������Ȼ���½�һ����ͼ���������ǿ��Կ�ʼ�����ﻭentity�ࡣ

�������ǿ�һ��������umlͼ����ͼ�пɿ���Prod��
prodCust��principal������������⣬contact(��ͬ)
��Ҳ��һ��customer���

������Ѿ���ɵ�ͼ�����ǻ�����entity��������Entity��Manageable�����Ĺ����ͣ�����һЩ��������ʵͼ�л���δ��ʾ��ValueObject�ࡢWebService��ȣ���Щ���ݲ����û�ȥ�������߻������ɴ����ʱ�򣬵����Զ���



����Ҫ��һ������������Ʒ��Ϣ���࣬����Ӧ���ݿ��еĲ�Ʒ��Ϣ������ΪProd��������new class��ť��Ȼ�������������Ŀհ״������������Ȼ�����ǿ�ҳ���·������������Ķ�����档��������Prod������Ҫ��һ���������ҵ������������ǻ�Ҫ����һ��customer��entity�ࡣ��������������Ǽ�ͷ��������������������orga��people�����������������������Ѿ���Ҫ�Ľ�������λ�ͼ������Ҫע��ĵط������濴һ������Ѿ����õ�ͼ��ͼ���С�����������ͼ����ʾ����Щ�����⣬�������������ǻ����Կ���һЩValueObject�࣬��ʵÿһ��ʵ�����ڶ�Ҫ��ӦVO��WEbService����Щ���ԡ����������������ɴ���ʱ���������Զ����argouml������Զ������ȥ�ġ�����Ҫ�û�ȥ�����������������������û����õ�ͼ����������

@@@@��������ʾһ�¸������ͼ������������һ��������ԭ��ϵͳ��������������뵼��ҳ�棬������ĵ�һ��ڵ���ʾ��ϵͳ�а����ı�չ����ڵ㣬��ʾ�������������������˵�ҳ�棡ҳ��������ࣺά������Ͳ�ѯ���档
@@@@������prodΪ��չʾһ�����ɵ�ҳ�棬�������ǿ�һ���������ɾ���ҳ�棺1.jsp��
@@@@�����ڽ����п�������һ����Ʒ��Ϣ�Ĳ鿴�б���������ز�����ť��������һ���༭��ť����ʾ����ά�����ܽ��档���ά������Ĳ����ǰ���ÿ��3���ֶεĹ��������滹�а���ÿ�������ֶ������ҳ�棬�û��ɸ��ݾ�������ѡ����ϵͳ��ʹ���Ǹ���
@@@@���������ǿ�������������һ����Ʒ��Ϣ�������ǲ�Ʒ���ƣ����Ǹ��ǿ��ֶΣ��������û����д���ֵ�Ļ���ϵͳ��������ʾ����Ϊ�գ���ʵ�����������֤������¼��ͬʱ���ġ�
@@@@���濴�۸�����������͵����룬���������ʱ��ϵͳ�����ϸ�����ʾ����������֤��������
@@@@Ȼ����ʱ�����͵��ֶΣ�����ѡ��Ҳ���Լ������룬��������һ�������ڵ�����2009-6-31��Ҳ���������жϡ�
@@@@�ٿ����������������������Ѿ�Ĭ�ϼ��������еļ�¼�������޸ļ�������������������ǲ�Ʒ���������������������󣬵㱣�水ť�����Կ���������б���Ҳ������������¼��

@@@@���������޸�һ����¼ʱ��˫��������¼��������ά��������ʾ���޸ĺ󱣴漴�ɡ���ɾ���д��󣡣���������������

@@@@��������һ�²�ѯ���ܣ������ѯ������ť����ʾ��һ�������ѯ�����Ľ��棬���������ṩ����һ���Ƚ�ȫ����������幦�ܣ�
@@@@��ͨ���ַ��ǰ�likeΪ�����ģ������Ǽ��ɵ���һ��ֵ��Ҳ�����Ǹ�ֵ�ķ�Χ���Ƿ���Ⱥ�Ҳ��ѡ����������������		
@@@@����Ĳ�ѯ�����ɴ���������ѡ��Ҳ���� ���������ť���������Ĳ�ѯ��������������������һ��6���õ��ľ��������������ư���6�Ĳ�Ʒ���б�

@@@@���ҳ�浽����ٿ�һ����������ɾ���ҳ������ӣ�2.jsp���������Ӱ�ť���������ѡ��Ա�����������ڷŴ󣩣������޸�����д�ļ�¼��ȥ���۸�price������
������޸Ĺ��ܶ�����������ֶεģ����û���Ҫ����һ���Բ����ֶ��޸ĵĽ���ʱ��ֻ����ҳ��Դ����ע����Ӧ���ֶμ��ɡ����ھٸ����ӣ�

@@@@������һ����ɾ���ҳ������ӣ�9.jsp�����ҳ����ϲ�����ǰһ��ҳ�����Ƶı༭�б�������ʾ�˲�Ʒ��Ϣ�����������������Ϣ���۱����Ա��Ϣ���б��û�������������¼ǰѡ��������ֶΣ�Ȼ���ٵ������Ӱ�ť��
������ֵ���Ѿ�����ˡ�Ȼ����Լ�������������¼�롣

@@@@����������һ����ɾ���ҳ������ӣ�6.jsp�����ȿ���������Աpeople�ļ�¼�б�����ʵ����������һ�����棬���+�ɴ򿪣�������������е���peopleΪ����ı��ά�����ܡ�����һ�������people��¼������ͻ���ʾ����ѡ��people��Ӧ�Ĳ�Ʒ��Ϣ��������ά���ļ�¼��Ҳ�����������б�����ѡ��people�Ĳ�Ʒ��Ϣ��

@@@@����������һ����ɾ���ҳ������ӣ�3.jsp�����ȿ���������������customer�ļ�¼�б�������ʾ������ѡ��customerΪ����Ĳ�Ʒ��Ϣ��������ά���ļ�¼��Ҳ��������ѡ��customer�Ĳ�Ʒ��Ϣ������һ����
@@@@���������ǻ�������ʾһ���⼸����ť�Ĺ��ܣ���ҳ����ҳ��ÿҳ��ʾ��¼��������

@@@@�ٿ���һ��4��jsp�����ҳ��Ĺ�������һ����ȫһ����ֻ�ǲ��ֲ�ͬ��

@@@@�ٿ���һ��5��jsp�����ҳ��Ҳ�ǹ�������һ����ȫһ����ֻ�ǲ��ֲ�ͬ�������ҳ��Ͳ�һһ��ϸ�����ˣ��Ӿٵ���Щ���ӿ��Կ����������ҳ����Щ�ǹ�����ͬ�������ֲ�ͬ������ղſ����⼸��ҳ�棻��Щ�ǹ�����Щ�ģ��������ҳ�棬�����ֿܷ��Ļ������Ա��ֳ�����ҳ�棬������������ֻ������ز�Ʒ��Ϣ�ģ�ֻ������ͬ��Ϣ�ģ��ȵȡ���ȻҲ����һЩ������ʵ�ַ�ʽ�����������벻���ġ�������ߵ�Ŀ�ľ������û�ֻ���������ṩ����Щҳ����ѡ�����ã�������ȥ��ͷ��ʼ��ơ����룻�ù�����ͨ�������Щ����ģ����������������Ľ����п��ܵ�ʵ�ַ�ʽ������������Ҳ����˵ѧϰ�ġ���ѡ�Ĺ����ɹ���������

@@@@@
�������ڿ�һ�Զ���������ӣ��ȼ򵥽���һ����λ�һ�Զ�Ĺ�ϵ:
orderd�Ƕ�����Ϣ��������һ��Customer���ͻ����������
orderRowd�Ƕ���������Ϣ���ӱ���һ��Prod����Ʒ��Ϣ���������

���ڻ�һ�Զ�Ĺ�ϵ��
�ȵ�����(New Association)��ť��Ȼ���orderRowd��ʼ������orderd
����,�ֱ�������ӱ������AssociationEnd�������ƣ����޸��ӱ�һ��
��multiplicity����Ϊ0..*


@@@@@����Ϊorderd��orderRowdͬ��������������������˵�prod�Ľ��棬������ʾ�����Ǵ�������һ����ɾ��õ�ҳ�濪ʼ��orderd10.jsp
@@@@@���Կ��������Ѿ�����һ����¼��˫������ʾ����ά�����棬�޸����ݺ󱣴��б�Ҳ�õ�ͬ�����������Ӱ�ť��������һ���հ׼�¼����д��Ϻ󱣴档�б���Ҳ���Զ������ӣ�
�����༭��ť�������˱༭���򣬵��+�ţ�չ���۱��¼����һ���Ƕ�������ϸ���ݣ���Ϊ���������ݽ϶࣬һ���޷���ʾ��ȫ����������޸�ĳ���ֶδ���ϸ�е�Ĭ����ʾ�У�Ҳֻ����ҳ��ԭ�������ƶ�һ�¼��ɡ�
��������������ť��ʵ��ȫ���޿����۵��Ĺ��ܡ�


����Ϊorderd��orderRowdͬ������������������ܵ�prod��ҳ�棬
������ʾ�����Ǵ�������һ����ɾ��ĵ�ҳ�濪ʼ��
���Կ������еĶ�����¼��˫������ʾά�����棬�޸����ݺ󡰱��桱���б�Ҳ�õ�ͬ�����������Ӱ�ť��������һ���հ׼�¼����д��Ϻ󱣴档�б���Ҳ���Զ������ӣ�
�����༭��ť�������˱༭���򣬵��+�ţ�չ���۱��¼����һ���Ƕ�������ϸ���ݣ���Ϊ���������ݽ϶࣬һ���޷���ʾ��ȫ����������޸�ĳ���ֶδ���ϸ�е�Ĭ����ʾ�У�Ҳֻ����ҳ��ԭ�������ƶ�һ�¼��ɡ�
��������������ť��ʵ��ȫ���޿����۵��Ĺ��ܡ�



@@@@@�ٿ����12.jsp������order���ֶ��޷���һ����ʾ������������Ĭ�Ͻ����ֳ�����������ʾ���������ֶ���������ż���ģ����ԣ������������������������޸�һ�¡��������ٿ����������order���ֶαȽ϶࣬��һ����ʾ̫��������������Ĭ�Ͻ����Ƿֳ�����������ʾ

չ����ʾ�˶����������ϸ��¼
@@@@@����add��ť��������һ��orderd�Ŀհ׼�¼�����+�ţ�������һ��orderRowd�հ׼�¼����һ����

@@@@@6.jsp 
���濴�����ҳ�棬������ʾ�˶���orderd��������ͻ���customer�����б�
�²������ش�����ʾ��orderd�����ӱ�orderRowd����ɾ�Ľ��档���幦�ܺ�ǰ
�������

@@@@@�ڿ���������ӣ�13.jsp��
����Ľ���ֱ��������������ͻ���Ϣcustomer�����б���ӱ���������Ʒ��Ϣ�����б�
������ǰ���ֱ�ѡ�����������Ĭ�ϵĹ����������Ҫ����Ʒ�۸����Ϣ���뵽������¼�еĻ���
ֱ����ҳ������һ����С�ĸĶ����ɣ��������ֳ������޸���ʾ���Ἧ�зŵ���ר�ŵ���ʾ�ļ��С�

��ѯ�������ǲ�����ʾ�������ˣ����Ǵ�����ά��ҳ���Ӧ��ֻ��ȥ����ά�����ܡ�///////////////////////@@@@@��������ѯ�ģ�queryorderd1.jsp��queryorderd11.jsp��

@@@@@�ڿ���������ӣ�orderRowd3.jsp�������������ά�����棬�������ӱ��ά�����棬���������һ�Զ�ά�������ˡ�
�ٿ���������ӣ������������ά�����棬������
�ӱ��ά�����棬���������һ�Զ�ά��������

@@@@@���һ�����ҳ��ɣ�orderRowd9.jsp���������ӱ��ά�����棬�����������б���ӱ������б�������ǰ��ѡ��ã�������д�ö����


@@@@@
�����ʾ��Զ�����ṹ�������ͬ���Ȼ�ͼ��ʵ�ֶ�Զ�Ĺ�ϵ��
����ķ������ǽ���һ����ϵ����ϵ���г���������ֻ��������
�����ֱ����õ��Ƕ�Զ��������������û�����������ԡ��磬
����������Ϣ��orga������Ա��Ϣ��peoples���������������
���Ϊ��Զࡣ������������������ͽṹ�������Ҫ��orga����
һ��parentId���ֶΡ�

@@@@@������������Զ�Ĺ�������������ʵ�ֵ�

@@@@@�����ٿ�һ��orga��ҳ�棬orga5��jsp 
������漴�����˻�����ά�����ܣ�Ҳ�����˻�������Ա�Ĺ�ϵ��ά�����ܡ�
���������ʾ����Ա�б������˻�����ά�����ܣ�Ҳ�����ˣ���������Ա�Ĺ�ϵ��ά�����ܡ�
@@@@@�ڿ�����������Ա�Ĺ�ϵ��ά�����ܣ�����������棬��ʾ�������е���Ա������ѡ�еļ�¼��������ģ����ǿ���ֱ���޸ġ�

@@@@@crudOrgaPeoples_6��
���ҳ��������ʾ���Ƕ�Զ��е�һ��������people��������ʾ�Ķ�Ӧ��Ϣ����orga���
����������棬��ʾ���ǵ�ǰ�Ļ�������û��ѡ�У�˵��û���κι���������ѡ�к󣬱�
�棬�����������������ȡ��ѡ�к󣬱��棬��ɾ�������������

��Ҫ��һ�µ��ǣ�������������ڳ�ʼ����ʱĬ�ϴ����ݿ��ж�ȡ����ڵ���أ��²��
�ڵ㣬���û������ڵ�ʱ���Żᴥ����ȡ�ӽڵ�ķ�������̬���ء����������ڵ�ܶ��
����£�����Ч�������Ч�ʡ�



������/��β


tip://Ĭ�ϲ�ѯ�������޸�
	����
	//order13Ҫ��ͬʱ�޸ļ۸����Ϣ�޸�

Ϊ�˷���˵�����������ɴ���Ĺ�������չʾ�����ݹ�ϵ����������ģ�
�û�ʵ����Ƶ����ݿ�����и��Ӹ��ӵĹ�ϵ������һ������ܼ���һ��
��ı������������ж�Զ�Ĺ�ϵ�ȵȣ���Щ��Ը��ӵĹ�ϵ������ͬ
������������Ӧ�Ĵ��롣����˵˵ҳ���һЩ�������޸ģ��������˽�
dojo���û��Ƿǳ��򵥵ģ�����ǲ���Ϥdojo���û������ǿ���ͬʱ�ṩ
һ�����������ĸ�ʽ�޸ģ������޸Ĳ��裨��������ʱ��Ա���֤��ʾ
�ȵȣ���flash����ʾ�ļ��������������ѵ��
��ѯ��������û����ʾ�����Ǵ�����ά��ҳ���Ӧ��ֻ��ȥ����ά�����ܡ�
��󽲽����ĵ�����

����ļ���ϵͳ��ר�������ʻ�ת���ģ�������
��java�е�properties�ļ��������Ѿ�������ҳ
����������ʾ���ֶ����ƣ���prodName����δ��
������ת�����û�ֻ���������ֱ����������
�ĺ�ϵͳ�����еĶ�Ӧ�ֶξͿ���ʵ��������
ʾ�ˡ�
dangr
û�н���ѯ����������
�޸ĵ�ҳ���� orderd12

Ϊ�˷���˵�����������ɴ���Ĺ�������չʾ�����ݹ�ϵ����������ģ�
�û�ʵ����Ƶ����ݿ�����и��Ӹ��ӵĹ�ϵ������һ������ܼ���һ��
��ı������������ж�Զ�Ĺ�ϵ�ȵȣ���Щ��Ը��ӵĹ�ϵ������ͬ
������������Ӧ�Ĵ��롣

��������ṩ��ҳ�棬������ȫ�����û���Ҫ�����ǿ��Ը����û�����Ҫ
��ģ������޸ģ�Ϊ�����ƴ��롣�����Ҫ���ƵĹ��ܵ�ʵ�ּ�����Ŀǰ
�ṩ����ͬ����ô�����ʱ���Ƿǳ��̵ģ������Ҫ���Ƶ�ʵ�ּ�������
��ǰ��ͬ�ģ����ܹ��ṩ�ֳɵĴ��룬�ɹ��ο���Ҫ����뾭���Ż�������
������ô����Ҳ���ԽϿ��Ϊ����ɶ��ơ�

����˵˵ҳ���һЩ�������޸ģ��������˽�dojo���û��Ƿǳ��򵥵ģ���
���ǲ���Ϥdojo���û������ǿ���ͬʱ�ṩһ�����������ĸ�ʽ�޸ģ�����
�޸Ĳ��裨��������ʱ��Ա���֤��ʾ�ȵȣ���flash����ʾ�ļ���������
�����ѵ��

��ѯ��������û����ʾ�����Ǵ�����ά��ҳ���Ӧ��ֻ��ȥ����ά������

//select  * from orga_peoples ;
// delete  from orga_peoples ;
//select  * from order_Rowd;
//delete  from order_Rowd;
//delete  from orderd;

//delete  from prod;
//delete  from peoples;
//delete  from orga;
//select * from orga;
//select * from contact;
//delete  from contact;

 connecthandleOrder=dojo.connect(dijit.byId("orderPane"), "_afterResize", function(e){
			console.log("_afterResize");
			var hs=dijit.byId("orderPane").domNode.style.height;
			var oh=hs.substring(0,hs.length-2);
			if(oh<orderh){
				if(gridAllVoiture==undefined){
					queryAllVoiture(new WlVoitureTaskVOJs(),1,1,0);
					buildAllVoiture(vth,wid);}else{
					var mainSelTab=dijit.byId("mainSelTab");
					mainSelTab.resize({w:mainSelTab.domNode.parentNode.clientWidth, h: mainSelTab.domNode.parentNode.clientHeight});
					gridAllVoiture.resize({w:mainSelTab.domNode.clientWidth, h: mainSelTab.domNode.clientHeight-36});
				}
			}	   
		}); 	
		connecthandleOrder2=dojo.connect(dijit.byId("orderPane"), "_hideEnd", function(e){
			console.log("_hideEnd");
				if(gridAllTask==undefined){
					queryTask();
				}else{
					gridAllTask.resize({w: gridAllTask.domNode.parentNode.clientWidth, h: gridAllTask.domNode.parentNode.clientHeight-36});
				}
				if(gridAllVoiture==undefined){
					queryAllVoiture(new WlVoitureTaskVOJs(),1,1,0);
					buildAllVoiture(vth,wid);}
				 //dojo.disconnect(connecthandleOrder2);
				 //dojo.disconnect(connecthandleOrder);
		});
  
    A n d r o M D A  -  3.3-SNAPSHOT


    AndroMDA is an open-source MDA framework distributed under the BSD license.
    Go to http://www.andromda.org/ for more information.

    The project located in this directory has been generated by Will Chang
    using the andromdapp:generate Maven plugin.

    You should at least be running Maven 2.0.1 if you want to build your
    project without any Maven-related problems, below is a summary of what has
    been generated and a list of example goals to call from the command line.

    The generated project structure is well-tailored for use in the development
    of J2EE projects. The build process itself makes use of Maven, dependencies
    and often-used goals have been added for your convenience.

    Custom configuration can be done by updating the root pom.xml file.

    /logistics J2EE project
         |
         |    The root of the project contains a few files that control the overall
         |    build process and common properties (in the pom.xml).
         |
         |-- pom.xml
         |        contains information about this project, you may add more information
         |        as long as you do not violate the Maven POM schema, see
         |        http://maven.apache.org/reference/project-descriptor.htmlt
         |
         +-- /mda
         |     |
         |     |    The MDA module is the heart of this project, this is where
         |     |    AndroMDA is configured to generate the files needed to
         |     |    assemble the application
         |     |
         |     +-- pom.xml
         |     |        contains the AndroMDA dependencies and configuration (cartridges, translation-libraries, etc)
         |     +-- /src
         |     |        additional sources such as merge-mappings can be
         |     |        placed here, check out the /main/uml directory, it contains
         |     |        the UML model from which AndroMDA will generate code
         |     +-- /src/main/config/andromda.xml
         |              configures AndroMDA and its components, most
         |              importantly the cartridges which are listed in
         |              their own namespace; global settings are done in the
         |              'default' namespace
         |
         +-- /common
         |     |
         |     |    The COMMON module collects those resources and classes
         |     |    that are shared between the other modules.
         |     |
         |     +-- pom.xml
         |     |        lists common dependencies
         |     +-- /target
         |              shared resources and java classes are generated here,
         |              such as value objects and exceptions
         |
         +-- /core
         |     |
         |     |    The CORE module collects those resources and classes
         |     |    that use the Spring framework, optionally making
         |     |    use of Hibernate and/or EJB under the hood.
         |     |
         |     +-- pom.xml
         |     |        lists Spring dependencies
         |     +-- /src/main/java
         |     |        Spring classes that need manual implementation are
         |     |        generated here, they will not be overwritten upon
         |     |        regeneration; this includes the service, DAO and
         |     |        entity implementations
         |     +-- /target
         |              the Spring resources and classes here will be
         |              overwriten each time AndroMDA generates new code
         |              using the Spring cartridge; this includes both
         |              the Hibernate entities and the correponding
         |              *.hbm.xml mapping files as well as the service
         |              and DAO base classes. You'll also find the DDL
         |              for creating and dropping your schema within this
         |              directory.
         |
         +-- /web
         |     |
         |     |    The WEB module collects those resources and classes
         |     |    that make up the presentation layer.
         |     |
         |     +-- pom.xml
         |     |        lists WebApp dependencies
         |     +-- /src/main/java
         |     |        controller implementations and editable resource bundles
         |     |        will be generated here,
         |     |        you might consider putting your own JSPs here to
         |     |        be copied over the generated ones when bundling the
         |     |        .war file
         |     +-- /target
         |              any Struts classes, JSPs, resource bundles and
         |              configuration files are generated here
         |
         +-- /webservice
         |     |
         |     |    The WEBSERVICE module collects those resources and
         |     |    classes that expose your webservices using the Axis2 framework
         |     |
         |     +-- pom.xml
         |     |        lists any dependencies for webservices
         |     +-- /target
         |              generated files (like the WSDLs, etc) are emitted here
         |
         +-- /app
               |
               |    The APP module collects those resources and classes
               |    that are required to actually build the .ear bundle
               |
               +-- pom.xml
               |        lists dependencies to be bundles into the
               |        root of the .ear
               +-- /src
               |        any custom resources that should be deployed
               |        together with the application
               |        (eg. server deployment descriptors)
               +-- /target
                        a deployable application is bundled here



    In order to succesfully build your project you will need to know
    how to invoke the build process for the existing modules, here's a
    list of examples:

        %> mvn install

            simply builds all modules

        %> mvn -o -f app/pom.xml -Ddeploy

            collects all artifacts and builds a deployable .ear which is then
            deployed

        %> mvn clean

            cleans all generated files from each target directory

        %> mvn install -Ddeploy

            rebuilds the entire application and deploys

        %> mvn install -Denv=prod

            builds the entire application for the production environment, possible 'env' property values
            are 'prod' for production, 'val' for validation and 'dev' for development; not specifying
            any value for this property will build the application for the local configuration
            (more info at http://maven.apache.org/guides/introduction/introduction-to-profiles.html)

        %> mvn -f web/pom.xml andromdapp:undeploy -o

            undeploys the ear from your app server

        %> mvn -N andromdapp:build -Dmodules=core (or mvn -o -f core/pom.xml)

            only build the core module

        %> mvn -N andromdapp:build -Dmodules=web (or mvn -f web/pom.xml)

            only build the web module

        %>  mvn -o -f core/pom.xml andromdapp:schema -Dtasks=create  alter table prod  add column      PRINCIPAL_FK BIGINT  

            generates the DDL create code and subsequently tells the database
            to create the schema for the entities

        %> mvn -o -f core/pom.xml andromdapp:schema -Dtasks=drop

            generates the DDL drop code and subsequently tells the database
            to drop the schema for the entities

        %> mvn -f core/pom.xml andromdapp:schema -Dtasks=drop,create

            generates the drop and create DDL code and subsequently tells the database
            to drop and then create the schema for the entities

        %> mvn -f core/pom.xml andromdapp:schema -Dtasks=update

            attempts to update the database schema with incremental changes, might not work with all JDBC drivers
            see http://www.hibernate.org/hib_docs/v3/reference/en/html_single/#toolsetguide-s1-6

        %> mvn -f core/pom.xml andromdapp:schema -Dtasks=validate

            validates the current Hibernate mappings against the database, you can also use this to simply
            check whether or not the mappings have been properly generated (in case of customizations)

        %> mvn -N andromdapp:build -Dmodules=mda:[andromda:start-server] (or mvn -f mda/pom.xml andromda:start-server)

            starts the AndroMDA server, with this server running you will be able
            to significantly speedup the generation process although it will require
            you to use another console while it is running

        %> mvn -N andromdapp:build -Dmodules=mda:[andromda:stop-server] (or mvn -f mda/pom.xml andromda:stop-server)

            stops the AndroMDA server

        %> mvn -N andromdapp:build -Dmodules=mda (or mvn -f mda/pom.xml)

            runs AndroMDA on your model and thereby generating files in
            the subdirectories of the existing modules
mvn -o -f mda/pom.xml -Dfilter=bpm4struts      mvn -f mda/pom.xml -Dfilter=java,hibernate

mvn -N  org.andromda.maven.plugins:andromdapp-maven-plugin:3.3:build -Dmodules=common,core,web,app  -Ddeploy
	 
     manageable.formBeanName = ${manageable.formBeanName}     
	 
	 manageable.actionParameter = ${manageable.actionParameter}
	 
	  manageable.pageTitleKey  =$manageable.pageTitleKey
	 
	 "manageable.pageFullPath"  = ${manageable.pageFullPath}
	 
	 {manageableFormName}.{manageable.listName} = ${manageableFormName}.${manageable.listName}
	 
	 {tablePresentTest}=${tablePresentTest}
	 
	 {{tablePresentTest}}=${${tablePresentTest}}
	 
	 manageable.actionPath=${manageable.actionPath}
	 
	 manageable.multipartFormData=${manageable.multipartFormData}
	 
	 manageable.referencingManageables=${manageable.referencingManageables}
	 
	 ${member.dateFormat}
	 //begin-----AssociationEnds-------
     #foreach($member in $manageable.AssociationEnds)
		
			{memberMain.name}=${member.name}
			memberMain.type=${member.type}
			memberMain.type.name=${member.type.name}
			memberMain.many=${member.many}
			{member.association}=${member.association}
			{member.association.connection}=${member.association.connection}
			{member.association.connections}=${member.association.connections}
			
	#end
	//end--------AssociationEnds------        
	 //--------referencingManageables-----
	 #foreach ($member in ${manageable.referencingManageables})
		#foreach($memberMain in ${${member.type.name}.manageableAttributes})
			{memberMain.name}=${memberMain.name}
			memberMain.hidden=${memberMain.hidden}
			memberMain.many=${memberMain.many}
		#end
	#end
	 //--------manageableMembers-----b---
	 #foreach ($member in $manageable.manageableMembers)
		{member.name}=${member.name}
		member.hidden=${member.hidden}
		member.many=${member.many}
		
	 #end
	 //begin-----manageableAssociationEnds-------
     #foreach($member in $manageable.manageableAssociationEnds)
		
			{memberMain.name}=${member.name}
			memberMain.hidden=${member.hidden}
			memberMain.many=${member.many}
	#end
	//end--------manageableAssociationEnds------
	  //begin-----222222222222222-------
     #foreach($member in $manageable.referencingManageables)
		
			{memberMain.name}=${member.name}
			memberMain.hidden=${member.hidden}
			memberMain.many=${member.many}
	#end
	//end------222222222222222222222222--------
	 
        %> mvn -N andromdapp:build -Dmodules=mda -Dfilter=java,hibernate (or mvn -f mda/pom.xml -Dfilter=java,bpm4struts,hibernate)

            runs AndroMDA, but this time only using the Java and Hibernate
            cartridges (in that order)

        %> mvn -N andromdapp:build -Dmodules=mda -Dfilter=~java,hibernate (or mvn -f mda/pom.xml -Dfilter=~java,hibernate)

            runs AndroMDA, but this time using all cartridges *except*
            the Java and Hibernate cartridges

        %> mvn -N andromdapp:build -Dmodules=mda,core,web,app -Dfilter=java -Ddeploy
mvn -o -N org.andromda.maven.plugins:andromdapp-maven-plugin:3.3:build -Dmodules=core,web,app -Dfilter=~bpm4struts -Ddeploy
            runs AndroMDA using only the Java cartridge, rebuilds the core
            module and web module and deploys afterwards

        %> mvn -N andromdapp:build -Dconsole
           mvn -o -N org.andromda.maven.plugins:andromdapp-maven-plugin:3.3-SNAPSHOT:build -Dconsole -Ddeploy
            runs the AndroMDApp build goal in 'console' mode, once running, this allows you to execute any goal or subproject
            goal in the manner described above without having to specify the andromdapp:build goal or
            restarting maven (i.e. you can run the mda goal by typing 'mda', build the core module by type 'core', etc).


    Please note that you may use the '-o' flag at any time to avoid
    having Maven downloading any SNAPSHOT dependencies.

    Each module will install its artifact into the local Maven repository,
    this might be a directory looking like this:

        (Windows)
        C:\Documents and Settings${author}\.m2\repository${applicationId}\

        (*nix)
        /home/Will Chang/.m2/repository/logistics/

    For questions or feature requests please use our forum:
    http://forum.andromda.org/


    Good luck!


        -- The AndroMDA Team
mvn -N org.andromda.maven.plugins:andromdapp-maven-plugin:3.3-SNAPSHOT:build -Dconsole -Ddeploy
 1) mvn -o -N org.andromda.maven.plugins:andromdapp-maven-plugin:3.3-SNAPSHOT:build -Dconsole -Ddeploy
  >> core, mda, web, common, exit
 2) mvn -o -f app/pom.xml -Ddeploy //mvn -f app/pom.xml -Ddeploy
	���Ǹ�����ʳ����Ϊ����ְҵ����(��ϧֻ���Ǹ��������),�����Ǹ�ϲ���ȵ��ơ�ϲ��������ϲ�����Դӵ�����ѧ������
��ʽ����Ů,����Ϊ��������;�����ͬ���Ǵ��ѣ��������·����������ǻ���Ļ���ԭ����ǳ���һ��Ҫ������ǿ���ʽ������
���Ǿ�ѡ�����ڵķ��ӣ���Ȼ����ֻ��80��ƽ���ɳ���ȴ�н���10ƽ�ס������·�װ���ǻ�������������˵Ĺ������ر�æ��װ�޵ľ�
�ܼ򵥣�û�дﵽ�����Ч������������ȫְ�ڼ����չ�һ���ı���Ů������Ҫ�����������񣬺������࣡�ҵĹ����Ǹ������
����������Ƶ�������ͨ�����챿�����Ǻܻ�����ſ��ģ�����������ŵĹ��ġ��ҷǳ���ͨ���μӽ����ռ䣬���Լ��ҵĳ�
�������Ŀ���������������������ʱ���и������飬����һ��׼����ζ����ͣ�һ���տ�����Ů���档

16:42:48,203 INFO  [STDOUT] Hibernate: select top ? this_.ID as ID19_1_, this_.TASK_TYPE as TASK2_19_1_, this_.PLAN_FETCH_TIME as PLAN3_19_1_, this_.FETCH_UNIT_
ADDRESS as FETCH4_19_1_, this_.FETCH_MAN as FETCH5_19_1_, this_.FETCH_TEL as FETCH6_19_1_, this_.PLAN_UNLOAD_TIME as PLAN7_19_1_, this_.UNLOAD_UNIT_ADDRESS as U
NLOAD8_19_1_, this_.UNLOAD_MAN as UNLOAD9_19_1_, this_.UNLOAD_TEL as UNLOAD10_19_1_, this_.DRIVER_TEL as DRIVER11_19_1_, this_.FOLLOWER as FOLLOWER19_1_, this_.
PLAN_BACK_TIME as PLAN13_19_1_, this_.ARRIVE_FETCH_TIME as ARRIVE14_19_1_, this_.START_FETCH_TIME as START15_19_1_, this_.END_FETCH_TIME as END16_19_1_, this_.A
RRIVE_UNLOAD_TIME as ARRIVE17_19_1_, this_.START_UNLOAD_TIME as START18_19_1_, this_.END_UNLOAD_TIME as END19_19_1_, this_.TRUE_OR_FALSE as TRUE20_19_1_, this_.
RETURN_DATE as RETURN21_19_1_, this_.STATUS as STATUS19_1_, this_.REMARK as REMARK19_1_, this_.TASK_FK as TASK24_19_1_, this_.FETCH_UNIT_FK as FETCH25_19_1_, th
is_.UNLOAD_UNIT_FK as UNLOAD26_19_1_, this_.MASTER_DRIVER_FK as MASTER27_19_1_, this_.ASSIST_DRIVER_FK as ASSIST28_19_1_, this_.VOITURE_FK as VOITURE29_19_1_, t
his_.PATH_FK as PATH30_19_1_, wlpathimpl1_.ID as ID1_0_, wlpathimpl1_.PATH_NAME as PATH2_1_0_, wlpathimpl1_.DISTANCE as DISTANCE1_0_, wlpathimpl1_.LOAN_STANDARD
 as LOAN4_1_0_, wlpathimpl1_.TIME as TIME1_0_, wlpathimpl1_.START_PLACE_FK as START6_1_0_, wlpathimpl1_.END_PLACE_FK as END7_1_0_ from WL_TASK_ROW this_ inner j
oin WL_PATH wlpathimpl1_ on this_.PATH_FK=wlpathimpl1_.ID where (this_.PLAN_FETCH_TIME<=? or this_.PLAN_UNLOAD_TIME>=?) and this_.STATUS in (?, ?, ?) and wlpath
impl1_.ID=? order by this_.VOITURE_FK asc, this_.TASK_FK asc
16:42:48,218 INFO  [STDOUT] taskl===5
16:42:48,218 INFO  [STDOUT] Hibernate: select wlvoiturei0_.ID as ID32_0_, wlvoiturei0_.LICENSE as LICENSE32_0_, wlvoiturei0_.MANUFACTURER as MANUFACT3_32_0_, wl
voiturei0_.OLD_MODEL as OLD4_32_0_, wlvoiturei0_.ENGINE_CODE as ENGINE5_32_0_, wlvoiturei0_.BODY_CODE as BODY6_32_0_, wlvoiturei0_.BIRTHDAY as BIRTHDAY32_0_, wl
voiturei0_.REGISTER_DAY as REGISTER8_32_0_, wlvoiturei0_.LOAD as LOAD32_0_, wlvoiturei0_.SELF_WEIGHT as SELF10_32_0_, wlvoiturei0_.OUT_LENGTH as OUT11_32_0_, wl
voiturei0_.IN_LENGTH as IN12_32_0_, wlvoiturei0_.OUT_WIDTH as OUT13_32_0_, wlvoiturei0_.IN_WIDTH as IN14_32_0_, wlvoiturei0_.OUT_HEIGHT as OUT15_32_0_, wlvoitur
ei0_.IN_HEIGHT as IN16_32_0_, wlvoiturei0_.COLOUR as COLOUR32_0_, wlvoiturei0_.VOITURE_TYPE as VOITURE18_32_0_, wlvoiturei0_.TYRE_TYPE as TYRE19_32_0_, wlvoitur
ei0_.PIN as PIN32_0_, wlvoiturei0_.COUNTRY as COUNTRY32_0_, wlvoiturei0_.TYPE_V as TYPE22_32_0_, wlvoiturei0_.INITVALUE as INITVALUE32_0_, wlvoiturei0_.REMARK a
s REMARK32_0_, wlvoiturei0_.STATUS as STATUS32_0_, wlvoiturei0_.MASTER_DRIVER_FK as MASTER26_32_0_, wlvoiturei0_.DEPART_FK as DEPART27_32_0_ from WL_VOITURE wlv
oiturei0_ where wlvoiturei0_.ID in (?, ?)
16:42:48,250 INFO  [STDOUT] voitureSet===3
16:42:48,250 INFO  [STDOUT] ���ָ��ʱ�������������������ĳ���  m:0  id:3
16:42:48,250 INFO  [STDOUT]   n:1  taskRowList:{1=1 ���������Ϻ� 2008-12-22 14:58 -> 2008-12-22 14:58<br>2 ���������Ϻ� 2008-12-22 14:58 -> 2008-12-22 14:58}
16:42:48,250 INFO  [STDOUT]   n:2  taskRowList:{1=600 ��򡪡����� 2008-01-15 00:00 -> 2008-01-25 00:00}
16:42:48,250 INFO  [STDOUT] ���ָ��ʱ�������������������ĳ���  m:1  id:3
16:42:48,250 INFO  [STDOUT]   n:1  taskRowList:{1=1 ���������Ϻ� 2008-12-22 14:58 -> 2008-12-22 14:58<br>2 ���������Ϻ� 2008-12-22 14:58 -> 2008-12-22 14:58}
16:42:48,250 INFO  [STDOUT]   n:2  taskRowList:{1=600 ��򡪡����� 2008-01-15 00:00 -> 2008-01-25 00:00}
16:42:48,250 INFO  [STDOUT] ���ָ��ʱ�������������������ĳ���  m:2  id:3
16:42:48,250 INFO  [STDOUT]   n:1  taskRowList:{1=1 ���������Ϻ� 2008-12-22 14:58 -> 2008-12-22 14:58<br>2 ���������Ϻ� 2008-12-22 14:58 -> 2008-12-22 14:58}
16:42:48,250 INFO  [STDOUT]   n:2  taskRowList:{1=600 ��򡪡����� 2008-01-15 00:00 -> 2008-01-25 00:00}
16:42:48,265 INFO  [STDOUT] Hibernate: select top ? this_.ID as ID32_1_, this_.LICENSE as LICENSE32_1_, this_.MANUFACTURER as MANUFACT3_32_1_, this_.OLD_MODEL a
s OLD4_32_1_, this_.ENGINE_CODE as ENGINE5_32_1_, this_.BODY_CODE as BODY6_32_1_, this_.BIRTHDAY as BIRTHDAY32_1_, this_.REGISTER_DAY as REGISTER8_32_1_, this_.
LOAD as LOAD32_1_, this_.SELF_WEIGHT as SELF10_32_1_, this_.OUT_LENGTH as OUT11_32_1_, this_.IN_LENGTH as IN12_32_1_, this_.OUT_WIDTH as OUT13_32_1_, this_.IN_W
IDTH as IN14_32_1_, this_.OUT_HEIGHT as OUT15_32_1_, this_.IN_HEIGHT as IN16_32_1_, this_.COLOUR as COLOUR32_1_, this_.VOITURE_TYPE as VOITURE18_32_1_, this_.TY
RE_TYPE as TYRE19_32_1_, this_.PIN as PIN32_1_, this_.COUNTRY as COUNTRY32_1_, this_.TYPE_V as TYPE22_32_1_, this_.INITVALUE as INITVALUE32_1_, this_.REMARK as
REMARK32_1_, this_.STATUS as STATUS32_1_, this_.MASTER_DRIVER_FK as MASTER26_32_1_, this_.DEPART_FK as DEPART27_32_1_, wltaskrowi1_.ID as ID19_0_, wltaskrowi1_.
TASK_TYPE as TASK2_19_0_, wltaskrowi1_.PLAN_FETCH_TIME as PLAN3_19_0_, wltaskrowi1_.FETCH_UNIT_ADDRESS as FETCH4_19_0_, wltaskrowi1_.FETCH_MAN as FETCH5_19_0_,
wltaskrowi1_.FETCH_TEL as FETCH6_19_0_, wltaskrowi1_.PLAN_UNLOAD_TIME as PLAN7_19_0_, wltaskrowi1_.UNLOAD_UNIT_ADDRESS as UNLOAD8_19_0_, wltaskrowi1_.UNLOAD_MAN
 as UNLOAD9_19_0_, wltaskrowi1_.UNLOAD_TEL as UNLOAD10_19_0_, wltaskrowi1_.DRIVER_TEL as DRIVER11_19_0_, wltaskrowi1_.FOLLOWER as FOLLOWER19_0_, wltaskrowi1_.PL
AN_BACK_TIME as PLAN13_19_0_, wltaskrowi1_.ARRIVE_FETCH_TIME as ARRIVE14_19_0_, wltaskrowi1_.START_FETCH_TIME as START15_19_0_, wltaskrowi1_.END_FETCH_TIME as E
ND16_19_0_, wltaskrowi1_.ARRIVE_UNLOAD_TIME as ARRIVE17_19_0_, wltaskrowi1_.START_UNLOAD_TIME as START18_19_0_, wltaskrowi1_.END_UNLOAD_TIME as END19_19_0_, wlt
askrowi1_.TRUE_OR_FALSE as TRUE20_19_0_, wltaskrowi1_.RETURN_DATE as RETURN21_19_0_, wltaskrowi1_.STATUS as STATUS19_0_, wltaskrowi1_.REMARK as REMARK19_0_, wlt
askrowi1_.TASK_FK as TASK24_19_0_, wltaskrowi1_.FETCH_UNIT_FK as FETCH25_19_0_, wltaskrowi1_.UNLOAD_UNIT_FK as UNLOAD26_19_0_, wltaskrowi1_.MASTER_DRIVER_FK as
MASTER27_19_0_, wltaskrowi1_.ASSIST_DRIVER_FK as ASSIST28_19_0_, wltaskrowi1_.VOITURE_FK as VOITURE29_19_0_, wltaskrowi1_.PATH_FK as PATH30_19_0_ from WL_VOITUR
E this_ inner join WL_TASK_ROW wltaskrowi1_ on this_.ID=wltaskrowi1_.VOITURE_FK where not wltaskrowi1_.PLAN_FETCH_TIME between ? and ? and not wltaskrowi1_.PLAN
_UNLOAD_TIME between ? and ? and wltaskrowi1_.STATUS in (?, ?, ?)
16:42:48,296 INFO  [STDOUT] taskl=2222222222222222222222222==7
16:42:48,296 INFO  [STDOUT] ���ָ��ʱ���������������ĳ���  j:0  id:1
16:42:48,296 INFO  [STDOUT] ���ָ��ʱ���������������ĳ���  j:1  id:1
16:42:48,296 INFO  [STDOUT] ���ָ��ʱ���������������ĳ���  j:2  id:1
16:42:48,296 INFO  [STDOUT] ���ָ��ʱ���������������ĳ���  j:3  id:1
16:42:48,312 INFO  [STDOUT] ���ָ��ʱ���������������ĳ���  j:4  id:1
16:42:48,312 INFO  [STDOUT] ���ָ��ʱ���������������ĳ���  j:5  id:2
16:42:48,312 INFO  [STDOUT] ���ָ��ʱ���������������ĳ���  j:6  id:3
16:42:48,312 INFO  [STDOUT] voitureSet=2222222222222222222222==3
16:42:48,312 INFO  [STDOUT] taskpipupl=22=ordfdfdfer=3

 protected java.util.List handleGetVoitureByOrder(java.lang.Object[] orderRow,boolean ortherBool)
    {   
    	final Session session = getSession(false);
    	//Set voitureIDSet=new TreeSet();
    	List voitureIDSet=new ArrayList();
    	List voitureSet=new ArrayList();
    	System.out.println("taskpipupl=22==");
    	java.util.Calendar calendarBegin=new java.util.GregorianCalendar();
		java.util.Calendar calendarEnd=new java.util.GregorianCalendar();
		int timeRange=1;// ʱ��������ƫ����
    	try
        { 
    		//�����ѡ�������ڵ�ʱ�䷶Χ
        	for(int i=0;i<orderRow.length;i++){
        		WlOrderRow wlorderRow =(WlOrderRow)orderRow[i];
            	 java.util.Calendar calendar = new java.util.GregorianCalendar();
 	            calendar.setTime(wlorderRow.getOrder().getPlanFetchTime());
            	    if(i==0){
	                	calendarBegin=calendar;
	                }else{
	                	if(calendarBegin.after(calendar))calendarBegin=calendar;
	                }
	                
	            java.util.Calendar calendar1 = new java.util.GregorianCalendar();
	                calendar1.setTime(wlorderRow.getOrder().getPlanUnloadTime());
	                calendar1.add(java.util.Calendar.DATE, 1);
	                if(i==0){
	                	calendarEnd=calendar1;
	                }else{
	                	if(calendarEnd.before(calendar1))calendarEnd=calendar1;
	                }
        	}
        	calendarBegin.add(java.util.Calendar.DAY_OF_MONTH, -1*timeRange);
        	calendarEnd.add(java.util.Calendar.DAY_OF_MONTH, timeRange);
          	
    		//String sqls="select {wlorder.*}, sum({wlorderrow}.product_Num) as productNums from WlOrder {wlorder},WlOrderRow {wlorderrow} where ({wlorder}.id={wlorderrow}.order_FK) " ;
    		//���ָ��ʱ�������������������ĳ���������������С��������
    		for(int i=0;i<orderRow.length;i++){
    			final Criteria criteriaTasks = session.createCriteria(com.logistics.entity.order.WlTaskRowImpl.class);
            	WlOrderRow wlorderRow =(WlOrderRow)orderRow[i];
            	 java.util.Calendar calendar = new java.util.GregorianCalendar();
 	            calendar.setTime(wlorderRow.getOrder().getPlanFetchTime());
 	            calendar.add(java.util.Calendar.DAY_OF_MONTH, -1*timeRange);
 	            java.util.Calendar calendar1 = new java.util.GregorianCalendar();
                calendar1.setTime(wlorderRow.getOrder().getPlanUnloadTime());
                calendar1.add(java.util.Calendar.DAY_OF_MONTH, timeRange);
                criteriaTasks.add(Expression.or(Expression.le("planFetchTime",calendar.getTime()),Expression.ge("planUnloadTime",calendar1.getTime())));
                criteriaTasks.add(Expression.in("status",new String[]{"1","2","3"}));
              //·����ͬ���������ܵĲ�ѯ���������������ɼ��϶�ȡ��ж���صĲ�ѯ
                Criteria criteriaTasksPath = criteriaTasks.createCriteria("path");
                criteriaTasksPath.add(Expression.eq("id", wlorderRow.getOrder().getPath().getId()));
                criteriaTasks.addOrder(Order.asc("voiture"));
                criteriaTasks.addOrder(Order.asc("task"));
                criteriaTasks.setMaxResults(250);
	            List taskl=criteriaTasks.list();
	            System.out.println("taskl==="+taskl.size());
	            java.util.TreeMap taskRowArray=new TreeMap();
	            Object[] voitureTaskArray=new Object[orderRow.length+1];
	            for(int j=0;j<taskl.size();j++){
	            	int haveBoolean=voitureIDSet.indexOf(((WlTaskRow)taskl.get(j)).getVoiture().getId());
	            	if(haveBoolean==-1){
	            		/*if(voitureIDSet.size()!=0){
	            		voitureTaskArray[i+1]=taskRowArray.toArray();
	            		voitureSet.add(voitureTaskArray);}*/
	            		//voitureTaskArray=new Object[orderRow.length+1];
	            		System.out.println("haveBoolean haveBoolean:"+haveBoolean+"   j:"+j);
	            		voitureIDSet.add(((WlTaskRow)taskl.get(j)).getVoiture().getId());
	            		System.out.println("haveBoolean haveBoolean voitureIDSet Voitureid:"+((WlTaskRow)taskl.get(j)).getVoiture().getId()+"   j:"+j);
	            		WlVoitureTaskVO voitureTaskvo=this.toWlVoitureTaskVO(((WlTaskRow)taskl.get(j)).getVoiture());
	            		voitureTaskArray[0]=voitureTaskvo;
	            		//voitureTaskArray[0]=this.toWlVoitureVO(((WlTaskRow)taskl.get(j)).getVoiture());
	            		//System.out.println("tasklnew===i:"+i+"   j:"+j+"   getTasks:"+((WlVoiture)taskl.get(j)).getTasks().size());
	            		taskRowArray=new TreeMap();
	            		WlTaskRow taskRow=(WlTaskRow)taskl.get(j);
	            		System.out.println("haveBoolean haveBoolean taskRow.getTask().getId():"+taskRow.getTask().getId() + "i:"+i +"   j:"+j);
	            		taskRowArray.put(taskRow.getTask().getId(),taskRow.getId()+" "+taskRow.getPath().getPathName()+" "+ProjectUtil.getFullDateStr(taskRow.getPlanFetchTime())+" -> "+ProjectUtil.getFullDateStr(taskRow.getPlanUnloadTime()));
	            		voitureTaskArray[i+1]=taskRowArray;
	            		System.out.println("haveBoolean haveBoolean voitureTaskArray[i+1]:"+voitureTaskArray[i+1] + "i:"+i +"   j:"+j);
	            		voitureSet.add(voitureTaskArray);
	            		System.out.println("haveBoolean haveBoolean voitureSet:"+voitureSet.size() + "i:"+i +"   j:"+j);
	            	}else{
	            		System.out.println("haveBoolean :"+haveBoolean+ "i:"+i +"   j:"+j);
	            		voitureTaskArray=(Object[])voitureSet.get(haveBoolean);
	            		System.out.println("haveBoolean  voitureTaskArray:"+voitureTaskArray + "i:"+i +"   j:"+j);
	            		if(null!=voitureTaskArray[i+1]){
	            			System.out.println("haveBoolean  voitureTaskArray.length:"+voitureTaskArray.length + "i:"+i +"   j:"+j);
	            			System.out.println("haveBoolean  voitureTaskArray[i+1]:"+voitureTaskArray[i+1] + "i:"+i +"   j:"+j);
	            			taskRowArray=(TreeMap)voitureTaskArray[i+1];
	            			System.out.println("haveBoolean  taskRowArray:"+taskRowArray + "i:"+i +"   j:"+j);
	            		}else{
	            			taskRowArray=new TreeMap();
	            			System.out.println("haveBoolean  new taskRowArray:"+taskRowArray + "i:"+i +"   j:"+j);
	            		}
	            		WlTaskRow taskRow=(WlTaskRow)taskl.get(j);
	            		System.out.println("haveBoolean  taskRow.getTask().getId():"+taskRow.getTask().getId() + "i:"+i +"   j:"+j);
	            		if(taskRowArray.containsKey(taskRow.getTask().getId())){
	            			String taskRowString=(String)taskRowArray.get(taskRow.getTask().getId());
	            			System.out.println("haveBoolean 1 taskRowString:"+taskRowString + "i:"+i +"   j:"+j);
	            			taskRowString=taskRowString+"<br>"+taskRow.getId()+" "+taskRow.getPath().getPathName()+" "+ProjectUtil.getFullDateStr(taskRow.getPlanFetchTime())+" -> "+ProjectUtil.getFullDateStr(taskRow.getPlanUnloadTime());
	            			System.out.println("haveBoolean 2 taskRowString:"+taskRowString + "i:"+i +"   j:"+j);
	            			taskRowArray.put(taskRow.getTask().getId(),taskRowString);
	            		}else{
	            			
	            		taskRowArray.put(taskRow.getTask().getId(),taskRow.getId()+" "+taskRow.getPath().getPathName()+" "+ProjectUtil.getFullDateStr(taskRow.getPlanFetchTime())+" -> "+ProjectUtil.getFullDateStr(taskRow.getPlanUnloadTime()));
	            		System.out.println("haveBoolean 3 taskRowArray:"+taskRowArray + "i:"+i +"   j:"+j);
	            		}
	            		voitureTaskArray[i+1]=taskRowArray;
	            		System.out.println("voitureSet.set(haveBoolean,voitureTaskArray) haveBoolean :"+haveBoolean + "i:"+i +"   j:"+j);
	            		voitureSet.set(haveBoolean,voitureTaskArray);
	            	}
	            }
	            System.out.println("voitureSet==="+voitureSet.size());
	        }
    		System.out.println("voitureSet======================"+voitureSet.size());
    		//----------------------
    		for(int m=0;m<voitureSet.size();m++){
    			Object[] tempVoitureTaskArray=null;
    			tempVoitureTaskArray=(Object[])voitureSet.get(m);
    			WlVoitureTaskVO wlVoitureTaskVO =null;
            	 wlVoitureTaskVO =(WlVoitureTaskVO)tempVoitureTaskArray[0];
            	System.out.println("------------���ָ��ʱ�������������������ĳ���  m:"+m+"  id:"+wlVoitureTaskVO.getId());
            	for(int n=1;n<tempVoitureTaskArray.length;n++){
            		TreeMap taskRowList=null;
            		taskRowList=	(TreeMap)tempVoitureTaskArray[n];
            		System.out.println("---------���ָ��ʱ�������������������ĳ���  m:"+m+" tempVoitureTaskArray[n]:"+tempVoitureTaskArray[n].toString());	
            		System.out.println("---------���ָ��ʱ�������������������ĳ���  m:"+m+" (TreeMap)tempVoitureTaskArray[n]:"+taskRowList.toString()+"   hashCode:"+taskRowList.hashCode());	
            	}
    		}
    		//-------------------------
    		for(int m=0;m<voitureSet.size();m++){
            	Object[] tempVoitureTaskArray=null;
            	tempVoitureTaskArray=(Object[])voitureSet.get(m);
            	WlVoitureTaskVO wlVoitureTaskVO =null;
            	wlVoitureTaskVO =(WlVoitureTaskVO)tempVoitureTaskArray[0];
            	System.out.println("���ָ��ʱ�������������������ĳ���  m:"+m+"  id:"+wlVoitureTaskVO.getId());
            	Object[] taskStringObject = null;
            	taskStringObject=new Object[tempVoitureTaskArray.length-1];
            	for(int n=1;n<tempVoitureTaskArray.length;n++){
            		/*System.out.println("tempVoitureTaskArray[n]===n:"+n+"  :"+tempVoitureTaskArray[n]);	
            		WlVoitureVO f=(WlVoitureVO)tempVoitureTaskArray[0];
            		System.out.println("tempVoitureTaskArray[0]id===n:"+n+"  :"+f.getId());	
            		ArrayList fl=(ArrayList)tempVoitureTaskArray[n];
            		if(fl!=null)    		System.out.println("tempVoitureTaskArray[n]..getClass()===n:"+n+"  :"+fl.getClass());
            		*/
            		TreeMap taskRowList=null;
            		taskRowList=	(TreeMap)tempVoitureTaskArray[n];
            		System.out.println("  n:"+n+"  taskRowList:"+taskRowList.toString());
            		if(taskRowList!=null)taskStringObject[n-1]=taskRowList.toString();
            	}
            	wlVoitureTaskVO.setTasks(taskStringObject);
            	voitureSet.set(m, wlVoitureTaskVO);
            }
    		if(!ortherBool){
        	//���ָ��ʱ���������������ĳ���������������С��������
    		
        		final Criteria criteria1 = session.createCriteria(com.logistics.entity.car.WlVoitureImpl.class);
        		//criteria1.createCriteria("tasks").add(Expression.not(Expression.between("planFetchTime" ,calendarBegin.getTime(), calendarEnd.getTime()))).add(Expression.not(Expression.between("planUnloadTime", calendarBegin.getTime(), calendarEnd.getTime())));
	            Criteria criteriaTasks1 = criteria1.createCriteria("tasks");
	            criteriaTasks1.add(Expression.not(Expression.between("planFetchTime" ,calendarBegin.getTime(), calendarEnd.getTime())));
	            criteriaTasks1.add(Expression.not(Expression.between("planUnloadTime", calendarBegin.getTime(), calendarEnd.getTime())));
	            criteriaTasks1.add(Expression.in("status",new String[]{"1","2","3"}));
	            criteria1.setMaxResults(250);
	            List taskl=criteria1.list();
	            System.out.println("taskl=2222222222222222222222222=="+taskl.size());
	            for(int j=0;j<taskl.size();j++){
	            	int haveBoolean=voitureIDSet.indexOf(((WlVoiture)taskl.get(j)).getId());
	            	System.out.println("���ָ��ʱ���������������ĳ���  j:"+j+"  id:"+((WlVoiture)taskl.get(j)).getId());
	            	if(haveBoolean==-1){
	            		System.out.println("haveBoolean222222222222222222222222==-1==j:"+j);	
	            	WlVoitureTaskVO voitureTaskVO=this.toWlVoitureTaskVO((WlVoiture)taskl.get(j));
	            	//WlVoitureVO voitureVO=this.toWlVoitureVO((WlVoiture)taskl.get(j));
            		//Object[] voitureTaskArray=new Object[orderRow.length+1];
            		//voitureTaskArray[0]=voitureVO;
	            	voitureSet.add(voitureTaskVO);
	            	
	            	}
	            }
	            System.out.println("voitureSet=2222222222222222222222=="+voitureSet.size());
	            return new ArrayList(voitureSet);
          }else{
	        //ָ��ʱ���������������ĳ���
        		final Criteria criteria2 = session.createCriteria(com.logistics.entity.car.WlVoitureImpl.class);
        		//criteria2.createCriteria("tasks").add(Expression.not(Expression.between("planFetchTime" ,calendarBegin.getTime(), calendarEnd.getTime()))).add(Expression.not(Expression.between("planUnloadTime", calendarBegin.getTime(), calendarEnd.getTime())));
	            Criteria criteriaTasks2 = criteria2.createCriteria("tasks");
	            criteriaTasks2.add(Expression.between("planFetchTime" ,calendarBegin.getTime(), calendarEnd.getTime()));
	            criteriaTasks2.add(Expression.between("planUnloadTime", calendarBegin.getTime(), calendarEnd.getTime()));
	            criteriaTasks2.add(Expression.in("status",new String[]{"1","2","3"}));
	            criteria2.setMaxResults(250);
	            List taskl2=criteria2.list();
	            System.out.println("taskl=111111111111111111111111111111111111111111111111111=="+taskl2.size());
	            ArrayList voitureIDSet2=new ArrayList();
	            List voitureSet2=new ArrayList();
	            for(int j=0;j<taskl2.size();j++){
	            	voitureIDSet2.add(((WlVoiture)taskl2.get(j)).getId());
	            	System.out.println("ָ��ʱ�����  ��  ��������ĳ���  j:"+j+"  id:"+((WlVoiture)taskl2.get(j)).getId());
	            	WlVoitureTaskVO voitureTaskVO=this.toWlVoitureTaskVO((WlVoiture)taskl2.get(j));
	            	voitureSet2.add(voitureTaskVO);
	            }
	            
	            for(int j=0;j<voitureSet.size();j++){
	            	int listInt=voitureIDSet2.indexOf(((WlVoitureTaskVO)voitureSet.get(j)).getId());
	            	if(listInt!=-1){
	            	//WlVoitureTaskVO voitureTaskVO=this.toWlVoitureTaskVO((WlVoiture)voitureSet.get(j));
	            	voitureSet2.remove(listInt);//((WlVoitureTaskVO)voitureSet.get(j));}
	            	}}
	            //û����ص�δִ����ϵ��ɳ����ĳ���
	            //????????????????????????????????
	            System.out.println("voitureSet=11111111111111111111111111111111111111111=="+voitureSet2.size());
	            return new ArrayList(voitureSet2);
          } 
         
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
}

10:17:55,109SELECT  count(distinct  wl_task_row.path_fk) ,wl_task.id from wl_task_row inner join wl_task  on wl_task_row.task_fk=wl_task.id where 1=1 and exists (select WL_TASK_ROW.id from WL_TASK_ROW  where WL_TASK_ROW.path_fk=1 and WL_TASK.ID=WL_TASK_ROW.task_fk)and exists (select WL_TASK_ROW.id from WL_TASK_ROW  where WL_TASK_ROW.path_fk=2 and WL_TASK.ID=WL_TASK_ROW.task_fk) group by  WL_TASK.id  having count(distinct  WL_TASK_ROW.path_fk)=2
10:17:55,156 INFO  [STDOUT] Hibernate: SELECT top ?  count(distinct  wl_task_row.path_fk) ,wl_task.id from wl_task_row inner join wl_task  on wl_task_row.task_f
k=wl_task.id where 1=1and exists (select WL_TASK_ROW.id from WL_TASK_ROW  where WL_TASK_ROW.path_fk=1 and WL_TASK.ID=WL_TASK_ROW.task_fk)and exists (select WL_T
ASK_ROW.id from WL_TASK_ROW  where WL_TASK_ROW.path_fk=2 and WL_TASK.ID=WL_TASK_ROW.task_fk) group by  WL_TASK.id  having count(distinct  WL_TASK_ROW.path_fk)=2