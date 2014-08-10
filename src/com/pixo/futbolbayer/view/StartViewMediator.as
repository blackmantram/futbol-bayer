package com.pixo.futbolbayer.view
{
	import com.pixo.futbolbayer.controller.events.GameEvent;
	import com.pixo.futbolbayer.service.IAssetsLoadService;
	import com.pixo.futbolbayer.service.events.AssetsLoadedEvent;
	
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;

	public class StartViewMediator extends Mediator
	{
		[Inject]
		public var view:StartView;
		
		[Inject]
		public var service:IAssetsLoadService;
		
		public function StartViewMediator()
		{
			super();
		}
		
		override public function onRegister():void 
		{
			this.addContextListener(AssetsLoadedEvent.COMPLETE, handleAssetsLoaded);
			service.loadAssets();
		}
		
		private function handleAssetsLoaded(e:AssetsLoadedEvent):void
		{
			eventMap.mapListener(view.startButton, MouseEvent.CLICK, handleStartGame);
			eventMap.mapListener(view.helpButton, MouseEvent.CLICK, handleShowHelp);
		}
		
		private function handleStartGame(e:MouseEvent):void
		{
			dispatch(new GameEvent(GameEvent.MATCH_SETTINGS));
		}
		
		private function handleShowHelp(e:MouseEvent):void
		{
			trace("show help");
		}
	}
}