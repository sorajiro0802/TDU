using System;

namespace ConsoleApp24 {
    internal class Program {
        static void Main(string[] args) {
            DrawStars(10);
        }

        static void DrawStars(int number) {
            for (int i = 0; i < number; i++)
                Console.Write("*");
            Console.WriteLine();

            if (number != 1)
                DrawStars(number-1);
        }
    }
}