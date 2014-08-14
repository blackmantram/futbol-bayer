package com.pixo.futbolbayer.model
{
	import com.pixo.futbolbayer.model.datatransferobjects.StartMatchDTO;
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
		
		public function createStartMatchDTO():StartMatchDTO
		{
			var dto:StartMatchDTO = new StartMatchDTO();
			dto.stadiumName = matchSettings.stadiumId.toString();
			dto.refereeName = matchSettings.refereeId.toString();
			dto.matchTime = TimeUtils.convertToTimeStamp(matchSettings.time);
			dto.team1Name = teamSettings.team1.teamName;
			dto.team1Uniform = getAsset(teamSettings.team1.uniformIndex, AssetType.UNIFORMS);
			dto.team2Name = teamSettings.team2.teamName;
			dto.team2Uniform = getAsset(teamSettings.team2.uniformIndex, AssetType.UNIFORMS);
			dto.stadium = getAsset(matchSettings.stadiumId, AssetType.STADIUMS);
			return dto;
		}
		
		private function getAsset(uniformIndex:int, assetType:String):DisplayObject
		{
			var uniforms:Array = assetsServiceResponse.getAssetsByCategory(assetType);
			var uniform:Loader = uniforms[uniformIndex];
			return new Bitmap(Bitmap(uniform.content).bitmapData);
		}
	}
}