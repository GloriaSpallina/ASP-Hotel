using Hotel.DAL.Repositories;
using Hotel.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Repositories
{
    public class ThemeRepository : BaseRepository<ThemeEntity>, IConcreteRepository<ThemeEntity>
    {
        public ThemeRepository(string connectionString): base(connectionString)
        {

        }

        public bool Delete(ThemeEntity toDelete)
        {
            throw new NotImplementedException();
        }

        public List<ThemeEntity> Get()
        {
            return base.Get("SELECT * FROM THEME");
        }

        public ThemeEntity GetOne(int PK)
        {
            throw new NotImplementedException();
        }

        public bool Insert(ThemeEntity toInsert)
        {
            throw new NotImplementedException();
        }

        public bool Update(ThemeEntity toUpdate)
        {
            throw new NotImplementedException();
        }
    }
}
