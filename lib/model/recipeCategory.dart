class RecipeCategory {
  RecipeCategory({
    required this.title,
    required this.match,
    required this.image,
    required this.item,
    required this.necItem,
    required this.totalTime
  });

  String title; // 타이틀
  String match; // 매칭 퍼센트
  String image; // 이미지
  String item; // 존재하는 아이템
  String necItem; // 필요한 아이템
  String totalTime; //총 소요시간
}
