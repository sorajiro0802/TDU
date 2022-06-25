using System;
using System.Collections.Generic;

namespace lec5_p9
{
    class Program
    {
        static void Main(string[] args) {
            List<int> tList = new List<int>();
            int addNum, insNum, delIndexNum, indexNum = 0;

            while (true) {
                Console.Write("select action[0~2]\n 0:add 1:insert 2:delete\n>> ");
                string act = Console.ReadLine();

                if (act == "0") {
                    Console.Write("How?: ");
                    addNum = int.Parse(Console.ReadLine());
                    tList.Add(addNum);
                }
                else if (act == "1") {
                    Console.Write("How?: ");
                    insNum = int.Parse(Console.ReadLine());
                    Console.Write("Where?: ");
                    indexNum = int.Parse(Console.ReadLine());
                    tList.Insert(indexNum, insNum);
                }
                else if (act == "2") {
                    Console.Write("Where?: ");
                    delIndexNum = int.Parse(Console.ReadLine());
                    tList.RemoveAt(delIndexNum);
                }
                else {
                    Console.WriteLine("\nOut of range!!!\nGoodBye :)");
                    break;
                }

                Console.WriteLine("\nCurrent List is");
                int n = tList.Count;
                for (int i = 0; i < n; i++) {
                    Console.WriteLine($"[{i}]:{tList[i]}\n");
                }
            }

        }
    }
}

