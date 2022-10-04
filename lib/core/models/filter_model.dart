class FilterModel {
  final String filterName;
  bool isSelected;
  final int index;
  FilterModel({required this.filterName, this.isSelected = false, required this.index});
  void selectFilter() {
    isSelected = true;
  }

  void unSelectFilter() {
    isSelected = false;
  }

  static List<FilterModel> filters = [
    FilterModel(filterName: 'Studying', isSelected: true, index: 0),
    FilterModel(filterName: 'Sports', index: 1),
    FilterModel(filterName: 'Work', index: 2),
    FilterModel(filterName: 'To-Do', index: 3),
    FilterModel(filterName: 'Other', index: 4),
  ];
}
