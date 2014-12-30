------------------------------------MANQUE LA PARTIE COULEUR DE MAX D-----------
---WARNING--
//J'ai l'impression que l'on peut pas etendre plusieurs fois "card" et lancer le main sinon ca merde , a test avec EnchanT qui est commenté

-----------------------SIG------------------------------
sig Deck {
	cards: some Card
}

// Need to be abstract
abstract sig Card {
price :Int,
name: String,
color: set AvailableColors,
sets: set AvailableSets
}

abstract sig EnchanT extends Card//We need the T caps coz Enchant is also a Capacity
{
 capacity: EnchantCapcity//will need a real list (parseur time)
}


abstract sig Summon extends Card
{
summonType: SummonType,
power: Int,
def: Int,
summonCapacity:some SummonCapacity ,//like fly..
activableCapacity: some ActivableCapacity,//will need a real list (parseur time)
unactivableCapacity:some UnactivableCapacity//will need a real list (parseur time)
}


//EXAMPLE
sig Summon1 extends Summon{}
{
price = 3
color=red
name="ArcboundWorker"
sets=EVE
summonType=Artificer
power=2
def=2
summonCapacity=Absorb
activableCapacity=BTest1
unactivableCapacity=Test1
}
sig Summon2 extends Summon{}
{
price =4
color=blue
name="ArcboundWorker"
sets=EVE
summonType=Artificer
power=2
def=2
summonCapacity=Absorb
activableCapacity=BTest1
unactivableCapacity=Test1
}

sig Enchant1 extends EnchanT{}
{
price =4
color=blue
name="ArcboundWorker"
capacity=enchant1
}

sig Enchant2 extends EnchanT{}
{
price =4
color=red
name="ArcboundWorker"
capacity=enchant1
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

pred Empty {}
//only redCard
pred  OnlyRed {
all deck:Deck | deck.cards.color=red
}


// try to instanciate 3 cards
//run Empty for exactly 2 Deck, 4 Card
run  OnlyRed for exactly 2 Deck , 2 Card
//run Empty for exactly 1 Deck , 3 EnchanT
