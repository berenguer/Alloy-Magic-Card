package alloy;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

import modelMagic.Card;
import modelMagic.CardParser;

import edu.mit.csail.sdg.alloy4.ConstList;
import edu.mit.csail.sdg.alloy4.Err;
import edu.mit.csail.sdg.alloy4.SafeList;
import edu.mit.csail.sdg.alloy4compiler.ast.Attr;
import edu.mit.csail.sdg.alloy4compiler.ast.Command;
import edu.mit.csail.sdg.alloy4compiler.ast.Decl;
import edu.mit.csail.sdg.alloy4compiler.ast.Sig;
import edu.mit.csail.sdg.alloy4compiler.ast.Sig.Field;
import edu.mit.csail.sdg.alloy4compiler.parser.CompModule;
import edu.mit.csail.sdg.alloy4compiler.parser.CompUtil;
import edu.mit.csail.sdg.alloy4compiler.translator.A4Options;
import edu.mit.csail.sdg.alloy4compiler.translator.A4Solution;
import edu.mit.csail.sdg.alloy4compiler.translator.TranslateAlloyToKodkod;

/**
 * Executor Alloy with Chaste copyrights. The Chastor.
 * 
 * @author berenguer
 * 
 */
public class Chastor {
	/**
	 * On lance nos test de vérification alloy
	 * @param path
	 * @throws IOException 
	 * @throws FileNotFoundException 
	 */
	public static void run(String path) throws FileNotFoundException, IOException {
		CompModule model;
		String allDeckPrice;
		String allCardForDeck;
		int prixDeck1=0;
		int prixDeck2=0;

		
	
		try {
			model = CompUtil.parseEverything_fromFile(null, null, path);
			// Get the command to execute. for example :
			Command cmd = model.getAllCommands().get(0);
			System.out.println(cmd);
			// Execute the model using the command obtained in step 2
			A4Solution solution;
			solution = TranslateAlloyToKodkod.execute_command(null,
					model.getAllReachableSigs(), cmd, new A4Options());
			while (solution.satisfiable()) {
				
				System.out.println("===============SOLUTION===============");
				prixDeck1=0;
				prixDeck2=0;
				solution = solution.next();
				allDeckPrice=getDecksPrice(solution);
				allCardForDeck=getDecksCardsNames(solution);
				//System.out.println(allDeckPrice+""+allCardForDeck);
				System.out.println("VERIFIONS SI LE PRIX DES DECKS EST IDENTIQUE");
				System.out.println(verifySamePriceForTwoDeck(allDeckPrice));//on vérifie si les deux deck on le meme prix
				String[] allCardSeparate = allCardForDeck.split(",");//on split chaque carte
				for(int i=0;i<allCardSeparate.length;i++)
				{
					String numeroDeck=allCardSeparate[i].substring(allCardSeparate[i].indexOf("$")+1,allCardSeparate[i].indexOf("-"));
					String notreCarte=allCardSeparate[i].substring(allCardSeparate[i].indexOf(">")+1,allCardSeparate[i].lastIndexOf("$"));
					notreCarte=notreCarte.substring(notreCarte.indexOf("/")+1);
					if(numeroDeck.equals("0"))
					{
						//alors c'est au premier deck
						
						prixDeck1=prixDeck1+getCardPrice(notreCarte,"alloy-models/database_mini_generated.als");
						
					}
					else
					{
						//c'est dans le deuxieme
						prixDeck2=prixDeck2+getCardPrice(notreCarte,"alloy-models/database_mini_generated.als");
					}
				}
				System.out.println("VERIFIONS l'EGALITE DES PRIX");
				if(prixDeck2==0)
				{
					System.out.println("True car 1 seul deck");
				}
				else
				{
					if(prixDeck1==prixDeck2)
					{
						System.out.println("True");
					}
					else
					{
						System.out.println("False");
					}
				}
			System.out.println();
			System.out.println();
			System.out.println();
			
			}
		} catch (Err e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}
/**
 * renvoie le prix des 2 decks
 * @param solution
 * @return
 */
	public static String getDecksPrice(A4Solution solution) {
		String retour = "";
		SafeList<Sig> allAtom = solution.getAllReachableSigs();
		for (int i = 0; i < allAtom.size(); i++) {

			//System.out.println(allAtom.get(i)+" EVAL ==>"+solution.eval(allAtom.get(i)));
			if (allAtom.get(i).toString().equals("this/Deck")) {
				// alors pour chaque field on va chercher la valeur
				SafeList<Field> fields = allAtom.get(i).getFields();

				for (int j = 0; j < fields.size(); j++) {
					if (fields.get(j).toString()
							.equals("field (this/Deck <: deckValue)")) {
						retour = solution.eval(fields.get(j)).toString();

					}
				}
			}

		}
		return retour;
	}
	
	/**
	 * renvoie le nom des cartes pour l'ensemble des decks
	 * @param solution
	 * @return 
	 */
	public static String getDecksCardsNames(A4Solution solution) {
		String retour = "";
		SafeList<Sig> allAtom = solution.getAllReachableSigs();
		for (int i = 0; i < allAtom.size(); i++) {

			 
			if (allAtom.get(i).toString().equals("this/Deck")) {
				// alors pour chaque field on va chercher la valeur
				SafeList<Field> fields = allAtom.get(i).getFields();

				for (int j = 0; j < fields.size(); j++) {
					if (fields.get(j).toString()
							.equals("field (this/Deck <: cards)")) {
						retour = solution.eval(fields.get(j)).toString();
						
					}
				}
			}

		}
		return retour;
	}

	/**
	 * Renvoie le prix de la carte passé en paramétre
	 * @param nomCarte 
	 * @param path : le chemin vers la BD utilisé 
	 * @return
	 * @throws IOException 
	 * @throws FileNotFoundException 
	 */
	public static int getCardPrice(String nomCarte,String path) throws FileNotFoundException, IOException
	{	int retour =0;
		
		
	    try (BufferedReader br = new BufferedReader(new FileReader(path))) {
	    	String sCurrentLine;
	    	while ((sCurrentLine = br.readLine()) != null) {
	    		if(sCurrentLine.contains(nomCarte))
	    		{
	    			//on a trouvé le Sig de notre Carte
	    			while (!(sCurrentLine = br.readLine()).contains("price")) {
	    				//on cherche le prix
	    				
	    			}
	    			String prixT=sCurrentLine.substring(sCurrentLine.indexOf("=")+1).trim();
	    			//System.out.println(prixT);
	    			return Integer.parseInt(prixT);
	    				    		}
	    		
	    	}
	    	
	    }
		
		return retour;
	}
	/**
	 * On verifie que les deck on le meme prix
	 * @param allDeckPrice le string contenant le prix des decks 
	 * @return vraie si prix identique
	 */
	public static boolean verifySamePriceForTwoDeck(String allDeckPrice)
	{
		boolean retour=true;
		ArrayList<String> price=new ArrayList<String>();
		String[] decks=allDeckPrice.split(",");
		if(decks.length==1)
		{
			
			retour =true;//si il y'a qu'un deck alors il sont forcement identique
		}
		else
		{
			for(int i=0;i<decks.length;i++)
			{
				
				String[] priceT=decks[i].split("->");
				if(priceT[1].indexOf("}")==-1)
				{
					price.add(priceT[1].trim());
				}
				else
				{
					
					price.add(priceT[1].substring(0,priceT[1].indexOf("}")).trim());
					
				}
			}
		}
		for(int j=0;j<price.size()-1;j++)
		{
			
			if(!price.get(j).equals(price.get(j+1)))
			{
				retour = false;
			}
		}
	return retour;	
	}
	
	
}

