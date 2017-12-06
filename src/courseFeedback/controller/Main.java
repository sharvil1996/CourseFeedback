package courseFeedback.controller;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Scanner;

public class Main {

	static int p, q, n, d;

	public static void main(String[] args) {
		int plainText = 9;

		Scanner scanner = new Scanner(System.in);
		System.out.print("Enter Plain Text ");
		plainText = scanner.nextInt();
		System.out.println();
		p = getRandomPrimeNumber(1000000);
		q = getRandomPrimeNumber(1000);
		int encrypt = encrypt(plainText, p, q);
		System.out.println("Encrypted Text " + encrypt);
		System.out.println("Decrypted Text " + decrypt(encrypt, n, d));

//		temp();

	}

	public static Integer getRandomPrimeNumber(int n) {
		boolean prime[] = new boolean[n + 1];
		for (int i = 0; i < n; i++)
			prime[i] = true;

		for (int p = 2; p * p <= n; p++) {
			if (prime[p] == true) {
				for (int i = p * 2; i <= n; i += p)
					prime[i] = false;
			}
		}
		ArrayList<Integer> arr = new ArrayList<>();
		for (int i = 300; i <= n; i++) {
			if (prime[i] == true)
				arr.add(i);
		}
		return arr.get((int) Math.round(Math.random() * 100));
	}

	public static int encrypt(int plainText, int p, int q) {

		n = p * q;
		int temp = (p - 1) * (q - 1);
		int e = 0;
		for (int i = 2; i <= Math.sqrt(temp); i++) {
			if (temp % i != 0) {
				e = i;
				break;
			}
		}

		d = modInverse(temp, e);
		System.out.println("Public Key is (" + n + "," + e + ") and Private key is " + d);
		BigInteger N = new BigInteger(n + "");
		BigInteger integer = new BigInteger(plainText + "");
		BigInteger cipherText = new BigInteger(integer.pow(e).mod(N) + "");
		// System.out.println(cipherText);
		return Integer.parseInt(cipherText + "");
	}

	public static int decrypt(int ct, int n, int d) {
		BigInteger N = new BigInteger(n + "");
		BigInteger cipherText = new BigInteger(ct + "");
		BigInteger PT = new BigInteger(cipherText.pow(d).mod(N) + "");
		return Integer.parseInt(PT + "");
	}

	public static int modInverse(int a, int m) {
		int x = 0;
		for (int i = 1;; i++) {
			if ((m * i) % a == 1) {
				x = i;
				break;
			}
		}
		return x;
	}

	public static void temp() {
		while (true) {
			int pRandom = (int) (Math.random() * (127 - 2) + 2);
			if (isPrime(pRandom)) {
				System.out.println("Got Random Prime P :" + pRandom);
				break;
			}
		}
		while (true) {
			int qRandom = (int) (Math.random() * (127 - 2) + 2);
			if (isPrime(qRandom)) {
				System.out.println("Got Random Prime Q :" + qRandom);
				break;
			}
		}
	}

	private static boolean isPrime(int n) {
		int i;
		for (i = 2; i <= Math.sqrt(n); i++) {
			if (n % i == 0) {
				return false;
			}
		}
		return true;
	}

}