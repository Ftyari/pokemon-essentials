################################################################################
# This section was created solely for you to put various bits of code that
# modify various wild Pokémon and trainers immediately prior to battling them.
# Be sure that any code you use here ONLY applies to the Pokémon/trainers you
# want it to apply to!
################################################################################

# Make all wild Pokémon shiny while a certain Switch is ON (see Settings).
Events.onWildPokemonCreate += proc { |_sender, e|
  pokemon = e[0]
  if $game_switches[SHINY_WILD_POKEMON_SWITCH]
    pokemon.makeShiny
  end
}

### Makes Event Pokémon turn into their Alolan Form. ###

Events.onWildPokemonCreate += proc { |_sender, e|
  pokemon = e[0]
  if $game_switches[64]
    pokemon.form=1
  end
}

# Used in the random dungeon map.  Makes the levels of all wild Pokémon in that
# map depend on the levels of Pokémon in the player's party.
# This is a simple method, and can/should be modified to account for evolutions
# and other such details.  Of course, you don't HAVE to use this code.
Events.onWildPokemonCreate += proc { |_sender, e|
  pokemon = e[0]
  if $game_map.map_id == 51
    max_level = PBExperience.maxLevel
    new_level = pbBalancedLevel($Trainer.party) - 4 + rand(5)   # For variety
    new_level = 1 if new_level < 1
    new_level = max_level if new_level > max_level
    pokemon.level = new_level
    pokemon.calcStats
    pokemon.resetMoves
  end
}

# This is the basis of a trainer modifier.  It works both for trainers loaded
# when you battle them, and for partner trainers when they are registered.
# Note that you can only modify a partner trainer's Pokémon, and not the trainer
# themselves nor their items this way, as those are generated from scratch
# before each battle.
#Events.onTrainerPartyLoad += proc { |_sender, e|
#  if e[0] # Trainer data should exist to be loaded, but may not exist somehow
#    trainer = e[0][0] # A PokeBattle_Trainer object of the loaded trainer
#    items = e[0][1]   # An array of the trainer's items they can use
#    party = e[0][2]   # An array of the trainer's Pokémon
#    YOUR CODE HERE
#  end
#}

Events.onWildPokemonCreate+=proc {|sender,e|
  pokemon=e[0]
  case $game_variables[34]
    when 1 # « Placeholder (1). »
     pokemon.pbLearnMove(:ELECTROWEB)
    when 2 #Pichu. «Dex Number: 172.»
     pokemon.pbLearnMove(:FAKEOUT)
    when 3 #Zoroark-Scyl. «Dex Number: 571.»
     pokemon.pbLearnMove(:FLAMETHROWER)
     pokemon.pbLearnMove(:NASTYPLOT)
     pokemon.pbLearnMove(:DARKPULSE)
     pokemon.pbLearnMove(:SLUDGEBOMB)
     pokemon.ot="Luca"
     pokemon.trainerID=$Trainer.getForeignID
     pokemon.name="Nyxia"
     pokemon.makeFemale
    when 4 #Deerling. «Dex Number: 585.»
     pokemon.pbLearnMove(:SYNTHESIS)
    when 5 #Mimikyu-Scyl. «Dex Number: 778.»
     pokemon.pbLearnMove(:SWORDSDANCE)
     pokemon.pbLearnMove(:SHADOWSNEAK)
     pokemon.pbLearnMove(:PLAYROUGH)
     pokemon.pbLearnMove(:SHADOWCLAW)
     pokemon.ot="Luca"
     pokemon.trainerID=$Trainer.getForeignID
     pokemon.name="Menatos"
     pokemon.makeFemale
    when 6 #Ducklett. «Dex Number: 580.»
     pokemon.pbLearnMove(:ICYWIND)
     pokemon.pbLearnMove(:AIRSLASH)
     pokemon.pbLearnMove(:SURF)
     pokemon.pbLearnMove(:ROOST)
    when 7 #« Placeholder (2). »
     pokemon.pbLearnMove(:SWORDSDANCE)
     pokemon.pbLearnMove(:SHADOWSNEAK)
     pokemon.pbLearnMove(:PLAYROUGH)
     pokemon.pbLearnMove(:SHADOWCLAW)
     pokemon.ot="Scyl"
     pokemon.trainerID=$Trainer.getForeignID
     pokemon.name="???"
     pokemon.makeFemale
    when 8 #Grubbin. «Dex Number: 736.»
     pokemon.pbLearnMove(:MUDSHOT)
     pokemon.pbLearnMove(:ELECTROWEB)
    when 9 #Sandygast. «Dex Number: 769.»
     pokemon.pbLearnMove(:CURSE)
     pokemon.pbLearnMove(:DESTINYBOND)
    when 10 #« Ability 0 is forced. »
     pokemon.setAbility(0)
    when 11 #« Ability 2 is forced. »
     pokemon.setAbility(2)
    when 12 #« Placeholder (3). »
     pokemon.pbLearnMove(:MUDSHOT)
     pokemon.pbLearnMove(:PSYBEAM)
     pokemon.pbLearnMove(:AQUAJET)
    when 13 # « Test for Throat Chop. »
     pokemon.pbLearnMove(:HYPERVOICE)
     pokemon.pbLearnMove(:UPROAR)
     pokemon.pbLearnMove(:ROUND)
     pokemon.pbLearnMove(:ROAR)
    when 14 #« Placeholder (4). »
     pokemon.pbLearnMove(:ASSIST)
    when 15 #« Placeholder (5). »
     pokemon.pbLearnMove(:HYPNOSIS)
    when 16 #Rhyhorn-1. «Dex Number: 111.»
     pokemon.pbLearnMove(:ICEFANG)
     pokemon.pbLearnMove(:COUNTER)
    when 17 #Rhyhorn-2. «Dex Number: 111.»
     pokemon.pbLearnMove(:FIREFANG)
     pokemon.pbLearnMove(:METALBURST)
    when 18 #Rhyhorn-3. «Dex Number: 111.»
     pokemon.pbLearnMove(:THUNDERFANG)
     pokemon.pbLearnMove(:CURSE)
    when 19 #Purrloin-1. «Dex Number: 509.»
     pokemon.pbLearnMove(:FOULPLAY)
     pokemon.pbLearnMove(:YAWN)
    when 20 #Purrloin-2. «Dex Number: 509.»
     pokemon.pbLearnMove(:FEINTATTACK)
     pokemon.pbLearnMove(:ENCORE)
    when 21 #Test because IVs and nature are aids.
     pokemon.iv[0]=31
     pokemon.iv[1]=31
     pokemon.iv[2]=31
     pokemon.iv[3]=31
     pokemon.iv[4]=31
     pokemon.iv[5]=31
     pokemon.setNature(:HARDY)
     pokemon.setItem(:ROCKYHELMET)
     pokemon.setAbility(1)
    when 22 #Grimer-1. «Dex Number: 88.»
     pokemon.pbLearnMove(:SHADOWSNEAK)
     pokemon.pbLearnMove(:CURSE)
    when 23 #Grimer-2. «Dex Number: 88.»
     pokemon.pbLearnMove(:POWERUPPUNCH)
     pokemon.pbLearnMove(:ACIDSPRAY)
    when 24 #Stunky-1. «Dex Number: 434.»
     pokemon.pbLearnMove(:FLAMEBURST)
    when 25 #Stunky-2. «Dex Number: 434.»
     pokemon.pbLearnMove(:PLAYROUGH)
    when 26 #Snubbull-1. «Dex Number: 209.»
     pokemon.pbLearnMove(:ICEFANG)
     pokemon.pbLearnMove(:CLOSECOMBAT)
    when 27 #Snubbull-2. «Dex Number: 209.»
     pokemon.pbLearnMove(:FIREFANG)
     pokemon.pbLearnMove(:CLOSECOMBAT)
    when 28 #Snubbull-3. «Dex Number: 209.»
     pokemon.pbLearnMove(:THUNDERFANG)
     pokemon.pbLearnMove(:CLOSECOMBAT)
    when 29 #Poochyena-1. «Dex Number: 261.»
     pokemon.pbLearnMove(:ICEFANG)
     pokemon.pbLearnMove(:PLAYROUGH)
    when 30 #Poochyena-2. «Dex Number: 261.»
     pokemon.pbLearnMove(:FIREFANG)
     pokemon.pbLearnMove(:PLAYROUGH)
    when 31 #Poochyena-3. «Dex Number: 261.»
     pokemon.pbLearnMove(:THUNDERFANG)
     pokemon.pbLearnMove(:PLAYROUGH)
    when 32 #« Placeholder (6). »
     pokemon.pbLearnMove(:AGILITY)
     pokemon.pbLearnMove(:NASTYPLOT)
     pokemon.pbLearnMove(:THUNDERWAVE)
     pokemon.pbLearnMove(:TRICK)
    when 33 #Cutiefly. «Dex Number: 742.»
     pokemon.pbLearnMove(:STICKYWEB)
    when 34 #Aipom. «Dex Number: 190.»
     pokemon.pbLearnMove(:CRUNCH)
    when 35 #Exeggcute. «Dex Number: 102.»
     pokemon.pbLearnMove(:GIGADRAIN)
    when 36 #Combee. «Dex Number: 415.»
     pokemon.pbLearnMove(:TAILWIND)
     pokemon.makeFemale
    when 37 #Totodile-1. «Dex Number: 158.»
     pokemon.pbLearnMove(:AQUAJET)
    when 38 #Totodile-2. «Dex Number: 158.»
     pokemon.pbLearnMove(:DRAGONDANCE)
    when 39 #Pumpkaboo-1. «Dex Number: 710.»
     pokemon.pbLearnMove(:CURSE)
     pokemon.form=3
    when 40 #Pumpkaboo-2. «Dex Number: 710.»
     pokemon.pbLearnMove(:DESTINYBOND)
     pokemon.form=3
    when 41 #Pumpkaboo-3. «Dex Number: 710.»
     pokemon.pbLearnMove(:DISABLE)
     pokemon.form=3
    when 42 #Roggenrola-1. «Dex Number: 524.»
     pokemon.pbLearnMove(:WIDEGUARD)
     pokemon.pbLearnMove(:CURSE)
    when 43 #Roggenrola-2. «Dex Number: 524.»
     pokemon.pbLearnMove(:WIDEGUARD)
     pokemon.pbLearnMove(:AUTOTOMIZE)
    when 44 #Makuhita-1. «Dex Number: 296.»
     pokemon.pbLearnMove(:DETECT)
     pokemon.pbLearnMove(:WIDEGUARD)
    when 45 #Makuhita-2. «Dex Number: 296.»
     pokemon.pbLearnMove(:BULLETPUNCH)
     pokemon.pbLearnMove(:WIDEGUARD)
    when 46 #Hoppip. «Dex Number: 187.»
     pokemon.pbLearnMove(:HELPINGHAND)
     pokemon.pbLearnMove(:SEEDBOMB)
    when 47 #Mankey. «Dex Number: 56.»
     pokemon.pbLearnMove(:ENCORE)
     pokemon.pbLearnMove(:BEATUP)
    when 48 #Munchlax. «Dex Number: 446.»
     pokemon.pbLearnMove(:ZENHEADBUTT)
     pokemon.pbLearnMove(:COUNTER)
    when 49 #Trubbish. «Dex Number: 586.»
     pokemon.pbLearnMove(:CURSE)
     pokemon.pbLearnMove(:AUTOTOMIZE)
    when 50 #Rattata(Alolan). «Dex Number: [X].»
     pokemon.pbLearnMove(:REVERSAL)
    when 51 #Grimer. «Dex Number: 88.»
     pokemon.pbLearnMove(:SHADOWSNEAK)
    when 52 #Swablu-1. «Dex Number: 333.»
     pokemon.pbLearnMove(:PLAYROUGH)
     pokemon.pbLearnMove(:HAZE)
    when 53 #Swablu-2. «Dex Number: 333.»
     pokemon.pbLearnMove(:DRAGONRUSH)
     pokemon.pbLearnMove(:FEATHERDANCE)
    when 54 #Woobat. «Dex Number: 527.»
     pokemon.pbLearnMove(:ROOST)
    when 55 #Sableye-1. «Dex Number: 302.»
     pokemon.pbLearnMove(:SUCKERPUNCH)
     pokemon.pbLearnMove(:NASTYPLOT)
    when 56 #Sableye-2. «Dex Number: 302.»
     pokemon.pbLearnMove(:RECOVER)
     pokemon.pbLearnMove(:NASTYPLOT)
    when 57 #Fletchling. «Dex Number: 661.»
     pokemon.pbLearnMove(:TAILWIND)
    when 58 #Rowlet. «Dex Number: 722.»
     pokemon.pbLearnMove(:HAZE)
    when 59 #Fomantis-1. «Dex Number: 753.»
     pokemon.pbLearnMove(:GIGADRAIN)
     pokemon.pbLearnMove(:AROMATHERAPY)
    when 60 #Fomantis-2. «Dex Number: 753.»
     pokemon.pbLearnMove(:WEATHERBALL)
     pokemon.pbLearnMove(:AROMATHERAPY)
    end
}

# Make all wild Pokémon have a chance to have their hidden ability.
Events.onWildPokemonCreate+=proc {|sender,e|
   pokemon=e[0]
   if rand(10) < 3
     pokemon.setAbility(2)
   end
}
