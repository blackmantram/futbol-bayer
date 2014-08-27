package com.pixo.futbolbayer.service.assets
{
	import flash.media.Sound;

	public interface ISoundsService
	{
		function getSound(sound:String):Sound;
		function loadSounds():void;
	}
}