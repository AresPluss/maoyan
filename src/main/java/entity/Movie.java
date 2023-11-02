package entity;

import java.math.BigDecimal;
import java.math.RoundingMode;

public class Movie {
    private int id;
    private String movieName;
    private String movieImg;
    private BigDecimal price;

    public BigDecimal discountPrice(double discount){
        BigDecimal disc = new BigDecimal(discount);
        return this.price.multiply(disc).setScale(2, RoundingMode.HALF_UP);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public String getMovieImg() {
        return movieImg;
    }

    public void setMovieImg(String movieImg) {
        this.movieImg = movieImg;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}
