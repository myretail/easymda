package com.demo.util;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;

import org.hibernate.Criteria;
import org.hibernate.criterion.Expression;

public class ProjectUtil  extends org.springframework.orm.hibernate3.support.HibernateDaoSupport{
	
	//public class DateCal {
/*public static void main(String[] args) {
try {
 String strDateStart = "2006-10-1";
 String strDateEnd = "2006-10-14";
	 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	 Date date_start = sdf.parse(strDateStart);
	 Date date_end = sdf.parse(strDateEnd);
	// DateCal app = new DateCal();
	 Calendar cal_start = Calendar.getInstance();
	 Calendar cal_end = Calendar.getInstance();
	 cal_start.setTime(date_start);
	 cal_end.setTime(date_end);
	System.out.println("星期-->" + getChineseWeek(cal_start)
	 + " 日期-->" + cal_start.get(Calendar.YEAR) + "-"
	 + (cal_start.get(Calendar.MONTH) + 1) + "-"
	 + cal_start.get(Calendar.DAY_OF_MONTH));
	 System.out.println("星期-->" + getChineseWeek(cal_end) + " 日期-->"
	 + cal_end.get(Calendar.YEAR) + "-"
	 + (cal_end.get(Calendar.MONTH) + 1) + "-"
	 + cal_end.get(Calendar.DAY_OF_MONTH));
	 System.out.println("工作日为-->"
	 + getWorkingDay(cal_start, cal_end));
	 System.out.println("休息日-->"+getHolidays(cal_start, cal_end));
	 } catch (Exception e) {
	 // TODO: handle exception
	 }
	}*/
	public static int getDaysBetween(java.util.Calendar d1, java.util.Calendar d2) {
		 if (d1.after(d2)) { // swap dates so that d1 is start and d2 is end
		 java.util.Calendar swap = d1;
		 d1 = d2;
		 d2 = swap;
		 }
		 int days = d2.get(java.util.Calendar.DAY_OF_YEAR)
		 - d1.get(java.util.Calendar.DAY_OF_YEAR);
		 int y2 = d2.get(java.util.Calendar.YEAR);
		 if (d1.get(java.util.Calendar.YEAR) != y2) {
		 d1 = (java.util.Calendar) d1.clone();
		 do {
		
		 days += d1.getActualMaximum(java.util.Calendar.DAY_OF_YEAR);
		 d1.add(java.util.Calendar.YEAR, 1);
		 } while (d1.get(java.util.Calendar.YEAR) != y2);
		 }
		 return days;
		}
	/**
	 * 计算2个日期之间的相隔天数
	 * @param d1
	 * @param d2
	 * @return
	 */
	public static int getWorkingDay(java.util.Calendar d1, java.util.Calendar d2) {
	 int result = -1;
	 if (d1.after(d2)) { // swap dates so that d1 is start and d2 is end
	 java.util.Calendar swap = d1;
	 d1 = d2;
	 d2 = swap;
	 }
//	 int betweendays = getDaysBetween(d1, d2);
//	 int charge_date = 0;
	 int charge_start_date = 0;//开始日期的日期偏移量
	 int charge_end_date = 0;//结束日期的日期偏移量
	 // 日期不在同一个日期内
	 int stmp;
	 int etmp;
	 stmp = 7 - d1.get(Calendar.DAY_OF_WEEK);
	 etmp = 7 - d2.get(Calendar.DAY_OF_WEEK);
	 if (stmp != 0 && stmp != 6) {// 开始日期为星期六和星期日时偏移量为0
	 charge_start_date = stmp - 1;
	 }
	 if (etmp != 0 && etmp != 6) {// 结束日期为星期六和星期日时偏移量为0
	 charge_end_date = etmp - 1;
	 }
	// }
	 result = (getDaysBetween(getNextMonday(d1), getNextMonday(d2)) / 7)
	 * 5 + charge_start_date - charge_end_date;
	 //System.out.println("charge_start_date>" + charge_start_date);
	 //System.out.println("charge_end_date>" + charge_end_date);
	 //System.out.println("between day is-->" + betweendays);
	 return result;
	}
	public static String getChineseWeek(Calendar date) {
	 final String dayNames[] = { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五",
	 "星期六" };
	 int dayOfWeek = date.get(Calendar.DAY_OF_WEEK);
	 // System.out.println(dayNames[dayOfWeek - 1]);
	 return dayNames[dayOfWeek - 1];
	}
	/**
	 * 获得日期的下一个星期一的日期
	 *
	 * @param date
	 * @return
	 */
	public static Calendar getNextMonday(Calendar date) {
	 Calendar result = null;
	 result = date;
	 do {
	 result = (Calendar) result.clone();
	 result.add(Calendar.DATE, 1);
	 } while (result.get(Calendar.DAY_OF_WEEK) != 2);
	 return result;
	}
	/**
	 *
	　　 * @param d1
	　　 * @param d2
	　　 * @return
	　　 */
public static int getHolidays(Calendar d1,Calendar d2){
	 return  getDaysBetween(d1,d2)-getWorkingDay(d1,d2);
	 }
	
	
	/**
	   * 将Date类型的日期值转换成String类型
	   *@param Date dt   日期
	   *@return String  型字符串"2001-1-1 01时01分"
	   */
	  public static String getFullDateStr(java.util.Date dt) {
	    if (dt == null) {
	      return null;
	    }
	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.CHINA);
	    String dateString = formatter.format(dt);
	    return dateString;
	  }  
	
	
	  /**
	   * 把Date类型日期转换成String型
	   * @param dt 日期
	   * @return 日期的String 型"2001-1-1"
	   */
	  public static String getDateStr(java.util.Date dt) {
	    if (dt == null) {
	      return "";
	    }
	    String retStr = "";
	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd",Locale.CHINA);
	    retStr = formatter.format(dt);
	    return retStr;
	  }
      
	  /**
	   * 将String 类型的日期值转换成Data类型
	   *@param String DateStr   日期型字符串"2001-1-1 HH:mm"
	   *@return java.util.Date   日期
	   */
	  public static java.util.Date getDate(String DateStr) {
	    if("".equals(DateStr)){
	    	return null;
	    }else{
		    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm",Locale.CHINA);
		    ParsePosition pos = new ParsePosition(0);
		    return formatter.parse(DateStr,pos);
	    }
	  }
	  
	 /* public  long getCount(String sql) {
		    final Session session = getSession(false);
		    Query sqlQuery = session.createSQLQuery(sql);
		    long re=((Double)sqlQuery.list().get(0)).longValue();
		    return re;
		    
		  }*/
	  
	  public static String getGenerated(String in,String cip){
		    return gen(in.getBytes(),cip.getBytes()).toString();
		  }
	  public static String getOriginal(String in,String cip){
	    return new String(ori(in,cip.getBytes()));
	  }
	  private static StringBuffer gen(byte[]in ,byte[] cips){
//	    int len = cips.length;
	    int curVal = 0;
	    StringBuffer retVal = new StringBuffer(32);
	    for(int i=0;i<in.length;i++){
	      curVal = (byte)(in[i] ^ cips[i % cips.length]);
	      retVal.append(toHex(curVal));
	    }
	    return retVal;
	  }
	  private static byte[] ori(String in,byte[] cips){
	    int len = in.length()/2;
	    byte curVal = 0;
	    byte[] retVal = new byte[len];
	    for(int i=0;i<len;i++){
	      curVal = getVal(in.substring(i*2,i*2+2));
	      retVal[i] = (byte)(curVal ^ cips[i % cips.length]);
	    }
	    return retVal;
	  }
	  private static String toHex(int i){
	    String retVal = Integer.toHexString(i);
	    if (retVal.length()< 2) retVal = '0' + retVal;
	    return retVal;
	  }
	  private static byte getVal(String v){
	    String val = v.toUpperCase();
	    char chLo = val.charAt(1);
	    char chHi = val.charAt(0);
	    int retVal = bValue(chHi) *16 + bValue(chLo);
	    return (byte)retVal;
	  }
	  private static int bValue(char hex){
	    if(hex<='9'&& hex>='0')
	      return hex - '0';
	    return (byte)hex - 'A' + 10;
	  } 
	  public static void getNumberCriteria(com.demo.entity.basic.NumberQuery number,String numberString, Criteria criteria){
		  if("=".equals(number.getUpSign())){
	      	criteria.add(Expression.eq(numberString, number.getUpNumber()));
	      }else if(">".equals(number.getUpSign())){
	      	criteria.add(Expression.lt(numberString, number.getUpNumber()));
	      }else if("≥".equals(number.getUpSign())){
	      	criteria.add(Expression.le(numberString, number.getUpNumber()));
	      }
	      if(!"=".equals(number.getUpSign())){
	          if(">".equals(number.getDownSign())){
	          	criteria.add(Expression.gt(numberString, number.getDownNumber()));
	          }else if("≥".equals(number.getDownSign())){
	          	criteria.add(Expression.ge(numberString, number.getDownNumber()));
	          }
	      }  
	  }
	  
	  public static void getDateCriteria(com.demo.entity.basic.DateTimeQuery dateQuery,String dateString, Criteria criteria){
		  if("=".equals(dateQuery.getUpSign())){
	      	criteria.add(Expression.eq(dateString, ProjectUtil.getDate(dateQuery.getUpDate())));
	      }else if(">".equals(dateQuery.getUpSign())){
	      	criteria.add(Expression.lt(dateString, ProjectUtil.getDate(dateQuery.getUpDate())));
	      }else if("≥".equals(dateQuery.getUpSign())){
	      	criteria.add(Expression.le(dateString, ProjectUtil.getDate(dateQuery.getUpDate())));
	      }
	      if(!"=".equals(dateQuery.getUpSign())){
	          if(">".equals(dateQuery.getDownSign())){
	          	criteria.add(Expression.gt(dateString, ProjectUtil.getDate(dateQuery.getDownDate())));
	          }else if("≥".equals(dateQuery.getDownSign())){
	          	criteria.add(Expression.ge(dateString, ProjectUtil.getDate(dateQuery.getDownDate())));
	          }
	      }
	  }
}
