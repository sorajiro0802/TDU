using System;

namespace lec3_2 {
    class MainClass {
        public static void Main(string[] args) {
            // my ans
            /*
            Random random = new Random();
            int i = random.Next(1, 10);

            while (true) {
                    Console.WriteLine(i);
                    if(int.Parse(Console.ReadLine()) == i) {
                    Console.WriteLine("正解");
                    i = random.Next(1, 10);
                }
                else {
                    Console.WriteLine("不正解");
                    i = random.Next(1, 10);
                }
            } */
            
            // teacher ans
            Random random = new Random();
            int i = random.Next(1, 10);
            while (true) {
                if (Console.ReadLine() != i.ToString()) {
                    Console.WriteLine("不正解");
                }
                else {
                    Console.WriteLine("正解");
                    break;
                }
            }
            
        }
    }
}

