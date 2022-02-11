using System;
using System.Collections.Generic;
using Undercover.API.Entities;

namespace Undercover.API.Services
{
    public interface IUserService
    {
        List<Notification> GetNotifications(string userId);
        void DeleteNotification(Guid notificationId);
        void CreateNotification(Notification notification, string userId);
        void SaveDevice(Device device);
        User GetUser(string userId);
        string CheckProfile(string userId);

        bool CreateProfile(string userId, Profile profile);
    }
}
