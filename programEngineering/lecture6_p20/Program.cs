int Factorial(int n) {
    if(n > 1) {
        return n * Factorial(n - 1);
    }
    else {
        return 1;
    }
}
Console.WriteLine(Factorial(int.Parse(Console.ReadLine())));