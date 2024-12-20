using DataBaseLibrary.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Text;
using System.Threading.Tasks;

namespace FragrantWorld.Services
{
    public class WebApiService
    {
        private readonly HttpClient _client;

        public WebApiService()
        {
            _client = new() { BaseAddress = new Uri("http://localhost:5285/api/") };
        }

        public async Task<IEnumerable<Product>?> GetProductsAsync()
        {
            var response = await _client.GetAsync("Products");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<IEnumerable<Product>>();
        }

        public async Task<IEnumerable<Product>?> GetFilteredProductsAsync(string? sortBy, string? manufacturer)
        {
            var response = await _client.GetAsync($"Products/filterByManufacturer/?sortBy={sortBy}&manufacturer={manufacturer}");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<IEnumerable<Product>>();
        }

        public async Task<IEnumerable<Product>?> GetFilteredProductsAsync(string? name)
        {
            var response = await _client.GetAsync($"Products/filterByName/?name={name}");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<IEnumerable<Product>>();
        }
        public async Task<IEnumerable<Product>?> GetFilteredProductsAsync(decimal? minPrice, decimal? maxPrice)
        {
            var response = await _client.GetAsync($"Products/filterByPrice/?minPrice={minPrice}&maxPrice={maxPrice}");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<IEnumerable<Product>>();
        }

        public async Task<User?> GetUserByLoginAsync(string login)
        {
            var response = await _client.GetAsync($"Users/login?login={login}");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<User>();
        }

        public async Task<IEnumerable<PickupPoint>?> GetPickupPointsAsync()
        {
            var response = await _client.GetAsync($"PickupPoints");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<IEnumerable<PickupPoint>?>();
        }

        public async Task<int> GetOrderNextIdAsync()
        {
            var response = await _client.GetAsync($"Orders/lastId");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<int>();
        }

        public async Task AddOrderAsync(Order order)
        {
            var response = await _client.PostAsJsonAsync($"Orders", order);
            response.EnsureSuccessStatusCode();
        }
    }
}
