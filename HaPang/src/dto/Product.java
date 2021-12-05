package dto;

import java.io.Serializable;

public class Product implements Serializable   {
	private static final long serialVersionUID = -4274700572038677000L;
	//java ����ȭ 
	
	private String productId;		//��ǰ���̵�
	private String pname;			//��ǰ��
	private Integer unitPrice;		//��ǰ ����
	private Integer saleRate;
	private Integer sellPrice; //상품할인가
	private String description;		//��ǰ ����
	private String manufacturer;	//������
	private String category;		//�з�
	private long unitsInStock;		//����
	private String condition;		//�Ż�ǰ or �߰�ǰ or ���ǰ
	private String filename;
	private String deliveryType; //배송유형
	private Integer deliveryFee; //배송비
	private int quantity; //w장바구니에 담은 개수
	public Integer getSellPrice() {
		return sellPrice;
	}

	public void setSellPrice(Integer sellPrice) {
		this.sellPrice = sellPrice;
	}

	public String getDeliveryType() {
		return deliveryType;
	}

	public void setDeliveryType(String deliveryType) {
		this.deliveryType = deliveryType;
	}

	public Integer getDeliveryFee() {
		return deliveryFee;
	}

	public void setDeliveryFee(Integer deliveryFee) {
		this.deliveryFee = deliveryFee;
	}
	
	public Product() {
		super();
	}

	public Product(String productId, String pname, Integer unitPrice) {
		super();
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}
	
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}                                                
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Integer getSaleRate() {
		return saleRate;
	}

	public void setSaleRate(Integer saleRate) {
		this.saleRate = saleRate;
	}
}








