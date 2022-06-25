using System;

namespace mini_test6
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int answer = 0;
            int[] data1 = new int[] { 1, 3, 5, 7 };
            int[] data2 = new int[] { 2, 4, 6, 8 };

            for(int i = 0; i < data1.Length; i++) {
                answer += Multiplication(data1[i], data2[i]);
            }

            Console.WriteLine($"Result is {answer}");
        }

        static int Multiplication(int num1, int num2) {
            return num1 * num2;
        }
    }
}

