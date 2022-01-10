using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using Undercover.API.Data;
using Undercover.API.Entities;

namespace Undercover.API.Services
{
    public class UserService : IUserService
    {
        private readonly IApplicationDbContext _dbContext;

        public UserService(IApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public void CreateNotification(Notification notification, Guid userId)
        {
            notification.Id = Guid.NewGuid();
            notification.CreatedDate = DateTime.UtcNow;
            notification.User = _dbContext.Users.FirstOrDefault(u => u.Id == userId.ToString());
            _dbContext.Notifications.Add(notification);
            _dbContext.SaveChanges();

        }

        public void DeleteNotification(Guid notificationId)
        {
            var notification = _dbContext.Notifications.Find(notificationId);  
            if (notification != null)
            {
                notification.Deleted = true;
                _dbContext.Notifications.Update(notification);
                _dbContext.SaveChanges();
            }
        }

        public List<Notification> GetNotifications(string userId)
        {
            return _dbContext.Notifications
                .Where(n => n.User.Id == userId && n.Deleted == false)
                .ToList();
        }

        public void SaveDevice(Device device)
        {
            var deviceDB = _dbContext.Devices.Find(device.Token);
            if (deviceDB != null)
            {
                deviceDB.LastAccess = DateTime.UtcNow;
            }
            else
            {
                _dbContext.Devices.Add(device);
            }
            _dbContext.SaveChanges();
        }

        public User GetUser(string userId)
        {
           return _dbContext.Users
                .Include(u => u.MyArtists)
                .Include(u => u.MyPlaces)
                .Where(u => u.Id == userId).FirstOrDefault();
        }
    }
}
