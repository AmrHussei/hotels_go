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
  "Azerbaijani",
  "Bahamian",
  "Bahraini",
  "Bangladeshi",
  "Barbadian",
  "Barbudans",
  "Batswana",
  "Belarusian",
  "Belgian",
  "Belizean",
  "Beninese",
  "Bhutanese",
  "Bolivian",
  "Bosnian",
  "Brazilian",
  "British",
  "Central African",
  "Chadian",
  "Chilean",
];

List<String> roomList = List.generate(10, (index) {
  int roomCount = index + 1;
  int adultCount = index + 1;
  int childCount = index;

  return '$roomCount Room, $adultCount Adult, $childCount Children';
});
