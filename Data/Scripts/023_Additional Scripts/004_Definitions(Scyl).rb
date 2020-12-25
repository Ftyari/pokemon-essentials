  def pbReturnToPlayerHouse
    if $scene.is_a?(Scene_Map)
      pbFadeOutIn {
	  pbBGSFade(1.0)
      $game_temp.player_transferring = true
      $game_temp.player_new_map_id = 69
      $game_temp.player_new_x = 4
      $game_temp.player_new_y = 25
      $game_temp.player_new_direction = 6
      $scene.transfer_player
	  $game_map.autoplay
	  $game_map.refresh
      }
    end
  end
