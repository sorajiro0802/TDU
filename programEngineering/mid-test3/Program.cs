using System;

namespace mid_test3
{
    class Program
    {
        static void Main(string[] args)
        {
            int sum = 0; int i=0;
            do {
                i += 1;
                if (i%3 == 0 | i % 7 == 0) {
                    sum += i;
                    
                }
            } while (sum <= 10000);
            Console.WriteLine(i);
        }
    }
}

