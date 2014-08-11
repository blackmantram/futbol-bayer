package com.pixo.futbolbayer.view.match
{
	import com.pixo.futbolbayer.view.events.StartMatchDataEvent;
	
	import org.robotlegs.mvcs.Mediator;

	public class HudViewMediator extends Mediator
	{
		[Inject]
		public var view:HudView;
		
		override public function onRegister():void
		{
			this.eventMap.mapListener(eventDispatcher, StartMatchDataEvent.DATA_READY, handleDataReady);
		}
		
		private function handleDataReady(e:StartMatchDataEvent):void
		{
			view.setData(e.startMatchDTO);
		}
	}
}