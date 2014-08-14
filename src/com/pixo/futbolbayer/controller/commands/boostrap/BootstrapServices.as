package com.pixo.futbolbayer.controller.commands.boostrap
{
	import com.pixo.futbolbayer.service.assets.AssetsLoadService;
	import com.pixo.futbolbayer.service.assets.AssetsServiceResponse;
	import com.pixo.futbolbayer.service.assets.IAssetsLoadService;
	import com.pixo.futbolbayer.service.assets.IAssetsServiceResponse;
	import com.pixo.futbolbayer.service.trivia.IQuestionsLoadService;
	import com.pixo.futbolbayer.service.trivia.IQuestionsParser;
	import com.pixo.futbolbayer.service.trivia.QuestionsLoadService;
	import com.pixo.futbolbayer.service.trivia.QuestionsParser;
	
	import org.robotlegs.mvcs.Command;

	public class BootstrapServices extends Command
	{
		override public function execute():void
		{
			injector.mapSingletonOf(IAssetsLoadService, AssetsLoadService);
			injector.mapSingletonOf(IAssetsServiceResponse, AssetsServiceResponse);
			injector.mapSingletonOf(IQuestionsLoadService, QuestionsLoadService);
			injector.mapSingletonOf(IQuestionsParser, QuestionsParser);
		}
	}
}