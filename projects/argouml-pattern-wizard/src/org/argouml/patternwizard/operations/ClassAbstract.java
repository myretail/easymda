// $Id: ClassAbstract.java 11 2007-01-25 18:36:46Z rene_lindhorst $
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
 * ClassAbstract implements some basic methods needed for class model elements. 
 * 
 * @author Rene Lindhorst
 */
public abstract class ClassAbstract extends ModelElementAbstract {

   /*------------------------------------------------------------------------*\
    |                    P R I V A T E   A T T R I B U T E S                 |
   \*------------------------------------------------------------------------*/  
    
    /**
     * A collection of all mehtod model elements which belong to this class 
     * model element.
     */
    protected Collection methods;
    
    /**
     * A collection of all attribute model elements which belong to this class 
     * model element.
     */
    protected Collection attributes;
    
    /**
     * The model element which is created through the Pattern-Wizard after the 
     * changes are applyed.
     */
    private Object destinationObject;
    
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
     * Creates a new instance of ClassAbstract.
     */
    protected ClassAbstract() {
        super();
        methods = new ArrayList();
        attributes = new ArrayList();
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
     * @return All attributes for this class.
     */
    public ArrayList getAttributes() {
        return (ArrayList)attributes;
    }
    
    /**
     * Set the attributes for this class.
     * 
     * @param attributes The attributes to set.
     */
    public void setAttributes(Collection attributes) {
        this.attributes = attributes;
    }

    /**
     * Add the attributes to this class.
     * 
     * @param attributes The attributes to add.
     */
    public void addAttributes(Collection attributes) {
        this.attributes.addAll(attributes);
    }
    
    /**
     * Add an attribute to this class.
     * 
     * @param attribute The attribute to add.
     */
    public void addAttribute(Object attribute) {
        attributes.add(attribute);
    }

    /**
     * Remove an attribute from this class.
     * 
     * @param attribute The attribute to remove.
     */
    public void removeAttribute(Object attribute) {
        attributes.remove(attribute);
    }

    /**
     * @return All methods for this class.
     */
    public ArrayList getMethods() {
        return (ArrayList)methods;
    }
    
    /**
     * Set the methods for this class.
     * 
     * @param methods The methods to set.
     */
    public void setMethods(Collection methods) {
        this.methods = methods;
    }

    /**
     * Add the methods for to this class.
     * 
     * @param methods The methods to add.
     */
    public void addMethods(Collection methods) {
        this.methods.addAll(methods);
    }

    /**
     * Add a method to this class.
     * 
     * @param method The method to add.
     */
    public void addMethod(Object method) {
        methods.add(method);
    }

    /**
     * Remove a method from this class.
     * 
     * @param method The method to remove.
     */
    public void removeMethod(Object method) {
        methods.remove(method);
    }

    /**
     * @return The model element which is created through the Pattern-Wizard after the 
     * changes are applyed.
     */
    public Object getDestinationObject() {
        return destinationObject;
    }

    /**
     * Set the model element which is created through the Pattern-Wizard after the 
     * changes are applyed.
     * 
     * @param destinationObject The created element.
     */
    public void setDestinationObject(Object destinationObject) {
        this.destinationObject = destinationObject;
    }
    
    /**
     * Create and return a copy of this element.
     * 
     * @return A clone of this instance.
     * @see java.lang.Cloneable
     */
    public Object clone() {
        // clone the class itself
        ClassAbstract classClone = (ClassAbstract)super.clone();
        
        // and clone the attributes
        Collection attributeClones = new ArrayList();
        Iterator attributesIterator = getAttributes().iterator();
        while (attributesIterator.hasNext()) {
            AttributeAbstract aAttribute = (AttributeAbstract)attributesIterator.next();
            attributeClones.add(aAttribute.clone());
        }
        classClone.setAttributes(attributeClones);

        // and clone the methods
        Collection methodClones = new ArrayList();
        Iterator methodsIterator = getMethods().iterator();
        while (methodsIterator.hasNext()) {
            MethodAbstract aMethod = (MethodAbstract)methodsIterator.next();
            methodClones.add(aMethod.clone());
        }
        classClone.setMethods(methodClones);

        return classClone;
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
     * @return The IDs of the pattern this model element belongs to. It will be 
     * more than one if the class is merged with another class of a different 
     * pattern.
     */
    public abstract Collection getPatternIds();
}