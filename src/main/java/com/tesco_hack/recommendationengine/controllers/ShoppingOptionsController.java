package com.tesco_hack.recommendationengine.controllers;

import com.tesco_hack.recommendationengine.dao.ProductDao;
import com.tesco_hack.recommendationengine.exceptions.InvalidPayloadException;
import com.tesco_hack.recommendationengine.models.BuyingOption;
import com.tesco_hack.recommendationengine.models.Product;
import com.tesco_hack.recommendationengine.models.ShoppingOption;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Api(
        value = "SHOPPING OPTIONS",
        tags = {"SHOPPING OPTIONS"})
@RequestMapping(value = "/shoppingOptions")
@Slf4j
@RestController()
public class ShoppingOptionsController {

    @Autowired
    ProductDao productDao;

    @ApiOperation(
            value = "Fetches the Buying options",
            tags = "SHOPPING OPTIONS")
    @ApiResponses(
            value = {
                    @ApiResponse(
                            code = 200,
                            message = "Successful Response",
                            response = BuyingOption.class)
            })
    @GetMapping(value = "/buyingOptions")
    public List<BuyingOption> getBuyingOptions(
            @RequestParam(required = false) Double latitude,
            @RequestParam(required = false) Double longitude,
            @RequestParam String productId,
            @RequestParam String customerId,
            HttpServletResponse response) {
        response.setStatus(HttpStatus.OK.value());

        return productDao.getAllBuyigOptions(customerId, productId, latitude, longitude);
    }


    @ApiOperation(
            value = "Fetches the product details",
            tags = "SHOPPING OPTIONS")
    @ApiResponses(
            value = {
                    @ApiResponse(
                            code = 200,
                            message = "Successful Response",
                            response = ShoppingOption.class)
            })
    @GetMapping(value = "/product")
    public List<Product> getProductDetail(
            @RequestParam(required = false) String name,
            @RequestParam(required = false) String barcode,
            HttpServletResponse response) throws InvalidPayloadException {
        if (StringUtils.isEmpty(name) && StringUtils.isEmpty(barcode))
            throw new InvalidPayloadException("Need either name or barcode");

        response.setStatus(HttpStatus.OK.value());
        return productDao.getProductById(barcode);
    }


}

