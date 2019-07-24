package com.tesco_hack.recommendationengine.models;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BuyingOption {
    private String sellerName;
    private String sellerType;
    private double distance;
    private double productPrice;
    private double deliveryCost;
    private double timeToGet;
    private int averageSellerRating;
}
