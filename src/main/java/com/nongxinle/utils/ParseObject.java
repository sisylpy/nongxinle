/**
 * com.nongxinle.utils class
 *
 * @Author: peiyi li
 * @Date: 2019-10-19 12:56
 */

package com.nongxinle.utils;


import java.io.UnsupportedEncodingException;

/**
 *@author lpy
 *@date 2019-10-19 12:56
 */


public class ParseObject {

    public static String parseObj (String obj) {
        String replace = obj.replace("=", "");
        try {
            return java.net.URLDecoder.decode(replace, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

   return  null;
    }


}
