package me.mcx.utils;

import java.util.Random;

/**
 * 随机数工具
 * @date 2021-05-11
 * @author MCX
 */
public class RandomUtils {

    private static final  Random RANDOM = new Random();

    private static final String LETTER = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

    /**
     * 生成指定位数的随机小写字母字符串
     * @param number
     * @return
     */
    public static String generationCapital(Integer number){
        StringBuilder stringBuilder = new StringBuilder();
        char[] c = LETTER.toCharArray();
        for( int i = 0; i < number; i ++) {
            stringBuilder.append(c[RANDOM.nextInt(c.length)]);
        }
        return stringBuilder.toString();
    }

    /**
     * 生成指定位数的随机数字字符串
     * @param number
     * @return
     */
    public static String generationNumberChar(Integer number){
        StringBuilder stringBuilder = new StringBuilder();
        for( int i = 0; i < number; i ++) {
            stringBuilder.append(RANDOM.nextInt(10));
        }
        return stringBuilder.toString();
    }

    /**
     * 随机生成一个数字
     * @return
     */
    public static Integer generationNumber(int number){
        return RANDOM.nextInt(number);
    }
}
