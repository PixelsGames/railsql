var questionInfo = {
    questionNum: '#question-number-info',
    lessonName: '#lesson-name',
    getQuestionNum: function() { return $('.question-cell-current').text() },
    getLessonName: function() { return questionContainer.currentLessonName; }
};

questionInfo.init = function() {
    questionInfo.changeInfo();
    testResult.callbacks.setAfterAction(questionInfo.changeInfo);
};

questionInfo.changeQuestionNum = function(text) {
    $(questionInfo.questionNum).text(text);
};

questionInfo.changeLessonName = function(text) {
    $(questionInfo.lessonName).text(text);
};

questionInfo.changeInfo = function() {
    questionInfo.changeQuestionNum(questionInfo.getQuestionNum());
    questionInfo.changeLessonName(questionInfo.getLessonName());
};

questionInfo.isExists = testResult.isExists;