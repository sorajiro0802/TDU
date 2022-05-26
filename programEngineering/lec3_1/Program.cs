using System;

namespace lec3_1 {
    class MainClass {
        public static void Main(string[] args) {
            int coin = 0;

            while (true) {
                do {
                    Console.Write("100円入金してください: ");
                    coin = int.Parse(Console.ReadLine());
                    Console.WriteLine($"合計金額: ¥{coin}\n");
                } while (coin < 100);

                Console.WriteLine("商品をどうぞ\n");
                coin = 0;
            }
        }
    }
}