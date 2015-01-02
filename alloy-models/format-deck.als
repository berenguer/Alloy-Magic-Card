sig Deck {
	cards: some Card
}

abstract sig Card {}

// every Card is owned by a Deck
fact
{
	all i_cards: Card | one deck: Deck | i_cards in deck.cards
}

// ----- creatures -----
abstract sig Creature extends Card {}

sig Card1 extends Creature {
	name = ArcboundWorker,
	// valeur attaque/defense
	power = n1,
	// prix de la carte
	cost = c5
}

sig Card2 extends Creature {
	name = ArcheryTraining,
	power = n1,
	cost = c2
}

sig Card3 extends Creature {
	name = JawboneSkulkin,
	power = n3,
	cost = c2
}

enum Name {ArcboundWorker, ArcheryTraining, JawboneSkulkin}
// valeur attaque/defense
enum Power {n1, n2, n3}
// prix de la carte
enum Cost {c1, c2, c3, c4, c5}

pred Empty {}

run Empty for exactly 1 Deck, 3 Card
