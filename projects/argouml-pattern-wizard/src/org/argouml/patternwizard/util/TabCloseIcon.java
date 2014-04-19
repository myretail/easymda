// $Id: TabCloseIcon.java 11 2007-01-25 18:36:46Z rene_lindhorst $
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
import java.awt.Rectangle;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JTabbedPane;

import org.argouml.patternwizard.Constants;

/******************************************************************************\
 *                               CLASS DEFINITION                             *
\******************************************************************************/
/**
 * This class implements the Icon interface to create an icon which allows 
 * closing the tab on which it is located by clicking on the icon.
 * 
 * @author Rene Lindhorst
 */
public class TabCloseIcon implements Icon, Constants
{
    /*------------------------------------------------------------------------*\
     |                    P R I V A T E   A T T R I B U T E S                 |
    \*------------------------------------------------------------------------*/  
 
    private static final String ICON_PATH = ICON_RESOURCE_PATH+"/closeTab.gif";
    private final Icon icon;
    private JTabbedPane tabbedPane;
    private Rectangle position;
    
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
     * Creates a new instance of TabCloseIcon and uses the default icon.
     */
    public TabCloseIcon() {
        this(new ImageIcon(TabCloseIcon.class.getResource(ICON_PATH)));
    }
    
    /**
     * Creates a new instance of TabCloseIcon and uses the given icon.
     * 
     * @param icon The icon to use.
     */
    public TabCloseIcon(Icon icon) {
        this.icon = icon;
        this.tabbedPane = null;
        this.position = null;
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
     * @see javax.swing.Icon#getIconHeight()
     */
    public int getIconHeight() {
        return icon.getIconHeight();
    }
    
    /* (non-Javadoc)
     * @see javax.swing.Icon#getIconWidth()
     */
    public int getIconWidth() {
        return icon.getIconWidth();
    }
    
    /* (non-Javadoc)
     * @see javax.swing.Icon#paintIcon(java.awt.Component, java.awt.Graphics, int, int)
     */
    public void paintIcon(Component c, Graphics g, int x, int y) {
        if(null == tabbedPane) {
            tabbedPane = (JTabbedPane)c;
            tabbedPane.addMouseListener(new MouseAdapter()
            {
                public void mouseReleased(MouseEvent e) {
                    if ( !e.isConsumed() && position.contains(e.getX(), e.getY()) ) {
                        tabbedPane.remove(tabbedPane.getSelectedIndex());
                        tabbedPane.removeMouseListener(this);
                        e.consume();
                    }
                }
            });
        }

        // remember the last position painted
        position = new Rectangle(x, y, getIconWidth(), getIconHeight());
        icon.paintIcon(c, g, x, y);
    }
}