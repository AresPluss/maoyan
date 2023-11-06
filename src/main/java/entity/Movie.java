package entity;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Timestamp;

public class Movie {
    private int id;
    private String movieName;
    private String movieImg;
    private BigDecimal price;
    private int lonTime;
    private String foreignName;
    private String leadingRoles;
    private Timestamp releaseTime;

    public int getLonTime() {
        return lonTime;
    }

    public void setLonTime(int lonTime) {
        this.lonTime = lonTime;
    }

    public String getForeignName() {
        return foreignName;
    }

    public void setForeignName(String foreignName) {
        this.foreignName = foreignName;
    }

    public String getLeadingRoles() {
        return leadingRoles;
    }

    public void setLeadingRoles(String leadingRoles) {
        this.leadingRoles = leadingRoles;
    }

    public Timestamp getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(Timestamp releaseTime) {
        this.releaseTime = releaseTime;
    }

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
