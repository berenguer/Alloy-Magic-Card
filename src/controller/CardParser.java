package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;


/**
 * Parse Magic Card and transform into object, or return informations about the database.
 * 
 * @author BERENGUER
 * 
 * Based on the structure of Magic Card available in the database.
 * File structure, example :
 * ---------------------
 * Name: Arcades Sabboth
 * Color: Gold
 * Cost: 2GGWWUU
 * Sets: LEG, CHR
 * Type: Legendary Creature — Elder Dragon
 * Power: 7/7
 * Text: Flying
 * At the beginning of your upkeep, sacrifice Arcades Sabboth unless you pay {G}{W}{U}.
 * Each untapped creature you control gets +0/+2 as long as it's not attacking.
 * {W}: Arcades Sabboth gets +0/+1 until end of turn.
 * ---------------------
 *
 */
public class CardParser {

    /**
     * Extract all editions referenced in the database. Every cards are parsed.
     * Each card has a filed "Sets" followed by the differents editions where the card is available.
     * Example :
     * Sets: LEG, CHR
     * @param path directory containing cards
     * @return collection of editions
     */
    public static ArrayList<String> parseEditions(String path) {
        ArrayList<String> editions = new ArrayList<String>();
        
        // contains all the .txt card files
        File directory = new File(path);

        for (File f : directory.listFiles()) {
            
            // read card
            try (BufferedReader br = new BufferedReader(new FileReader(f.getAbsolutePath()))) {

                String sCurrentLine;
                while ((sCurrentLine = br.readLine()) != null) {

                    // editions are located after the "Sets" tag
                    if (sCurrentLine.startsWith("Sets")) {
                        
                        // extract all the editions by removing the "," separation and escape space " " by an empty char
                        for (String edition : sCurrentLine.split("Sets: ")[1].toString().split(",")) {
                            if (!editions.contains(edition)) {
                                editions.add(edition);
                            }
                            
                        } // for edtion
                    }
                } // for line

            } catch (IOException e) {
                e.printStackTrace();
            }
        } // for file

        return editions;
    }

    /**
     * Parse the file .txt which comes from the Magic Card database, and convert it to a Card object.
     * @param path filepath
     * @return Card with attributes extract from the database
     */
    public static Card parse(String path) {

        Card card = new Card();

        // save lines and set at the end the value of attribute Card.toString
        String cardToString = "";

        try (BufferedReader br = new BufferedReader(new FileReader(path))) {
            String sCurrentLine;
            while ((sCurrentLine = br.readLine()) != null) {
                System.out.println(sCurrentLine);

                cardToString = cardToString.concat(sCurrentLine + "\n");

                if (sCurrentLine.startsWith("Name")) {
                    // extract value
                    card.setName(sCurrentLine.split("Name: ")[1].toString());
                } else if (sCurrentLine.startsWith("Color")) {
                    card.setColor(sCurrentLine.split("Color: ")[1].toString());
                } else if (sCurrentLine.startsWith("Cost")) {
                    card.setCost(sCurrentLine.split("Cost: ")[1].toString());
                } else if (sCurrentLine.startsWith("Sets")) {
                    card.setSets(sCurrentLine.split("Sets: ")[1].toString());
                } else if (sCurrentLine.startsWith("Type")) {
                    // !!! TO DO !!!
                    String[] types;
                    types = new String[2];
                    // defense
                } else if (sCurrentLine.startsWith("Power")) {
                    int[] powerValue;
                    powerValue = new int[2];
                    // defense
                    powerValue[0] = Integer.parseInt(sCurrentLine
                            .split("Power: ")[1].toString().split("/")[0]);
                    // attack
                    powerValue[1] = Integer.parseInt(sCurrentLine
                            .split("Power: ")[1].toString().split("/")[1]);
                }
                // else add content to card.Type attribute
                else { // !!! A TESTER !!!
                    if (card.getText() != null) {
                        card.setText(card.getText().concat(sCurrentLine));
                    } else {
                        card.setText(sCurrentLine);
                    }
                    System.out.println("TEEEEXT " + card.getText());
                }

                System.out.println("______________________________________");
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return card;
    }

}
