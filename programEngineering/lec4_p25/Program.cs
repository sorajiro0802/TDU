using System;

namespace lec4_p25
{
    class Program
    {
        static void Main(string[] args)
        {
            // 加える2つの数
            int firstNum, secondNum;
            Console.Write("1番目の数:");          
            firstNum = int.Parse(Console.ReadLine());
            Console.Write("2番目の数:");
            secondNum = int.Parse(Console.ReadLine());

            // firstNum と secondNumを，addNumで加えた結果を表示する
            Console.WriteLine("足し算の答え:{0}", AddNum(firstNum, secondNum));
        }

        // 足し算を行う関数
        // firstNum,secondNum : 加える2つの数（整数型）
        static int AddNum(int firstNum, int secondNum) {
            // 加えた結果を返す
            return firstNum + secondNum;
        }
    }
}

