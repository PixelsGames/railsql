var colorButtons = {
    class: '.color-button',
    allClasses: ['color-button-red', 'color-button-yellow', 'color-button-green']
};

colorButtons.init = function() {
    $(colorButtons.class).on('click', colorButtons.clickReaction);

    currentCheckboxContainer.addAfterAction(colorButtons.setGreenDefault);
};

colorButtons.isExists = testResult.isExists;

colorButtons.clickReaction = function() {
    var self = $(this);

    if (!currentCheckboxContainer.isChecked()) {
        alert('Вы должны выбрать вариант!');
        return;
    }

    var classColor = self.attr('data-color');

    for (var i = 0; i < colorButtons.allClasses.length; i++) {
        if (testResult.currentQuestion.getCell().hasClass(colorButtons.allClasses[i])) {
            testResult.currentQuestion.getCell().removeClass(colorButtons.allClasses[i]);
        }
    }

    testResult.currentQuestion.getCell().addClass(classColor);

    testResult.currentQuestion.toNextQuestion();
};

colorButtons.setGreenDefault = function() {
    var classColor = 'color-button-green';

    if (!currentCheckboxContainer.isChecked()) {
        console.log('BUG color_buttons 39!');
        return;
    }

    for (var i = 0; i < colorButtons.allClasses.length; i++) {
        if (testResult.currentQuestion.getCell().hasClass(colorButtons.allClasses[i])) {
            return;
        }
    }

    testResult.currentQuestion.getCell().addClass(classColor);
};