/**
 * java class
 *
 * @Author: peiyi li
 * @Date: 2020-05-22 08:50
 */


import com.github.wxpay.sdk.WXPay;
import com.github.wxpay.sdk.WXPayUtil;
import com.nongxinle.utils.MyWxPayConfig;
import com.nongxinle.utils.WxPayUtils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 *@author lpy
 *@date 2020-05-22 08:50
 */


public class WxPay {

    public static void main(String[] args) throws Exception {


        String s = new SimpleDateFormat("yyyyMMdd").format(new Date()).toString();
        System.out.println(s);


    }


}
