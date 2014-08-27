package com.pixo.futbolbayer.view
{
	import com.pixo.futbolbayer.controller.events.GameEvent;
	import com.pixo.futbolbayer.service.assets.IAssetsLoadService;
	import com.pixo.futbolbayer.service.assets.ISoundsService;
	import com.pixo.futbolbayer.service.events.AssetsLoadedEvent;
	import com.pixo.futbolbayer.service.trivia.IQuestionsLoadService;
	import com.pixo.futbolbayer.view.events.SoundEvent;
	
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;

	public class StartViewMediator extends Mediator
	{
		[Inject]
		public var view:StartView;
		
		[Inject]
		public var assetsService:IAssetsLoadService;
		
		[Inject]
		public var soundsService:ISoundsService;
		
		[Inject]
		public var questionsService:IQuestionsLoadService;
		
		public function StartViewMediator()
		{
			super();
		}
		
		override public function onRegister():void 
		{
			this.addContextListener(AssetsLoadedEvent.COMPLETE, handleAssetsLoaded);
			assetsService.loadAssets();
			soundsService.loadSounds();
			questionsService.loadQuestions();
			dispatch(new SoundEvent(SoundEvent.START, GameSoundIds.LOOP, int.MAX_VALUE, 0.8));
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