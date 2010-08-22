/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package clojureGlue;

import clojure.lang.RT;
import clojure.lang.Var;

/**
 *
 * @author samjr
 */
public class TestJavaClass {

    private int currentCount = 0;
    
    public TestJavaClass() {

        try {
            // Java calling code
            RT.loadResourceScript("printer.clj");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String putMsgToConsole(String msg) 
    {
        Object result = null;
        try {
            currentCount = currentCount + 1;
            System.out.println("CurrentCount is: " + currentCount);
            // Java calling code
            // Only load it up one time when the class was loaded
            // RT.loadResourceScript("printer.clj");
            result = RT.var("printer", "print-string").invoke("" + currentCount);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return (String) result;
    }
}
