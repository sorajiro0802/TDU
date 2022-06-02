using System;

namespace mid_test4
{
    class Program
    {
        static void Main(string[] args) {
            string[] animal = new string[] { "dog", "cat", "bird", "mouse" };
            string[] plant  = new string[] { "tulip", "daisy", "sunflower" };

            Random random = new Random();

            
            Console.Write("animal or plant?");
            string species = Console.ReadLine();

            if (species == "animal") {
                Console.WriteLine(animal[random.Next(animal.Length)]);
            }
            else if (species == "plant") {
                Console.WriteLine(plant[random.Next(plant.Length)]);
            }
            
        }
    }
}

