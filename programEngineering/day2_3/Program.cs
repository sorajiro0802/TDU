using System;

namespace day2_3 {
    class MainClass {
        public static void Main(string[] args) {
            int i = 0, sum=0;
            while(i < 200) {
                i += 1;
                if(i % 3 == 0) {
                    sum += i;
                }
                Console.WriteLine(i);
            }
            Console.WriteLine(sum);
        }
    }
}

