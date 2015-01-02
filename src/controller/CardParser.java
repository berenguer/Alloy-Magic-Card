package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Hashtable;
import java.util.Iterator;

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
    
    static private ArrayList<String> colors = new ArrayList<String>();
    
    static private ArrayList<String> costs = new ArrayList<String>();

    static private ArrayList<String> editions = new ArrayList<String>();
    
    static private ArrayList<String> types = new ArrayList<String>();

    static ArrayList<String> texts = new ArrayList<String>();
    
    // KEY : name of the card
    // VALUE : Card object reference
    static ArrayList<Card> database = new ArrayList<Card>();
    
    /**
     * Get all editions encountered during previous parsing.
     * Remove same values, and sort alphabeticaly editions.
     * @return Magic Card editions encountered
     */
    static public ArrayList<String> getEditions() {
        ArrayList<String> editionsWithoutDuplicates = new ArrayList<String>(); 
        
        for (int i = 0; i < editions.size(); i++) {
            if (!editionsWithoutDuplicates.contains(editions.get(i))) {
                editionsWithoutDuplicates.add(editions.get(i));
            }
        }
        
        Collections.sort(editionsWithoutDuplicates);
        
        editions = editionsWithoutDuplicates;
        
        return editions;
    }
    
    /**
     * Get all types encountered during previous parsing.
     * Remove same values, and sort alphabeticaly types.
     * @return Magic Card types encountered
     */
    static public ArrayList<String> getTypes() {
        ArrayList<String> typesWithoutDuplicates = new ArrayList<String>(); 
        
        for (int i = 0; i < types.size(); i++) {
            if (!typesWithoutDuplicates.contains(types.get(i))) {
                typesWithoutDuplicates.add(types.get(i));
            }
        }
        
        Collections.sort(typesWithoutDuplicates);
        
        types = typesWithoutDuplicates;
        
        return types;
    }
    
    /**
     * Get all texts encountered during previous parsing.
     * Remove same values, and sort alphabeticaly texts.
     * @return Magic Card texts encountered
     */
    static public ArrayList<String> getTexts() {
        ArrayList<String> textsWithoutDuplicates = new ArrayList<String>(); 
        
        for (int i = 0; i < texts.size(); i++) {
            if (!textsWithoutDuplicates.contains(texts.get(i))) {
                textsWithoutDuplicates.add(texts.get(i));
            }
        }
        
        Collections.sort(textsWithoutDuplicates);
        
        texts = textsWithoutDuplicates;
        
        return texts;
    }
    
    /**
     * Get all colors encountered during previous parsing.
     * Remove same values, and sort alphabeticaly colors.
     * @return Magic Card colors encountered
     */
    static public ArrayList<String> getColors() {
        ArrayList<String> colorsWithoutDuplicates = new ArrayList<String>(); 
        
        for (int i = 0; i < colors.size(); i++) {
            if (!colorsWithoutDuplicates.contains(colors.get(i))) {
                colorsWithoutDuplicates.add(colors.get(i));
            }
        }
        
        Collections.sort(colorsWithoutDuplicates);
        
        colors = colorsWithoutDuplicates;
        
        return colors;
    }
    
    /**
     * Get all costs encountered during previous parsing.
     * Remove same values, and sort alphabeticaly cost.
     * @return Magic Card cost encountered
     */
    static public ArrayList<String> getCosts() {
        ArrayList<String> costsWithoutDuplicates = new ArrayList<String>(); 
        
        for (int i = 0; i < costs.size(); i++) {
            if (!costsWithoutDuplicates.contains(costs.get(i))) {
                costsWithoutDuplicates.add(costs.get(i));
            }
        }
        
        Collections.sort(costsWithoutDuplicates);
        
        costs = costsWithoutDuplicates;
        
        return costs;
    }

    /**
     * Parse the database containing all the cards text and convert card to the corresponding Card object.
     * All editions encountered during parsing are saved in a collection named "editions".
     * Each edition is accessible into the card text.
     * Example : "Sets: LEG, CHR" means the card is available in the LEG, and also CHR editions.
     * 
     * @param path directory containing cards
     * @return hashtable with the cardname as key, and the corresonding Card object as value
     */
    public static ArrayList<Card> parseDatabase(String path) {

        // directory containing all .txt card files
        File directory = new File(path);
        
        // allocated memory proportional to the number of file
        if (database.isEmpty()) {
            Hashtable<String, Card> database = new Hashtable<String, Card>(
                    directory.listFiles().length);
        }

        // parse files
        for (File f : directory.listFiles()) {
            Card card = parseSingleCard(f.getAbsolutePath());
            database.add(card);
        }

        Collections.sort(texts);
        return database;
    }

    /**
     * Convert a card text file to a Card object.
     * @param path origin
     * @return Card
     */
    public static Card parseSingleCard(String path) {

        Card card = new Card();
        
        // read card
        try (BufferedReader br = new BufferedReader(new FileReader(path))) {
            
            String sCurrentLine;
            
            while ((sCurrentLine = br.readLine()) != null) {
                if (sCurrentLine.startsWith("Name: ")) {
                    // extract value
                    card.setName(sCurrentLine.split("Name: ")[1].toString());
                }
                else if (sCurrentLine.startsWith("Color: ")) {
                    card.setColor(sCurrentLine.split("Color: ")[1].toString());
                    colors.add(sCurrentLine.split("Color: ")[1].toString());
                }
                else if (sCurrentLine.startsWith("Cost")) {
                    card.setCost(sCurrentLine.split("Cost: ")[1].toString());
                    costs.add(sCurrentLine.split("Cost: ")[1].toString());
                }
                else if (sCurrentLine.startsWith("Sets: ")) {
                    card.setSets(sCurrentLine.split("Sets: ")[1].toString());
                    // extract editions by removing the "," separation and
                    // espace " " by an empty char
                    for (String edition : sCurrentLine.split("Sets: ")[1]
                            .toString().split(",")) {
                        editions.add(edition);
                    }
                }
                else if (sCurrentLine.startsWith("Type: ")) {
                    // get only first type
                    card.setType(sCurrentLine.substring(6).split(" ")[0]);
                    types.add(sCurrentLine.substring(6).split(" ")[0]);           
                }
                else if (sCurrentLine.startsWith("Power: ")) {
                    int[] power = new int[2];
                    try {
                        // defense
                        power[0] = Integer
                                .parseInt(sCurrentLine.split("Power: ")[1]
                                        .toString().split("/")[0]);
                        // attack
                        power[1] = Integer
                                .parseInt(sCurrentLine.split("Power: ")[1]
                                        .toString().split("/")[1]);
                        card.setPower(power);
                    } catch (NumberFormatException e) {
                        power = new int[2];
                        power[0] = -1;
                        power[1] = -1;
                        card.setPower(power);
                    }
                }
                else if (sCurrentLine.startsWith("Sets: ")) {
                    card.setSets(sCurrentLine.split("Sets: ")[1].toString());
                }

                else {
                    if (card.getText() != null) {
                        texts.add(sCurrentLine);
                        card.setText(card.getText().concat(sCurrentLine));
                    }
                    else if (sCurrentLine.startsWith("Text")){
                        String[] content = sCurrentLine.split("Text: ");
                        if (content.length >= 1) {
                            texts.add(content[1].toString());
                            card.setText(content[1].toString());
                        }
                       
                    }
                    
                }

            } // for line

        } catch (IOException e) {
            e.printStackTrace();
        }
        
        return card;
    }

}
