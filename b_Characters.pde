Character[] characters;
int charactersNumber;

//Load characters from JSON file
void loadCharacters() {
  JSONObject json = loadJSONObject("characters.json");

  JSONArray characterData = json.getJSONArray("characters");

  characters = new Character[characterData.size()]; 

  //Characters array is populated by "Character" class instance
  for (int i = 0; i < characterData.size (); i++) {
    JSONObject character = characterData.getJSONObject(i);
    String maskFile = character.getString("maskFile");
    String endFile = character.getString("endFile");
    JSONObject anglesData = character.getJSONObject("angles");
    int angles[] = new int[8];
    angles[0] = anglesData.getInt("a");
    angles[1] = anglesData.getInt("b");
    angles[2] = anglesData.getInt("c");
    angles[3] = anglesData.getInt("d");
    angles[4] = anglesData.getInt("e");
    angles[5] = anglesData.getInt("f");
    angles[6] = anglesData.getInt("g");
    angles[7] = anglesData.getInt("h");
    characters[i] = new Character(character.getString("name"), angles, maskFile, endFile);
    charactersNumber++;
  }
}

