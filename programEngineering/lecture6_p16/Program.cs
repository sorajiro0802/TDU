namespace ataiwatasi {
    public class Program{
        static void Main() {
            int a, b;
            a = 5;
            b = fn2(ref a);
            Console.WriteLine("a={0} b={1}\n", a, b);
        }

        static int fn(int n) {
            int k = 1;
            while(n > 0) {
                k = k * n;
                n--;
            }
            return k;
        }
        static int fn2(ref int n) {
            int k = 1;
            while( n > 0) {
                k = k * n;
                n--;
            }
            return k;
        }
    }
}