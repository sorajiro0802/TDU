using System;

namespace mini_test7
{
    class Program
    {
        static void Main(string[] args)
        {
            //入金額
            int money;
            //ジュースの価格
            int[] prices = new int[] { 100, 120, 110 };

            Console.WriteLine("1.オレンジ　100円、2.グレープ　120円、3.アップル　110円");
            Console.WriteLine("お金を何円入れますか？:");
            money = int.Parse(Console.ReadLine());
            Console.WriteLine("飲みたいジュースを番号（1～3）で選んで下さい");

            if (prices[int.Parse(Console.ReadLine())] < money)
                Console.WriteLine("お買い上げ有り難う御座いました。");
            else
                Console.WriteLine("金額が不足です");
        }
    }
}

