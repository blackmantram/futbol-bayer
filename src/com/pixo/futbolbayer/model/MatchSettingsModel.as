package com.pixo.futbolbayer.model
{
	import com.pixo.futbolbayer.model.datatransferobjects.MatchSettingsDTO;
	
	import org.robotlegs.mvcs.Actor;
	
	public class MatchSettingsModel extends Actor
	{
		public var time:int;
		
		public var stadiumId:int;
		
		public var refereeId:int;
		
		public function update(settings:MatchSettingsDTO):void
		{
			time = settings.selectedTime * 60;
			stadiumId = settings.selectedStadium;
			refereeId = settings.selectedReferee;
		}
	}
}