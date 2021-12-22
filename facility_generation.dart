class FacilityAddition {
  List<String> populateFacilityType(String type, int count) {
    List<String> facilityType = <String>[];
    for (int i = 0; i < count; i++) {
      facilityType.add(type);
    }
    return facilityType;
  }

  List<List<String>> populateAllFacilities(int cookCount, int carrotCount,
      int cabbageCount, int cornCount, int acornCount, int broccoliCount,
      int lemonCount, int honeyCount, int wheatCount, int radishCount,
      int pumpkinCount, int mushroomCount, int celeryCount, int restCount,
      int fxnCount, int specCount, int emptyCount) {
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