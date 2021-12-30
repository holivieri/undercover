﻿using Microsoft.EntityFrameworkCore;
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
            //var notificationDB = _dbContext
            //                        .Notifications
            //                        .Include(n => n.User)
            //                        .Where(n => n.Id == notificationId).FirstOrDefault();

            //Notification newNotification = new Notification
            //{
            //    Category = notificationDB.Category,
            //    CreatedDate = notificationDB.CreatedDate,
            //    Deleted = true,
            //    Id = notificationId,
            //    Message = notificationDB.Message,
            //    Title = notificationDB.Title,
            //    User = notificationDB.User,
            //};

            //_dbContext.Entry(notificationDB).CurrentValues.SetValues(newNotification);
            //_dbContext.SaveChanges();


            var notification = _dbContext.Notifications.Find(notificationId);  //FirstOrDefault(x => x.Id == notificationId);
            if (notification != null)
            {
                notification.Deleted = true;
                _dbContext.Notifications.Attach(notification).Property(p => p.Deleted).IsModified = true;
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
    }
}
