class RefrigerItem {
  RefrigerItem({
    required this.headerValue,
    required this.headersubValue,
    required this.expandedValue,
    required this.categoryValue,
    this.isExpanded = false,
  });

  String headerValue;
  String headersubValue;
  String expandedValue;
  String categoryValue;
  bool isExpanded;
}
