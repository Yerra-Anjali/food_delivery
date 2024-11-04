package com.foodapp.dto;


public class CartItem {

    // Fields to represent the details of an item in the cart
    private int itemId;          // Unique ID of the item
    private int restaurantId;    // ID of the restaurant the item belongs to
    private String name;         // Name of the item
    private int quantity;        // Quantity of the item
    private double price;
    private String imgPath;// Price of the item
    
    

    // Constructor to initialize the fields when creating a new CartItem object
    public CartItem(int itemId, int restaurantId, String name, int quantity, double price) {
        this.itemId = itemId;
        this.restaurantId = restaurantId;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
    }

    // Getter and setter methods for each field

    public CartItem(int itemId, int restaurantId, String name, int quantity, double price, String imgPath) {
		super();
		this.itemId = itemId;
		this.restaurantId = restaurantId;
		this.name = name;
		this.quantity = quantity;
		this.price = price;
		this.imgPath = imgPath;
	}

	public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	@Override
	public String toString() {
		return "CartItem [itemId=" + itemId + ", restaurantId=" + restaurantId + ", name=" + name + ", quantity="
				+ quantity + ", price=" + price + ", imgPath=" + imgPath + "]";
	}

	
    
}