// $Id: RelationAbstract.java 11 2007-01-25 18:36:46Z rene_lindhorst $
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
package org.argouml.patternwizard.operations;


/******************************************************************************\
 *                                IMPORT SECTION                              *
\******************************************************************************/
import java.util.Iterator;

import org.argouml.i18n.Translator;
import org.argouml.model.Facade;
import org.argouml.model.Model;

/******************************************************************************\
 *                               CLASS DEFINITION                             *
\******************************************************************************/
/**
 * Within the Pattern-Wizard all original ArgoUML model elements will be placed
 * in a wrapper (e.g. classes into a ClassWrapper) so that there are the same
 * methods for classes, attribute, methods and relations to access and change 
 * propeties.
 * If a property of an element is changed in the Pattern-Wizard, a new operator
 * (e.g. ClassOperatorModify) will be created and prepend the wrapper or 
 * operator which was active before. 
 * In this way an easy undo of all operations in the Pattern-Wizard is possible.
 * 
 * RelationAbstract implements some basic methods needed for relation model 
 * elements. 
 * 
 * @author Rene Lindhorst
 */
public abstract class RelationAbstract extends ModelElementAbstract {

   /*------------------------------------------------------------------------*\
    |                    P R I V A T E   A T T R I B U T E S                 |
   \*------------------------------------------------------------------------*/  
   
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
    
   /*------------------------------------------------------------------------*\
    |                     P R O T E C T E D   M E T H O D S                  |
   \*------------------------------------------------------------------------*/
   
    /**
     * Get the association end that point to the given class.
     * 
     * @param classifier The class the association end points to.
     * @return The association end.
     */
    protected Object getAssociationEnd(Object classifier) {
        
        Object associationSourceObject = getArgoSourceObjects().toArray()[0];
        Object associationEnd = null;
        Facade facade = Model.getFacade(); 
        // if the relation is a association (includes aggregations as well)
        if (facade.isAAssociation(associationSourceObject)) {
            // create an iterator for all relation ends (maybe there are more than one because of a merge)
            Iterator relationEndSourceObjects = ((ClassAbstract)classifier).getArgoSourceObjects().iterator();
            // run through the relation ends
            while (relationEndSourceObjects.hasNext()) {
                Object relationEndSourceObject = relationEndSourceObjects.next();
                // create an iterator for all connections (= association ends) of this association
                Iterator connectionsIterator = facade.getConnections(associationSourceObject).iterator();
                // run through the connections
                while (connectionsIterator.hasNext()) {
                    Object aAssociationEnd = connectionsIterator.next();
                    // if the type of this association end (it's a class) is equal to the source class of the given relation end
                    if(facade.getType(aAssociationEnd).equals(relationEndSourceObject)) {
                        // we found the association end that point to the given relation end
                        associationEnd = aAssociationEnd;
                        break;
                    }
                }
            }
            
        }

        return associationEnd;
    }
    
   /*------------------------------------------------------------------------*\
    |                       P A C K A G E   M E T H O D S                    |
   \*------------------------------------------------------------------------*/
   
   /*------------------------------------------------------------------------*\
    |                       P R I V A T E   M E T H O D S                    |
   \*------------------------------------------------------------------------*/
    
    /**
     * @return The description for this relation.
     */
    private String getRelationDescription() {
        
        Object relation = getSourceObjects().toArray()[0];
        
        Facade facade = Model.getFacade();
        
        // get the name of the classes at left and right end of the relation 
        String leftClass = ((ClassAbstract)getClassifierA()).getName();
        String rightClass = ((ClassAbstract)getClassifierB()).getName();
        String leftNavigation = "";
        String rightNavigation = "";
        String line = "----";
        
        if ( (isAGeneralization()) || (isAAbstraction()) ) {
            rightNavigation = "|>";            
            if (facade.isAAbstraction(relation))
                line = "- - -";
        }    
        else if (isADependency()) {            
            rightNavigation = ">";
            line = "- - -";
        }    
        else if (isAAssociation()) {
            // add the role name (if present) to the class name
            String roleA = getAssociationRoleA();
            if(!roleA.equals(""))
                leftClass = leftClass+"."+roleA;
            String roleB = getAssociationRoleB();
            if(!roleB.equals(""))
                rightClass = rightClass+"."+roleB;

            Object associationEndA = getAssociationEnd(getClassifierA());
            Object associationEndB = getAssociationEnd(getClassifierB());
            
            if (facade.isNavigable(associationEndA)) 
                leftNavigation = "<";            
            if (facade.isNavigable(associationEndB))
                rightNavigation = ">";
            if (facade.isAggregate(associationEndA))
                leftNavigation = "<>";      
            if (facade.isAggregate(associationEndB))
                rightNavigation = "<>";
        }      

        return leftClass + " " + leftNavigation + line + rightNavigation + " " + rightClass;
    }
    
   /*------------------------------------------------------------------------*\
    |                       P U B L I C    M E T H O D S                     |
   \*------------------------------------------------------------------------*/    
    
    /**
     * @return True if this relation is a abstraction otherwise false.
     */
    public boolean isAAbstraction() {
        Object relation = getArgoSourceObjects().toArray()[0];
        
        return Model.getFacade().isAAbstraction(relation);
    }
    
    /**
     * @return True if this relation is a association otherwise false.
     */
    public boolean isAAssociation() {
        Object relation = getArgoSourceObjects().toArray()[0];
        
        return Model.getFacade().isAAssociation(relation);
    }
    
    /**
     * @return True if this relation is a dependency otherwise false.
     */
    public boolean isADependency() {
        Object relation = getArgoSourceObjects().toArray()[0];
        
        return Model.getFacade().isADependency(relation);
    }
    
    /**
     * @return True if this relation is a generalization otherwise false.
     */
    public boolean isAGeneralization() {
        Object relation = getArgoSourceObjects().toArray()[0];
        
        return Model.getFacade().isAGeneralization(relation);
    }    
    
    /* (non-Javadoc) 
     * @see org.argouml.patternwizard.operations.ModelElementAbstract#toString()
     */
    public String toString() {
        String name;
        // if the relation has no name return something like "unnamed" that can be displayed in the list
        if(getName().equals(""))
            name = "("+Translator.localize("patternwizard.text.unnamed")+")";
        else
            name = getName();
        
        return name + " [ " + getRelationDescription() + " ]";
    }
    
    /**
     * @return The ID of the pattern this relation belongs to
     */
    public abstract String getPatternId();

    /**
     * @return The name of the first AssociationEnd of this relation.
     */
    public abstract String getAssociationRoleA();
    
    /**
     * @return The name of the second AssociationEnd of this relation.
     */
    public abstract String getAssociationRoleB();
    
    /**
     * @return The cardinality of the first AssociationEnd of this relation.
     */
    public abstract String getAssociationRoleAMultiplicity();
    
    /**
     * @return The cardinality of the second AssociationEnd of this relation.
     */
    public abstract String getAssociationRoleBMultiplicity();
    
    /**
     * @return The first classifier connected to this relation.
     */
    public abstract Object getClassifierA();
    
    /**
     * Set the first classifier connected to this relation.
     *
     * @param classifierA The classifier to set.
     */
    public abstract void setClassifierA(Object classifierA);

    /**
     * @return The second classifier connected to this relation.
     */
    public abstract Object getClassifierB();
    
    /**
     * Set the second classifier connected to this relation.
     *
     * @param classifierB The classifier to set.
     */
    public abstract void setClassifierB(Object classifierB);

    
}