package com.boribob.utils;

import java.util.ArrayList;

public class Algorithms {
	// 펫 정보 비트 배열을 비트 숫자로 치환
	public int bitmask(ArrayList<Integer> petDetails, int targetNumber) {
		for (int i = 0; i < petDetails.size(); i++) {
			targetNumber |= (petDetails.get(i) << i);
		}
		targetNumber += 1;
		return targetNumber;
	}
	
	// 특정 위치 비트 정보 꺼내기
	public boolean checkBit(int inputNumber, int targetDigit, int targetNumber) {
		return (targetNumber & (inputNumber << targetDigit)) == (inputNumber << targetDigit);
	}
}
