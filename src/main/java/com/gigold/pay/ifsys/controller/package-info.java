/**
 * Title: package-info.java<br/>
 * Description: <br/>
 * Copyright: Copyright (c) 2015<br/>
 * Company: gigold<br/>
 *
 */
/**
 * Title: package-info<br/>
 * Description: <br/>
 * Company: gigold<br/>
 * @author Devin
 * @date 2015年9月16日下午6:12:27
 *
 */
package com.gigold.pay.ifsys.controller;

import com.gigold.pay.framework.core.Code;

enum CodeItem implements Code{
    
    //bia
    ITERACE_FAILURE("D0000"),
	ITERACE_SUCCESS("00000");
   
    
    private String value;
    
    
    private CodeItem(String value){
        this.value = value;
        
    }
    
    
    @Override
    public  String toString(){
        return this.value;
    }
}