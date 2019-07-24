package com.tesco_hack.recommendationengine.dao;

import com.tesco_hack.recommendationengine.models.BuyingOption;
import com.tesco_hack.recommendationengine.models.Product;
import com.tesco_hack.recommendationengine.models.UserPreference;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.util.stream.Collectors;

@Repository
public class ProductDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public List<Product> getProductById(String id) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("id", id);
        return namedParameterJdbcTemplate.query("select * from Product where id = :id", paramMap, new ProductMapper());
    }

    public List<BuyingOption> getAllBuyigOptions(String customerId, String productId, Double latitude, Double longitude) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("productId", productId);

        String queryStr = "select seller.id, seller.type, seller.rating, seller.name,  product_seller.price, product_seller.deliverycost, product_seller.deliveryDuration  " +
                "from product, seller, product_seller " +
                "where product.id = :productId " +
                "and product_seller.productid = product.id " +
                "and seller.id = product_seller.sellerid ";
        List<BuyingOption> buyingOptions = namedParameterJdbcTemplate.query(queryStr, paramMap, new BuyingOptionMapper());
        return getSortedByPreference(customerId, buyingOptions);
        // return buyingOptions;
    }

    private List<BuyingOption> getSortedByPreference(String customerId, List<BuyingOption> buyingOptions) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("customerId", customerId);

        String queryStr = "select review_sensitivity, price_sensitivity, speed_sensitivity from customer_preference where customerId = :customerId";
        UserPreference userPreference = namedParameterJdbcTemplate.queryForObject(queryStr, paramMap, new RowMapper<UserPreference>() {
            @Override
            public UserPreference mapRow(ResultSet rs, int i) throws SQLException {
                UserPreference userPreference1 = new UserPreference();
                userPreference1.setPriceSensitiveRating(rs.getInt("price_sensitivity"));
                userPreference1.setReviewSensitiveRating(rs.getInt("review_sensitivity"));
                userPreference1.setSpeedSensitiveRating(rs.getInt("speed_sensitivity"));
                return userPreference1;
            }
        });
        return buyingOptions.stream()
                // .sorted(Comparator.comparing(BuyingOption::getAverageSellerRating).thenComparing(BuyingOption::getTimeToGet).thenComparing(BuyingOption::getProductPrice))
                .sorted(BuyingOptionComparatorFactory.getComparatorInOrder(userPreference))
                .collect(Collectors.toList());
    }


}


class ProductMapper implements RowMapper<Product> {
    public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
        Product product = new Product();
        product.setId(rs.getString("id"));
        product.setName(rs.getString("name"));
        product.setAverageRating(rs.getInt("averageRating"));
        product.setCategory(rs.getString("category"));
        product.setNumberOfReviews(rs.getInt("numberOfReviews"));
        product.setDescription(rs.getString("description"));
//        product.setBarcode(rs.getString("barcode"));
        product.setImageUrl(rs.getString("imageUrl"));
        return product;
    }
}


class BuyingOptionMapper implements RowMapper<BuyingOption> {

    @Override
    public BuyingOption mapRow(ResultSet rs, int i) throws SQLException {
        BuyingOption buyingOption = new BuyingOption();
        buyingOption.setSellerName(rs.getString("name"));
        buyingOption.setSellerType(rs.getString("type"));
        buyingOption.setProductPrice(rs.getDouble("price"));
        buyingOption.setDeliveryCost(rs.getDouble("deliveryCost"));
        buyingOption.setTimeToGet(rs.getDouble("deliveryduration"));
        buyingOption.setAverageSellerRating(rs.getInt("rating"));
        buyingOption.setDistance(new Random().nextInt(50));
        return buyingOption;
    }

}

@Getter
@Setter
class BuyingOptionComparatorFactory {

    public static Comparator<BuyingOption> getComparatorInOrder(UserPreference userPreference) {
        Comparator<BuyingOption> comparator = null;
        if (userPreference.getPriceSensitiveRating() >= userPreference.getReviewSensitiveRating()
                && userPreference.getPriceSensitiveRating() >= userPreference.getSpeedSensitiveRating()
        ) {
            comparator = Comparator.comparing(BuyingOption::getProductPrice);
            if (userPreference.getSpeedSensitiveRating() >= userPreference.getReviewSensitiveRating()) {
                comparator.thenComparing(BuyingOption::getTimeToGet).thenComparing(BuyingOption::getAverageSellerRating);
            } else {
                comparator.thenComparing(BuyingOption::getAverageSellerRating).thenComparing(BuyingOption::getTimeToGet).reversed();
            }
        } else if (userPreference.getSpeedSensitiveRating() >= userPreference.getReviewSensitiveRating()
                && userPreference.getSpeedSensitiveRating() >= userPreference.getPriceSensitiveRating()
        ) {
            comparator = Comparator.comparing(BuyingOption::getTimeToGet);
            if (userPreference.getPriceSensitiveRating() >= userPreference.getReviewSensitiveRating()) {
                comparator.thenComparing(BuyingOption::getProductPrice).thenComparing(BuyingOption::getAverageSellerRating);
            } else {
                comparator.thenComparing(BuyingOption::getAverageSellerRating).thenComparing(BuyingOption::getProductPrice);
            }
        } else {
            comparator = Comparator.comparing(BuyingOption::getAverageSellerRating);
            if (userPreference.getPriceSensitiveRating() >= userPreference.getSpeedSensitiveRating()) {
                comparator.thenComparing(BuyingOption::getProductPrice).thenComparing(BuyingOption::getTimeToGet);
            } else {
                comparator.thenComparing(BuyingOption::getTimeToGet).thenComparing(BuyingOption::getProductPrice);
            }
        }
        return comparator;
    }
}
