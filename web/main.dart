import 'dart:html';
import 'dart:math' as math;

DivElement scrambleDiv, arrangedDiv;
ButtonInputElement resetButton;
List<ButtonInputElement> scrambleButtons = [];
String scrambleString =
    'aabbccddeeffffgggghhiiijjkkllmmnnnnooopppqqqrrrssstuuuvvvwwxxxyyzz';
void main() {
  scrambleDiv = querySelector('#scramble_button_div');
  arrangedDiv = querySelector('#arranged_button_div');
  resetButton = querySelector('#reset_button');
  resetButton.onClick.listen(reset);
  addScrambleButtons();
}

String takeRandom(String scramString) {
  var takeRandomLetters = math.Random();
  return scramString[takeRandomLetters.nextInt(scramString.length)];
}

void addScrambleButtons() {
  for (var i = 0; i < 7; i++) {
    scrambleButtons.add(ButtonInputElement());
    scrambleButtons.elementAt(i)
      ..value = takeRandom(scrambleString)
      ..className = 'letters'
      ..onClick.listen(moveLetter);
    scrambleDiv.children.add(scrambleButtons.elementAt(i));
  }
}

void moveLetter(Event e) {
  Element letter = e.target;
  if (letter.parent == scrambleDiv) {
    arrangedDiv.children.add(letter);
  } else {
    scrambleDiv.children.add(letter);
  }
}

void reset(Event e) {
  scrambleDiv.children.clear();
  arrangedDiv.children.clear();
  addScrambleButtons();
}
