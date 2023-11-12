List<String> nationalities = [
  "Afghan",
  "Albanian",
  "Algerian",
  "Andorran",
  "Angolan",
  "Antiguans",
  "Argentinean",
  "Armenian",
  "Australian",
  "Austrian",
];

List<String> roomList = List.generate(6, (index) {
  int roomCount = index + 1;
  int adultCount = index + 1;
  int childCount = index;

  return '$roomCount Room, $adultCount Adult, $childCount Children';
});
