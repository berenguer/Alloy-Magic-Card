package controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class Main {
    
    public void WriteFile(String path, String content) {
        
        byte data[] = content.getBytes();

        File f = new File(path);
        try (OutputStream out = new BufferedOutputStream (new FileOutputStream(f))) {
            out.write(data, 0, data.length);
        } catch (IOException x) {
            System.err.println(x);
        }
    }

    public static void main(String[] args) {
        
        /*
        
        //System.out.println(CardParser.getEditions());
        // parse and get corresponding Card
        Card c = CardParser.parseSingleCard("Database/Humility.card");
        System.out.println(c);
        
        // display all texts from all cards
        Collections.sort(CardParser.texts);
        Iterator<String> itr = CardParser.texts.iterator();
        while (itr.hasNext()) {
            System.out.println(itr.next());
        }
        
        // display all keys which are names of the cards
        Enumeration<String> itr = CardParser.database.keys();
        while (itr.hasMoreElements()) {
            //Card c = CardParser.database.get(itr.nextElement());
            System.out.println(itr.nextElement());
            
        }
        
        */
        
        //CardParser.parseDatabase("Database");
        
        // display all types from all cards
        //System.out.println(CardParser.getTypes());
        
        //System.out.println(CardParser.database.size());
        
        
        System.out.println("Alloy me honey");

    }

}
