using System;

namespace mini_test5
{
    class Program
    {
        static void Main(string[] args)
        {
            int goukeiKingaku;
            int hotelNumber;
            int ninzuu;

            while (true) {
                goukeiKingaku = 0;
                Console.WriteLine("ホテル予約");
                Console.WriteLine("1.山手ホテル(1名5000円）");
                Console.WriteLine("2.静川ホテル(1名7000円)");
                Console.Write("ホテルの番号");
                hotelNumber = int.Parse(Console.ReadLine());
                Console.Write("人数");
                ninzuu = int.Parse(Console.ReadLine());

                if (hotelNumber == 1)
                    goukeiKingaku = 5000 * ninzuu;
                else if (hotelNumber == 2)
                    goukeiKingaku = 7000 * ninzuu;

                Console.WriteLine($"予約完了。合計金額は{goukeiKingaku}円です。");
                Console.Write("続けて予約しますか(y/n):");
                if (Console.ReadLine() == "n")
                    break;
            }
        }
    }
}

