//open miniDBGenerated
---WARNING--
//J'ai l'impression que l'on peut pas etendre plusieurs fois "card" et lancer le main sinon ca merde , a test avec EnchanT qui est commenté

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

/*
// un cout se compose de 6 couleurs
sig Cost{
green: Int,
red:Int,
blue: Int,
white: Int,
black:Int,
uncolored:Int,
amplifier:Bool
}

// une couleur se compose de 7 composantes
sig Color{
green: Bool,
red:Bool,
blue: Bool,
white: Bool,
black:Bool,
artifact:Bool,
colorless:Bool
}


// les couts en mana d'une couleur ne doivent pas dépasser 10
//la somme des couts des couleurs ne doivent pas dépasser 20
pred expectedCost{
all c:Cost |
c.green>-1  and
c.green<11  &&
c.red>0  &&
c.red<11 &&
c.blue>0  &&
c.blue<11  &&
c.white>0 &&
c.white<11 &&
c.black>0 &&
c.black<11  &&
c.uncolored>0 &&
c.uncolored<11

}
*/

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
	{game.deck1.deckValue - game.deck2.deckValue <10 && game.deck1.deckValue - game.deck2.deckValue >-1} or
	{game.deck2.deckValue - game.deck1.deckValue <10 && game.deck2.deckValue - game.deck1.deckValue >-1}
	}
}
// Two deck have to be of equals values.
fact SameDeckPrice {
one game:Game|
game.deck1.deckValue ={sum c:Game.deck1.cards | c.price} &&
game.deck2.deckValue ={sum c:Game.deck2.cards | c.price} &&
game.deck1.deckValue = game.deck2.deckValue 
}
	
	



------------------------------------FACT LIST TO CHOOSE----------------------


-----------------------GENERAL----------------------------------------
pred NumberTotalCard {
#{card:Card,deck:Deck|card in deck.cards}>5 &&#{card:Card,deck:Deck|card in deck.cards}<15
}
//number of card whiches
pred NumberTotalCardD1 {
#{card:Card,deck:Deck|card in Game.deck1.cards}>7&&#{card:Card,deck:Deck|card in Game.deck1.cards}<10
}
pred NumberTotalCardD2 {
#{card:Card,deck:Deck|card in Game.deck2.cards}>1&&#{card:Card,deck:Deck|card in Game.deck2.cards}<5
}


/*fact NumberType {
#{card:Card,deck:Deck|card in deck.cards &&card.type=Artifact}>1
&&#{card:Card,deck:Deck|card in deck.cards &&card.type=Artifact}<=3
//you need to choose your type and you can duplicate this one to choose for many type

}
*/
-----------------------CREATURE----------------------------------------
/*pred CostForAllCreature {
all deck:Deck |{
deck.cards.cost.green+
deck.cards.cost.red +
deck.cards.cost.white +
deck.cards.cost.blue +
deck.cards.cost.uncolored +
deck.cards.cost.black}<5
}*/


/*fact PowerForAllCreature{
all deck:Deck | deck.cards.type=Creature&&
deck.cards.power>1 && deck.cards.power<3
}

fact EndurenceForAllCreature {
all deck:Deck | deck.cards.type=Creature&&
deck.cards.endurence>1 && deck.cards.endurence<3
}
*/

/*fact NumberCreatureWithPower{
#{card:Card,deck:Deck|card in deck.cards &&card.power>1&&card.power<3}>1
}

fact NumberCreatureWithEndurence{
#{card:Card,deck:Deck|card in deck.cards &&card.endurence>1&&card.endurence<3}>1
}
*/
/*fact NumberCreatureWithPowerAndEndurance{
#{card:Card,deck:Deck|card in deck.cards &&card.power>1&&card.power<3
&&card.endurence>1&&card.endurence<3
}>1
}
*/

/*fact typeForAllCreature {
all deck:Deck | deck.cards.type=Creature&&deck.cards.creatureType = "Elf"
|| deck.cards.type=Creature&& deck.cards.creatureType = "Gobelin"
}
*/
/*
fact NumberCreatureType{
#{card:Card,deck:Deck|card in deck.cards &&card.creatureType = "Elf" ||
card in deck.cards &&card.creatureType = "Gobelin"
}>1
}
*/

/*fact NumberCreaturePowerEnduranceandType {
#{card:Card,deck:Deck|card in deck.cards &&card.power>1&&card.power<3
&&card.endurence>1&&card.endurence<3
&&card.creatureType = "Elf" || card.creatureType = "Gobelin"
}>1
}*/

-----------------------ENCHANTEMENT----------------------------------------


--------------pred for color----------------------------------

//Can be predicate
//only One color
pred OnlyOneColor {
all deck:Deck | deck.cards.color = Red//youi need to choose your color
}

//only two color

pred OnlyTwoColor {
all deck:Deck | deck.cards.color = Red ||
all deck:Deck | deck.cards.color = Blue //youi need to choose your color
}

//you can continue to have all the color you want




pred  empty {}


run NumberTotalCard for 11 Int,10 Card, exactly 2 Deck , 1 Game

