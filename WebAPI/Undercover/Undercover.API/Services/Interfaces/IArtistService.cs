using System;
using System.Collections.Generic;
using Undercover.API.Entities;

namespace Undercover.API.Services
{
    public interface IArtistService
    {
        List<Artist> GetAllArtist();

        List<Artist> GetMyArtist(string userId);

        List<Artist> GetMyRecommendedArtists(string userId);

        List<Artist> GetAllArtist(Genre genre);

        List<Artist> SearchArtist(string artistName);
        Artist Get(Guid id);

    }
}