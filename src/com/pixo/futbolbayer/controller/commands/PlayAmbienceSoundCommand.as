package com.pixo.futbolbayer.controller.commands
{
	import com.pixo.futbolbayer.view.GameSoundIds;
	import com.pixo.futbolbayer.view.events.SoundEvent;
	
	import org.robotlegs.mvcs.Command;

	public class PlayAmbienceSoundCommand extends Command
	{
		override public function execute():void
		{
			dispatch(new SoundEvent(SoundEvent.START, GameSoundIds.AMBIENCE, int.MAX_VALUE, 0.01));
		}
	}
}