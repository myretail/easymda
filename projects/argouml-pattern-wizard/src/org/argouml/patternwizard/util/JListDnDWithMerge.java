// $Id: JListDnDWithMerge.java 11 2007-01-25 18:36:46Z rene_lindhorst $
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
import java.awt.dnd.*;

import javax.swing.DefaultListModel;
import javax.swing.ListModel;
import javax.swing.event.ListDataEvent;
import javax.swing.event.ListDataListener;

import org.apache.log4j.Logger;

/******************************************************************************\
 *                               CLASS DEFINITION                             *
\******************************************************************************/
/**
 * This class extends the JListDnD to enable the merge of two elements of the list.
 * 
 * <b>Note:</b>
 * The drop just determines the indexes of the draged and droped element and sends 
 * them to the ListDataListeners. These Listeners have to handle what should happen
 * with the elements.
 * 
 * @author Rene Lindhorst
 */
public class JListDnDWithMerge extends JListDnD
{

   /*------------------------------------------------------------------------*\
    |                    P R I V A T E   A T T R I B U T E S                 |
   \*------------------------------------------------------------------------*/  
   
    /**
     * The serial version UID.
     */
    private static final long serialVersionUID = 2114574496517387880L;
    
    /**
     * Logger.
     */
    private static final Logger LOG = Logger.getLogger(JListDnDWithMerge.class);
    
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
     * Creates a new instance of JListDnDWithMerge.
     * 
     * @param dataModel The data model for this list.
     */
    public JListDnDWithMerge(ListModel dataModel) {
        super(dataModel);
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
     * Is invoked when a drop has occurred. It determines the indexes of the draged
     * and droped element and sends them to the ListDataListeners. These Listeners
     * have to handle what should happen with the elements.
     * 
     * @param dtde The DropTargetDragEvent.
     * @see java.awt.dnd.DropTargetListener#drop(java.awt.dnd.DropTargetDropEvent)
     */
    public void drop(DropTargetDropEvent dtde) {
        // this will store the list element on which the drop accured
        Object dropDestinationElement = "";
        // the element from which the drag started
        Object dragSourceElement = getSelectedValue();
        
        // get the index on which the drop accured
        int dropDestinationIndex = locationToIndex(dtde.getLocation());
        if (dropDestinationIndex != -1) {
            // and get the corresponding list element
            dropDestinationElement = ((DefaultListModel)getModel()).getElementAt(dropDestinationIndex);
            LOG.debug("dropping \"" + dragSourceElement + "\" on: \"" + dropDestinationElement + "\"");
        }            
        
        // get the index from which the drag started
        int dragSourceIndex = ((DefaultListModel)getModel()).indexOf(getSelectedValue());
        
        // if a list element was dropped onto another list element
        if ( (dragSourceElement != null) && (dropDestinationElement != null) && !dropDestinationElement.equals(dragSourceElement) ) {            
            
            LOG.debug("dropping " + dragSourceIndex + " on " + dropDestinationIndex);
            
            // get all DataListener
            Object[] listeners = ((DefaultListModel)getModel()).getListDataListeners();
            ListDataEvent aEvent = null;
            // send the contents changed event to all listeners
            for ( int i=0; i < listeners.length; i++) {
                LOG.debug("sending changes to listener: " + i); 
                if (aEvent == null) 
                    aEvent = new ListDataEvent((DefaultListModel)getModel(), ListDataEvent.CONTENTS_CHANGED, dragSourceIndex, dropDestinationIndex);

                ((ListDataListener)listeners[i]).contentsChanged(aEvent);         
            }
        } 

        // reject the drop because we don't want to do anything here
        // -> the ListDataListener has to make the changes
        dtde.rejectDrop();
    }
}
