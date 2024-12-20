namespace DataBaseLibrary.Models;

public partial class Product
{
    public string ProductArticleNumber { get; set; } = null!;

    public string Name { get; set; } = null!;

    public string? Description { get; set; }

    public string Category { get; set; } = null!;

    public byte[]? Photo { get; set; }

    public string Manufacturer { get; set; } = null!;

    public decimal Cost { get; set; }

    public sbyte? DiscountAmount { get; set; }

    public int QuantityInStock { get; set; }

    public string Status { get; set; } = null!;

    public virtual ICollection<OrderProduct> Orderproducts { get; set; } = new List<OrderProduct>();
}
