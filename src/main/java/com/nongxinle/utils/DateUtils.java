package com.nongxinle.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * 日期处理
 * 
 */
public class DateUtils {
	/** 时间格式(yyyy-MM-dd) */
	public final static String DATE_PATTERN = "yyyy-MM-dd";
	/** 时间格式(yyyy-MM-dd HH:mm:ss) */
	public final static String YEAR_DATE_TIME_PATTERN = "yyyy-MM-dd HH:mm";
    public final static String DATE_TIME_PATTERN = "MM-dd HH:mm";

    public static String format(Date date) {
        return format(date, DATE_PATTERN);
    }

    public static String format(Date date, String pattern) {
        if(date != null){
            SimpleDateFormat df = new SimpleDateFormat(pattern);
            return df.format(date);
        }
        return null;
    }

    public static  String formatWhatDay(int what) {

        Date whatDay = calendarDay(what).getTime();

        SimpleDateFormat dateFormat2 = new SimpleDateFormat(DATE_PATTERN);
        String format1 = dateFormat2.format(whatDay);
        return format1;
    }


    public static  String formatWhatDayTime(int what) {
        Date whatDay = calendarDay(what).getTime();
        SimpleDateFormat dateFormat2 = new SimpleDateFormat(DATE_TIME_PATTERN);
        String format1 = dateFormat2.format(whatDay);
        return format1;
    }

    public static  String formatWhatDate(int what) {
        Date whatDay = calendarDay(what).getTime();
        SimpleDateFormat dateFormat2 = new SimpleDateFormat("MM-dd");
        String format1 = dateFormat2.format(whatDay);
        return format1;
    }
    public static  String formatWhatTime(int what) {
        Date whatDay = calendarDay(what).getTime();
        SimpleDateFormat dateFormat2 = new SimpleDateFormat("HH:mm");
        String format1 = dateFormat2.format(whatDay);
        return format1;
    }

    public static  String formatWhatHour(int what) {
        Date whatDay = calendarDay(what).getTime();
        SimpleDateFormat dateFormat2 = new SimpleDateFormat("HH");
        String format1 = dateFormat2.format(whatDay);
        return format1;
    }
    public static  String formatWhatMinute(int what) {
        Date whatDay = calendarDay(what).getTime();
        SimpleDateFormat dateFormat2 = new SimpleDateFormat("mm");
        String format1 = dateFormat2.format(whatDay);
        return format1;
    }


    public static  String formatWhatYearDayTime(int what) {
        Date whatDay = calendarDay(what).getTime();
        SimpleDateFormat dateFormat2 = new SimpleDateFormat(YEAR_DATE_TIME_PATTERN);
        String format1 = dateFormat2.format(whatDay);
        return format1;
    }




    private static Calendar calendarDay (int what){
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(new Date());
        calendar.add(Calendar.DAY_OF_MONTH, what);
        return calendar;
    }


}
