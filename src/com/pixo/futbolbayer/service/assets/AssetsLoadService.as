package com.pixo.futbolbayer.service.assets
{
	import com.pixo.futbolbayer.service.events.AssetsLoadedEvent;
	
	import common.AssetType;
	import common.utils.DictionaryFactory;
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	
	import org.robotlegs.mvcs.Actor;
	
	public class AssetsLoadService extends Actor implements IAssetsLoadService
	{
		private const assetsFolders:Array = [
				{category:AssetType.REFEREES_THUMBS,folder:"referees/thumbs/"},
				{category:AssetType.REFEREES,folder:"referees/characters/"},
				{category:AssetType.STADIUMS_THUMBS,folder:"stadiums/thumbs"},
				{category:AssetType.UNIFORMS,folder:"uniforms/"},
				{category:AssetType.STADIUMS,folder:"stadiums/fields"},
				{category:AssetType.BANNERS,folder:"banner"}
			];
		
		[Inject]
		public var serviceResponse:IAssetsServiceResponse;
				
		private var currentLoadingIndex:int;
		
		public function loadAssets():void
		{
			currentLoadingIndex = 0;
			loadNextFolder();
		}
		
		private function loadNextFolder():void
		{
			if (currentLoadingIndex < assetsFolders.length)
			{
				loadCurrentFolder();
			}
			else
			{
				dispatchCompleteEvent();
			}
		}
		
		private function loadCurrentFolder():void
		{
			var category:String = assetsFolders[currentLoadingIndex]["category"];
			var assets:String = assetsFolders[currentLoadingIndex]["folder"];
			serviceResponse.setAssetsByCategory(category, loadFromFolder(assets));
			currentLoadingIndex++;
			loadNextFolder();
		}
		
		private function loadFromFolder(folder:String):Array
		{
			var loadedItems:Array = new Array();
			var assetsFolder:File = File.applicationDirectory.resolvePath(folder);
			for each (var file:File in assetsFolder.getDirectoryListing())
			{
				var loader:Loader= new Loader();
				loader.load(new URLRequest(file.nativePath));
				loadedItems.push(loader);
			}
			return loadedItems;
		}
		
		private function dispatchCompleteEvent():void
		{
			this.dispatch(new AssetsLoadedEvent(AssetsLoadedEvent.COMPLETE));
		}
	}
}