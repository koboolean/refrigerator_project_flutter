class myrecipeItem {
  late String? foodCd;
  late String foodNm;
  DateTime? modifiedDate;
  bool isFavorite;

  myrecipeItem({
    this.foodCd,
    required this.foodNm,
    this.modifiedDate,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'FOODCD': foodCd,
      'FOODNM': foodNm,
      'MODIFIEDDATE': modifiedDate,
      'ISFAVORITE': isFavorite
    };
  }
}
