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
			this.eventMap.mapListener(eventDispatcher, MatchEvent.OFF_SIDE, handleOffSide);
			this.eventMap.mapListener(eventDispatcher, MatchEvent.FAULT, handleFault);
			this.eventMap.mapListener(eventDispatcher, MatchEvent.HAND_BALL, handleHandBall);
			this.eventMap.mapListener(eventDispatcher, MatchEvent.FREE_KICK, handleFreeKick);
			this.eventMap.mapListener(view, Event.COMPLETE, handleComplete);
		}
		
		private function handleScore(e:MatchEvent):void
		{
			view.playGoal();
		}
		
		private function handleOffSide(e:MatchEvent):void
		{
			view.playOffSide();
		}
		
		private function handleFault(e:MatchEvent):void
		{
			view.playFault();
		}
		
		private function handleHandBall(e:MatchEvent):void
		{
			view.playHandBall();
		}
		
		private function handleFreeKick(e:MatchEvent):void
		{
			view.playFreeKick();
		}
		
		private function handleComplete(e:Event):void
		{
			dispatch(new AnimationEvent(AnimationEvent.ANIMATION_FINISHED));
		}
	}
}