import 'dart:io';
import 'dart:math';

List<Monster> monsters = [
  Monster(name: "🧟‍♂️Zombie", health: 20),
  Monster(name: "👻Ghost", health: 50, damage: 10)
];

List<Food> foods = [
  Food("🍎", "Fruit", 10),
  Food("🍖", "Meets", 50),
  Food("🌊", "Drink", 5)
];

var player1 = Player();

main() {
  gameTitle();
  selectName();
  userInput();
  endGame();
}

selectName() {
  print("what is your name: ");
  String name = stdin.readLineSync()!;
  player1.name = name;
}

gameTitle() {
  space(2);
  print("#### Don't be hungry ####");
  space(2);
}

moveForward() {
  print(
      "name: ${player1.name}, health: ${player1.health}, score: ${player1.score}");
  var random = Random();
  int userLuck = random.nextInt(11);
  
  if (userLuck == 10) {
    foods.shuffle();
    print(foods[0].name);
    foods[0].heal(player1);
  } else if (userLuck == 0) {
    monsters.shuffle();
    print(monsters[0].name);
    monsters[0].hit(player1);
    player1.hit(monsters[0]);
  }
}

userInput() {
  String input = "";
  while (input != "q" && player1.health > 0) {
    input = stdin.readLineSync()!;
    moveForward();
    player1.score++;
  }
}

endGame() {
  space(2);
  print("#### The End ####");
  space(2);
}

space(int spaces) {
  for (int index = 0; index < spaces; index++) {
    print("");
  }
}

class Creature {
  String name = "";
  int health = 100;
  int damage = 10;

  hit(Creature creature) {
    creature.health -= damage;
  }
}

class Player extends Creature {
  int score = 0;

  @override
  hit(Creature creature) {
    // TODO: implement hit
    creature.health -= damage * 2 ;
    return super.hit(creature);
    
  
  }
}

class Monster extends Creature {
  Monster({required String name, int health = 100, int damage = 10}) {
    this.name = name;
    this.health = health;
    this.damage = damage;
  }

  
}

class Food {
  String name = "";
  String type = "";
  int treatment = 10;

  Food(String name, String type, int treatment) {
    this.name = name;
    this.type = type;
    this.treatment = treatment;
  }

  heal(Player player) {
    player.health += treatment;
  }
}
