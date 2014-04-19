// $Id: AttributeOperatorModify.java 11 2007-01-25 18:36:46Z rene_lindhorst $
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
 * AttributeOperatorModify is the operator which is used to modify the properties
 * of a attribute.
 * 
 * @author Rene Lindhorst
 */
public class AttributeOperatorModify extends AttributeOperator
{

   /*------------------------------------------------------------------------*\
    |                    P R I V A T E   A T T R I B U T E S                 |
   \*------------------------------------------------------------------------*/  
   
    /**
     * The new name of this attribute model element.
     */
    private String newName;
    
    /**
     * The new stereotypes applied to this attribute model element.
     */
    private Collection newStereotypes;
    
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
     * Set the new name of this attribute model element.
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
          return ((AttributeAbstract)getSourceObjects().toArray()[0]).getStereotypes();
      else
          return newStereotypes;  
    }
    
    /**
     * Set the new stereotypes applied to this attribute model element.
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
        return ((AttributeAbstract)getSourceObjects().toArray()[0]).getArgoSourceObjects();
    }    

    /* (non-Javadoc)
     * @see org.argouml.patternwizard.operations.AttributeAbstract#getParentIds()
     */
    public Collection getParentIds() {
        // ask the source object for the parent ids
        return ((AttributeAbstract)getSourceObjects().toArray()[0]).getParentIds();
    }
}
