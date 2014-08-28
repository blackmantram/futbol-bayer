package com.pixo.futbolbayer.view
{
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import skins.GameSkin;
	
	public class SoundView extends Sprite
	{
		public var toggleSoundButton:Sprite;
		
		private var soundOn:Sprite;
		private var soundOff:Sprite;
		
		public function SoundView()
		{
			 setSkin();
		}
		
		private function setSkin():void
		{
			var skin:Sprite = new GameSkin.SoundSkin() as Sprite;
			addChild(skin);
			toggleSoundButton = skin.getChildByName("toggle_sound") as Sprite;
			soundOn = toggleSoundButton.getChildByName("sound_on") as Sprite;
			soundOff = toggleSoundButton.getChildByName("sound_off") as Sprite;
			soundOff.visible = false;
		}
		
		public function setSoundButtonState(isSoundOn:Boolean):void
		{
			if (isSoundOn)
			{
				soundOn.visible = true;
				soundOff.visible = false;
			}
			else
			{
				soundOn.visible = false;
				soundOff.visible = true;
			}
		}
	}
}