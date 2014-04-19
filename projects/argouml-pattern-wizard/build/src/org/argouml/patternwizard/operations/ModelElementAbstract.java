// $Id: ModelElementAbstract.java 11 2007-01-25 18:36:46Z rene_lindhorst $
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

import org.argouml.model.Model;
import org.argouml.patternwizard.Constants;

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
 * ModelElementAbstract is the basic model element class all other wrapper and 
 * operators will base on.
 * 
 * @author Rene Lindhorst
 */
public abstract class ModelElementAbstract implements Cloneable, Constants {

    /*------------------------------------------------------------------------*\
     |                    P R I V A T E   A T T R I B U T E S                 |
    \*------------------------------------------------------------------------*/  
    
    /**
     * Indicates if the model element is a copy of anotherone or not.
     */
    private boolean clone;  
    
    /*------------------------------------------------------------------------*\
     |                  P R O T E C T E D   A T T R I B U T E S               |
    \*------------------------------------------------------------------------*/
  
    /**
     * The elements this class acts as a wrapper for.
     */
    protected Collection sourceObjects;   
    
    /**
     * Indicates if this element needs the attention of the user 
     * (e.g. if the name has to be changed).
     */
    protected boolean attentionNeeded;
    
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
     * Creates a new instance of ModelElementAbstract.
     */
    protected ModelElementAbstract() {
        sourceObjects = new ArrayList();
        attentionNeeded = false;
        clone = false;
    }
    
    /*------------------------------------------------------------------------*\
     |                       P A C K A G E   M E T H O D S                    |
    \*------------------------------------------------------------------------*/
    
    /*------------------------------------------------------------------------*\
     |                       P R I V A T E   M E T H O D S                    |
    \*------------------------------------------------------------------------*/
    
    /*------------------------------------------------------------------------*\
     |                       P U B L I C    M E T H O D S                     |
    \*------------------------------------------------------------------------*/

    /**
     * Add a new source element.
     * 
     * @param sourceElement The source element to add.
     */
    public void addSourceObject(Object sourceElement) {
        sourceObjects.add(sourceElement);
    }
    
    /**
     * @return The source objects.
     */
    public Collection getSourceObjects() {
        return sourceObjects;
    }
    
    /**
     * @return The displayed name for this element.
     */
    public abstract String getChangesOverview();

    /**
     * @return A string representation of the element.
     * @see java.lang.Object#toString()
     */
    public String toString() {
        return getName();
    }
    
    /**
     * @return The short name for this element.
     */
    public abstract String getName();
    
    /**
     * @return A string with all stereotypes applied to this element.
     */
    public String getStereotypesString() {
        
        // identify the stereotype of the package
        Iterator stereotypeIterator = getStereotypes().iterator();
        String stereotypes = "";
        // run through the stereotypes
        while (stereotypeIterator.hasNext()) {
            // add a seperator to the string if necessary
            if(!stereotypes.equals(""))
                stereotypes += " " + STEREOTYPE_SEPERATOR + " ";
            // add the name of the stereotype to the string
            stereotypes += Model.getFacade().getName(stereotypeIterator.next());   
        }
        
        return stereotypes;
    }
    
    /**
     * @return A collection of all stereotypes applied to this element.
     */
    public abstract Collection getStereotypes();

    /**
     * @return The original ArgoUML model elements this class acts as a wrapper for.
     */
    public abstract Collection getArgoSourceObjects();
    
    /**
     * @return True if this element needs the attention of the user 
     * (e.g. if the name has to be changed).
     */
    public abstract boolean isAttentionNeeded();

    /**
     * Set if this element needs the attention of the user.
     * 
     * @param attentionNeeded If attention needed or not.
     */
    public abstract void setAttentionNeeded(boolean attentionNeeded);
    
    /**
     * @return True if this element is a clone otherwise false.
     */
    public boolean isClone() {
       return clone; 
    }

    /**
     * Mark this element as a clone.
     * 
     * @param clone If this element is a clone or not.
     */
    private void setClone(boolean clone) {
       this.clone = clone;
    }
    
    /**
     * Create and return a copy of this element.
     * 
     * @return A clone of this instance.
     * @see java.lang.Cloneable
     */
    public Object clone() {
        try {
            ModelElementAbstract elementClone = (ModelElementAbstract)super.clone();
            elementClone.setClone(true);
            
            return elementClone;
        } catch (CloneNotSupportedException e) {
            // this should not happen as we are cloneable
            throw new InternalError();
        }
    }
}
