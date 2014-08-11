package com.pixo.futbolbayer.view.match
{
	import com.pixo.futbolbayer.model.datatransferobjects.MatchProgressDTO;
	import com.pixo.futbolbayer.model.datatransferobjects.StartMatchDTO;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	
	import skins.GameSkin;
	
	public class HudView extends Sprite
	{
		private var team1Uniform:Sprite;
		private var team2Uniform:Sprite;
		private var time:TextField;
		private var team1Name:TextField;
		private var team2Name:TextField;
		private var activeTeam:TextField;
		private var movementsLeft:TextField;
		
		public function HudView()
		{
			init();
		}
		
		private function init():void
		{
			var skin:Sprite = new GameSkin.HudSkin() as Sprite;
			addChild(skin);
			team1Uniform = skin.getChildByName("team1_uniform") as Sprite;
			team2Uniform = skin.getChildByName("team2_uniform") as Sprite;
			time = skin.getChildByName("time") as TextField;
			team1Name = skin.getChildByName("team1_name") as TextField;
			team2Name = skin.getChildByName("team2_name") as TextField;
			activeTeam = skin.getChildByName("active_team") as TextField;
			movementsLeft = skin.getChildByName("movements_left") as TextField;
		}
		
		public function setData(startMatchDTO:StartMatchDTO):void
		{
			team1Uniform.addChild(startMatchDTO.team1Uniform);
			team2Uniform.addChild(startMatchDTO.team2Uniform);
			time.text = startMatchDTO.matchTime;
			team1Name.text = startMatchDTO.team1Name;
			team2Name.text = startMatchDTO.team2Name;
		}
		
		public function setMatchProgress(matchProgressDTO:MatchProgressDTO):void
		{
			movementsLeft.text = matchProgressDTO.movementsLeft.toString();
		}
		
	}
}