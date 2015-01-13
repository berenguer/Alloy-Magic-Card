package alloy;

import edu.mit.csail.sdg.alloy4.Err;
import edu.mit.csail.sdg.alloy4compiler.ast.Command;
import edu.mit.csail.sdg.alloy4compiler.parser.CompModule;
import edu.mit.csail.sdg.alloy4compiler.parser.CompUtil;
import edu.mit.csail.sdg.alloy4compiler.translator.A4Options;
import edu.mit.csail.sdg.alloy4compiler.translator.A4Solution;
import edu.mit.csail.sdg.alloy4compiler.translator.TranslateAlloyToKodkod;

/**
 * Executor Alloy with Chaste copyrights.
 * The Chastor.
 * @author berenguer
 *
 */
public class Chastor {
    
    public static void run(String path) {
        CompModule model;
        try {
            model = CompUtil.parseEverything_fromFile(null, null, path);
            // Get the command to execute. for example :
            Command cmd = model.getAllCommands().get(0);
            System.out.println(cmd);        
            // Execute the model using the command obtained in step 2
            A4Solution solution;
            solution= TranslateAlloyToKodkod.execute_command(null,
                    model.getAllReachableSigs(), cmd, new A4Options());
            while(solution.satisfiable()){
                solution=solution.next();
                System.out.println(solution);
            }
        } catch (Err e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
    }
     

}
