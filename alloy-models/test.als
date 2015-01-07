//open miniDBGenerated

-----------------------SIG------------------------------
sig Deck {
	cards: some Card,
deckValue:Int
}

abstract sig Card {
name: String,
color: Color,
cost: String,
sets: String,
type: Type,
creatureType : lone String,//lone coz if no creature dont exist
power: lone Int,//lone coz if no creature dont exist
endurence: lone Int,//lone coz if no creature dont exist
text: String,
price: Int
}

sig Game {
deck1: one Deck,
deck2: one Deck
}



-----------------------ENUM------------------------------
abstract sig Color {}
one sig ArtifactColor, Black, Blue, Colorless, Gold, Green, Red, White extends Color {}

abstract sig Type {}
one sig Artifact, Basic, Creature, Eaturecray, Enchant, Enchantment, Instant, Interrupt, Land, Legendary, Planeswalker, Scariest, Snow, Sorcery, Summon, Tribal, World extends Type {}


-----------------------FACT FOR SUMMON------------------------------
// every Card is owned by a Deck
fact
{
	all i_cards: Card | one deck: Deck | i_cards in deck.cards
}
fact
{
	all i_deck: Deck | one game: Game | i_deck in game.deck1 or i_deck in game.deck2
}
/*fact
{
	all i_cost: String |one card1:Card |i_cost in card1.cost
}*/
-----------------------FACT FOR CARDS------------------------------

// ----------------------------------------- DECLARATION ----------------------------------------



sig Card1 extends Card {} {
name = "ArcboundWorker"
color = Red
cost = "1"
sets ="DST DDF"
type = Artifact
power = 0
endurence = 0
text = "Modular 1 (This enters the battlefield with a +1/+1 counter on it. When it dies, you may put its +1/+1 counters on target artifact creature.)"
price = 1
}

sig Card2 extends Card {} {
name = "uglyBastard"
color = Red
cost = "1"
sets = "DST DDF"
type = Artifact
power = 0
endurence = 0
text = "Modular 1 (This enters the battlefield with a +1/+1 counter on it. When it dies, you may put its +1/+1 counters on target artifact creature.)"
price = 2
}

sig Card3 extends Card {} {
name = "uglyBastard"
color = Blue
cost = "1"
sets ="DST DDF"
type =Enchant
power = 0
endurence = 0
text = "Modular 1 (This enters the battlefield with a +1/+1 counter on it. When it dies, you may put its +1/+1 counters on target artifact creature.)"
price = 3
}

sig Creature1 extends Card {} {
name = "uglyBastard"
color = Blue
cost = "1"
sets ="DST DDF"
type =Creature
creatureType ="Elf"
power = 2
endurence = 2
text = "Modular 1 (This enters the battlefield with a +1/+1 counter on it. When it dies, you may put its +1/+1 counters on target artifact creature.)"
price = 4
}



sig Creature2 extends Card {} {
name = "uglyBastard"
color = Blue
cost = "1"
sets ="DST DDF"
type =Creature
creatureType ="Elf"
power = 1
endurence = 1
text = "Modular 1 (This enters the battlefield with a +1/+1 counter on it. When it dies, you may put its +1/+1 counters on target artifact creature.)"
price = 5
}


// A deck value is the sum of the values of their cards.
// Two deck have to be almost of equals values. NE MARCHE PAS ACTUELLEMENT
pred almostSameDeckPrice {
one game:Game|
game.deck1.deckValue ={sum c:Game.deck1.cards | c.price} &&
game.deck2.deckValue ={sum c:Game.deck2.cards | c.price} &&
	{
	{one game:Game| game.deck1.deckValue - game.deck2.deckValue <10 && game.deck1.deckValue - game.deck2.deckValue >-1} or
	{one game:Game| game.deck2.deckValue - game.deck1.deckValue <10 && game.deck2.deckValue - game.deck1.deckValue >-1}
	}
}
// Two deck have to be of equals values.
fact SameDeckPrice {
one game:Game|
game.deck1.deckValue ={sum c:Game.deck1.cards | c.price} &&
game.deck2.deckValue ={sum c:Game.deck2.cards | c.price} &&
game.deck1.deckValue = game.deck2.deckValue 
}
	
	



------------------------------------FACT PRED TO CHOOSE----------------------


-----------------------GENERAL----------------------------------------

//number of card whiches
pred  BeetweenNumberTotalCardD [min:Int , max:Int] {
#{card:Card,game:Game|card in game.deck1.cards}>=min&&#{card:Card,game:Game|card in game.deck1.cards}<=max
}

pred AtLeastCardD1[min:Int] {
#{card:Card,game:Game|card in game.deck1.cards}>=min
}
pred AtMostCardD1[min:Int] {
#{card:Card,game:Game|card in game.deck1.cards}<=min
}

pred ExactlyCardD1[min:Int] {
#{card:Card,game:Game|card in game.deck1.cards}=min
}





pred BeetweenNumberTotalCardD2[min:Int , max:Int] {
#{card:Card,game:Game|card in game.deck2.cards}>=min&&#{card:Card,game:Game|card in game.deck2.cards}<=max
}

pred AtLeastCardD2[min:Int] {
#{card:Card,game:Game|card in game.deck2.cards}>=min
}
pred AtMostCardD2[min:Int] {
#{card:Card,game:Game|card in game.deck2.cards}<=min
}

pred ExactlyCardD2[min:Int] {
#{card:Card,game:Game|card in game.deck2.cards}=min
}


------------------------FACT FOR 1ST DECK-------------------------------------------



pred NumberType[type1:Type,min:Int,max:Int] {
#{card:Card,game:Game|card in game.deck1.cards &&card.type=type1}>=min
&&#{card:Card,game:Game|card in game.deck1.cards &&card.type=type1}<=max

}


-----------------------CREATURE----------------------------------------

-----------Power-------------------

pred PowerForAllCreatureD1[myPowerMin:Int ,myPowerMax:Int]{
all  game:Game| game.deck1.cards.type=Creature&&
game.deck1.cards.power>=myPowerMin && game.deck1.cards.power<=myPowerMax
}

pred ExactNumberCreatureWithPowerD1[myPowerMin:Int ,myPowerMax:Int,number:Int]{
#{card:Card,game:Game|card in game.deck1.cards &&card.power>=myPowerMin&&card.power<=myPowerMax}=number
}

pred AtLeastCreatureWithPowerD1[myPowerMin:Int ,myPowerMax:Int,number:Int]{
#{card:Card,game:Game|card in game.deck1.cards &&card.power>=myPowerMin&&card.power<=myPowerMax}>=number
}

pred AtMostCreatureWithPowerD1[myPowerMin:Int ,myPowerMax:Int,number:Int]{
#{card:Card,game:Game|card in game.deck1.cards &&card.power>=myPowerMin&&card.power<=myPowerMax}<=number
}



-----------Endurence-------------------
pred EndurenceForAllCreatureD1[myEnduMin:Int ,myEnduMax:Int] {
all  game:Game| game.deck1.cards.type=Creature&&
game.deck1.cards.endurence>=myEnduMin && game.deck1.cards.endurence<=myEnduMax
}

pred ExactNumberCreatureWithEndurenceD1[myEnduMin:Int ,myEnduMax:Int,number:Int] {
#{card:Card,game:Game|card in game.deck1.cards &&card.endurence>=myEnduMin&&card.endurence<=myEnduMax}=number
}

pred AtLeastCreatureWithEndurenceD1[myEnduMin:Int ,myEnduMax:Int,number:Int] {
#{card:Card,game:Game|card in game.deck1.cards &&card.endurence>=myEnduMin&&card.endurence<=myEnduMax}>=number
}

pred AtMostCreatureWithEndurenceD1[myEnduMin:Int ,myEnduMax:Int,number:Int] {
#{card:Card,game:Game|card in game.deck1.cards &&card.endurence>=myEnduMin&&card.endurence<=myEnduMax}<=number
}

-----------Power and Endurance-------------------
pred ExactNumberCreatureWithPowerAndEnduranceD1[myPowerMin:Int ,myPowerMax:Int,myEnduMin:Int,myEnduMax:Int,number:Int]
{
#{card:Card,game:Game|card in game.deck1.cards &&card.power>=myPowerMin&&card.power<=myPowerMax
&&card.endurence>=myEnduMin&&card.endurence<=myEnduMax
}=number
}

pred AtLeastCreatureWithPowerAndEndurance[myPowerMin:Int ,myPowerMax:Int,myEnduMin:Int,myEnduMax:Int,number:Int]
{
#{card:Card,game:Game|card in game.deck1.cards &&card.power>=myPowerMin&&card.power<=myPowerMax
&&card.endurence>=myEnduMin&&card.endurence<=myEnduMax
}>=number
}

pred AtMostCreatureWithPowerAndEnduranceD1[myPowerMin:Int ,myPowerMax:Int,myEnduMin:Int,myEnduMax:Int,number:Int]
{
#{card:Card,game:Game|card in game.deck1.cards &&card.power>=myPowerMin&&card.power<=myPowerMax
&&card.endurence>=myEnduMin&&card.endurence<=myEnduMax
}<=number
}
-----------type--------------------
pred TypeForAllCreatureD1  [myType1:String,myType2:String]{
all game:Game | game.deck1.cards.type=Creature&&game.deck1.cards.creatureType = myType1
|| game.deck1.cards.type=Creature&& game.deck1.cards.creatureType = myType2
}


pred ExactNumberCreatureTypeD1 [myType1:String,myType2:String,number:Int]{
#{card:Card,game:Game|card in game.deck1.cards &&card.creatureType = myType1 ||
card in game.deck1.cards &&card.creatureType = myType2
}=number
}


pred AtLeastCreatureTypeD1 [myType1:String,myType2:String,number:Int]{
#{card:Card,game:Game|card in game.deck1.cards &&card.creatureType = myType1 ||
card in game.deck1.cards &&card.creatureType = myType2
}>=number
}

pred AtMostCreatureTypeD1 [myType1:String,myType2:String,number:Int]{
#{card:Card,game:Game|card in game.deck1.cards &&card.creatureType = myType1 ||
card in game.deck1.cards &&card.creatureType = myType2
}>=number
}


-----------Power Endurance and Type-------------------

pred PowerEnduranceAndTypeForAllCreatureD1[myPowerMin:Int ,myPowerMax:Int,myEnduMin:Int,myEnduMax:Int,myType1:String,myType2:String]
 {
all card:Card,game:Game|card in game.deck1.cards &&card.power>=myPowerMin&&card.power<=myPowerMax
&&card.endurence>=myEnduMin&&card.endurence<=myEnduMax
&&card.creatureType =  myType1|| card.creatureType =  myType2
}


pred ExactNumberCreaturePowerEnduranceandTypeD1[myPowerMin:Int ,myPowerMax:Int,myEnduMin:Int,myEnduMax:Int,myType1:String,myType2:String,number:Int]
 {
#{card:Card,game:Game|card in game.deck1.cards &&card.power>=myPowerMin&&card.power<=myPowerMax
&&card.endurence>=myEnduMin&&card.endurence<=myEnduMax
&&card.creatureType =  myType1|| card.creatureType =  myType2
}=number
}


pred AtLeastCreaturePowerEnduranceandTypeD1[myPowerMin:Int ,myPowerMax:Int,myEnduMin:Int,myEnduMax:Int,myType1:String,myType2:String,number:Int]
 {
#{card:Card,game:Game|card in game.deck1.cards &&card.power>=myPowerMin&&card.power<=myPowerMax
&&card.endurence>=myEnduMin&&card.endurence<=myEnduMax
&&card.creatureType =  myType1|| card.creatureType =  myType2
}>=number
}

pred AtMostNumberCreaturePowerEnduranceandTypeD1[myPowerMin:Int ,myPowerMax:Int,myEnduMin:Int,myEnduMax:Int,myType1:String,myType2:String,number:Int]
 {
#{card:Card,game:Game|card in game.deck1.cards &&card.power>=myPowerMin&&card.power<=myPowerMax
&&card.endurence>=myEnduMin&&card.endurence<=myEnduMax
&&card.creatureType =  myType1|| card.creatureType =  myType2
}<=number
}


-----------------------COLOR----------------------------------------


//only One color
pred OnlyOneColorD1[myColor:Color] {
all game:Game | game.deck1.cards.color = myColor
}

//only two color

pred OnlyTwoColorD1[myColor1:Color,myColor2:Color] {
all  game:Game | game.deck1.cards.color = myColor1||
all  game:Game | game.deck1.cards.color = myColor2 && 
#{game:Game |game.deck1.cards.color = myColor1 }>=1&&
#{game:Game |game.deck1.cards.color = myColor2} >=1
}

//you can continue to have all the color you want




pred  empty {}


run { BeetweenNumberTotalCardD[2,10] and OnlyOneColor[Red] } for 11 Int,10 Card, exactly 2 Deck , 1 Game

