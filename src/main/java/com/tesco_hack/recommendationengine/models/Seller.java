package com.tesco_hack.recommendationengine.models;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = {"id"})
public class Seller {
    private String id;
    private String name;
    private SellerType type;
    private String baseUrl;
    private double latitude;
    private double longitude;
}
