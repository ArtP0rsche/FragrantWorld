using DataBaseLibrary.Data;
using DataBaseLibrary.Models;
using Microsoft.EntityFrameworkCore;

namespace DataBaseLibrary.Services
{
    public class UserService
    {
        public readonly FragrantWorldContext _context = new();

        public async Task<User> GetUserByLoginAsync(string login)
            => await _context.Users.Where(u => u.Login == login).FirstOrDefaultAsync();
    }
}
