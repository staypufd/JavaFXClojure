/*
 * Main.fx
 *
 * Created on Jun 26, 2009, 11:36:24 PM
 */

package testfx;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.text.Text;
import javafx.scene.text.Font;
import clojureGlue.TestJavaClass;
import javafx.scene.control.Button;
import javafx.scene.control.TextBox;
import javafx.scene.layout.VBox;
import java.lang.Integer;
import javafx.scene.control.Slider;

/**
 * @author Sam Griffith Jr
 */
var tjcResult;
var result:Number;
var tjc = new TestJavaClass();
var mySlider;

mySlider = Slider {
                    min: 1
                    max: 100
                    vertical: false
                    value: bind result  with inverse
                    translateX: 10
                    };

Stage {
    title: "Application title"
    width: 250
    height: 80 
    scene: Scene {
        content: 
            VBox { content: [

                    mySlider,
                    Button {
                        text: "Button"
                        action: function() {
                            tjcResult = tjc.putMsgToConsole("foobar");
                            result = java.lang.Integer.parseInt(tjcResult);
                        }
                    },
                     
                    TextBox {
                            text: bind mySlider.value.toString()
                            translateX: bind result
                            translateY: 5
                            columns: 12
                            selectOnFocus: true
                     }
                    ]
                  }
    }
}