using System;

namespace ConsoleApp22 {
    internal class Program {
        static void Main(string[] args) {
            Animal animal = new Animal("Lion", 200);
            animal.PrintAnimal();
        }
    }

    class Animal {
        string nameOfAnimal;
        int heightOfAnimal;

        public Animal(string nameOfAnimal, int heightOfAnimal) {
            this.nameOfAnimal = nameOfAnimal;
            this.heightOfAnimal = heightOfAnimal;
        }

        public void PrintAnimal() {
            Console.WriteLine($"{nameOfAnimal}の身長は{heightOfAnimal}cm");
        }
    }
}