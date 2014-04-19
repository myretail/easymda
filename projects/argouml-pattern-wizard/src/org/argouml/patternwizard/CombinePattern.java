// $Id: CombinePattern.java 23 2008-11-26 19:48:13Z mvw $
// Copyright (c) 2006-2007, Rene Lindhorst
// All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
// * Redistributions of source code must retain the above copyright
//   notice, this list of conditions and the following disclaimer.
// * Redistributions in binary form must reproduce the above copyright
//   notice, this list of conditions and the following disclaimer in
//   the documentation and/or other materials provided with the
//   distribution.
// Neither the name of the Pattern-Wizard project nor the names of its
// contributors may be used to endorse or promote products derived from
// this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
// COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
// BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
// LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
// ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

/******************************************************************************\
 *                                 PACKAGE NAME                               *
\******************************************************************************/
package org.argouml.patternwizard;

/******************************************************************************\
 *                                IMPORT SECTION                              *
\******************************************************************************/
import java.beans.PropertyVetoException;
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
import org.argouml.model.ModelManagementFactory;
import org.argouml.patternwizard.operations.AttributeAbstract;
import org.argouml.patternwizard.operations.AttributeOperatorMerge;
import org.argouml.patternwizard.operations.AttributeOperatorModify;
import org.argouml.patternwizard.operations.AttributeWrapper;
import org.argouml.patternwizard.operations.ClassAbstract;
import org.argouml.patternwizard.operations.ClassOperatorMerge;
import org.argouml.patternwizard.operations.ClassOperatorModify;
import org.argouml.patternwizard.operations.ClassWrapper;
import org.argouml.patternwizard.operations.MethodAbstract;
import org.argouml.patternwizard.operations.MethodOperatorMerge;
import org.argouml.patternwizard.operations.MethodOperatorModify;
import org.argouml.patternwizard.operations.MethodWrapper;
import org.argouml.patternwizard.operations.ModelElementAbstract;
import org.argouml.patternwizard.operations.RelationAbstract;
import org.argouml.patternwizard.operations.RelationOperatorMerge;
import org.argouml.patternwizard.operations.RelationOperatorModify;
import org.argouml.patternwizard.operations.RelationWrapper;
import org.argouml.ui.targetmanager.TargetManager;
import org.argouml.uml.diagram.ArgoDiagram;
import org.argouml.uml.diagram.DiagramFactory;
import org.argouml.uml.diagram.DiagramFactory.DiagramType;
import org.argouml.uml.diagram.static_structure.layout.ClassdiagramLayouter;
import org.argouml.uml.diagram.static_structure.ui.UMLClassDiagram;
import org.argouml.uml.reveng.DiagramInterface;
import org.tigris.gef.base.Globals;

/******************************************************************************\
 *                               CLASS DEFINITION                             *
\******************************************************************************/
/**
 * This class is responsible for storing all informations about model elements 
 * involved in the combination/transformation and all changes made by the user.
 * 
 * @author Rene Lindhorst
 */
public class CombinePattern
{
   /*------------------------------------------------------------------------*\
    |                    P R I V A T E   A T T R I B U T E S                 |
   \*------------------------------------------------------------------------*/  
    
    /**
     * Logger.
     */
    private static final Logger LOG = Logger.getLogger(CombinePattern.class);
   
    private Collection selectedPattern;
    private Collection resultComponents;
    private Collection relations;;

    private String patternName;

    private ArgoDiagram inputClassDiagram;
    
    private static final String  INPUT_DIAGRAM_ID = "inputClassDiagram";
    
   /*------------------------------------------------------------------------*\
    |                  P R O T E C T E D   A T T R I B U T E S               |
   \*------------------------------------------------------------------------*/
   
   /*------------------------------------------------------------------------*\
    |                    P A C K A G E   A T T R I B U T E S                 |
   \*------------------------------------------------------------------------*/
   
   /*------------------------------------------------------------------------*\
    |                     P U B L I C   A T T R I B U T E S                  |
   \*------------------------------------------------------------------------*/
    
   /*------------------------------------------------------------------------*\
    |                          C O N S T R U C T O R S                       |
   \*------------------------------------------------------------------------*/
   
    /**
     * Creates a new instance of CombinePattern.
     */
    public CombinePattern() {

       selectedPattern = new ArrayList();
       resultComponents = new ArrayList();
       relations = new ArrayList();
       
       setInputClassDiagram(null);
    }
    
   /*------------------------------------------------------------------------*\
    |                     P R O T E C T E D   M E T H O D S                  |
   \*------------------------------------------------------------------------*/
   
   /*------------------------------------------------------------------------*\
    |                       P A C K A G E   M E T H O D S                    |
   \*------------------------------------------------------------------------*/
   
   /*------------------------------------------------------------------------*\
    |                       P R I V A T E   M E T H O D S                    |
   \*------------------------------------------------------------------------*/

    /**
     * Get all relation that belong to the given class operator.
     * 
     * @param classOperator The class operator of which the relations should be returned.
     * @return The relations.
     */
    private Collection getRelations(Object classOperator) {
        
        Collection relationsOfClass = new ArrayList();
    
        // get an iterator for all stored relations
        Iterator relationsIterator = relations.iterator();
        while(relationsIterator.hasNext()) {
            RelationAbstract aRelation = (RelationAbstract)relationsIterator.next();            
            Object classifierA = aRelation.getClassifierA();
            Object classifierB = aRelation.getClassifierB();
            // 
            if ( (classifierA == classOperator) || (classifierB == classOperator) ) 
                relationsOfClass.add(aRelation);
        }
        
        return relationsOfClass;
    }

    /**
     * Add the relations which belong to the given class operator to the relation collection.
     * 
     * @param theClassOperator The class operator of which the relations should be added.
     * @param patternId The ID of the pattern this operator belongs to.
     */
    private void addRelations(Object theClassOperator, String patternId) {

        // create an iterator for all relations of this class
        Iterator relationsIterator = getArgoSourceRelations(((ClassAbstract)theClassOperator).getArgoSourceObjects()).iterator();
        Object relation;
        Object aRelationOperator;
        while(relationsIterator.hasNext()) {  
            // get the next relation
            relation = relationsIterator.next();            
            // get the relation operator of which this relation is the source object (if existing)
            aRelationOperator = getRelationOperator(relation);            
            // if the relation is already in the relations collection (because of another class it belongs to as well)
            if (aRelationOperator != null){
                ((RelationAbstract)aRelationOperator).setClassifierB(theClassOperator); 
            }
            // if it is a new relation
            else {
                // create a new relation wrapper
                aRelationOperator = new RelationWrapper(relation, patternId);  
                ((RelationAbstract)aRelationOperator).setClassifierA(theClassOperator);
                // add the relation to the collection
                relations.add(aRelationOperator);  
            }
        }
    }

    /**
     * Remove the relations which belong to the specified pattern.
     * 
     * @param patternId The ID of the pattern which relations should be removed.
     */
    private void removeRelations(String patternId) {
        // get an iterator for all relations
        Iterator relationsIterator = relations.iterator();
        while (relationsIterator.hasNext()) {
            RelationAbstract aRelationOperator = (RelationAbstract)relationsIterator.next();
            // if the relation belongs to the pattern
            if (aRelationOperator.getPatternId() == patternId) {
                // remove this relation
                relationsIterator.remove();
            }
        }
    }

    /**
     * Get the relation operator for the given relation if the
     * CombinePattern already contains this relation.
     * 
     * @param relation The relation we want to get the operator for.
     * @return The relation operator or null if it doesn't exist.
     */
    private Object getRelationOperator(Object relation) {
        
        Object relationOperator = null;

        // get an iterator for all stored relations
        Iterator relationsIterator = relations.iterator();
        Object includedRelation;
        while(relationsIterator.hasNext()) {
            RelationAbstract includedRelationOperator = (RelationAbstract)relationsIterator.next();
            // get the source object for the stored relation
            includedRelation = includedRelationOperator.getSourceObjects().toArray()[0];
            // if the source objects are the same
            if (relation.equals(includedRelation)) {
                relationOperator = includedRelationOperator;
                break;
            }            
        }
        
        return relationOperator;
    }   
    
    /**
     * Update the relation ends of the stored relation operators. 
     * Replace relation ends to the old class operator with the new one.
     * 
     * @param restoredClassOperator The restored relation end we need to set.
     * @param oldClassOperator The old relation end we need to replace.
     */
    private void updateRelationOperatorsAfterUndo(Object restoredClassOperator, Object oldClassOperator) {
        
        Collection restoredClassOperatorSourceRelations = getArgoSourceRelations(((ClassAbstract)restoredClassOperator).getArgoSourceObjects());

        // get an iterator for all stored relations
        Iterator relationsIterator = relations.iterator();
        while (relationsIterator.hasNext()) {
            RelationAbstract aRelationOperator = (RelationAbstract)relationsIterator.next();

            // update the relation ends of the stored relation if necessary (make sure it's the correct class)
            if ( (aRelationOperator.getClassifierA() == oldClassOperator) &&
                    containsSimilarElements(aRelationOperator.getArgoSourceObjects(), restoredClassOperatorSourceRelations) )
                aRelationOperator.setClassifierA(restoredClassOperator);
            if ( (aRelationOperator.getClassifierB() == oldClassOperator) && 
                    containsSimilarElements(aRelationOperator.getArgoSourceObjects(), restoredClassOperatorSourceRelations) )
                aRelationOperator.setClassifierB(restoredClassOperator);
        }
    }
 
    /**
     * Update the relation ends of the stored relation operators after a Modification or Merge. 
     * Replace relation ends to the old class operator with the new one.
     * 
     * @param newClassOperator The new relation end we need to set.
     * @param oldClassOperator The old relation end we need to replace.
     */
    private void updateRelationOperatorsAfterTransform(Object newClassOperator, Object oldClassOperator) {
            
        // get an iterator for all stored relations
        Iterator relationsIterator = relations.iterator();
        // run through all of them
        while (relationsIterator.hasNext()) {
            RelationAbstract aRelationOperator = (RelationAbstract)relationsIterator.next();

            // update the relation ends of the stored relation if necessary (make sure it's the correct class)
            if (aRelationOperator.getClassifierA() == oldClassOperator)
                aRelationOperator.setClassifierA(newClassOperator);
            if (aRelationOperator.getClassifierB() == oldClassOperator)
                aRelationOperator.setClassifierB(newClassOperator);
        }
    }
    
    /**
     * Get all ArgoUML relation objects which belong to the given classes.
     * 
     * @param theClasses The classes for which the relation object should be retrieved.
     * @return The ArgoUML relation objects.
     */
    private Collection getArgoSourceRelations(Collection theClasses) {       
        
        // temporary Collection for the relations belonging to the given class
        Collection relationsCollection = new ArrayList();  
        
        Iterator classes = theClasses.iterator();
        while(classes.hasNext()) { 
            Object theClass = classes.next();
        
            // get all generalizations and abstractions/dependencies of this class
            // and add them to a temporary collection   
            relationsCollection.addAll(Model.getFacade().getGeneralizations(theClass));
            relationsCollection.addAll(Model.getFacade().getSpecializations(theClass));        
            relationsCollection.addAll(Model.getFacade().getClientDependencies(theClass));
            relationsCollection.addAll(Model.getFacade().getSupplierDependencies(theClass));
            
            // get all assoiciation ends of this class        
            Iterator associationEndsIterator = Model.getFacade().getAssociationEnds(theClass).iterator();
            Object association;
            while(associationEndsIterator.hasNext()) {    
                // get the association this association end belongs to
                association = Model.getFacade().getAssociation(associationEndsIterator.next());
                // add the association to the collection
                relationsCollection.add(association);            
            }  
        }
        
        return relationsCollection;
    }    
    
    /**
     * Undo all merges of the given classes with other classes.
     * 
     * @param componentArray The classes on which merges should be undone.
     * @param id The ID of the package the classes belong to.
     */
    private void undoAllComponentMerges(Object[] componentArray, String id) { 
        for (int i=0; i<componentArray.length; i++) {
            ClassAbstract aClassOperator = (ClassAbstract)componentArray[i];
            Collection thePatternIds = aClassOperator.getPatternIds();
            // if the class belongs to the pattern and it was the result of a merge
            while ( (thePatternIds.contains(id)) && (thePatternIds.size() > 1) ) {
                Iterator sourceObjectsIterator = aClassOperator.getSourceObjects().iterator();
                // undo the last change
                undoComponentChanges(aClassOperator);
                // find the source class that belongs to the pattern
                while (sourceObjectsIterator.hasNext()) {
                    aClassOperator = (ClassAbstract)sourceObjectsIterator.next();                        
                    thePatternIds = aClassOperator.getPatternIds();
                    if (thePatternIds.contains(id)) 
                        break;
                    
                }
            }                    
        }
    }

    /**
     * This methode returns the stereotype all pattern are marked with. 
     * If the <<Pattern>>-stereotype is not present, it will be created.
     * 
     * @param project
     * @return the pattern-stereotype
     */
    private Object getPatternStereotype(Project project) {
        
        // identify all existing stereotypes
        Iterator stereotypeIterator = Model.getModelManagementHelper().getAllModelElementsOfKindWithModel(
                        project.getModel(), Model.getMetaTypes().getStereotype()).iterator();
        Object stereotype = null;
        // run through all stereotypes
        while (stereotypeIterator.hasNext()) {
            stereotype = stereotypeIterator.next();                
            // in case it is the <<Pattern>>-Stereotype (name == "Pattern" and base class == "Package")
            if ( Constants.PATTERN_STEREOTYPE_NAME.equals(Model.getFacade().getName(stereotype)) 
                    && Model.getFacade().getBaseClasses(stereotype).contains(Constants.PATTERN_STEREOTYPE_BASE_CLASS))
                // stop searching
                break;                
        }
        // if the stereotype wasn't found
        if (stereotype == null) {
            // create the stereotype
            stereotype = Model.getExtensionMechanismsFactory().buildStereotype(
                              Constants.PATTERN_STEREOTYPE_NAME, project.getModel());
            // set its base class
            Model.getExtensionMechanismsHelper().addBaseClass(stereotype, Constants.PATTERN_STEREOTYPE_BASE_CLASS);
        }
        
        return stereotype;
    }    

    /**
     * Mark all components that need the users attention.
     * Currently it is only checked if names are used twice.
     */
    private void markComponents() { 
        
        // run through all components and remove the marking
        Iterator componentsIterator = resultComponents.iterator();        
        while (componentsIterator.hasNext()) {
            Object aComponent = componentsIterator.next();
            ((ModelElementAbstract)aComponent).setAttentionNeeded(false);
        }
        
        // run through all components
        componentsIterator = resultComponents.iterator();        
        while (componentsIterator.hasNext()) {
            Object aComponent = componentsIterator.next();
            String aComponentName = ((ModelElementAbstract)aComponent).getName();
            // run through all components
            Iterator components = resultComponents.iterator();        
            while (components.hasNext()) {
                Object anotherComponent = components.next();
                String anotherComponentName = ((ModelElementAbstract)anotherComponent).getName();
                // if both names are the same and it's not the same component
                if ( !(anotherComponent.equals(aComponent)) && (anotherComponentName.equals(aComponentName)) ) {
                    ((ModelElementAbstract)aComponent).setAttentionNeeded(true);
                    ((ModelElementAbstract)anotherComponent).setAttentionNeeded(true);
                }
            }
        }
    }
    
    /**
     * Mark all attributes that need the user attention.
     * Currently it is only checked if names are used twice.
     * 
     * @param owner The class of which the attributes should be checked.
     */
    private void markAttributes(Object owner) { 
        
        // get the attributes of the pattern
        Iterator attributesIterator = ((ClassAbstract)owner).getAttributes().iterator(); 
        // run through all attributes and remove the marking
        while (attributesIterator.hasNext()) {      
            Object aAttribute = attributesIterator.next();
            ((ModelElementAbstract)aAttribute).setAttentionNeeded(false);
        }
        
        // run through all attributes
        attributesIterator = ((ClassAbstract)owner).getAttributes().iterator();         
        while (attributesIterator.hasNext()) {
            Object aAttribute = attributesIterator.next();
            String aAttributeName = ((ModelElementAbstract)aAttribute).getName();
            // run through all attributes
            Iterator attributes = ((ClassAbstract)owner).getAttributes().iterator();         
            while (attributes.hasNext()) {
                Object anotherAttribute = attributes.next();
                String anotherAttributeName = ((ModelElementAbstract)anotherAttribute).getName();
                // if both names are the same and it's not the same attribute
                if ( !(anotherAttribute.equals(aAttribute)) && (anotherAttributeName.equals(aAttributeName)) ) {
                    ((ModelElementAbstract)aAttribute).setAttentionNeeded(true);
                    ((ModelElementAbstract)anotherAttribute).setAttentionNeeded(true);
                }
            }
        }
    }
    
    /**
     * Mark all methods that need the user attention.
     * Currently it is only checked if names are used twice.
     * 
     * @param owner The class of which the methods should be checked.
     */
    private void markMethods(Object owner) { 
        
        // get the methods of the pattern
        Iterator methodsIterator = ((ClassAbstract)owner).getMethods().iterator(); 
        // run through all methods and remove the marking
        while (methodsIterator.hasNext()) {      
            Object aMethods = methodsIterator.next();
            ((ModelElementAbstract)aMethods).setAttentionNeeded(false);
        }
        
        // run through all methods
        methodsIterator = ((ClassAbstract)owner).getMethods().iterator();         
        while (methodsIterator.hasNext()) {
            Object aMethods = methodsIterator.next();
            String aMethodsName = ((ModelElementAbstract)aMethods).getName();
            // run through all methods
            Iterator methods = ((ClassAbstract)owner).getMethods().iterator();         
            while (methods.hasNext()) {
                Object anotherMethod = methods.next();
                String anotherMethodName = ((ModelElementAbstract)anotherMethod).getName();
                // if both names are the same and it's not the same methods
                if ( !(anotherMethod.equals(aMethods)) && (anotherMethodName.equals(aMethodsName)) ) {
                    ((ModelElementAbstract)aMethods).setAttentionNeeded(true);
                    ((ModelElementAbstract)anotherMethod).setAttentionNeeded(true);
                }
            }
        }
    }
    
    /**
     * Mark all relations that need the user attention.
     * Currently it is only checked if there are relations pointing to the same classifiers.
     */
    private void markRelations() { 
        
        // run through all relations and remove the marking
        Iterator relationsIterator = relations.iterator();        
        while (relationsIterator.hasNext()) {
            Object aRelation = relationsIterator.next();
            ((ModelElementAbstract)aRelation).setAttentionNeeded(false);
        }
        // run through all relations
        relationsIterator = relations.iterator();        
        while (relationsIterator.hasNext()) {
            Object aRelation = relationsIterator.next();
            Object aRelationClassifierA = ((RelationAbstract)aRelation).getClassifierA();
            Object aRelationClassifierB = ((RelationAbstract)aRelation).getClassifierB();
            // run through all relations
            Iterator allRelations = relations.iterator();        
            while (allRelations.hasNext()) {
                Object anotherRelation = allRelations.next();
                Object anotherRelationClassifierA = ((RelationAbstract)anotherRelation).getClassifierA();
                Object anotherRelationClassifierB = ((RelationAbstract)anotherRelation).getClassifierB();
                // if both relations have the same classifiers
                if ( !(anotherRelation.equals(aRelation))
                        && ( ((aRelationClassifierA.equals(anotherRelationClassifierA)) && (aRelationClassifierB.equals(anotherRelationClassifierB))) 
                                || ((aRelationClassifierA.equals(anotherRelationClassifierB)) && (aRelationClassifierB.equals(anotherRelationClassifierA))) ) ) {
                    ((ModelElementAbstract)aRelation).setAttentionNeeded(true);
                    ((ModelElementAbstract)anotherRelation).setAttentionNeeded(true);
                }
            }
        }
    }

    /**
     * Create a new ArgoUML class model element.
     * 
     * @param thePackage The package within which the class should be created.
     * @param aClass The class wrapper or class operator which contains the properties of the class to be created.
     * @return The newly created class.
     */
    private Object createClass(Object thePackage, Object aClass) {
        
        Object newClass;
        // get the source class (the first one)
        Object srcClass = ((ClassAbstract)aClass).getArgoSourceObjects().toArray()[0];
        
        // get some needed helper classes
        CoreHelper coreHelper = Model.getCoreHelper();
        CopyHelper copyHelper = Model.getCopyHelper();        
        
        // copy the source class into the package (we can't use the existing one because it would move the class)
        newClass = copyHelper.copy(srcClass, thePackage);        
        
        // set the name of the class
        coreHelper.setName(newClass, ((ClassAbstract)aClass).getName());
        
        // set other properties;
        addAllStereotypes(newClass, ((ClassAbstract)aClass).getStereotypes());        
            
        /*** create the attributes ***/
        // get the attributes of the new pattern
        Iterator attributesIterator = ((ClassAbstract)aClass).getAttributes().iterator(); 
        Object newAttribute;
        // run through all attributes
        while (attributesIterator.hasNext()) {               
            
            newAttribute = createAttribute(newClass, attributesIterator.next());

            // add the attribute to the class
            coreHelper.addFeature(newClass, newAttribute);               
        }
        
        /*** create the methods ***/
        // get the methods of the new pattern
        Iterator methodsIterator = ((ClassAbstract)aClass).getMethods().iterator(); 
        Object newMethod;
        // run through all methods
        while (methodsIterator.hasNext()) {

            newMethod = createMethod(newClass, methodsIterator.next());
        
            // add the method to the class
            coreHelper.addFeature(newClass, newMethod);
        }
        
        return newClass;        
    }
    
    /**
     * Create a new ArgoUML attribute model element.
     * 
     * @param newClass The class the attribute belongs to.
     * @param aAttribute The attribute wrapper or attribute operator which contains the properties of the attribute to be created.
     * @return The newly created attribute.
     */
    private Object createAttribute(Object newClass, Object aAttribute) {
        
        Object newAttribute;
        Object srcAttribute = ((AttributeAbstract)aAttribute).getArgoSourceObjects().toArray()[0];
        
        // get some needed helper classes
        CoreHelper coreHelper = Model.getCoreHelper();
        CoreFactory coreFactory = Model.getCoreFactory();
        Facade facade = Model.getFacade();
        DataTypesFactory dataTypesFactory = Model.getDataTypesFactory(); 
        
        // get the current project
        Project project = ProjectManager.getManager().getCurrentProject();
        // get the model
        Object model = project.getModel();
        
        newAttribute = coreFactory.buildAttribute(model, facade.getType(srcAttribute));
        
        /*** set the properties ***/
        // set the name
        coreHelper.setName(newAttribute, ((AttributeAbstract)aAttribute).getName()); 
        // set the multiplicity (1, 0..1, 0..* or 1..*)
        Object multiplicity = dataTypesFactory.createMultiplicity(facade.toString(facade.getMultiplicity(srcAttribute)));
        coreHelper.setMultiplicity(newAttribute, multiplicity); 
        // set the visibility (public, private, protected or package)
        coreHelper.setVisibility(newAttribute, facade.getVisibility(srcAttribute));
        // set the changebility (addOnly, changeable or frozen)
        coreHelper.setChangeability(newAttribute, facade.getChangeability(srcAttribute));
        // set the modifier (static or not static)
        coreHelper.setStatic(newAttribute, facade.isStatic(srcAttribute));
        // set the initial value
        coreHelper.setInitialValue(newAttribute, facade.getInitialValue(srcAttribute));
        
        // set all contraints
        Iterator srcAttributeContraints = facade.getConstraints(srcAttribute).iterator();
        while (srcAttributeContraints.hasNext()) {
            coreHelper.addConstraint(newAttribute, srcAttributeContraints.next()); 
        }
        
        // set all stereotypes
        addAllStereotypes(newAttribute, ((AttributeAbstract)aAttribute).getStereotypes());
        
        return newAttribute;
    }
    
    /**
     * Create a new ArgoUML method model element.
     * 
     * @param newClass The class the method belongs to.
     * @param aMethod The method wrapper or method operator which contains the properties of the method to be created.
     * @return The newly created method.
     */
    private Object createMethod(Object newClass, Object aMethod) {
        
        Object newMethod;
        Object srcMethod = ((MethodAbstract)aMethod).getArgoSourceObjects().toArray()[0];
        
        // get some needed helper and factory classes
        CoreHelper coreHelper = Model.getCoreHelper();
        CoreFactory coreFactory = Model.getCoreFactory();
        Facade facade = Model.getFacade();
        
        // get the current project
        Project project = ProjectManager.getManager().getCurrentProject();
        
        // get the return parameters of the operation
        Collection srcMethodeReturnParams = coreHelper.getReturnParameters(srcMethod);
        Object srcMethodeReturnType;
        // if there are return parameters
        if (!srcMethodeReturnParams.isEmpty()) {
            // get the type of the first parameter
            srcMethodeReturnType = facade.getType(srcMethodeReturnParams.toArray()[0]);
        } else {
            // the return type is void
            srcMethodeReturnType = project.findType("void");
        }

        // create a operation
        newMethod = coreFactory.buildOperation2(newClass, srcMethodeReturnType, ((MethodAbstract)aMethod).getName());

        /*** set the properties ***/
        // set the visibility (public, private, protected or package)
        coreHelper.setVisibility(newMethod, facade.getVisibility(srcMethod));
        // set the modifiers (abstract, leaf, root, query, static)
        coreHelper.setAbstract(newMethod, facade.isAbstract(srcMethod));  
        coreHelper.setLeaf(newMethod, facade.isLeaf(srcMethod));  
        coreHelper.setRoot(newMethod, facade.isRoot(srcMethod));  
        coreHelper.setQuery(newMethod, facade.isQuery(srcMethod));  
        coreHelper.setStatic(newMethod, facade.isStatic(srcMethod));                 
        // set the concurrency (guarded, sequential or concurrent)
        coreHelper.setConcurrency(newMethod, facade.getConcurrency(srcMethod));
        
        // set all contraints
        Iterator srcMethodContraints = facade.getConstraints(srcMethod).iterator();
        while (srcMethodContraints.hasNext()) {
            coreHelper.addConstraint(newMethod, srcMethodContraints.next()); 
        }
        
        // set all stereotypes
        addAllStereotypes(newMethod, ((MethodAbstract)aMethod).getStereotypes());
        
        return newMethod;
    }
    
    /**
     * Find the original association end of the relation that is connected to the classifier.
     * 
     * @param relation The relation wrapper or relation operator of the original relation.
     * @param classifier The class of which the connected association end should be returned.
     * @return The original association end.
     */
    private Object getOriginalAssociationEnd(RelationAbstract relation, ClassAbstract classifier) {
        
        Facade facade = Model.getFacade();
        
        Iterator srcRelations = relation.getArgoSourceObjects().iterator();
        while(srcRelations.hasNext()) {        
            Object aSrcRelation = srcRelations.next();
            
            Iterator srcClassifier = classifier.getArgoSourceObjects().iterator();
            while(srcClassifier.hasNext()) {
                Object aSrcClassifier = srcClassifier.next();
                
                Object originalAssociationEnd = facade.getAssociationEnd(aSrcClassifier, aSrcRelation);
                if(originalAssociationEnd != null)
                    return originalAssociationEnd;
            }
        }

        return null;        
    }
    
    /**
     * Create all ArgoUML relation model elements.
     * 
     * @param thePackage The package within which the relations should be created.
     * @return The newly created relations.
     */
    private Collection createRelations(Object thePackage) {
        
        ArrayList relations = new ArrayList();
        
        // get some needed helper classes and factory classes
        CoreHelper coreHelper = Model.getCoreHelper();  
        CoreFactory coreFactory = Model.getCoreFactory();
        
        Facade facade = Model.getFacade();
        
        // get the relations of the new pattern
        Iterator relationsIterator = getRelations().iterator(); 
        // run through all relations
        while (relationsIterator.hasNext()) {               
            
            RelationAbstract aRelation = (RelationAbstract)relationsIterator.next();
            
            Object newRelation = null;
            // get the source relation (the first one)
            Object srcRelation = aRelation.getArgoSourceObjects().toArray()[0];
            
            Object destinationClassifierA = ((ClassAbstract)aRelation.getClassifierA()).getDestinationObject();
            Object destinationClassifierB = ((ClassAbstract)aRelation.getClassifierB()).getDestinationObject();
            
            // if the relation is a association (includes aggregations as well)
            if(aRelation.isAAssociation()) {             
                newRelation = coreFactory.buildAssociation(destinationClassifierA, destinationClassifierB);  
                
                DataTypesFactory dataTypesFactory = Model.getDataTypesFactory();                
                // set modifiers of the association
                coreHelper.setAbstract(newRelation, facade.isAbstract(srcRelation));
                coreHelper.setLeaf(newRelation, facade.isLeaf(srcRelation));
                coreHelper.setRoot(newRelation, facade.isRoot(srcRelation));
                   
                Object originalAssociationEndA = getOriginalAssociationEnd(aRelation, (ClassAbstract)aRelation.getClassifierA());
                Object associationEndA = facade.getAssociationEnd(destinationClassifierA, newRelation);                
                
                // set the properties of the first association end 
                coreHelper.setName(associationEndA, aRelation.getAssociationRoleA());
                coreHelper.setMultiplicity(associationEndA, dataTypesFactory.createMultiplicity(aRelation.getAssociationRoleAMultiplicity()));                
                addAllStereotypes(associationEndA, facade.getStereotypes(originalAssociationEndA));
                coreHelper.setNavigable(associationEndA, facade.isNavigable(originalAssociationEndA));
                coreHelper.setOrdering(associationEndA, facade.getOrdering(originalAssociationEndA));
                coreHelper.setAggregation(associationEndA, facade.getAggregation(originalAssociationEndA));
                coreHelper.setTargetScope(associationEndA, facade.getTargetScope(originalAssociationEndA));
                coreHelper.setChangeability(associationEndA, facade.getChangeability(originalAssociationEndA));
                coreHelper.setVisibility(associationEndA, facade.getVisibility(originalAssociationEndA));                
                   
                Object originalAssociationEndB = getOriginalAssociationEnd(aRelation, (ClassAbstract)aRelation.getClassifierB());
                Object associationEndB = facade.getAssociationEnd(destinationClassifierB, newRelation);                
                
                // set the properties of the second association end 
                coreHelper.setName(associationEndB, aRelation.getAssociationRoleB());
                coreHelper.setMultiplicity(associationEndB, dataTypesFactory.createMultiplicity(aRelation.getAssociationRoleBMultiplicity()));
                addAllStereotypes(associationEndB, facade.getStereotypes(originalAssociationEndB));
                coreHelper.setNavigable(associationEndB, facade.isNavigable(originalAssociationEndB));
                coreHelper.setOrdering(associationEndB, facade.getOrdering(originalAssociationEndB));
                coreHelper.setAggregation(associationEndB, facade.getAggregation(originalAssociationEndB));
                coreHelper.setTargetScope(associationEndB, facade.getTargetScope(originalAssociationEndB));
                coreHelper.setChangeability(associationEndB, facade.getChangeability(originalAssociationEndB));
                coreHelper.setVisibility(associationEndB, facade.getVisibility(originalAssociationEndB));                
            }
            // if it is a generalization
            else if (aRelation.isAGeneralization()) {
                newRelation = coreFactory.buildGeneralization(destinationClassifierB, destinationClassifierA);
                // set powertype and discriminator
                coreHelper.setPowertype(newRelation, facade.getPowertype(srcRelation));
                coreHelper.setDiscriminator(newRelation, (String)facade.getDiscriminator(srcRelation));
            }
            // if it is a dependency
            else if (aRelation.isADependency()) {
                newRelation = coreFactory.buildDependency(destinationClassifierB, destinationClassifierA);
            }
            // if it is a abstraction (realization)
            else if (aRelation.isAAbstraction()) {
                newRelation = coreFactory.buildAbstraction("", destinationClassifierB, destinationClassifierA);
            }
            
            // set the properties of the ralation
            coreHelper.setName(newRelation, aRelation.getName());
            addAllStereotypes(newRelation, aRelation.getStereotypes());
            // TODO: How to implement next line??
//            coreHelper.setTaggedValues(newRelation, facade.getTaggedValuesCollection(srcRelation));
            
            // add the newly created relation to the collection, so that we cann add them later to the diagram
            relations.add(newRelation);
        }
        
        return relations;
    }
    
    /**
     * Add the given stereotypes to the given model element
     * 
     * @param modelElement The model element the stereotypes have to be added.
     * @param stereotypes The stereotypes that should be added.
     */
    private void addAllStereotypes(Object modelElement, Collection stereotypes) {
        // get the model that belongs to the model element
        Object model = Model.getFacade().getModelElement(modelElement);
        
        Iterator stereotypesIterator = stereotypes.iterator(); 
        // run through all stereotypes
        while (stereotypesIterator.hasNext()) {   
            // get the stereotype to add
            Object stereotype = stereotypesIterator.next();
//            // create a "copy" of the stereotype
//            Object stereotypeCopy = Model.getModelManagementHelper().getCorrespondingElement(stereotype, model, true);
            // add the stereotype to the model element
//            Model.getCoreHelper().addStereotype(modelElement, stereotypeCopy);
            Model.getCoreHelper().addStereotype(modelElement, stereotype);
        }        
    }
    
   /*------------------------------------------------------------------------*\
    |                       P U B L I C    M E T H O D S                     |
   \*------------------------------------------------------------------------*/

    /**
     * @return The input or source pattern for this new pattern.
     */
    public Collection getSourcePattern() {
            return selectedPattern;
    }

    /**
     * Add a pattern to the source patterns for the transformation.
     *  
     * @param patternToAdd The pattern to add.
     */
    public void addSourcePattern(Object patternToAdd) {

        // if the pattern we want to add isn't already one of the source pattern
        if(!selectedPattern.contains(patternToAdd)) {
            // get the UUID of this pattern
            String patternId = Model.getFacade().getUUID(patternToAdd);

            // add the pattern
            selectedPattern.add(patternToAdd);        

            // get all the children of the pattern package
            Iterator children = Model.getFacade().getOwnedElements(patternToAdd).iterator();
            Object aChild;
            ClassAbstract aClassWrapper;
            // run through all the children
            while(children.hasNext()){
                aChild = children.next();
                // if the child is a class
                if(Model.getFacade().isAClass(aChild)) { 
                    // create a ClassWrapper with this class
                    aClassWrapper = new ClassWrapper(aChild, patternId);
                    // and store it in resultComponents
                    resultComponents.add(aClassWrapper);
                    //
                    addRelations(aClassWrapper, patternId); 
                }
            }             
            
            // mark all relations that need the attention of the user
            markRelations();
        }
    }
    
    /**
     * Remove a pattern and all its components and relations from the source patterns.
     * 
     * @param patternToRemove The pattern to remove.
     */
    public void removeSourcePattern(Object patternToRemove) {

        // if the pattern we want to remove is one of the source pattern
        if (selectedPattern.contains(patternToRemove)) {

            String patternId = Model.getFacade().getUUID(patternToRemove);

            //remove the pattern 
            selectedPattern.remove(patternToRemove);

            /** make sure that no component of the pattern is merged with another one **/
            LOG.debug("prepare remove of source pattern");
            undoAllComponentMerges(resultComponents.toArray(), patternId);            

            /** remove the pattern components **/
            // get an iterator for all classes
            Iterator componentsIterator = resultComponents.iterator();
            // run through all of them
            while (componentsIterator.hasNext()) {
                ClassAbstract aClassOperator = (ClassAbstract)componentsIterator.next();
                Collection thePatternIds = aClassOperator.getPatternIds();
                // if the class belongs to the pattern
                if (thePatternIds.contains(patternId))
                    // remove this class
                    componentsIterator.remove();
            }             

            removeRelations(patternId);
        }
    }

    /**
     * Set the relations that belong to the source pattern.
     * 
     * @param relations The relations to set.
     */
    public void setRelations(Collection relations) {
        this.relations = relations;
    }

    /**
     * Get the relations that belong to the source pattern.
     * 
     * @return The relations.
     */
    public Collection getRelations() {
        return relations;
    }
    
    /**
     * Add the classes the user has selected to transform.
     * 
     * @param inputClasses The selected classes to transform.
     * @param inputClassDiagram The diagram the classes belong to.
     */
    public void addInputClasses(Collection inputClasses, ArgoDiagram inputClassDiagram) {       
        LOG.debug("*** addInputClasses ***");
        // if something was selected that can be added
        if ( (inputClassDiagram != null) && (!inputClasses.isEmpty()) ) {
            // remove the old input classes
            removeInputClasses();
            
            LOG.debug("-- diagram: " + inputClassDiagram.getName());
            
            setInputClassDiagram(inputClassDiagram); 
            
            // get the ID of the diagram the classes to transform belong to
            String diagramId = INPUT_DIAGRAM_ID; 

            // get an iterator for the input classes
            Iterator children = inputClasses.iterator();
            Object aClass;
            ClassAbstract aClassWrapper;
            // run through all the classes
            while(children.hasNext()){
                aClass = children.next();
                // if it is a class
                if(Model.getFacade().isAClass(aClass)) { 
                    // create a ClassWrapper with this class
                    aClassWrapper = new ClassWrapper(aClass, diagramId);
                    // and store it in resultComponents
                    resultComponents.add(aClassWrapper);
                    // add the relations that belong to this class
                    addRelations(aClassWrapper, diagramId);
                }
            }            
        }
    }

    /**
     * Remove the classes the user has selected to transform before.
     */
    public void removeInputClasses() {        
        // if a input diagram for transformation was set before
        if (getInputClassDiagram() != null) {
        
            // get the ID of the diagram the classes to remove belong to
            String diagramId = getInputClassDiagramId();
    
            setInputClassDiagram(null);
            
            // make sure that no input class is merged with another class
            LOG.debug("prepare remove of the input classses");
            undoAllComponentMerges(resultComponents.toArray(), diagramId);  
            
            // remove the input classes
            Iterator components = resultComponents.iterator();
            while(components.hasNext()){                
                ClassAbstract aClassOperator = (ClassAbstract)components.next();
                Collection thePatternIds = aClassOperator.getPatternIds();
                // if the class belongs to the pattern
                if (thePatternIds.contains(diagramId))
                    // remove this class
                    components.remove();
            }             
        }
    }
    
    /**
     * @return The ArgoDiagram object the input class belong to.
     */
    public ArgoDiagram getInputClassDiagram() {
        return inputClassDiagram;
    }
    
    /**
     * Set the ArgoDiagram object the input class belong to.
     * 
     * @param inputClassDiagram The inputClassDiagram to set.
     */
    public void setInputClassDiagram(ArgoDiagram inputClassDiagram) {
        this.inputClassDiagram = inputClassDiagram;
    }

    /**
     * @return The ID of the input class diagram.
     */
    public String getInputClassDiagramId() {
        return INPUT_DIAGRAM_ID;
    }
 
    /**
     * Get the name of the new Pattern.
     * 
     * @return Returns the pattern name.
     */
    public String getPatternName() {
        return patternName;
    }

    /**
     * Set the name of the new Pattern.
     * 
     * @param patternName The name to set.
     */
    public void setPatternName(String patternName) {
        this.patternName = patternName;
    }

    /**
     * Merge two components to a new component with the name of the first (index) one.
     * 
     * @param componentsToMerge The components which should be merged together.
     */
    public void mergeComponents(Collection componentsToMerge) {
        
        ClassOperatorMerge newOperator = new ClassOperatorMerge();
            
        Iterator componentsIterator = componentsToMerge.iterator();
        while (componentsIterator.hasNext()) {
            Object aOperator = componentsIterator.next();
            newOperator.addSourceObject(aOperator);
            resultComponents.remove(aOperator);
            
            updateRelationOperatorsAfterTransform(newOperator, aOperator);
        }
        
        resultComponents.add(newOperator);
        
        // mark all relations that need the attention of the user
        markRelations();
    }
    
    /**
     * Merge two attributes to a new attribute with the name of the first (index) one.
     * 
     * @param attributesToMerge The attributes which should be merged together.
     * @param owner The class the attributes belong to.
     */
    public void mergeAttributes(Collection attributesToMerge, Object owner) {  
        
        AttributeOperatorMerge newOperator = new AttributeOperatorMerge();
            
        Iterator attributesIterator = attributesToMerge.iterator();
        while (attributesIterator.hasNext()) {
            Object aOperator = attributesIterator.next();
            newOperator.addSourceObject(aOperator);
            ((ClassAbstract)owner).removeAttribute(aOperator);
        }
        
        ((ClassAbstract)owner).addAttribute(newOperator);
    }
    
    /**
     * Merge two methodes to a new methode with the name of the first (index) one.
     * 
     * @param methodesToMerge The methods which should be merged together.
     * @param owner The class the methods belong to.
     */
    public void mergeMethods(Collection methodesToMerge, Object owner) {  
        
        MethodOperatorMerge newOperator = new MethodOperatorMerge();
            
        Iterator methodesIterator = methodesToMerge.iterator();
        while (methodesIterator.hasNext()) {
            Object aOperator = methodesIterator.next();
            newOperator.addSourceObject(aOperator);
            ((ClassAbstract)owner).removeMethod(aOperator);
        }
        
        ((ClassAbstract)owner).addMethod(newOperator);
    }

    /**
     * Merge two relations to a new relation with the name of the first (index) one.
     * 
     * @param relationsToMerge The relations which should be merged together.
     */
    public void mergeRelations(Collection relationsToMerge) {
        RelationOperatorMerge newOperator = new RelationOperatorMerge();
        
        Iterator relationsIterator = relationsToMerge.iterator();
        while (relationsIterator.hasNext()) {
            Object aOperator = relationsIterator.next();
            newOperator.addSourceObject(aOperator);
            relations.remove(aOperator);
        }
        
        relations.add(newOperator);
        
        // mark all relations that need the attention of the user
        markRelations();
    }

    /**
     * Change the name and the assigned stereotypes of the given class.
     * 
     * @param sourceComponent The class to modify.
     * @param name The new name to set.
     * @param stereotypes The new stereotypes to set.
     */
    public void modifyComponent(Object sourceComponent, String name, Collection stereotypes) {
        
        ClassOperatorModify newOperator = new ClassOperatorModify();
            
        // set the new values
        newOperator.addSourceObject(sourceComponent);
        newOperator.setName(name);
        newOperator.setStereotypes(stereotypes);
            
        // remove the old operator and add the new one
        resultComponents.remove(sourceComponent);
        resultComponents.add(newOperator);
        
        updateRelationOperatorsAfterTransform(newOperator, sourceComponent);
        
        // mark all components that need the attention of the user
        markComponents();
    }
    
    /**
     * Change the name and the assigned stereotypes of the given attribute.
     * 
     * @param owner The class the attribute belongs to.
     * @param sourceAttribute The attribute to modify.
     * @param name The new name to set.
     * @param stereotypes The new stereotypes to set.
     */
    public void modifyAttribute(Object owner, Object sourceAttribute, String name, Collection stereotypes) {
        
        AttributeOperatorModify newOperator = new AttributeOperatorModify();
        
        // set the new values
        newOperator.addSourceObject(sourceAttribute);
        newOperator.setName(name);
        newOperator.setStereotypes(stereotypes);
        
        // remove the old operator and add the new one
        ((ClassAbstract)owner).removeAttribute(sourceAttribute);
        ((ClassAbstract)owner).addAttribute(newOperator);
        
        // mark all attributes that need the attention of the user
        markAttributes(owner);
    }
    
    /**
     * Change the name and the assigned stereotypes of the given method.
     * 
     * @param owner The class the method belongs to.
     * @param sourceMethod The method to modify.
     * @param name The new name to set.
     * @param stereotypes The new stereotypes to set.
     */
    public void modifyMethod(Object owner, Object sourceMethod, String name, Collection stereotypes) {
        
        MethodOperatorModify newOperator = new MethodOperatorModify();
        
        // set the new values
        newOperator.addSourceObject(sourceMethod);
        newOperator.setName(name);
        newOperator.setStereotypes(stereotypes);
        
        // remove the old operator and add the new one
        ((ClassAbstract)owner).removeMethod(sourceMethod);
        ((ClassAbstract)owner).addMethod(newOperator);
        
        // mark all methods that need the attention of the user
        markMethods(owner);
    }
    
    /**
     * Change the name, the assigned stereotypes, the roles and the multiplicities of the given relation.
     * 
     * @param sourceRelation The attribute to modify.
     * @param name The new name to set.
     * @param stereotypes The new stereotypes to set.
     * @param roleA The new role to set.
     * @param roleAMultiplicity The new multiplicity to set.
     * @param roleB The new role to set.
     * @param roleBMultiplicity The new multiplicity to set.
     */
    public void modifyRelation(Object sourceRelation, String name, Collection stereotypes, String roleA, String roleAMultiplicity, String roleB, String roleBMultiplicity) {
        
        RelationOperatorModify newOperator = new RelationOperatorModify();
        
        // set the new values
        newOperator.addSourceObject(sourceRelation);
        newOperator.setName(name);
        newOperator.setStereotypes(stereotypes);
        newOperator.setAssociationRoleA(roleA);
        newOperator.setAssociationRoleB(roleB);
        newOperator.setAssociationRoleAMultiplicity(roleAMultiplicity);
        newOperator.setAssociationRoleBMultiplicity(roleBMultiplicity);
        
        // remove the old operator and add the new one
        relations.remove(sourceRelation);
        relations.add(newOperator);
    }
    
    /**
     * Duplicate a given class and all relations to this class.
     * 
     * @param component The class to duplicate.
     */
    public void duplicateComponent(Object component) {

        ClassAbstract componentCopy = (ClassAbstract)((ClassAbstract)component).clone();

        resultComponents.add(componentCopy);
        
        // mark both components because one of them needs to be renamed
        ((ClassAbstract)component).setAttentionNeeded(true);
        componentCopy.setAttentionNeeded(true);
    
      // now search all relations for the occurence of the old operator, clone them and
      // replace the old operator with the new one
      Iterator oldRelations = getRelations(component).iterator();
      while (oldRelations.hasNext()) {
          RelationAbstract oldRelation = (RelationAbstract)oldRelations.next();
          RelationAbstract clonedRelation = (RelationAbstract)oldRelation.clone();
          
          Object classifierA = oldRelation.getClassifierA();
          if(classifierA == component) classifierA = componentCopy;
          clonedRelation.setClassifierA(classifierA);
          
          Object classifierB = oldRelation.getClassifierB();
          if(classifierB == component) classifierB = componentCopy;          
          clonedRelation.setClassifierB(classifierB);
          
          relations.add(clonedRelation);
      }
    }
    
    /**
     * Duplicate a attribute of a class. 
     * 
     * @param owner The class the attribute belongs to.
     * @param attribute The attribute to duplicate.
     */
    public void duplicateAttribute(Object owner, Object attribute) {

        AttributeWrapper attributeCopy = new AttributeWrapper();
        
        attributeCopy.addSourceObject(((AttributeAbstract)attribute).getSourceObjects().toArray()[0]);

        ((ClassAbstract)owner).addAttribute(attributeCopy);
        
        // mark both attribute because one of them needs to be renamed
        ((AttributeAbstract)attribute).setAttentionNeeded(true);
        attributeCopy.setAttentionNeeded(true);
    }
    
    /**
     * Duplicate a method of a class.
     * 
     * @param owner The class the method belongs to.
     * @param method The method to duplicate.
     */
    public void duplicateMethod(Object owner, Object method) {

        MethodWrapper methodCopy = new MethodWrapper();
        
        methodCopy.addSourceObject(((MethodAbstract)method).getSourceObjects().toArray()[0]);

        ((ClassAbstract)owner).addMethod(methodCopy);
        
        // mark both methods because one of them needs to be renamed
        ((MethodAbstract)method).setAttentionNeeded(true);
        methodCopy.setAttentionNeeded(true);
    }
    
    /**
     * Undo the last action on the specified class.
     * 
     * @param component The class on which the last change should be undone.
     */
    public void undoComponentChanges(Object component) {
       
        // if it is a cloned class
        if ( ((ClassAbstract)component).isClone() ) {
            // remove the last operator
            resultComponents.remove(component);
            // remove relations that belong to the component we just deleted
            relations.removeAll(getRelations(component));            
        }
        // if it isn't already the unmodified class
        else if ( !(component instanceof ClassWrapper) ) {
            // remove the last operator
            resultComponents.remove(component);
            // get the components from before the last operation
            Iterator sourceComponents = ((ClassAbstract)component).getSourceObjects().iterator();            
            // run through the source components
            while (sourceComponents.hasNext()) {
                Object aSourceComponent = sourceComponents.next();
                // put them back
                resultComponents.add(aSourceComponent);
                updateRelationOperatorsAfterUndo(aSourceComponent, component);
            }            
        }

        // mark all components that need the attention of the user
        markComponents();
    }
    
    /**
     * Undo the last action on the specified attribute.
     * 
     * @param owner The class the attribute belongs to.
     * @param attribute The attribute on which the last change should be undone.
     */
    public void undoAttributeChanges(Object owner, Object attribute) {
        
        // if it is a cloned attribute 
        if ( ((AttributeWrapper)attribute).isClone() ) {
            // remove the last operator
            ((ClassAbstract)owner).removeAttribute(attribute);
        }
        // if it isn't already the unmodified attribute
        else if ( !(attribute instanceof AttributeWrapper) ) {            
            // remove the last operator
            ((ClassAbstract)owner).removeAttribute(attribute);    
            // get the attributes from before the last operation
            Iterator sourceAttributes = ((AttributeAbstract)attribute).getSourceObjects().iterator();            
            // run through the source attributes
            while (sourceAttributes.hasNext()) {
                // put them back
                ((ClassAbstract)owner).addAttribute(sourceAttributes.next());
            }            
        }
     
        // mark all attributes that need the attention of the user
        markAttributes(owner);
    }

    /**
     * Undo the last action on the specified method.
     * 
     * @param owner The class the method belongs to.
     * @param method The method on which the last change should be undone.
     */
    public void undoMethodChanges(Object owner, Object method) {
        
        // if it is a cloned method
        if ( ((MethodAbstract)method).isClone() ) {
            // remove the last operator
            ((ClassAbstract)owner).removeMethod(method);
        }
        // if it isn't already the unmodified methode
        else if ( !(method instanceof MethodWrapper) ) {            
            // remove the last operator
            ((ClassAbstract)owner).removeMethod(method);
            // get the methods from before the last operation
            Iterator sourceMethods = ((MethodAbstract)method).getSourceObjects().iterator();            
            // run through the source methods
            while (sourceMethods.hasNext()) {
                // put them back
                ((ClassAbstract)owner).addMethod(sourceMethods.next());
            }            
        }

        // mark all methods that need the attention of the user
        markMethods(owner);
    }
    
    /**
     * Undo the last action on the specified relation.
     * 
     * @param relation The relation on which the last change should be undone.
     */
    public void undoRelationChanges(Object relation) {
        
        // if it isn't already the unmodified relation
        if ( !(relation instanceof RelationWrapper) ) {            
            // remove the last operator
            relations.remove(relation);
            // get the relations from before the last operation
            Iterator sourceRelations = ((RelationAbstract)relation).getSourceObjects().iterator();            
            // run through the source relations
            while (sourceRelations.hasNext()) {
                // put them back
                relations.add(sourceRelations.next());
            }            
        }
        
        // mark all relations that need the attention of the user
        markRelations();
    }
    
    /**
     * Return the class components which belong to the given pattern.
     * 
     * @param pattern The pattern package of which the class should be returned. 
     * @return The classes.
     */
    public Collection getComponentsByPattern(Object pattern) {
        String patternId = Model.getFacade().getUUID(pattern);
        
        return getComponentsByPattern(patternId);
    }
    
    /**
     * Return the class components which belong to the pattern with the
     * given id.
     * 
     * @param patternId The ID of the pattern package of which the class should be returned. 
     * @return The classes.
     */
    public Collection getComponentsByPattern(String patternId) {
        Collection componentsByPattern = new ArrayList();        
        Object o;
        // run through all result components
        for (Iterator i = resultComponents.iterator(); i.hasNext(); ) {
            o = i.next();
            // if the component is a ClassWrapper and it's no copy of another component
            if( (o instanceof ClassWrapper) && !((ClassWrapper)o).isClone() && 
                    (((ClassAbstract)o).getPatternIds().toArray()[0].equals(patternId)) ) 
                componentsByPattern.add(o);
        }       
        
        return componentsByPattern;
    }
    
    /**
     * Return all changed class components.
     * 
     * @return All changed classes.
     */
    public Collection getChangedComponents() {
        Collection componentsByPattern = new ArrayList();
        
        // get the result components
        Iterator componentsIterator = resultComponents.iterator();      
        Object o;
        // run through all result components
        while (componentsIterator.hasNext()) {            
            o = componentsIterator.next();
            // if the component is not a ClassWrapper
            if( !(o instanceof ClassWrapper) ) 
                componentsByPattern.add(o);
            // else if the component is a copy of another component
            else if(((ClassWrapper)o).isClone())
                    componentsByPattern.add(o);
        }       
        
        return componentsByPattern;
    }
    
    /**
     * Apply all changes made with the Pattern-Wizard and update the model in ArgoUML.
     * 
     * @param transform true if we want to transform the selected classes otherwise false.
     */
    public void applyChanges(boolean transform) {

        // and this one the new relations
        Collection newRelations = new ArrayList();
        
        CoreHelper coreHelper = Model.getCoreHelper();
        ModelManagementFactory modelMgmtFactory = Model.getModelManagementFactory();
        DiagramFactory diagramFactory = DiagramFactory.getInstance();
        
        // get the current project
        Project project = ProjectManager.getManager().getCurrentProject();
        
        Object thePackage = null;
        ArgoDiagram theDiagram = null;
        
        // if we are going to transform selected classes with the selected pattern
        if (transform) {
            // get the diagram to modify
            theDiagram = getInputClassDiagram();                // what happens if no classes where selected in this diagram?
            // get the package this diagram belongs to
            thePackage = ((ArgoDiagram)theDiagram).getOwner();   // what happens if it is not a package?
        }
        // if we are creating a new pattern
        else {                
            // get the pattern-stereotype
            Object stereotype = getPatternStereotype(project);   
            
            // create a new package
            thePackage = modelMgmtFactory.createPackage();
            // set the package name
            coreHelper.setName(thePackage, getPatternName()); 
            // set the pattern-stereotype for the package
            coreHelper.addStereotype(thePackage, stereotype);            
          
            // add the package directly under the model
            coreHelper.addOwnedElement(project.getModel(), thePackage);
            // select the new package
            TargetManager.getInstance().setTarget(thePackage);
            
            // create a class diagram in the package
            theDiagram = diagramFactory.create(DiagramType.Class, thePackage, null);
            
            // set the diagram name
            try {
                theDiagram.setName(getPatternName());
            } catch (PropertyVetoException e) {
                LOG.error("can't set diagram name");
            }
            // add the diagram to the project (into the selected package)
            project.addDiagram(theDiagram);            
        }
        
        // get an iterator for the classes of the new pattern
        Iterator componentsIterator = resultComponents.iterator(); 
        // run through all result components
        while (componentsIterator.hasNext()) {
            ClassAbstract aClassOperator = (ClassAbstract)componentsIterator.next();
            // create the class
            Object newClass = createClass(thePackage, aClassOperator);    
            //
            aClassOperator.setDestinationObject(newClass);
        }            
        
        // create the relations
        newRelations = createRelations(thePackage);   
        
        // get the newly created relations
        Iterator newRelationIterator = newRelations.iterator();  
        // run through all the new relations
        while (newRelationIterator.hasNext()) {
            Object aNewRelation = newRelationIterator.next();
            // add them to the package
            coreHelper.addOwnedElement(thePackage, aNewRelation);
        }
        
        Project p = ProjectManager.getManager().getCurrentProject();
        // get the ID of the diagram the classes to remove belong to
        String diagramId = getInputClassDiagramId();
        // delete the inputClasses if present (because we recreated and modified them)
        Iterator components = resultComponents.iterator();
        // run through all the components
        while(components.hasNext()){                
            ClassAbstract aClassOperator = (ClassAbstract)components.next();
            Collection thePatternIds = aClassOperator.getPatternIds();
            // if the class belongs to the pattern
            if (thePatternIds.contains(diagramId))
                p.moveToTrash(aClassOperator.getArgoSourceObjects().toArray()[0]);
        } 
        
        // the DiagramInterface will be used to add classes (with their relations) to the diagram
        DiagramInterface diagram = new DiagramInterface(Globals.curEditor());
        diagram.setCurrentDiagram(theDiagram);
        
        // get an iterator for the classes of the new pattern
        componentsIterator = resultComponents.iterator(); 
        // run through all result components
        while (componentsIterator.hasNext()) {
            // get the class operator
            ClassAbstract aClassOperator = (ClassAbstract)componentsIterator.next();
            // get the newly created class object for ArgoUML
            Object aNewClass = aClassOperator.getDestinationObject();
            // add it to the package
            coreHelper.addOwnedElement(thePackage, aNewClass);
            // add it to the diagram
            diagram.addClass(aNewClass, false);
        }

        // start auto-layout only if we are not transforming existing classen, so we don't destroy the users layout
        if (!transform) {
            ClassdiagramLayouter layouter = new ClassdiagramLayouter(theDiagram);
            layouter.layout();
        }
    }

    /**
     * Check of two collections contain one or more similar elements.
     * 
     * @param collection1 The first collection to compare with.
     * @param collection2 The second collection to compare with.
     * @return true if both collections contain one or more similar elements otherwise false.
     */
    public static boolean containsSimilarElements(Collection collection1, Collection collection2) {
        Iterator iteratorCollection1 = collection1.iterator();        
        while(iteratorCollection1.hasNext()) {                          
            Object aPatternId = iteratorCollection1.next(); 
            if (collection2.contains(aPatternId))
                return true;
        }
        return false;
    }
}