Character[] characters;
int charactersNumber;
JSONObject json;

void loadCharacters() {
  // Load JSON file
  // Temporary full path until path problem resolved.
  json = loadJSONObject("characters.json");

  JSONArray characterData = json.getJSONArray("characters");

  // The size of the array of Bubble objects is determined by the total XML elements named "bubble"
  characters = new Character[characterData.size()]; 

  for (int i = 0; i < characterData.size (); i++) {
    // Get each object in the array
    JSONObject character = characterData.getJSONObject(i); 
    // Get a position object
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
    characters[i] = new Character(character.getString("name"), angles);
    charactersNumber++;
  }
}

