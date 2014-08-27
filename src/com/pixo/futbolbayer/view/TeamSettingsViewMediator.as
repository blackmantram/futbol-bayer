package com.pixo.futbolbayer.view
{
	import com.pixo.futbolbayer.controller.events.GameEvent;
	import com.pixo.futbolbayer.view.events.SettingsEvent;
	
	import common.AssetType;
	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	
	public class TeamSettingsViewMediator extends SettingsViewMediator
	{
		[Inject]
		public var teamSettingsView:TeamSettingsView;
		
		override protected function get view():DisplayObject
		{
			return teamSettingsView;
		}
		
		override protected function mapListeners():void
		{
			eventMap.mapListener(teamSettingsView.matchSectionButton,  MouseEvent.CLICK, handleGoToMatchSettings);
			eventMap.mapListener(teamSettingsView.previewButton, MouseEvent.CLICK, handleGoToPreview);
			eventMap.mapListener(eventDispatcher, GameEvent.TEAM_SETTINGS, handleTeamSettings);
		}
		
		private function handleTeamSettings(e:GameEvent):void
		{
			
		}
		
		override protected function initSelectors():void
		{
			teamSettingsView.setUniforms(loadedAssets.getAssetsByCategory(AssetType.UNIFORMS));
		}
		
		private function handleGoToMatchSettings(e:MouseEvent):void
		{
			dispatch(new GameEvent(GameEvent.MATCH_SETTINGS));
		}
		
		private function handleGoToPreview(e:MouseEvent):void
		{
			dispatch(new GameEvent(GameEvent.PREVIEW));
		}
	}
}