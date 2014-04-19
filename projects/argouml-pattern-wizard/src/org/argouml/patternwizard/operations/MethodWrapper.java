// $Id: MethodWrapper.java 11 2007-01-25 18:36:46Z rene_lindhorst $
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
 * MethodWrapper acts as a wrapper for the original ArgoUML method model 
 * element. 
 * 
 * @author Rene Lindhorst
 */
public class MethodWrapper extends MethodAbstract {

   /*------------------------------------------------------------------------*\
    |                    P R I V A T E   A T T R I B U T E S                 |
   \*------------------------------------------------------------------------*/  
    
    /**
     * The name of the method model element.
     */
    private String name;   
    
    /**
     * The ID of the pattern package the method model element belongs to.
     */
    private String parentId;
    
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
     * Creates a new instance of MethodWrapper.
     */
    public MethodWrapper() {
        super();
    }
    
    /**
     * Creates a new instance of MethodWrapper.
     * 
     * @param sourceMethod The method model element this class acts as a wrapper for.
     * @param id The ID of the pattern the method model element belongs to.
     */
    public MethodWrapper(Object sourceMethod, String id) {

        this();
        
        addSourceObject(sourceMethod);
        
        setParentId(id);        
        
        //
        name = Model.getFacade().getName(sourceMethod);
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
   
   /*------------------------------------------------------------------------*\
    |                       P U B L I C    M E T H O D S                     |
   \*------------------------------------------------------------------------*/

    /* (non-Javadoc)
     * @see org.argouml.patternwizard.operations.ModelElementAbstract#getChangesOverview()
     */
    public String getChangesOverview() {
        return getName(); // + " (" + packageName + "." + parentClass + ")";
    }

    /* (non-Javadoc)
     * @see org.argouml.patternwizard.operations.ModelElementAbstract#getName()
     */
    public String getName() {
        return name;
    }

    /* (non-Javadoc)
     * @see org.argouml.patternwizard.operations.ModelElementAbstract#getStereotypes()
     */
    public Collection getStereotypes() {        
        return Model.getFacade().getStereotypes(getSourceObjects().toArray()[0]);
    }
  
    /* (non-Javadoc)
     * @see org.argouml.patternwizard.operations.ModelElementAbstract#getArgoSourceObjects()
     */
    public Collection getArgoSourceObjects() {
        return sourceObjects;
    }
    
    /* (non-Javadoc)
     * @see org.argouml.patternwizard.operations.ModelElementAbstract#isAttentionNeeded()
     */
    public boolean isAttentionNeeded() {        
        return attentionNeeded;
    }

    /* (non-Javadoc)
     * @see org.argouml.patternwizard.operations.ModelElementAbstract#setAttentionNeeded()
     */
    public void setAttentionNeeded(boolean attentionNeeded) {
        this.attentionNeeded = attentionNeeded;
    }

    /* (non-Javadoc)
     * @see org.argouml.patternwizard.operations.ModelElementAbstract#getPatternIds()
     */
    public Collection getParentIds() {
        Collection parentIds = new ArrayList();
        parentIds.add(parentId);
        
        return parentIds;
    }     

    /**
     * Set the parent ID this method model element belongs to.
     * 
     * @param parentId The patternId to set.
     */
    public void setParentId(String parentId) {
        this.parentId = parentId;
    }
}