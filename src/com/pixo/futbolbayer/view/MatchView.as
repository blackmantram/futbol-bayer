package com.pixo.futbolbayer.view
{
	import com.pixo.futbolbayer.model.datatransferobjects.StartMatchDTO;
	import com.pixo.futbolbayer.view.events.DiceEvent;
	import com.pixo.futbolbayer.view.match.Dice;
	import com.pixo.futbolbayer.view.match.HudView;
	import com.pixo.futbolbayer.view.match.Pitch;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import skins.GameSkin;
	
	public class MatchView extends Sprite
	{
		private var stadium:Sprite;
		private var pitchContainer:Sprite;
		public var pitch:Pitch;
		public var dice:Dice;
		
		public function MatchView()
		{
			init();
			pitchContainer.addChild(pitch);
		}
		
		private function init():void
		{
			var skin:Sprite = new GameSkin.MatchSkin() as Sprite;
			addChild(skin);
			stadium = skin.getChildByName("stadium_container") as Sprite;
			pitchContainer = skin.getChildByName("pitch_container") as Sprite;
			pitch = new Pitch(skin.getChildByName("ball") as Sprite);
			dice = new Dice(skin.getChildByName("dice") as MovieClip);
			pitch = new Pitch(skin.getChildByName("ball") as Sprite);
			dice = new Dice(skin.getChildByName("dice") as MovieClip);
		}
		
		public function setData(startMatchDTO:StartMatchDTO):void
		{
			stadium.addChild(startMatchDTO.stadium);
		}
		
		public function move():void
		{
			pitch.move(dice.value);
		}
	}
}