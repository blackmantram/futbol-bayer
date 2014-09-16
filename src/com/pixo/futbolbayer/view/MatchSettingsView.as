package com.pixo.futbolbayer.view
{
	import com.pixo.futbolbayer.controller.events.GameEvent;
	import com.pixo.futbolbayer.model.datatransferobjects.MatchSettingsDTO;
	import com.pixo.futbolbayer.view.events.SelectorEvent;
	import com.pixo.futbolbayer.view.events.SettingsEvent;
	import com.pixo.futbolbayer.view.general.ImageSelector;
	import com.pixo.futbolbayer.view.general.Selector;
	import com.pixo.futbolbayer.view.general.TimeSelector;
	import com.pixo.futbolbayer.view.tweens.VerticalShowTween;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import flashx.textLayout.events.SelectionEvent;
	
	import skins.GameSkin;

	public class MatchSettingsView extends Slider
	{
		private var timeSelector:TimeSelector;
		public var stadiumSelector:ImageSelector;
		public var refereeSelector:ImageSelector;
		public var teamSectionButton:Sprite;
		public var teamatras:Sprite;
		
		public function MatchSettingsView()
		{
			init();
			addListeners();
		}
		
		private function init():void
		{
			var skin:Sprite = new GameSkin.MatchConfigSkin() as Sprite;
			addChild(skin);
			timeSelector = new TimeSelector(skin.getChildByName("time_selector") as Sprite);
			stadiumSelector = new ImageSelector(skin.getChildByName("stadium_selector") as Sprite);
			refereeSelector = new ImageSelector(skin.getChildByName("referee_selector") as Sprite);
			teamSectionButton = skin.getChildByName("team_section_button") as Sprite;
			teamatras = skin.getChildByName("back_button") as Sprite;
			
		}
		
		private function addListeners():void
		{
			stadiumSelector.addEventListener(SelectorEvent.SELECTED, handleSettingChanged);
			refereeSelector.addEventListener(SelectorEvent.SELECTED, handleSettingChanged);
			timeSelector.addEventListener(SelectorEvent.SELECTED, handleSettingChanged);
			
		}
		
		override protected function hideContent():void
		{
			timeSelector.skin.alpha = 0;
			stadiumSelector.skin.alpha = 0;
			refereeSelector.skin.alpha = 0;
		}
		
		override public function showContent():void
		{
			x = 0;
			var tween:VerticalShowTween = new VerticalShowTween();
			tween.tween(timeSelector.skin, 0);
			tween.tween(stadiumSelector.skin, .25);
			tween.tween(refereeSelector.skin, .50);
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
		
		public function reset():void
		{
			timeSelector.reset();
			refereeSelector.reset();
			stadiumSelector.reset();
		}
	}
}