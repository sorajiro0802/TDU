using System;

namespace lec3_3
{
    class Program
    {
        static void Main(string[] args)
        {
            Greeting();
        }

        static void Greeting() {
            string name;
            name = Console.ReadLine();
            Console.WriteLine($"Hello {name}!");
        }
    }
}

