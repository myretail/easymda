package org.argouml.patternwizard;

import java.awt.Rectangle;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

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

//import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;
//import org.apache.commons.lang.StringUtils;
//һ�Զ�
public class TreeActionListener implements ActionListener {
	private static final Logger LOG = Logger
			.getLogger(TreeActionListener.class);

	public void actionPerformed(ActionEvent e) {
		LOG.debug("User clicked on '" + e.getActionCommand() + "'");

		org.argouml.uml.diagram.static_structure.ui.FigClass entityFig = null;
		ArgoDiagram classDiagram = DiagramUtils.getActiveDiagram();
		entityFig = (FigClass) TargetManager.getInstance().getFigTarget();
		//List selectList =  TargetManager.getInstance().getTargets();//(FigClass)
		//if(selectList!=null && selectList.size()==2){
		if (entityFig != null) {
			// get some needed helper classes
			CoreHelper coreHelper = Model.getCoreHelper();
			CopyHelper copyHelper = Model.getCopyHelper();
			CoreFactory coreFactory = Model.getCoreFactory();
			Project project = ProjectManager.getManager().getCurrentProject();
			Facade facade = Model.getFacade();
			//���ѡ���entity
			Collection selectEntitys =TargetManager.getInstance().getModelTargets();
			LOG.debug("selectEntitys:" + selectEntitys.size());
			if(selectEntitys!=null && selectEntitys.size()==2){
				
			Object entityClassOne = selectEntitys.toArray()[0];
			Object entityClassTwo = selectEntitys.toArray()[1];
			Object thePackage = classDiagram.getOwner();
			Collection AssoColl=coreHelper.getAssociations(entityClassOne, entityClassTwo);
			if(AssoColl.size()==1){
				Object asso=AssoColl.toArray()[0];
				Object assEndOne=facade.getAssociationEnd(entityClassOne,asso);
				Object assEndTwo=facade.getAssociationEnd(entityClassTwo,asso);
				if(assEndOne!=null){
					LOG.debug("assEndOne:have" );
					Object[] os=coreHelper.getAllBehavioralFeatures(assEndOne).toArray();
					for(int i=0;i<os.length;i++){
						LOG.debug(facade.getName(os)+":" + facade.getValue(os));
					}
				}
				if(assEndTwo!=null){
					LOG.debug("assEndTwo:have" );
					Object[] os=coreHelper.getAllBehavioralFeatures(assEndTwo).toArray();
					for(int i=0;i<os.length;i++){
						LOG.debug(facade.getName(os)+"::" + facade.getValue(os));
					}
				}
			
	//�������������		
			Object	entityMainClass =entityClassOne;
			Object serviceClass=new Object();
			if(!ifHaveClass(facade.getName(entityMainClass) + "VO")){
				//����VO Class,
				Object voClass = copyHelper.copy(entityMainClass, thePackage);
				coreHelper.setName(voClass, facade.getName(entityMainClass) + "VO");
				//��ʾVO Class,
				FigClass voFig = new FigClass(voClass,new Rectangle(10, 10, 20, 20), entityFig.getSettings());
				classDiagram.add(voFig);
				voFig.setName(facade.getName(entityMainClass) + "VO");
				
				
				//�½�VO����Class,
				Object voClassArray = coreFactory.buildClass(facade.getName(entityMainClass)+ "VO[]", thePackage);
				//��ʾVO���� Class,
				FigClass voArrayFig = new FigClass(voClassArray,new Rectangle(10, 10, 20, 20), entityFig.getSettings());
				classDiagram.add(voArrayFig);
				voArrayFig.setName(facade.getName(entityMainClass) + "VO[]");
				
				//�½�serviceClass,
				serviceClass = coreFactory.buildClass(facade.getName(entityMainClass)+ "ManageService", thePackage);
				//��ʾserviceClass,
				FigClass serviceFig = new FigClass(serviceClass, new Rectangle(10,10, 20, 20), new DiagramSettings());
				classDiagram.add(serviceFig);
				serviceFig.setName(facade.getName(entityMainClass) + "ManageService");
				
				//����class������
		        Model.getExtensionMechanismsHelper().addCopyStereotype(entityMainClass,getStereotype(project, "Entity") );
		        Model.getExtensionMechanismsHelper().addCopyStereotype(entityMainClass,getStereotype(project, "Manageable") );
		        Model.getExtensionMechanismsHelper().addCopyStereotype(voClass,getStereotype(project, "ValueObject") );
		        Model.getExtensionMechanismsHelper().addCopyStereotype(serviceClass,getStereotype(project, "Service") );
		        Model.getExtensionMechanismsHelper().addCopyStereotype(serviceClass,getStereotype(project, "WebService") );
		        //--------------
				
				//�½�������ϵDependency
				coreFactory.buildDependency(serviceClass, entityMainClass);
				coreFactory.buildDependency(entityMainClass, voClass);
				
				//ΪvoClass��id
				Object attrType = project.findTypeInModel("long",project.getModel());
				if(attrType==null){	attrType=project.findType("long", false);	}
		        Object attr = coreFactory.buildAttribute2(voClass, attrType);       
		        coreHelper.setName(attr, "id");
		        
		      //ΪserviceClass�ӷ���
		        Object returnType = project.findTypeInModel("void",project.getModel());
				if(returnType==null){	returnType=project.getDefaultReturnType();	}
		       
		        
		        Object createMethod = coreFactory.buildOperation2(serviceClass, attrType, "create"+facade.getName(entityMainClass) );
		        Object updateMethod = coreFactory.buildOperation2(serviceClass, returnType, "update"+facade.getName(entityMainClass) );
		        Object delMethod = coreFactory.buildOperation2(serviceClass, returnType, "delete"+facade.getName(entityMainClass) );
		        
		        Object queryReturnType = project.findTypeInModel(facade.getName(entityMainClass)+"VO[]",thePackage);
		        Object queryMethod = coreFactory.buildOperation2(serviceClass, queryReturnType, "get"+facade.getName(entityMainClass) );
		        
		        Object parameterCreate= coreFactory.buildParameter(createMethod, project.findTypeInModel(facade.getName(entityMainClass)+"VO",thePackage));
		        coreHelper.setName(parameterCreate, facade.getName(entityMainClass));//ҪСд
		        
		        Object parameterUpdate= coreFactory.buildParameter(updateMethod, project.findTypeInModel(facade.getName(entityMainClass)+"VO",thePackage));
		        coreHelper.setName(parameterUpdate, facade.getName(entityMainClass));//ҪСд
		        
		        Object parameterDel= coreFactory.buildParameter(delMethod, attrType);
		        coreHelper.setName(parameterDel, "id");//ҪСд
		        
		        Object parameterQuery1= coreFactory.buildParameter(queryMethod, project.findTypeInModel(facade.getName(entityMainClass)+"VO",thePackage));
		        coreHelper.setName(parameterQuery1, facade.getName(entityMainClass));////ҪСд
		       
		        Object intType = project.findTypeInModel("int",project.getModel());
		        Object parameterQuery2= coreFactory.buildParameter(queryMethod, intType);
		        coreHelper.setName(parameterQuery2, "pageNumber");
		        Object parameterQuery3= coreFactory.buildParameter(queryMethod, intType);
		        coreHelper.setName(parameterQuery3, "pageSize");
		        Object stringType = project.findTypeInModel("String",project.getModel());
		        Object parameterQuery4= coreFactory.buildParameter(queryMethod, stringType);
		        coreHelper.setName(parameterQuery4, "orderBy");
		        
		        //ΪentityClass�ӷ���
		        Object returnListType = project.findTypeInModel("List",project.getModel());
		        Object queryStaticMethod = coreFactory.buildOperation2(entityMainClass, returnListType, "get"+facade.getName(entityMainClass) );
		        Object parameterQueryStatic1= coreFactory.buildParameter(queryStaticMethod, project.findTypeInModel(facade.getName(entityMainClass)+"VO",thePackage));
		        coreHelper.setName(parameterQueryStatic1, facade.getName(entityMainClass));////ҪСд
		       
		        Object parameterQueryStatic2= coreFactory.buildParameter(queryStaticMethod, intType);
		        coreHelper.setName(parameterQueryStatic2, "pageNumber");
		        Object parameterQueryStatic3= coreFactory.buildParameter(queryStaticMethod, intType);
		        coreHelper.setName(parameterQueryStatic3, "pageSize");
		        Object parameterQueryStatic4= coreFactory.buildParameter(queryStaticMethod, stringType);
		        coreHelper.setName(parameterQueryStatic4, "orderBy");
		        coreHelper.setStatic(queryStaticMethod, true);
		        
		        Object delMethodStatic = coreFactory.buildOperation2(entityMainClass, returnType, "delete"+facade.getName(entityMainClass) );
		        Object parameterDelStatic= coreFactory.buildParameter(delMethodStatic, attrType);
		        coreHelper.setName(parameterDelStatic, "id");//ҪСд
		        coreHelper.setStatic(delMethodStatic, true);
		        //����associationΪVO������
		        LOG.debug("1111111111");
				
				LOG.debug("2222222222222");
				ArrayList as=new ArrayList();
				Collection associateEnds=coreHelper.getAssociateEndsInh(entityMainClass);
				Collection associateClass=coreHelper.getAssociatedClassifiers(entityMainClass);
				
				LOG.debug("associateEnds");
				printName(associateEnds);
				
				LOG.debug("associateClass");
				printName(associateClass);
				
				LOG.debug("coreHelper.getAssociations(entityMainClass)");
				printName(coreHelper.getAssociations((entityMainClass)));
				
				Collection associates=coreHelper.getAssociations(entityMainClass);
				
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
				
				//��VO����������Ϊ0..1
		        Collection voAttrs=coreHelper.getAllAttributes(voClass);
				Object[] voAttros=voAttrs.toArray();
				DataTypesFactory dataTypesFactory = Model.getDataTypesFactory();  
				for(int i=0;i<voAttros.length;i++){
					Object voAttr=voAttros[i];
					coreHelper.setMultiplicity(voAttr, dataTypesFactory.createMultiplicity("0..1"));
				}
		        //--------------
			}
			
	//�����ӱ������		
			Object entityClass =entityClassTwo;
			if(!ifHaveClass(facade.getName(entityClass) + "VO")){
				//����VO Class,
				Object voClass = copyHelper.copy(entityClass, thePackage);
				coreHelper.setName(voClass, facade.getName(entityClass) + "VO");
				//��ʾVO Class,
				FigClass voFig = new FigClass(voClass,new Rectangle(10, 10, 20, 20), entityFig.getSettings());
				classDiagram.add(voFig);
				voFig.setName(facade.getName(entityClass) + "VO");
				
				
				//�½�VO����Class,
				Object voClassArray = coreFactory.buildClass(facade.getName(entityClass)+ "VO[]", thePackage);
				//��ʾVO���� Class,
				FigClass voArrayFig = new FigClass(voClassArray,new Rectangle(10, 10, 20, 20), entityFig.getSettings());
				classDiagram.add(voArrayFig);
				voArrayFig.setName(facade.getName(entityClass) + "VO[]");
				/*
				//�½�serviceClass,
				Object serviceClass = coreFactory.buildClass(facade.getName(entityClass)+ "ManageService", thePackage);
				//��ʾserviceClass,
				FigClass serviceFig = new FigClass(serviceClass, new Rectangle(10,10, 20, 20), new DiagramSettings());
				classDiagram.add(serviceFig);
				serviceFig.setName(facade.getName(entityClass) + "ManageService");
				
				//����class������
			 	Model.getExtensionMechanismsHelper().addCopyStereotype(serviceClass,getStereotype(project, "Service") );
		        Model.getExtensionMechanismsHelper().addCopyStereotype(serviceClass,getStereotype(project, "WebService") );
				 */
		        Model.getExtensionMechanismsHelper().addCopyStereotype(entityClass,getStereotype(project, "Entity") );
		        Model.getExtensionMechanismsHelper().addCopyStereotype(entityClass,getStereotype(project, "Manageable") );
		        Model.getExtensionMechanismsHelper().addCopyStereotype(voClass,getStereotype(project, "ValueObject") );
		        
		        //--------------
				
				//�½�������ϵDependency
				coreFactory.buildDependency(serviceClass, entityClass);
				coreFactory.buildDependency(entityClass, voClass);
				
				//ΪvoClass��id
				Object attrType = project.findTypeInModel("long",project.getModel());
				if(attrType==null){	attrType=project.findType("long", false);	}
		        Object attr = coreFactory.buildAttribute2(voClass, attrType);       
		        coreHelper.setName(attr, "id");
		        
		      //ΪserviceClass�ӷ���
		        Object returnType = project.findTypeInModel("void",project.getModel());
				if(returnType==null){	returnType=project.getDefaultReturnType();	}
		       
		        
		        Object createMethod = coreFactory.buildOperation2(serviceClass, attrType, "create"+facade.getName(entityClass) );
		        Object updateMethod = coreFactory.buildOperation2(serviceClass, returnType, "update"+facade.getName(entityClass) );
		        Object delMethod = coreFactory.buildOperation2(serviceClass, returnType, "delete"+facade.getName(entityClass) );
		        
		        Object queryReturnType = project.findTypeInModel(facade.getName(entityClass)+"VO[]",thePackage);
		        Object queryMethod = coreFactory.buildOperation2(serviceClass, queryReturnType, "get"+facade.getName(entityClass) );
		        
		        Object parameterCreate= coreFactory.buildParameter(createMethod, project.findTypeInModel(facade.getName(entityClass)+"VO",thePackage));
		        coreHelper.setName(parameterCreate, facade.getName(entityClass));//ҪСд
		        
		        Object parameterUpdate= coreFactory.buildParameter(updateMethod, project.findTypeInModel(facade.getName(entityClass)+"VO",thePackage));
		        coreHelper.setName(parameterUpdate, facade.getName(entityClass));//ҪСд
		        
		        Object parameterDel= coreFactory.buildParameter(delMethod, attrType);
		        coreHelper.setName(parameterDel, "id");//ҪСд
		        
		        Object parameterQuery1= coreFactory.buildParameter(queryMethod, project.findTypeInModel(facade.getName(entityClass)+"VO",thePackage));
		        coreHelper.setName(parameterQuery1, facade.getName(entityClass));////ҪСд
		       
		        Object intType = project.findTypeInModel("int",project.getModel());
		        Object parameterQuery2= coreFactory.buildParameter(queryMethod, intType);
		        coreHelper.setName(parameterQuery2, "pageNumber");
		        Object parameterQuery3= coreFactory.buildParameter(queryMethod, intType);
		        coreHelper.setName(parameterQuery3, "pageSize");
		        Object stringType = project.findTypeInModel("String",project.getModel());
		        Object parameterQuery4= coreFactory.buildParameter(queryMethod, stringType);
		        coreHelper.setName(parameterQuery4, "orderBy");
		        
		        //ΪentityClass�ӷ���
		        Object returnListType = project.findTypeInModel("List",project.getModel());
		        Object queryStaticMethod = coreFactory.buildOperation2(entityClass, returnListType, "get"+facade.getName(entityClass) );
		        Object parameterQueryStatic1= coreFactory.buildParameter(queryStaticMethod, project.findTypeInModel(facade.getName(entityClass)+"VO",thePackage));
		        coreHelper.setName(parameterQueryStatic1, facade.getName(entityClass));////ҪСд
		       
		        Object parameterQueryStatic2= coreFactory.buildParameter(queryStaticMethod, intType);
		        coreHelper.setName(parameterQueryStatic2, "pageNumber");
		        Object parameterQueryStatic3= coreFactory.buildParameter(queryStaticMethod, intType);
		        coreHelper.setName(parameterQueryStatic3, "pageSize");
		        Object parameterQueryStatic4= coreFactory.buildParameter(queryStaticMethod, stringType);
		        coreHelper.setName(parameterQueryStatic4, "orderBy");
		        coreHelper.setStatic(queryStaticMethod, true);
		        //����associationΪVO������
		        LOG.debug("1111111111");
				
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
				
				//��VO����������Ϊ0..1
		        Collection voAttrs=coreHelper.getAllAttributes(voClass);
				Object[] voAttros=voAttrs.toArray();
				DataTypesFactory dataTypesFactory = Model.getDataTypesFactory();  
				for(int i=0;i<voAttros.length;i++){
					Object voAttr=voAttros[i];
					coreHelper.setMultiplicity(voAttr, dataTypesFactory.createMultiplicity("0..1"));
				}
		        //--------------
			}
//--------------------------			
			ClassdiagramLayouter layouter = new ClassdiagramLayouter(classDiagram);
			layouter.layout();
		}
			}}
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
	private boolean ifHaveClass(String className) {
		Project project = ProjectManager.getManager().getCurrentProject();
		Object ho=project.findTypeInModel("className",project.getModel());
		return !(ho==null);
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
