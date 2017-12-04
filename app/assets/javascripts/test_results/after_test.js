afterTest = {
    variantClass: publishData.idsForCollection.variant,
    choiceClass: '.choice-input',
    commonResult: publishData.buttonId,

    checkBoxCss: {
        rightAnswer: 'right-answer-chbx',
        wrongAnswer: 'wrong-answer-chbx'
    }
};

afterTest.renderResults = function(resultHash) {
    afterTest.renderVariantNumber(resultHash);
    afterTest.renderGreenCheckBoxes(resultHash);
    afterTest.renderRedCheckBoxes();
    afterTest.renderCommon(afterTest.countCommonNumbers(resultHash))
    alert('Вы закончили тест!');
};

afterTest.renderGreenCheckBoxes = function(resultHash) {
    var correctIds = resultHash['correct_ids'];
    for (var i = 0; i < correctIds.length; i++) {
        afterTest.makeGreen(correctIds[i])
    }
};

afterTest.renderRedCheckBoxes = function() {
    var checkboxes = $(afterTest.choiceClass);
    for (var i = 0; i < checkboxes.length; i++) {
        var currentCheckbox = $(checkboxes[i]);
        var currentId = currentCheckbox.attr('id');
        if (currentCheckbox.prop('checked')
            && !afterTest.getLabelChoiceBox(currentId).hasClass(afterTest.checkBoxCss.rightAnswer)) {

            afterTest.makeRed(currentId);
        }
    }
};

afterTest.makeGreen = function(id) {
    afterTest.getLabelChoiceBox(id).addClass(afterTest.checkBoxCss.rightAnswer);
};

afterTest.makeRed = function(id) {
    afterTest.getLabelChoiceBox(id).addClass(afterTest.checkBoxCss.wrongAnswer);
};

afterTest.renderVariantNumber = function(resultHash) {
    var variants = $(afterTest.variantClass);
    for (var i = 0; i < variants.length; i++) {
        var varId = $(variants[i]).attr('data-id');

        var panelToWrite = $(variants[i]).find('.subject');

        var previousText = panelToWrite.text();
        panelToWrite.text(previousText +
            ' - ' +
            resultHash[varId]['corrects_number'] +'/25')
    }
};

afterTest.getLabelChoiceBox = function(id) {
  return (afterTest.getChoiceBox(id).parent());
};

afterTest.getChoiceBox = function(id) {
  return $('#' + id + '' + afterTest.choiceClass)
};

afterTest.renderCommon = function(number) {
    $(afterTest.commonResult).text(number + '/125');
};

afterTest.countCommonNumbers = function(resultHash){
    var variants = $(afterTest.variantClass);
    var result = 0;
    for (var i = 0; i < variants.length; i++) {
        var varId = $(variants[i]).attr('data-id');

        result += Number(resultHash[varId]['corrects_number']);
    }
    return result;
};