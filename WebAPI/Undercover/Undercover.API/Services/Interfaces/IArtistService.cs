using System;
using System.Collections.Generic;
using Undercover.API.Entities;

namespace Undercover.API.Services
{
    public interface IArtistService
    {
        List<Artist> GetAllArtist();
        List<Artist> GetAllArtist(Genre genre);

        Artist Get(Guid id);
    }
}