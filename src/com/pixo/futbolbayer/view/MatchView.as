package com.pixo.futbolbayer.view
{
	import com.pixo.futbolbayer.model.datatransferobjects.MatchDTO;
	import com.pixo.futbolbayer.view.match.terrain.Pitch;
	
	import flash.display.Sprite;
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
		private var pitch:Pitch;
		
		public function MatchView()
		{
			init();
			addChild(pitch);
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
			pitch = new Pitch(skin.getChildByName("ball") as Sprite);
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
	}
}