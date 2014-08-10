package com.pixo.futbolbayer.view.events
{
	import com.pixo.futbolbayer.model.datatransferobjects.ISettingsDTO;
	
	import flash.events.Event;
	
	public class SettingsEvent extends Event
	{
		public static const MATCH_SETTINGS_CHANGED:String = "SettingsEvent.MatchSettingsChanged";
		public static const TEAM_SETTINGS_CHANGED:String = "SettingsEvent.TeamSettingsChanged";
		
		public var settings:ISettingsDTO;
		
		public function SettingsEvent(type:String, settings:ISettingsDTO, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.settings = settings;
			super(type, bubbles, cancelable);
		}
		
		override public function clone() : Event 
		{
			return new SettingsEvent(type, settings, bubbles, cancelable);
		}
	}
}