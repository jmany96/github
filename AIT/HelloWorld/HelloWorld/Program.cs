using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloWorld
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("Hello World");
            Console.ReadLine();
            const int CONST1 = 100;
            const int CONST2 = 100;
            const int CONST3 = CONST1 + CONST2;

            var num = 10000;

            if (num > 9000)
            {
                Console.WriteLine("num is" + num);
            }
            else if (num > 9500)
            {
                Console.WriteLine("num is " + num + ". Greater than 9500");
            }
            else
            {
                Console.WriteLine("!!!!");
            }
            Console.ReadLine();
        }

    }
}
