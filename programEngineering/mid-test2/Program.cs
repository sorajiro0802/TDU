using System;

namespace mid_test2
{
    class Program
    {
        static void Main(string[] args)
        {
            for(int i = 0; i<9; i++) {
                if(i < 3) {
                    Console.ForegroundColor = ConsoleColor.Red;
                }
                else if(i < 6) {
                    Console.ForegroundColor = ConsoleColor.Green;
                }
                else {
                    Console.ForegroundColor = ConsoleColor.Yellow;
                }

                Console.SetCursorPosition(i, i);
                Console.WriteLine(i);
            }
        }
    }
}

