	  
//第一帧	 （） @@@@简单的说，这套工具的功能就是：用户只要通过uml图完成了实体类设计（即数据库设计）的条件下，不需编写一行代码，即可得到一个功能完整、全面、稳定的原型系统，这个原型系统采用的架构是：服务端为hibernate、spring、webService，客户端采用的是dojo。
	  
@@@@下面我们演示一下，用户需要做什么，和工具实现的原型系统是什么样的。

@@@@用户需要做的只是画一个非常简单的uml图！这里强烈的推荐argouml-0.28，因为？？？？。首先双击这个图标，打开工具，

//第二帧
我们看到的界面左侧是一个导航树，这个节点的名字是未定义的模型，首先给这个模型取一个名字，我们这里将它定义为demo。

然后定义自己的软件包，。。然后新建一个类图，现在我们可以开始在这里画entity类。

现在我们看一个完整的uml图，从图中可看出Prod有
prodCust、principal两个外键；另外，contact(合同)
类也有一个customer外键

从这个已经完成的图中我们还看到entity被定义了Entity、Manageable这样的构造型，还有一些方法，其实图中还有未显示的ValueObject类、WebService类等，这些内容不需用户去画，工具会在生成代码的时候，调用自定义



首先要画一个用来描述产品信息的类，即对应数据库中的产品信息表，命名为Prod，点击这个new class按钮，然后将鼠标移至界面的空白处。单击左键，然后我们看页面下方就是这个新类的定义界面。。。。，Prod类中需要有一个生产厂家的外键，因此我们还要定义一个customer的entity类。。。。（下面的是箭头）。。。。。。。。。orga。people。。。。。。到这里我们已经简要的介绍了如何画图，和需要注意的地方，下面看一下这个已经画好的图，图中有。。。。除了图上显示的这些类以外，从左测的树中我们还可以看到一些ValueObject类，其实每一个实体类在都要对应VO和WEbService，这些属性、方法和类是在生成代码时，调用了自定义的argouml插件，自动添加上去的。不需要用户去画？？？？？？？。根据用户画好的图，？？？？

@@@@下面来演示一下根据这个图，我们生成了一个怎样的原想系统。打开浏览器，进入导航页面，左侧树的第一层节点显示了系统中包含的表，展开表节点，显示了针对这个表我们生成了的页面！页面分两大类：维护界面和查询界面。
@@@@我们以prod为例展示一下生成的页面，首先我们看一个最常见的增删查该页面：1.jsp。
@@@@首先在界面中看到的是一个产品信息的查看列表，上面是相关操作按钮。单击第一个编辑按钮，显示出了维护功能界面。这个维护界面的布局是按照每行3个字段的规则，在下面还有按照每行两个字段生层的页面，用户可根据具体的情况选择在系统中使用那个。
@@@@接下来我们可以在这里新增一条产品信息。首先是产品名称，这是个非空字段，如果我们没有填写这个值的话，系统会立即提示不能为空，其实这里的所有验证都是在录入同时做的。
@@@@下面看价格这个数字类型的输入，当输入错误时，系统会马上给出提示，？？改验证？？？，
@@@@然后是时间类型的字段，可以选择，也可以键盘输入，我们输入一个不存在的日期2009-6-31，也可以立即判断。
@@@@再看生产厂家这个外键，这里已经默认加载了所有的记录，？？修改加载条件？？？，最后是产品负责人这个外键，完成输入后，点保存按钮。可以看到下面的列表中也增加了这条记录。

@@@@当我们想修改一条记录时，双击这条记录，即可在维护界面显示，修改后保存即可。（删除有错误！！！！！！！！）

@@@@再来介绍一下查询功能，点击查询条件按钮，显示了一个输入查询条件的界面，这里我们提供的是一个比较全面的条件定义功能，
@@@@普通的字符是按like为条件的，数字是即可等于一个值，也可以是个值的范围。是否带等号也可选择。日期于数字类似		
@@@@外键的查询条件可从下拉框中选，也可以 单击这个按钮，输入具体的查询条件，比如在这里输入一个6，得到的就是生产厂家名称包含6的产品的列表。

@@@@这个页面到这里，再看一个批量的增删查该页面的例子：2.jsp，单击增加按钮，这里可以选人员，（浮动窗口放大），？？修改需填写的记录，去掉价格price？？？
这里的修改功能都是针对所有字段的，当用户需要的是一个对部分字段修改的界面时，只需在页面源码中注掉对应的字段即可。现在举个例子：

@@@@再来看一个增删查该页面的例子：9.jsp，这个页面的上部是与前一个页面类似的编辑列表，下面显示了产品信息的两个外键，厂家信息的累表和人员信息的列表，用户可以在新增记录前选择好这两字段，然后再单击增加按钮，
这两个值就已经填好了。然后可以继续完成其他相的录入。

@@@@再来看另外一个增删查该页面的例子：6.jsp，首先看到的是人员people的记录列表，下面实际上隐藏了一个界面，点击+可打开，这里包含了所有的以people为外键的表的维护功能。单击一条上面的people记录，下面就会显示以所选的people对应的产品信息。在这里维护的记录，也都是在上面列表中所选的people的产品信息。

@@@@再来看另外一个增删查该页面的例子：3.jsp，首先看到的是生产厂家customer的记录列表，下面显示的是所选的customer为外键的产品信息。在这里维护的记录，也都是以所选的customer的产品信息。（加一条）
@@@@在这里我们还可以演示一下这几个按钮的功能：上页，下页，每页显示记录数，排序

@@@@再看下一个4。jsp：这个页面的功能与上一个完全一样，只是布局不同，

@@@@再看下一个5。jsp：这个页面也是功能与上一个完全一样，只是布局不同。下面的页面就不一一详细介绍了，从举的这些例子可以看出，下面的页面有些是功能相同，但布局不同，比如刚才看的这几个页面；有些是功能少些的，比如这个页面，将功能分开的话，可以被分成三个页面，即弹出窗口中只包含相关产品信息的，只包含合同信息的，等等。当然也还有一些其他的实现方式，可能是您想不到的。这个工具的目的就是让用户只需在我们提供的这些页面中选择利用，而不必去从头开始设计、编码；该工具则通过借鉴那些成熟的，优秀的软件，尽量的将所有可能的实现方式都包含进来；也就是说学习的、甄选的工作由工具来做。

@@@@@
接下来在看一对多情况的例子，先简单介绍一下如何画一对多的关系:
orderd是订单信息表，主表，有一个Customer（客户）的外键；
orderRowd是订单货物信息表，子表，有一个Prod（产品信息）的外键。

现在画一对多的关系：
先点击这个(New Association)按钮，然后从orderRowd开始，画到orderd
结束,分别给主表、子表两侧的AssociationEnd定义名称，并修改子表一侧
的multiplicity属性为0..*


@@@@@工具为orderd和orderRowd同样生成了类似上面介绍了的prod的界面，不再演示，我们从这样的一个增删查该的页面开始：orderd10.jsp
@@@@@可以看到表中已经有了一条记录，双击可显示他的维护界面，修改内容后保存列表也得到同步。单击增加按钮可以新增一个空白记录，填写完毕后保存。列表中也会自动的增加，
单击编辑按钮，隐藏了编辑区域，点击+号，展开累表记录。这一行是订单的详细内容，因为订单的内容较多，一行无法显示完全，如果你想修改某个字段从详细行到默认显示行，也只需在页面原代码中移动一下即可。
最后面的这两个按钮是实现全部赞开。折叠的功能。


工具为orderd和orderRowd同样生成了类似上面介绍的prod的页面，
不再演示，我们从这样的一个增删查改的页面开始：
可以看到表中的订单记录，双击可显示维护界面，修改内容后“保存”，列表也得到同步。单击增加按钮可以新增一个空白记录，填写完毕后保存。列表中也会自动的增加，
单击编辑按钮，隐藏了编辑区域，点击+号，展开累表记录。这一行是订单的详细内容，因为订单的内容较多，一行无法显示完全，如果你想修改某个字段从详细行到默认显示行，也只需在页面原代码中移动一下即可。
最后面的这两个按钮是实现全部赞开。折叠的功能。



@@@@@再看这个12.jsp，由于order的字段无法再一行显示，我们在这里默认将他分成了两行来显示，但由于字段数量不是偶数的，所以，看起来不够规整，现在来修改一下。。。。再看这个，由于order的字段比较多，在一行显示太长，我们在这里默认将他们分成了两行来显示

展开显示了订单货物的明细记录
@@@@@单击add按钮，可增加一个orderd的空白记录，点击+号，可增加一个orderRowd空白记录（加一条）

@@@@@6.jsp 
下面看看这个页面，这是显示了订单orderd的外键、客户（customer）的列表，
下部的隐藏窗口显示了orderd和其子表orderRowd的增删改界面。具体功能和前
面的类似

@@@@@在看看这个例子，13.jsp，
下面的界面分别是主表的外键（客户信息customer）的列表和子表的外键（产品信息）的列表。
在增加前，分别选定，即可完成默认的关联。如果需要将产品价格的信息带入到订货记录中的话，
直接在页面上做一个很小的改动即可，类似这种常见的修改演示，会集中放到在专门的演示文件中。

查询功能我们不再演示其他的了，他们大都与在维护页面对应，只是去掉了维护功能。///////////////////////@@@@@看两个查询的，queryorderd1.jsp，queryorderd11.jsp，

@@@@@在看看这个例子，orderRowd3.jsp，上面是主表的维护界面，下面是子表的维护界面，这是最常见的一对多维护界面了。
再看看这个例子，上面是主表的维护界面，下面是
子表的维护界面，这是最常见的一对多维护界面了

@@@@@最后看一下这个页面吧，orderRowd9.jsp，上面是子表的维护界面，下面是主表列表和子表的外键列表，在增加前，选择好，即可填写好对用项！


@@@@@
最后演示多对多和树结构的情况，同样先画图。实现多对多的关系，
经典的方法就是建立一个关系表，关系表中除，主键外只有两个外
键，分别引用的是多对多的那两个表，此外没有其他的属性。如，
机构部门信息表（orga）和人员信息表（peoples），这两个表可以
设计为多对多。而机构表是最常见的树型结构，因此需要在orga中有
一个parentId的字段。

@@@@@我们来看看多对多的关联我们是怎样实现的

@@@@@下面再看一个orga的页面，orga5。jsp 
这个界面即包含了机构的维护功能，也包含了机构与人员的关系的维护功能。
这个界面显示了人员列表即包含了机构的维护功能，也包含了，机构与人员的关系的维护功能。
@@@@@在看看机构与人员的关系的维护功能，切入这个界面，显示的是所有的人员名单，选中的记录是相关联的，我们可以直接修改。

@@@@@crudOrgaPeoples_6，
这个页面上面显示的是多对多中的一个关联表people。下面显示的对应信息中有orga这项，
载入这个界面，显示的是当前的机构树。没有选中，说明没有任何关联；我们选中后，保
存，即增加了这个关联；取消选中后，保存，即删除了这个关联。

需要提一下的是，我们这里的树在初始加载时默认从数据库中读取两层节点加载，下层的
节点，在用户单击节点时，才会触发读取子节点的方法，动态加载。这样在树节点很多的
情况下，可有效提高树的效率。



？？？/结尾


tip://默认查询条件的修改
	中文
	//order13要提同时修改价格等信息修改

为了方便说明本工具生成代码的规则，这里展示的数据关系都是最基本的，
用户实际设计的数据库可能有更加复杂的关系，比如一个表可能既是一对
多的表，又与其他表有多对多的关系等等，这些相对复杂的关系，我们同
样可以生成相应的代码。下面说说页面的一些常见的修改，对于是了解
dojo的用户是非常简单的，如果是不熟悉dojo的用户，我们可以同时提供
一个包含常见的格式修改，功能修改步骤（输入两个时间对比验证显示
等等）的flash的演示文件或进行面对面的培训。
查询功能我们没有演示，他们大都与在维护页面对应，只是去掉了维护功能。
最后讲讲中文的问题

这个文件是系统中专门做国际化转换的，他类似
于java中的properties文件。其中已经包含了页
面上所有显示的字段名称（如prodName）但未进
行中文转换。用户只需根据需求，直接在这里修
改后，系统中所有的对应字段就可以实现中文显
示了。
dangr
没有将查询。。。。。
修改的页面有 orderd12

为了方便说明本工具生成代码的规则，这里展示的数据关系都是最基本的，
用户实际设计的数据库可能有更加复杂的关系，比如一个表可能既是一对
多的表，又与其他表有多对多的关系等等，这些相对复杂的关系，我们同
样可以生成相应的代码。

如果工具提供的页面，不能完全符合用户的要求，我们可以根据用户的需要
对模板进行修改，为您定制代码。如果你要求定制的功能的实现技术和目前
提供的相同，那么所需的时间是非常短的；如果您要求定制的实现技术是与
当前不同的，但能够提供现成的代码，可供参考（要求代码经过优化，整合
），那么我们也可以较快的为您完成定制。

下面说说页面的一些常见的修改，对于是了解dojo的用户是非常简单的，如
果是不熟悉dojo的用户，我们可以同时提供一个包含常见的格式修改，功能
修改步骤（输入两个时间对比验证显示等等）的flash的演示文件或进行面对
面的培训。

查询功能我们没有演示，他们大都与在维护页面对应，只是去掉了维护功能

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
	我是个把美食家做为理想职业的人(可惜只能是个梦想而已),老婆是个喜欢喝点红酒、喜欢做饭、喜欢尝试从电视上学来的新
菜式的美女,老婆为我做的午餐经常让同事们垂涎；所以买新房、挑户型那会儿的基本原则就是厨房一定要大，最好是开放式厨房！
于是就选了现在的房子，虽然房子只有80多平，可厨房却有将近10平米。但是新房装修那会儿，正好两个人的工作都特别忙，装修的就
很简单，没有达到理想的效果。现在老婆全职在家里照顾一岁半的宝贝女儿，又要做饭、做家务，很是辛苦！我的工作是搞软件开
发，有着理科的男生的通病，嘴笨！不是很会哄老婆开心，不会表达对老婆的关心。我非常想通过参加交换空间，让自己家的厨
房真正的开放起来，让老婆做饭的时候有个好心情，可以一边准备美味的晚餐，一边照看宝贝女儿玩。

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
16:42:48,250 INFO  [STDOUT] 获得指定时间段内有其他相似任务的车辆  m:0  id:3
16:42:48,250 INFO  [STDOUT]   n:1  taskRowList:{1=1 北京——上海 2008-12-22 14:58 -> 2008-12-22 14:58<br>2 北京——上海 2008-12-22 14:58 -> 2008-12-22 14:58}
16:42:48,250 INFO  [STDOUT]   n:2  taskRowList:{1=600 天津——北京 2008-01-15 00:00 -> 2008-01-25 00:00}
16:42:48,250 INFO  [STDOUT] 获得指定时间段内有其他相似任务的车辆  m:1  id:3
16:42:48,250 INFO  [STDOUT]   n:1  taskRowList:{1=1 北京——上海 2008-12-22 14:58 -> 2008-12-22 14:58<br>2 北京——上海 2008-12-22 14:58 -> 2008-12-22 14:58}
16:42:48,250 INFO  [STDOUT]   n:2  taskRowList:{1=600 天津——北京 2008-01-15 00:00 -> 2008-01-25 00:00}
16:42:48,250 INFO  [STDOUT] 获得指定时间段内有其他相似任务的车辆  m:2  id:3
16:42:48,250 INFO  [STDOUT]   n:1  taskRowList:{1=1 北京——上海 2008-12-22 14:58 -> 2008-12-22 14:58<br>2 北京——上海 2008-12-22 14:58 -> 2008-12-22 14:58}
16:42:48,250 INFO  [STDOUT]   n:2  taskRowList:{1=600 天津——北京 2008-01-15 00:00 -> 2008-01-25 00:00}
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
16:42:48,296 INFO  [STDOUT] 获得指定时间段内无其他任务的车辆  j:0  id:1
16:42:48,296 INFO  [STDOUT] 获得指定时间段内无其他任务的车辆  j:1  id:1
16:42:48,296 INFO  [STDOUT] 获得指定时间段内无其他任务的车辆  j:2  id:1
16:42:48,296 INFO  [STDOUT] 获得指定时间段内无其他任务的车辆  j:3  id:1
16:42:48,312 INFO  [STDOUT] 获得指定时间段内无其他任务的车辆  j:4  id:1
16:42:48,312 INFO  [STDOUT] 获得指定时间段内无其他任务的车辆  j:5  id:2
16:42:48,312 INFO  [STDOUT] 获得指定时间段内无其他任务的车辆  j:6  id:3
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
		int timeRange=1;// 时间条件的偏移量
    	try
        { 
    		//获得所选订单所在的时间范围
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
    		//获得指定时间段内有其他相似任务的车辆，按载重量从小到大排序
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
              //路径相同不是最智能的查询条件，如有条件可加上对取、卸货地的查询
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
            	System.out.println("------------获得指定时间段内有其他相似任务的车辆  m:"+m+"  id:"+wlVoitureTaskVO.getId());
            	for(int n=1;n<tempVoitureTaskArray.length;n++){
            		TreeMap taskRowList=null;
            		taskRowList=	(TreeMap)tempVoitureTaskArray[n];
            		System.out.println("---------获得指定时间段内有其他相似任务的车辆  m:"+m+" tempVoitureTaskArray[n]:"+tempVoitureTaskArray[n].toString());	
            		System.out.println("---------获得指定时间段内有其他相似任务的车辆  m:"+m+" (TreeMap)tempVoitureTaskArray[n]:"+taskRowList.toString()+"   hashCode:"+taskRowList.hashCode());	
            	}
    		}
    		//-------------------------
    		for(int m=0;m<voitureSet.size();m++){
            	Object[] tempVoitureTaskArray=null;
            	tempVoitureTaskArray=(Object[])voitureSet.get(m);
            	WlVoitureTaskVO wlVoitureTaskVO =null;
            	wlVoitureTaskVO =(WlVoitureTaskVO)tempVoitureTaskArray[0];
            	System.out.println("获得指定时间段内有其他相似任务的车辆  m:"+m+"  id:"+wlVoitureTaskVO.getId());
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
        	//获得指定时间段内无其他任务的车辆，按载重量从小到大排序
    		
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
	            	System.out.println("获得指定时间段内无其他任务的车辆  j:"+j+"  id:"+((WlVoiture)taskl.get(j)).getId());
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
	        //指定时间段内有其他任务的车辆
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
	            	System.out.println("指定时间段内  有  其他任务的车辆  j:"+j+"  id:"+((WlVoiture)taskl2.get(j)).getId());
	            	WlVoitureTaskVO voitureTaskVO=this.toWlVoitureTaskVO((WlVoiture)taskl2.get(j));
	            	voitureSet2.add(voitureTaskVO);
	            }
	            
	            for(int j=0;j<voitureSet.size();j++){
	            	int listInt=voitureIDSet2.indexOf(((WlVoitureTaskVO)voitureSet.get(j)).getId());
	            	if(listInt!=-1){
	            	//WlVoitureTaskVO voitureTaskVO=this.toWlVoitureTaskVO((WlVoiture)voitureSet.get(j));
	            	voitureSet2.remove(listInt);//((WlVoitureTaskVO)voitureSet.get(j));}
	            	}}
	            //没有相关的未执行完毕的派车单的车辆
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