package controller;

import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;

public class Main {

    public static void main(String[] args) {
        
        CardParser.parseDatabase("mini-db");
        System.out.println(CardParser.parseSingleCard("mini-db/Arachnus Spinner.card").toString());
        System.out.println(CardParser.editions.size());
        
        // display all names of cards
        Enumeration<String> itr = CardParser.database.keys();
        while (itr.hasMoreElements()) {
            System.out.println(itr.nextElement().toString());
        }
        
        System.out.println("Alloy me honey");

    }

}
