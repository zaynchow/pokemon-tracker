DROP TABLE EffectiveAgainst;
DROP TABLE HasMoveType;
DROP TABLE HasMove;
DROP TABLE HasSpeciesType;
DROP TABLE EntersInPokedex;
DROP TABLE Move;
DROP TABLE ElementalType;
DROP TABLE TamedPokemon;
DROP TABLE Pokemon;
DROP TABLE PokemonHP;
DROP TABLE Item;
DROP TABLE Species;
DROP TABLE GymBadgeName;
DROP TABLE GymBadge;
DROP TABLE Gym;
DROP TABLE PokemonTrainer;
DROP TABLE Region;
CREATE TABLE Region(
  regionName VARCHAR2(255) PRIMARY KEY,
  professor VARCHAR2(255) UNIQUE
);
CREATE TABLE PokemonTrainer(
  trainerID INTEGER PRIMARY KEY,
  name VARCHAR2(255) NOT NULL,
  startingIn_regionName VARCHAR2(255) NOT NULL,
  FOREIGN KEY (startingIn_regionName) REFERENCES Region(regionName)
);
CREATE TABLE Gym(
  gymName VARCHAR2(255) PRIMARY KEY,
  gymLeader VARCHAR2(255) UNIQUE NOT NULL,
  type VARCHAR2(255) NOT NULL,
  locatedIn_regionName VARCHAR2(255) NOT NULL,
  FOREIGN KEY (locatedIn_regionName) REFERENCES Region(regionName)
);
CREATE TABLE GymBadge(
  gymName VARCHAR2(255),
  trainerID INTEGER,
  badgeID INTEGER,
  PRIMARY KEY (gymName, trainerID, badgeID),
  FOREIGN KEY (gymName) REFERENCES Gym(gymName) ON DELETE CASCADE,
  FOREIGN KEY (trainerID) REFERENCES PokemonTrainer(trainerID) ON DELETE CASCADE
);
CREATE TABLE GymBadgeName(
  gymName VARCHAR2(255) PRIMARY KEY,
  badgeName VARCHAR2(255) UNIQUE NOT NULL,
  FOREIGN KEY (gymName) REFERENCES Gym(gymName) ON DELETE CASCADE
);
CREATE TABLE Species(
  speciesID INTEGER PRIMARY KEY,
  speciesName VARCHAR2(255) NOT NULL,
  speciesDescription VARCHAR2(255) NOT NULL,
  evolvesFrom_speciesID INTEGER,
  FOREIGN KEY (evolvesFrom_speciesID) REFERENCES Species(speciesID) ON DELETE
  SET NULL
);
CREATE TABLE Item(
  itemName VARCHAR2(255) PRIMARY KEY,
  itemEffect VARCHAR2(255) NOT NULL
);
CREATE TABLE PokemonHP(
  speciesID INTEGER,
  pokemonLevel INTEGER DEFAULT 1,
  HP INTEGER NOT NULL,
  PRIMARY KEY (speciesID, pokemonLevel),
  FOREIGN KEY (speciesID) REFERENCES Species(speciesID)
);
CREATE TABLE Pokemon(
  pokemonID INTEGER,
  speciesID INTEGER,
  pokemonLevel INTEGER DEFAULT 1,
  nature VARCHAR2(255) NOT NULL,
  holding_itemName VARCHAR2(255),
  PRIMARY KEY (pokemonID, speciesID),
  FOREIGN KEY (speciesID) REFERENCES Species(speciesID),
  FOREIGN KEY (holding_itemName) REFERENCES Item(itemName) ON DELETE
  SET NULL,
    FOREIGN KEY (speciesID, pokemonLevel) REFERENCES PokemonHP(speciesID, pokemonLevel) ON DELETE CASCADE
);
CREATE TABLE TamedPokemon(
  pokemonID INTEGER,
  speciesID INTEGER,
  dateCaught DATE NOT NULL,
  nickname VARCHAR2(255),
  ownedBy_trainerID INTEGER NOT NULL,
  boxNumber INTEGER NOT NULL,
  slotNumber INTEGER NOT NULL,
  CONSTRAINT Box_Location UNIQUE (ownedBy_trainerID, boxNumber, slotNumber),
  PRIMARY KEY (pokemonID, speciesID),
  FOREIGN KEY (pokemonID, speciesID) REFERENCES Pokemon(pokemonID, speciesID),
  FOREIGN KEY (speciesID) REFERENCES Species(speciesID)
);
CREATE TABLE ElementalType(typeName VARCHAR2(255) PRIMARY KEY);
CREATE TABLE Move(
  moveName VARCHAR2(255) PRIMARY KEY,
  moveDescription VARCHAR2(255) NOT NULL,
  powerPoints INTEGER NOT NULL,
  power INTEGER DEFAULT 0,
  effect VARCHAR2(255)
);
CREATE TABLE EntersInPokedex(
  speciesID INTEGER,
  trainerID INTEGER,
  encounterDate DATE NOT NULL,
  PRIMARY KEY (speciesID, trainerID),
  FOREIGN KEY (speciesID) REFERENCES Species(speciesID) ON DELETE CASCADE,
  FOREIGN KEY (trainerID) REFERENCES PokemonTrainer(trainerID) ON DELETE CASCADE
);
CREATE TABLE HasSpeciesType(
  speciesID INTEGER,
  typeName VARCHAR2(255),
  PRIMARY KEY (speciesID, typeName),
  FOREIGN KEY (speciesID) REFERENCES Species(speciesID) ON DELETE CASCADE,
  FOREIGN KEY (typeName) REFERENCES ElementalType(typeName) ON DELETE CASCADE
);
CREATE TABLE HasMove(
  speciesID INTEGER,
  pokemonID INTEGER,
  moveName VARCHAR2(255),
  moveSlot INTEGER NOT NULL,
  UNIQUE (pokemonID, moveSlot),
  PRIMARY KEY (speciesID, pokemonID, moveName),
  FOREIGN KEY (speciesID) REFERENCES Species(speciesID) ON DELETE CASCADE,
  FOREIGN KEY (pokemonID, speciesID) REFERENCES Pokemon(pokemonID, speciesID) ON DELETE CASCADE,
  FOREIGN KEY (moveName) REFERENCES Move(moveName) ON DELETE CASCADE
);
CREATE TABLE HasMoveType(
  moveName VARCHAR2(255),
  typeName VARCHAR2(255),
  PRIMARY KEY (moveName, typeName),
  FOREIGN KEY (moveName) REFERENCES Move(moveName) ON DELETE CASCADE,
  FOREIGN KEY (typeName) REFERENCES ElementalType(typeName) ON DELETE CASCADE
);
CREATE TABLE EffectiveAgainst(
  strong_typeName VARCHAR2(255),
  weak_typeName VARCHAR2(255),
  PRIMARY KEY (strong_typeName, weak_typeName),
  FOREIGN KEY (strong_typeName) REFERENCES ElementalType(typeName) ON DELETE CASCADE,
  FOREIGN KEY (weak_typeName) REFERENCES ElementalType(typeName) ON DELETE CASCADE
);
INSERT INTO Species(
    speciesID,
    speciesName,
    speciesDescription,
    evolvesFrom_speciesID
  )
VALUES(
    1,
    'Bulbasaur',
    'A strange seed was planted on its back at birth. The plant sprouts and grows with this POKEMON.',
    NULL
  );
INSERT INTO Species(
    speciesID,
    speciesName,
    speciesDescription,
    evolvesFrom_speciesID
  )
VALUES(
    2,
    'Ivysaur',
    'When the bulb on its back grows large, it appears to lose the ability to stand on its hind legs.',
    1
  );
INSERT INTO Species(
    speciesID,
    speciesName,
    speciesDescription,
    evolvesFrom_speciesID
  )
VALUES(
    3,
    'Venusaur',
    'The plant blooms when it is absorbing solar energy. It stays on the move to seek sunlight.',
    2
  );
INSERT INTO Species(
    speciesID,
    speciesName,
    speciesDescription,
    evolvesFrom_speciesID
  )
VALUES(
    4,
    'Charmander',
    'Obviously prefers hot places. When it rains, steam is said to spout from the tip of its tail.',
    NULL
  );
INSERT INTO Species(
    speciesID,
    speciesName,
    speciesDescription,
    evolvesFrom_speciesID
  )
VALUES(
    5,
    'Charmeleon',
    'When it swings its burning tail, it elevates the temperature to unbearably high levels.',
    4
  );
INSERT INTO Species(
    speciesID,
    speciesName,
    speciesDescription,
    evolvesFrom_speciesID
  )
VALUES(
    6,
    'Charizard',
    'Spits fire that is hot enough to melt boulders. Known to cause forest fires unintentionally.',
    5
  );
INSERT INTO Species(
    speciesID,
    speciesName,
    speciesDescription,
    evolvesFrom_speciesID
  )
VALUES(
    7,
    'Squirtle',
    'After birth, its back swells and hardens into a shell. Powerfully sprays foam from its mouth.',
    NULL
  );
INSERT INTO Species(
    speciesID,
    speciesName,
    speciesDescription,
    evolvesFrom_speciesID
  )
VALUES(
    8,
    'Wartortle',
    'Often hides in water to stalk unwary prey. For swimming fast, it moves its ears to maintain balance.',
    7
  );
INSERT INTO Species(
    speciesID,
    speciesName,
    speciesDescription,
    evolvesFrom_speciesID
  )
VALUES(
    9,
    'Blastoise',
    'A brutal POKEMON with pressurized water jets on its shell. They are used for high speed tackles.',
    8
  );
INSERT INTO Species(
    speciesID,
    speciesName,
    speciesDescription,
    evolvesFrom_speciesID
  )
VALUES(
    10,
    'Caterpie',
    'Its short feet are tipped with suction pads that enable it to tirelessly climb slopes and walls.',
    NULL
  );
INSERT INTO Species(
    speciesID,
    speciesName,
    speciesDescription,
    evolvesFrom_speciesID
  )
VALUES(
    11,
    'Metapod',
    'This POKEMON is vulnerable to attack while its shell is soft, exposing its weak and tender body.',
    10
  );
INSERT INTO Species(
    speciesID,
    speciesName,
    speciesDescription,
    evolvesFrom_speciesID
  )
VALUES(
    12,
    'Butterfree',
    'In battle, it flaps its wings at high speed to release highly toxic dust into the air.',
    11
  );
INSERT INTO Species(
    speciesID,
    speciesName,
    speciesDescription,
    evolvesFrom_speciesID
  )
VALUES(
    13,
    'Weedle',
    'Often found in forests, eating leaves. It has a sharp venomous stinger on its head.',
    NULL
  );
INSERT INTO Species(
    speciesID,
    speciesName,
    speciesDescription,
    evolvesFrom_speciesID
  )
VALUES(
    14,
    'Kakuna',
    'Almost incapable of moving, this POKEMON can only harden its shell to protect itself from predators.',
    13
  );
INSERT INTO Species(
    speciesID,
    speciesName,
    speciesDescription,
    evolvesFrom_speciesID
  )
VALUES(
    15,
    'Beedrill',
    'It has three poisonous stingers on its forelegs and its tail. They are used to jab its enemy repeatedly.',
    14
  );
INSERT INTO Species(
    speciesID,
    speciesName,
    speciesDescription,
    evolvesFrom_speciesID
  )
VALUES(
    16,
    'Pidgey',
    'A common sight in forests and woods. It flaps its wings at ground level to kick up blinding sand.',
    NULL
  );
INSERT INTO Species(
    speciesID,
    speciesName,
    speciesDescription,
    evolvesFrom_speciesID
  )
VALUES(
    17,
    'Pidgeotto',
    'Very protective of its sprawling territorial area, this POKEMON will fiercely peck at any intruder.',
    16
  );
INSERT INTO Species(
    speciesID,
    speciesName,
    speciesDescription,
    evolvesFrom_speciesID
  )
VALUES(
    18,
    'Pidgeot',
    'When hunting, it skims the surface of water at high speed to pick off unwary prey such as MAGIKARP.',
    17
  );
INSERT INTO Species(
    speciesID,
    speciesName,
    speciesDescription,
    evolvesFrom_speciesID
  )
VALUES(
    19,
    'Rattata',
    'Bites anything when it attacks. Small and very quick, it is a common sight in many places.',
    NULL
  );
INSERT INTO Species(
    speciesID,
    speciesName,
    speciesDescription,
    evolvesFrom_speciesID
  )
VALUES(
    20,
    'Raticate',
    'It uses its whiskers to maintain its balance. It apparently slows down if they are cut off.',
    19
  );
INSERT INTO Species(
    speciesID,
    speciesName,
    speciesDescription,
    evolvesFrom_speciesID
  )
VALUES(
    21,
    'Spearow',
    'It flaps its small wings busily to fly. Using its beak, it searches in grass for prey.',
    NULL
  );
INSERT INTO Species(
    speciesID,
    speciesName,
    speciesDescription,
    evolvesFrom_speciesID
  )
VALUES(
    22,
    'Fearow',
    'With its huge and magnificent wings, it can keep aloft without ever having to land for rest.',
    21
  );
INSERT INTO Species(
    speciesID,
    speciesName,
    speciesDescription,
    evolvesFrom_speciesID
  )
VALUES(
    23,
    'Ekans',
    'Moves silently and stealthily. Eats the eggs of birds, such as PIDGEY and SPEAROW, whole.',
    NULL
  );
INSERT INTO Species(
    speciesID,
    speciesName,
    speciesDescription,
    evolvesFrom_speciesID
  )
VALUES(
    24,
    'Arbok',
    'It is rumored that the ferocious warning markings on its belly differ from area to area.',
    23
  );
INSERT INTO Species(
    speciesID,
    speciesName,
    speciesDescription,
    evolvesFrom_speciesID
  )
VALUES(
    25,
    'Pikachu',
    'When several of these POKEMON gather, their electricity could build and cause lightning storms.',
    NULL
  );

INSERT INTO Region(regionName, professor) VALUES ('Kanto', 'Oak');
INSERT INTO Region(regionName, professor) VALUES ('Johto', 'Elm');
INSERT INTO Region(regionName, professor) VALUES ('Hoenn', 'Birch');
INSERT INTO Region(regionName, professor) VALUES ('Sinnoh', 'Rowan');
INSERT INTO Region(regionName, professor) VALUES ('Unova', 'Juniper');
INSERT INTO Region(regionName, professor) VALUES ('Kalos', 'Sycamore');
INSERT INTO Region(regionName, professor) VALUES ('Alola', 'Kukui');
INSERT INTO Region(regionName, professor) VALUES ('Galar', 'Sonia');
INSERT INTO Region(regionName, professor) VALUES ('Paldea', 'Sada');

INSERT INTO PokemonTrainer(trainerID, name, startingIn_regionName) VALUES (1301, 'Ash', 'Kanto');
INSERT INTO PokemonTrainer(trainerID, name, startingIn_regionName) VALUES (6845, 'Brock', 'Kanto');
INSERT INTO PokemonTrainer(trainerID, name, startingIn_regionName) VALUES (6214, 'Jessie', 'Kanto');
INSERT INTO PokemonTrainer(trainerID, name, startingIn_regionName) VALUES (220601, 'Dawn', 'Sinnoh');
INSERT INTO PokemonTrainer(trainerID, name, startingIn_regionName) VALUES (220602, 'Zoey', 'Sinnoh');
INSERT INTO PokemonTrainer(trainerID, name, startingIn_regionName) VALUES (766634, 'Rika', 'Paldea');

INSERT INTO Gym(gymName, gymLeader, type, locatedIn_regionName) VALUES ('Goldenrod Gym', 'Whitney', 'Normal', 'Johto');
INSERT INTO Gym(gymName, gymLeader, type, locatedIn_regionName) VALUES ('Stow-on-Side Stadium', 'Bea', 'Fighting', 'Galar');
INSERT INTO Gym(gymName, gymLeader, type, locatedIn_regionName) VALUES ('Violet Gym', 'Falkner', 'Flying', 'Johto');
INSERT INTO Gym(gymName, gymLeader, type, locatedIn_regionName) VALUES ('Fuchsia City Gym', 'Koga', 'Poison', 'Kanto');
INSERT INTO Gym(gymName, gymLeader, type, locatedIn_regionName) VALUES ('Driftveil Gym', 'Clay', 'Ground', 'Unova');
INSERT INTO Gym(gymName, gymLeader, type, locatedIn_regionName) VALUES ('Pewter City Gym', 'Brock', 'Rock', 'Kanto');
INSERT INTO Gym(gymName, gymLeader, type, locatedIn_regionName) VALUES ('Santalune Gym', 'Viola', 'Bug', 'Kalos');
INSERT INTO Gym(gymName, gymLeader, type, locatedIn_regionName) VALUES ('Hearthome Gym', 'Fantina', 'Ghost', 'Sinnoh');
INSERT INTO Gym(gymName, gymLeader, type, locatedIn_regionName) VALUES ('Lavaridge Gym', 'Flannery', 'Fire', 'Hoenn');
INSERT INTO Gym(gymName, gymLeader, type, locatedIn_regionName) VALUES ('Hulbury Stadium', 'Nessa', 'Water', 'Galar');
INSERT INTO Gym(gymName, gymLeader, type, locatedIn_regionName) VALUES ('Eterna Gym', 'Gardenia', 'Grass', 'Sinnoh');
INSERT INTO Gym(gymName, gymLeader, type, locatedIn_regionName) VALUES ('Nimbasa Gym', 'Elesa', 'Electric', 'Unova');
INSERT INTO Gym(gymName, gymLeader, type, locatedIn_regionName) VALUES ('Saffron City Gym', 'Sabrina', 'Psychic', 'Kanto');
INSERT INTO Gym(gymName, gymLeader, type, locatedIn_regionName) VALUES ('Glaseado Gym', 'Grusha', 'Ice', 'Paldea');
INSERT INTO Gym(gymName, gymLeader, type, locatedIn_regionName) VALUES ('Hammerlocke Stadium', 'Raihan', 'Dragon', 'Galar');

INSERT INTO GymBadgeName(gymName, badgeName) VALUES ('Goldenrod Gym', 'Plain Badge');
INSERT INTO GymBadgeName(gymName, badgeName) VALUES ('Stow-on-Side Stadium', 'Fighting Badge');
INSERT INTO GymBadgeName(gymName, badgeName) VALUES ('Violet Gym', 'Zephyr Badge');
INSERT INTO GymBadgeName(gymName, badgeName) VALUES ('Fuchsia City Gym', 'Soul Badge');
INSERT INTO GymBadgeName(gymName, badgeName) VALUES ('Driftveil Gym', 'Quake Badge');
INSERT INTO GymBadgeName(gymName, badgeName) VALUES ('Pewter City Gym', 'Boulder Badge');
INSERT INTO GymBadgeName(gymName, badgeName) VALUES ('Santalune Gym', 'Bug Badge');
INSERT INTO GymBadgeName(gymName, badgeName) VALUES ('Hearthome Gym', 'Relic Badge');
INSERT INTO GymBadgeName(gymName, badgeName) VALUES ('Lavaridge Gym', 'Heat Badge');
INSERT INTO GymBadgeName(gymName, badgeName) VALUES ('Hulbury Stadium', 'Water Badge');
INSERT INTO GymBadgeName(gymName, badgeName) VALUES ('Eterna Gym', 'Forest Badge');
INSERT INTO GymBadgeName(gymName, badgeName) VALUES ('Nimbasa Gym', 'Bolt Badge');
INSERT INTO GymBadgeName(gymName, badgeName) VALUES ('Saffron City Gym', 'Marsh Badge');
INSERT INTO GymBadgeName(gymName, badgeName) VALUES ('Glaseado Gym', 'Ice Badge');
INSERT INTO GymBadgeName(gymName, badgeName) VALUES ('Hammerlocke Stadium', 'Dragon Badge');

INSERT INTO Item(itemName, itemEffect) VALUES ('Honey', 'A sweet honey with a lush aroma that attracts wild Pokemon when it is used in grass, caves, or on special trees.');
INSERT INTO Item(itemName, itemEffect) VALUES ('Sacred Ash', 'Fully revives and restores all fainted POKEMON.');
INSERT INTO Item(itemName, itemEffect) VALUES ('Pearl', 'A pretty pearl. Can be sold cheaply.');
INSERT INTO Item(itemName, itemEffect) VALUES ('Berry Juice', 'A 100% pure juice that restores HP by 20 points.');
INSERT INTO Item(itemName, itemEffect) VALUES ('Potion', 'Restores the HP of a POKEMON by 20 points.');
INSERT INTO Item(itemName, itemEffect) VALUES ('Star Piece', 'A red gem shard. It would sell for a very high price.');
INSERT INTO Item(itemName, itemEffect) VALUES ('Blue Shard', 'A shard from an ancient item. Can be sold cheaply.');
INSERT INTO Item(itemName, itemEffect) VALUES ('Big Pearl', 'A lovely large pearl that would sell at a high price.');
INSERT INTO Item(itemName, itemEffect) VALUES ('Big Mushroom', 'A rare mushroom that would sell at a high price.');
INSERT INTO Item(itemName, itemEffect) VALUES ('Heart Scale', 'A lovely scale. It is coveted by collectors.');
INSERT INTO Item(itemName, itemEffect) VALUES ('Everstone', 'The POKEMON holding this peculiar stone is prevented from evolving.');

INSERT INTO PokemonHP(speciesID, pokemonLevel, HP) VALUES (25, 45, 80);
INSERT INTO PokemonHP(speciesID, pokemonLevel, HP) VALUES (23, 23, 56);
INSERT INTO PokemonHP(speciesID, pokemonLevel, HP) VALUES (4, 12, 26);
INSERT INTO PokemonHP(speciesID, pokemonLevel, HP) VALUES (1, 56, 67);
INSERT INTO PokemonHP(speciesID, pokemonLevel, HP) VALUES (17, 4, 31);

INSERT INTO Pokemon(pokemonID, speciesID, pokemonLevel, nature, holding_itemName) VALUES (25555, 25, 45, 'Jolly', 'Everstone');
INSERT INTO Pokemon(pokemonID, speciesID, pokemonLevel, nature, holding_itemName) VALUES (101010, 23, 23, 'Brave', NULL);
INSERT INTO Pokemon(pokemonID, speciesID, pokemonLevel, nature, holding_itemName) VALUES (123123, 4, 12, 'Naughty', NULL);
INSERT INTO Pokemon(pokemonID, speciesID, pokemonLevel, nature, holding_itemName) VALUES (456456, 1, 56, 'Shy', 'Potion');
INSERT INTO Pokemon(pokemonID, speciesID, pokemonLevel, nature, holding_itemName) VALUES (789789, 17, 4, 'Docile', 'Big Pearl');

INSERT INTO TamedPokemon(pokemonID, speciesID, dateCaught, nickname, ownedBy_trainerID, boxNumber, slotNumber) 
VALUES (25555, 25, TO_DATE('2017-02-05', 'YYYY-MM-DD'), NULL, 1301, 2, 1);
INSERT INTO TamedPokemon(pokemonID, speciesID, dateCaught, nickname, ownedBy_trainerID, boxNumber, slotNumber) 
VALUES (101010, 23, TO_DATE('2023-07-11', 'YYYY-MM-DD'), NULL, 6845, 1, 1);
INSERT INTO TamedPokemon(pokemonID, speciesID, dateCaught, nickname, ownedBy_trainerID, boxNumber, slotNumber) 
VALUES (123123, 4, TO_DATE('1997-08-13', 'YYYY-MM-DD'), NULL, 6214, 3, 1);
INSERT INTO TamedPokemon(pokemonID, speciesID, dateCaught, nickname, ownedBy_trainerID, boxNumber, slotNumber) 
VALUES (456456, 1, TO_DATE('1997-03-18', 'YYYY-MM-DD'), NULL, 220601, 2, 1);
INSERT INTO TamedPokemon(pokemonID, speciesID, dateCaught, nickname, ownedBy_trainerID, boxNumber, slotNumber) 
VALUES (789789, 17, TO_DATE('2017-02-14', 'YYYY-MM-DD'), NULL, 220602, 2, 1);

INSERT INTO ElementalType(typeName) VALUES ('Normal');
INSERT INTO ElementalType(typeName) VALUES ('Fighting');
INSERT INTO ElementalType(typeName) VALUES ('Flying');
INSERT INTO ElementalType(typeName) VALUES ('Poison');
INSERT INTO ElementalType(typeName) VALUES ('Ground');
INSERT INTO ElementalType(typeName) VALUES ('Rock');
INSERT INTO ElementalType(typeName) VALUES ('Bug');
INSERT INTO ElementalType(typeName) VALUES ('Ghost');
INSERT INTO ElementalType(typeName) VALUES ('Fire');
INSERT INTO ElementalType(typeName) VALUES ('Water');
INSERT INTO ElementalType(typeName) VALUES ('Grass');
INSERT INTO ElementalType(typeName) VALUES ('Electric');
INSERT INTO ElementalType(typeName) VALUES ('Psychic');
INSERT INTO ElementalType(typeName) VALUES ('Ice');
INSERT INTO ElementalType(typeName) VALUES ('Dragon');
INSERT INTO ElementalType(typeName) VALUES ('Steel');

INSERT INTO Move(moveName, moveDescription, powerPoints, power, effect) VALUES ('Ice Punch', 'An icy punch. May cause freezing.', 15, 75, NULL);
INSERT INTO Move(moveName, moveDescription, powerPoints, power, effect) VALUES ('Cut', 'Cuts using claws, scythes, etc.', 30, 50, NULL);
INSERT INTO Move(moveName, moveDescription, powerPoints, power, effect) VALUES ('Swords Dance', 'A dance that increases ATTACK.', 20, NULL, 'Increases the user''s Attack stat by two stages.');
INSERT INTO Move(moveName, moveDescription, powerPoints, power, effect) VALUES ('Pound', 'Pounds with forelegs or tail.', 35, 40, NULL);
INSERT INTO Move(moveName, moveDescription, powerPoints, power, effect) VALUES ('Mega Punch', 'A powerful punch thrown very hard.', 20, 80, NULL);
INSERT INTO Move(moveName, moveDescription, powerPoints, power, effect) VALUES ('Fire Punch', 'A fiery punch. May cause a burn.', 15, 75, NULL);
INSERT INTO Move(moveName, moveDescription, powerPoints, power, effect) VALUES ('Horn Drill', 'A one-hit KO drill attack.', 5, NULL, 'Inflicts exactly 65535 HP damage.');
INSERT INTO Move(moveName, moveDescription, powerPoints, power, effect) VALUES ('Horn Attack', 'An attack using a horn to jab.', 25, 65, NULL);
INSERT INTO Move(moveName, moveDescription, powerPoints, power, effect) VALUES ('Tackle', 'A full-body charge attack.', 35, 40, NULL);
INSERT INTO Move(moveName, moveDescription, powerPoints, power, effect) VALUES ('Gust', 'Whips up a strong gust of wind.', 35, 40, NULL);
INSERT INTO Move(moveName, moveDescription, powerPoints, power, effect) VALUES ('Whirlwind', 'Blows away the foe and ends battle.', 20, NULL, 'Ends battle.');
INSERT INTO Move(moveName, moveDescription, powerPoints, power, effect) VALUES ('Headbutt', 'An attack that may make foe flinch.', 15, 70, NULL);

INSERT INTO EntersInPokedex(speciesID, trainerID, encounterDate) VALUES (25, 1301, TO_DATE('1996-02-27', 'YYYY-MM-DD'));
INSERT INTO EntersInPokedex(speciesID, trainerID, encounterDate) VALUES (54, 1301, TO_DATE('1996-05-22', 'YYYY-MM-DD'));
INSERT INTO EntersInPokedex(speciesID, trainerID, encounterDate) VALUES (25, 6214, TO_DATE('1996-02-29', 'YYYY-MM-DD'));
INSERT INTO EntersInPokedex(speciesID, trainerID, encounterDate) VALUES (1, 6845, TO_DATE('2024-07-21', 'YYYY-MM-DD'));
INSERT INTO EntersInPokedex(speciesID, trainerID, encounterDate) VALUES (2, 220602, TO_DATE('2024-07-14', 'YYYY-MM-DD'));

INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (1, 'Grass');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (1, 'Poison');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (2, 'Grass');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (2, 'Poison');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (3, 'Grass');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (3, 'Poison');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (4, 'Fire');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (5, 'Fire');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (6, 'Fire');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (6, 'Flying');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (7, 'Water');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (8, 'Water');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (9, 'Water');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (10, 'Bug');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (11, 'Bug');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (12, 'Bug');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (12, 'Flying');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (13, 'Bug');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (13, 'Poison');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (14, 'Bug');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (14, 'Poison');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (15, 'Bug');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (15, 'Poison');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (16, 'Normal');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (16, 'Flying');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (17, 'Normal');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (17, 'Flying');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (18, 'Normal');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (18, 'Flying');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (19, 'Normal');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (20, 'Normal');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (21, 'Normal');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (21, 'Flying');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (22, 'Normal');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (22, 'Flying');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (23, 'Poison');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (24, 'Poison');
INSERT INTO HasSpeciesType(speciesID, typeName) VALUES (25, 'Electric');

INSERT INTO HasMove(pokemonID, speciesID, moveName, moveSlot) VALUES (25555, 25, 'Swords Dance', 1);
INSERT INTO HasMove(pokemonID, speciesID, moveName, moveSlot) VALUES (456456, 1, 'Whirlwind', 2);
INSERT INTO HasMove(pokemonID, speciesID, moveName, moveSlot) VALUES (25555, 25, 'Move', 2);
INSERT INTO HasMove(pokemonID, speciesID, moveName, moveSlot) VALUES (123123, 4, 'Fire Punch', 1);
INSERT INTO HasMove(pokemonID, speciesID, moveName, moveSlot) VALUES (101010, 23, 'Mega Punch', 3);
INSERT INTO HasMove(pokemonID, speciesID, moveName, moveSlot) VALUES (25555, 25, 'Pound', 3);
INSERT INTO HasMove(pokemonID, speciesID, moveName, moveSlot) VALUES (789789, 17, 'Swords Dance', 1);
INSERT INTO HasMove(pokemonID, speciesID, moveName, moveSlot) VALUES (25555, 25, 'Gust', 4);

INSERT INTO HasMoveType(moveName, typeName) VALUES ('Ice Punch', 'Ice');
INSERT INTO HasMoveType(moveName, typeName) VALUES ('Cut', 'Normal');
INSERT INTO HasMoveType(moveName, typeName) VALUES ('Swords Dance', 'Normal');
INSERT INTO HasMoveType(moveName, typeName) VALUES ('Pound', 'Normal');
INSERT INTO HasMoveType(moveName, typeName) VALUES ('Mega Punch', 'Normal');
INSERT INTO HasMoveType(moveName, typeName) VALUES ('Fire Punch', 'Fire');
INSERT INTO HasMoveType(moveName, typeName) VALUES ('Horn Drill', 'Normal');
INSERT INTO HasMoveType(moveName, typeName) VALUES ('Horn Attack', 'Normal');
INSERT INTO HasMoveType(moveName, typeName) VALUES ('Tackle', 'Normal');
INSERT INTO HasMoveType(moveName, typeName) VALUES ('Gust', 'Normal');
INSERT INTO HasMoveType(moveName, typeName) VALUES ('Whirlwind', 'Normal');
INSERT INTO HasMoveType(moveName, typeName) VALUES ('Headbutt', 'Normal');

INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Normal', 'Rock');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Normal', 'Ghost');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Normal', 'Fighting');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Fighting', 'Poison');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Fighting', 'Flying');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Fighting', 'Bug');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Fighting', 'Ghost');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Fighting', 'Psychic');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Flying', 'Ice');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Flying', 'Electric');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Flying', 'Rock');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Poison', 'Ground');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Poison', 'Poison');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Poison', 'Rock');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Poison', 'Ghost');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Ground', 'Water');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Ground', 'Bug');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Ground', 'Grass');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Ground', 'Ice');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Rock', 'Water');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Rock', 'Grass');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Rock', 'Fighting');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Rock', 'Ground');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Bug', 'Fire');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Bug', 'Poison');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Bug', 'Flying');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Bug', 'Rock');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Ghost', 'Ghost');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Fire', 'Water');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Fire', 'Fire');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Fire', 'Rock');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Fire', 'Dragon');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Water', 'Electric');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Water', 'Dragon');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Water', 'Grass');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Grass', 'Fire');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Grass', 'Ice');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Grass', 'Poison');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Grass', 'Flying');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Grass', 'Bug');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Grass', 'Grass');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Grass', 'Dragon');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Electric', 'Electric');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Electric', 'Grass');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Electric', 'Dragon');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Electric', 'Ground');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Psychic', 'Psychic');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Psychic', 'Bug');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Psychic', 'Ghost');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Ice', 'Fire');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Ice', 'Fighting');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Ice', 'Rock');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Ice', 'Water');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Ice', 'Ice');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Dragon', 'Dragon');
INSERT INTO EffectiveAgainst(strong_typeName, weak_typeName) VALUES ('Dragon', 'Ice');