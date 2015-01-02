sig Deck {
	cards: some Card
}

abstract sig Card {
	name: String,
	color: Color,
	cost: String,
	sets: String,
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

sig Card0 extends Card {} {
	name = "KamiofthePalaceFields"
	color = White
	cost = "5W"
	sets = "CHK"
	type = Creature
	power = 3
	endurence = 2
	text = "Flying, first strikeSoulshift 5 (When this creature dies, you may return target Spirit card with converted mana cost 5 or less from your graveyard to your hand.)"
	price = 99
}
sig Card1 extends Card {} {
	name = "ArachnusSpinner"
	color = Green
	cost = "5G"
	sets = "M12"
	type = Creature
	power = 5
	endurence = 7
	text = "Reach (This creature can block creatures with flying.)Tap an untapped Spider you control: Search your graveyard and/or library for a card named Arachnus Web and put it onto the battlefield attached to target creature. If you search your library this way, shuffle it."
	price = 36
}
sig Card2 extends Card {} {
	name = "LoxodonWarhammer"
	color = ArtifactColor
	cost = "3"
	sets = "MRD, 9ED, 10E, PLN, DDG"
	type = Artifact
	power = 0
	endurence = 0
	text = "Equipped creature gets +3/+0 and has trample and lifelink. (If the creature would assign enough damage to its blockers to destroy them, you may have it assign the rest of its damage to defending player or planeswalker. Damage dealt by the creature also causes its controller to gain that much life.)Equip {3} ({3}: Attach to target creature you control. Equip only as a sorcery.)"
	price = 4
}
sig Card3 extends Card {} {
	name = "LightningCoils"
	color = ArtifactColor
	cost = "3"
	sets = "MRD"
	type = Artifact
	power = 0
	endurence = 0
	text = "Whenever a nontoken creature you control dies, put a charge counter on Lightning Coils.At the beginning of your upkeep, if Lightning Coils has five or more charge counters on it, remove all of them from it and put that many 3/1 red Elemental creature tokens with haste onto the battlefield. Exile them at the beginning of the next end step."
	price = 40
}
sig Card4 extends Card {} {
	name = "Regeneration"
	color = Green
	cost = "1G"
	sets = "LEA, LEB, 2ED, 3ED, 4ED, ICE, MIR, 5ED, 6ED, 7ED, 8ED, 9ED, 10E"
	type = Enchantment
	power = 0
	endurence = 0
	text = "Enchant creature (Target a creature as you cast this. This card enters the battlefield attached to that creature.){G}: Regenerate enchanted creature. (The next time that creature would be destroyed this turn, it isn't. Instead tap it, remove all damage from it, and remove it from combat.)"
	price = 93
}
sig Card5 extends Card {} {
	name = "OrcishMechanics"
	color = Red
	cost = "2R"
	sets = "ATQ, MED"
	type = Creature
	power = 1
	endurence = 1
	text = "{T}, Sacrifice an artifact: Orcish Mechanics deals 2 damage to target creature or player."
	price = 87
}
sig Card6 extends Card {} {
	name = "Tel-JiladArchers"
	color = Green
	cost = "4G"
	sets = "MRD"
	type = Creature
	power = 2
	endurence = 4
	text = "Protection from artifacts; reach (This creature can block creatures with flying.)"
	price = 69
}
sig Card7 extends Card {} {
	name = "SpellContortion"
	color = Blue
	cost = "2U"
	sets = "WWK"
	type = Instant
	power = 0
	endurence = 0
	text = "Multikicker {1}{U} (You may pay an additional {1}{U} any number of times as you cast this spell.)Counter target spell unless its controller pays {2}. Draw a card for each time Spell Contortion was kicked."
	price = 16
}
sig Card8 extends Card {} {
	name = "HowlingWolf"
	color = Green
	cost = "2GG"
	sets = "MMQ"
	type = Creature
	power = 2
	endurence = 2
	text = "When Howling Wolf enters the battlefield, you may search your library for up to three cards named Howling Wolf, reveal them, and put them into your hand. If you do, shuffle your library."
	price = 45
}
sig Card9 extends Card {} {
	name = "Wishmonger"
	color = White
	cost = "3W"
	sets = "MMQ"
	type = Creature
	power = 3
	endurence = 3
	text = "{2}: Target creature gains protection from the color of its controller's choice until end of turn. Any player may activate this ability."
	price = 65
}
sig Card10 extends Card {} {
	name = "LightmineField"
	color = White
	cost = "2WW"
	sets = "ROE"
	type = Enchantment
	power = 0
	endurence = 0
	text = "Whenever one or more creatures attack, Lightmine Field deals damage to each of those creatures equal to the number of attacking creatures."
	price = 8
}
sig Card11 extends Card {} {
	name = "LucentLiminid"
	color = White
	cost = "3WW"
	sets = "FUT"
	type = Enchantment
	power = 3
	endurence = 3
	text = "Flying"
	price = 70
}
sig Card12 extends Card {} {
	name = "IncreasingConfusion"
	color = Blue
	cost = "XU"
	sets = "DKA"
	type = Sorcery
	power = 0
	endurence = 0
	text = "Target player puts the top X cards of his or her library into his or her graveyard. If Increasing Confusion was cast from a graveyard, that player puts twice that many cards into his or her graveyard instead.Flashback {X}{U} (You may cast this card from your graveyard for its flashback cost. Then exile it.)"
	price = 79
}
sig Card13 extends Card {} {
	name = "HomicidalSeclusion"
	color = Black
	cost = "4B"
	sets = "AVR"
	type = Enchantment
	power = 0
	endurence = 0
	text = "As long as you control exactly one creature, that creature gets +3/+1 and has lifelink."
	price = 65
}
sig Card14 extends Card {} {
	name = "WirewoodGuardian"
	color = Green
	cost = "5GG"
	sets = "SCG"
	type = Creature
	power = 6
	endurence = 6
	text = "Forestcycling {2} ({2}, Discard this card: Search your library for a Forest card, reveal it, and put it into your hand. Then shuffle your library.)"
	price = 43
}
sig Card15 extends Card {} {
	name = "ImpulsiveManeuvers"
	color = Red
	cost = "2RR"
	sets = "ODY"
	type = Enchantment
	power = 0
	endurence = 0
	text = "Whenever a creature attacks, flip a coin. If you win the flip, the next time that creature would deal combat damage this turn, it deals double that damage instead. If you lose the flip, the next time that creature would deal combat damage this turn, prevent that damage."
	price = 52
}
sig Card16 extends Card {} {
	name = "HulkingCyclops"
	color = Red
	cost = "3RR"
	sets = "VIS, POR, 6ED, 8ED"
	type = Creature
	power = 5
	endurence = 5
	text = "Hulking Cyclops can't block."
	price = 60
}
sig Card17 extends Card {} {
	name = "Humility"
	color = White
	cost = "2WW"
	sets = "TMP"
	type = Enchantment
	power = 0
	endurence = 0
	text = "All creatures lose all abilities and are 1/1."
	price = 69
}
sig Card18 extends Card {} {
	name = "OrcishCannoneers"
	color = Red
	cost = "1RR"
	sets = "ICE, ME2"
	type = Creature
	power = 1
	endurence = 3
	text = "{T}: Orcish Cannoneers deals 2 damage to target creature or player and 3 damage to you."
	price = 79
}
sig Card19 extends Card {} {
	name = "IlluminatedFolio"
	color = ArtifactColor
	cost = "5"
	sets = "SHM"
	type = Artifact
	power = 0
	endurence = 0
	text = "{1}, {T}, Reveal two cards from your hand that share a color: Draw a card."
	price = 94
}
sig Card20 extends Card {} {
	name = "ArcanistheOmnipotent"
	color = Blue
	cost = "3UUU"
	sets = "ONS, 10E"
	type = Legendary
	power = 3
	endurence = 4
	text = "{T}: Draw three cards.{2}{U}{U}: Return Arcanis the Omnipotent to its owner's hand."
	price = 9
}
sig Card21 extends Card {} {
	name = "HolyStrength"
	color = White
	cost = "W"
	sets = "LEA, LEB, 2ED, 3ED, 4ED, 5ED, 7ED, 8ED, 9ED, 10E, M10, M11"
	type = Enchantment
	power = 0
	endurence = 0
	text = "Enchant creatureEnchanted creature gets +1/+2."
	price = 92
}
sig Card22 extends Card {} {
	name = "Winter'sNight"
	color = Gold
	cost = "RGW"
	sets = "ALL, ME2"
	type = World
	power = 0
	endurence = 0
	text = "Whenever a player taps a snow land for mana, that player adds one mana to his or her mana pool of any type that land produced. That land doesn't untap during its controller's next untap step."
	price = 66
}
sig Card23 extends Card {} {
	name = "ArchwingDragon"
	color = Red
	cost = "2RR"
	sets = "AVR"
	type = Creature
	power = 4
	endurence = 4
	text = "Flying, hasteAt the beginning of the end step, return Archwing Dragon to its owner's hand."
	price = 12
}
sig Card24 extends Card {} {
	name = "InverttheSkies"
	color = Gold
	cost = "3(G/U)"
	sets = "EVE"
	type = Instant
	power = 0
	endurence = 0
	text = "Creatures your opponents control lose flying until end of turn if {G} was spent to cast Invert the Skies, and creatures you control gain flying until end of turn if {U} was spent to cast it. (Do both if {G}{U} was spent.)"
	price = 94
}
sig Card25 extends Card {} {
	name = "ZombieGoliath"
	color = Black
	cost = "4B"
	sets = "M10, M12"
	type = Creature
	power = 4
	endurence = 3
	text = "	"
	price = 23
}
sig Card26 extends Card {} {
	name = "ApprenticeWizard"
	color = Blue
	cost = "1UU"
	sets = "DRK, 4ED, MED"
	type = Creature
	power = 0
	endurence = 1
	text = "{U}, {T}: Add {3} to your mana pool."
	price = 67
}
sig Card27 extends Card {} {
	name = "HondenofNight'sReach"
	color = Black
	cost = "3B"
	sets = "CHK"
	type = Legendary
	power = 0
	endurence = 0
	text = "At the beginning of your upkeep, target opponent discards a card for each Shrine you control."
	price = 72
}
sig Card28 extends Card {} {
	name = "ArcboundLancer"
	color = ArtifactColor
	cost = "7"
	sets = "DST"
	type = Artifact
	power = 0
	endurence = 0
	text = "First strikeModular 4 (This enters the battlefield with four +1/+1 counters on it. When it dies, you may put its +1/+1 counters on target artifact creature.)"
	price = 95
}
sig Card29 extends Card {} {
	name = "Tel-JiladOutrider"
	color = Green
	cost = "3G"
	sets = "DST"
	type = Creature
	power = 3
	endurence = 1
	text = "Protection from artifacts"
	price = 61
}
sig Card30 extends Card {} {
	name = "ArcticMerfolk"
	color = Blue
	cost = "1U"
	sets = "PLS"
	type = Creature
	power = 1
	endurence = 1
	text = "Kicker—Return a creature you control to its owner's hand. (You may return a creature you control to its owner's hand in addition to any other costs as you cast this spell.)If Arctic Merfolk was kicked, it enters the battlefield with a +1/+1 counter on it."
	price = 5
}
sig Card31 extends Card {} {
	name = "IncendiaryCommand"
	color = Red
	cost = "3RR"
	sets = "LRW"
	type = Sorcery
	power = 0
	endurence = 0
	text = "Choose two — Incendiary Command deals 4 damage to target player; or Incendiary Command deals 2 damage to each creature; or destroy target nonbasic land; or each player discards all the cards in his or her hand, then draws that many cards."
	price = 55
}
sig Card32 extends Card {} {
	name = "HollowSpecter"
	color = Black
	cost = "1BB"
	sets = "LGN"
	type = Creature
	power = 2
	endurence = 2
	text = "FlyingWhenever Hollow Specter deals combat damage to a player, you may pay {X}. If you do, that player reveals X cards from his or her hand and you choose one of them. That player discards that card."
	price = 90
}
sig Card33 extends Card {} {
	name = "JawboneSkulkin"
	color = ArtifactColor
	cost = "1"
	sets = "EVE"
	type = Artifact
	power = 1
	endurence = 1
	text = "{2}: Target red creature gains haste until end of turn."
	price = 78
}
sig Card34 extends Card {} {
	name = "IllusionaryTerrain"
	color = Blue
	cost = "UU"
	sets = "ICE"
	type = Enchantment
	power = 0
	endurence = 0
	text = "Cumulative upkeep {2} (At the beginning of your upkeep, put an age counter on this permanent, then sacrifice it unless you pay its upkeep cost for each age counter on it.)As Illusionary Terrain enters the battlefield, choose two basic land types.Basic lands of the first chosen type are the second chosen type."
	price = 6
}
sig Card35 extends Card {} {
	name = "LightningHounds"
	color = Red
	cost = "2RR"
	sets = "MMQ"
	type = Creature
	power = 3
	endurence = 2
	text = "First strike"
	price = 84
}
sig Card36 extends Card {} {
	name = "InvigoratingBoon"
	color = Green
	cost = "1G"
	sets = "ONS"
	type = Enchantment
	power = 0
	endurence = 0
	text = "Whenever a player cycles a card, you may put a +1/+1 counter on target creature."
	price = 96
}
sig Card37 extends Card {} {
	name = "VillainousOgre"
	color = Black
	cost = "2B"
	sets = "CHK"
	type = Creature
	power = 3
	endurence = 2
	text = "Villainous Ogre can't block.As long as you control a Demon, Villainous Ogre has '{B}: Regenerate Villainous Ogre.'"
	price = 60
}
sig Card38 extends Card {} {
	name = "SpellbaneCentaur"
	color = Green
	cost = "2G"
	sets = "ODY"
	type = Creature
	power = 3
	endurence = 2
	text = "Creatures you control can't be the targets of blue spells or abilities from blue sources."
	price = 7
}
sig Card39 extends Card {} {
	name = "LibraryofLeng"
	color = ArtifactColor
	cost = "1"
	sets = "LEA, LEB, 2ED, 3ED, 4ED, 5ED"
	type = Artifact
	power = 0
	endurence = 0
	text = "You have no maximum hand size.If an effect causes you to discard a card, discard it, but you may put it on top of your library instead of into your graveyard."
	price = 96
}
sig Card40 extends Card {} {
	name = "Karona,FalseGod"
	color = Gold
	cost = "1WUBRG"
	sets = "SCG"
	type = Legendary
	power = 5
	endurence = 5
	text = "HasteAt the beginning of each player's upkeep, that player untaps Karona, False God and gains control of it.Whenever Karona attacks, creatures of the creature type of your choice get +3/+3 until end of turn."
	price = 29
}
sig Card41 extends Card {} {
	name = "IlluminatedWings"
	color = Blue
	cost = "1U"
	sets = "UDS"
	type = Enchantment
	power = 0
	endurence = 0
	text = "Enchant creatureEnchanted creature has flying.{2}, Sacrifice Illuminated Wings: Draw a card."
	price = 55
}
sig Card42 extends Card {} {
	name = "Jenara,AsuraofWar"
	color = Gold
	cost = "GWU"
	sets = "ARB"
	type = Legendary
	power = 3
	endurence = 3
	text = "Flying{1}{W}: Put a +1/+1 counter on Jenara, Asura of War."
	price = 92
}
sig Card43 extends Card {} {
	name = "ArcboundWorker"
	color = ArtifactColor
	cost = "1"
	sets = "DST, DDF"
	type = Artifact
	power = 0
	endurence = 0
	text = "Modular 1 (This enters the battlefield with a +1/+1 counter on it. When it dies, you may put its +1/+1 counters on target artifact creature.)"
	price = 66
}
sig Card44 extends Card {} {
	name = "Reinforcements"
	color = White
	cost = "W"
	sets = "ALL, ME2"
	type = Instant
	power = 0
	endurence = 0
	text = "Put up to three target creature cards from your graveyard on top of your library."
	price = 72
}
sig Card45 extends Card {} {
	name = "VineTrellis"
	color = Green
	cost = "1G"
	sets = "MMQ, 8ED, DDD"
	type = Creature
	power = 0
	endurence = 4
	text = "Defender (This creature can't attack.){T}: Add {G} to your mana pool."
	price = 59
}
sig Card46 extends Card {} {
	name = "LiegeoftheHollows"
	color = Green
	cost = "2GG"
	sets = "WTH"
	type = Creature
	power = 3
	endurence = 4
	text = "When Liege of the Hollows dies, each player may pay any amount of mana. Then each player who paid mana this way puts that many 1/1 green Squirrel creature tokens onto the battlefield."
	price = 69
}
sig Card47 extends Card {} {
	name = "KarganDragonlord"
	color = Red
	cost = "RR"
	sets = "ROE"
	type = Creature
	power = 2
	endurence = 2
	text = "Level up {R} ({R}: Put a level counter on this. Level up only as a sorcery.)LEVEL 4-74/4FlyingLEVEL 8+8/8Flying, trample{R}: Kargan Dragonlord gets +1/+0 until end of turn."
	price = 55
}
sig Card48 extends Card {} {
	name = "ArcadesSabboth"
	color = Gold
	cost = "2GGWWUU"
	sets = "LEG, CHR"
	type = Legendary
	power = 7
	endurence = 7
	text = "FlyingAt the beginning of your upkeep, sacrifice Arcades Sabboth unless you pay {G}{W}{U}.Each untapped creature you control gets +0/+2 as long as it's not attacking.{W}: Arcades Sabboth gets +0/+1 until end of turn."
	price = 43
}
sig Card49 extends Card {} {
	name = "ArcheryTraining"
	color = White
	cost = "W"
	sets = "UDS"
	type = Enchantment
	power = 0
	endurence = 0
	text = "Enchant creatureAt the beginning of your upkeep, you may put an arrow counter on Archery Training.Enchanted creature has '{T}: This creature deals X damage to target attacking or blocking creature, where X is the number of arrow counters on Archery Training.'"
	price = 41
}
sig Card50 extends Card {} {
	name = "Invigorate"
	color = Green
	cost = "2G"
	sets = "MMQ, DDD, CMD"
	type = Instant
	power = 0
	endurence = 0
	text = "If you control a Forest, rather than pay Invigorate's mana cost, you may have an opponent gain 3 life.Target creature gets +4/+4 until end of turn."
	price = 92
}

// ------------------------------------- END DECLARATION -------------------------------------

pred  OnlyArtifact {
all deck:Deck | deck.cards.color = ArtifactColor
}

run OnlyArtifact for 1 Deck, 2 Card
