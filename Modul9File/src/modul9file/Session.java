/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modul9file;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author MyBook Hype AMD
 */
public class Session {

    private static final String SESSION_FILE = "session.properties";
    private static Properties sessionData = new Properties();

    public static void setAttribute(String key, String value) {
        sessionData.setProperty(key, value);
        saveSessionToFile();
    }

    public static String getAttribute(String key) {
        loadSessionFromFile();
        return sessionData.getProperty(key);
    }

    public static void removeAttribute(String key) {
        sessionData.remove(key);
        saveSessionToFile();
    }

    public static void clearSession() {
        sessionData.clear();
        saveSessionToFile();
    }

    private static void saveSessionToFile() {
        try (FileOutputStream output = new FileOutputStream(SESSION_FILE)) {
            sessionData.store(output, "Session Data");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
        
    private static void loadSessionFromFile() {
        try (FileInputStream input = new FileInputStream(SESSION_FILE)) {
            sessionData.load(input);
        } catch (IOException e) {

        }
    }

}
