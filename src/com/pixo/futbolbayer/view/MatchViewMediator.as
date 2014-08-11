package com.pixo.futbolbayer.view
{
	import com.pixo.futbolbayer.model.MatchModel;
	import com.pixo.futbolbayer.model.SettingsModel;
	import com.pixo.futbolbayer.model.datatransferobjects.MatchProgressDTO;
	import com.pixo.futbolbayer.model.datatransferobjects.StartMatchDTO;
	import com.pixo.futbolbayer.service.IAssetsServiceResponse;
	import com.pixo.futbolbayer.view.events.DiceEvent;
	import com.pixo.futbolbayer.view.events.MatchProgressEvent;
	import com.pixo.futbolbayer.view.events.StartMatchDataEvent;
	
	import common.AssetType;
	
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class MatchViewMediator extends Mediator
	{
		[Inject]
		public var view:MatchView;
		
		[Inject]
		public var settingsModel:SettingsModel;
		
		[Inject]
		public var matchModel:MatchModel;
		
		override public function onRegister():void
		{
			setStartMatchData();
			this.eventMap.mapListener(view, MatchProgressEvent.PROGRESS, handleMatchProgress);
			this.eventMap.mapListener(view.dice.clip, MouseEvent.CLICK, handleDiceRolled);
			this.eventMap.mapListener(view.dice, DiceEvent.ROLL_FINISHED, handleRollFinished);
		}
		
		private function setStartMatchData():void
		{
			var startMatchDTO:StartMatchDTO = settingsModel.createStartMatchDTO();
			view.setData(startMatchDTO);
			dispatch(new StartMatchDataEvent(StartMatchDataEvent.DATA_READY, startMatchDTO));
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
		
		private function handleMatchProgress(e:MatchProgressEvent):void
		{
			updateModel();
			this.dispatch(e);
		}
		
		private function updateModel():void
		{
			matchModel.movementsLeft = view.pitch.movementsLeft;
			matchModel.team1Goals = 0;
			matchModel.team2Goals = 0;
		}
	}
}