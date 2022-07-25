namespace classTest {
    class Program {
        static void Main() {
            Student st1 = new Student(name: "Sora", gakuban: 41) ;
            Student st2 = new Student(name: "Tora", gakuban: 39);
            st1.PrintName();
            st2.PrintName();
        }
    }

    class Student {
        string name;
        int gakuban;

        public Student(string name, int gakuban) {
            this.name = name;
            this.gakuban = gakuban;
        }

        public void PrintName() {
            Console.WriteLine($"学籍番号: {this.gakuban}\n氏名: {this.name}");
        }
    }

}
