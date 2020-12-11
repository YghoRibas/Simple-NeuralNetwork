using System;

namespace Simple_NeuralNetwork
{
    class Program
    {
        static void Main(string[] args)
        {
            double[] w = {0.8233245475,1.1233256475,1.0533245475};
            int input;
            input = int.Parse(Console.ReadLine());
            double output = 0;

            for(int i = 0; i < w.Length; i++) {
                output += input * w[i];
            }
            
            Console.WriteLine($"Result: {output}");
        }
    }
}
