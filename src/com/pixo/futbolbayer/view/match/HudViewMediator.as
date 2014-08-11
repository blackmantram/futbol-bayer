package com.pixo.futbolbayer.view.match
{
	import com.pixo.futbolbayer.model.MatchModel;
	import com.pixo.futbolbayer.view.events.MatchProgressEvent;
	import com.pixo.futbolbayer.view.events.StartMatchDataEvent;
	
	import org.robotlegs.mvcs.Mediator;

	public class HudViewMediator extends Mediator
	{
		[Inject]
		public var view:HudView;
		
		[Inject]
		public var matchModel:MatchModel;
		
		override public function onRegister():void
		{
			this.eventMap.mapListener(eventDispatcher, StartMatchDataEvent.DATA_READY, handleStartMatchDataReady);
			this.eventMap.mapListener(eventDispatcher, MatchProgressEvent.PROGRESS, handleMatchProgress);
		}
		
		private function handleStartMatchDataReady(e:StartMatchDataEvent):void
		{
			view.setData(e.startMatchDTO);
		}
		
		private function handleMatchProgress(e:MatchProgressEvent):void
		{
			view.setMatchProgress(matchModel.createMatchProgressDTO());
		}
	}
}