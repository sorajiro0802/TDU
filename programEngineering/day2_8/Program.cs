using System;
using System.Timers;

namespace day2_8 {
    class MainClass {
        private static Timer aTimer;

        public static void Main(string[] args) {
            // タイマーのセット
            SetTimer();
            Console.WriteLine("\n終了するにはEnterを押してださい\n");
            Console.WriteLine($"プログラム開始時刻は{DateTime.Now:HH:mm:ss.fff}");
            Console.ReadLine();
            aTimer.Stop();
            aTimer.Dispose();
            Console.WriteLine("プログラム終了");
        }

        // タイマーのセット
        private static void SetTimer() {
            // タイマーのインターバルのセット[2000 ms]
            aTimer = new Timer(2000);
            // インターバルごとに呼ばれるメソッドのセット
            aTimer.Elapsed += OnTimedEvent;
            aTimer.AutoReset = true;
            aTimer.Enabled = true;
        }

        // インターバルごとに呼ばれるメソッド
        private static void OnTimedEvent(object source, ElapsedEventArgs e) {
            Console.WriteLine($"The Elapsed event was raised at {e.SignalTime:HH:mm:ss.fff}");
        }
    }
}
