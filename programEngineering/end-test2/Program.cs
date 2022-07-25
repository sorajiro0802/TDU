
using System;
using System.Collections.Generic;

namespace ConsoleApp21 {
    internal class Program {
        static void Main(string[] args) {
            Stack<int> stuck = new Stack<int>();

            for (int i = 0; i < 1000; i++)
                stuck.Push(i);

            Console.WriteLine(stuck.Peek());
            Console.WriteLine(stuck.Count);
            for (int i = 0; i < 50; i++)
                stuck.Pop();
            Console.WriteLine(stuck.Pop());
            Console.WriteLine(stuck.Pop());
            Console.WriteLine(stuck.Count);
            Console.WriteLine(stuck.Count);
        }
    }
}