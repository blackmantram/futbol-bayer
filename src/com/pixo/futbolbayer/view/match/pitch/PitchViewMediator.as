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
		
		override public function onRegister():void
		{
			view.setStadiumAsset(settingsModel.getStadiumAsset());	
			eventMap.mapListener(eventDispatcher, MatchEvent.NEXT_STEP, handleNextStep);
			eventMap.mapListener(view, PitchEvent.MOVEMENT_COMPLETE, handleMovementComplete);
			eventMap.mapListener(view.dice, DiceEvent.ROLL_FINISHED, rollFinished);
		}
		
		private function handleNextStep(e:MatchEvent):void
		{
			view.roll();
		}
		
		private function rollFinished(e:DiceEvent):void
		{
			isMoving = true;
			dispatch(new MovementEvent(MovementEvent.MOVEMENT, e.movements));
			view.move(e.movements);
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
	}
}