sig Deck {
	cards: some Card
}

// -------------------------------------------------------------------------------
sig Card {
	name: Name,
	color: set AvailableColors,
	sets: set AvailableSets
}

// every Card is owned by a Deck
fact
{
	all i_cards: Card | one deck: Deck | i_cards in deck.cards
}

// -------------------------------------------------------------------------------
enum Name {ArcboundWorker, ArcheryTraining, JawboneSkulkin}
// every Name instanciated is owned by a Card
fact
{
	all i_name: Name | one card: Card | i_name in card.name

}

// -------------------------------------------------------------------------------
enum AvailableColors {green, blue, white, red, black}

// -------------------------------------------------------------------------------
enum AvailableSets {EVE, UDS, DST, DDF}
// every Sets instanciated is owned by a Card
fact
{
	all i_sets: AvailableSets | one card: Card | i_sets in card.sets

}

pred Empty {}

// try to instanciate 3 cards
run Empty for exactly 2 Deck, 4 Card


