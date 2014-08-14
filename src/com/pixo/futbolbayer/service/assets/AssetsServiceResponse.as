package com.pixo.futbolbayer.service.assets
{
	import flash.utils.Dictionary;

	public class AssetsServiceResponse implements IAssetsServiceResponse
	{
		private var _assets:Dictionary;
		
		public function AssetsServiceResponse()
		{
			_assets = new Dictionary();
		}
		
		public function getAssetsByCategory(category:String):Array
		{
			return _assets[category];
		}
		
		public function setAssetsByCategory(category:String, assets:Array):void
		{
			_assets[category] = assets;
		}
	}
}