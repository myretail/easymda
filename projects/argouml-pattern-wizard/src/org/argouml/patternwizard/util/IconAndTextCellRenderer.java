// $Id: IconAndTextCellRenderer.java 11 2007-01-25 18:36:46Z rene_lindhorst $
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
package org.argouml.patternwizard.util;

/******************************************************************************\
 *                                IMPORT SECTION                              *
\******************************************************************************/
import java.awt.Color;
import java.awt.Component;
import javax.swing.DefaultListCellRenderer;
import javax.swing.Icon;
import javax.swing.JList;

import org.argouml.application.helpers.ResourceLoaderWrapper;
import org.argouml.patternwizard.operations.*;

/******************************************************************************\
 *                               CLASS DEFINITION                             *
\******************************************************************************/
/**
 * This class is an extension of the DefaultListCellRenderer to display an icon
 * together with an item and to set the colors of the cell depending on the item.
 * 
 * @author Rene Lindhorst
 */
public class IconAndTextCellRenderer extends DefaultListCellRenderer 
{

   /*------------------------------------------------------------------------*\
    |                    P R I V A T E   A T T R I B U T E S                 |
   \*------------------------------------------------------------------------*/  
    
    /**
     * The serial version UID.
     */
    private static final long serialVersionUID = 3789565909451605700L;
    
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
     * Creates a new instance of IconAndTextCellRenderer.
     */
    public IconAndTextCellRenderer() {
        super();               
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
     * Return a component that has been configured to display the specified
     * value.
     * 
     * @see javax.swing.ListCellRenderer#getListCellRendererComponent(javax.swing.JList, java.lang.Object, int, boolean, boolean)
     */
    public Component getListCellRendererComponent(JList list, Object value, int index, 
            boolean isSelected, boolean cellHasFocus) {

        super.getListCellRendererComponent(list, value, index, isSelected, cellHasFocus);
        setIcon(getIcon(value));
        
        setColor(value);

        return this;
    }
    
    /**
     * Find an icon for the item which should be displayed.
     * 
     * @param item The item to display.
     * @return the icon for this item.
     */
    private Icon getIcon(Object item) {
        
        Icon icon = null;
    
        Object itemModelElement = null;
        // try to get the original model element
        if (item instanceof ArgoElementWrapper)
            itemModelElement = ((ArgoElementWrapper)item).getArgoSourceObject();
        if (item instanceof ClassAbstract)
            itemModelElement = ((ClassAbstract)item).getArgoSourceObjects().toArray()[0];
        if (item instanceof AttributeAbstract)
            itemModelElement = ((AttributeAbstract)item).getArgoSourceObjects().toArray()[0];
        else if (item instanceof MethodAbstract)
            itemModelElement = ((MethodAbstract)item).getArgoSourceObjects().toArray()[0];
        else if (item instanceof RelationAbstract)
            itemModelElement = ((RelationAbstract)item).getArgoSourceObjects().toArray()[0];
        
        // if a model element was found
        if (itemModelElement != null)
            // search the icon of this model element
            icon = ResourceLoaderWrapper.getInstance().lookupIcon(itemModelElement);
        
        return icon;
    }
    
    /**
     * Set the forground and background color depending on the item which 
     * should be displayed.
     * 
     * @param item The item to display.
     */
    private void setColor(Object item) {
        
        if(item instanceof String)
            setBackground(new Color(248, 248, 06));
        else if(item instanceof ModelElementAbstract) {
            if( ((ModelElementAbstract)item).isAttentionNeeded() )
                setForeground(Color.RED);
        }
    }
}