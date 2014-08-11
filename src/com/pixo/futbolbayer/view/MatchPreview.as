package com.pixo.futbolbayer.view
{
	import com.pixo.futbolbayer.model.datatransferobjects.MatchSettingsDTO;
	import com.pixo.futbolbayer.model.datatransferobjects.StartMatchDTO;
	import com.pixo.futbolbayer.model.datatransferobjects.TeamSettingsDTO;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	
	import org.osmf.elements.ManifestLoaderBase;
	
	import skins.GameSkin;
	
	public class MatchPreview extends Sprite
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
		
		public function setPreviewData(startMatchDTO:StartMatchDTO):void
		{
			team1Preview.addChild(startMatchDTO.team1Uniform);
			team2Preview.addChild(startMatchDTO.team2Uniform);
			stadiumPreview.text = startMatchDTO.stadiumName;
			refereePreview.text = startMatchDTO.refereeName;
			timePreview.text = startMatchDTO.matchTime;
			team1NamePreview.text = startMatchDTO.team1Name;
			team2NamePreview.text = startMatchDTO.team2Name;
		}
	}
}