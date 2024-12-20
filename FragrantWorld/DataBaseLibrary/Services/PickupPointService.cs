using DataBaseLibrary.Data;
using DataBaseLibrary.Models;
using Microsoft.EntityFrameworkCore;

namespace DataBaseLibrary.Services
{
    public class PickupPointService
    {
        public readonly FragrantWorldContext _context = new();

        public async Task<List<PickupPoint>> GetPickupPointsAsync()
            => await _context.PickupPoints.ToListAsync();
    }
}
