using System;
using System.IO;
using System.Text;

namespace day2_6 {
    class MainClass {
        public static void Main(string[] args) {
            StreamWriter sw = new StreamWriter("test.txt", false, Encoding.Default);
            sw.WriteLine("Hello World");
            
            StreamReader sr = new StreamReader("/Users/sorakojima/uni/dataBase/data/person8.txt", Encoding.Default);
            string line;
            while ((line = sr.ReadLine()) != null) {
                    Console.WriteLine(line);
            }
        }
    }
}

