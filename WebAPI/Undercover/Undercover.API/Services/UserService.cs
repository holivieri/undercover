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

        public string CheckProfile(string userId)
        {
            var user = _dbContext.Users.Include(p => p.Profile).Where(u => u.Id == userId).SingleOrDefault();
            if (user == null)
            {
                return "none";
            }
            if(user.Profile == null)
            {
                return "none";
            }
            if (user.Profile.isUser) return "user";
            if (user.Profile.isPlaceOwner) return "owner";
            if (user.Profile.isArtist) return "artist";
            return "none";
        }

        public bool CreateProfile(string userId, Profile profile)
        {
            var user = _dbContext.Users.Find(userId);
            if (user == null)
            {
                return false;
            }
            //Is Artist * validations *
            if(profile.Artist != null)
            {
                profile.Artist.Id = Guid.NewGuid();
                profile.Artist.CreatedDate = DateTime.UtcNow;

                if(profile.Artist.Pictures != null)
                {
                    foreach (var pic in profile.Artist.Pictures)
                    {
                        pic.Id = Guid.NewGuid();
                        pic.Likes = 0;
                    }
                }
                
                profile.Artist.Genres.ForEach(g => _dbContext.Entry(g).State = EntityState.Unchanged);
                _dbContext.Artists.Add(profile.Artist);
            }
            if(profile.Place != null)
            {
                profile.Place.Id = Guid.NewGuid();
                if(profile.Place.Pictures != null)
                {
                    foreach (var pic in profile.Place.Pictures)
                    {
                        pic.Id = Guid.NewGuid();
                        pic.Likes = 0;
                    }
                }
                
                _dbContext.Entry(profile.Place.Country).State = EntityState.Unchanged;
                profile.Place.CreatedDate = DateTime.UtcNow;
                profile.Place.Dislikes = 0;
                profile.Place.Likes = 0;
                _dbContext.Places.Add(profile.Place);

            }
            
            if(!profile.isArtist && !profile.isPlaceOwner)
            {
                profile.User.MyGenres.ForEach(g => _dbContext.Entry(g).State = EntityState.Unchanged);
                user.MyGenres = new List<Genre>();

                user.MyGenres.AddRange(profile.User.MyGenres);

            }

            user.Profile = profile;
            _dbContext.SaveChanges();
            return true;

        }
    }
}
