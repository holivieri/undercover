using System.Collections.Generic;
using System.Threading.Tasks;
using Undercover.API.Entities;

namespace Undercover.API.Services
{
    public interface ICommonService
    {
        List<Country> GetAllCountries();
        List<Genre> GetAllGenres();
    }
}