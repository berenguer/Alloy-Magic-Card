package controller;

// todo ameliorer l'attribut cost
public class Card {
    
    public String name;
    public String color;
    public String cost;
    public String sets;
    public String[] type;
    public int[] power;
    public String text;
    
    public Card() {
        // empty
    }

    public Card(String name, String color, String cost, String m12,
            String[] type, int[] power, String text) {
        super();
        this.name   = name;
        this.color  = color;
        this.cost   = cost;
        this.sets    = m12;
        this.type   = type;
        this.power  = power;
        this.text   = text;
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

    public String getM12() {
        return sets;
    }

    public String[] getType() {
        return type;
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

    public void setM12(String m12) {
        sets = m12;
    }

    public void setType(String[] type) {
        this.type = type;
    }

    public void setPower(int[] power) {
        this.power = power;
    }

    public void setText(String text) {
        this.text = text;
    }
    
}
