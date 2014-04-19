// $Id: JListDnDArgoElement.java 11 2007-01-25 18:36:46Z rene_lindhorst $
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
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.Transferable;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.awt.dnd.*;
import java.io.IOException;

import javax.swing.ListModel;

import org.apache.log4j.Logger;
import org.argouml.model.Model;
import org.argouml.patternwizard.operations.ArgoElementWrapper;

/******************************************************************************\
 *                               CLASS DEFINITION                             *
\******************************************************************************/
/**
 * This class extends the JListDnD to enable drag & drop of ArgoElementWrapper.
 * 
 * @author Rene Lindhorst
 */
public class JListDnDArgoElement extends JListDnD
{

   /*------------------------------------------------------------------------*\
    |                    P R I V A T E   A T T R I B U T E S                 |
   \*------------------------------------------------------------------------*/  
    
    /**
     * The serial version UID.
     */
    private static final long serialVersionUID = -4465429343001488859L;

    /**
     * Logger.
     */
    private static final Logger LOG = Logger.getLogger(JListDnDArgoElement.class);
   
    private DataFlavor argoElementWrapperDataFlavor;        
    
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
     * Creates a new instance of JListDnDArgoElement.
     * 
     * @param dataModel The data model for this list.
     */
    public JListDnDArgoElement(ListModel dataModel) {
        super(dataModel);
        try {
            argoElementWrapperDataFlavor = new DataFlavor(DataFlavor.javaJVMLocalObjectMimeType + ";class=org.argouml.patternwizard.operations.ArgoElementWrapper", "packageWrapper", getClass().getClassLoader());
        } catch (Exception e) {
            LOG.error("An Exception occured while creating an instance of JListDnDArgoElement.");
        }
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
     * Is invoked when a drag gesture has been initiated.
     * 
     * @param dge The DragGestureEvent.
     * @see java.awt.dnd.DragGestureListener#dragGestureRecognized(java.awt.dnd.DragGestureEvent)
     */
    public void dragGestureRecognized(DragGestureEvent dge) {   
        Object selected = getSelectedValue();
        if (selected != null) {
            //
            PackageWrapperTransferable transferable = new PackageWrapperTransferable(selected);
            // tart the dragging
            dragSource.startDrag(dge, DragSource.DefaultMoveDrop, transferable, this);
        }
    }
    
    /**
     * Is invoked when a drop has occurred. It adds the droped ArgoElementWrapper which 
     * could contain a package or a stereotype to the list.
     * 
     * @param dtde The DropTargetDragEvent.
     * @see java.awt.dnd.DropTargetListener#drop(java.awt.dnd.DropTargetDropEvent)
     */
    public void drop(DropTargetDropEvent dtde) {
        try { 
            dtde.acceptDrop(DnDConstants.ACTION_MOVE);
            ArgoElementWrapper elementToTransfer = (ArgoElementWrapper)dtde.getTransferable().getTransferData(argoElementWrapperDataFlavor);
            // if a package or a stereotype was droped
            if ( (Model.getFacade().isAPackage(elementToTransfer.getArgoSourceObject())) ||
                 (Model.getFacade().isAStereotype(elementToTransfer.getArgoSourceObject())) ) {
                // accept it
                addElement(elementToTransfer); 
                dtde.getDropTargetContext().dropComplete(true);  
            }
            // reject erverything else
            else {
                dtde.getDropTargetContext().dropComplete(false); 
            }            
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
    
   /*------------------------------------------------------------------------*\
    |                       I N N E R    C L A S S E S                       |
   \*------------------------------------------------------------------------*/
    
    class PackageWrapperTransferable implements Transferable {
        
        private Object packageWrapper;

        PackageWrapperTransferable(Object packageWrapper) {
            this.packageWrapper = packageWrapper;
        }

        public Object getTransferData(DataFlavor flavor) throws UnsupportedFlavorException {
            if (!isDataFlavorSupported(flavor)) {
                throw new UnsupportedFlavorException(flavor);
            }
            return packageWrapper;
        }

        public DataFlavor[] getTransferDataFlavors() {
            return new DataFlavor[] { argoElementWrapperDataFlavor };
        }

        public boolean isDataFlavorSupported(DataFlavor flavor) {
            return argoElementWrapperDataFlavor.equals(flavor);
        }
    }
}
