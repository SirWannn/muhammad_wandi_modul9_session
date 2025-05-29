package modul9file;

import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.control.Button;
import javafx.event.ActionEvent;
import java.net.URL;
import java.util.ResourceBundle;

public class DashboardController implements Initializable {

    @FXML private Label labelWelcome;
    @FXML private Button buttonLogout;

    @FXML
    private void handleButtonLogoutAction(ActionEvent event) throws Exception {
        // Hapus session
        Session.clearSession();

        // Kembali ke halaman login
        Main main = new Main();
        main.changeScene("Main.fxml");
    }

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // Ambil data user dari file session
        String username = (String) Session.getAttribute("username");
        String password = (String) Session.getAttribute("password");
        String fullname = (String) Session.getAttribute("fullname");
        String role = (String) Session.getAttribute("role");

        if (fullname != null && role != null) {
            labelWelcome.setText("Selamat datang, " + fullname + " (" + role + ")\nSession File System");
        } else {
            labelWelcome.setText("Data session tidak ditemukan.");
        }
    }
}
