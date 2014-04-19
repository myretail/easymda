package org.argouml.patternwizard;

import java.awt.Rectangle;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

import org.apache.log4j.Logger;
import org.argouml.kernel.Project;
import org.argouml.kernel.ProjectManager;
import org.argouml.model.CopyHelper;
import org.argouml.model.CoreFactory;
import org.argouml.model.CoreHelper;
import org.argouml.model.DataTypesFactory;
import org.argouml.model.Facade;
import org.argouml.model.Model;
import org.argouml.ui.targetmanager.TargetManager;
import org.argouml.uml.diagram.ArgoDiagram;
import org.argouml.uml.diagram.DiagramSettings;
import org.argouml.uml.diagram.DiagramUtils;
import org.argouml.uml.diagram.static_structure.layout.ClassdiagramLayouter;
import org.argouml.uml.diagram.static_structure.ui.FigClass;
//import org.apache.commons.lang.StringUtils;

public class Many2ManyActionListener implements ActionListener {
	private static final Logger LOG = Logger
			.getLogger(GenServiceActionListener.class);

	public void actionPerformed(ActionEvent e) {
		LOG.debug("User clicked on '" + e.getActionCommand() + "'");

		org.argouml.uml.diagram.static_structure.ui.FigClass entityFig = null;
		ArgoDiagram classDiagram = DiagramUtils.getActiveDiagram();
		entityFig = (FigClass) TargetManager.getInstance().getFigTarget();

		if (entityFig != null) {

			// get some needed helper classes
			CoreHelper coreHelper = Model.getCoreHelper();
			CopyHelper copyHelper = Model.getCopyHelper();
			CoreFactory coreFactory = Model.getCoreFactory();
			Project project = ProjectManager.getManager().getCurrentProject();

			Object entityClass = TargetManager.getInstance().getModelTarget();
			Object thePackage = classDiagram.getOwner();
			
			//复制VO Class,
			Object voClass = copyHelper.copy(entityClass, thePackage);
			coreHelper.setName(voClass, getEntityName(entityFig) + "VO");
			//显示VO Class,
			FigClass voFig = new FigClass(voClass,new Rectangle(10, 10, 20, 20), entityFig.getSettings());
			classDiagram.add(voFig);
			voFig.setName(getEntityName(entityFig) + "VO");
			
			
			//新建VO【】Class,
			Object voClassArray = coreFactory.buildClass(getEntityName(entityFig)+ "VO[]", thePackage);
			//显示VO【】 Class,
			FigClass voArrayFig = new FigClass(voClassArray,new Rectangle(10, 10, 20, 20), entityFig.getSettings());
			classDiagram.add(voArrayFig);
			voArrayFig.setName(getEntityName(entityFig) + "VO[]");
			
			//新建serviceClass,
			Object serviceClass = coreFactory.buildClass(getEntityName(entityFig)+ "ManageService", thePackage);
			//显示serviceClass,
			FigClass serviceFig = new FigClass(serviceClass, new Rectangle(10,10, 20, 20), new DiagramSettings());
			classDiagram.add(serviceFig);
			serviceFig.setName(getEntityName(entityFig) + "ManageService");
			
			//设置class的属性
	        Model.getExtensionMechanismsHelper().addCopyStereotype(entityClass,getStereotype(project, "Entity") );
	        Model.getExtensionMechanismsHelper().addCopyStereotype(entityClass,getStereotype(project, "Manageable") );
	        Model.getExtensionMechanismsHelper().addCopyStereotype(voClass,getStereotype(project, "ValueObject") );
	        Model.getExtensionMechanismsHelper().addCopyStereotype(serviceClass,getStereotype(project, "Service") );
	        Model.getExtensionMechanismsHelper().addCopyStereotype(serviceClass,getStereotype(project, "WebService") );
	        //--------------
			
			//新建依赖关系Dependency
			coreFactory.buildDependency(serviceClass, entityClass);
			coreFactory.buildDependency(entityClass, voClass);
			
			//为voClass加id
			Object attrType = project.findTypeInModel("long",project.getModel());
			if(attrType==null){	attrType=project.findType("long", false);	}
	        Object attr = coreFactory.buildAttribute2(voClass, attrType);       
	        coreHelper.setName(attr, "id");
	        
	      //为serviceClass加方法
	        Object returnType = project.findTypeInModel("void",project.getModel());
			if(returnType==null){	returnType=project.getDefaultReturnType();	}
	       
	        
	        Object createMethod = coreFactory.buildOperation2(serviceClass, attrType, "create"+getEntityName(entityFig) );
	        Object updateMethod = coreFactory.buildOperation2(serviceClass, returnType, "update"+getEntityName(entityFig) );
	        Object delMethod = coreFactory.buildOperation2(serviceClass, returnType, "delete"+getEntityName(entityFig) );
	        
	        Object queryReturnType = project.findTypeInModel(getEntityName(entityFig)+"VO[]",thePackage);
	        Object queryMethod = coreFactory.buildOperation2(serviceClass, queryReturnType, "get"+getEntityName(entityFig) );
	        
	        Object parameterCreate= coreFactory.buildParameter(createMethod, project.findTypeInModel(getEntityName(entityFig)+"VO",thePackage));
	        coreHelper.setName(parameterCreate, getEntityName(entityFig));//要小写
	        
	        Object parameterUpdate= coreFactory.buildParameter(updateMethod, project.findTypeInModel(getEntityName(entityFig)+"VO",thePackage));
	        coreHelper.setName(parameterUpdate, getEntityName(entityFig));//要小写
	        
	        Object parameterDel= coreFactory.buildParameter(delMethod, attrType);
	        coreHelper.setName(parameterDel, "id");//要小写
	        
	        Object parameterQuery1= coreFactory.buildParameter(queryMethod, project.findTypeInModel(getEntityName(entityFig)+"VO",thePackage));
	        coreHelper.setName(parameterQuery1, getEntityName(entityFig));////要小写
	       
	        Object intType = project.findTypeInModel("int",project.getModel());
	        Object parameterQuery2= coreFactory.buildParameter(queryMethod, intType);
	        coreHelper.setName(parameterQuery2, "pageNumber");
	        Object parameterQuery3= coreFactory.buildParameter(queryMethod, intType);
	        coreHelper.setName(parameterQuery3, "pageSize");
	        Object stringType = project.findTypeInModel("String",project.getModel());
	        Object parameterQuery4= coreFactory.buildParameter(queryMethod, stringType);
	        coreHelper.setName(parameterQuery4, "orderBy");
	        
	        //为entityClass加方法
	        Object returnListType = project.findTypeInModel("List",project.getModel());
	        Object queryStaticMethod = coreFactory.buildOperation2(entityClass, returnListType, "get"+getEntityName(entityFig) );
	        Object parameterQueryStatic1= coreFactory.buildParameter(queryStaticMethod, project.findTypeInModel(getEntityName(entityFig)+"VO",thePackage));
	        coreHelper.setName(parameterQueryStatic1, getEntityName(entityFig));////要小写
	       
	        Object parameterQueryStatic2= coreFactory.buildParameter(queryStaticMethod, intType);
	        coreHelper.setName(parameterQueryStatic2, "pageNumber");
	        Object parameterQueryStatic3= coreFactory.buildParameter(queryStaticMethod, intType);
	        coreHelper.setName(parameterQueryStatic3, "pageSize");
	        Object parameterQueryStatic4= coreFactory.buildParameter(queryStaticMethod, stringType);
	        coreHelper.setName(parameterQueryStatic4, "orderBy");
	        coreHelper.setStatic(queryStaticMethod, true);
	        //根据association为VO加属性
	        LOG.debug("1111111111");
			Facade facade = Model.getFacade();
			LOG.debug("2222222222222");
			ArrayList as=new ArrayList();
			Collection associateEnds=coreHelper.getAssociateEndsInh(entityClass);
			Collection associateClass=coreHelper.getAssociatedClassifiers(entityClass);
			
			LOG.debug("associateEnds");
			printName(associateEnds);
			
			LOG.debug("associateClass");
			printName(associateClass);
			
			LOG.debug("coreHelper.getAssociations(entityClass)");
			printName(coreHelper.getAssociations((entityClass)));
			
			Collection associates=coreHelper.getAssociations(entityClass);
			
			LOG.debug("2222222222222a"+associates.size());
			Object[] aAttros=associates.toArray();
			Object[] associateClassArray=associateClass.toArray();
			for(int i=0;i<aAttros.length;i++){
				Object voa=aAttros[i];
				
				for(int j=0;j<associateClassArray.length;j++){
					Object assClass=associateClassArray[j];
					Object reVoa=facade.getAssociationEnd(assClass,voa);
					if(reVoa!=null){
						String ascName = facade.getName(reVoa);
						if(ascName!=null){
							LOG.debug("ascName:"+ascName);
							Object newArr=coreFactory.buildAttribute2(voClass, project.findTypeInModel(facade.getName(assClass)+"VO",thePackage));
							LOG.debug("facade.getName(voa)="+facade.getName(assClass)+"VO");
							coreHelper.setName(newArr, ascName);
							//as.add(newArr);
							continue;
						}
					}
				}
			}
		//根据关联的两个表的名字为serviceClass加方法
			Object assClassOne=new Object();
			Object assClassTwo=new Object();
			if(associateClassArray.length==2){
				assClassOne=associateClassArray[0];
				assClassTwo=associateClassArray[1];
			}
			Object queryReturnTypeOne = project.findTypeInModel(facade.getName(assClassOne)+"VO[]",thePackage);
	        
			if(isTree(assClassOne)){
				Object queryMethodOne = coreFactory.buildOperation2(serviceClass, queryReturnTypeOne, "get"+facade.getName(assClassOne)+"By"+facade.getName(assClassTwo)+"IdAndParentId");
		        Object queryMethodOnePara= coreFactory.buildParameter(queryMethodOne, attrType);
		        coreHelper.setName(queryMethodOnePara, facade.getName(assClassTwo)+"Id");
		        Object queryMethodOneParaTree= coreFactory.buildParameter(queryMethodOne, attrType);
		        coreHelper.setName(queryMethodOneParaTree, "parentId");
			}else{
				Object queryMethodOne = coreFactory.buildOperation2(serviceClass, queryReturnTypeOne, "get"+facade.getName(assClassOne)+"By"+facade.getName(assClassTwo)+"Id");
		        Object queryMethodOnePara= coreFactory.buildParameter(queryMethodOne, attrType);
		        coreHelper.setName(queryMethodOnePara, facade.getName(assClassTwo)+"Id");
		    }
			Object queryReturnTypeTwo = project.findTypeInModel(facade.getName(assClassTwo)+"VO[]",thePackage);
			if(isTree(assClassTwo)){
				Object queryMethodOne = coreFactory.buildOperation2(serviceClass, queryReturnTypeTwo, "get"+facade.getName(assClassTwo)+"By"+facade.getName(assClassOne)+"IdAndParentId");
		        Object queryMethodOnePara= coreFactory.buildParameter(queryMethodOne, attrType);
		        coreHelper.setName(queryMethodOnePara, facade.getName(assClassOne)+"Id");
		        Object queryMethodOneParaTree= coreFactory.buildParameter(queryMethodOne, attrType);
		        coreHelper.setName(queryMethodOneParaTree, "parentId");
			}else{
				Object queryMethodOne = coreFactory.buildOperation2(serviceClass, queryReturnTypeTwo, "get"+facade.getName(assClassTwo)+"By"+facade.getName(assClassOne)+"Id");
		        Object queryMethodOnePara= coreFactory.buildParameter(queryMethodOne, attrType);
		        coreHelper.setName(queryMethodOnePara, facade.getName(assClassOne)+"Id");
		    }
			
			//将VO的属性设置为0..1
	        Collection voAttrs=coreHelper.getAllAttributes(voClass);
			Object[] voAttros=voAttrs.toArray();
			DataTypesFactory dataTypesFactory = Model.getDataTypesFactory();  
			for(int i=0;i<voAttros.length;i++){
				Object voAttr=voAttros[i];
				coreHelper.setMultiplicity(voAttr, dataTypesFactory.createMultiplicity("0..1"));
			}
	        //--------------
			
			ClassdiagramLayouter layouter = new ClassdiagramLayouter(classDiagram);
			layouter.layout();
		}

	}
	
	private boolean isTree(Object assClass){
		int ifTree=0;
		CoreHelper coreHelper = Model.getCoreHelper();
		Facade facade = Model.getFacade();
		Collection classAttr=coreHelper.getAllAttributes(assClass);
		Object[] classAttrArray=classAttr.toArray();
		for(int i=0;i<classAttrArray.length;i++){
			LOG.debug("add two function:"+facade.getName(assClass));
			LOG.debug("attributes:"+facade.getName(classAttrArray[i]));
			if(facade.getName(classAttrArray[i]).equals("parentId")){ifTree=1;}
		}
		return ifTree==1;
	}
	
	private void printName(Collection a){
		Facade facade = Model.getFacade();
		for (Iterator i = a.iterator();i.hasNext();){
			LOG.debug("name is : "+facade.getName(i.next()));
		}
	}

	private String getEntityName(
			org.argouml.uml.diagram.static_structure.ui.FigClass entityFig) {
		return entityFig.getName().replace('+',' ').trim();
	}
	
	
	 /**
     * This methode returns the stereotype all pattern are marked with. 
     * If the <<Pattern>>-stereotype is not present, it will be created.
     * 
     * @param project
     * @return the pattern-stereotype
     */
    private Object getStereotype(Project project, String stereoName) {
    	
//    	String stereoName="Entity";
    	String  baseClass="Class";
        
        // identify all existing stereotypes
        Iterator stereotypeIterator = Model.getModelManagementHelper().getAllModelElementsOfKindWithModel(
                        project.getModel(), Model.getMetaTypes().getStereotype()).iterator();
        Object stereotype = null;
        // run through all stereotypes
        while (stereotypeIterator.hasNext()) {
            stereotype = stereotypeIterator.next();                
            // in case it is the <<Pattern>>-Stereotype (name == "Pattern" and base class == "Package")
            if ( stereoName.equals(Model.getFacade().getName(stereotype)) 
                    && Model.getFacade().getBaseClasses(stereotype).contains(baseClass))
                // stop searching
                break;                
        }
        // if the stereotype wasn't found
        if (stereotype == null) {
            // create the stereotype
            stereotype = Model.getExtensionMechanismsFactory().buildStereotype(
                              stereoName, project.getModel());
            // set its base class
            Model.getExtensionMechanismsHelper().addBaseClass(stereotype, baseClass);
        }
        
        return stereotype;
    }    


}
