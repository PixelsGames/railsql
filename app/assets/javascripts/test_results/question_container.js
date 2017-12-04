var questionContainer = {
    toggleClass: '.question-numbers-container',
    clickClass: '.subject',
    currentLessonName: ''
};

questionContainer.init = function() {
    questionContainer.openFirst();

    $(questionContainer.clickClass).on('click', questionContainer.clickReaction);
};

questionContainer.openFirst = function() {
    questionContainer.currentLessonName = $('.subject').first().text();
    $(questionContainer.toggleClass).first().show();
};

questionContainer.clickReaction = function() {
    var self = $(this).next();

    var allContainers = $(questionContainer.toggleClass);
    for (var i = 0; i < allContainers.length; i++) {
        $(allContainers[i]).hide();
    }

    questionContainer.currentLessonName = $(this).text();
    self.show();

    var questionId = self.find('.question-cell').first().attr('id');
    testResult.currentQuestion.setId(questionId);
};

questionContainer.isExists = testResult.isExists;