package com.tesco_hack.recommendationengine.models;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@Data
@EqualsAndHashCode(of = "emailId")
public class User {
    private String emailId;
    private String name;
    private List<UserPreference> preferences;
}
