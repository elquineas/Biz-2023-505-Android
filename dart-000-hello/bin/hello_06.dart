String stdFunc(String nation) {
  return nation.toUpperCase();
}

String arrowAFunc(String nation) => nation.toUpperCase();
String? arrowBFunc(String? nation) => nation?.toUpperCase() ?? null;
