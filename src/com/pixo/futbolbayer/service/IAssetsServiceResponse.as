package com.pixo.futbolbayer.service
{
	public interface IAssetsServiceResponse
	{
		function getAssetsByCategory(category:String):Array;
		function setAssetsByCategory(category:String, assets:Array):void;
	}
}