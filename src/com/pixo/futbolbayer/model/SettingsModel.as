package com.pixo.futbolbayer.model
{
	import com.pixo.futbolbayer.model.datatransferobjects.HudDTO;
	import com.pixo.futbolbayer.model.datatransferobjects.PreviewMatchDTO;
	import com.pixo.futbolbayer.service.assets.AssetsServiceResponse;
	import com.pixo.futbolbayer.service.assets.IAssetsServiceResponse;
	
	import common.AssetType;
	import common.utils.TimeUtils;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	
	import org.robotlegs.mvcs.Actor;

	public class SettingsModel extends Actor
	{
		public var matchSettings:MatchSettings = new MatchSettings();
		public var teamSettings:TeamSettings = new TeamSettings();
		
		[Inject]
		public var assetsServiceResponse:IAssetsServiceResponse;
		
		public function reset():void
		{
			matchSettings.reset();
			teamSettings.reset();
		}
		
		public function createPreviewDTO():PreviewMatchDTO
		{
			var dto:PreviewMatchDTO = new PreviewMatchDTO();
			dto.stadiumName = matchSettings.stadiumId.toString();
			dto.refereeName = matchSettings.refereeId.toString();
			dto.hudData = createHudDTO();
			return dto;
		}
		
		public function createHudDTO():HudDTO
		{
			var dto:HudDTO = new HudDTO();
			dto.matchTime = TimeUtils.convertToTimeStamp(matchSettings.time);
			dto.team1Name = teamSettings.team1.teamName;
			dto.team1Uniform = getAsset(teamSettings.team1.uniformIndex, AssetType.UNIFORMS);
			dto.team2Name = teamSettings.team2.teamName;
			dto.team2Uniform = getAsset(teamSettings.team2.uniformIndex, AssetType.UNIFORMS);
			return dto;
		}
		
		public function getStadiumAsset():DisplayObject
		{
			return getAsset(matchSettings.stadiumId, AssetType.STADIUMS);
		}
		
		public function getBannerAsset():DisplayObject
		{
			return getAsset(0, AssetType.BANNERS);
		}
		
		public function getRefereeAsset():DisplayObject
		{
			return getAsset(matchSettings.refereeId, AssetType.REFEREES);
		}
		
		private function getAsset(assetIndex:int, assetType:String):DisplayObject
		{
			var assets:Array = assetsServiceResponse.getAssetsByCategory(assetType);
			var asset:Loader = assets[assetIndex];
			return asset.content is Bitmap ? new Bitmap(Bitmap(asset.content).bitmapData) : asset;
		}
	}
}