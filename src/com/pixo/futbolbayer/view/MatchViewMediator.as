package com.pixo.futbolbayer.view
{
	import com.pixo.futbolbayer.model.MatchSettingsModel;
	import com.pixo.futbolbayer.model.TeamSettingsModel;
	import com.pixo.futbolbayer.model.datatransferobjects.MatchDTO;
	import com.pixo.futbolbayer.service.IAssetsServiceResponse;
	import com.pixo.futbolbayer.view.events.DiceEvent;
	
	import common.AssetType;
	
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class MatchViewMediator extends BaseMatchMediator
	{
		[Inject]
		public var view:MatchView;
		
		override public function onRegister():void
		{
			view.setData(createPreviewDTO());
			this.eventMap.mapListener(view.dice.clip, MouseEvent.CLICK, handleDiceRolled);
			this.eventMap.mapListener(view.dice, DiceEvent.ROLL_FINISHED, handleRollFinished);
		}
		
		override protected function createPreviewDTO():MatchDTO
		{
			var dto:MatchDTO = super.createPreviewDTO();
			dto.stadium = getAsset(matchSettingsModel.stadiumId, AssetType.STADIUMS);
			return dto; 
		}
		
		private function handleDiceRolled(e:MouseEvent):void
		{
			this.eventMap.unmapListener(view.dice.clip, MouseEvent.CLICK, handleDiceRolled);
			view.dice.roll();
		}
		
		private function handleRollFinished(e:DiceEvent):void
		{
			this.eventMap.mapListener(view.dice.clip, MouseEvent.CLICK, handleDiceRolled);
			view.move();
		}
	}
}