using System;
using System.Collections.Generic;

namespace DigitosVerificadoresLib
{
    public interface IDVDAO<T>
    {
        List<T> getAll();

        String calculateDVH( T obj );

        String calculateDVV( List<T> list );

        void save( T obj );

        void update( T obj );
        void updateDVV();

        void UpdateAllDV();

        string getDVV();
    }
}