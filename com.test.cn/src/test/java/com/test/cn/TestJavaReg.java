package com.test.cn;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class TestJavaReg {
public static void main(String[] args) {
	String regex="^[\\w]{4,10}$";
	/*Pattern copattern = Pattern.compile(reg);
	boolean matcher = copattern.matcher("2522").matches();
	System.out.println(matcher);*/
	
	 Pattern pattern = Pattern.compile("^[\\w]{4,10}$");
	  Matcher matcher = pattern.matcher("Java");
	  boolean b= matcher.matches();
	  System.out.println(b);
	  //当条件满足时，将返回true，否则返回false
	  System.out.println(regex.matches("aaa"));
	  boolean matches = Pattern.matches(regex, "12663");
	  System.out.println(matches);
	  String name="abcd";
	  boolean bl=name.matches(regex);
	  System.out.println(bl);
}
}
