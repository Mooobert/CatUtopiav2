import 'dart:math';

class FacilityAddition {
  List<String> populateFacilityType(String type, int count) {
    List<String> facilityType = <String>[];
    for (int i = 0; i < count; i++) {
      facilityType.add(type);
    }
    return facilityType;
  }

  List<List<String>> populateAllFacilities(
      int cookCount,
      int carrotCount,
      int cabbageCount,
      int cornCount,
      int acornCount,
      int broccoliCount,
      int lemonCount,
      int honeyCount,
      int wheatCount,
      int radishCount,
      int pumpkinCount,
      int mushroomCount,
      int celeryCount,
      int restCount,
      int fxnCount,
      int specCount,
      int emptyCount) {
    List<List<String>> facilityList = <List<String>>[];

    facilityList.add(populateFacilityType("cooking", cookCount));
    facilityList.add(populateFacilityType("carrot", carrotCount));
    facilityList.add(populateFacilityType("cabbage", cabbageCount));
    facilityList.add(populateFacilityType("corn", cornCount));
    facilityList.add(populateFacilityType("acorn", acornCount));
    facilityList.add(populateFacilityType("broccoli", broccoliCount));
    facilityList.add(populateFacilityType("lemon", lemonCount));
    facilityList.add(populateFacilityType("honey", honeyCount));
    facilityList.add(populateFacilityType("wheat", wheatCount));
    facilityList.add(populateFacilityType("radish", radishCount));
    facilityList.add(populateFacilityType("pumpkin", pumpkinCount));
    facilityList.add(populateFacilityType("mushroom", mushroomCount));
    facilityList.add(populateFacilityType("celery", celeryCount));
    facilityList.add(populateFacilityType("rest", restCount));
    facilityList.add(populateFacilityType("function", fxnCount));
    facilityList.add(populateFacilityType("special", specCount));
    facilityList.add(populateFacilityType("(empty)", emptyCount));

    return facilityList;
  }
}

class LevelLayoutGeneration {
  List<List<String>> generateRows(int level){
    List<List<String>> generatedField;
    if (level < 0) throw Exception("Can't generate field");

    switch (level){
      case 0:
        generatedField = List.generate(5, (_) => []);
        for(int i = 0; i < generatedField[i].length; i++){
          generatedField[i] = i % 2 == 0 ? List<String>.filled(1, "") : List<String>.filled(2, "");
        }
        break;
      case 1:
        generatedField = List.generate(7, (_) => []);
        for(int i = 0; i < generatedField[i].length; i++){
          generatedField[i] = i % 2 == 0 ? List<String>.filled(2, "") : List<String>.filled(3, "");
        }
        break;
      case 2:
        generatedField = List.generate(9, (_) => []);
        for(int i = 0; i < generatedField[i].length; i++){
          generatedField[i] = i % 2 == 0 ? List<String>.filled(3, "") : List<String>.filled(4, "");
        }
        break;
      case 3:
        generatedField = List.generate(13, (_) => []);
        for(int i = 0; i < generatedField[i].length; i++){
          if (i % 2 == 1) {
            generatedField[i] = List<String>.filled(4, "");
          }
          else if(i % 2 == 0 && i < 3 || i > 9){
            generatedField[i] = List<String>.filled(3, "");
          }
          else{
            generatedField[i] = List<String>.filled(5, "");
          }
        }
        break;
      case 4:
        generatedField = List.generate(17, (_) => []);
        for(int i = 0; i < generatedField[i].length; i++){
          if (i == 0 || i == generatedField.length-1){
            generatedField[i] = List<String>.filled(1, "");
          }
          else if( i % 2 == 0){
            generatedField[i] = List<String>.filled(5, "");
          }
          else if(i % 2 == 1 && i < 4 || i > 12){
            generatedField[i] = List<String>.filled(4, "");
          }
          else{
            generatedField[i] = List<String>.filled(6, "");
          }
        }
        break;
      default:
        throw Exception("Can't generate field!");
    }
    return generatedField;
  }
}

class FacilityInsertion{
  late List<List<String>> facilityList;
  late List<List<String>> levelLayout;
  var r = Random();
  FacilityInsertion(List<List<String>> facList, List<List<String>> lLayout){
    facilityList = facList;
    levelLayout = lLayout;
  }

  List<List<String>> insert(){
    int numFacilities = facilityCount(facilityList);
    int numLevelSpots = facilityCount(levelLayout);
    if(numFacilities == numLevelSpots){
      for(int i = 0; i < levelLayout.length; i++){
        for(int j = 0; j < levelLayout[i].length; j++){
          int facilityType = r.nextInt(17);
          while(facilityList[facilityType].isEmpty){
            facilityType = r.nextInt(17);
          }
          levelLayout[i][j] = facilityList[facilityType].removeAt(0);
        }
      }
      return levelLayout;
    }
    throw Exception("Spot mismatch!");
  }

  int facilityCount(List<List<String>> someList){
    int numSpots = 0;
    for(int i = 0; i < someList.length; i++){
      for(int j = 0; j < someList[i].length; j++){
        numSpots++;
      }
    }
    return numSpots;
  }

  @override
  String toString(){
    String finalStr = "";
    for(int i = 0; i < levelLayout.length; i++){
      finalStr += "[ ";
      for(int j = 0; j < levelLayout[i].length; j++){
        finalStr += levelLayout[i][j] + " ";
      }
      finalStr += "]\n";
    }
    return finalStr;
  }
}