using System;

namespace end_test1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int month;
            do {
                Console.Write("誕生月: ");
                month = int.Parse(Console.ReadLine());
                Console.WriteLine(Uranai(month));
                Console.Write("続けますか？(y/n)");
            }while(Console.ReadLine() == "y") ;
        }

        static string Uranai(int month) {
            Random random = new Random();

            if (random.Next(1, 13) == month) {
                return "大吉";
            }
            else {
                return "吉";
            }
        }
    }
}

