package controller;


public class Main {

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
        
        CardParser.parseDatabase("Database");
        
        // display all types from all cards
        //System.out.println(CardParser.getTypes());
        
        System.out.println(CardParser.database.size());
        
        System.out.println("Alloy me honey");

    }

}
