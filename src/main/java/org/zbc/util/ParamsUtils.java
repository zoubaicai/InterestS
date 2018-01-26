package org.zbc.util;

import java.util.regex.Pattern;

public final class ParamsUtils {

    /**
     * 判断是否大于0
     * @param n
     * @return
     */
    public static boolean greaterThanZero(Long n){
        if (null == n || n <= 0){
            return false;
        } else {
            return true;
        }
    }

    /**
     * 手机号的校验 前后空格必须自己去除
     * @param phoneNumber
     * @return
     */
    public static boolean isPhoneNumber(String phoneNumber){
        boolean bool = Pattern.matches("^[0-9]{11}$", phoneNumber);
        return bool;
    }
    /**
     * 中文字符传三个字符长度，然后和数据库长度做对比 前后空格必须自己去除
     * 是否超过字符长度
     * @param s
     * @param length
     * @return
     */
    public static boolean isOverLength(String s,int length){
        boolean bool;
        int realLength = s.replaceAll("[\u4e00-\u9fa5]", "123").length();
        if(realLength<= length){
            bool = true;
        }else{
            bool = false;
        }
        return bool;
    }
    /**
     * 是否是正整数 前后空格必须自己去除
     * @param s
     * @return
     */
    public static boolean isPositiveInteger(String s){
        boolean bool = Pattern.matches("^[1-9][0-9]*$", s);
        return bool;
    }
    /**
     * 是否是负整数 前后空格必须自己去除
     * @param s
     * @return
     */
    public static boolean isNegativeInteger(String s){
        boolean bool = Pattern.matches("^[-][1-9][0-9]*$", s);
        return bool;
    }
    /**
     * 是否是非负整数 前后空格必须自己去除
     * @param s
     * @return
     */
    public static boolean isNonNegativeIntegers(String s){
        if("0".equals(s)){
            return true;
        }
        boolean bool = Pattern.matches("^[1-9][0-9]*$", s);
        return bool;
    }
    /**
     * 必须是非负数 前后空格必须自己去除
     * 必须精确到小数点后 place位
     * @param s
     * @param place
     * @return
     */
    public static boolean isMustDecimalToN(String s,int place){
        String regex = "^[0-9]+(\u002E){0,1}[0-9]{"+place+"}$";
        boolean bool = Pattern.matches(regex, s);
        return bool;
    }
    /**
     * 必须是非负数 前后空格必须自己去除
     * 最多精确到小数点后 place位
     * @param s
     * @param place
     * @return
     */
    public static boolean isDecimalToN(String s,int place){
        String regex = "^[0-9]+(\u002E){0,1}[0-9]{0,"+place+"}$";
        boolean bool = Pattern.matches(regex, s);
        return bool;
    }
    /**
     * 身份证号码的校验 只做位数的校验 具体规则的校验不知道 前后空格必须自己去除
     * @param s
     * @return
     */
    public static boolean isIDcard(String s){
        boolean bool = Pattern.matches("^[0-9a-zA-Z]{18}$", s);
        return bool;
    }
    /**
     * 电子邮箱的验证 前后空格必须自己去除
     * @param s
     * @return
     */
    public static boolean isMailAddress(String s){
        boolean bool = Pattern.matches("^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\u002E[a-zA-Z0-9_-]+)+$", s);
        return bool;
    }

    /**
     * 验证是否包含中文
     * @param s
     * @return
     */
    public static boolean isRightPwd(String s){
        if (s.length() > 30 || s.length() < 8){
            return false;
        }
        boolean bool = Pattern.matches("^[\u4e00-\u9fa5]*$",s);
        return !bool;
    }
    /**
     * 日期格式的校验 前后空格必须自己去除
     * 1 'YYYY'格式 只有年(年至少一位)
     * 2 'YYYY-MM'
     * 3 'YYYY-MM-DD'
     * 4 'YYYY-MM-DD HH'
     * 5 'YYYY-MM-DD HH:MM'
     * 6 'YYYY-MM-DD HH:MM:SS'
     * 其余一律 'YYYY-MM-DD HH:MM:SS'
     * @param s
     * @param n
     * @return
     */
    public static boolean isDateFormat(String s, int n){
        String regex;
        switch(n){
            case 1:
                regex = "^[0-9]{1,4}$";
                break;
            case 2:
                regex = "^[0-9]{1,4}-(1(?![3456789])|0(?!0))[0-9]$";
                break;
            case 3:
                regex = "^[0-9]{1,4}-(1(?![3456789])|0(?!0))[0-9]-[0-9]{2}$";
                break;
            case 4:
                regex = "^[0-9]{1,4}-(1(?![3456789])|0(?!0))[0-9]-[0-9]{2} ([01]|2(?![56789]))[0-9]$";
                break;
            case 5:
                regex = "^[0-9]{1,4}-(1(?![3456789])|0(?!0))[0-9]-[0-9]{2} ([01]|2(?![56789]))[0-9][:][0-5][0-9]$";
                break;
            case 6:
                regex = "^[0-9]{1,4}-(1(?![3456789])|0(?!0))[0-9]-[0-9]{2} ([01]|2(?![56789]))[0-9]([:][0-5][0-9]){2}$";
                break;
            default:
                regex = "^[0-9]{1,4}-(1(?![3456789])|0(?!0))[0-9]-[0-9]{2} ([01]|2(?![56789]))[0-9]([:][0-5][0-9]){2}$";
        }
        boolean bool = Pattern.matches(regex, s);
        if(n>2){
            int first = s.indexOf("-");
            int year = Integer.parseInt(s.substring(0, first));
            int mount = Integer.parseInt(s.substring((first+1), (first+3)));
            int day = Integer.parseInt(s.substring((first+4), (first+6)));
            boolean isLeap = false;//是否是闰年的判断
            if(year%4 == 0){
                if(year%100 == 0){
                    if(year%400 == 0){
                        isLeap = true;
                    }else{
                        isLeap = false;
                    }
                }else{
                    isLeap = true;
                }
            }
            if(mount == 2){
                if(isLeap){
                    if(day>29){
                        bool = false;
                    }
                }else{
                    if(day>28){
                        bool = false;
                    }
                }
            }else if(mount == 4 || mount == 6 || mount == 9 || mount == 11){
                if(day>30){
                    bool = false;
                }
            }else{
                if(day>31){
                    bool = false;
                }
            }
        }
        return bool;
    }

    private ParamsUtils(){throw new AssertionError();}
}
