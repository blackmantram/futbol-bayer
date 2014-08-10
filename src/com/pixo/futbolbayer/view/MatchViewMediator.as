package com.pixo.futbolbayer.view
{
	import com.pixo.futbolbayer.model.MatchSettingsModel;
	import com.pixo.futbolbayer.model.TeamSettingsModel;
	import com.pixo.futbolbayer.model.datatransferobjects.MatchDTO;
	import com.pixo.futbolbayer.service.IAssetsServiceResponse;
	
	import common.AssetType;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class MatchViewMediator extends BaseMatchMediator
	{
		[Inject]
		public var view:MatchView;
		
		override public function onRegister():void
		{
			view.setData(createPreviewDTO());
		}
		
		override protected function createPreviewDTO():MatchDTO
		{
			var dto:MatchDTO = super.createPreviewDTO();
			dto.stadium = getAsset(matchSettingsModel.stadiumId, AssetType.STADIUMS);
			return dto; 
		}
	}
}