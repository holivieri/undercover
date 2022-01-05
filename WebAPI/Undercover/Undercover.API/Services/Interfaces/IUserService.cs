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
    }
}
