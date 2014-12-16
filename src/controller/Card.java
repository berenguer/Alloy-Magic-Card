package controller;

// todo improve cost attribute (ex 2GGWWUU..? WTF)
public class Card {
    
    public String name;
    public String color;
    public String cost;
    public String sets;
    public String[] type;
    public int[] power;
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
        this.type   = type;
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

    public void setSets(String sets) {
        this.sets = sets;
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
    
    public void setToString(String toString) {
        this.text = text;
    }
    
    public String toString() {
        return toString;
    }
    
}
