package edu.fjnu.online.util;

import java.math.BigDecimal;
import java.math.RoundingMode;

/**
 * 分数计算
 * @author hspcadmin
 *
 */
public class ComputeScore {

	public static double getScore(String str1,String str2){
		double d = Computeclass.SimilarDegree(str1, str1);
		return d;
	}
	
	public static void main(String[] args) {
		String str1="相似度来计算文本的相似度，然后通过相似度来计算本题的得分，";
		String str2="相似度来计算文本的相似度，然后通过相似度";
		
		double d = Computeclass.SimilarDegree(str1, str2);
		
		String str3 = Computeclass.longestCommonSubstring(str1, str2);
		
		//double d2 = TextSimilarityUtil.getSimilarity(str1, str3);
		// 新方法，如果不需要四舍五入，可以使用RoundingMode.DOWN
		System.out.println(d);
        BigDecimal bg = new BigDecimal(d*5).setScale(1, RoundingMode.DOWN);
        d = bg.doubleValue();
        System.out.println(d);
	}
}
