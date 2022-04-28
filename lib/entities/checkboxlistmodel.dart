class CheckboxListModel {
  String? name;
  String? title;
  String? icon;
  bool? isCheck;

  CheckboxListModel({this.name, this.title, this.icon, this.isCheck});

  static List<CheckboxListModel> getOptions() {
    return <CheckboxListModel>[
      CheckboxListModel(
        name: 'talent',
        title: 'Talent',
        icon: 'hive',
        isCheck: false
      ),
      CheckboxListModel(
          name: 'burden',
          title: 'Burden',
          icon: 'remove_circle',
          isCheck: false
      ),
      CheckboxListModel(
          name: 'boon',
          title: 'Boon',
          icon: 'add_circle',
          isCheck: false
      ),
      CheckboxListModel(
          name: 'mystical power',
          title: 'Mystical Power',
          icon: 'auto_fix_high',
          isCheck: false
      ),
      CheckboxListModel(
          name: 'ritual',
          title: 'Ritual',
          icon: 'brightness_low',
          isCheck: false
      ),
      CheckboxListModel(
          name: 'trait',
          title: 'Trait',
          icon: 'bubble_chart',
          isCheck: false
      ),
      CheckboxListModel(
          name: 'monstrous trait',
          title: 'Monstrous Trait',
          icon: 'pets',
          isCheck: false
      ),
      CheckboxListModel(
          name: 'quality',
          title: 'Quality',
          icon: 'gps_not_fixed',
          isCheck: false
      ),
    ];
  }
}
