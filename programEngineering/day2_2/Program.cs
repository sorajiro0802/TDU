using System;

namespace day2_2 {
    class MainClass {
        public static void Main(string[] args) {
            string friend = "Yamamoto";
            Console.WriteLine($"{friend}は{friend.Length}文字");
            Console.WriteLine(friend[2]);
            Console.WriteLine(friend.Replace("mo", "sa"));

            Console.WriteLine(friend.Contains("Yama"));
            Console.WriteLine(friend.Contains("Kawa"));
            }
    }
}
