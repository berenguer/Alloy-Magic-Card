------------------------------------MANQUE LA PARTIE COULEUR DE MAX D-----------
---WARNING--
//J'ai l'impression que l'on peut pas etendre plusieurs fois "card" et lancer le main sinon ca merde , a test avec EnchanT qui est commenté

-----------------------SIG------------------------------
sig Deck {
	cards: some Card
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
price = 2
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
price = 2
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
price = 2
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
price = 2
}


//PAS REUSSI A LE FAIRE MAIS NECESSAIRE
fact price {
//sum x: e | ie sums the value of ie for each x in set e.  
}

------------------------------------FACT LIST TO CHOOSE----------------------


-----------------------GENERAL----------------------------------------
//number of card whiches
fact NumberTotalCard {
#{card:Card,deck:Deck|card in deck.cards}>1&&#{card:Card,deck:Deck|card in deck.cards}<3
}


/*fact NumberType {
#{card:Card,deck:Deck|card in deck.cards &&card.type=Artifact}>1
&&#{card:Card,deck:Deck|card in deck.cards &&card.type=Artifact}<=3
//you need to choose your type and you can duplicate this one to choose for many type

}
*/
-----------------------CREATURE----------------------------------------
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

fact NumberCreaturePowerEnduranceandType {
#{card:Card,deck:Deck|card in deck.cards &&card.power>1&&card.power<3
&&card.endurence>1&&card.endurence<3
&&card.creatureType = "Elf" || card.creatureType = "Gobelin"
}>1
}

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


run  empty for exactly 1 Deck , 3 Card

