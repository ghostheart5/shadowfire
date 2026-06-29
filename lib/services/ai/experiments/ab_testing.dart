class AbTesting {
  String selectGroup(String experimentName) {
    return experimentName.hashCode.isEven ? 'A' : 'B';
  }
}