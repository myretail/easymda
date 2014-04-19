// $Id: ArgoElementWrapper.java 11 2007-01-25 18:36:46Z rene_lindhorst $
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
import java.io.Serializable;

/******************************************************************************\
 *                               CLASS DEFINITION                             *
\******************************************************************************/
/**
 * This class acts as a wrapper for original ArgoUML model elements which
 * have to be displayed in the lists of the Pattern-Wizard.
 * 
 * @author Rene Lindhorst
 */
public class ArgoElementWrapper implements Serializable
{
   /*------------------------------------------------------------------------*\
    |                    P R I V A T E   A T T R I B U T E S                 |
   \*------------------------------------------------------------------------*/ 
    
    /**
     * The serial version UID.
     */
    private static final long serialVersionUID = 4568565815266950382L;

    /**
     * The original ArgoUML model element this class acts as a wrapper for.
     */
    private Object argoSourceObject;
  
    /**
     * The name of the original ArgoUML model element this class acts as 
     * a wrapper for.
     */
    private String argoSourceObjectName;     
    
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
     * Creates a new instance of ArgoElementWrapper. It acts as a wrapper for 
     * the original ArgoUML model element.
     */
    public ArgoElementWrapper() {
        argoSourceObject = new Object();
    }
    
    /**
     * Creates a new instance of ArgoElementWrapper. It acts as a wrapper for 
     * the original ArgoUML model element.
     * 
     * @param sourceElement The original ArgoUML model element.
     * @param sourceElementName The name of the original ArgoUML model element.
     */
    public ArgoElementWrapper(Object sourceElement, String sourceElementName)
    {
        this();
        
        setArgoSourceObject(sourceElement);
        
        setName(sourceElementName);
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


    /**
     * @return The original ArgoUML model element of this wrapper.
     */
    public Object getArgoSourceObject() {
        return argoSourceObject;
    }
    
    /**
     * Set the original ArgoUML model element of this wrapper.
     * 
     * @param sourceElement The original ArgoUML model element.
     */
    public void setArgoSourceObject(Object sourceElement)
    {       
        // store the source package
        argoSourceObject = sourceElement;
    }

    /**
     * @return The name of the original ArgoUML model element of this wrapper.
     */
    public String getName() {
        return argoSourceObjectName;
    }

    /**
     * Set the name of the original ArgoUML model element of this wrapper.
     * 
     * @param argoSourceObjectName The name to set.
     */
    public void setName(String argoSourceObjectName) {
        this.argoSourceObjectName = argoSourceObjectName;
    }

    /**
     * @return A string representation of the wrapper.
     * @see java.lang.Object#toString()
     */
    public String toString() {
        return getName();
    }
}
