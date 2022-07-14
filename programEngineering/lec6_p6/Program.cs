namespace communication {
class Program {
        static void Main(string[] args) {
            string printString = InputString();
            int printTime = InputTime();
            Print(printTime, printString);
        }

        static string InputString() {
            Console.Write("文字表示列?: ");
            return Console.ReadLine();
        }
        static int InputTime() {
            Console.Write("表示回数?: ");
            return int.Parse(Console.ReadLine());
        }
        static void Print(int printTime, string printString) {
            for(int i = 0; i < printTime; i++) {
                Console.WriteLine(printString);
            }
        }
    }
}