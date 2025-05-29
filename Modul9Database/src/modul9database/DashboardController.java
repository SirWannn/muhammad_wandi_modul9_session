/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modul9database;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.control.Button;
import javafx.event.ActionEvent;

public class DashboardController implements Initializable {

    @FXML
    private Label labelWelcome;
    @FXML
    private Button buttonLogout;

    @FXML
    private void handleButtonLogoutAction(ActionEvent event) throws Exception {
        Session.clearSession();  // clear session properties

        Main main = new Main();
        main.changeScene("Main.fxml");
    }

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        String username = (String) Session.getSessionAttribute("username");
        String password = (String) Session.getSessionAttribute("password");
        String fullname = (String) Session.getSessionAttribute("fullname");
        String role = (String) Session.getSessionAttribute("role");

        labelWelcome.setText("Selamat datang, " + fullname + " (" + role + ")"
                + "\nSession Properties Statis");
    }
}
