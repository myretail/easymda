// license-header java merge-point
//
// Attention: Generated code! Do not modify by hand!
// Generated by: SpringSessionLocalHome.vsl in andromda-spring-cartridge.
//
package com.demo.service.basic.ejb;

/**
 * @see com.demo.service.basic.CustomerManageService 
 */
public interface CustomerManageServiceHome
    extends javax.ejb.EJBLocalHome
{

    /**
     * The logical JNDI name.
     */ 
    public static final String COMP_NAME="java:comp/env/demo-1.0-SNAPSHOT/ejb/com.demo.service.basic.CustomerManageService"; 
    
    /**
     * The physical JNDI name.
     */
    public static final String JNDI_NAME="demo-1.0-SNAPSHOT/ejb/com.demo.service.basic.CustomerManageService"; 
	
    public com.demo.service.basic.ejb.CustomerManageService create()
        throws javax.ejb.CreateException;

}