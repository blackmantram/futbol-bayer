package com.pixo.futbolbayer.controller.commands.boostrap
{
	import com.pixo.futbolbayer.service.AssetsLoadService;
	import com.pixo.futbolbayer.service.AssetsServiceResponse;
	import com.pixo.futbolbayer.service.IAssetsLoadService;
	import com.pixo.futbolbayer.service.IAssetsServiceResponse;
	
	import org.robotlegs.mvcs.Command;

	public class BootstrapServices extends Command
	{
		override public function execute():void
		{
			injector.mapSingletonOf(IAssetsLoadService, AssetsLoadService);
			injector.mapSingletonOf(IAssetsServiceResponse, AssetsServiceResponse);
		}
	}
}