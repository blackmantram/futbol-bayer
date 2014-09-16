package com.pixo.futbolbayer.view
{
	import com.pixo.futbolbayer.controller.events.GameEvent;
	import com.pixo.futbolbayer.service.assets.IAssetsServiceResponse;
	import com.pixo.futbolbayer.view.events.SettingsEvent;
	
	import flash.display.DisplayObject;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class SettingsViewMediator extends Mediator
	{
		protected function get view():DisplayObject
		{
			throw new Error("this class is abstract and should be implemented");
		}
		
		[Inject]
		public var loadedAssets:IAssetsServiceResponse;
		
		override public function onRegister():void
		{
			eventMap.mapListener(view, SettingsEvent.MATCH_SETTINGS_CHANGED, handleSettingsChanged);
			eventMap.mapListener(view, SettingsEvent.TEAM_SETTINGS_CHANGED, handleSettingsChanged);
			mapListeners();
			initSelectors();
		}
		
		private function handleSettingsChanged(e:SettingsEvent):void
		{
			this.dispatch(e);
		}
		
		protected function mapListeners():void
		{
			
		}
			
		protected function initSelectors():void
		{
			throw new Error("this class is abstract and should be implemented");
		}
	}
}