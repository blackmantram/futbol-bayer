package common.utils
{
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.system.LoaderContext;
	
	import mx.core.ByteArrayAsset;
	
	public class StreamedContentLoader extends EventDispatcher
	{
		private var loader:Loader;
		private var _content:DisplayObject;
		
		public function get content():DisplayObject
		{
			return _content;
		}
		
		public function load(contentClass:Class):void
		{
			var contentInstance:ByteArrayAsset = new contentClass();
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.INIT, handleAnimationLoaded);
			var context:LoaderContext = new LoaderContext();
			context.allowCodeImport = true;
			loader.loadBytes(contentInstance, context);
		}
		
		private function handleAnimationLoaded(e:Event):void
		{
			loader.contentLoaderInfo.removeEventListener(Event.INIT, handleAnimationLoaded);
			_content = DisplayObject(loader.content);
			dispatchEvent(new Event(Event.COMPLETE));
		}
	}
}