package com.pixo.futbolbayer.model
{
	import com.pixo.futbolbayer.model.datatransferobjects.MatchSettingsDTO;
	
	public class MatchSettings
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