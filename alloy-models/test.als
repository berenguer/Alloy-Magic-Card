
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

sig Game{
deck1:Deck,
deck2:Deck
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
-----------------------FACT FOR CARDS------------------------------
/*
// une carte ne peut pas couter + de 20
fact maxCost{
all c:Cost|
{c.green+ c.red+c.uncolored+c.blue+c.green+c.black+c.white}<21

}

// les couts doivent apartenir à une carte
fact costIsBoundToCard{

 all cost1:Cost | one card1:Card | cost1 in card1.cost
}
// les colors doivent apartenir à une carte
fact colorIsBoundToCard{

 all color1:Color | one card1:Card | color1 in card1.color
}*/
// ----------------------------------------- DECLARATION ----------------------------------------

/*fact DeclareWithFact
{
 all card  :Creature | card.name=bob=> {
card.power=n3
card.cost=c5 }
}*/

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


//PAS REUSSI A LE FAIRE MAIS NECESSAIRE
fact price {
//sum x: e | ie sums the value of ie for each x in set e.
Deck.deckValue ={sum c:Card| c.price}
}
fact price1 {
//sum x: e | ie sums the value of ie for each x in set e.
Deck.deckValue =25
}


------------------------------------FACT LIST TO CHOOSE----------------------


-----------------------GENERAL----------------------------------------
//number of card whiches
/*fact NumberTotalCard {
#{card:Card,deck:Deck|card in deck.cards}>1&&#{card:Card,deck:Deck|card in deck.cards}<3
}*/


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


run  empty for exactly 1 Deck , 10 Card, 8 Int, 1 Game

