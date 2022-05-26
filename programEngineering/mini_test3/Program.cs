using System;
using System.Text;
using System.IO;
namespace mini_test4 {
    class MainClass {
        public static void Main(string[] args) {
            using (StreamReader sr = new StreamReader("aaaaaaaaaa.txt", Encoding.Default)) {
                string line;
                int cnt = 0;
                while ((line = sr.ReadLine()) != null) {
                    cnt += 1;
                    for(int i = 0; i < line.Length; i++) {
                        if(line[i] != 'a') {
                            Console.WriteLine(cnt);
                            break;
                        }
                    }
                }
            }
        }
    }
}
