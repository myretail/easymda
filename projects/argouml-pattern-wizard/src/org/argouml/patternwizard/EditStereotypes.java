// $Id: EditStereotypes.java 23 2008-11-26 19:48:13Z mvw $
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
package org.argouml.patternwizard;

/******************************************************************************\
 *                                IMPORT SECTION                              *
\******************************************************************************/
import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;

import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.ListSelectionModel;

import org.argouml.i18n.Translator;
import org.argouml.model.Model;
import org.argouml.model.ModelManagementHelper;
import org.argouml.patternwizard.operations.ArgoElementWrapper;
import org.argouml.patternwizard.operations.ModelElementAbstract;
import org.argouml.patternwizard.util.IconAndTextCellRenderer;
import org.argouml.patternwizard.util.JListDnDArgoElement;
import org.argouml.uml.StereotypeUtility;
import org.argouml.util.ArgoDialog;

/******************************************************************************\
 *                               CLASS DEFINITION                             *
\******************************************************************************/
/**
 * This class is responsible for the GUI of the small dialog to change the 
 * assigned stereotypes of all model elements.
 * 
 * @author Rene Lindhorst
 */
public class EditStereotypes extends ArgoDialog implements ActionListener 
{
    /*------------------------------------------------------------------------*\
     |                    P R I V A T E   A T T R I B U T E S                 |
    \*------------------------------------------------------------------------*/  
    
    private static final long serialVersionUID = -750930045000833372L;
    
    private static final String ADD_STEREOTYPE = "addPattern";
    private static final String REMOVE_STEREOTYPE = "removePattern";
    
    private DefaultListModel availableStereotypesListModel;    
    private DefaultListModel appliedStereotypesListModel; 
    
    private JListDnDArgoElement availableStereotypesList;  
    private JListDnDArgoElement appliedStereotypesList; 
    
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
     * Creates a new instance of the EditStereotypes dialog.
     *  
     */
    public EditStereotypes(Object modelElement, DefaultListModel listModel)
    {
        super(Translator.localize("patternwizard.title.stereotype"), ArgoDialog.OK_CANCEL_OPTION, true);
        // hide the cancel-button because we need only the OK 
        // (the user can undo his action with the reset-button in the main dialog)
        getCancelButton().setVisible(false);
        
        this.appliedStereotypesListModel = listModel;
        this.availableStereotypesListModel = new DefaultListModel();
        
        // ##############################
        
        // make sure that the given object is a model element 
        if (modelElement instanceof ModelElementAbstract) {
      
            // get the applied stereotypes of this model element from the supplied listmodel, so we have the recent changes as well
            Collection appliedStereotypes = extractStereotypes(listModel);
            
            // get one of the ArgoUML source objects of the given model element
            // (it doesn't matter if it has more because all are from the same type and have the same available stereotypes)
            Object modelElementSourceObject = ((ModelElementAbstract)modelElement).getArgoSourceObjects().toArray()[0];
            
            // get the available stereotypes for this model element
            Collection availableStereotypes = StereotypeUtility.getAvailableStereotypes(modelElementSourceObject);
            // now remove the ones already applied
            availableStereotypes = removeFromCollection(availableStereotypes, appliedStereotypes);
//            availableStereotypes.removeAll(appliedStereotypes);
            // add them to the list
            addAll(availableStereotypes, availableStereotypesListModel);           
        }

        // ##################################          
        
        JPanel mainPanel = makePanel(); 
        setContent(mainPanel);
        setResizable(false);
        setVisible(true);
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
    
    /**
     * Create a JPanel with everything on it.
     *
     * @return A newly created JPanel.
     */
    private JPanel makePanel() {
        
        JPanel mainPanel = new JPanel(new GridBagLayout()); 
        
        GridBagConstraints constraints = new GridBagConstraints();

        // ##############################

        availableStereotypesList = new JListDnDArgoElement(availableStereotypesListModel);
        availableStereotypesList.setCellRenderer(new IconAndTextCellRenderer());
        availableStereotypesList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        JScrollPane availableStereotypesScrollPane = new JScrollPane(availableStereotypesList);
        availableStereotypesScrollPane.setColumnHeaderView(new JLabel(Translator.localize("patternwizard.label.available-stereotypes")));
        availableStereotypesScrollPane.setMinimumSize(new Dimension(200, 200));
        availableStereotypesScrollPane.setPreferredSize(availableStereotypesScrollPane.getMinimumSize());
        availableStereotypesScrollPane.setSize(availableStereotypesScrollPane.getMinimumSize());
        constraints.fill = GridBagConstraints.BOTH;
        constraints.gridx = 0;
        constraints.gridy = 0;
        constraints.gridwidth = 1;
        constraints.gridheight = 1;
        constraints.weightx = 1.0;
        constraints.weighty = 1.0;
        mainPanel.add(availableStereotypesScrollPane, constraints);        
        
        // ##################################
        
        JPanel buttonContainer = new JPanel(new BorderLayout());
        JButton addPatternToSelectionButton = new JButton(Translator.localize("patternwizard.button.add"));
        addPatternToSelectionButton.setToolTipText(Translator.localize("patternwizard.button.add-stereotype-tooltip"));
        addPatternToSelectionButton.setPreferredSize(addPatternToSelectionButton.getMinimumSize());
        addPatternToSelectionButton.addActionListener(this);
        addPatternToSelectionButton.setActionCommand(ADD_STEREOTYPE);
        buttonContainer.add(BorderLayout.NORTH, addPatternToSelectionButton);
        
        JButton removePatternFromSelectionButton = new JButton(Translator.localize("patternwizard.button.remove"));
        removePatternFromSelectionButton.setToolTipText(Translator.localize("patternwizard.button.remove-stereotype-tooltip"));
        addPatternToSelectionButton.setPreferredSize(addPatternToSelectionButton.getMinimumSize());
        removePatternFromSelectionButton.addActionListener(this);
        removePatternFromSelectionButton.setActionCommand(REMOVE_STEREOTYPE);     
        buttonContainer.add(BorderLayout.SOUTH, removePatternFromSelectionButton);

        constraints.fill = GridBagConstraints.NONE;
        constraints.gridx = 1;
        constraints.weightx = 0.0;
        constraints.weighty = 0.0;
        mainPanel.add(buttonContainer, constraints);

        // ##################################
        
        appliedStereotypesList = new JListDnDArgoElement(appliedStereotypesListModel);
        appliedStereotypesList.setCellRenderer(new IconAndTextCellRenderer());
        appliedStereotypesList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        JScrollPane appliedStereotypesScrollPane = new JScrollPane(appliedStereotypesList);
        appliedStereotypesScrollPane.setColumnHeaderView(new JLabel(Translator.localize("patternwizard.label.applied-stereotypes")));
        appliedStereotypesScrollPane.setMinimumSize(new Dimension(200, 200));
        appliedStereotypesScrollPane.setPreferredSize(appliedStereotypesScrollPane.getMinimumSize());
        appliedStereotypesScrollPane.setSize(appliedStereotypesScrollPane.getMinimumSize());        
        constraints.fill = GridBagConstraints.BOTH;
        constraints.gridx = 2;
        constraints.weightx = 1.0;
        constraints.weighty = 1.0;
        mainPanel.add(appliedStereotypesScrollPane, constraints);
        
        // ##################################
        
        return mainPanel;
    }
    
    /**
     * Removes those elements from source that do have the same path like elements in toRemove.
     * This is important for Stereotypes because when a Stereotype is added to a model element
     * Model.getModelManagementHelper().getCorrespondingElement(...) is used to create a copy 
     * of the Stereotype which is added to the model element.
     * That's why a Collection.removeAll(...) wouldn't work! 
     * 
     * @param source The source collection with all items.
     * @param toRemove The collection with the items which should be removed from the source collection.
     * @return The collection which contains only items not present in the toRemove collection.
     */
    private Collection removeFromCollection(Collection source, Collection toRemove) {
        // TODO check if ArgoUML has added a function for this after vPre 0.22.beta2 
        //      because they have the same problem in the stereotypes-tab
        
        ModelManagementHelper modelManagementHelper = Model.getModelManagementHelper();
        // create an iterator for the elements to remove
        Iterator toRemoveIterator = toRemove.iterator();
        // run through all of them
        while(toRemoveIterator.hasNext()) {
            // get the next element to remove and its path
            Object elementToRemove = toRemoveIterator.next();
            Object pathToRemove = modelManagementHelper.getPathList(elementToRemove);
            // create an iterator for the source elements
            Iterator sourceIterator = source.iterator();
            // run through all of them
            while(sourceIterator.hasNext()) {
                // get the next source element and its path
                Object sourceElement = sourceIterator.next();
                Object path = modelManagementHelper.getPathList(sourceElement);
                // if the path is the same than the on from the element to remove
                if(path.equals(pathToRemove)) {
                    // remove it from the source
                    source.remove(sourceElement);
                    // exit the source-loop and proceed with the next element to remove
                    break;
                }
            }
        }
        
        return source;
    }

    /**
     * Add the elements of the given collecction to the list model.
     * The stereotypes are wrapped into a ArgoStereotypeWrapper so that the 
     * special JList can display the icons properly.
     * 
     * @param elementsToAdd Collection with Elements to add.
     * @param listModel The ListModel the elements have to be added.
     */
    public static void addAll(Collection elementsToAdd, DefaultListModel listModel) {
        // create an iterator for the stereotypes
        Iterator elementsIterator = elementsToAdd.iterator();
        // run through all stereotypes
        while (elementsIterator.hasNext()) {
            Object stereotypeObject = elementsIterator.next();
            String stereotypeName = Model.getFacade().getName(stereotypeObject);
            // store the stereotype object in a ArgoElementWrapper so we can access it later
            ArgoElementWrapper aStereotype = new ArgoElementWrapper(stereotypeObject, stereotypeName);
            // add the stereotype to the list
            listModel.addElement(aStereotype);
        }        
    }
    
    /**
     * Extract the ArgoUML stereotype objects from the list model with the wrapped stereotypes.
     * 
     * @param listModel The list model with the wrapped stereotypes.
     * @return A Colelction with the ArgoUML stereotype objects.
     */
    public static Collection extractStereotypes(DefaultListModel listModel) {
        // the collection that will hold the stereotypes
        Collection argoStereotypes = new ArrayList();
        
        Iterator wrapperIterator = Arrays.asList(listModel.toArray()).iterator();
        // run through all wrapped stereotypes
        while (wrapperIterator.hasNext()) {
            ArgoElementWrapper aStereotype = (ArgoElementWrapper)wrapperIterator.next();
            // get the real stereotype object
            Object aStereotypeObject = aStereotype.getArgoSourceObject();
            // add it to the collection
            argoStereotypes.add(aStereotypeObject);
        }
        
        return argoStereotypes;
    }
    
    /**
     * This method detects when an action has been preformed from any
     * of the buttons or fields and processes the action accordingly
     * 
     * @param e The actionEvent.
     * @see java.awt.event.ActionListener#actionPerformed(java.awt.event.ActionEvent)
     */
    public void actionPerformed(ActionEvent e)
    {
        String command = e.getActionCommand();
        
        if (ADD_STEREOTYPE.equals(command)) {
            if(!availableStereotypesList.isSelectionEmpty()) {
                // retrieve the stereotypes the user wants to add and move them to the other list
                Object[] pattern = availableStereotypesList.getSelectedValues();   
                for(int i=0; i < pattern.length; i++) {                
                    appliedStereotypesList.addElement(pattern[i]);
                    availableStereotypesList.removeElement(pattern[i]); 
                }
            }
        }
        else if (REMOVE_STEREOTYPE.equals(command)) {
            if(!appliedStereotypesList.isSelectionEmpty()) {
                // retrieve the stereotypes the user wants to remove and move them to the other list
                Object[] pattern = appliedStereotypesList.getSelectedValues();            
                for(int i=0; i < pattern.length; i++) {
                    availableStereotypesList.addElement(pattern[i]);
                    appliedStereotypesList.removeElement(pattern[i]);
                }  
            }
        }
        // everything else might be handeled by the Argo-Dialog itself
        else {
            super.actionPerformed(e);
        }
    }
}
