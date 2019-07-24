package com.tesco_hack.recommendationengine.models;

import lombok.Data;

@Data
public class ShoppingOption {
    private Product product;
    private Seller seller;
    private Delivery delivery;
}
