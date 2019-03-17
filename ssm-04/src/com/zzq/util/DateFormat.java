package com.zzq.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormat {

    public static String dateFormat1(Date d){
        SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
        String s = sdf1.format(d);
        return s;
    }
}
