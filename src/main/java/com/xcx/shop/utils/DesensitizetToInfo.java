package com.xcx.shop.utils;


import org.apache.commons.lang3.StringUtils;

/**
 * @title: DesensitizetToInfo
 * @description: 脱敏
 * @date: 2023/8/10
 * @author: stuil
 * @copyright: Copyright (c) 2023
 * @version: 1.0
 */

public class DesensitizetToInfo {



    /**
     * 姓名脱敏
     * @param name
     * @return
     */
    public static String desensitizeName(String name) {
        String resultName = null;
        if (StringUtils.isNotBlank(name)) {
            if (name.length() == 1) {
                //张 -> 张
                resultName = name;
            }
            if (name.length() == 2) {
                //张三 -> 张*
                resultName = name.replaceFirst(name.substring(1), "*");
            }
            if (name.length() > 2) {
                //张三丰 -> 张*丰
                resultName = name.replaceFirst(name.substring(1, name.length() - 1), "*");
            }
        }
        return resultName;
    }

    /**
     * 对电子邮箱进行脱敏
     * @param email
     * @return
     */
    public static String desensitizeEmail(String email) {
        if(StringUtils.isNotBlank(email)) {
            email = email.replaceAll("(^\\w)[^@]*(@.*$)", "$1****$2");
        }
        return email;
    }

    /**
     * 手机号脱敏
     * @param mobile
     * @return
     */
    public static String desensitizeMobile(String mobile) {
        if(StringUtils.isNotBlank(mobile)) {
            mobile = mobile.replaceAll("(\\d{3})\\d{4}(\\d{4})", "$1****$2");
        }
        return mobile;
    }

    /**
     * 证件号脱敏
     * 保留前三后四
     * @param idNumber
     * @return
     */
    public static String desensitizeIdNumber(String idNumber) {
        if(StringUtils.isNotBlank(idNumber)) {
//    		if (idNumber.length() == 15) {
//    			idNumber = idNumber.replaceAll("(\\w{6})\\w*(\\w{3})", "$1******$2");
//            } else if (idNumber.length() == 18) {
//            	idNumber = idNumber.replaceAll("(\\w{6})\\w*(\\w{3})", "$1*********$2");
//            }
            idNumber = idNumber.replaceAll("(?<=\\w{3})\\w(?=\\w{4})", "*");
        }
        return idNumber;
    }

    /**
     * 地址脱敏
     * 规则说明：从第4位开始隐藏，隐藏8位。
     * @param address
     * @return
     */
    public static String desensitizeAddress(String address) {
        // isNotBlank 空格字符串为false
        if (StringUtils.isNotBlank(address)) {
            char[] chars = address.toCharArray();
            if (chars.length > 11) {// 由于需要从第4位开始，隐藏8位，因此数据长度必须大于11位
                // 获取第一部分内容
                String str1 = address.substring(0, 4);
                // 获取第二部分
                String str2 = "********";
                // 获取第三部分
                String str3 = address.substring(12);
                StringBuffer sb = new StringBuffer();
                sb.append(str1);
                sb.append(str2);
                sb.append(str3);
                address = sb.toString();
            }
        }
        return address;
    }
}
