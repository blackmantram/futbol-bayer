package com.pixo.futbolbayer.view
{
	import com.pixo.futbolbayer.view.events.AnimationEvent;
	import com.pixo.futbolbayer.view.events.MatchEvent;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class AnimationViewMediator extends Mediator
	{
		[Inject]
		public var view:AnimationsView;
		
		override public function onRegister():void
		{
			this.eventMap.mapListener(eventDispatcher, MatchEvent.SCORE, handleScore);
			this.eventMap.mapListener(view, Event.COMPLETE, handleComplete);
		}
		
		private function handleScore(e:MatchEvent):void
		{
			view.playGoal();
		}
		
		private function handleComplete(e:Event):void
		{
			dispatch(new AnimationEvent(AnimationEvent.ANIMATION_FINISHED));
		}
	}
}