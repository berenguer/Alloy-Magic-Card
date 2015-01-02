sig Deck {
	cards: some Card
}

abstract sig Card {
	name: String,
	color: Color,
	cost: String,
	Sets: String,
	type: Type,
	power: Int,
	endurence: Int,
	text: String,
	price: Int
}

// every Card is owned by a Deck
fact
{
	all i_cards: Card | one deck: Deck | i_cards in deck.cards
}



// ------------- types ----------------
abstract sig Type {}
one sig Artifact, Basic, Creature, Eaturecray, Enchant, Enchantment, Instant, Interrupt, Land, Legendary, Planeswalker, Scariest, Snow, Sorcery, Summon, Tribal, World extends Type {}

// ------------ colors ----------------
abstract sig Color {}
one sig ArtifactColor, Black, Blue, Colorless, Gold, Green, Red, White extends Color {}



// ----------------------------------------- DECLARATION ----------------------------------------
sig Card1 extends Card {} {
	name = "ArcboundWorker"
	color = ArtifactColor
	cost = "1"
	Sets = "DST, DDF"
	type = Artifact
	power = 0
	endurence = 0
	text = "Modular 1 (This enters the battlefield with a +1/+1 counter on it. When it dies, you may put its +1/+1 counters on target artifact creature.)"
	price = 2
	
}

sig Card2 extends Card {} {
	name = "uglyBastard"
	color = ArtifactColor
	cost = "1"
	Sets = "DST, DDF"
	type = Artifact
	power = 0
	endurence = 0
	text = "Modular 1 (This enters the battlefield with a +1/+1 counter on it. When it dies, you may put its +1/+1 counters on target artifact creature.)"
	price = 2
	
}

pred  OnlyArtifact {
all deck:Deck | deck.cards.color = ArtifactColor
}

run OnlyArtifact for 1 Deck, 2 Card
