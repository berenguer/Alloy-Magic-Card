package controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class CardParser {

    public static Card parse(String path) {
        
        Card card = new Card();
        
        // save lines and set at the end the value of attribute Card.toString
        String cardToString = "";

        try (BufferedReader br = new BufferedReader(new FileReader(path))) {
            String sCurrentLine;
            while ((sCurrentLine = br.readLine()) != null) {
                System.out.println(sCurrentLine);
                
                cardToString = cardToString.concat(sCurrentLine+"\n");
                
                if (sCurrentLine.startsWith("Name")) {
                    // extract value 
                    card.setName(sCurrentLine.split("Name: ")[1].toString());                
                } 
                else if (sCurrentLine.startsWith("Color")) {
                    card.setColor(sCurrentLine.split("Color: ")[1].toString());
                } 
                else if (sCurrentLine.startsWith("Cost")) {
                    card.setCost(sCurrentLine.split("Cost: ")[1].toString());
                } 
                else if (sCurrentLine.startsWith("Sets")) {
                    card.setSets(sCurrentLine.split("Sets: ")[1].toString());
                } 
                else if (sCurrentLine.startsWith("Type")) {
                    // !!! TO DO !!!
                    String[] types;
                    types = new String[2];
                    // defense
                }
                else if (sCurrentLine.startsWith("Power")) {
                    int[] powerValue;
                    powerValue = new int[2];
                    // defense
                    powerValue[0] = Integer.parseInt(sCurrentLine.split("Power: ")[1].toString().split("/")[0]);
                    // attack
                    powerValue[1] = Integer.parseInt(sCurrentLine.split("Power: ")[1].toString().split("/")[1]);
                }
                // else add content to card.Type attribute
                else { // !!! A TESTER !!!
                    if (card.getText() != null) {
                        card.setText(card.getText().concat(sCurrentLine));
                    }
                    else { card.setText(sCurrentLine);}
                    System.out.println("TEEEEXT "+card.getText());
                }
                
                System.out.println("______________________________________");
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return card;
    }

}
