using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace USQLEnumerableExtensions
{
    /// <summary>
    /// Make it easier to select a random object from an array. 
    /// </summary>
    public class ArrayExtensions
    {
        private static readonly Random _random = new Random();

        public static T Random<T>(T[] values)
        {
            return values[_random.Next(0, values.Length)];
        }
    }
}