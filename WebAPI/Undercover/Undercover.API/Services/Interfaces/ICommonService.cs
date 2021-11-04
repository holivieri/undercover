using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Undercover.API.Entities;

namespace Undercover.API.Services
{
    public interface ICommonService
    {
        List<Country> GetAllCountries();
        Country GetCountry(Guid id);

        List<Genre> GetAllGenres();
        Genre GetGenre(Guid id);
    }
}