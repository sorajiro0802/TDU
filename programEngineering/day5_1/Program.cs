using System;
using System.Timers;

namespace day2_8
{
    class MainClass
    {
        private static Timer aTimer;
        private static Random random = new Random();

        private static int cnt = 0;

        public static void Main(string[] args)
        {
            // タイマーのセット
            SetTimer();
            Console.WriteLine("\n終了するにはEnterを押してださい\n");
            Console.ReadLine();
        }

        // タイマーのセット
        private static void SetTimer()
        {
            // タイマーのインターバルのセット[1000 ms]
            aTimer = new Timer(1000);
            // インターバルごとに呼ばれるメソッドのセット
            aTimer.Elapsed += OnTimedEvent;
            aTimer.AutoReset = true;
            aTimer.Enabled = true;

        }

        // インターバルごとに呼ばれるメソッド
        private static void OnTimedEvent(object source, ElapsedEventArgs e)
        {
            cnt += 1;
            Console.WriteLine($"random number is {random.Next(1, 6)}");
            if (cnt == 10) {
                aTimer.Stop();
                aTimer.Dispose();
            }
        }
    }
}
