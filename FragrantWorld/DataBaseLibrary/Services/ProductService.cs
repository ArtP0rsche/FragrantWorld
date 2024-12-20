using DataBaseLibrary.Data;
using DataBaseLibrary.Models;
using Microsoft.EntityFrameworkCore;

namespace DataBaseLibrary.Services
{
    public class ProductService
    {
        public readonly FragrantWorldContext _context = new();

        public async Task<List<Product>> GetProductsAsync()
            => await _context.Products.ToListAsync();

        public async Task<List<Product>> GetFilteredProductsAsync(int? sortBy, string? name, string? maker, decimal? minPrice = null, decimal? maxPrice = null)
        {
            var query = _context.Products.AsQueryable();

            if (!string.IsNullOrEmpty(name))
                query = query.Where(p => p.Name.Contains(name));

            if (!string.IsNullOrEmpty(maker) && maker != "Все производители")
                query = query.Where(p => p.Manufacturer.Contains(maker));

            if (minPrice != null && maxPrice != null)
                query = query.Where(p => p.Cost >= minPrice && p.Cost <= maxPrice);

            query = sortBy switch
            {
                0 => query.OrderBy(p => p.Cost),
                1 => query.OrderByDescending(p => p.Cost),
                _ => query
            };

            return await query.ToListAsync();
        }

        public async Task<List<string>> GetManufacterers()
            => await _context.Products.Select(p => p.Manufacturer).Distinct().ToListAsync();
    }
}
