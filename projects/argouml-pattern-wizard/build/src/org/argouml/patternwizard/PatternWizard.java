// $Id: PatternWizard.java 23 2008-11-26 19:48:13Z mvw $
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
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.FocusEvent;
import java.awt.event.FocusListener;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

import javax.swing.BorderFactory;
import javax.swing.DefaultListModel;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTabbedPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.ListSelectionModel;
import javax.swing.event.ListDataEvent;
import javax.swing.event.ListDataListener;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;

import org.apache.log4j.Logger;
import org.argouml.application.helpers.ResourceLoaderWrapper;
import org.argouml.i18n.Translator;
import org.argouml.kernel.ProjectManager;
import org.argouml.model.Facade;
import org.argouml.model.Model;
import org.argouml.patternwizard.operations.ArgoElementWrapper;
import org.argouml.patternwizard.operations.AttributeAbstract;
import org.argouml.patternwizard.operations.AttributeWrapper;
import org.argouml.patternwizard.operations.ClassAbstract;
import org.argouml.patternwizard.operations.ClassWrapper;
import org.argouml.patternwizard.operations.MethodAbstract;
import org.argouml.patternwizard.operations.MethodWrapper;
import org.argouml.patternwizard.operations.RelationAbstract;
import org.argouml.patternwizard.operations.RelationWrapper;
import org.argouml.patternwizard.util.CombinedIcon;
import org.argouml.patternwizard.util.IconAndTextCellRenderer;
import org.argouml.patternwizard.util.JListDnD;
import org.argouml.patternwizard.util.JListDnDArgoElement;
import org.argouml.patternwizard.util.JListDnDWithMerge;
import org.argouml.patternwizard.util.TabCloseIcon;
import org.argouml.swingext.SpacerPanel;
import org.argouml.ui.ProjectActions;
import org.argouml.ui.targetmanager.TargetManager;
import org.argouml.uml.diagram.ArgoDiagram;
import org.argouml.uml.diagram.DiagramUtils;
import org.argouml.util.ArgoDialog;

/******************************************************************************\
 *                               CLASS DEFINITION                             *
\******************************************************************************/
/**
 * This class is responsible for the GUI of the Pattern-Wizard and the user 
 * interaction.
 * 
 * @author Rene Lindhorst
 */
public class PatternWizard extends ArgoDialog 
implements ActionListener, ListSelectionListener, ListDataListener, FocusListener, Constants
{
    
   /*------------------------------------------------------------------------*\
    |                    P R I V A T E   A T T R I B U T E S                 |
   \*------------------------------------------------------------------------*/  

    /**
     * The serial version UID.
     */
    private static final long serialVersionUID = -6799646662316054139L;
    
    /**
     * Logger.
     */
    private static final Logger LOG = Logger.getLogger(PatternWizard.class);

    /**
     * The Pattern-Wizard instance.
     */
    private static PatternWizard instance;
    
    private JButton componentsTabShowPatternButton;
    private JButton componentsTabDuplicateButton;
    private JButton componentsTabUndoButton;
    private JButton relationsTabShowPatternButton;
    private JButton relationsTabUndoButton;
    private JButton patternTabShowPatternButton;
    private JButton patternTabShowDocButton;
    
    private JTabbedPane tabsPane;
    private JTabbedPane helpPane;

    private JPanel componentPropertieContainer;
    private JPanel attributePropertieContainer;
    private JPanel methodPropertieContainer;
    private JPanel generalPropertieContainer;
    private JPanel associationPropertieContainer;

    private JCheckBox transformCheckBox;
    
    private JTextField newPatternNameTextField;
    private JTextField componentNameTextField;
    private JTextField attributeNameTextField;
    private JTextField methodNameTextField;
    private JTextField relationNameTextField;
    private JTextField roleANameTextField;
    private JTextField roleBNameTextField;
    
    private JTextArea changesHistoryTextArea;
    
    private JComboBox roleACardinalityComboBox;
    private JComboBox roleBCardinalityComboBox;
    
    private DefaultListModel availablePatternListModel;    
    private DefaultListModel selectedPatternListModel;
    private DefaultListModel componentsListModel;
    private DefaultListModel featuresListModel;
    private DefaultListModel relationsListModel;
    private DefaultListModel relationStereotypeListModel;
    private DefaultListModel componentStereotypeListModel;
    private DefaultListModel attributeStereotypeListModel;
    private DefaultListModel methodStereotypeListModel;
    
    private JList relationStereotypeList;
    private JList componentStereotypeList;
    private JList attributeStereotypeList;
    private JList methodStereotypeList;
    
    private JListDnD relationsList;
    
    private JListDnDArgoElement availablePatternList;    
    private JListDnDArgoElement selectedPatternList;
    
    private JListDnDWithMerge componentsList;
    private JListDnDWithMerge featuresList;
    
    private Vector multiplicityVector;
    
    private CombinePattern userPattern;
    
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
     * Creates a new instance of PatternWizard.
     */
    private PatternWizard()
    {
        super(Translator.localize("patternwizard.title")+" v1.0 (build 4200)", ArgoDialog.OK_CANCEL_HELP_OPTION, false);

        userPattern = new CombinePattern();
        
        // initialise the multiplicity vector
        multiplicityVector = new Vector();
        multiplicityVector.add("1");
        multiplicityVector.add("0..1");
        multiplicityVector.add("0..*");
        multiplicityVector.add("1..*");
//        multiplicityVector.add("0");
        
        JPanel mainPanel = makePanel();
        setContent(mainPanel);
        setResizable(false);
    }    
    
    /*------------------------------------------------------------------------*\
     |                     P R O T E C T E D   M E T H O D S                  |
    \*------------------------------------------------------------------------*/
    
    /**
     * Name the buttons of this dialog.
     * 
     * @see org.tigris.swidgets.Dialog#nameButtons()
     */
    protected void nameButtons()
    {
        nameButton(getOkButton(), "patternwizard.button.apply");
        nameButton(getCancelButton(), "patternwizard.button.close");
        nameButton(getHelpButton(), "patternwizard.button.reset");
    }
    
    /*------------------------------------------------------------------------*\
     |                       P A C K A G E   M E T H O D S                    |
    \*------------------------------------------------------------------------*/
    
    /*------------------------------------------------------------------------*\
     |                       P R I V A T E   M E T H O D S                    |
    \*------------------------------------------------------------------------*/  

    /**
     * Create a JPanel with all GUI elements on it.
     *
     * @return a newly created JPanel.
     */
    private JPanel makePanel() {
        
        JPanel mainPanel = new JPanel(new BorderLayout());  

        // ##################################
        
        tabsPane = new JTabbedPane();
        tabsPane.setMinimumSize(new Dimension(865, 350));
        tabsPane.setMaximumSize(tabsPane.getMinimumSize());
        tabsPane.setPreferredSize(tabsPane.getMinimumSize());
        
        JPanel sourcePatternTab = makeSourcePatternTab();
        tabsPane.addTab(Translator.localize("patternwizard.tab.source-pattern"), sourcePatternTab);

        JPanel componentsTab = makeComponentsTab();
        tabsPane.addTab(Translator.localize("patternwizard.tab.components"), componentsTab);

        JPanel relationsTab = makeRelationsTab();
        tabsPane.addTab(Translator.localize("patternwizard.tab.relations"), relationsTab);

        JPanel north = new JPanel();
        north.setLayout(new BorderLayout());
        north.add(tabsPane, BorderLayout.CENTER);
        mainPanel.add(north, BorderLayout.CENTER);
        
        // ##################################

        helpPane = new JTabbedPane();
        helpPane.setMinimumSize(new Dimension(865, 200));
        helpPane.setMaximumSize(helpPane.getMinimumSize());
        helpPane.setPreferredSize(helpPane.getMinimumSize());
        
        JPanel helpTab = makeHelpTab();        
        helpPane.addTab(Translator.localize("patternwizard.tab.help"), helpTab);
        
        ImageIcon icon = new ImageIcon(this.getClass().getResource(ICON_RESOURCE_PATH+"/info.gif"));
        helpPane.setIconAt(0, icon);
        
        mainPanel.add(helpPane, BorderLayout.SOUTH);

        // ##################################
        
        // deactivate the apply and reset button
        getOkButton().setEnabled(false);
        getHelpButton().setEnabled(false);
        
        // ##################################

        return mainPanel;
    }
    
    /**
     * Initialise the tab "Source Pattern".
     */
    private JPanel makeSourcePatternTab() 
    {
        JPanel sourcePatternTab = new JPanel(new GridBagLayout());
        
        GridBagConstraints constraints = new GridBagConstraints();

        // ##############################

        JPanel availablePatternsPanel = new JPanel(new GridBagLayout());
        
        availablePatternListModel = new DefaultListModel();
        availablePatternList = new JListDnDArgoElement(availablePatternListModel);
        availablePatternList.setCellRenderer(new IconAndTextCellRenderer());
        availablePatternList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        availablePatternList.addListSelectionListener(this);
        JScrollPane availablePatternsScrollPane = new JScrollPane(availablePatternList);
        availablePatternsScrollPane.setMinimumSize(new Dimension(349, 214));
        availablePatternsScrollPane.setPreferredSize(availablePatternsScrollPane.getMinimumSize());
        availablePatternsScrollPane.setSize(availablePatternsScrollPane.getMinimumSize());
        constraints.fill = GridBagConstraints.BOTH;
        constraints.gridwidth = 4;
        constraints.gridx = 0;
        constraints.gridy = 0;
        constraints.weightx = 1.0;
        constraints.weighty = 1.0;
        availablePatternsPanel.add(availablePatternsScrollPane, constraints);
        
        patternTabShowPatternButton = new JButton(Translator.localize("patternwizard.button.show-pattern"));
        patternTabShowPatternButton.setEnabled(false);
        patternTabShowPatternButton.addActionListener(this);
        patternTabShowPatternButton.setActionCommand(SHOW_PATTERN);
        constraints.gridwidth = 2;
        constraints.gridy = 1;
        constraints.weightx = 0.0;
        availablePatternsPanel.add(patternTabShowPatternButton, constraints);
        
        patternTabShowDocButton = new JButton(Translator.localize("patternwizard.button.show-documentation"));
        patternTabShowDocButton.setEnabled(false);
        patternTabShowDocButton.addActionListener(this);
        patternTabShowDocButton.setActionCommand(SHOW_DOCUMENTATION);
        constraints.gridx = 2;
        availablePatternsPanel.add(patternTabShowDocButton, constraints);

        JPanel availablePatternsContainer = new JPanel(new FlowLayout(FlowLayout.CENTER, 0, 0));
        availablePatternsContainer.setBorder(BorderFactory.createTitledBorder(Translator
                .localize("patternwizard.titled-border.available-patterns")));
        availablePatternsContainer.add(availablePatternsPanel);

        // ###############################

        JPanel newPatternPanel = new JPanel(new GridBagLayout());

        selectedPatternListModel = new DefaultListModel();
        selectedPatternListModel.addListDataListener(this);
        selectedPatternList = new JListDnDArgoElement(selectedPatternListModel);
        selectedPatternList.setCellRenderer(new IconAndTextCellRenderer());
        selectedPatternList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        JScrollPane newPatternScrollPane = new JScrollPane(selectedPatternList);
        newPatternScrollPane.setMinimumSize(new Dimension(349, 154));
        newPatternScrollPane.setPreferredSize(newPatternScrollPane.getMinimumSize());
        newPatternScrollPane.setSize(newPatternScrollPane.getMinimumSize());
        constraints.fill = GridBagConstraints.BOTH;
        constraints.gridwidth = 2;
        constraints.gridx = 0;
        constraints.gridy = 0;
        constraints.weightx = 1.0;
        constraints.weighty = 1.0;
        newPatternPanel.add(newPatternScrollPane, constraints);
        
        transformCheckBox = new JCheckBox(Translator.localize("patternwizard.label.transform-classes"), false);
        transformCheckBox.addActionListener(this);
        transformCheckBox.setActionCommand(TRANSFORM_CLASSES);
        constraints.gridy = 1;
        newPatternPanel.add(transformCheckBox, constraints);

        JLabel newPatternNameLabel = new JLabel(Translator.localize("patternwizard.label.name"));
        constraints.gridy = 2;
        newPatternPanel.add(newPatternNameLabel, constraints);

        newPatternNameTextField = new JTextField(DEFAULT_PATTERN_NAME);
        constraints.gridy = 3;
        newPatternPanel.add(newPatternNameTextField, constraints);

        JPanel newPatternContainer = new JPanel(new FlowLayout(FlowLayout.CENTER, 0, 0));
        newPatternContainer.setBorder(BorderFactory.createTitledBorder(Translator.localize("patternwizard.titled-border.new-pattern")));
        newPatternContainer.add(newPatternPanel);

        // ##################################
        
        JPanel buttonContainer = new JPanel(new BorderLayout());
        JButton addPatternToSelectionButton = new JButton(Translator.localize("patternwizard.button.add"));
        addPatternToSelectionButton.setToolTipText(Translator.localize("patternwizard.button.add-pattern-tooltip"));
        addPatternToSelectionButton.setPreferredSize(addPatternToSelectionButton.getMinimumSize());
        addPatternToSelectionButton.addActionListener(this);
        addPatternToSelectionButton.setActionCommand(ADD_PATTERN);
        buttonContainer.add(BorderLayout.NORTH, addPatternToSelectionButton);
        
        JButton removePatternFromSelectionButton = new JButton(Translator.localize("patternwizard.button.remove"));
        removePatternFromSelectionButton.setToolTipText(Translator.localize("patternwizard.button.remove-pattern-tooltip"));
        addPatternToSelectionButton.setPreferredSize(addPatternToSelectionButton.getMinimumSize());
        removePatternFromSelectionButton.addActionListener(this);
        removePatternFromSelectionButton.setActionCommand(REMOVE_PATTERN);     
        buttonContainer.add(BorderLayout.SOUTH, removePatternFromSelectionButton);
        
        // ##################################

        constraints.fill = GridBagConstraints.BOTH;
        constraints.gridx = 0;
        constraints.gridy = 0;
        constraints.gridwidth = 1;
        constraints.gridheight = 1;
        constraints.weightx = 1.0;
        constraints.weighty = 1.0;
        sourcePatternTab.add(availablePatternsContainer, constraints);

        constraints.fill = GridBagConstraints.NONE;
        constraints.gridx = 1;
        constraints.weightx = 0.0;
        constraints.weighty = 0.0;
        sourcePatternTab.add(buttonContainer, constraints);

        constraints.fill = GridBagConstraints.BOTH;
        constraints.gridx = 2;
        constraints.weightx = 1.0;
        constraints.weighty = 1.0;
        sourcePatternTab.add(newPatternContainer, constraints);
        
        // ##################################

        JButton forward2ComponentsTabButton = new JButton(Translator.localize("patternwizard.button.next"));
        forward2ComponentsTabButton.setMnemonic(Translator.localize("patternwizard.button.next.mnemonic").charAt(0));
        forward2ComponentsTabButton.addActionListener(this);
        forward2ComponentsTabButton.setActionCommand(FORWARD_TO_NEXT_TAB);
        constraints.fill = GridBagConstraints.NONE;
        constraints.gridx = 2;
        constraints.gridy = 1;
        constraints.weightx = 0.0;
        constraints.weighty = 0.0;
        constraints.anchor = GridBagConstraints.EAST;
        sourcePatternTab.add(forward2ComponentsTabButton, constraints);
        
        return sourcePatternTab;
    }

    /**
     * Initialise the tab "Components".
     */
    private JPanel makeComponentsTab() {
        
        JPanel componentsTab = new JPanel(new GridBagLayout());
        
        GridBagConstraints constraints = new GridBagConstraints();
        
        // ##################################
        
        JPanel patternComponentsPanel = new JPanel(new GridBagLayout());

        componentsListModel = new DefaultListModel();
        componentsListModel.addListDataListener(this);
        componentsList = new JListDnDWithMerge(componentsListModel);
        componentsList.setCellRenderer(new IconAndTextCellRenderer());
        componentsList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        componentsList.setAutoscrolls(true);
        componentsList.addListSelectionListener(this);
        componentsList.addFocusListener(this);        
        JScrollPane patternComponentsScrollPane = new JScrollPane(componentsList);
        patternComponentsScrollPane.setColumnHeaderView(new JLabel(Translator.localize("patternwizard.label.classes")));
        patternComponentsScrollPane.setMinimumSize(new Dimension(230, 214));
        patternComponentsScrollPane.setPreferredSize(patternComponentsScrollPane.getMinimumSize());
        patternComponentsScrollPane.setSize(patternComponentsScrollPane.getMinimumSize());
        patternComponentsScrollPane.setAutoscrolls(true);
        constraints.fill = GridBagConstraints.BOTH;
        constraints.gridwidth = 1;
        constraints.gridx = 0;
        constraints.gridy = 0;
        constraints.weightx = 1.0;
        constraints.weighty = 1.0;
        patternComponentsPanel.add(patternComponentsScrollPane, constraints);

        featuresListModel = new DefaultListModel();
        featuresListModel.addListDataListener(this);
        featuresList = new JListDnDWithMerge(featuresListModel);
        featuresList.setCellRenderer(new IconAndTextCellRenderer());
        featuresList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        featuresList.setAutoscrolls(true);
        featuresList.addListSelectionListener(this);
        JScrollPane featuresScrollPane = new JScrollPane(featuresList);
        featuresScrollPane.setColumnHeaderView(new JLabel(Translator.localize("patternwizard.label.features")));
        featuresScrollPane.setMinimumSize(new Dimension(230, 214));
        featuresScrollPane.setPreferredSize(featuresScrollPane.getMinimumSize());
        featuresScrollPane.setSize(featuresScrollPane.getMinimumSize());
        constraints.gridx = 1;
        patternComponentsPanel.add(featuresScrollPane, constraints);
        
        JPanel buttonPanel = new JPanel(new GridBagLayout());
        
        componentsTabShowPatternButton = new JButton(Translator.localize("patternwizard.button.show-pattern"));
        componentsTabShowPatternButton.addActionListener(this); 
        componentsTabShowPatternButton.setActionCommand(SHOW_PATTERN_OF_COMPONENT);
        componentsTabShowPatternButton.setEnabled(false);
        constraints.gridwidth = 1;
        constraints.gridy = 0;
        constraints.gridx = 0;
        constraints.anchor = GridBagConstraints.CENTER;
        buttonPanel.add(componentsTabShowPatternButton, constraints);
        
        componentsTabDuplicateButton = new JButton(Translator.localize("patternwizard.button.duplicate"));
        componentsTabDuplicateButton.addActionListener(this); 
        componentsTabDuplicateButton.setActionCommand(DUPLICATE_COMPONENT);
        componentsTabDuplicateButton.setEnabled(false);
        constraints.gridx = 1;
        buttonPanel.add(componentsTabDuplicateButton, constraints);
        
        componentsTabUndoButton = new JButton(Translator.localize("patternwizard.button.undo"));
        componentsTabUndoButton.addActionListener(this); 
        componentsTabUndoButton.setActionCommand(UNDO_COMPONENT_CHANGES);
        componentsTabUndoButton.setEnabled(false);
        constraints.gridx = 2;
        buttonPanel.add(componentsTabUndoButton, constraints);
        
        constraints.gridwidth = 2;
        constraints.gridy = 1;
        constraints.gridx = 0;
        patternComponentsPanel.add(buttonPanel, constraints);

        JPanel patternComponentsContainer = new JPanel(new FlowLayout(FlowLayout.CENTER, 0, 0));
        patternComponentsContainer.setBorder(BorderFactory.createTitledBorder(Translator.localize("patternwizard.titled-border.pattern-components")));
        patternComponentsContainer.add(patternComponentsPanel);

        // ##################################
        
        JPanel componentPropertiePanel = new JPanel(new GridBagLayout());
        
        JLabel componentNameLabel = new JLabel(Translator.localize("patternwizard.label.name"));
        constraints.fill = GridBagConstraints.BOTH;
        constraints.gridwidth = 2;
        constraints.gridx = 0;
        constraints.gridy = 0;
        constraints.weightx = 1.0;
        constraints.weighty = 1.0;
        componentPropertiePanel.add(componentNameLabel, constraints);

        componentNameTextField = new JTextField();
        componentNameTextField.setMinimumSize(new Dimension(313, 27));
        componentNameTextField.setPreferredSize(componentNameTextField.getMinimumSize());
        componentNameTextField.setSize(componentNameTextField.getMinimumSize());
        constraints.gridy = 1;
        componentPropertiePanel.add(componentNameTextField, constraints);

        JLabel componentStereotypeLabel = new JLabel(Translator.localize("patternwizard.label.stereotype"));
        constraints.gridy = 2;
        componentPropertiePanel.add(componentStereotypeLabel, constraints);
        
        componentStereotypeListModel = new DefaultListModel();
        componentStereotypeList = new JList(componentStereotypeListModel);
        componentStereotypeList.setCellRenderer(new IconAndTextCellRenderer());
        componentStereotypeList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        componentStereotypeList.addListSelectionListener(this);
        JScrollPane componentStereotypeScrollPane = new JScrollPane(componentStereotypeList);
        componentStereotypeScrollPane.setMinimumSize(new Dimension(237, 155));
        componentStereotypeScrollPane.setPreferredSize(componentStereotypeScrollPane.getMinimumSize());
        componentStereotypeScrollPane.setSize(componentStereotypeScrollPane.getMinimumSize());
        constraints.gridwidth = 1;
        constraints.gridy = 3;
        componentPropertiePanel.add(componentStereotypeScrollPane, constraints);
        
        JPanel componentStereotypeContainer = new JPanel(new FlowLayout(FlowLayout.CENTER, 0, 0));
        
        JButton componentStereotypeEditButton = new JButton(Translator.localize("patternwizard.button.edit-stereotypes"));
        componentStereotypeEditButton.addActionListener(this); 
        componentStereotypeEditButton.setActionCommand(EDIT_COMPONENT_STEREOTYPE);
        componentStereotypeContainer.add(componentStereotypeEditButton);
        
        constraints.gridx = 1;
        constraints.anchor = GridBagConstraints.CENTER;
        componentPropertiePanel.add(componentStereotypeContainer, constraints);  
        
        JPanel componentButtonPanel = new JPanel(new GridBagLayout());

        JButton componentApplyChangesButton = new JButton(Translator.localize("patternwizard.button.apply-changes"));
        componentApplyChangesButton.addActionListener(this); 
        componentApplyChangesButton.setActionCommand(MODIFY_COMPONENT);
        constraints.gridwidth = 1;
        constraints.gridy = 0;
        constraints.gridx = 0;
        constraints.anchor = GridBagConstraints.CENTER;
        componentButtonPanel.add(componentApplyChangesButton, constraints);     
        
        JButton componentResetChangesButton = new JButton(Translator.localize("patternwizard.button.reset"));
        componentResetChangesButton.addActionListener(this); 
        componentResetChangesButton.setActionCommand(RESET_COMPONENT_PROPERTIES);
        constraints.gridx = 1;
        componentButtonPanel.add(componentResetChangesButton, constraints);   
        
        constraints.gridwidth = 2;
        constraints.gridx = 0;
        constraints.gridy = 4;
        componentPropertiePanel.add(componentButtonPanel, constraints);

        componentPropertieContainer = new JPanel(new FlowLayout(FlowLayout.CENTER, 0, 0));
        componentPropertieContainer.setBorder(BorderFactory.createTitledBorder(Translator.localize("patternwizard.titled-border.component-properties")));
        componentPropertieContainer.add(componentPropertiePanel);

        componentPropertieContainer.setVisible(false);
        
        // ##################################
        
        JPanel attributePropertiePanel = new JPanel(new GridBagLayout());

        JLabel attributeNameLabel = new JLabel(Translator.localize("patternwizard.label.name"));
        constraints.fill = GridBagConstraints.BOTH;
        constraints.gridwidth = 2;
        constraints.gridx = 0;
        constraints.gridy = 0;
        constraints.weightx = 1.0;
        constraints.weighty = 1.0;
        attributePropertiePanel.add(attributeNameLabel, constraints);
        
        attributeNameTextField = new JTextField();
        attributeNameTextField.setMinimumSize(new Dimension(313, 27));
        attributeNameTextField.setPreferredSize(attributeNameTextField.getMinimumSize());
        attributeNameTextField.setSize(attributeNameTextField.getMinimumSize());
        constraints.gridy = 1;
        attributePropertiePanel.add(attributeNameTextField, constraints);
        
        JLabel attributeStereotypeLabel = new JLabel(Translator.localize("patternwizard.label.stereotype"));
        constraints.gridwidth = 2;
        constraints.gridx = 0;
        constraints.gridy = 2;
        attributePropertiePanel.add(attributeStereotypeLabel, constraints);
        
        attributeStereotypeListModel = new DefaultListModel();
        attributeStereotypeList = new JList(attributeStereotypeListModel);
        attributeStereotypeList.setCellRenderer(new IconAndTextCellRenderer());
        attributeStereotypeList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        attributeStereotypeList.addListSelectionListener(this);
        JScrollPane attributeStereotypeScrollPane = new JScrollPane(attributeStereotypeList);
        attributeStereotypeScrollPane.setMinimumSize(new Dimension(237, 155));
        attributeStereotypeScrollPane.setPreferredSize(attributeStereotypeScrollPane.getMinimumSize());
        attributeStereotypeScrollPane.setSize(attributeStereotypeScrollPane.getMinimumSize());
        constraints.gridwidth = 1;
        constraints.gridy = 3;
        attributePropertiePanel.add(attributeStereotypeScrollPane, constraints);
        
        JPanel attributeStereotypeContainer = new JPanel(new FlowLayout(FlowLayout.CENTER, 0, 0));
                
        JButton attributeStereotypeEditButton = new JButton(Translator.localize("patternwizard.button.edit-stereotypes"));
        attributeStereotypeEditButton.addActionListener(this); 
        attributeStereotypeEditButton.setActionCommand(EDIT_ATTRIBUTE_STEREOTYPE);
        attributeStereotypeContainer.add(attributeStereotypeEditButton);
        
        constraints.gridx = 1;
        constraints.anchor = GridBagConstraints.CENTER;
        attributePropertiePanel.add(attributeStereotypeContainer, constraints);  
        
        JPanel attributeButtonPanel = new JPanel(new GridBagLayout());

        JButton attributeApplyChangesButton = new JButton(Translator.localize("patternwizard.button.apply-changes"));
        attributeApplyChangesButton.addActionListener(this); 
        attributeApplyChangesButton.setActionCommand(MODIFY_ATTRIBUTE);
        constraints.gridwidth = 1;
        constraints.gridy = 0;
        constraints.gridx = 0;
        constraints.anchor = GridBagConstraints.CENTER;
        attributeButtonPanel.add(attributeApplyChangesButton, constraints);     
        
        JButton attributeResetChangesButton = new JButton(Translator.localize("patternwizard.button.reset"));
        attributeResetChangesButton.addActionListener(this); 
        attributeResetChangesButton.setActionCommand(RESET_ATTRIBUTE_PROPERTIES);
        constraints.gridx = 1;
        attributeButtonPanel.add(attributeResetChangesButton, constraints);   
        
        constraints.gridwidth = 2;
        constraints.gridx = 0;
        constraints.gridy = 4;
        attributePropertiePanel.add(attributeButtonPanel, constraints);

        attributePropertieContainer = new JPanel(new FlowLayout(FlowLayout.CENTER, 0, 0));
        attributePropertieContainer.setBorder(BorderFactory.createTitledBorder(Translator.localize("patternwizard.titled-border.attribute-properties")));
        attributePropertieContainer.add(attributePropertiePanel);

        attributePropertieContainer.setVisible(false);
        
        // ##################################        
        
        JPanel methodPropertiePanel = new JPanel(new GridBagLayout());

        JLabel methodNameLabel = new JLabel(Translator.localize("patternwizard.label.name"));
        constraints.fill = GridBagConstraints.BOTH;
        constraints.gridwidth = 2;
        constraints.gridx = 0;
        constraints.gridy = 0;
        constraints.weightx = 1.0;
        constraints.weighty = 1.0;
        methodPropertiePanel.add(methodNameLabel, constraints);
        
        methodNameTextField = new JTextField();
        methodNameTextField.setMinimumSize(new Dimension(313, 27));
        methodNameTextField.setPreferredSize(methodNameTextField.getMinimumSize());
        methodNameTextField.setSize(methodNameTextField.getMinimumSize());
        constraints.gridy = 1;
        methodPropertiePanel.add(methodNameTextField, constraints);

        JLabel methodStereotypeLabel = new JLabel(Translator.localize("patternwizard.label.stereotype"));
        constraints.gridy = 2;
        methodPropertiePanel.add(methodStereotypeLabel, constraints);
        
        methodStereotypeListModel = new DefaultListModel();
        methodStereotypeList = new JList(methodStereotypeListModel);
        methodStereotypeList.setCellRenderer(new IconAndTextCellRenderer());
        methodStereotypeList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        methodStereotypeList.addListSelectionListener(this);
        JScrollPane methodStereotypeScrollPane = new JScrollPane(methodStereotypeList);
        methodStereotypeScrollPane.setMinimumSize(new Dimension(237, 155));
        methodStereotypeScrollPane.setPreferredSize(methodStereotypeScrollPane.getMinimumSize());
        methodStereotypeScrollPane.setSize(methodStereotypeScrollPane.getMinimumSize());
        constraints.gridwidth = 1;
        constraints.gridy = 3;
        methodPropertiePanel.add(methodStereotypeScrollPane, constraints);
        
        JPanel methodStereotypeContainer = new JPanel(new FlowLayout(FlowLayout.CENTER, 0, 0));
        
        JButton methodStereotypeEditButton = new JButton(Translator.localize("patternwizard.button.edit-stereotypes"));
        methodStereotypeEditButton.addActionListener(this); 
        methodStereotypeEditButton.setActionCommand(EDIT_METHOD_STEREOTYPE);
        methodStereotypeContainer.add(methodStereotypeEditButton);
        
        constraints.gridx = 1;
        constraints.anchor = GridBagConstraints.CENTER;
        methodPropertiePanel.add(methodStereotypeContainer, constraints);  
        
        JPanel methodButtonPanel = new JPanel(new GridBagLayout());

        JButton methodApplyChangesButton = new JButton(Translator.localize("patternwizard.button.apply-changes"));
        methodApplyChangesButton.addActionListener(this); 
        methodApplyChangesButton.setActionCommand(MODIFY_METHOD);
        constraints.gridwidth = 1;
        constraints.gridy = 0;
        constraints.gridx = 0;
        constraints.anchor = GridBagConstraints.CENTER;
        methodButtonPanel.add(methodApplyChangesButton, constraints);     
        
        JButton methodResetChangesButton = new JButton(Translator.localize("patternwizard.button.reset"));
        methodResetChangesButton.addActionListener(this); 
        methodResetChangesButton.setActionCommand(RESET_METHOD_PROPERTIES);
        constraints.gridx = 1;
        methodButtonPanel.add(methodResetChangesButton, constraints);   
        
        constraints.gridwidth = 2;
        constraints.gridx = 0;
        constraints.gridy = 4;
        methodPropertiePanel.add(methodButtonPanel, constraints);

        methodPropertieContainer = new JPanel(new FlowLayout(FlowLayout.CENTER, 0, 0));
        methodPropertieContainer.setBorder(BorderFactory.createTitledBorder(Translator.localize("patternwizard.titled-border.method-properties")));
        methodPropertieContainer.add(methodPropertiePanel);

        methodPropertieContainer.setVisible(false);
  
        // ##################################
        
        SpacerPanel spacerPropertieContainer = new SpacerPanel(325, 20);
        
        // ##################################

        constraints = new GridBagConstraints();
        constraints.fill = GridBagConstraints.BOTH;
        constraints.gridx = 0;
        constraints.gridy = 0;
        constraints.gridwidth = 1;
        constraints.gridheight = 1;
        constraints.weightx = 1.0;
        constraints.weighty = 1.0;
        componentsTab.add(patternComponentsContainer, constraints);
        
        constraints.gridx = 1;
        componentsTab.add(componentPropertieContainer, constraints);
        
        componentsTab.add(attributePropertieContainer, constraints);
        
        componentsTab.add(methodPropertieContainer, constraints);

        componentsTab.add(spacerPropertieContainer, constraints);
        
        // ##################################

        JPanel bottomContainer = new JPanel(new GridBagLayout());
        
        JButton back2SourcePatternTabButton = new JButton(Translator.localize("patternwizard.button.back"));
        back2SourcePatternTabButton.setMnemonic(Translator.localize("patternwizard.button.back.mnemonic").charAt(0));
        back2SourcePatternTabButton.addActionListener(this);
        back2SourcePatternTabButton.setActionCommand(BACK_TO_PREVIOUS_TAB);
        constraints.gridx = 0;
        constraints.gridy = 1;
        constraints.gridwidth = 1;
        constraints.weightx = 0.0;
        constraints.weighty = 0.0;
        constraints.anchor = GridBagConstraints.WEST;
        bottomContainer.add(back2SourcePatternTabButton, constraints);
        
        // add the text-area which will display the changes made on the selected component or feature
        changesHistoryTextArea = new JTextArea();
        changesHistoryTextArea.setEnabled(false);
        Font font = changesHistoryTextArea.getFont();
        font = font.deriveFont((float)(font.getSize()-3));
        changesHistoryTextArea.setFont(font);
        changesHistoryTextArea.setLineWrap(true);
        changesHistoryTextArea.setWrapStyleWord(true);
        changesHistoryTextArea.setBackground(componentsTab.getBackground());
        changesHistoryTextArea.setMinimumSize(new Dimension(570, 29));
        changesHistoryTextArea.setSize(changesHistoryTextArea.getMinimumSize());  
        changesHistoryTextArea.setPreferredSize(changesHistoryTextArea.getMinimumSize());
        constraints.gridx = 1;
        constraints.weightx = 1.0;
        constraints.anchor = GridBagConstraints.CENTER;
        bottomContainer.add(changesHistoryTextArea, constraints);
        
        JButton forward2RelationsTabButton = new JButton(Translator.localize("patternwizard.button.next"));
        forward2RelationsTabButton.setMnemonic(Translator.localize("patternwizard.button.next.mnemonic").charAt(0));
        forward2RelationsTabButton.addActionListener(this);
        forward2RelationsTabButton.setActionCommand(FORWARD_TO_NEXT_TAB);
        constraints.gridx = 2;
        constraints.weightx = 0.0;
        constraints.anchor = GridBagConstraints.EAST;
        bottomContainer.add(forward2RelationsTabButton, constraints);

        // ##################################
        
        constraints.fill = GridBagConstraints.HORIZONTAL;
        constraints.gridx = 0;
        constraints.gridy = 1;
        constraints.gridwidth = 2;
        constraints.weightx = 1.0;
        constraints.weighty = 0.0;
        constraints.anchor = GridBagConstraints.CENTER;
        componentsTab.add(bottomContainer, constraints);
        
        return componentsTab;
    }
    

    /**
     * Initialise the tab "Relations".
     */
    private JPanel makeRelationsTab() {

        JPanel relationsTab = new JPanel(new GridBagLayout());
        
        GridBagConstraints constraints = new GridBagConstraints();

        // ##############################

        JPanel relationsPanel = new JPanel(new GridBagLayout());
        
        relationsListModel = new DefaultListModel();
        relationsListModel.addListDataListener(this);
        relationsList = new JListDnDWithMerge(relationsListModel);
        relationsList.setCellRenderer(new IconAndTextCellRenderer());
        relationsList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        relationsList.addListSelectionListener(this);
        JScrollPane relationsScrollPane = new JScrollPane(relationsList);
        relationsScrollPane.setMinimumSize(new Dimension(460, 214));
        relationsScrollPane.setPreferredSize(relationsScrollPane.getMinimumSize());
        relationsScrollPane.setSize(relationsScrollPane.getMinimumSize());
        constraints.fill = GridBagConstraints.BOTH;
        constraints.gridwidth = 2;
        constraints.gridx = 0;
        constraints.gridy = 0;
        constraints.weightx = 1.0;
        constraints.weighty = 1.0;
        relationsPanel.add(relationsScrollPane, constraints);
        
        relationsTabShowPatternButton = new JButton(Translator.localize("patternwizard.button.show-pattern"));
        relationsTabShowPatternButton.addActionListener(this); 
        relationsTabShowPatternButton.setActionCommand(SHOW_PATTERN_OF_RELATION);
        relationsTabShowPatternButton.setEnabled(false);
        constraints.gridwidth = 1;
        constraints.gridy = 1;
        constraints.anchor = GridBagConstraints.CENTER;
        relationsPanel.add(relationsTabShowPatternButton, constraints);
        
        relationsTabUndoButton = new JButton(Translator.localize("patternwizard.button.undo"));
        relationsTabUndoButton.addActionListener(this); 
        relationsTabUndoButton.setActionCommand(UNDO_RELATION_CHANGES);
        relationsTabUndoButton.setEnabled(false);
        constraints.gridx = 1;
        relationsPanel.add(relationsTabUndoButton, constraints);

        JPanel realtionsContainer = new JPanel(new FlowLayout(FlowLayout.CENTER, 0, 0));
        realtionsContainer.setBorder(BorderFactory.createTitledBorder(Translator
                .localize("patternwizard.titled-border.relations")));
        realtionsContainer.add(relationsPanel);
        
        // ##################################
        
        JPanel generalPropertiePanel = new JPanel(new GridBagLayout());

        JLabel realtionNameLabel = new JLabel(Translator.localize("patternwizard.label.name"));
        constraints.fill = GridBagConstraints.BOTH;
        constraints.gridwidth = 2;
        constraints.gridx = 0;
        constraints.gridy = 0;
        constraints.weightx = 1.0;
        constraints.weighty = 1.0;
        generalPropertiePanel.add(realtionNameLabel, constraints);

        relationNameTextField = new JTextField();
        relationNameTextField.setMinimumSize(new Dimension(313, 27));
        relationNameTextField.setPreferredSize(relationNameTextField.getMinimumSize());
        relationNameTextField.setSize(relationNameTextField.getMinimumSize());
        constraints.gridy = 1;
        generalPropertiePanel.add(relationNameTextField, constraints);

        JLabel realtionStereotypeLabel = new JLabel(Translator.localize("patternwizard.label.stereotype"));
        constraints.gridy = 2;
        generalPropertiePanel.add(realtionStereotypeLabel, constraints);       
        
        relationStereotypeListModel = new DefaultListModel();
        relationStereotypeList = new JList(relationStereotypeListModel);
        relationStereotypeList.setCellRenderer(new IconAndTextCellRenderer());
        relationStereotypeList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        relationStereotypeList.addListSelectionListener(this);
        JScrollPane relationStereotypeScrollPane = new JScrollPane(relationStereotypeList);
        relationStereotypeScrollPane.setMinimumSize(new Dimension(237, 37));
        relationStereotypeScrollPane.setPreferredSize(relationStereotypeScrollPane.getMinimumSize());
        relationStereotypeScrollPane.setSize(relationStereotypeScrollPane.getMinimumSize());
        constraints.gridwidth = 1;
        constraints.gridy = 3;
        generalPropertiePanel.add(relationStereotypeScrollPane, constraints);
        
        JPanel realtionStereotypeContainer = new JPanel(new FlowLayout(FlowLayout.CENTER, 0, 0));
        
        JButton realtionStereotypeEditButton = new JButton(Translator.localize("patternwizard.button.edit-stereotypes"));
        realtionStereotypeEditButton.addActionListener(this); 
        realtionStereotypeEditButton.setActionCommand(EDIT_RELATION_STEREOTYPE);
        realtionStereotypeContainer.add(realtionStereotypeEditButton);
        
        constraints.gridx = 1;
        constraints.anchor = GridBagConstraints.CENTER;
        generalPropertiePanel.add(realtionStereotypeContainer, constraints);          
        
        JPanel realtionButtonPanel = new JPanel(new GridBagLayout());

        JButton realtionApplyChangesButton = new JButton(Translator.localize("patternwizard.button.apply-changes"));
        realtionApplyChangesButton.addActionListener(this); 
        realtionApplyChangesButton.setActionCommand(MODIFY_RELATION);
        constraints.gridwidth = 1;
        constraints.gridy = 0;
        constraints.gridx = 0;
        realtionButtonPanel.add(realtionApplyChangesButton, constraints);     
        
        JButton realtionResetChangesButton = new JButton(Translator.localize("patternwizard.button.reset"));
        realtionResetChangesButton.addActionListener(this); 
        realtionResetChangesButton.setActionCommand(RESET_RELATION_PROPERTIES);
        constraints.gridx = 1;
        realtionButtonPanel.add(realtionResetChangesButton, constraints);   
        
        constraints.gridwidth = 2;
        constraints.gridx = 0;
        constraints.gridy = 4;
        generalPropertiePanel.add(realtionButtonPanel, constraints);

        generalPropertieContainer = new JPanel(new FlowLayout(FlowLayout.CENTER, 0, 0));
        generalPropertieContainer.setBorder(BorderFactory.createTitledBorder(Translator.localize("patternwizard.titled-border.general-properties")));
        generalPropertieContainer.add(generalPropertiePanel);

        generalPropertieContainer.setVisible(false);
        
        // ##################################
        
        SpacerPanel spacerPropertieContainer = new SpacerPanel(325, 114);
        
        // ##################################
        
        JPanel associationPropertiePanel = new JPanel(new GridBagLayout());

        JLabel roleANameLabel = new JLabel(Translator.localize("patternwizard.label.role_a"));
        constraints.fill = GridBagConstraints.BOTH;
        constraints.gridwidth = 1;
        constraints.gridx = 0;
        constraints.gridy = 0;
        constraints.weightx = 1.0;
        constraints.weighty = 1.0;
        associationPropertiePanel.add(roleANameLabel, constraints);

        roleANameTextField = new JTextField();
        roleANameTextField.setMinimumSize(new Dimension(237, 27));
        roleANameTextField.setPreferredSize(roleANameTextField.getMinimumSize());
        roleANameTextField.setSize(roleANameTextField.getMinimumSize());
        constraints.gridy = 1;
        associationPropertiePanel.add(roleANameTextField, constraints);
        
        JLabel roleACardinalityLabel = new JLabel(Translator.localize("patternwizard.label.multiplicity"));
        constraints.gridx = 1;
        constraints.gridy = 0;
        associationPropertiePanel.add(roleACardinalityLabel, constraints);       
        
        roleACardinalityComboBox = new JComboBox(multiplicityVector);
        constraints.gridy = 1;
        associationPropertiePanel.add(roleACardinalityComboBox, constraints);
        
        JLabel roleBNameLabel = new JLabel(Translator.localize("patternwizard.label.role_b"));
        constraints.gridx = 0;
        constraints.gridy = 3;
        associationPropertiePanel.add(roleBNameLabel, constraints);

        roleBNameTextField = new JTextField();
        constraints.gridy = 4;
        associationPropertiePanel.add(roleBNameTextField, constraints);
        
        JLabel roleBCardinalityLabel = new JLabel(Translator.localize("patternwizard.label.multiplicity"));
        constraints.gridx = 1;
        constraints.gridy = 3;
        associationPropertiePanel.add(roleBCardinalityLabel, constraints);       
        
        roleBCardinalityComboBox = new JComboBox(multiplicityVector);
        constraints.gridy = 4;
        associationPropertiePanel.add(roleBCardinalityComboBox, constraints);

        associationPropertieContainer = new JPanel(new FlowLayout(FlowLayout.CENTER, 0, 0));
        associationPropertieContainer.setBorder(BorderFactory.createTitledBorder(Translator.localize("patternwizard.titled-border.association-properties")));
        associationPropertieContainer.add(associationPropertiePanel);

        associationPropertieContainer.setVisible(false);
        
        // ##############################
        
        constraints.fill = GridBagConstraints.BOTH;
        constraints.gridx = 0;
        constraints.gridy = 0;
        constraints.gridwidth = 1;
        constraints.gridheight = 2;
        constraints.weightx = 1.0;
        constraints.weighty = 1.0;
        relationsTab.add(realtionsContainer, constraints);        
        
        constraints.gridx = 1;
        constraints.gridheight = 1;
        relationsTab.add(associationPropertieContainer, constraints);
        
        relationsTab.add(spacerPropertieContainer, constraints);
        
        constraints.gridx = 1;
        constraints.gridy = 1;
        relationsTab.add(generalPropertieContainer, constraints);
        
        // ##################################

        JButton back2ComponentsTabButton = new JButton(Translator.localize("patternwizard.button.back"));
        back2ComponentsTabButton.setMnemonic(Translator.localize("patternwizard.button.back.mnemonic").charAt(0));
        back2ComponentsTabButton.addActionListener(this);
        back2ComponentsTabButton.setActionCommand(BACK_TO_PREVIOUS_TAB);
        constraints.fill = GridBagConstraints.NONE;
        constraints.gridx = 0;
        constraints.gridy = 2;
        constraints.weightx = 0.0;
        constraints.weighty = 0.0;
        constraints.anchor = GridBagConstraints.WEST;
        relationsTab.add(back2ComponentsTabButton, constraints);
        
        return relationsTab;
    }    

    /**
     * Initialise the tab "Help".
     */
    private JPanel makeHelpTab() {
        JPanel helpTab = new JPanel(new BorderLayout());
        JTextArea helpText = new JTextArea();
        helpText.setText(Translator.localize("patternwizard.helptext"));
        helpText.setEditable(false);
        helpText.setMargin(new Insets(INSET_PX, INSET_PX, INSET_PX, INSET_PX));
        helpText.setLineWrap(true);
        helpText.setWrapStyleWord(true);
        helpTab.add(new JScrollPane(helpText), BorderLayout.CENTER);
        
        return helpTab;
    }
    
    /**
     * This methode searches for all packages with the steroetype <<Patter>> 
     * and updates the pattern list with them.
     */
    private void updatePatternList() {     

        Object model = ProjectManager.getManager().getCurrentProject().getRoot();
      
        // clear the pattern list as we are going to reload the available pattern
        availablePatternListModel.clear();  
      
        // identify all existing packages
        Iterator packageIterator = Model.getModelManagementHelper().getAllModelElementsOfKindWithModel(
                        model, Model.getMetaTypes().getPackage()).iterator();
        LOG.debug("Pattern-Packages:");
        ArgoElementWrapper aPackage;
        while (packageIterator.hasNext()) {
            Object packageObject = packageIterator.next();
            // identify the stereotype of the package
            Iterator stereotypeIterator = Model.getFacade().getStereotypes(packageObject).iterator();
            // run through the stereotypes
            while (stereotypeIterator.hasNext()) {
                Object stereotypeObject = stereotypeIterator.next();
                String packageName = Model.getFacade().getName(packageObject);
                // in case it has the <<Pattern>>-Stereotype and is not already in the selected pattern list
                if ( Constants.PATTERN_STEREOTYPE_NAME.equals(Model.getFacade().getName(stereotypeObject)) && !selectedPatternListModel.contains(packageName) ) {
                    LOG.debug("--- " + packageName + " - UUID: " + Model.getFacade().getUUID(packageObject));
                    // store the package object in a ArgoElementWrapper so we can access it later
                    aPackage = new ArgoElementWrapper(packageObject, packageName);
                    // add the package (equal to the pattern) to the pattern list
                    availablePatternListModel.addElement(aPackage);            
                    
                    break;
                }
            }                    
        }                
    }
    
    /**
     * Update the List with the Class Components.     *
     */
    private void updateComponentsList() {
        
        componentsListModel.clear();
        Object aClass;
        
        LOG.debug("updating component list:");        
        
        // if we want to transform selected classes and their are some selected
        if ( (transformCheckBox.isSelected()) && (userPattern.getInputClassDiagram() != null) ) {
            // get the name of the selected class diagram
            String inputDiagramName = userPattern.getInputClassDiagram().getName();  
            // add the name to the ListModel
            componentsListModel.addElement(inputDiagramName);
            LOG.debug("-- " + inputDiagramName);
            
            // get all of the selected input classes
            Iterator selectedClasses = userPattern.getComponentsByPattern(userPattern.getInputClassDiagramId()).iterator();
            // if there are classes selected
            if(!selectedClasses.hasNext())
                componentsListModel.addElement("---");  
            // run through all of them
            else
                while(selectedClasses.hasNext()) {
                    aClass = selectedClasses.next();  
                    LOG.debug("---- " + aClass);
                    componentsListModel.addElement(aClass);    
                }
        }        
        
        // get all selected pattern
        Iterator selectedPattern = userPattern.getSourcePattern().iterator();        
        while(selectedPattern.hasNext()) {                          
            Object patternPackage = selectedPattern.next();  
            // get the name of the pattern
            String patternPackageName = Model.getFacade().getName(patternPackage);  
            // add the name to the ListModel
            componentsListModel.addElement(patternPackageName);
            LOG.debug("-- " + patternPackageName);
            
            // get all of the patterns class components
            Iterator children = userPattern.getComponentsByPattern(patternPackage).iterator();
            while(children.hasNext()) {
                aClass = children.next();  
                // add the class to the ListModel
                componentsListModel.addElement(aClass);    
                LOG.debug("---- " + aClass);
            }            
        }
        
        // get all changed class components
        Iterator changedComponents = userPattern.getChangedComponents().iterator();
        if (changedComponents.hasNext()) {
            componentsListModel.addElement(Translator.localize("patternwizard.label.modified"));
            while(changedComponents.hasNext()) {
                aClass = changedComponents.next(); 
                // add the class to the ListModel
                componentsListModel.addElement(aClass);   
                LOG.debug("---- " + aClass);
            }  
        }
    }
    
    /**
     * Update the features list.
     */
    private void updateFeaturesList() {
        
        featuresListModel.clear();
        LOG.debug("updating feature list:");
        
        // retrieve the object of the class selected 
        ClassAbstract selectedClass = (ClassAbstract)componentsList.getSelectedValue();

        // retrieve the attributes of the selected class
        Iterator selectedClassAttributes = selectedClass.getAttributes().iterator();
        Object aAttribute;
        LOG.debug("-- attributes:");
        while(selectedClassAttributes.hasNext()){
            aAttribute = selectedClassAttributes.next(); 
            LOG.debug("---- " + aAttribute);
            featuresListModel.addElement(aAttribute);  
        }  
        
        // retrieve the methods of the selected class
        Iterator selectedClassMethods = selectedClass.getMethods().iterator();
        Object aMethode;
        LOG.debug("-- methodes:");
        while(selectedClassMethods.hasNext()){
            aMethode = selectedClassMethods.next(); 
            LOG.debug("---- " + aMethode);
            featuresListModel.addElement(aMethode);   
        }          
    }
    
    /**
     * Update the relations list.
     */
    private void updateRelationsList() {
        
        relationsListModel.clear();
        LOG.debug("updating relations list:");
        
        // get all relations of the selected pattern
        Iterator relations = userPattern.getRelations().iterator();  
        while(relations.hasNext()) { 
            RelationAbstract aRelation = (RelationAbstract)relations.next();
            LOG.debug("relation: "+((ClassAbstract)aRelation.getClassifierA()).getName()+" -- "+((ClassAbstract)aRelation.getClassifierB()).getName());
            relationsListModel.addElement(aRelation);           
        } 
    }

    /**
     * Update the properties area with the properties of the given class.
     * 
     * @param component The class of which the properties should be displayed.
     */
    private void updateComponentProperties(Object component) {

        // if the component properties area is not visible
        if(!componentPropertieContainer.isVisible()) {
            componentPropertieContainer.setVisible(true);
            attributePropertieContainer.setVisible(false);   
            methodPropertieContainer.setVisible(false);    
        }

        // display the name of the current selected class
        componentNameTextField.setText(((ClassAbstract)component).getName());
        componentNameTextField.setCaretPosition(0);
        if (((ClassAbstract)component).isAttentionNeeded()) componentNameTextField.setForeground(Color.RED);
        else componentNameTextField.setForeground(Color.BLACK);
        // and its stereotypes
        componentStereotypeListModel.clear();
        EditStereotypes.addAll(((ClassAbstract)component).getStereotypes(), componentStereotypeListModel);      
    }
    
    /**
     * Update the properties area with the properties of the given attribute.
     * 
     * @param attribute The attribute of which the properties should be displayed.
     */
    private void updateAttributeProperties(Object attribute) {

        // if the attribute properties area is not visible
        if(!attributePropertieContainer.isVisible()) {
            componentPropertieContainer.setVisible(false);
            attributePropertieContainer.setVisible(true);   
            methodPropertieContainer.setVisible(false);                   
        }
        
        // display the name of the current selected attribute        
        attributeNameTextField.setText(((AttributeAbstract)attribute).getName());
        attributeNameTextField.setCaretPosition(0);
        if (((AttributeAbstract)attribute).isAttentionNeeded()) attributeNameTextField.setForeground(Color.RED);
        else attributeNameTextField.setForeground(Color.BLACK);
        // and its stereotypes
        attributeStereotypeListModel.clear();
        EditStereotypes.addAll(((AttributeAbstract)attribute).getStereotypes(), attributeStereotypeListModel);    
    }
    
    /**
     * Update the properties area with the properties of the given method.
     * 
     * @param method The method of which the properties should be displayed.
     */
    private void updateMethodProperties(Object method) {

        // if the method properties area is not visible
        if(!methodPropertieContainer.isVisible()) {
            componentPropertieContainer.setVisible(false);
            attributePropertieContainer.setVisible(false);   
            methodPropertieContainer.setVisible(true);             
        }
        
        // display the name of the current selected method        
        methodNameTextField.setText(((MethodAbstract)method).getName());
        methodNameTextField.setCaretPosition(0);  
        if (((MethodAbstract)method).isAttentionNeeded()) methodNameTextField.setForeground(Color.RED);
        else methodNameTextField.setForeground(Color.BLACK);
        // and its stereotypes
        methodStereotypeListModel.clear();
        EditStereotypes.addAll(((MethodAbstract)method).getStereotypes(), methodStereotypeListModel);        
    }
    
    /**
     * Update the properties area with the properties of the given relation.
     * 
     * @param relation The relation of which the properties should be displayed.
     */
    private void updateRelationProperties(Object relation) {

        // make the general relation properties area visible (just in case it isn't already)
        generalPropertieContainer.setVisible(true);             
        
        // display the properties of the current selected relation          
        relationNameTextField.setText(((RelationAbstract)relation).getName());
        relationNameTextField.setCaretPosition(0);
        
        relationStereotypeListModel.clear();
        EditStereotypes.addAll(((RelationAbstract)relation).getStereotypes(), relationStereotypeListModel);
        
        // show the association properties if needed
        if (((RelationAbstract)relation).isAAssociation()) {
            associationPropertieContainer.setVisible(true);    
            roleANameTextField.setText(((RelationAbstract)relation).getAssociationRoleA());
            roleANameTextField.setCaretPosition(0);
            roleACardinalityComboBox.setSelectedItem(((RelationAbstract)relation).getAssociationRoleAMultiplicity());
            roleBNameTextField.setText(((RelationAbstract)relation).getAssociationRoleB());
            roleBNameTextField.setCaretPosition(0);
            roleBCardinalityComboBox.setSelectedItem(((RelationAbstract)relation).getAssociationRoleBMultiplicity());
        } else {
            associationPropertieContainer.setVisible(false);
        }
    }
    
    /**
     * Hide all property areas in the components tab.
     */
    private void hideComponentPropertyAreas() {
        componentPropertieContainer.setVisible(false);
        attributePropertieContainer.setVisible(false);   
        methodPropertieContainer.setVisible(false);             
    }
    
    /**
     * Hide all property areas in the relations tab.
     */
    private void hideRelationPropertyAreas() {
        generalPropertieContainer.setVisible(false);
        associationPropertieContainer.setVisible(false);        
    }
    
    /**
     * Merge the given classes.
     *
     * @param class1 The first class to merge.
     * @param class2 The second class to merge.
     */
    private void mergeComponents(Object class1, Object class2) {
        // create a collection with the components to merge
        Collection componentsToMerge = new ArrayList();
        componentsToMerge.add(class1);
        componentsToMerge.add(class2);
        // merge the components
        userPattern.mergeComponents(componentsToMerge);
    }
    
    /**
     * Merge the given attributes.
     *
     * @param attribute1 The first attribute to merge.
     * @param attribute2 The second attribute to merge.
     * @param owner The class this attributes belong to.
     */
    private void mergeAttributes(Object attribute1, Object attribute2, Object owner) {
        // create a collection with the attributes to merge
        Collection attributesToMerge = new ArrayList();
        attributesToMerge.add(attribute1);
        attributesToMerge.add(attribute2);
        // merge the attributes
        userPattern.mergeAttributes(attributesToMerge, owner);
    }
    
    /**
     * Merge the given methods.
     *
     * @param method1 The first method to merge.
     * @param method2 The second method to merge.
     * @param owner The class this methods belong to.
     */
    private void mergeMethods(Object method1, Object method2, Object owner) {
        // create a collection with the methods to merge
        Collection methodsToMerge = new ArrayList();
        methodsToMerge.add(method1);
        methodsToMerge.add(method2);
        // merge the methods
        userPattern.mergeMethods(methodsToMerge, owner);
    }
    
    /**
     * Merge the given relations.
     *
     * @param relation1 The first relation to merge.
     * @param relation2 The second relation to merge.
     */
    private void mergeRelations(Object relation1, Object relation2) {
        // create a collection with the relations to merge
        Collection relationsToMerge = new ArrayList();
        relationsToMerge.add(relation1);
        relationsToMerge.add(relation2);
        // merge the relations
        userPattern.mergeRelations(relationsToMerge);
    }
    
    /**
     * Modify the given class with the entered properties.
     * 
     * @param component The class to modify.
     */
    private void modifyComponent(Object component) {
        
        // retrieve the entered values
        String name = componentNameTextField.getText();
        Collection stereotypes = EditStereotypes.extractStereotypes(componentStereotypeListModel);
        // check if something changed             
        if( !((ClassAbstract)component).getName().equals(name) || !((ClassAbstract)component).getStereotypes().equals(stereotypes) )        
            // modify the component
            userPattern.modifyComponent(component, name, stereotypes);        
    }
    
    /**
     * Modify the given attribute with the entered properties.
     * 
     * @param owner The class the attribute belongs to.
     * @param attribute The attribute to modify.
     */
    private void modifyAttribute(Object owner, Object attribute) {
        
        // retrieve the entered values
        String name = attributeNameTextField.getText();
        Collection stereotypes = EditStereotypes.extractStereotypes(attributeStereotypeListModel);
        
        // check if something changed
        if( !((AttributeAbstract)attribute).getName().equals(name) || !((AttributeAbstract)attribute).getStereotypes().equals(stereotypes) )   
            // modify the attribute
            userPattern.modifyAttribute(owner, attribute, name, stereotypes);
    }
    
    /**
     * Modify the given method with the entered properties.
     * 
     * @param method The method to modify.
     */
    private void modifyMethod(Object owner, Object method) {
        
        // retrieve the entered values
        String name = methodNameTextField.getText();
        Collection stereotypes = EditStereotypes.extractStereotypes(methodStereotypeListModel);
        
        // check if something changed
        if( !((MethodAbstract)method).getName().equals(name) || !((MethodAbstract)method).getStereotypes().equals(stereotypes) )   
            // modify the methode
            userPattern.modifyMethod(owner, method, name, stereotypes);
    }
    
    /**
     * Modify the given relation with the entered properties.
     * 
     * @param relation The relation to modify.
     */
    private void modifyRelation(Object relation) {
        
        // retrieve the entered values
        String name = relationNameTextField.getText();
        Collection stereotypes = EditStereotypes.extractStereotypes(relationStereotypeListModel);
        String roleA = "";
        String roleAMultiplicity = "";
        String roleB = "";
        String roleBMultiplicity = "";
        
        // if the relation is a association, some association specific values might have changed
        if (((RelationAbstract)relation).isAAssociation()) {
            roleA = roleANameTextField.getText();
            roleAMultiplicity = (String)roleACardinalityComboBox.getSelectedItem();
            roleB = roleBNameTextField.getText();
            roleBMultiplicity = (String)roleBCardinalityComboBox.getSelectedItem();
        }
        
        // check if something changed
        if( !((RelationAbstract)relation).getName().equals(name) || !((RelationAbstract)relation).getStereotypes().equals(stereotypes) 
                || !((RelationAbstract)relation).getAssociationRoleA().equals(roleA) || !((RelationAbstract)relation).getAssociationRoleB().equals(roleB)
                || !((RelationAbstract)relation).getAssociationRoleAMultiplicity().equals(roleAMultiplicity) 
                || !((RelationAbstract)relation).getAssociationRoleBMultiplicity().equals(roleBMultiplicity))   
            // modify the relation
            userPattern.modifyRelation(relation, name, stereotypes, roleA, roleAMultiplicity, roleB, roleBMultiplicity);
    }
    
    /**
     * Make a duplicate of the given class.
     * 
     * @param component The class to duplicate.
     */
    private void duplicateComponent(Object component) {
        userPattern.duplicateComponent(component);
    }
    
    /**
     * Make a duplicate of the given attribute.
     * 
     * @param owner The class the attribute belongs to.
     * @param attribute The attribute to duplicate.
     */
    private void duplicateAttribute(Object owner, Object attribute) {
        userPattern.duplicateAttribute(owner, attribute);
    }
    
    /**
     * Make a duplicate of the given method.
     * 
     * @param owner The class the method belongs to.
     * @param method The method to duplicate.
     */
    private void duplicateMethod(Object owner, Object method) {
        userPattern.duplicateMethod(owner, method);
    }
    
    /**
     * Undo the last change made on the given class.
     * 
     * @param component The class of which we want to undo the last action.
     */
    private void undoComponentChanges(Object component) {
        userPattern.undoComponentChanges(component);
    }
    
    /**
     * Undo the last change made on the given attribute.
     * 
     * @param owner The class the attribute belongs to.
     * @param attribute The attribute of which we want to undo the last action.
     */
    private void undoAttributeChanges(Object owner, Object attribute) {
        userPattern.undoAttributeChanges(owner, attribute);
    }
    
    /**
     * Undo the last change made on the given method.
     * 
     * @param owner The class the method belongs to.
     * @param method The method of which we want to undo the last action.
     */
    private void undoMethodChanges(Object owner, Object method) {
        userPattern.undoMethodChanges(owner, method);
    }
    
    /**
     * Undo the last change made on the given relation.
     * 
     * @param relation The relation of which we want to undo the last action.
     */
    private void undoRelationChanges(Object relation) {
        userPattern.undoRelationChanges(relation);
    }
    
    /**
     * Display all changes made on the given modell element.
     * 
     * @param selectedElement The element of which the history should be displayed.
     */
    private void displayHistory(Object selectedElement) {
        String testToDisplay = "";
        
        if (selectedElement instanceof ClassAbstract)        
            testToDisplay = Translator.localize("patternwizard.text.component-selected")+": "+((ClassAbstract)selectedElement).getChangesOverview();
        else if (selectedElement instanceof AttributeAbstract)        
            testToDisplay = Translator.localize("patternwizard.text.attribute-selected")+": "+((AttributeAbstract)selectedElement).getChangesOverview();
        else if (selectedElement instanceof MethodAbstract)        
            testToDisplay = Translator.localize("patternwizard.text.method-selected")+": "+((MethodAbstract)selectedElement).getChangesOverview();
        
        changesHistoryTextArea.setText(testToDisplay);
    }
    
    /**
     * Set if the in ArgoUML selected classes should be transformed with the help 
     * of the Pattern-Wizard or not and perform the necessary steps.
     * 
     * @param transform true if we want to transform the selected classes otherwise false.
     */
    private void transformClasses(boolean transform) {
        // if we are going to transform the selected classes
        if(transform) {
            // deactivate the pattern name input field
            newPatternNameTextField.setEnabled(false);
            // get the selected classes
            Collection targets = TargetManager.getInstance().getTargets();
            // get selected class-diagram
            ArgoDiagram classDiagram = DiagramUtils.getActiveDiagram();//ProjectManager.getManager().getCurrentProject().getActiveDiagram();            
            // store the diagram object in a ArgoElementWrapper like the pattern-packages, 
            // so that the JList with the icons is working
            ArgoElementWrapper aPackage = new ArgoElementWrapper(classDiagram, classDiagram.getName());
            // add it to the selected pattern list (at the beginning of the list)
            selectedPatternList.addElement(0, aPackage);            
            // add the selected classes and the class-diagram they belong to, to the userPattern
            userPattern.addInputClasses(targets, classDiagram);
            // update the list with the components to add the selected classes
            updateComponentsList();
            // update the list with the relations to add the relations of the added classes
            updateRelationsList();
            // activate the apply and reset button (just in case)
            getOkButton().setEnabled(true);
            getHelpButton().setEnabled(true);
        }
        // if we decided not to transform the selected classes
        else {
            // deactivate the pattern name input field
            newPatternNameTextField.setEnabled(true);
            // remove the selected class-diagram from the selected pattern list 
            // (it's alsways at the beginning of the list)
            selectedPatternList.removeElement(0);  
            // and remove it from the selected classes in the userPattern
            userPattern.removeInputClasses();            
            // update the list with the components to remove the selected classes
            updateComponentsList();
            // update the list with the relations to remove the relations of the removed classes
            updateRelationsList();
            // if the list with the selcted pattern is now empty
            if(selectedPatternList.getModel().getSize() == 0) {
                // deactivate the apply and reset button
                getOkButton().setEnabled(false);
                getHelpButton().setEnabled(false);
            }
        }
    }
    
    /**
     * Show the diagram of the given model elements in ArgoUML.
     *
     * @param targets The model elements of which the diagram should be displayed.
     */
    private void showPattern(Collection targets) {
        ProjectActions.jumpToDiagramShowing((List) targets);
    }
    
    /**
     * Show the documentation of the given model element in the help pane.
     *
     * @param target The model element of which the documentation should be displayed.
     */
    private void showDocumentation(Object target) {
        
        boolean tabFound = false;
        int tabCount = helpPane.getTabCount();
        String targetName = ((ArgoElementWrapper)target).getName();
        int index = 0;
        
        // try to find the tab for the target pattern
        while ( (index < tabCount) && !tabFound ) {
            String aTitel = helpPane.getTitleAt(index);
            if (targetName == aTitel) {
                helpPane.setSelectedIndex(index);
                tabFound = true;
            }
            index++;
        }
        // if the tab isn't there already, create it
        if (!tabFound) {
            Facade facade = Model.getFacade();
            Object targetSourceObject = ((ArgoElementWrapper)target).getArgoSourceObject(); 
            String documentation = "";
            String author = "";
            String see = "";  
            
            Object taggedValue = facade.getTaggedValue(targetSourceObject, "documentation");
            if (taggedValue != null) 
                documentation = facade.getValueOfTag(taggedValue);
            taggedValue = facade.getTaggedValue(targetSourceObject, "author");
            if (taggedValue != null) 
                author = facade.getValueOfTag(taggedValue);
            taggedValue = facade.getTaggedValue(targetSourceObject, "see");
            if (taggedValue != null) 
                see = facade.getValueOfTag(taggedValue);       
            
            JPanel aTab = new JPanel(new BorderLayout());  
            
            JTextArea helpText = new JTextArea();
            helpText.setText(author+"\n\n"+documentation+"\n\n"+see);
            helpText.setEditable(false);
            helpText.setMargin(new Insets(INSET_PX, INSET_PX, INSET_PX, INSET_PX));
            helpText.setLineWrap(true);
            helpText.setWrapStyleWord(true);
            aTab.add(new JScrollPane(helpText), BorderLayout.CENTER);
            
            helpPane.addTab(targetName, aTab);
            Icon icon = ResourceLoaderWrapper.getInstance().lookupIcon(((ArgoElementWrapper)target).getArgoSourceObject());
            TabCloseIcon closeIcon = new TabCloseIcon();
            helpPane.setIconAt(tabCount, new CombinedIcon(closeIcon, icon)); 
            
            helpPane.setSelectedIndex(tabCount);
        }
    }
    
    /**
     * Apply all changes made with the Pattern-Wizard and update the model in ArgoUML.
     */
    private void applyChanges() {

        userPattern.setPatternName(newPatternNameTextField.getText());
        
        
        userPattern.applyChanges(transformCheckBox.isSelected());
        
        resetDialog();
        getCancelButton().doClick();
    }
    
    /**
     * Discard all changes made in the Pattern-Wizard.
     */
    private void resetDialog() {

        userPattern = new CombinePattern();
        
        // clear all list models
        selectedPatternListModel.clear(); 
        componentsListModel.clear();
        featuresListModel.clear();
        relationsListModel.clear();
        
        // hide all property areas
        hideComponentPropertyAreas();
        hideRelationPropertyAreas();
        
        // update the pattern list
        updatePatternList();
        
        // deactivate the apply and reset button
        getOkButton().setEnabled(false);
        getHelpButton().setEnabled(false);
        
        // set default values
        transformCheckBox.setSelected(false);
        newPatternNameTextField.setText(DEFAULT_PATTERN_NAME);
        newPatternNameTextField.setEnabled(true);
        
        // select the first tab
        tabsPane.setSelectedIndex(0);
    }
        
    /*------------------------------------------------------------------------*\
     |                       P U B L I C    M E T H O D S                     |
    \*------------------------------------------------------------------------*/

    /**
     * Get an instance of the PatternWizard.
     * 
     * @return the instance of this dialog
     */
    public static PatternWizard getInstance() {
        if (instance == null)
            instance = new PatternWizard();
        
        return instance;
    }
    
    /**
     * Open the Pattern-Wizard.
     */
    public void openPatternWizard() {
        updatePatternList();
        setVisible(true);
    }
    
    ////////////////////////////////////////////////////////////////////////////
    // ActionListener implementation                                          //
    ////////////////////////////////////////////////////////////////////////////

    /**
     * This method detects when an action has been preformed from any
     * of the buttons or fields and processes the action accordingly
     * 
     * @param e The ActionEvent.
     * @see java.awt.event.ActionListener#actionPerformed(java.awt.event.ActionEvent)
     */
    public void actionPerformed(ActionEvent e)
    {
        String command = e.getActionCommand();
        Object source = e.getSource();
        

        if (FORWARD_TO_NEXT_TAB.equals(command)) {
            tabsPane.setSelectedIndex(tabsPane.getSelectedIndex() + 1);
        }
        else if (BACK_TO_PREVIOUS_TAB.equals(command)) {
            tabsPane.setSelectedIndex(tabsPane.getSelectedIndex() - 1);            
        } 
        else if (SHOW_DOCUMENTATION.equals(command)) {
            // if a pattern is selected
            if (!availablePatternList.isSelectionEmpty()) {
                // get the package object for the selected pattern
                Object target = availablePatternList.getSelectedValue();
                
                // show documentation for pattern
                showDocumentation(target);
            }
        }
        else if (SHOW_PATTERN.equals(command)) {
            // if a pattern is selected
            if (!availablePatternList.isSelectionEmpty()) {
                // get the package object for the selected pattern
                Object target = ((ArgoElementWrapper)availablePatternList.getSelectedValue()).getArgoSourceObject();
                LOG.debug("show pattern: " + Model.getFacade().getName(target));
                // get the elements of the selected package
                Collection targetElements = Model.getFacade().getOwnedElements(target);
                // if the package contains elements
                if (!targetElements.isEmpty()) {
                    // show 
                    showPattern(targetElements);
                }
            }
        }
        else if (ADD_PATTERN.equals(command)) {
            if(!availablePatternList.isSelectionEmpty()) {
                // retrieve the pattern the user wants to add and move them to the other list
                Object[] pattern = availablePatternList.getSelectedValues();   
                for(int i=0; i < pattern.length; i++) {                
                    selectedPatternList.addElement(pattern[i]);
                    availablePatternList.removeElement(pattern[i]);    
                    LOG.debug("add pattern: " + pattern[i] + " -> " + selectedPatternList);
                }
            }
        }
        else if (REMOVE_PATTERN.equals(command)) {
            if(!selectedPatternList.isSelectionEmpty()) {
                // retrieve the pattern the user wants to remove and move them to the other list
                Object[] pattern = selectedPatternList.getSelectedValues();            
                for(int i=0; i < pattern.length; i++) {
                    availablePatternList.addElement(pattern[i]);
                    selectedPatternList.removeElement(pattern[i]);
                    LOG.debug("remove pattern: " + pattern[i] + " -> " + selectedPatternListModel);
                } 
            }
        }
        else if (TRANSFORM_CLASSES.equals(command)) {            
            LOG.debug("+++ transform classes ++++");
            
            transformClasses(transformCheckBox.isSelected());            
        }        
        else if (MODIFY_COMPONENT.equals(command)) {
            modifyComponent(componentsList.getSelectedValue());
            updateComponentsList();
        }
        else if (MODIFY_ATTRIBUTE.equals(command)) {
            modifyAttribute(componentsList.getSelectedValue(), featuresList.getSelectedValue());            
            updateFeaturesList();
        }  
        else if (MODIFY_METHOD.equals(command)) {
            modifyMethod(componentsList.getSelectedValue(), featuresList.getSelectedValue());
            updateFeaturesList();
        }  
        else if (MODIFY_RELATION.equals(command)) {
            modifyRelation(relationsList.getSelectedValue());
            updateRelationsList();
        }  
        else if (RESET_COMPONENT_PROPERTIES.equals(command)) {
            // in case their is something selected in the component list and it's not a comment
            if ( !(componentsList.isSelectionEmpty()) && !(componentsList.getSelectedValue() instanceof String) ) {
                // show the original properties of the selected component
                updateComponentProperties(componentsList.getSelectedValue());             
            }            
        }
        else if (RESET_ATTRIBUTE_PROPERTIES.equals(command)) {
            // in case their is something selected in the feature list and it's not a comment
            if ( !(featuresList.isSelectionEmpty()) && !(featuresList.getSelectedValue() instanceof String) ) {
                updateAttributeProperties(featuresList.getSelectedValue());
            }            
        }
        else if (RESET_METHOD_PROPERTIES.equals(command)) {
            // in case their is something selected in the feature list and it's not a comment
            if ( !(featuresList.isSelectionEmpty()) && !(featuresList.getSelectedValue() instanceof String) ) {
                updateMethodProperties(featuresList.getSelectedValue());
            }            
        }
        else if (RESET_RELATION_PROPERTIES.equals(command)) {
            // in case their is something selected in the relation list
            if (!(relationsList.isSelectionEmpty())) {
                updateRelationProperties(relationsList.getSelectedValue());
            }            
        }
        else if (SHOW_PATTERN_OF_COMPONENT.equals(command)) {
            // get the selected value
            Object selectedComponent = componentsList.getSelectedValue();
            // if a unchanged class was selected
            if (selectedComponent instanceof ClassWrapper) {    // maybe allow modified classes as well
                // show this object
                showPattern(((ClassAbstract)selectedComponent).getSourceObjects());
            }
        }
        else if (SHOW_PATTERN_OF_RELATION.equals(command)) {
            LOG.debug("show relation");
            // get the selected value
            Object selectedRelation = relationsList.getSelectedValue();
            // if a unchanged relation was selected
            if (selectedRelation instanceof RelationWrapper) {    // maybe allow modified relations as well
                LOG.debug("--show it now.");
                // show this object
                showPattern(((RelationWrapper)selectedRelation).getSourceObjects());
            }
        }
        else if (UNDO_COMPONENT_CHANGES.equals(command)) {            
            // if a feature is selected
            if(!featuresList.isSelectionEmpty()) {
                LOG.debug("a feature is selected for undo");                
                Object feature = featuresList.getSelectedValue();                
                // if the undo has to be done on an attribute
                if (feature instanceof AttributeAbstract) {
                    undoAttributeChanges(componentsList.getSelectedValue(), feature);
                }
                // if the undo has to be done on a methode
                else if (feature instanceof MethodAbstract) {
                    undoMethodChanges(componentsList.getSelectedValue(), feature);
                }                   
                updateFeaturesList();
            }
            // else if a component is selected and not a feature
            else if(!componentsList.isSelectionEmpty()) {
                LOG.debug("a component is selected for undo");                
                undoComponentChanges(componentsList.getSelectedValue());       
                updateComponentsList();
                updateRelationsList();
            }            
        }
        else if (UNDO_RELATION_CHANGES.equals(command)) {            
            // if a relation is selected
            if(!relationsList.isSelectionEmpty()) {
                LOG.debug("a relation is selected for undo");                
                undoRelationChanges(relationsList.getSelectedValue());       
                updateRelationsList();
            }            
        }
        else if (DUPLICATE_COMPONENT.equals(command)) {           
            // if a feature is selected
            if(!featuresList.isSelectionEmpty()) {
                LOG.debug("a feature is selected for duplicate");
                Object feature = featuresList.getSelectedValue();                
                // if a attribute has to be duplicated
                if (feature instanceof AttributeAbstract) {
                    duplicateAttribute(componentsList.getSelectedValue(), feature);
                }
                // if a method has to be duplicated
                else if (feature instanceof MethodAbstract) {
                    duplicateMethod(componentsList.getSelectedValue(), feature);
                }                   
                updateFeaturesList();
            }
            // else if a component is selected and not a feature
            else if(!componentsList.isSelectionEmpty()) {
                LOG.debug("a component is selected for duplicate");
                duplicateComponent(componentsList.getSelectedValue());
                updateComponentsList(); 
                updateRelationsList();
            }            
        }
        else if (EDIT_COMPONENT_STEREOTYPE.equals(command)) {   
            new EditStereotypes(componentsList.getSelectedValue(), componentStereotypeListModel);    
        }
        else if (EDIT_ATTRIBUTE_STEREOTYPE.equals(command)) {   
            new EditStereotypes(featuresList.getSelectedValue(), attributeStereotypeListModel);    
        }
        else if (EDIT_METHOD_STEREOTYPE.equals(command)) {   
            new EditStereotypes(featuresList.getSelectedValue(), methodStereotypeListModel);    
        }
        else if (EDIT_RELATION_STEREOTYPE.equals(command)) {              
            new EditStereotypes(relationsList.getSelectedValue(), relationStereotypeListModel);   
        }
        // if the "Apply" button (the original "OK" button of the Argo-Dialog) was pressed
        else if (source == getOkButton()) {
            applyChanges();
        } 
        // if the "Reset" button (the original "Help" button of the Argo-Dialog) was pressed
        else if (source == getHelpButton()) {
            resetDialog();
        } 
        // everything else might be handeled by the Argo-Dialog itself
        else {
            super.actionPerformed(e);
        }
    }

    ////////////////////////////////////////////////////////////////////////////
    // ListSelectionListener implementation                                   //
    ////////////////////////////////////////////////////////////////////////////
    
    /**
     * This method is called whenever the value of the selection changes.
     * 
     * @param e The List SslectionEvent.
     * @see javax.swing.event.ListSelectionListener#valueChanged(javax.swing.event.ListSelectionEvent)
     */
     public void valueChanged(ListSelectionEvent e) {
         Object source = e.getSource();

         // if the source of the event is the available pattern list and 
         // it's not one of a rapid series of events
         if ( (source == availablePatternList) && !e.getValueIsAdjusting() ) {
             // in case their is something selected in the available pattern list
             if ( !(availablePatternList.isSelectionEmpty()) ) {
                 // activate the buttons
                 patternTabShowPatternButton.setEnabled(true);
                 patternTabShowDocButton.setEnabled(true);
             } else {
                 // deactivate the buttons
                 patternTabShowPatternButton.setEnabled(false);
                 patternTabShowDocButton.setEnabled(false);
             }
         }
         // if the source of the event is the component list and 
         // it's not one of a rapid series of events
         else if ( (source == componentsList) && !e.getValueIsAdjusting() ) {
             Object selectedComponent = componentsList.getSelectedValue();
             // in case their is something selected in the component list and it's not a comment
             if ( !(componentsList.isSelectionEmpty()) && !(selectedComponent instanceof String) ) {
                 // update the featurelist to display the features of the selected component
                 updateFeaturesList(); 
                 // show the properties of the selected component
                 updateComponentProperties(selectedComponent);     
                 // show the history of changes made on this component
                 displayHistory(selectedComponent);                 
                 // activate the buttons
                 componentsTabShowPatternButton.setEnabled(selectedComponent instanceof ClassWrapper);
                 componentsTabDuplicateButton.setEnabled(true);
                 componentsTabUndoButton.setEnabled(!(selectedComponent instanceof ClassWrapper));
             }
             // otherwise
             else {
                 // clear the feature list
                 featuresListModel.clear();     
                 // set properties-area unvisible
                 hideComponentPropertyAreas();
                 // remove the history informations shown
                 displayHistory(null);  
                 // deactivate the buttons
                 componentsTabShowPatternButton.setEnabled(false);
                 componentsTabDuplicateButton.setEnabled(false);
                 componentsTabUndoButton.setEnabled(false);
             }
         } 
         // if the source of the event is the features list and 
         // it's not one of a rapid series of events
         else if ( (source == featuresList) && !e.getValueIsAdjusting() ) {
             Object selectedFeature = featuresList.getSelectedValue();
             // in case their is something selected in the feature list and it's not a comment
             if ( !(featuresList.isSelectionEmpty()) && !(selectedFeature instanceof String) ) {
                 if (selectedFeature instanceof AttributeAbstract)
                     updateAttributeProperties(selectedFeature);
                 else
                     updateMethodProperties(selectedFeature);
                 // show the history of changes made on this features 
                 displayHistory(selectedFeature);
                 // activate the buttons
                 componentsTabShowPatternButton.setEnabled((selectedFeature instanceof AttributeWrapper) || (selectedFeature instanceof MethodWrapper));
                 componentsTabDuplicateButton.setEnabled(true);
                 componentsTabUndoButton.setEnabled(!(selectedFeature instanceof AttributeWrapper) && !(selectedFeature instanceof MethodWrapper));
             }
             // if a comment or nothing is selected
             else {
                 // set the component property areas unvisible
                 hideComponentPropertyAreas();
                 // deactivate the buttons
                 componentsTabShowPatternButton.setEnabled(false);
                 componentsTabDuplicateButton.setEnabled(false);
                 componentsTabUndoButton.setEnabled(false);
             }
         } 
         // if the source of the event is the relations list and 
         // it's not one of a rapid series of events
         else if ( (source == relationsList) && !e.getValueIsAdjusting() ) {
             Object selectedRelation = relationsList.getSelectedValue();  
             // in case their is something selected in the relation list
             if (!relationsList.isSelectionEmpty()) {
                 // show the properties of the selected relation
                 updateRelationProperties(selectedRelation);
                 // activate the buttons
                 relationsTabShowPatternButton.setEnabled(selectedRelation instanceof RelationWrapper);
                 relationsTabUndoButton.setEnabled(!(selectedRelation instanceof RelationWrapper));
             }
             // otherwise
             else {
                 // set the relation property areas invisble
                 hideRelationPropertyAreas();
                 // deactivate the buttons
                 relationsTabShowPatternButton.setEnabled(false);
                 relationsTabUndoButton.setEnabled(false);
             }
         }
    }
     
    ////////////////////////////////////////////////////////////////////////////
    // FocusListener implementation                                           //
    ////////////////////////////////////////////////////////////////////////////

    /**
     * This method is invoked when a component gains the keyboard focus.
     * 
     * @param e The FocusEvent.
     * @see java.awt.event.FocusListener#focusGained(java.awt.event.FocusEvent)
     */
    public void focusGained(FocusEvent e) {
        if (e.getSource() == componentsList) {
            LOG.debug("component list got focus");
            // if their is something selected in the features list, clear this selection
            if (!featuresList.isSelectionEmpty())
                featuresList.clearSelection();

            Object selectedComponent = componentsList.getSelectedValue();
            // it is something selected in the component list and it's not a comment
            if ( !(componentsList.isSelectionEmpty()) && !(selectedComponent instanceof String) ) {
                // in case the component properties area is not visible
                if (!componentPropertieContainer.isVisible())
                    // show the properties of the selected component
                    updateComponentProperties(selectedComponent);                
                // show the history of changes made on this component
                displayHistory(selectedComponent);                
            } 
        }
    }    

    /**
     * This method is invoked when a component loses the keyboard focus.
     * Not needed at the moment.
     * 
     * @param e The FocusEvent.
     * @see java.awt.event.FocusListener#focusLost(java.awt.event.FocusEvent)
     */
    public void focusLost(FocusEvent e) {
        // not needed
    }

    ////////////////////////////////////////////////////////////////////////////
    // ListDataListener implementation                                        //
    ////////////////////////////////////////////////////////////////////////////
    
    /**
     * This methode is call if something was added to the data model of a JListDnD.
     * 
     * @param e The ListDataEvent.
     * @see javax.swing.event.ListDataListener#intervalAdded(javax.swing.event.ListDataEvent)
     */
    public void intervalAdded(ListDataEvent e) {
        LOG.debug("D&D intervalAdded");
        // if the source of this event is the list with the selected pattern
        if (e.getSource() == selectedPatternListModel) {
            // get the last element added to the list (by drag&drop or because of the "transform selected classes")
            ArgoElementWrapper lastElementAdded = (ArgoElementWrapper)selectedPatternList.getLastElementAdded();            
            LOG.debug("  last added: " + lastElementAdded);
            // get the source object of the last element added
            Object lastElementAddedSourceObject = lastElementAdded.getArgoSourceObject();
            // if it is a (pattern-) package
            if (Model.getFacade().isAPackage(lastElementAddedSourceObject)) {                
                // add the new pattern to the source pattern of the userPattern
                userPattern.addSourcePattern(lastElementAddedSourceObject);
                // update the list with the components to add the classes of the pattern we just added  
                updateComponentsList();
                // update the list with the relations to add the relations of the added classes
                updateRelationsList();
                // activate the apply and reset button (just in case)
                getOkButton().setEnabled(true);
                getHelpButton().setEnabled(true);
            }
        }        
    }

    /**
     * This methode is call if something was removed from the data model of a JListDnD.
     * 
     * @see javax.swing.event.ListDataListener#intervalRemoved(javax.swing.event.ListDataEvent)
     */
    public void intervalRemoved(ListDataEvent e) {
        LOG.debug("D&D intervalRemoved");
        // if the source of this event is the list with the selected pattern
        if (e.getSource() == selectedPatternListModel) {
            ArgoElementWrapper lastElementRemoved = (ArgoElementWrapper)selectedPatternList.getLastElementRemoved();
            LOG.debug("  last removed: " + lastElementRemoved);
            // if the last element removed is stored
            if (lastElementRemoved != null) {
                // get the source object of the last element removed
                Object lastElementRemovedSourceObject = lastElementRemoved.getArgoSourceObject();
                // if the same element which was just removed from the list isn't still in the there
                // (it could stil be there if drag source and drop destination are the same list)
                // and it was a (pattern-) package
                if ( (!selectedPatternListModel.contains(lastElementRemoved)) && (Model.getFacade().isAPackage(lastElementRemovedSourceObject)) ) {       
                    // remove the (pattern-) package from the source pattern of the userPattern
                    userPattern.removeSourcePattern(lastElementRemovedSourceObject);                
                    // update the list with the components to remove the classes of the pattern we just removed
                    updateComponentsList();
                    // update the list with the relations to remove the relations of the removed classes
                    updateRelationsList();
                    // deactivate the apply and reset button if the list is now empty
                    if(selectedPatternList.getModel().getSize() == 0) {                        
                        getOkButton().setEnabled(false);
                        getHelpButton().setEnabled(false);
                    }
                }
            } 
        }
    }

    /**
     * This methode is call if something complex was done with the data model of a JListDnD.
     * 
     * @param e The ListDataEvent.
     * @see javax.swing.event.ListDataListener#contentsChanged(javax.swing.event.ListDataEvent)
     */
    public void contentsChanged(ListDataEvent e) {
        LOG.debug("D&D contentsChanged - " + e.getIndex0() + " " + e.getIndex1());
        
        Object source = e.getSource();
        // if the source of this event is the list with the components
        if (source == componentsListModel) {
            // get both objects we want to merge
            int dragindex = componentsList.getSelectedIndex();       
            int dropindex = (dragindex == e.getIndex0()) ? e.getIndex1() : e.getIndex0();            
            Object component0 = componentsListModel.get(dragindex);
            Object component1 = componentsListModel.get(dropindex);     
            
            // make sure that we are not going to merge with a comment
            if ( !(component0 instanceof String) && !(component1 instanceof String) ) {
                // make sure that we are not merging classes of the same pattern
                if ( !CombinePattern.containsSimilarElements(((ClassAbstract)component0).getPatternIds(), ((ClassAbstract)component1).getPatternIds()) ) {
                    // merge the two components
                    mergeComponents(component0, component1);    
                    // update the component list
                    updateComponentsList();
                    // update the relations list                    
                    updateRelationsList();
                }
            }
        }
        // if the source of this event is the list with the features
        else if (source == featuresListModel) {
            // get both objects (indices are specified by this event) we want to merge
            int dragindex = featuresList.getSelectedIndex();       
            int dropindex = (dragindex == e.getIndex0()) ? e.getIndex1() : e.getIndex0();            
            Object feature0 = featuresListModel.get(dragindex);
            Object feature1 = featuresListModel.get(dropindex);
            
            // make sure that we are not going to merge with a comment
            if ( !(feature0 instanceof String) && !(feature1 instanceof String) ) { 
                // if both objects are attributes
                if (feature0 instanceof AttributeAbstract) {
                    // make sure that both attributes don't have the same parent class
                    if ( !CombinePattern.containsSimilarElements(((AttributeAbstract)feature0).getParentIds(), ((AttributeAbstract)feature1).getParentIds()) )
                        // merge the two attributes
                        mergeAttributes(feature0, feature1, componentsList.getSelectedValue());
                }
                // if both objects are methodes
                else if (feature0 instanceof MethodAbstract) {                    
                    // make sure that both methods don't have the same parent class
                    if ( !CombinePattern.containsSimilarElements(((MethodAbstract)feature0).getParentIds(), ((MethodAbstract)feature1).getParentIds()) )
                        // merge the two methodes
                        mergeMethods(feature0, feature1, componentsList.getSelectedValue());
                }
                
                // update the feature list
                updateFeaturesList();
            }
        }
        // if the source of this event is the list with the relations
        else if (source == relationsListModel) {
            // get both objects (indices are specified by this event) we want to merge
            int dragindex = relationsList.getSelectedIndex();       
            int dropindex = (dragindex == e.getIndex0()) ? e.getIndex1() : e.getIndex0();             
            Object relation0 = relationsListModel.get(dragindex);
            Object relation1 = relationsListModel.get(dropindex);
            // get the classifiers of the relations
            Object relation0ClassifierA = ((RelationAbstract)relation0).getClassifierA();
            Object relation0ClassifierB = ((RelationAbstract)relation0).getClassifierB();
            Object relation1ClassifierA = ((RelationAbstract)relation1).getClassifierA();
            Object relation1ClassifierB = ((RelationAbstract)relation1).getClassifierB();
            // if the classifiers are the same
            if ( ((relation0ClassifierA.equals(relation1ClassifierA)) && (relation0ClassifierB.equals(relation1ClassifierB)))
                    || ((relation0ClassifierA.equals(relation1ClassifierB)) && (relation0ClassifierB.equals(relation1ClassifierA))) ) {
                // merge the two relations
                mergeRelations(relation0, relation1);    
                // update the relations list
                updateRelationsList();                
            }
        }
    }
}