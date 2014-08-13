/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

/**
 *
 * @author ducfpt
 */
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;

public class OtherDAO {

    private static final Set<String> generatedNumbers = new HashSet<String>();

    public OtherDAO() {
    }

    public static void main(String[] args) {
        final int maxLength = 7;
        final int maxTry = 10;

//         OtherDAO.makeRandomString(maxLength, maxTry));
    }

    public String makeRandomString(final int maxLength, final int maxTry) {
        final Random random = new Random(System.nanoTime());
        final int max = (int) Math.pow(10, maxLength);
        final int maxMin = (int) Math.pow(10, maxLength - 1);
        int i = 0;
        boolean unique = false;
        int randomId = -1;
        while (i < maxTry) {
            randomId = random.nextInt(max - maxMin - 1) + maxMin;

            synchronized (generatedNumbers) {
                if (generatedNumbers.contains(randomId) == false) {
                    unique = true;
                    break;
                }
            }
            i++;
        }
        if (unique == false) {
            throw new RuntimeException("Cannot generate unique id!");
        }

        synchronized (generatedNumbers) {
            generatedNumbers.add(String.valueOf(randomId));
        }

        return String.valueOf(randomId);
    }
    
    public String getMd5FromString(String input) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] messageDigest = md.digest(input.getBytes());
        BigInteger number = new BigInteger(1, messageDigest);
        String hashtext = number.toString(16);
        while (hashtext.length() < 32) {
            hashtext = "0" + hashtext;
        }
        return hashtext;
    }

    public String formatDate(String datetime) throws ParseException {

        // *** note that it's "yyyy-MM-dd hh:mm:ss" not "yyyy-mm-dd hh:mm:ss"  
        SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Date date = dt.parse(datetime);

        // *** same for the format String below
        SimpleDateFormat dt1 = new SimpleDateFormat("MMMMM dd, yyyy");
        return dt1.format(date);
    }
    
    public String getEncryptedPassword(String rawPassword, String salt) throws NoSuchAlgorithmException{
        String step1 = this.getMd5FromString(rawPassword);
        String step2 = step1 + salt;
        String encryptedPassword = this.getMd5FromString(step2);
        return encryptedPassword;
    }
}
