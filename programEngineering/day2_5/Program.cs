using System;

namespace day2_5 {
    class MainClass {
        public static void Main(string[] args) {
            Console.Write("Max Num: ");
            int max = int.Parse(Console.ReadLine());
            Console.Write("min Num: ");
            int min = int.Parse(Console.ReadLine());

            Random randInt = new Random();
            Console.WriteLine(randInt.Next(min, max));
        }
    }
}
