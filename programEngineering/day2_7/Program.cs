using System;
using System.IO;
using System.Text;

namespace day2_7 {
    class MainClass {
        public static void Main(string[] args) {
            using( StreamReader sr = new StreamReader("./../../test2.txt", Encoding.Default)) {
                string line;
                while( (line = sr.ReadLine()) != null ) {
                    Console.WriteLine(line);
                }
            }
        }
    }
}
