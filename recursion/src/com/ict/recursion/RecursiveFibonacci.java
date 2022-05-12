package com.ict.recursion;

public class RecursiveFibonacci {

	public static int fibonacci(long num) {
		if(num == 1) {
			return 0;
		} else if(num == 2) {
			return 1;
		} else {
			return fibonacci(num-1) + fibonacci(num-2);
		}
	}
	
	public static void main(String[] args) {
		System.out.println(fibonacci(45));

	}

}
