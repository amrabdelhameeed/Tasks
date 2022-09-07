class FilterModel {
  final String filterName;
  bool isSelected;

  FilterModel({required this.filterName, this.isSelected = false});
  void selectFilter() {
    isSelected = true;
  }

  void unSelectFilter() {
    isSelected = false;
  }

  static List<FilterModel> filters = [
    FilterModel(filterName: 'Development', isSelected: true),
    FilterModel(
      filterName: 'Research',
    ),
    FilterModel(filterName: 'Design'),
    FilterModel(filterName: 'BackEnd'),
    FilterModel(filterName: 'Testing'),
  ];
}
