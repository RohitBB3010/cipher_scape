class PlayfairCipher {
  late List<List<String>> _matrix;
  String _keyword;

  PlayfairCipher(this._keyword) {
    _generateMatrix();
  }

  void _generateMatrix() {
    String key = _keyword.toUpperCase().replaceAll(RegExp(r'[^A-Z]'), '');
    key += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    Set<String> set = key.split('').toSet();
    List<String> flatMatrix = set.toList();

    _matrix = List.generate(5, (_) => List<String>.generate(5, (_) => ''));

    int index = 0;
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 5; j++) {
        _matrix[i][j] = flatMatrix[index];
        index++;
      }
    }
  }

  String _normalizeText(String text) {
    return text
        .toUpperCase()
        .replaceAll(RegExp(r'[^A-Z]'), '')
        .replaceAll('J', 'I');
  }

  List<int> _getPositions(String letter) {
    for (int i = 0; i < _matrix.length; i++) {
      for (int j = 0; j < _matrix[i].length; j++) {
        if (_matrix[i][j] == letter) {
          return [i, j];
        }
      }
    }
    return [-1, -1];
  }

  String encrypt(String plaintext) {
    plaintext = _normalizeText(plaintext);
    String ciphertext = '';
    for (int i = 0; i < plaintext.length; i += 2) {
      String firstLetter = plaintext[i];
      String secondLetter;
      if (i + 1 < plaintext.length) {
        secondLetter = plaintext[i + 1];
      } else {
        secondLetter =
            'X'; // If the text length is odd, append 'X' to make pairs
      }
      if (firstLetter == secondLetter) {
        secondLetter = 'X';
        i--; // Go back one step so that the next pair starts from the same position
      }

      List<int> firstPos = _getPositions(firstLetter);
      List<int> secondPos = _getPositions(secondLetter);

      if (firstPos[0] == secondPos[0]) {
        // Same row
        ciphertext += _matrix[firstPos[0]][(firstPos[1] + 1) % 5];
        ciphertext += _matrix[secondPos[0]][(secondPos[1] + 1) % 5];
      } else if (firstPos[1] == secondPos[1]) {
        // Same column
        ciphertext += _matrix[(firstPos[0] + 1) % 5][firstPos[1]];
        ciphertext += _matrix[(secondPos[0] + 1) % 5][secondPos[1]];
      } else {
        // Rectangle
        ciphertext += _matrix[firstPos[0]][secondPos[1]];
        ciphertext += _matrix[secondPos[0]][firstPos[1]];
      }
    }
    return ciphertext;
  }

  String decrypt(String ciphertext) {
    String plaintext = '';
    for (int i = 0; i < ciphertext.length; i += 2) {
      String firstLetter = ciphertext[i];
      String secondLetter = ciphertext[i + 1];

      List<int> firstPos = _getPositions(firstLetter);
      List<int> secondPos = _getPositions(secondLetter);

      if (firstPos[0] == secondPos[0]) {
        // Same row
        plaintext += _matrix[firstPos[0]][(firstPos[1] - 1 + 5) % 5];
        plaintext += _matrix[secondPos[0]][(secondPos[1] - 1 + 5) % 5];
      } else if (firstPos[1] == secondPos[1]) {
        // Same column
        plaintext += _matrix[(firstPos[0] - 1 + 5) % 5][firstPos[1]];
        plaintext += _matrix[(secondPos[0] - 1 + 5) % 5][secondPos[1]];
      } else {
        // Rectangle
        plaintext += _matrix[firstPos[0]][secondPos[1]];
        plaintext += _matrix[secondPos[0]][firstPos[1]];
      }
    }
    return plaintext;
  }
}

String decryptPlayfair(String key, String ciphertext) {
  PlayfairCipher cipher = PlayfairCipher(key);
  return cipher.decrypt(ciphertext);
}
