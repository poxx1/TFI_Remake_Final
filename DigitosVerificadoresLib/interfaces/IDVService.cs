using System;
using System.Collections.Generic;

namespace DigitosVerificadoresLib.interfaces
{
    public interface IDVService
    {
        void reacalcDV();
        List<String> checkintegrity();
    }
}