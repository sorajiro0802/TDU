using System;
using System.Collections.Generic;

namespace lec5_p12
{
    class Program
    {
        static void Main(string[] args)
        {
            List<string> names = new List<string>();
            string name;

            while (true) {
                Console.Write("1:入力  2:終わり\n>> ");
                string selectAct = Console.ReadLine();

                switch (selectAct) {
                    case "1":
                        Console.Write("名前: ");
                        name = Console.ReadLine();
                        names.Add(name);
                        break;

                    default:
                        break;
                }
                int n = names.Count;
                for (int i = 0; i < n; i++) {
                    Console.Write($"{names[i]} ");
                }
                Console.WriteLine("");
                if(selectAct != "1") { break; }
            }
            
        }
    }
}

