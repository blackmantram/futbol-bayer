package com.pixo.futbolbayer.view.match.pitch
{
	import com.pixo.futbolbayer.model.SettingsModel;
	import com.pixo.futbolbayer.view.events.DiceEvent;
	import com.pixo.futbolbayer.view.events.MatchEvent;
	import com.pixo.futbolbayer.view.events.MovementEvent;
	import com.pixo.futbolbayer.view.match.pitch.events.PitchEvent;
	
	import flash.sampler.NewObjectSample;
	
	import org.robotlegs.mvcs.Mediator;

	public class PitchViewMediator extends Mediator
	{
		[Inject]
		public var view:PitchView;
		
		[Inject]
		public var settingsModel:SettingsModel;
		
		private var isMoving:Boolean = false;
		
		private var isPenalty:Boolean = false;
		
		override public function onRegister():void
		{
			view.setStadiumAsset(settingsModel.getStadiumAsset());	
			eventMap.mapListener(eventDispatcher, MatchEvent.NEXT_STEP, handleNextStep);
			eventMap.mapListener(eventDispatcher, MatchEvent.EXECUTE_PENALTY, handleExecutePenalty);
			eventMap.mapListener(eventDispatcher, MatchEvent.READY, handleReady);
			
			eventMap.mapListener(view, PitchEvent.GOAL, handleGoal);
			eventMap.mapListener(view, PitchEvent.MOVEMENT_COMPLETE, handleMovementComplete);
			eventMap.mapListener(view.dice, DiceEvent.ROLL_FINISHED, rollFinished);
			
			this.eventMap.mapListener(eventDispatcher, MatchEvent.END, handleEnd);
		}
		
		private function handleNextStep(e:MatchEvent):void
		{
			view.roll();
		}
		
		private function rollFinished(e:DiceEvent):void
		{
			if (!isPenalty)
				startMove(e.movements);
			else
				shootPenalty(e.movements);
		}
		
		private function startMove(movements:int):void
		{
			isMoving = true;
			dispatch(new MovementEvent(MovementEvent.MOVEMENT, movements));
			view.move(movements);
		}
		
		private function shootPenalty(movements:int):void
		{
			//if (movements > 3)
				dispatch(new MatchEvent(MatchEvent.SCORE));
			//else
				//finishStep();
			isPenalty = false;
		}
		
		private function handleMovementComplete(e:PitchEvent):void
		{
			dispatch(new MovementEvent(MovementEvent.MOVEMENT, view.movements));
			if (isMoving && view.movements == 0)
				finishStep();
		}
		
		private function finishStep():void
		{
			isMoving = false;
			dispatch(new MatchEvent(MatchEvent.STEP_FINISHED));
		}
		
		private function handleExecutePenalty(e:MatchEvent):void
		{
			isPenalty = true;
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
			matchEvent.currentTurn = (e.scoredTeam % 2) + 1;
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