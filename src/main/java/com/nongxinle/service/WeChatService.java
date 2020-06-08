/**
 * com.nongxinle.service class
 *
 * @Author: peiyi li
 * @Date: 2020-03-11 12:09
 */

package com.nongxinle.service;


import com.alibaba.fastjson.JSONObject;
import com.nongxinle.entity.NxCustomerUserEntity;
import com.nongxinle.entity.TemplateDataVo;
import com.nongxinle.entity.WxMssVo;
import lombok.extern.slf4j.Slf4j;
import netscape.javascript.JSObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class WeChatService {

    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }

    @Autowired
    private RestTemplate restTemplate;



    /**
     *
     * @param access_token  app的token
     * @param openid 用户openid
     * @param templateId 模板ID
     * @param keywords {与模板字段一一对应}
     * @return
     */
    public String pushOneUser(String access_token,String openid, String templateId,String[] keywords) {

        //如果access_token为空则从新获取
        if(StringUtils.isEmpty(access_token)){
            access_token = getAccess_token();
        }




        String url0 = "https://api.weixin.qq.com/cgi-bin/message/wxopen/template/send" +
                "?access_token=" + access_token;
        //https://api.weixin.qq.com/cgi-bin/message/subscribe/send?access_token=ACCESS_TOKEN
        String url = "https://api.weixin.qq.com/cgi-bin/message/subscribe/send?access_token=" + access_token;





        HttpHeaders headers = new HttpHeaders();
        MediaType type = MediaType.parseMediaType("application/json; charset=UTF-8");
        headers.setContentType(type);
        headers.add("Accept", MediaType.APPLICATION_JSON.toString());





        //拼接推送的模版
        WxMssVo wxMssVo = new WxMssVo();
        wxMssVo.setTouser(openid);
        wxMssVo.setTemplate_id(templateId);
        wxMssVo.setPage("/pages/index/index");
        wxMssVo.setLang("zh_CN");
        wxMssVo.setMiniprogram_state("developer");

        MultiValueMap<String, Object> m = new LinkedMultiValueMap<String, Object>();
        MultiValueMap<String, Object> km1 = new LinkedMultiValueMap<String, Object>();
        MultiValueMap<String, Object> km2 = new LinkedMultiValueMap<String, Object>();
        MultiValueMap<String, Object> km3 = new LinkedMultiValueMap<String, Object>();
        MultiValueMap<String, Object> km4 = new LinkedMultiValueMap<String, Object>();
        MultiValueMap<String, Object> km5 = new LinkedMultiValueMap<String, Object>();


        km1.add("value", "000");
        km2.add("value", "999");

        km3.add("value", "03-22");

        km4.add("value", "1");

        km5.add("value", "caidi");

        m.add("character_string1",km1);
        m.add("amount2", km2);
        m.add("date3", km3);
        m.add("phrase5", km4);
        m.add("thing7", km5);

        if(restTemplate==null){
            restTemplate = new RestTemplate();
        }

        MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
        map.add("touser", openid);
        map.add("template_id", templateId);
        map.add("page", "pages/index/index");
        map.add("miniprogram_state", "developer");
        map.add("lang", "zh_CN");
        map.add("data",m);


        System.out.println("00000000");
        System.out.println(url);
        System.out.println(map);

        System.out.println("111111");



        ResponseEntity<String> responseEntity =
                restTemplate.postForEntity(url, map, String.class);
        log.error("小程序推送结果={}", responseEntity.getBody());
        return responseEntity.getBody();
//        return "11";
    }

    /*
     * 获取access_token
     * appid和appsecret到小程序后台获取，当然也可以让小程序开发人员给你传过来
     * */
    public String getAccess_token() {
        //获取access_token
        String appid = "wxbc686226ccc443f1";
        String appsecret = "94973a07634b11e98c03ade8aeb4c213";
        String url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential" +
                "&appid=" + appid + "&secret=" + appsecret;
        if(restTemplate==null){
            restTemplate = new RestTemplate();
        }
        String json = restTemplate.getForObject(url, String.class);
        JSONObject myJson = JSONObject.parseObject(json);
        return myJson.get("access_token").toString();
    }

    public static void main(String[] args) {
        System.out.println(new WeChatService().getAccess_token());

        WeChatService weChatUtil = new WeChatService();
        String values[] ={"111","100","03-21","1","菜地"};
        weChatUtil.pushOneUser(weChatUtil.getAccess_token()
                ,"obVuH5Dll_F4Okq8YT5zs9UMz-Ug","iBEpT3V5qQy4xXOPsDAuIU1n-Z0ruTuOB3NN_6xFSKU"
                ,values);
    }








}


