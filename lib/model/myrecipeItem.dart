class myrecipeItem {
  late String? foodCd;
  late String? foodNm;
  late String? totalTime;
  DateTime? modifiedDate;
  bool isFavorite;

  myrecipeItem({
    required this.foodCd,
    required this.foodNm,
    this.modifiedDate,
    required this.totalTime,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'FOODCD': foodCd,
      'FOODNM': foodNm,
      'TOTALTIME' : totalTime,
      'MODIFIEDDATE': modifiedDate,
      'ISFAVORITE': isFavorite
    };
  }
}
