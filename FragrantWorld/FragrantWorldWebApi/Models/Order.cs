namespace FragrantWorldWebApi.Models;

public partial class Order
{
    public int OrderId { get; set; }

    public int? UserId { get; set; }

    public string Status { get; set; } = null!;

    public DateTime DeliveryDate { get; set; }

    public DateTime OrderDate { get; set; }

    public int ReceiptCode { get; set; }

    public int PickupPoint { get; set; }

    public virtual ICollection<OrderProduct> Orderproducts { get; set; } = new List<OrderProduct>();

    public virtual PickupPoint PickupPointNavigation { get; set; } = null!;

    public virtual User? User { get; set; }
}
