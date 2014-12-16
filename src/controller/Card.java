package controller;

// todo ameliorer l'attribut cost
public class Card {
    
    final private String name;
    final private String color;
    final private String cost;
    final private String M12;
    final private String[] type;
    final private int[] power;
    final private String text;

    public Card(String name, String color, String cost, String m12,
            String[] type, int[] power, String text) {
        super();
        this.name = name;
        this.color = color;
        this.cost = cost;
        M12 = m12;
        this.type = type;
        this.power = power;
        this.text = text;
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
        return M12;
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
    
}
