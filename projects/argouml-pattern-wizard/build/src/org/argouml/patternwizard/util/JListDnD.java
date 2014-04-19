// $Id: JListDnD.java 11 2007-01-25 18:36:46Z rene_lindhorst $
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

import java.awt.Insets;
import java.awt.Point;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.StringSelection;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.awt.dnd.*;
import java.io.IOException;

import javax.swing.DefaultListModel;
import javax.swing.JList;
import javax.swing.JViewport;
import javax.swing.ListModel;

import org.apache.log4j.Logger;

/******************************************************************************\
 *                               CLASS DEFINITION                             *
\******************************************************************************/
/**
 * This class extends the JList to enable drag & drop of Strings and activates 
 * the autoscrolling of the List.
 * 
 * @author Rene Lindhorst
 */
public class JListDnD extends JList 
implements DragSourceListener, DragGestureListener, DropTargetListener, Autoscroll
{

   /*------------------------------------------------------------------------*\
    |                    P R I V A T E   A T T R I B U T E S                 |
   \*------------------------------------------------------------------------*/  
   
    /**
     * The serial version UID.
     */
    private static final long serialVersionUID = -4767266971710996005L;

    /**
     * Logger.
     */
    private static final Logger LOG = Logger.getLogger(JListDnD.class);
    
    /**
     * Object that stores the last element removed from the coresponding list.
     */
    private Object lastElementRemoved;
    
    /**
     * Object that stores the last element added to the coresponding list.
     */
    private Object lastElementAdded;
    
    /** 
     * The autoscroll insets.
     */
    private Insets scrollInsets;
    
    /** 
     * Insets for the autoscroll method to decide whether it was really perform or not.
     */
    private Insets realInsets;
    
    /** 
     * The viewport of this JList.
     */
    private JViewport viewport;
    
   /*------------------------------------------------------------------------*\
    |                  P R O T E C T E D   A T T R I B U T E S               |
   \*------------------------------------------------------------------------*/
    
    /**
     * Enables this component to be a drop target.
     */
    protected DropTarget dropTarget;

    /**
     * Enables this component to be a drag source.
     */
    protected DragSource dragSource;
    
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
     * Creates a new instance of JListDnD.
     * 
     * @param dataModel The data model for this list.
     */
    public JListDnD(ListModel dataModel) {
        super(dataModel);
        
        dropTarget = new DropTarget (this, this);
        dragSource = new DragSource();
        dragSource.createDefaultDragGestureRecognizer(this, DnDConstants.ACTION_MOVE, this);
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
     * Is invoked when the dragging has entered the DropSite.
     * 
     * @param dsde The DragSourceDragEvent.
     * @see java.awt.dnd.DragSourceListener#dragEnter(java.awt.dnd.DragSourceDragEvent)
     */
    public void dragEnter(DragSourceDragEvent dsde) {
    }

    /**
     * Is invoked when a drag operation is going on.
     * 
     * @param dsde The DragSourceDragEvent.
     * @see java.awt.dnd.DragSourceListener#dragOver(java.awt.dnd.DragSourceDragEvent)
     */
    public void dragOver(DragSourceDragEvent dsde) {
    }

    /**
     * Is invoked if the use modifies the current drop gesture.
     * 
     * @param dsde The DragSourceDragEvent.
     * @see java.awt.dnd.DragSourceListener#dropActionChanged(java.awt.dnd.DragSourceDragEvent)
     */
    public void dropActionChanged(DragSourceDragEvent dsde) {
    }

    /**
     * Is invoked when you are exit the DropSite without dropping.
     * 
     * @param dse The DragSourceEvent.
     * @see java.awt.dnd.DragSourceListener#dragExit(java.awt.dnd.DragSourceEvent)
     */
    public void dragExit(DragSourceEvent dse) {
    }

    /**
     * Is invoked when the dragging has ended. Removes the draged element.
     * 
     * @param dsde The DragSourceDragEvent.
     * @see java.awt.dnd.DragSourceListener#dragDropEnd(java.awt.dnd.DragSourceDropEvent)
     */
    public void dragDropEnd(DragSourceDropEvent dsde) {
        if (dsde.getDropSuccess()) {
            removeElement();
        }
    }

    /**
     * Is invoked when a drag gesture has been initiated.
     * 
     * @param dge The DragGestureEvent.
     * @see java.awt.dnd.DragGestureListener#dragGestureRecognized(java.awt.dnd.DragGestureEvent)
     */
    public void dragGestureRecognized(DragGestureEvent dge) {   
        Object selected = getSelectedValue();
        if (selected != null) {
            StringSelection text = new StringSelection(selected.toString()); 
            // start the dragging
            dragSource.startDrag(dge, DragSource.DefaultMoveDrop, text, this);
        }
    }

    /**
     * Is invoked when you are dragging over the DropSite.
     * 
     * @param dtde The DropTargetDragEvent.
     * @see java.awt.dnd.DropTargetListener#dragEnter(java.awt.dnd.DropTargetDragEvent)
     */
    public void dragEnter(DropTargetDragEvent dtde) {
        dtde.acceptDrag(DnDConstants.ACTION_MOVE);
    }

    /**
     * Is invoked when the dragging is currently ocurring over the DropSite
     * 
     * @param dtde The DropTargetDragEvent.
     * @see java.awt.dnd.DropTargetListener#dragOver(java.awt.dnd.DropTargetDragEvent)
     */
    public void dragOver(DropTargetDragEvent dtde) {
    }

    /**
     * Is invoked when the user changes the dropAction.
     * 
     * @param dtde The DropTargetDragEvent.
     * @see java.awt.dnd.DropTargetListener#dropActionChanged(java.awt.dnd.DropTargetDragEvent)
     */
    public void dropActionChanged(DropTargetDragEvent dtde) {
    }

    /**
     * Is invoked when the dragging has exited the DropSite
     * 
     * @param dte The DropTargetEvent.
     * @see java.awt.dnd.DropTargetListener#dragExit(java.awt.dnd.DropTargetEvent)
     */
    public void dragExit(DropTargetEvent dte) {
    }

    /**
     * Is invoked when a drop has occurred. It adds the droped string to the list.
     * 
     * @param dtde The DropTargetDragEvent.
     * @see java.awt.dnd.DropTargetListener#drop(java.awt.dnd.DropTargetDropEvent)
     */
    public void drop(DropTargetDropEvent dtde) {
        try { 
            dtde.acceptDrop(DnDConstants.ACTION_MOVE);
            // we are only interested in droped Strings
            String stringToTransfer = (String)dtde.getTransferable().getTransferData(DataFlavor.stringFlavor);
            addElement(stringToTransfer); 
            dtde.getDropTargetContext().dropComplete(true);  
        }
        // if the data is no longer availible in the requested flavor
        catch (IOException exception) {
            exception.printStackTrace();
            LOG.error("Exception" + exception.getMessage());
            dtde.rejectDrop();
        } 
        // if the requested data flavor is not supported
        catch (UnsupportedFlavorException ufException ) {
          ufException.printStackTrace();
          LOG.error("Exception" + ufException.getMessage());
          dtde.rejectDrop();
        }
    }

    /**
     * Notify the Component to autoscroll.
     * 
     * @param cursorPosition The Position of the cursor.
     */
    public void autoscroll (Point cursorPosition) {
        if (viewport == null) 
            viewport = (JViewport)this.getParent();
        Point viewPosition = viewport.getViewPosition();
        int viewHeight = viewport.getExtentSize().height;
        
        if ((cursorPosition.y - viewPosition.y) <= realInsets.top) {
            // scroll up
            Point newViewPosition = new Point(viewPosition.x, Math.max(viewPosition.y - realInsets.top, 0));
            viewport.setViewPosition(newViewPosition);
        } else if ((viewPosition.y + viewHeight - cursorPosition.y) <= realInsets.bottom) {
            // scroll down
            Point newViewPosition = new Point(viewPosition.x, Math.min(viewPosition.y + realInsets.bottom, this.getHeight() - viewHeight));
            viewport.setViewPosition(newViewPosition);
        }
    }

    /**
     * Return the Insets describing the autoscrolling region or border relative
     * to the geometry of the implementing Component.
     * 
     * @return The Insets.
     */
    public Insets getAutoscrollInsets () {
        if (scrollInsets == null) {
            scrollInsets = new Insets(this.getHeight(), 0, this.getHeight(), 0);
            realInsets = new Insets(15, 0, 15, 0);
        }
        
        return scrollInsets;
    }

    /**
     * Adds an element to the data model belonging to this JList.
     * 
     * @param elementToAdd The element to be added.
     */     
     public void addElement(Object elementToAdd){       
         addElement(((DefaultListModel)getModel()).size(), elementToAdd);         
    }
    
     /**
      * Adds an element to the data model belonging to this JList.
      * 
      * @param index The index where to add the element.
      * @param elementToAdd The element to be added.
      */
     public void addElement(int index, Object elementToAdd){
         lastElementAdded = elementToAdd;
         LOG.debug("D&D last element added: " + lastElementAdded);
         ((DefaultListModel)getModel()).add(index, elementToAdd);          
    }
  

    /**
     * Remove the selected element from the data model belonging to this JList.
     */     
    public void removeElement(){
        removeElement(getSelectedValue());
    }
    
    /**
     * Remove the element at the given index from the data model belonging to 
     * this JList.
     * 
     * @param index The index of the element to remove.
     */
    public void removeElement(int index){
        removeElement(((DefaultListModel)getModel()).get(index));
    }
    
    /**
     * Remove a given element from the data model belonging to this JList.
     * 
     * @param elementToRemove The element to be removed.
     */     
    public void removeElement(Object elementToRemove){
        lastElementRemoved = elementToRemove;
        LOG.debug("D&D last element removed: " + lastElementRemoved);
        ((DefaultListModel)getModel()).removeElement(elementToRemove);
    }

    /**
     * @return The last element added to the list.
     */
    public Object getLastElementAdded() {
        return lastElementAdded;
    }

    /**
     * @return The last element removed from the list.
     */
    public Object getLastElementRemoved() {
        return lastElementRemoved;
    }
}