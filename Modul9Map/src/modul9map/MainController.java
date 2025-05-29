/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/javafx/FXML2.java to edit this template
 */
package modul9map;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;

/**
 *
 * @author MyBook Hype AMD
 */
public class MainController implements Initializable {

    @FXML
    private TextField txtusername;
    @FXML
    private PasswordField txtpassword;
    @FXML
    private Button btnlogin;

    @FXML
    private void handleButtonLoginAction(ActionEvent event) throws Exception {
        checkLogin();
    }
    
    private void checkLogin() throws Exception {
        String username = txtusername.getText().trim();
        String password = txtpassword.getText().trim();

        if (username.isEmpty() && password.isEmpty()) {
            showAlert("Login Error", "Isi USername dan Password yang Benar!");
            return;
        }
        try {
            User user = UserDAO.getAccount(username, password);

            if (user != null) {
                // Set session properties statis
                Session.setAttribute("username", user.getUsername());
                Session.setAttribute("password", user.getPassword());
                Session.setAttribute("fullname", user.getFullname());
                Session.setAttribute("role", user.getRole());


                showInfo("Login Success", "Login berhasil, Session map disimpan");

                Main main = new Main();
                main.changeScene("Dashboard.fxml");
            } else {
                showAlert("Login Error", "Username atau Password Salah !");
            }

        } catch (Exception e) {
            e.printStackTrace();
            showAlert("Login Error", "Username atau Password Salah !");
        }
    }


    private void showAlert(String title, String message) {
        Alert alert = new Alert(Alert.AlertType.ERROR);
        alert.setTitle(title);
        alert.setContentText(message);
        alert.setHeaderText(null);
        alert.showAndWait();
    }

    private void showInfo(String title, String message) {
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle(title);
        alert.setContentText(message);
        alert.setHeaderText(null);
        alert.showAndWait();
    }

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }
}
