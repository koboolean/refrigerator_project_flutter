class RefrigerItem {
  RefrigerItem({
    required this.headerValue, //재료명
    required this.quantity, //개수와 무게
    required this.dateTimeValue, //날짜
    required this.categoryValue, //분류 카테고리
    required this.description, //설명
    this.isExpanded = false,
  });

  String headerValue;
  String quantity;
  String dateTimeValue;
  String categoryValue;
  String description; // Nullable 타입으로 변경 (설명 생략해도 되게끔)
  bool isExpanded;

  Map<String, dynamic> toMap() {
    return {
      'headerValue': headerValue,
      'quantity': quantity,
      'dateTimeValue': dateTimeValue,
      'categoryValue': categoryValue,
    };
  }
}
