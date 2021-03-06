package com.pixo.futbolbayer.view
{
	import com.pixo.futbolbayer.controller.events.GameEvent;
	
	import common.AssetType;
	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	
	public class MatchSettingsViewMediator extends SettingsViewMediator
	{
		[Inject]
		public var matchSettingsView:MatchSettingsView;
		
		override protected function get view():DisplayObject
		{
			return matchSettingsView;
		}
		
		override protected function mapListeners():void
		{
			eventMap.mapListener(matchSettingsView.teamSectionButton, MouseEvent.CLICK, handleGoToTeamSettings);
			eventMap.mapListener(matchSettingsView.teamatras, MouseEvent.CLICK, handleGoToStart);
		}
		
		private function handleGoToTeamSettings(e:MouseEvent):void
		{
			dispatch(new GameEvent(GameEvent.TEAM_SETTINGS));
		}
		private function handleGoToStart(e:MouseEvent):void
		{
			dispatch(new GameEvent(GameEvent.START));
		}
		
		override protected function initSelectors():void
		{
			matchSettingsView.stadiumSelector.setItems(loadedAssets.getAssetsByCategory(AssetType.STADIUMS_THUMBS));
			matchSettingsView.refereeSelector.setItems(loadedAssets.getAssetsByCategory(AssetType.REFEREES_THUMBS));
		}
	}
}