using FragrantWorldWebApi.Data;
using FragrantWorldWebApi.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics.Metrics;
using System.Xml.Linq;

namespace FragrantWorldWebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly FragrantWorldContext _context;

        public ProductsController(FragrantWorldContext context)
        {
            _context = context;
        }

        // GET: api/Products
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Product>>> GetProducts()
        {
            return await _context.Products.ToListAsync();
        }

        // GET: api/Products/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Product>> GetProduct(string id)
        {
            var product = await _context.Products.FindAsync(id);

            if (product == null)
            {
                return NotFound();
            }

            return product;
        }

        // PUT: api/Products/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutProduct(string id, Product product)
        {
            if (id != product.ProductArticleNumber)
            {
                return BadRequest();
            }

            _context.Entry(product).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Products
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Product>> PostProduct(Product product)
        {
            _context.Products.Add(product);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (ProductExists(product.ProductArticleNumber))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetProduct", new { id = product.ProductArticleNumber }, product);
        }

        // DELETE: api/Products/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteProduct(string id)
        {
            var product = await _context.Products.FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }

            _context.Products.Remove(product);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ProductExists(string id)
        {
            return _context.Products.Any(e => e.ProductArticleNumber == id);
        }

        [HttpGet("filterByManufacturer")]
        public async Task<ActionResult<IEnumerable<Product>>> GetFilteredProducts(string? sortBy, string? manufacturer)
        {
            var query = _context.Products.AsQueryable();

            if (!string.IsNullOrEmpty(manufacturer) && manufacturer != "Все производители")
                query = query.Where(p => p.Manufacturer.Contains(manufacturer));

            query = sortBy switch
            {
                "Ascending" => query.OrderBy(p => p.Cost),
                "Descending" => query.OrderByDescending(p => p.Cost),
                _ => query
            };

            return await query.ToListAsync();
        }

        [HttpGet("filterByName")]
        public async Task<ActionResult<IEnumerable<Product>>> GetFilteredProducts(string? name)
        {
            var query = _context.Products.AsQueryable();

            if (!string.IsNullOrEmpty(name))
                query = query.Where(p => p.Name.Contains(name));

            return await query.ToListAsync();
        }

        [HttpGet("filterByPrice")]
        public async Task<ActionResult<IEnumerable<Product>>> GetFilteredProducts(decimal? minPrice, decimal? maxPrice)
        {
            var query = _context.Products.AsQueryable();

            if (minPrice != null && maxPrice != null)
                query = query.Where(p => p.Cost >= minPrice && p.Cost <= maxPrice);

            return await query.ToListAsync();
        }
    }
}
