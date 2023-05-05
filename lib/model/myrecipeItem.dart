class myrecipeItem {
  final String foodCd;
  final String foodNm;
  DateTime? modifiedDate;
  bool isFavorite;

  myrecipeItem({
    required this.foodCd,
    required this.foodNm,
    this.modifiedDate,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'FOODCD': foodCd,
      'FOODNM': foodNm,
      'MODIFIEDDATE': modifiedDate,
    };
  }
}
