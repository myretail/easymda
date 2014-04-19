// $Id: CombinedIcon.java 11 2007-01-25 18:36:46Z rene_lindhorst $
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
import java.awt.Component;
import java.awt.Graphics;
import javax.swing.Icon;

/******************************************************************************\
 *                               CLASS DEFINITION                             *
\******************************************************************************/
/**
 * This class makes it possible to use two small fixed size picture as an icon
 * on other components.
 * 
 * @author Rene Lindhorst
 */
public class CombinedIcon implements Icon
{
   /*------------------------------------------------------------------------*\
    |                    P R I V A T E   A T T R I B U T E S                 |
   \*------------------------------------------------------------------------*/  
   
    private static final int ICON_GAP = 2;
    private final Icon icon1;
    private final Icon icon2;
    
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
     * Creates a new instance of CombinedIcon with the given icons.
     * 
     * @param icon1 The first icon of the new combined icon.
     * @param icon2 The second icon of the new combined icon.
     */
    public CombinedIcon(Icon icon1, Icon icon2) {
        this.icon1 = icon1;
        this.icon2 = icon2;
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
     * Returns the combined icon's height.
     * 
     * @return The height of the combined icon.
     * @see javax.swing.Icon#getIconHeight()
     */
    public int getIconHeight() {
        int height1 = icon1.getIconHeight();
        int height2 = icon2.getIconHeight();
        
        return height1 > height2 ? height1 : height2;
    }
    
    /**
     * Returns the combined icon's width.
     * 
     * @return The width of the combined icon.
     * @see javax.swing.Icon#getIconWidth()
     */
    public int getIconWidth() {
        int width1 = icon1.getIconWidth();
        int width2 = icon2.getIconWidth();
        
        return  width1 + ICON_GAP + width2;
    }
    
    /**
     * Draw the combined icon at the specified location.
     * 
     * @see javax.swing.Icon#paintIcon(java.awt.Component, java.awt.Graphics, int, int)
     */
    public void paintIcon(Component c, Graphics g, int x, int y) {
        icon1.paintIcon(c, g, x, y);
        icon2.paintIcon(c, g, x + icon1.getIconWidth() + ICON_GAP, y);
    }
}