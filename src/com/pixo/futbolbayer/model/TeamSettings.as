package com.pixo.futbolbayer.model
{
	import com.pixo.futbolbayer.model.datatransferobjects.TeamSettingsDTO;
	
	import common.utils.GlobalConstants;
	
	public class TeamSettings
	{
		public var team1:Team = new Team();
		public var team2:Team = new Team();
		
		public function update(settings:TeamSettingsDTO):void
		{
			team1.teamName = settings.team1Name;
			team1.uniformIndex = settings.selectedTeam1Uniform;
			team2.teamName = settings.team2Name;
			team2.uniformIndex = settings.selectedTeam2Uniform;
		}
		
		public function reset():void
		{
			team1.teamName = GlobalConstants.TEAM1_DEFAULT_NAME;
			team1.uniformIndex = 0;
			team2.teamName = GlobalConstants.TEAM2_DEFAULT_NAME;
			team2.uniformIndex = 0;
		}
	}
}