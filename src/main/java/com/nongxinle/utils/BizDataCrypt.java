/**
 * com.nongxinle.utils class
 *
 * @Author: peiyi li
 * @Date: 2019-11-29 20:43
 */

package com.nongxinle.utils;

import com.alibaba.druid.util.Base64;
import com.alibaba.fastjson.JSONObject;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.security.AlgorithmParameters;
import java.security.Security;
import java.util.Arrays;

/**
 *@author lpy
 *@date 2019-11-29 20:43
 */


public class BizDataCrypt {

    /**
     * 分享群的标识
     */
    public static String getOpenGId(String encryptedData,String sessionkey, String iv){
        JSONObject jsObj = decrypt(encryptedData, sessionkey, iv);
        return jsObj.getString("openGId");
    }



    public static JSONObject decrypt(String encryptedData,String sessionkey, String iv){
        // 被加密的数据
        byte[] dataByte = Base64.base64ToByteArray(encryptedData);
//        byte[] dataByte = Base64.decodeFast(encryptedData);
        // 加密秘钥
        byte[] keyByte = Base64.base64ToByteArray(sessionkey);
//        byte[] keyByte = Base64.decodeFast(sessionkey);

        // 偏移量
        byte[] ivByte = Base64.base64ToByteArray(iv);
//        byte[] ivByte = Base64.decodeFast(iv);

        try {
            // 如果密钥不足16位，那么就补足.  这个if 中的内容很重要
            int base = 16;
            if (keyByte.length % base != 0) {
                int groups = keyByte.length / base + (keyByte.length % base != 0 ? 1 : 0);
                byte[] temp = new byte[groups * base];
                Arrays.fill(temp, (byte) 0);
                System.arraycopy(keyByte, 0, temp, 0, keyByte.length);
                keyByte = temp;
            }
            // 初始化
            Security.addProvider(new BouncyCastleProvider());
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS7Padding","BC");
            SecretKeySpec spec = new SecretKeySpec(keyByte, "AES");
            AlgorithmParameters parameters = AlgorithmParameters.getInstance("AES");
            parameters.init(new IvParameterSpec(ivByte));
            cipher.init(Cipher.DECRYPT_MODE, spec, parameters);// 初始化
            byte[] resultByte = cipher.doFinal(dataByte);
            if (null != resultByte && resultByte.length > 0) {
                String result = new String(resultByte, "UTF-8");
                return JSONObject.parseObject(result);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args){
        String encryptedData = "TWS1OblTeRF3/aM9rmVxIApNIVGvH8yEXooS+Hv1prE1dsx6oRPoSIjLlPMUtjjLfQq4lK6i1KvmkcxWJakjVyLEtVi1R4jXJZw3nOU0z9kgR0yUGnTc1U5fVJ0Y6eZ/p/7ddqWdqcuVyRx9lvxz36KpNzzXYsA2M3rI/e5uLtx+nW4ZSUr4fUWtsm23hmdf6yzBsm1JxgVY+oPJyv2RdbZvMM3JkaSZmi5DZ0why/3Z1sibNE8UO+kHU/hsmEibslQswHZx+iiXFXH4gl/SXp2YnZBevv3xxsHD11uoTEjjHMCQwQRdMHMUzkqreRwVxAesa7H6PbJAaqKZ8gO3svMLBUG1tl5inETiudQHgXA1xc6ZRkOZKQh1zHu1SolZFoGVHyEkM1qk0fZ5gyuPdi0coX7ThpAPO6J10vYb8Vq1jh/ZzuXk+0xZs8xIaXiIeq/Erp8NituuY7nfUplQQw==";
        String sessionkey = "bxH2tYDAkBDcqi+ZqmTXww==";
        String iv = "6lV/19RNeOmN6i3BStOsLw==";
        System.out.println(BizDataCrypt.decrypt(encryptedData, sessionkey, iv));
    }

}
