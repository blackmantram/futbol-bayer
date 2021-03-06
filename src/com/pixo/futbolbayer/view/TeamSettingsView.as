package com.pixo.futbolbayer.view
{
	import com.pixo.futbolbayer.controller.events.GameEvent;
	import com.pixo.futbolbayer.model.datatransferobjects.MatchSettingsDTO;
	import com.pixo.futbolbayer.model.datatransferobjects.TeamSettingsDTO;
	import com.pixo.futbolbayer.view.events.SelectorEvent;
	import com.pixo.futbolbayer.view.events.SettingsEvent;
	import com.pixo.futbolbayer.view.general.ImageSelector;
	import com.pixo.futbolbayer.view.tweens.VerticalShowTween;
	
	import common.utils.GlobalConstants;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import flashx.textLayout.events.SelectionEvent;
	
	import assets.skins.GameSkin;

	public class TeamSettingsView extends Slider
	{
		private var team1NameInputText:TextField;
		private var team2NameInputText:TextField;
		
		private var team1Selector:ImageSelector;
		private var team2Selector:ImageSelector;
		
		public var matchSectionButton:Sprite;
		public var previewButton:Sprite;
		public var backButton:Sprite;
		
		public function TeamSettingsView()
		{
			init();
			setDefaultText();
			addListeners();
		}
		
		private function init():void
		{
			var skin:Sprite = new GameSkin.TeamConfigSkin() as Sprite;
			addChild(skin);
			team1Selector = new ImageSelector(skin.getChildByName("team1_selector") as Sprite);
			team2Selector = new ImageSelector(skin.getChildByName("team2_selector") as Sprite);
			team1NameInputText = skin.getChildByName("team1_name") as TextField;
			team2NameInputText = skin.getChildByName("team2_name") as TextField;
			matchSectionButton = skin.getChildByName("match_section_button") as Sprite;
			previewButton = skin.getChildByName("preview_button") as Sprite;
			backButton = skin.getChildByName("back_button") as Sprite;
		}
		
		private function setDefaultText():void
		{
			team1NameInputText.text = GlobalConstants.TEAM1_DEFAULT_NAME;
			team2NameInputText.text = GlobalConstants.TEAM2_DEFAULT_NAME;
		}
		
		private function addListeners():void
		{
			team1Selector.addEventListener(SelectorEvent.SELECTED, handleSettingChanged);
			team2Selector.addEventListener(SelectorEvent.SELECTED, handleSettingChanged);
			team1NameInputText.addEventListener(KeyboardEvent.KEY_UP, handleSettingChanged);
			team2NameInputText.addEventListener(KeyboardEvent.KEY_UP, handleSettingChanged);
		}
		
		private function handleSettingChanged(e:Event):void
		{
			dispatchEvent(new SettingsEvent(SettingsEvent.TEAM_SETTINGS_CHANGED, getSettings()));
		}
		
		private function getSettings():TeamSettingsDTO
		{
			var settings:TeamSettingsDTO = new TeamSettingsDTO();
			settings.selectedTeam1Uniform = team1Selector.selectedId;
			settings.selectedTeam2Uniform = team2Selector.selectedId;
			settings.team1Name = team1NameInputText.text;
			settings.team2Name = team2NameInputText.text;
			return settings;
		}
		
		override protected function hideContent():void
		{
			team1Selector.skin.alpha = 0;
			team2Selector.skin.alpha = 0;
		}
		
		override public function showContent():void
		{
			x = 0;
			var tween:VerticalShowTween = new VerticalShowTween();
			tween.tween(team1Selector.skin, 0);
			tween.tween(team2Selector.skin, .25);
		}
		
		public function setUniforms(uniforms:Array):void
		{
			team1Selector.setItems(uniforms);
			team2Selector.setItems(createUniformsArrayCopy(uniforms), 11);
		}
		
		private function createUniformsArrayCopy(uniforms:Array):Array
		{
			var copy:Array = new Array();
			for each(var loader:Loader in uniforms)
				copy.push(new Bitmap(Bitmap(loader.content).bitmapData));
				
				
			return copy;
		}
		
		public function reset():void
		{
			setDefaultText();
			team1Selector.reset();
			team2Selector.reset();
		}
	}
}