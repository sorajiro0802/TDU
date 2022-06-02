using System;

namespace mid_test1
{
    class Program
    {
        static void Main(string[] args)
        {
            string name, food;
            Console.Write("名前:");
            name = Console.ReadLine();
            Console.Write("好物");
            food = Console.ReadLine();

            Console.WriteLine($"{name} likes {food}.");
        }
    }
}

