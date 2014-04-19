// $Id: RelationOperatorModify.java 11 2007-01-25 18:36:46Z rene_lindhorst $
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
import java.util.Collection;

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
 * RelationOperatorModify is the operator which is used to modify the properties
 * of a relation.
 * 
 * @author Rene Lindhorst
 */
public class RelationOperatorModify extends RelationOperator
{

   /*------------------------------------------------------------------------*\
    |                    P R I V A T E   A T T R I B U T E S                 |
   \*------------------------------------------------------------------------*/  
   
    /**
     * The new name of this relation model element.
     */
    private String newName;
    
    /**
     * The new stereotypes applied to this class model element.
     */
    private Collection newStereotypes;
    
    /**
     * The name of the first AssociationEnd of this relation.
     */
    private String newAssociationRoleA;
    
    /**
     * The name of the second AssociationEnd of this relation.
     */
    private String newAssociationRoleB;
    
    /**
     * The cardinality of the first AssociationEnd of this relation.
     */
    private String newAssociationRoleAMultiplicity;
    
    /**
     * The cardinality of the second AssociationEnd of this relation.
     */
    private String newAssociationRoleBMultiplicity;
    
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
   
   /*------------------------------------------------------------------------*\
    |                       P A C K A G E   M E T H O D S                    |
   \*------------------------------------------------------------------------*/
   
   /*------------------------------------------------------------------------*\
    |                       P R I V A T E   M E T H O D S                    |
   \*------------------------------------------------------------------------*/
   
   /*------------------------------------------------------------------------*\
    |                       P U B L I C    M E T H O D S                     |
   \*------------------------------------------------------------------------*/
    
    /* (non-Javadoc)
     * @see org.argouml.patternwizard.operations.ModelElementAbstract#getName()
     */
    public String getName() {
        return newName;
    }
    
    /**
     * Set the new name of this relation model element.
     * 
     * @param newName The new name.
     */
    public void setName(String newName) {
        this.newName = newName;
    }

    /* (non-Javadoc)
     * @see org.argouml.patternwizard.operations.ModelElementAbstract#getStereotypes()
     */
    public Collection getStereotypes() {     
  
      if(newStereotypes.isEmpty())
          return ((RelationAbstract)getSourceObjects().toArray()[0]).getStereotypes();
      else
          return newStereotypes;  
    }
    
    /**
     * Set the new stereotypes applied to this relation model element.
     * 
     * @param newStereotypes The new stereotypes.
     */
    public void setStereotypes(Collection newStereotypes) {
        this.newStereotypes = newStereotypes;
    }
    
    /* (non-Javadoc)
     * @see org.argouml.patternwizard.operations.ModelElementAbstract#getArgoSourceObjects()
     */
    public Collection getArgoSourceObjects() {
        // ask the source object for the original source
        return ((RelationAbstract)getSourceObjects().toArray()[0]).getArgoSourceObjects();
    }

    /* (non-Javadoc)
     * @see org.argouml.patternwizard.operations.RelationAbstract#getAssociationRoleA()
     */
    public String getAssociationRoleA() {
        
        if(newAssociationRoleA.equals(""))
            return ((RelationAbstract)getSourceObjects().toArray()[0]).getAssociationRoleA();
        else 
            return newAssociationRoleA;
    }

    /**
     * Set the name of the first AssociationEnd of this relation.
     * 
     * @param newRole The role name to set.
     */
    public void setAssociationRoleA(String newRole) {
        this.newAssociationRoleA = newRole;
    }

    /* (non-Javadoc)
     * @see org.argouml.patternwizard.operations.RelationAbstract#getAssociationRoleAMultiplicity()
     */
    public String getAssociationRoleAMultiplicity() {
        
        if(newAssociationRoleAMultiplicity.equals(""))
            return ((RelationAbstract)getSourceObjects().toArray()[0]).getAssociationRoleAMultiplicity();
        else 
            return newAssociationRoleAMultiplicity;
    }

    /**
     * Set the cardinality of the first AssociationEnd of this relation.
     * 
     * @param newMultiplicity The cardinality to set.
     */
    public void setAssociationRoleAMultiplicity(String newMultiplicity) {
        this.newAssociationRoleAMultiplicity = newMultiplicity;
    }

    /* (non-Javadoc)
     * @see org.argouml.patternwizard.operations.RelationAbstract#getAssociationRoleB()
     */
    public String getAssociationRoleB() {
        
        if(newAssociationRoleB.equals(""))
            return ((RelationAbstract)getSourceObjects().toArray()[0]).getAssociationRoleB();
        else 
            return newAssociationRoleB;
    }

    /**
     * Set the name of the second AssociationEnd of this relation.
     * 
     * @param newRole The role name to set.
     */
    public void setAssociationRoleB(String newRole) {
        this.newAssociationRoleB = newRole;
    }

    /* (non-Javadoc)
     * @see org.argouml.patternwizard.operations.RelationAbstract#getAssociationRoleBMultiplicity()
     */
    public String getAssociationRoleBMultiplicity() {
        
        if(newAssociationRoleBMultiplicity.equals(""))
            return ((RelationAbstract)getSourceObjects().toArray()[0]).getAssociationRoleBMultiplicity();
        else 
            return newAssociationRoleBMultiplicity;
    }

    /**
     * Set the cardinality of the second AssociationEnd of this relation.
     * 
     * @param newMultiplicity The cardinality to set.
     */
    public void setAssociationRoleBMultiplicity(String newMultiplicity) {
        this.newAssociationRoleBMultiplicity = newMultiplicity;
    }
}
