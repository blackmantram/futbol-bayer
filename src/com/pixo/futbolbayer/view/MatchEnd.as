package com.pixo.futbolbayer.view
{
	import com.pixo.futbolbayer.model.datatransferobjects.PreviewMatchDTO;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	
	import skins.GameSkin;

	public class MatchEnd extends Slider
	{
		private var team1:Sprite;
		private var team2:Sprite;
		private var team1Name:TextField;
		private var team2Name:TextField;
		private var score1:TextField;
		private var score2:TextField;
		public var startButton:Sprite;
		
		public function MatchEnd()
		{
			setSkin();
		}
		
		private function setSkin():void
		{
			var skin:Sprite = new GameSkin.MatchEndSkin() as Sprite;
			addChild(skin);
			team1 = skin.getChildByName("team1_preview") as Sprite;
			team2 = skin.getChildByName("team2_preview") as Sprite;
			team1Name = skin.getChildByName("team1name_preview") as TextField;
			team2Name = skin.getChildByName("team2name_preview") as TextField;
			score1 = skin.getChildByName("score1") as TextField;
			score2 = skin.getChildByName("score2") as TextField;
			startButton = skin.getChildByName("start_button") as Sprite;
		}
		
		public function setData(previewMatchDTO:PreviewMatchDTO, score1:Number, score2:Number):void
		{
			team1.addChild(previewMatchDTO.hudData.team1Uniform);
			team2.addChild(previewMatchDTO.hudData.team2Uniform);
			team1Name.text = previewMatchDTO.hudData.team1Name;
			team2Name.text = previewMatchDTO.hudData.team2Name;
			this.score1.text = score1.toString();
			this.score2.text = score2.toString();
		}
		
		override protected function hideContent():void
		{
		}
		
		override public function showContent():void
		{
		}
	}
}