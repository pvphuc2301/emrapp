using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace EMR
{
    public static class DataHelpers
    {
        public static int CalculateAge(DateTime dateOfBirth)
        {
            int age = 0;
            age = DateTime.Now.Year - dateOfBirth.Year;
            if (DateTime.Now.DayOfYear < dateOfBirth.DayOfYear)
                age = age - 1;

            return age;
        }


    }
}