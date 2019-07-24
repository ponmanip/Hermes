package com.tesco_hack.recommendationengine.models;

import lombok.Data;

@Data
public class ProductSeller {
    private Product product;
    private Seller seller;
    private double price;
    private double deliveryCost;
    private double deliveryDuration;
}
