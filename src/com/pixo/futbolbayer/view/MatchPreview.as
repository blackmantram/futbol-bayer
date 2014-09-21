package com.pixo.futbolbayer.view
{
	import com.pixo.futbolbayer.model.datatransferobjects.MatchSettingsDTO;
	import com.pixo.futbolbayer.model.datatransferobjects.PreviewMatchDTO;
	import com.pixo.futbolbayer.model.datatransferobjects.TeamSettingsDTO;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	
	import assets.skins.GameSkin;
	
	public class MatchPreview extends Slider
	{
		private var team1Preview:Sprite;
		private var team2Preview:Sprite;
		private var stadiumPreview:TextField;
		private var refereePreview:TextField;
		private var timePreview:TextField;
		private var team1NamePreview:TextField;
		private var team2NamePreview:TextField;
		
		public var backButton:Sprite;
		public var startButton:Sprite;
		
		public function MatchPreview()
		{
			init();
		}
		
		private function init():void
		{
			var skin:Sprite = new GameSkin.MatchPreviewSkin() as Sprite;
			addChild(skin);
			team1Preview = skin.getChildByName("team1_preview") as Sprite;
			team2Preview = skin.getChildByName("team2_preview") as Sprite;
			stadiumPreview = skin.getChildByName("stadium_preview") as TextField;
			refereePreview = skin.getChildByName("referee_preview") as TextField;
			timePreview = skin.getChildByName("time_preview") as TextField;
			team1NamePreview = skin.getChildByName("team1name_preview") as TextField;
			team2NamePreview = skin.getChildByName("team2name_preview") as TextField;
			backButton = skin.getChildByName("back_button") as Sprite;
			startButton = skin.getChildByName("start_button") as Sprite;
		}
		
		public function show():void
		{
			dispatchEvent(new Event(Event.DISPLAYING));
		}
		
		public function setPreviewData(previewMatchDTO:PreviewMatchDTO):void
		{
			team1Preview.addChild(previewMatchDTO.hudData.team1Uniform);
			team2Preview.addChild(previewMatchDTO.hudData.team2Uniform);
			stadiumPreview.text = previewMatchDTO.stadiumName;
			refereePreview.text = previewMatchDTO.refereeName;
			timePreview.text = previewMatchDTO.hudData.matchTime;
			team1NamePreview.text = previewMatchDTO.hudData.team1Name;
			team2NamePreview.text = previewMatchDTO.hudData.team2Name;
		}
		
		override protected function hideContent():void
		{
		}
		
		override public function showContent():void
		{
		}
	}
}