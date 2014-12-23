package controller;

import java.util.Collections;

public class Card {
    
    public String name;
    public String color;
    public String cost;
    public String sets;
    public String[] types;
    // 1. Every cards don't have power, like Enchantment, so Power is set to 0/0.
    // 2. A creature with */* in the game is represented is here with -1/-1 as power.
    public int[] power = new int[2];
    public String text;
    public String toString;
    
    public Card() {
        // empty
    }

    public Card(String name, String color, String cost, String m12,
            String[] type, int[] power, String text, String toString) {
        super();
        this.name   = name;
        this.color  = color;
        this.cost   = cost;
        this.sets   = m12;
        this.types   = type;
        this.power  = power;
        this.text   = text;
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

    public String[] getType() {
        return types;
    }

    public int[] getPower() {
        return power;
    }

    public String getText() {
        return text;
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

    public void setType(String[] type) {
        this.types = type;
    }

    public void setPower(int[] power) {
        this.power = power;
    }

    public void setText(String text) {
        this.text = text;
    }
    
    public void setToString(String toString) {
        this.text = text;
    }
    
    public String toString() {
        String typesString = "|";
        for (int i = 0; i < this.types.length; i++) {
            typesString += this.types[i]+"|";
        }
        return this.name + "\n" +
        this.color + "\n" +
        this.cost + "\n" +
        this.sets + "\n" +
        typesString + "\n" +
        this.power[0] + "/" + this.power[1] + "\n" +
        this.text;
    }
    
}
