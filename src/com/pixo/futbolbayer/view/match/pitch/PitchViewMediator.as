package com.pixo.futbolbayer.view.match.pitch
{
	import com.pixo.futbolbayer.model.SettingsModel;
	
	import org.robotlegs.mvcs.Mediator;

	public class PitchViewMediator extends Mediator
	{
		[Inject]
		public var view:PitchView;
		
		[Inject]
		public var settingsModel:SettingsModel;
		
		override public function onRegister():void
		{
			view.setStadiumAsset(settingsModel.getStadiumAsset());	
		}
	}
}