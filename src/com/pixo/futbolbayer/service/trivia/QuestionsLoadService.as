package com.pixo.futbolbayer.service.trivia
{
	import com.pixo.futbolbayer.service.events.QuestionsLoadedEvent;
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import org.osmf.events.LoaderEvent;
	import org.robotlegs.mvcs.Actor;
	
	public class QuestionsLoadService extends Actor implements IQuestionsLoadService
	{
		private const jsonFile:String = "trivia.json";
		
		private var loader:URLLoader;
		
		private var _parser:IQuestionsParser;
		
		[Inject]
		public function set parser(value:IQuestionsParser):void
		{
			_parser = value;
		}
		
		public function loadQuestions():void
		{
			loader = new URLLoader(new URLRequest(jsonFile));
			addLoaderListeners();
		}
		
		private function handleError(event:SecurityErrorEvent):void
		{
			trace(event.text);
			removeLoaderListeners();
		}
		
		private function handleIOError(event:IOErrorEvent):void
		{
			trace(event.text);
			removeLoaderListeners();
		}
		
		private function handleLoadComplete(event:Event):void
		{
			var data:Object = loader.data;
			_parser.parseQuestions(data);
			removeLoaderListeners();
		}
		
		private function addLoaderListeners():void
		{
			loader.addEventListener(IOErrorEvent.IO_ERROR, handleIOError);
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, handleError);
			loader.addEventListener(Event.COMPLETE, handleLoadComplete);
		}
		
		private function removeLoaderListeners():void
		{
			loader.removeEventListener(IOErrorEvent.IO_ERROR, handleError);
			loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, handleError);
			loader.removeEventListener(Event.COMPLETE, handleLoadComplete);
		}
	}
}