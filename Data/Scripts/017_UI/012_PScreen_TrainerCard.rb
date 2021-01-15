class PokemonTrainerCard_Scene
  def pbUpdate
    pbUpdateSpriteHash(@sprites)
  end

  def pbStartScene
    @viewport = Viewport.new(0,0,Graphics.width,Graphics.height)
    @viewport.z = 99999
    @sprites = {}
    background = pbResolveBitmap(sprintf("Graphics/Pictures/Trainer Card/bg_f"))
    if $Trainer.female? && background
      addBackgroundPlane(@sprites,"bg","Trainer Card/bg_f",@viewport)
    else
      addBackgroundPlane(@sprites,"bg","Trainer Card/bg",@viewport)
    end
    cardexists = pbResolveBitmap(sprintf("Graphics/Pictures/Trainer Card/card_f"))
    @sprites["card"] = IconSprite.new(0,0,@viewport)
    if $Trainer.female? && cardexists
      case $game_variables[67]
        when 1
          @sprites["card"].setBitmap("Graphics/Pictures/Trainer Card/card_star1")
        when 2
          @sprites["card"].setBitmap("Graphics/Pictures/Trainer Card/card_star2")
        when 3
          @sprites["card"].setBitmap("Graphics/Pictures/Trainer Card/card_star3")
        when 4
          @sprites["card"].setBitmap("Graphics/Pictures/Trainer Card/card_star4")
        when 5
          @sprites["card"].setBitmap("Graphics/Pictures/Trainer Card/card_star5")
        else
          @sprites["card"].setBitmap("Graphics/Pictures/Trainer Card/card_f")
      end
    else
      case $game_variables[67]
      when 1
        @sprites["card"].setBitmap("Graphics/Pictures/Trainer Card/card_star1")
      when 2
        @sprites["card"].setBitmap("Graphics/Pictures/Trainer Card/card_star2")
      when 3
        @sprites["card"].setBitmap("Graphics/Pictures/Trainer Card/card_star3")
      when 4
        @sprites["card"].setBitmap("Graphics/Pictures/Trainer Card/card_star4")
      when 5
        @sprites["card"].setBitmap("Graphics/Pictures/Trainer Card/card_star5")
      else
        @sprites["card"].setBitmap("Graphics/Pictures/Trainer Card/card")
      end
    end
    @sprites["overlay"] = BitmapSprite.new(Graphics.width,Graphics.height,@viewport)
    pbSetSystemFont(@sprites["overlay"].bitmap)
    @sprites["trainer"] = IconSprite.new(336,112,@viewport)
    @sprites["trainer"].setBitmap(pbPlayerSpriteFile($Trainer.trainertype))
    @sprites["trainer"].x -= (@sprites["trainer"].bitmap.width-144)/2
    @sprites["trainer"].y -= (@sprites["trainer"].bitmap.height-144)
    @sprites["trainer"].z = 2
    pbDrawTrainerCardFront
    if $PokemonGlobal.trainerRecording
      $PokemonGlobal.trainerRecording.play
    end
    pbFadeInAndShow(@sprites) { pbUpdate }
  end

  def pbDrawTrainerCardFront
    overlay = @sprites["overlay"].bitmap
    overlay.clear
    baseColor   = Color.new(90,90,90)
    shadowColor = Color.new(160,160,160)
    totalsec = Graphics.frame_count / Graphics.frame_rate
    hour = totalsec / 60 / 60
    min = totalsec / 60 % 60
    time = (hour>0) ? _INTL("{1}h {2}m",hour,min) : _INTL("{1}m",min)
    $PokemonGlobal.startTime = pbGetTimeNow if !$PokemonGlobal.startTime
    starttime = _INTL("{1} {2}, {3}",
       "Sept.",
       1,
       2019)
    textPositions = [
       [_INTL("Name"),34,64,0,baseColor,shadowColor],
       [$Trainer.name,302,64,1,baseColor,shadowColor],
       [_INTL("ID No."),332,64,0,baseColor,shadowColor],
       [sprintf("%05d",$Trainer.publicID($Trainer.id)),468,64,1,baseColor,shadowColor],
       [_INTL("Money"),34,96,0,baseColor,shadowColor],
       [_INTL("${1}",$Trainer.money.to_s_formatted),302,96,1,baseColor,shadowColor],
       [_INTL("Library"),34,129,0,baseColor,shadowColor],
       [sprintf("%d/%d",$Trainer.pokedexOwned,$Trainer.pokedexSeen),302,129,1,baseColor,shadowColor],
       [_INTL("Time"),34,160,0,baseColor,shadowColor],
       [time,302,160,1,baseColor,shadowColor],
       [_INTL("Started"),34,192,0,baseColor,shadowColor],
       [starttime,302,192,1,baseColor,shadowColor]
    ]
    pbDrawTextPositions(overlay,textPositions)
    x=40
    y=271  ##3region=pbGetCurrentRegion(0) # Get the current region
    imagePositions=[]
   for i in 0...3
    for j in 0...9
      if $Trainer.badges[j+i*8]
        imagePositions.push(["Graphics/Pictures/Trainer Card/icon_badges",x,y,j*32,i*32,32,32])
      end
      x+=50
    end
      x=40
      y+=50
    end
      pbDrawImagePositions(overlay,imagePositions)
  end

  def pbTrainerCard
    pbSEPlay("GUI trainer card open")
    loop do
      Graphics.update
      Input.update
      pbUpdate
      if Input.trigger?(Input::B)
        pbPlayCloseMenuSE
        break
      end
    end
  end

  def pbEndScene
    pbFadeOutAndHide(@sprites) { pbUpdate }
    pbDisposeSpriteHash(@sprites)
    @viewport.dispose
  end
end



class PokemonTrainerCardScreen
  def initialize(scene)
    @scene = scene
  end

  def pbStartScreen
    @scene.pbStartScene
    @scene.pbTrainerCard
    @scene.pbEndScene
  end
end
