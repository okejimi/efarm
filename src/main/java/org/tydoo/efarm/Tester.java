package org.tydoo.efarm;

public class Tester {
	public static int counter = 1;
	
	public static void main(String ...strings ) {
		int localCounter = 3;
		localCounter++;
		counter++;
		counter += localCounter;
		System.out.println(counter);
		System.out.println(localCounter);
	}

}
