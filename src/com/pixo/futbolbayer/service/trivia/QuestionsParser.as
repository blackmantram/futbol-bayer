package com.pixo.futbolbayer.service.trivia
{
	public class QuestionsParser implements IQuestionsParser
	{
		public var questions:Array = new Array();
		
		public function parseQuestions(results:Object):void
		{
			var decodedQuestions:Array = JSON.parse(String(results)) as Array;
			for each (var questionObject:Object in decodedQuestions )
			{
				var question:Question = new Question();
				question.wording = questionObject["wording"];
				question.correctAnswer = questionObject["correctAnswer"];
				question.incorrectAnswerA = questionObject["incorrectAnswerA"];
				question.incorrectAnswerB = questionObject["incorrectAnswerB"];
				question.incorrectAnswerC = questionObject["incorrectAnswerC"];
				questions.push(question);
			}
		}
	}
}