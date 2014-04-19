// $Id: RelationOperatorMerge.java 11 2007-01-25 18:36:46Z rene_lindhorst $
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
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

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
 * RelationOperatorMerge is the operator which is used to merge two relations.
 * 
 * @author Rene Lindhorst
 */
public class RelationOperatorMerge extends RelationOperator
{

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
        return ((RelationAbstract)getSourceObjects().toArray()[0]).getName();
    }

    /* (non-Javadoc)
     * @see org.argouml.patternwizard.operations.ModelElementAbstract#getStereotypes()
     */
    public Collection getStereotypes() { 
        //
        Iterator sources = getSourceObjects().iterator();
        Collection stereotypes = new ArrayList();
        // run through all of them
        while(sources.hasNext()){            
            stereotypes.addAll(((RelationAbstract)sources.next()).getStereotypes());
        }
        
        return stereotypes;       
    }

    /* (non-Javadoc) 
     * @see org.argouml.patternwizard.operations.ModelElementAbstract#getArgoSourceObjects()
     */
    public Collection getArgoSourceObjects() {
        // get all source objects
        Iterator sources = getSourceObjects().iterator();
        Collection originalSources = new ArrayList();
        // run through all of them
        while(sources.hasNext()){     
            // ask the source object for the original source and add it to the collection
            originalSources.addAll(((RelationAbstract)sources.next()).getArgoSourceObjects());            
        }
     
        return originalSources;
    }
    
    /* (non-Javadoc) 
     * @see org.argouml.patternwizard.operations.RelationAbstract#getAssociationRoleA()
     */
    public String getAssociationRoleA() {
        return ((RelationAbstract)getSourceObjects().toArray()[0]).getAssociationRoleA();
    }

    /* (non-Javadoc) 
     * @see org.argouml.patternwizard.operations.RelationAbstract#getAssociationRoleB()
     */
    public String getAssociationRoleB() {
        return ((RelationAbstract)getSourceObjects().toArray()[0]).getAssociationRoleB();
    }
    
    /* (non-Javadoc) 
     * @see org.argouml.patternwizard.operations.RelationAbstract#getAssociationRoleAMultiplicity()
     */
    public String getAssociationRoleAMultiplicity() {
        return ((RelationAbstract)getSourceObjects().toArray()[0]).getAssociationRoleAMultiplicity();
    }

    /* (non-Javadoc) 
     * @see org.argouml.patternwizard.operations.RelationAbstract#getAssociationRoleBMultiplicity()
     */
    public String getAssociationRoleBMultiplicity() {
        return ((RelationAbstract)getSourceObjects().toArray()[0]).getAssociationRoleBMultiplicity();
    }

}
