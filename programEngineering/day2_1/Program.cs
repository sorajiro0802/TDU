using System;
using day2_1;
using Te;

namespace day2_1 {
    class MainClass {
        public static void Main(string[] args) {
            Console.Beep(1000, 2000);
            
        }
    }
}
namespace Te {
    class Test {
         public static int crossNum(int a, int b) {
            int cross = a * b;
            return cross;
        }
    }
}