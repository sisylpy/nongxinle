/**
 * com.nongxinle.utils class
 *
 * @Author: peiyi li
 * @Date: 2020-03-11 16:20
 */

package com.nongxinle.utils;

import cn.gjing.http.HttpClient;
import cn.gjing.http.HttpMethod;

import java.util.Map;

public class HttpUtils {

    public static String get(String url, Map<String, Object> param) {
        String result = HttpClient.builder(url, HttpMethod.GET, String.class)
                .param(param)
                .execute()
                .get();

        return result;
    }

    public static String get(String url) {
        String result = HttpClient.builder(url, HttpMethod.GET, String.class)
                .execute()
                .get();

        return result;
    }

    public static Map post(String url, Map<String, Object> param) {
        Map result = HttpClient.builder(url, HttpMethod.POST, Map.class)
                .body(param)
                .execute()
                .get();
        return result;
    }
}





