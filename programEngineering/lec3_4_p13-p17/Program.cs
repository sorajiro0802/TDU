using System;

namespace lec3_4 {
    class Program {
       static void Main(string[] args) {
            int numAns;
            string strAns;
            int[] numbers = new int[] { 1, 2, 3 };
            int numsAns;

            numAns = Multiplication(2, 3);
            strAns = ConnectString("Hello", "John");
            numsAns = Multiplication2(numbers);

            Console.WriteLine(numAns);
            Console.WriteLine(strAns);
            Console.WriteLine(numsAns);

            
        }
        static int Multiplication(int num1, int num2) {
            return num1 * num2;
        }
        static string ConnectString(String str1, String str2) {
            return str1 + " " + str2;
        }

        static int Multiplication2(int[] num) {
            int result = 1;
            foreach (int i in num)
                result *= i;

            return result;
        }
    }
}
