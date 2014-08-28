package com.pixo.futbolbayer.view.sounds
{
	import flash.media.SoundChannel;

	public class GameSoundObject
	{
		public var channel:SoundChannel = new SoundChannel();
		public var isPlaying:Boolean;
		public var currentVolume:Number;
	}
}