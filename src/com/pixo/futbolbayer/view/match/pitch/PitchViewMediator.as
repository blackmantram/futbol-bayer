package com.pixo.futbolbayer.view.match.pitch
{
	import com.pixo.futbolbayer.model.SettingsModel;
	import com.pixo.futbolbayer.view.events.DiceEvent;
	import com.pixo.futbolbayer.view.events.MatchEvent;
	import com.pixo.futbolbayer.view.events.MovementEvent;
	import com.pixo.futbolbayer.view.events.ReverseEvent;
	import com.pixo.futbolbayer.view.events.SpecialActionEvent;
	import com.pixo.futbolbayer.view.match.pitch.events.PitchEvent;
	
	import flash.events.Event;
	import flash.sampler.NewObjectSample;
	
	import org.robotlegs.mvcs.Mediator;

	public class PitchViewMediator extends Mediator
	{
		[Inject]
		public var view:PitchView;
		
		[Inject]
		public var settingsModel:SettingsModel;
		
		private var isMoving:Boolean = false;
		private var isReversing:Boolean = false;
		private var isPenalty:Boolean = false;
		private var isFreeKick:Boolean = false;
		
		override public function onRegister():void
		{
			view.setStadiumAsset(settingsModel.getStadiumAsset());	
			eventMap.mapListener(eventDispatcher, MatchEvent.NEXT_STEP, handleNextStep);
			eventMap.mapListener(eventDispatcher, MatchEvent.EXECUTE_PENALTY, handleExecutePenalty);
			eventMap.mapListener(eventDispatcher, MatchEvent.EXECUTE_FREE_KICK, handleExecuteFreeKick);
			eventMap.mapListener(eventDispatcher, MatchEvent.READY, handleReady);
			
			eventMap.mapListener(view, PitchEvent.GOAL, handleGoal);
			eventMap.mapListener(view, PitchEvent.MOVEMENT_COMPLETE, handleMovementComplete);
			eventMap.mapListener(view.dice, DiceEvent.ROLL_FINISHED, rollFinished);
			
			eventMap.mapListener(eventDispatcher, ReverseEvent.REVERSE, handleReverse);
			eventMap.mapListener(eventDispatcher, SpecialActionEvent.SPECIAL_ACTION_COMPLETED, handleSpecialActionCompleted);
			eventMap.mapListener(eventDispatcher, MatchEvent.END, handleEnd);
		}
		
		private function handleNextStep(e:MatchEvent):void
		{
			view.roll();
		}
		
		private function rollFinished(e:DiceEvent):void
		{
			if (isPenalty)
				shoot(e.movements, handlePenaltyMiss);
			else if (isFreeKick)
				shoot(e.movements, handleFreeKickMiss);
			else
				startMove(e.movements);
		}
		
		private function handlePenaltyMiss():void
		{
			dispatch(new MatchEvent(MatchEvent.RESUME));
		}
		
		private function handleFreeKickMiss():void
		{
			isFreeKick = false;
			dispatch(new SpecialActionEvent(SpecialActionEvent.SPECIAL_ACTION_FINISHED));
		}
		
		private function startMove(movements:int):void
		{
			isMoving = true;
			dispatch(new MovementEvent(MovementEvent.MOVEMENT, movements));
			view.move(movements);
		}
		
		private function handleReverse(event:ReverseEvent):void
		{
			isMoving = true;
			isReversing = true;
			view.move(4, event.direction);	
		}
		
		private function shoot(movements:int, callbackOnMiss:Function):void
		{
			if (movements > 3)
				dispatch(new MatchEvent(MatchEvent.SCORE));
			else
				callbackOnMiss();
			isPenalty = false;
			isFreeKick = false;
		}
		
		private function handleMovementComplete(e:PitchEvent):void
		{
			completeMovement();
		}
		
		private function completeMovement():void
		{
			dispatch(new MovementEvent(MovementEvent.MOVEMENT, view.movements));
			if (isMoving && view.movements == 0)
			{
				if (isReversing)
					finishReverse();
				else
					finishStep();
			}
		}
		
		private function finishReverse():void
		{
			isReversing = false;
			dispatch(new SpecialActionEvent(SpecialActionEvent.SPECIAL_ACTION_FINISHED));
		}
		
		private function finishStep():void
		{
			checkSpecialTile();
			isMoving = false;
		}
		
		private function checkSpecialTile():void
		{
			var specialTile:int = view.checkSpecialTile();
			if (specialTile>0)
				dispatch(new SpecialActionEvent(SpecialActionEvent.SPECIAL_ACTION_TRIGGERED, specialTile));
			else
				triggerStepFinished();
		}
		
		private function triggerStepFinished():void
		{
			dispatch(new MatchEvent(MatchEvent.STEP_FINISHED));
		}
		
		private function handleSpecialActionCompleted(e:SpecialActionEvent):void
		{
			triggerStepFinished();
		}
		
		private function handleExecutePenalty(e:MatchEvent):void
		{
			isPenalty = true;
			view.roll();
		}
		
		private function handleExecuteFreeKick(e:MatchEvent):void
		{
			isFreeKick = true;
			view.roll();
		}
		
		private function handleReady(e:MatchEvent):void
		{
			view.reset();
		}
		
		private function handleGoal(e:PitchEvent):void
		{
			isMoving = false;
			var matchEvent:MatchEvent = new MatchEvent(MatchEvent.SCORE);
			matchEvent.currentTurn = (e.team % 2) + 1;
			dispatch(matchEvent);
		}
		
		private function handleEnd(e:MatchEvent):void
		{
			view.reset();
			view.dice.visible = false;
			eventMap.unmapListeners();
		}
	}
}