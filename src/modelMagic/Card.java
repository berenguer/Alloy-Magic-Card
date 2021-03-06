package modelMagic;

import java.util.Collections;

public class Card {
    
    public String name;
    public String color;
    public String cost;
    public String sets;
    public String type;
    // 1. Every cards don't have power, like Enchantment, so Power is set to 0/0.
    // 2. A creature with */* in the game is represented here with -1/-1 as power.
    // [0] is power, [1] is endurence
    public int[] power = new int[2];
    public String text;
    public String toString;
    public int price = 0;

    public Card() {
        // empty
    }

    public Card(String name, String color, String cost, String m12,
            String type, int[] power, String text, int price, String toString) {
        super();
        this.name   = name;
        this.color  = color;
        this.cost   = cost;
        this.sets   = m12;
        this.type   = type;
        this.power  = power;
        this.text   = text;
        this.price = price;
        this.toString = toString;
    }

    public String getName() {
        return name;
    }

    public String getColor() {
        return color;
    }

    public String getCost() {
        return cost;
    }

    public String getSets() {
        return sets;
    }

    public String getType() {
        return type;
    }

    public int[] getPower() {
        return power;
    }

    public String getText() {
        return text;
    }
    
    public float getPrice() {
        return price;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }

    public void setSets(String sets) {
        this.sets = sets;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setPower(int[] power) {
        this.power = power;
    }

    public void setText(String text) {
        this.text = text;
    }

    public void setPrice(int price) {
        this.price = price; 
    }
    
    public void setToString(String toString) {
        this.text = text;
    }
    
    public String toString() {
        return this.name + "\n" +
        this.color + "\n" +
        this.cost + "\n" +
        this.sets + "\n" +
        this.type + "\n" +
        this.power[0] + "/" + this.power[1] + "\n" +
        this.text + "\n" +
        this.price;
        
    }
    
    public String toAlloy(String sigName) {
        if (this.color.equals("Artifact")) {
            this.color = "ArtifactColor";
        }
        
        // the price is random and should be scraped from online websites with Magic prices
        int Max = 100;
        int Min = 0;
        this.price = (int)Math.round(Math.random() * ( Max - Min ));
        String alloy = "sig " + sigName + " extends Card {} {\n"
                + "\tname = \""+ this.name.replace(" ", "") + "\"\n"
                + "\tcolor = " + this.color + "\n"
                + "\tcost = \"" + this.cost + "\"\n"
                + "\tsets = \"" + this.sets + "\"\n"
                + "\ttype = " + this.type + "\n"
                + "\tpower = " + this.power[0] + "\n"
                + "\tendurence = " + this.power[1] + "\n"
                + "\ttext = \"" + this.text.replace("\"", "'") + "\"\n"
                + "\tprice = " + this.price + "\n"
                + "}";

        return alloy;

    }
    
}
