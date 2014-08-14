package com.pixo.futbolbayer.service.events
{
	import com.pixo.futbolbayer.service.assets.IAssetsServiceResponse;
	
	import flash.events.Event;

	public class AssetsLoadedEvent extends Event
	{
		public static const COMPLETE:String = "AssetsLoadedEvent.complete";
		
		public function AssetsLoadedEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false )
		{
			super(type, bubbles, cancelable);		
		}
		
		override public function clone() : Event 
		{
			return new AssetsLoadedEvent(type, bubbles, cancelable);
		}
		
	}
}