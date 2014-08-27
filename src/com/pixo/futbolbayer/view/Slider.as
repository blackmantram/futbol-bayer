package com.pixo.futbolbayer.view
{
	import flash.display.Sprite;
	import flash.events.Event;

	public class Slider extends Sprite
	{
		public function Slider()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
		}
		
		private function handleAddedToStage(e:Event):void
		{
			hideContent();
		}
		
		protected function hideContent():void
		{
			throw new Error("this class is abstract and should be implemented");
		}
		
		public function showContent():void
		{
			throw new Error("this class is abstract and should be implemented");
		}
	}
}