namespace DataBaseLibrary.Models;

public partial class PickupPoint
{
    public int PickupPointId { get; set; }

    public int PostCode { get; set; }

    public string Address { get; set; } = null!;

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}
