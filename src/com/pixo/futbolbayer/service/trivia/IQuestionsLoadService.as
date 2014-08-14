package com.pixo.futbolbayer.service.trivia
{
	public interface IQuestionsLoadService
	{
		function loadQuestions():void;
		function set parser(value:IQuestionsParser):void;
	}
}