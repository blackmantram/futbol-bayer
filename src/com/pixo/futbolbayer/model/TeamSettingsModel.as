package com.pixo.futbolbayer.model
{
	import com.pixo.futbolbayer.model.datatransferobjects.TeamSettingsDTO;
	
	import org.robotlegs.mvcs.Actor;

	public class TeamSettingsModel extends Actor
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
	}
}