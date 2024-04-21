class CeaserCipher {
  List<String> cipherTexts = ['Rnsfyzx', 'Cetutwfkwzxfx', 'Jswxytqjsy'];

  String solveCeaserCipher(String cipherText, int key) {
    String plaintext = '';
    for (int i = 0; i < cipherText.length; i++) {
      String char = cipherText[i];
      if (char.codeUnitAt(0) >= 'a'.codeUnitAt(0) &&
          char.codeUnitAt(0) <= 'z'.codeUnitAt(0)) {
        int decryptedCharCode =
            ((char.codeUnitAt(0) - 'a'.codeUnitAt(0) - key) % 26) +
                'a'.codeUnitAt(0);
        if (decryptedCharCode < 'a'.codeUnitAt(0)) {
          decryptedCharCode += 26;
        }
        plaintext += String.fromCharCode(decryptedCharCode);
      } else if (char.codeUnitAt(0) >= 'A'.codeUnitAt(0) &&
          char.codeUnitAt(0) <= 'Z'.codeUnitAt(0)) {
        int decryptedCharCode =
            ((char.codeUnitAt(0) - 'A'.codeUnitAt(0) - key) % 26) +
                'A'.codeUnitAt(0);
        if (decryptedCharCode < 'A'.codeUnitAt(0)) {
          decryptedCharCode += 26;
        }
        plaintext += String.fromCharCode(decryptedCharCode);
      } else {
        plaintext += char;
      }
    }
    return plaintext;
  }
}