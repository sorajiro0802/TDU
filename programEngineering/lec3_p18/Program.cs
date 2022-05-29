using System;

namespace lec3_p18
{
    class Program {
        static void Main(string[] args) {
            int ans = 0, num1, num2;
            string kindOfCalc;

            Console.WriteLine("a: 足し算, s: 引き算, m:掛け算, d:割り算");
            kindOfCalc = Console.ReadLine();
            Console.WriteLine("1番目の数");
            num1 = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("2番めの数");
            num2 = Convert.ToInt32(Console.ReadLine());

            switch (kindOfCalc) {
                case "a":
                    ans = Addition(num1, num2);
                    break;
                case "s":
                    ans = Subtraction(num1, num2);
                    break;
                case "m":
                    ans = Multiplication(num1, num2);
                    break;
                case "d":
                    ans = Division(num1, num2);
                    break;
                default:
                    return;
            }
            Console.WriteLine($"\ncalculated: {ans}");
        }
        // 以下にAddition, Subtraction, Multiplication, Divisionを定義

        static int Addition(int num1, int num2) {
            return num1 + num2;
        }
        static int Subtraction(int num1, int num2) {
            return num1 - num2;
        }
        static int Multiplication(int num1, int num2) {
            return num1 * num2;
        }
        static int Division(int num1, int num2) {
            return num1 / num2;
        }

    }
}

