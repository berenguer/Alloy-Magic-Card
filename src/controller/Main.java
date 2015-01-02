package controller;

import java.io.FileWriter;
import java.io.IOException;


public class Main {
    
    public static String sigDeck = "sig Deck {\n"
            + "\tcards: some Card\n"
            + "}\n";
    
    public static String sigCard = "abstract sig Card {\n"
            + "\tname: String,\n"
            + "\tcolor: Color,\n"
            + "\tcost: String,\n"
            + "\tSets: String,\n"
            + "\ttype: Type,\n"
            + "\tpower: lone Int,\n"
            + "\tendurence: lone Int,\n"
            + "\ttext: String,\n"
            + "\tprice: Int\n"
            + "}";
    
    public static String sigTypes = "// ------------- types ----------------\n"
            + "abstract sig Type {}\n"
            + "one sig Artifact, Basic, Creature, Eaturecray, Enchant, Enchantment, Instant, Interrupt, Land, Legendary, Planeswalker, Scariest, Snow, Sorcery, Summon, Tribal, World extends Type {}";
    
    
    public static String sigColors = "// ------------ colors ----------------\n"
            + "abstract sig Color {}\n"
            + "one sig ArtifactColor, Black, Blue, Colorless, Gold, Green, Red, White extends Color {}";


    public static void main(String[] args) {
        
        /*
        // ------------ UNCOMMENT NEXT LINES FOR A SPECIFIC ACTION ------------
        // ----> parse all the database
        //CardParser.parseDatabase("Database");
        
        // ----> parse and get a single Card
        Card c = CardParser.parseSingleCard("Database/Humility.card");
        System.out.println(c);
        
        // ----> display all types of cards encountered during parsing
        //System.out.println(CardParser.getEditions());
        
        // ----> display all types from all cards
        //System.out.println(CardParser.getColors());
        
        //----> display all costs, editions, types, texts
        //System.out.println(CardParser.getCosts());

        //System.out.println(CardParser.getEditions());
            
        //System.out.println(CardParser.getTypes());   
  
        //System.out.println(CardParser.getTexts());
            
        */
        
        CardParser.parseDatabase("Database/");
        
        // ---> write all card into a file, with the Alloy format
        try
        {
            String filename = "alloy-models/database-generated.als";
            FileWriter fw = new FileWriter(filename,true); //the true will append the new data
            /*
            fw.write(sigDeck + "\n"
                    + sigCard + "\n"
                    + sigTypes + "\n"
                    + sigColors + "\n");
            */
            int cardNumber = 0;
            for (int i = 0; i < CardParser.database.size(); i++) {
                
                fw.write(CardParser.database.get(i).toAlloy("Card" + String.valueOf(cardNumber)).concat("\n"));
                cardNumber ++;
            }

            fw.close();
        }
        catch(IOException ioe)
        {
            System.err.println("IOException: " + ioe.getMessage());
        }
        
        System.out.println("--> end <--");

    }

}
