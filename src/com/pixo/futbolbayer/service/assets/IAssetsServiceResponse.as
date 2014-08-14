package com.pixo.futbolbayer.service.assets
{
	public interface IAssetsServiceResponse
	{
		function getAssetsByCategory(category:String):Array;
		function setAssetsByCategory(category:String, assets:Array):void;
	}
}