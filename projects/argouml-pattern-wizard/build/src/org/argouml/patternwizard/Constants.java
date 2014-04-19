// $Id: Constants.java 11 2007-01-25 18:36:46Z rene_lindhorst $
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

/******************************************************************************\
 *                               CLASS DEFINITION                             *
\******************************************************************************/
/**
 * This interface contains constants which are used in other classes.
 * 
 * @author Rene Lindhorst
 */
public interface Constants {
    
    /**
     * The seperator to use for stereotypes.
     */
    public static final String STEREOTYPE_SEPERATOR = ",";
    
    /**
     * The seperator to use for names in the changes overview.
     */
    public static final String DISPLAYED_NAME_SEPERATOR = "+";

    /**
     * The name of the stereotype which marks the pattern packages.
     */
    public static final String PATTERN_STEREOTYPE_NAME = "Pattern";

    /**
     * The base class of the stereotype which marks the pattern packages.
     */
    public static final String PATTERN_STEREOTYPE_BASE_CLASS = "Package";
    
    /**
     * The insets in pixels.
     */
    static final int INSET_PX = 3;    
    
    /**
     * The default name of newly created pattern.
     */
    static final String DEFAULT_PATTERN_NAME = "NewPattern1";
    
    /**
     * The path where the icons are located.
     */
    static final String ICON_RESOURCE_PATH = "/org/argouml/patternwizard/icons";
    
    /*
     * The action commands used.
     */
    static final String FORWARD_TO_NEXT_TAB = "forward2NextTab";    
    static final String BACK_TO_PREVIOUS_TAB = "back2PreviousTab";  
    static final String ADD_PATTERN = "addPattern";
    static final String REMOVE_PATTERN = "removePattern";
    static final String SHOW_DOCUMENTATION = "showDocumentation";
    static final String SHOW_PATTERN = "schowPattern1";
    static final String SHOW_PATTERN_OF_COMPONENT = "schowPatternComponent";
    static final String SHOW_PATTERN_OF_RELATION = "showPatternRelation";
    static final String MODIFY_COMPONENT = "modifyComponent";
    static final String MODIFY_ATTRIBUTE = "modifyAttribute";
    static final String MODIFY_METHOD = "modifyMethod";
    static final String MODIFY_RELATION = "modifyRelation"; 
    static final String UNDO_COMPONENT_CHANGES = "undoComponent";
    static final String UNDO_RELATION_CHANGES = "undoRelation";
    static final String DUPLICATE_COMPONENT = "duplicateComponent";
    static final String RESET_COMPONENT_PROPERTIES = "resetComponent"; 
    static final String RESET_ATTRIBUTE_PROPERTIES = "resetAttribute"; 
    static final String RESET_METHOD_PROPERTIES = "resetMethod"; 
    static final String RESET_RELATION_PROPERTIES = "resetRelation";
    static final String TRANSFORM_CLASSES = "transformClasses";
    static final String EDIT_RELATION_STEREOTYPE = "editRelationStereotype";
    static final String EDIT_COMPONENT_STEREOTYPE = "editComponentStereotype";
    static final String EDIT_ATTRIBUTE_STEREOTYPE = "editAttributeStereotype";
    static final String EDIT_METHOD_STEREOTYPE = "editMethodStereotype";
}