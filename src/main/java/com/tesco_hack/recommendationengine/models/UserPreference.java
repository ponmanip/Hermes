package com.tesco_hack.recommendationengine.models;

import lombok.Data;

@Data
public class UserPreference {
    private String customerId;
    private String category;
    private int speedSensitiveRating;
    private int priceSensitiveRating;
    private int reviewSensitiveRating;
}
