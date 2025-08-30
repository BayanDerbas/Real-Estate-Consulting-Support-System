enum PropertyType { HOME, UPPER_FLOOR, VILLA, OFFICE, LAND, STORE, OTHER }

enum PropertyDirection {
  SOUTH,
  NORTH,
  EAST,
  WEST,
  SOUTH_WEST,
  SOUTH_EAST,
  NORTH_EAST,
  NORTH_WEST,
}

enum PropertyService { BUY, RENT }

class ChipModel {
  final String label;
  final Enum value;

  ChipModel({required this.label, required this.value});
}
