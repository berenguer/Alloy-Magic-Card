------------------------------------MANQUE LA PARTIE COULEUR DE MAX D-----------
---WARNING--
//J'ai l'impression que l'on peut pas etendre plusieurs fois "card" et lancer le main sinon ca merde , a test avec EnchanT qui est commenté

-----------------------SIG------------------------------
sig Deck {
	cards: some Card
}

// Need to be abstract
abstract sig Card {
	name: Name,
	color: set AvailableColors,
	sets: set AvailableSets
}

//sig EnchanT extends Card//We need the T caps coz Enchant is also a Capacity
//{
//	capacity: EnchantCapcity//will need a real list (parseur time)

//}

sig Summon extends Card
{
	summonType: SummonType,
	power: Int,
	def: Int,
	summonCapacity:some SummonCapacity ,//like fly..
	activableCapacity: some ActivableCapacity,//will need a real list (parseur time)
	unactivableCapacity:some UnactivableCapacity//will need a real list (parseur time)
}



-----------------------ENUM------------------------------
enum AvailableColors {green, blue, white, red, black}
enum AvailableSets {EVE, UDS, DST, DDF}

//ENUM NAME
enum Name {ArcboundWorker, ArcheryTraining, JawboneSkulkin}

//all SummonCapacity
enum  SummonCapacity {Absorb,Affinity,Amplify,Annihilator,AuraSwap,
Banding, BattleCry, Bestow, Bloodthirst, Bushido, Buyback,
Cascade, Champion, Changeling, Cipher, Conspire, Convoke, CumulativeUpkeep, Cycling,
Deathtouch, Defender, Delve, Dethrone, Devour, DoubleStrike, Dredge,
Echo, Enchant, Entwine, Epic, Equip, Evoke, Evolve, Exalted, Extort,
Fading, Fear, FirstStrike, Flanking, Flash, Flashback, Flying, Forecast, Fortify, Frenzy, Fuse,
Graft, Gravestorm,
Haste, Haunt, Hexproof, HiddenAgenda, Hideaway, Horsemanship,
Indestructible, Infect, Intimidate,
Kicker,
Landwalk, LevelUp, Lifelink, LivingWeapon,
Madness, Miracle, Modular, Morph,
Ninjutsu,
Offering, Outlast, Overload,
Persist, Phasing, Poisonous, Protection, Provoke, Prowess, Prowl,
Reach, Rebound, Recover, Reinforce, Replicate, Retrace, Ripple,
Rampage, Scavenge, Shadow, Shroud, Soulbond, Soulshift, Splice, SplitSecond, Storm, Sunburst, Suspend,
TotemArmor, Trample, Transfigure, Transmute, Tribute,
Undying, Unearth, Unleash,
Vanishing, Vigilance,
Wither
}

//all Summon type
enum  SummonType
{
Artificer,Assassin,Atog,Avatar, 
Barbaria,Bear, Beast,Berserker,Bird,Boar,
Cat,Centaur,Cephalid, Cleric,Construct,Crab,Crocodile,
Demon, Djinn,Dragons,Drake,Drone,Druid,Dryad,
Efreet, Elder,Eldrazi,Elemental,Elf,
Faerie,Fox,Frog,
Gargoyle,Giants,Goblin,Golem, Gorgon,Griffin,
Hag, Homarid,Homunculus,Horror,Horse,Hound,Human,Hydra,
Illusion,Imp,Incarnation,Insect,
Juggernaut,
Kami,Kavu,Kithkin,Kor,
Leech,Leviathan,Lhurgoyf,Licid,Lizard,
Mercenary,Merfolk,Minotaur,Mutant,Myr,
Nightstalker,Nomad,
Octopus,Ooze,Ouphe,Ox,
Pegasus,Phoenix,Pirate,Praetor,
Rat,Rebel,Rhino,Rogue,
Salamander,Samurai,Saproling,Scarecrow,Scout,Shade,Siren,Skeleton,Slith,Sliver,Snake,Specter,Spellshaper,Sphinx,Spider,Squirrel,
Thrull,Treefolk,Troll,
Unicorn,
Vampire,Vedalken,Viashino,Volver,
Wall,Warrior,Werewolf,Wolf,Wolverine,Wurm,
Zombie
} 

//need real List
enum ActivableCapacity
{
BTest1,RTest2,Btest3
} 

//need real List
enum UnactivableCapacity
{
Test1,Test2,test3
} 
//need a realList
enum EnchantCapcity{
enchant1,enchant2,enchant3

}

-----------------------FACT FOR SUMMON------------------------------
// every summonCapacity instanciated is owned by a Summon
fact
{
	all sc: SummonCapacity | one summon:Summon | sc in summon.summonCapacity//not sure (maybe same as color)
}
// every  ActivableCapacity instanciated is owned by a Summon
fact
{
	all ac: ActivableCapacity | one summon:Summon | ac in summon.activableCapacity//not sure (maybe same as color)
}
// every  unactivableCapacity instanciated is owned by a Summon
fact
{
	all uc: UnactivableCapacity | one summon:Summon | uc in summon.unactivableCapacity//not sure (maybe same as color)
}
// Need a fact for dont generate all SummonType for nothing (same as color i guess)


-----------------------FACT FOR ENCHANT------------------------------
// every ENCHANT instanciated is owned by a Summon

//SAME AS COLOR

-----------------------FACT FOR SUMMON------------------------------
// every Card is owned by a Deck
fact
{
	all i_cards: Card | one deck: Deck | i_cards in deck.cards
}
-----------------------FACT FOR CARDS------------------------------
// every Name instanciated is owned by a Card
fact
{
	all i_name: Name | one card: Card | i_name in card.name

}

-----------------------FACT FOR Sets------------------------------
// every Sets instanciated is owned by a Card
fact
{
	all i_sets: AvailableSets | one card: Card | i_sets in card.sets

}

pred Empty {}




// try to instanciate 3 cards
//run Empty for exactly 2 Deck, 4 Card
run Empty for exactly 1 Deck , 3 Summon
//run Empty for exactly 1 Deck , 3 EnchanT
