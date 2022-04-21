using System;

namespace day2_2 {
    class MainClass {
        public static void Main(string[] args) {
            var BackgroundColor = ConsoleColor.Blue;
            Console.Write("ハロー・ワールド", BackgroundColor);
            Console.WriteLine("Hello World!");
            Console.ReadLine();
            Console.SetCursorPosition(0, 0);
            //Console.Beep(3000, 1);
            Console.ResetColor();
        }
    }
}
