package com.pixo.futbolbayer.view
{
	import com.pixo.futbolbayer.model.datatransferobjects.MatchDTO;
	import com.pixo.futbolbayer.view.events.DiceEvent;
	import com.pixo.futbolbayer.view.match.Dice;
	import com.pixo.futbolbayer.view.match.Pitch;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import skins.GameSkin;
	
	public class MatchView extends Sprite
	{
		private var team1Uniform:Sprite;
		private var team2Uniform:Sprite;
		private var stadium:Sprite;
		private var time:TextField;
		private var team1Name:TextField;
		private var team2Name:TextField;
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
			team1Uniform = skin.getChildByName("team1_uniform") as Sprite;
			team2Uniform = skin.getChildByName("team2_uniform") as Sprite;
			stadium = skin.getChildByName("stadium_container") as Sprite;
			time = skin.getChildByName("time") as TextField;
			team1Name = skin.getChildByName("team1_name") as TextField;
			team2Name = skin.getChildByName("team2_name") as TextField;
			pitchContainer = skin.getChildByName("pitch_container") as Sprite;
			pitch = new Pitch(skin.getChildByName("ball") as Sprite);
			dice = new Dice(skin.getChildByName("dice") as MovieClip);
		}
		
		public function setData(matchDTO:MatchDTO):void
		{
			team1Uniform.addChild(matchDTO.team1Uniform);
			team2Uniform.addChild(matchDTO.team2Uniform);
			stadium.addChild(matchDTO.stadium);
			time.text = matchDTO.matchTime;
			team1Name.text = matchDTO.team1Name;
			team2Name.text = matchDTO.team2Name;
		}
		
		public function move():void
		{
			pitch.move(dice.value);
		}
	}
}