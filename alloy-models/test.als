open database_mini_generated

-----------------------SIG------------------------------
sig Deck {
	cards: some Card,
deckValue:Int
}



sig Game {
deck1: one Deck,
deck2: one Deck
}

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

-------------D1--------------------
pred  BeetweenNumberTotalCardD1 [min:Int , max:Int] {
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



-------------D2--------------------
pred BeetweenNumberTotalCardD2[min:Int , max:Int] {
#{card:Card,game:Game|card in game.deck2.cards}>=min&&#{card:Card,game:Game|card in game.deck2.cards}<=max
}

pred AtLeastCardD2[min:Int] {
#{card:Card,game:Game|card in game.deck2.cards}>=min
}
pred AtMostCardD2[max:Int] {
#{card:Card,game:Game|card in game.deck2.cards}<=max
}

pred ExactCardD2[min:Int] {
#{card:Card,game:Game|card in game.deck2.cards}=min
}


------------------------FACT FOR 1ST DECK-------------------------------------------



pred BeetweenNumberTypeD1[type1:Type,min:Int,max:Int] {
#{card:Card,game:Game|card in game.deck1.cards &&card.type=type1}>=min
&&#{card:Card,game:Game|card in game.deck1.cards &&card.type=type1}<=max
}

pred ExactNumberTypeD1[type1:Type,number:Int] {
#{card:Card,game:Game|card in game.deck1.cards &&card.type=type1}=number
}


pred AtLeastNumberTypeD1[type1:Type,number:Int] {
#{card:Card,game:Game|card in game.deck1.cards &&card.type=type1}>=number
}

pred AtMostNumberTypeD1[type1:Type,number:Int] {
#{card:Card,game:Game|card in game.deck1.cards &&card.type=type1}<=number
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

pred BeetweenCreatureWithPowerD1[myPowerMin:Int ,myPowerMax:Int,min:Int,max:Int]{
#{card:Card,game:Game|card in game.deck1.cards &&card.power>=myPowerMin&&card.power<=myPowerMax}>= min
&& #{card:Card,game:Game|card in game.deck1.cards &&card.power>=myPowerMin&&card.power<=myPowerMax}<=max
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

pred AtMostCreatureWithEndurenceD1[myEnduMin:Int ,myEnduMax:Int,min:Int ,max:Int] {
#{card:Card,game:Game|card in game.deck1.cards &&card.endurence>=myEnduMin&&card.endurence<=myEnduMax}<=min
&&#{card:Card,game:Game|card in game.deck1.cards &&card.endurence>=myEnduMin&&card.endurence<=myEnduMax}<=max
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


pred BeetweenCreatureWithPowerAndEnduranceD1[myPowerMin:Int ,myPowerMax:Int,myEnduMin:Int,myEnduMax:Int,min:Int,max:Int]
{
#{card:Card,game:Game|card in game.deck1.cards &&card.power>=myPowerMin&&card.power<=myPowerMax
&&card.endurence>=myEnduMin&&card.endurence<=myEnduMax
}>=min
&&#{card:Card,game:Game|card in game.deck1.cards &&card.power>=myPowerMin&&card.power<=myPowerMax
&&card.endurence>=myEnduMin&&card.endurence<=myEnduMax
}<=max
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


pred BeetweenCreatureTypeD1 [myType1:String,myType2:String,min:Int,max:Int]{
#{card:Card,game:Game|card in game.deck1.cards &&card.creatureType = myType1 ||
card in game.deck1.cards &&card.creatureType = myType2
}>=min
&&#{card:Card,game:Game|card in game.deck1.cards &&card.creatureType = myType1 ||
card in game.deck1.cards &&card.creatureType = myType2
}<=max
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


pred BeetweenCreaturePowerEnduranceandTypeD1[myPowerMin:Int ,myPowerMax:Int,myEnduMin:Int,myEnduMax:Int,myType1:String,myType2:String,min:Int,max:Int]
 {
#{card:Card,game:Game|card in game.deck1.cards &&card.power>=myPowerMin&&card.power<=myPowerMax
&&card.endurence>=myEnduMin&&card.endurence<=myEnduMax
&&card.creatureType =  myType1|| card.creatureType =  myType2
}>=min
&&#{card:Card,game:Game|card in game.deck1.cards &&card.power>=myPowerMin&&card.power<=myPowerMax
&&card.endurence>=myEnduMin&&card.endurence<=myEnduMax
&&card.creatureType =  myType1|| card.creatureType =  myType2
}<=max
}

-----------------------COLOR----------------------------------------


//only One color
pred OnlyOneColorD1[myColor:Color] {
all game:Game | game.deck1.cards.color = myColor
}

//only two color

pred OnlyTwoColorD1[myColor1:Color,myColor2:Color] {
#{game:Game ,card:Card |card in game.deck1.cards and card.color = myColor1 }>=1&&
#{game:Game ,card:Card |card in game.deck1.cards and card.color = myColor2} >=1
}




run { BeetweenNumberTotalCardD1[1,10] and OnlyTwoColorD1[Red,Blue] } for 10 Int,10 Card, exactly 2 Deck , 1 Game

