package com.pixo.futbolbayer.view
{
	import com.pixo.futbolbayer.controller.events.GameEvent;
	import com.pixo.futbolbayer.model.datatransferobjects.MatchSettingsDTO;
	import com.pixo.futbolbayer.view.events.SelectorEvent;
	import com.pixo.futbolbayer.view.events.SettingsEvent;
	import com.pixo.futbolbayer.view.general.ImageSelector;
	import com.pixo.futbolbayer.view.general.Selector;
	import com.pixo.futbolbayer.view.general.TimeSelector;
	import com.pixo.futbolbayer.view.tweens.MoveUpwardsTween;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import flashx.textLayout.events.SelectionEvent;
	
	import skins.GameSkin;

	public class MatchSettingsView extends Sprite
	{
		private var timeSelector:TimeSelector;
		private var timeSelector1:Sprite;
		public var stadiumSelector:ImageSelector;
		private var stadiumSelector1:Sprite;
		public var refereeSelector:ImageSelector;
		private var refereeSelector1:Sprite;
		public var teamSectionButton:Sprite;
		
		public function MatchSettingsView()
		{
			init();
			addListeners();
		}
		
		private function init():void
		{
			var skin:Sprite = new GameSkin.MatchConfigSkin() as Sprite;
			addChild(skin);
			timeSelector1=skin.getChildByName("time_selector") as Sprite;
			stadiumSelector1=skin.getChildByName("stadium_selector") as Sprite;
			refereeSelector1=skin.getChildByName("referee_selector") as Sprite;
			timeSelector = new TimeSelector(skin.getChildByName("time_selector") as Sprite);
			stadiumSelector = new ImageSelector(skin.getChildByName("stadium_selector") as Sprite);
			refereeSelector = new ImageSelector(skin.getChildByName("referee_selector") as Sprite);
			teamSectionButton = skin.getChildByName("team_section_button") as Sprite;
			
		}
		
		private function addListeners():void
		{
			var selectorTween:MoveUpwardsTween = new MoveUpwardsTween();
			var stadiumTween:MoveUpwardsTween = new MoveUpwardsTween();
			var refereeTween:MoveUpwardsTween = new MoveUpwardsTween();
			selectorTween.tween(timeSelector1);
			stadiumTween.tween1(stadiumSelector1);
			refereeTween.tween2(refereeSelector1);
			stadiumSelector.addEventListener(SelectorEvent.SELECTED, handleSettingChanged);
			refereeSelector.addEventListener(SelectorEvent.SELECTED, handleSettingChanged);
			timeSelector.addEventListener(SelectorEvent.SELECTED, handleSettingChanged);
		}
		
		private function handleSettingChanged(e:SelectorEvent):void
		{
			dispatchEvent(new SettingsEvent(SettingsEvent.MATCH_SETTINGS_CHANGED, getSettings()));
		}
		
		private function getSettings():MatchSettingsDTO
		{
			var settings:MatchSettingsDTO = new MatchSettingsDTO();
			settings.selectedTime = timeSelector.selectedTime;
			settings.selectedReferee = refereeSelector.selectedId;
			settings.selectedStadium = stadiumSelector.selectedId;
			return settings;
		}
	}
}