using System;
using System.IO;
using System.Text;


namespace day2_6 {
    class MainClass {
        public static void Main(string[] args) {
            using (StreamWriter sw = new StreamWriter("./../../test2.txt", false, Encoding.Default)) {
                sw.WriteLine("Hello World!");
                sw.Close();
            }
        }
    }
}

