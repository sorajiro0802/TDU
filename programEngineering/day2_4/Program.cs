﻿using System;

namespace day2_4 {
    class MainClass {
        public static void Main(string[] args) {
            int s = int.Parse(Console.ReadLine());
            string[,] stTable = new string[,] { {"0", "Akashi Minoru"},
                                                {"1", "Imai Yukiko"},
                                                {"2", "Oota Takeshi"},
                                                {"3", "Kanazawa Nobuyuki"}};
            //int num = int.Parse(s);
            Console.WriteLine(stTable[s, 1]);
        }
    }
}
