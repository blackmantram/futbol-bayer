package com.pixo.futbolbayer.model
{
	import com.pixo.futbolbayer.model.datatransferobjects.MatchProgressDTO;
	
	import org.robotlegs.mvcs.Actor;

	public class MatchModel extends Actor
	{
		public var currentTime:int;
		public var team1Goals:int;
		public var team2Goals:int;
		public var movementsLeft:int;
		
		public function createMatchProgressDTO():MatchProgressDTO
		{
			var dto:MatchProgressDTO = new MatchProgressDTO();
			dto.teamAGoals = team1Goals;
			dto.teamBGoals = team2Goals;
			dto.movementsLeft = movementsLeft;
			dto.currentTurn = currentTime;
			return dto;
		}
	}
}