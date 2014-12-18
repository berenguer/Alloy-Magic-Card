package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;

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

    static ArrayList<String> editions = new ArrayList<String>();

    static ArrayList<String> texts = new ArrayList<String>();
    
    // key : name of the card, value : Card object reference
    static Hashtable<String, Card> database = new Hashtable<String, Card>();

    /**
     * Parse the database containing all cards. Each file of card is converted
     * into a Card object. All editions encountered during parsing the whole
     * database are saved. Extract all editions referenced in the database, by
     * saving the distinct "Sets" values. Each card has a filed "Sets" followed
     * by the differents editions where the card is available. Example : Sets:
     * LEG, CHR
     * 
     * @param path
     *            directory containing cards
     * @return collection of editions
     */
    public static Hashtable<String, Card> parseDatabase(String path) {

        // directory containing all .txt card files
        File directory = new File(path);
        
        // allocated memory proportional to the number of file
        if (database.isEmpty()) {
            Hashtable<String, Card> database = new Hashtable<String, Card>(
                    directory.listFiles().length);
        }

        for (File f : directory.listFiles()) {

            Card card = parseSingleCard(f.getAbsolutePath());
            database.put(card.name, card);

        } // for file

        return database;
    }

    public static Card parseSingleCard(String path) {

        Card card = new Card();

        // read card
        try (BufferedReader br = new BufferedReader(new FileReader(path))) {

            String sCurrentLine;
            while ((sCurrentLine = br.readLine()) != null) {

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
                    // extract editions by removing the "," separation and
                    // espace " " by an empty char
                    for (String edition : sCurrentLine.split("Sets: ")[1]
                            .toString().split(",")) {
                        if (!editions.contains(edition) || editions.size() == 0) {
                            editions.add(edition);
                        }
                    }
                }
                else if (sCurrentLine.startsWith("Type")) {
                    // !!! TO DO !!!
                    String[] types;
                    types = new String[2];
                    // defense
                }
                else if (sCurrentLine.startsWith("Power")) {

                    int[] power = new int[2];
                    // defense
                    power[0] = Integer
                            .parseInt(sCurrentLine.split("Power: ")[1]
                                    .toString().split("/")[0]);
                    // attack
                    power[1] = Integer
                            .parseInt(sCurrentLine.split("Power: ")[1]
                                    .toString().split("/")[1]);
                    card.setPower(power);
                }
                else if (sCurrentLine.startsWith("Sets")) {
                    card.setSets(sCurrentLine.split("Sets: ")[1].toString());
                }

                else { // else add content to card.Type attribute // !!! A
                       // TESTER !!!
                    if (card.getText() != null) {
                        card.setText(card.getText().concat(sCurrentLine));
                    } else {
                        card.setText(sCurrentLine);
                    }
                }

            } // for line

        } catch (IOException e) {
            e.printStackTrace();
        }

        return card;
    }

}
