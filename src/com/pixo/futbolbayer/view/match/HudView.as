package com.pixo.futbolbayer.view.match
{
	import com.pixo.futbolbayer.model.Team;
	import com.pixo.futbolbayer.model.datatransferobjects.HudDTO;
	import com.pixo.futbolbayer.view.tweens.ShowTeam1Tween;
	import com.pixo.futbolbayer.view.tweens.ShowTeam2Tween;
	import com.pixo.futbolbayer.view.tweens.VerticalHideTween;
	import com.pixo.futbolbayer.view.tweens.VerticalShowTween;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	
	import skins.GameSkin;
	
	public class HudView extends Sprite
	{
		public var team1Uniform:Sprite;
		public var team2Uniform:Sprite;
		private var time:TextField;
		private var team1Name:TextField;
		private var team2Name:TextField;
		private var teamGoals:Array;
		private var activeTeam:Sprite;
		private var movementsLeft:TextField;
		
		private var showTween:VerticalShowTween = new VerticalShowTween();
		private var hideTween:VerticalHideTween = new VerticalHideTween();
		
		public function HudView()
		{
			addSkin();
			playIntro();
		}
		
		private function addSkin():void
		{
			var skin:Sprite = new GameSkin.HudSkin() as Sprite;
			addChild(skin);
			team1Uniform = skin.getChildByName("team1_uniform") as Sprite;
			team2Uniform = skin.getChildByName("team2_uniform") as Sprite;
			time = skin.getChildByName("time") as TextField;
			team1Name = skin.getChildByName("team1_name") as TextField;
			team2Name = skin.getChildByName("team2_name") as TextField;
			teamGoals = [skin.getChildByName("team1_score") as TextField,
						skin.getChildByName("team2_score") as TextField];
			activeTeam = skin.getChildByName("active_team") as Sprite;
			movementsLeft = skin.getChildByName("movements_left") as TextField;
		}
		
		private function playIntro():void
		{
			var team1Tween:ShowTeam1Tween = new ShowTeam1Tween();
			team1Tween.tween(team1Uniform);
			var team2Tween:ShowTeam2Tween = new ShowTeam2Tween();
			team2Tween.tween(team2Uniform);
		}
		
		public function setData(hudDTO:HudDTO):void
		{
			team1Uniform.addChild(hudDTO.team1Uniform);
			team2Uniform.addChild(hudDTO.team2Uniform);
			time.text = hudDTO.matchTime;
			team1Name.text = hudDTO.team1Name;
			team2Name.text = hudDTO.team2Name;
			setCurrentTurn(1);
		}
		
		public function setCurrentTurn(turn:int):void
		{
			if (turn==1)
			{
				hideTween.tween(activeTeam.getChildByName("turn2"), 0);
				showTween.tween(activeTeam.getChildByName("turn1"), 0.25);
			}
			else
			{
				hideTween.tween(activeTeam.getChildByName("turn1"), 0);
				showTween.tween(activeTeam.getChildByName("turn2"), 0.25);
			}
		}
		
		public function setMovements(movements:int):void
		{
			movementsLeft.text = movements.toString();
		}
		
		public function setCurrentTime(currentTime:String):void
		{
			time.text = currentTime;	
		}
		
		public function setGoals(team:int, goals:int):void
		{
			(teamGoals[team-1] as TextField).text = goals.toString();
		}
		
		public function hideContent():void
		{
			team1Uniform.alpha = 0;
			team2Uniform.alpha = 0;
			activeTeam.alpha = 0;
		}
		
		public function showContent():void
		{
			showTween.tween(team1Uniform, 0);
			showTween.tween(team2Uniform, 0.25);
			showTween.tween(activeTeam, 1);
		}
	}
}