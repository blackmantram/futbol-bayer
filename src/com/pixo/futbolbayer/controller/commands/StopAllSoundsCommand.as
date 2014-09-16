package com.pixo.futbolbayer.controller.commands
{
	import com.pixo.futbolbayer.view.GameSoundIds;
	import com.pixo.futbolbayer.view.events.SoundEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class StopAllSoundsCommand extends Command
	{
		override public function execute():void
		{
			dispatch(new SoundEvent(SoundEvent.STOP, GameSoundIds.AMBIENCE, 0));
			dispatch(new SoundEvent(SoundEvent.STOP, GameSoundIds.LOOP, 0));
		}
	}
}