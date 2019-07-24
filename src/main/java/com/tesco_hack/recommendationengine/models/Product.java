package com.tesco_hack.recommendationengine.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@EqualsAndHashCode(of = {"id"})
@NoArgsConstructor
@AllArgsConstructor
public class Product {
    private String id;
    private String name;
    private String description;
    private String category;
    private String imageUrl;
    private int averageRating;
    private String reviewSummary;
    private String barcode;
    private int numberOfReviews;
}
