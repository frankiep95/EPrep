package streams;

public class Application {
	public static void main(String[] args) {
		int[] numbers = {23,45,67,78};
		
		for(int i= 0; i < numbers.length; i++) {
			int num = numbers[i];
			System.out.println(num);
		}
		for(int num : numbers) {
			System.out.println(num);
		}
	}

}
