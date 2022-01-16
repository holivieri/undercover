using System;
using System.Collections.Generic;
using Undercover.API.Entities;

namespace Undercover.API.Services
{
    public interface IUserService
    {
        List<Notification> GetNotifications(string userId);
        void DeleteNotification(Guid notificationId);
        void CreateNotification(Notification notification, Guid userId);
        void SaveDevice(Device device);
        User GetUser(string userId);


        void AddArtist(User User, Guid ArtistId);
        void RemoveArtist(User User, Guid ArtistId);


        void AddPlace(User User, Guid PlaceId);
        void RemovePlace(User User, Guid PlaceId);

        void AddGenre(User User, Guid GenreId);
        void RemoveGenre(User User, Guid GenreId);

        List<Artist> GetMyArtist(string userId);
    }
}
