package com.pixo.futbolbayer.view
{
	import com.pixo.futbolbayer.controller.events.GameEvent;
	import com.pixo.futbolbayer.model.MatchSettingsModel;
	import com.pixo.futbolbayer.model.TeamSettingsModel;
	import com.pixo.futbolbayer.model.datatransferobjects.MatchDTO;
	import com.pixo.futbolbayer.service.AssetsServiceResponse;
	import com.pixo.futbolbayer.service.IAssetsServiceResponse;
	
	import common.AssetType;
	import common.utils.TimeUtils;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	
	import org.robotlegs.mvcs.Mediator;

	public class BaseMatchMediator extends Mediator
	{
		[Inject]
		public var matchSettingsModel:MatchSettingsModel;
		
		[Inject]
		public var teamSettingsModel:TeamSettingsModel;
		
		[Inject]
		public var assetsServiceResponse:IAssetsServiceResponse;
		
		protected function createPreviewDTO():MatchDTO
		{
			var dto:MatchDTO = new MatchDTO();
			dto.stadiumName = matchSettingsModel.stadiumId.toString();
			dto.refereeName = matchSettingsModel.refereeId.toString();
			dto.matchTime = TimeUtils.convertToTimeStamp(matchSettingsModel.time);
			dto.team1Name = teamSettingsModel.team1.teamName;
			dto.team1Uniform = getAsset(teamSettingsModel.team1.uniformIndex, AssetType.UNIFORMS);
			dto.team2Name = teamSettingsModel.team2.teamName;
			dto.team2Uniform = getAsset(teamSettingsModel.team2.uniformIndex, AssetType.UNIFORMS);
			return dto;
		}
		
		protected function getAsset(uniformIndex:int, assetType:String):DisplayObject
		{
			var uniforms:Array = assetsServiceResponse.getAssetsByCategory(assetType);
			var uniform:Loader = uniforms[uniformIndex];
			return new Bitmap(Bitmap(uniform.content).bitmapData);
		}
	}
}