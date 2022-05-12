package com.ict.recursion;

public class RecursiveQ1 {

	public static void recursive(int num) {
			
			if(num > 9) {
				System.out.println("재귀함수 호출 끝!");
				return;
			}
 		
			if(num % 2 == 1) {
				System.out.println("recursive : " + num);
				recursive(num+2);
			} 
		}

	public static void main(String[] args) {
		recursive(5);

	}

}
