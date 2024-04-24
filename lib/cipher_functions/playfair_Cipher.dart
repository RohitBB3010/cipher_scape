String decryptPlayfair(String ciphertext, String key) {
  // Step 1: Generate the Key Square
  List<List<String>> keySquare = generateKeySquare(key);

  // Step 2: Prepare the Ciphertext
  ciphertext = ciphertext.replaceAll(' ', '').toUpperCase();
  if (ciphertext.length % 2 != 0) {
    ciphertext += 'X';
  }

  // Step 3: Break the Ciphertext into Digraphs
  List<String> digraphs = [];
  for (int i = 0; i < ciphertext.length; i += 2) {
    digraphs.add(ciphertext.substring(i, i + 2));
  }
  // Step 4: Decrypt each Digraph
  String plaintext = '';
  for (String digraph in digraphs) {
    int row1 = 0, col1 = 0, row2 = 0, col2 = 0;
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 5; j++) {
        if (keySquare[i][j] == digraph[0]) {
          row1 = i;
          col1 = j;
        }
        if (keySquare[i][j] == digraph[1]) {
          row2 = i;
          col2 = j;
        }
      }
    }
    if (row1 == row2) {
      plaintext += keySquare[row1][(col1 - 1 + 5) % 5];
      plaintext += keySquare[row2][(col2 - 1 + 5) % 5];
    } else if (col1 == col2) {
      plaintext += keySquare[(row1 - 1 + 5) % 5][col1];
      plaintext += keySquare[(row2 - 1 + 5) % 5][col2];
    } else {
      plaintext += keySquare[row1][col2];
      plaintext += keySquare[row2][col1];
    }
  }
  return plaintext;
}
