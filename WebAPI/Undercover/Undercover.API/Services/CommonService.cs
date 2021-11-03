using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Undercover.API.Data;
using Undercover.API.Entities;

namespace Undercover.API.Services
{
    public class CommonService : ICommonService
    {
        private readonly IApplicationDbContext _dbContext;

        public CommonService(IApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public List<Genre> GetAllGenres()
        {
            return _dbContext.Genres
                .OrderBy(c => c.Name)
                .ToList();
        }


        public List<Country> GetAllCountries()
        {
            return _dbContext.Countries
                .OrderBy(c => c.Name)
                .ToList();
        }
    }
}
