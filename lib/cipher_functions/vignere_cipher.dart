class VigenereCipher {
  List<String> cipheredTextList = [
    'cbwmfcwi',
    'gahvisqga',
    'uqlipqh',
    'acxkqbqefwh',
    'youmuqrqkbj',
    'uolrvuhvoolr',
    'czxgcfg'
  ];
  List<String> decipheredTextList = [
    'antidote',
    'emergency',
    'science',
    'yougonnadie',
    'wariscoming',
    'saintgermain',
    'alucard'
  ];

  String encryptVigenere(String plainText, String key) {
    String encryptedText = '';
    int keyIndex = 0;
    key = key.toUpperCase();

    for (int i = 0; i < plainText.length; i++) {
      String char = plainText[i];
      if (RegExp(r'[a-zA-Z]').hasMatch(char)) {
        int shift = key.codeUnitAt(keyIndex % key.length) - 'A'.codeUnitAt(0);
        if (char == char.toLowerCase()) {
          encryptedText += String.fromCharCode(
              (char.codeUnitAt(0) - 'a'.codeUnitAt(0) + shift) % 26 +
                  'a'.codeUnitAt(0));
        } else {
          encryptedText += String.fromCharCode(
              (char.codeUnitAt(0) - 'A'.codeUnitAt(0) + shift) % 26 +
                  'A'.codeUnitAt(0));
        }
        keyIndex++;
      }
    }

    return encryptedText;
  }

  String decryptVigenere(String encryptedText, String key) {
    String decryptedText = '';
    int keyIndex = 0;
    key = key.toUpperCase();

    for (int i = 0; i < encryptedText.length; i++) {
      String char = encryptedText[i];
      if (RegExp(r'[a-zA-Z]').hasMatch(char)) {
        int shift = key.codeUnitAt(keyIndex % key.length) - 'A'.codeUnitAt(0);
        if (char == char.toLowerCase()) {
          decryptedText += String.fromCharCode(
              (char.codeUnitAt(0) - 'a'.codeUnitAt(0) - shift + 26) % 26 +
                  'a'.codeUnitAt(0));
        } else {
          decryptedText += String.fromCharCode(
              (char.codeUnitAt(0) - 'A'.codeUnitAt(0) - shift + 26) % 26 +
                  'A'.codeUnitAt(0));
        }
        keyIndex++;
      }
    }

    return decryptedText;
  }
}
