// license-header java merge-point
//
// Attention: Generated code! Do not modify by hand!
// Generated by: ValueObject.vsl in andromda-java-cartridge.
//

/*

function DateTimeQueryJs(){
   this.upDate='%'
   ; this.upSign='%'
   ; this.downDate='%'
   ; this.downSign='%'

}

function DateTimeQueryJs(){
   this.upDate
   ; this.upSign
   ; this.downDate
   ; this.downSign

}


 var layoutAll =[{type: 'dojox.GridRowView', width: '20px' },{
                       
             cells: [
                      [
                       { name: 'choise', width: 3, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
                       { name: 'No.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
                           {name: 'upDate', field: 2,width: 15, editor: mydojo.ValidationTextBox , required:false ,maxLength:100,invalidMessage:'' }
                         ,   {name: 'upSign', field: 3,width: 15, editor: mydojo.ValidationTextBox , required:false ,maxLength:100,invalidMessage:'' }
                         ,   {name: 'downDate', field: 4,width: 15, editor: mydojo.ValidationTextBox , required:false ,maxLength:100,invalidMessage:'' }
                         ,   {name: 'downSign', field: 5,width: 15, editor: mydojo.ValidationTextBox , required:false ,maxLength:100,invalidMessage:'' }
                       

                         ]
                     ]
                          }];


var layoutAllQuery =[{type: 'dojox.GridRowView', width: '20px' },{
                       
             cells: [
                      [
                       { name: 'choise', width: 3, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
                       { name: 'No.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
                           {name: 'upDate',width: 10 }
                         ,   {name: 'upSign',width: 10 }
                         ,   {name: 'downDate',width: 10 }
                         ,   {name: 'downSign',width: 10 }
                       

                         ]
                     ]
                          }];




function DateTimeQueryAddNS_fun(DateTimeQueryArray){         
       var querydata=new Array();        
                     for(var i = 0; i < DateTimeQueryArray.length; i++){		
                      var items = new Array();
                      var ulo=DateTimeQueryArray[i];
                      var vo=new DateTimeQuery();
                         this.upDate=ulo["ns:upDate"]
   ; this.upSign=ulo["ns:upSign"]
   ; this.downDate=ulo["ns:downDate"]
   ; this.downSign=ulo["ns:downSign"]
                      querydata[i]=vo;
                    }                
            return querydata;}






*/

package com.demo.entity.basic;

/**
 * 
 */
public class DateTimeQuery
    implements java.io.Serializable
{
    /**
     * The serial version UID of this class. Needed for serialization.
     */
    private static final long serialVersionUID = -3835435632313336380L;

    public DateTimeQuery()
    {
    }

    public DateTimeQuery(java.lang.String upDate, java.lang.String upSign, java.lang.String downDate, java.lang.String downSign)
    {
        this.upDate = upDate;
        this.upSign = upSign;
        this.downDate = downDate;
        this.downSign = downSign;
    }

    /**
     * Copies constructor from other DateTimeQuery
     *
     * @param otherBean, cannot be <code>null</code>
     * @throws java.lang.NullPointerException if the argument is <code>null</code>
     */
    public DateTimeQuery(DateTimeQuery otherBean)
    {
        this(otherBean.getUpDate(), otherBean.getUpSign(), otherBean.getDownDate(), otherBean.getDownSign());
    }

    /**
     * Copies all properties from the argument value object into this value object.
     */
    public void copy(DateTimeQuery otherBean)
    {
        if (otherBean != null)
        {
            this.setUpDate(otherBean.getUpDate());
            this.setUpSign(otherBean.getUpSign());
            this.setDownDate(otherBean.getDownDate());
            this.setDownSign(otherBean.getDownSign());
        }
    }

    private java.lang.String upDate;

    /**
     * 
     */
    public java.lang.String getUpDate()
    {
        return this.upDate;
    }

    public void setUpDate(java.lang.String upDate)
    {
        this.upDate = upDate;
    }

    private java.lang.String upSign;

    /**
     * 
     */
    public java.lang.String getUpSign()
    {
        return this.upSign;
    }

    public void setUpSign(java.lang.String upSign)
    {
        this.upSign = upSign;
    }

    private java.lang.String downDate;

    /**
     * 
     */
    public java.lang.String getDownDate()
    {
        return this.downDate;
    }

    public void setDownDate(java.lang.String downDate)
    {
        this.downDate = downDate;
    }

    private java.lang.String downSign;

    /**
     * 
     */
    public java.lang.String getDownSign()
    {
        return this.downSign;
    }

    public void setDownSign(java.lang.String downSign)
    {
        this.downSign = downSign;
    }

    // com.demo.entity.basic.DateTimeQuery value-object java merge-point
}