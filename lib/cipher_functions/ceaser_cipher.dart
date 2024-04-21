class CeaserCipher {
  List<String> cipherTexts = ['Rnsfyzx', 'Cdqtufwfqdxnx', 'Jswxytqjsy'];

  String decryptCaesar(String cipherText, int shift) {
    String result = "";
    for (int i = 0; i < cipherText.length; i++) {
      int charCode = cipherText.codeUnitAt(i);
      if (charCode >= 65 && charCode <= 90) {
        // Uppercase letter
        charCode = (charCode - shift - 65) % 26 + 65;
      } else if (charCode >= 97 && charCode <= 122) {
        // Lowercase letter
        charCode = (charCode - shift - 97) % 26 + 97;
      }
      result += String.fromCharCode(charCode);
    }
    return result;
  }

  String encryptCaesarCipher(String plainText, int shift) {
    String result = "";
    for (int i = 0; i < plainText.length; i++) {
      int charCode = plainText.codeUnitAt(i);
      if (charCode >= 65 && charCode <= 90) {
        // Uppercase letter
        charCode = (charCode + shift - 65) % 26 + 65;
      } else if (charCode >= 97 && charCode <= 122) {
        // Lowercase letter
        charCode = (charCode + shift - 97) % 26 + 97;
      }
      result += String.fromCharCode(charCode);
    }
    return result;
  }
}
