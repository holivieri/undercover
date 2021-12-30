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
           var notification = _dbContext.Notifications.FirstOrDefault(x => x.Id == notificationId);
            if(notification != null)
            {
                notification.Deleted = true;
                _dbContext.Notifications.Update(notification);
            }
        }

        public List<Notification> GetNotifications(string userId)
        {
            //var user = _dbContext.Users.Include(x => x.Notifications)
            //    .Where(u => u.Id == userId.ToString())
            //    .SingleOrDefault();

            //if(user == null)
            //{
            //    return new List<Notification>();
            //}

            //return user.Notifications;
            return _dbContext.Notifications
                .Where(n => n.User.Id == userId)
                .ToList();
                
        }
    }
}
