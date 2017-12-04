var publishData = {
    buttonId: '#end-test',

    idsForCollection:{
        variant: '.variant-info',
        question: '.question-cell'
    },

    disabled: false
};

publishData.init = function() {
    $(publishData.buttonId).on('click', publishData.clickReaction);
};

publishData.clickReaction = function() {

    if (publishData.disabled) return;

    if(!publishData.idEverythingChecked()){
        alert('Вы не ответили на все вопросы!');
        return false;
    }

    var self = $(this);

    var link = self.attr('data-url');
    var dataToSend = publishData.collectData();

    ajaxChannel.send(link, dataToSend, 'POST');

    timer.stop = true;
    publishData.disabled = true;

};

publishData.collectData = function() {
    var allVariants = $(publishData.idsForCollection.variant);
    var variants = [];
    // Variants loop
    for (var i = 0; i < allVariants.length; i++) {
        var currentVar = $(allVariants[i]);
        var varId = publishData.getVariantId(currentVar);
        var questions = publishData.getQuestions(currentVar);

        variants.push(new resultStructure.Variant(varId, questions));
    }
    return { variants: variants };
};

publishData.getQuestions = function(variant) {
    var allQuestions = variant.find(publishData.idsForCollection.question);
    var questions = [];

    // Questions loop
    for (var i = 0; i < allQuestions.length; i++) {
        var questionId = publishData.getQuestionId($(allQuestions[i]));
        var choiceId = publishData.getChoiceId($(allQuestions[i]));

        questions.push(new resultStructure.Question(questionId, choiceId));
    }

    return questions;
};

publishData.idEverythingChecked = function() {
    var questions = $(publishData.idsForCollection.question);
    for (var i = 0; i < questions.length; i++) {
        if (!publishData.getChoiceId($(questions[i]))){
            return false;
        }
    }
    return true;
};

publishData.getQuestionId = function(questionNode) {
    return questionNode.attr('id');
};

publishData.getChoiceId = function(questionNode) {
    return questionNode.attr('choice-id');
};

publishData.getVariantId = function(variantNode) {
    return variantNode.attr('data-id');
};

publishData.isExists = testResult.isExists;
