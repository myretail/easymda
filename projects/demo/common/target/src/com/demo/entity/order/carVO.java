// license-header java merge-point
//
// Attention: Generated code! Do not modify by hand!
// Generated by: ValueObject.vsl in andromda-java-cartridge.
//

/*

function carVOJs(){
   this.load='%'
   ; this.id=0

}

function carVOJs(){
   this.load
   ; this.id

}


 var layoutAll =[{type: 'dojox.GridRowView', width: '20px' },{
                       
             cells: [
                      [
                       { name: 'choise', width: 3, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
                       { name: 'No.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
                           {name: 'load', field: 2,width: 15, editor: mydojo.ValidationTextBox , required:false ,maxLength:100,invalidMessage:'' }
                       ,  {name: 'id',field:3, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "dijit.form.NumberTextBox", constraint: {min:0,max:9999999,places:4} }
                       

                         ]
                     ]
                          }];


var layoutAllQuery =[{type: 'dojox.GridRowView', width: '20px' },{
                       
             cells: [
                      [
                       { name: 'choise', width: 3, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
                       { name: 'No.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
                           {name: 'load',width: 10 }
                       ,  {name: 'id',width: 6 }
                       

                         ]
                     ]
                          }];




function carVOAddNS_fun(carVOArray){         
       var querydata=new Array();        
                     for(var i = 0; i < carVOArray.length; i++){		
                      var items = new Array();
                      var ulo=carVOArray[i];
                      var vo=new carVO();
                         this.load=ulo["ns:load"]
   ; this.id=ulo["ns:id"]
                      querydata[i]=vo;
                    }                
            return querydata;}






*/

package com.demo.entity.order;

/**
 * 
 */
public class carVO
    implements java.io.Serializable
{
    /**
     * The serial version UID of this class. Needed for serialization.
     */
    private static final long serialVersionUID = 2182169119905958260L;

    public carVO()
    {
    }

    public carVO(com.demo.entity.basic.NumberQuery load, long id)
    {
        this.load = load;
        this.id = id;
    }

    /**
     * Copies constructor from other carVO
     *
     * @param otherBean, cannot be <code>null</code>
     * @throws java.lang.NullPointerException if the argument is <code>null</code>
     */
    public carVO(carVO otherBean)
    {
        this(otherBean.getLoad(), otherBean.getId());
    }

    /**
     * Copies all properties from the argument value object into this value object.
     */
    public void copy(carVO otherBean)
    {
        if (otherBean != null)
        {
            this.setLoad(otherBean.getLoad());
            this.setId(otherBean.getId());
        }
    }

    private com.demo.entity.basic.NumberQuery load;

    /**
     * 
     */
    public com.demo.entity.basic.NumberQuery getLoad()
    {
        return this.load;
    }

    public void setLoad(com.demo.entity.basic.NumberQuery load)
    {
        this.load = load;
    }

    private long id;

    /**
     * 
     */
    public long getId()
    {
        return this.id;
    }

    public void setId(long id)
    {
        this.id = id;
    }

    // com.demo.entity.order.carVO value-object java merge-point
}
