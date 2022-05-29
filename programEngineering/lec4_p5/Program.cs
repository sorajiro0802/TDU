using System;

namespace lec4_p5
{
    class Program
    {
        static void Main(string[] args)
        {
            string s;

            while (true) {
                s = Console.ReadLine();
                if(s == s.ToUpper()) {
                    Console.WriteLine(s.ToLower());
                }
                else {
                    Console.WriteLine("大文字のみの文字列を入力してください．\n");
                } 
            }
        }
    }
}

