using System;
using System.Collections.Generic;
using Undercover.API.Entities;

namespace Undercover.API.Services
{
    public interface IConcertService
    {
        List<Concert> GetNextConcerts();
        List<Concert> GetNextConcerts(string city);

        Concert Get(Guid id);
    }
}