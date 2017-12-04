currentCheckboxContainer = {
    containerClass: '.choices-box-current',
    checkBoxClass: '.choice-input',
    afterActions: [],

    addAfterAction: function(action) {
        currentCheckboxContainer.afterActions.push(action);
    },

    callAfterActions: function() {
        for (var i = 0; i < currentCheckboxContainer.afterActions.length; i++){
            currentCheckboxContainer.afterActions[i]();
        }
    },

    isChecked: function() {
        var checkboxes = $(currentCheckboxContainer.containerClass)
            .find(currentCheckboxContainer.checkBoxClass);

        for (var i = 0; i < checkboxes.length; i++) {
            if ($(checkboxes[i]).prop('checked')) {
                return true;
            }
        }

        return false;
    }
};

currentCheckboxContainer.init = function() {
    $(currentCheckboxContainer.checkBoxClass).on('change', function() {
       var self = $(this);
       if (!self.prop('checked')) return;

       currentCheckboxContainer.clickReaction(self);

       currentCheckboxContainer.callAfterActions();
    });
};

currentCheckboxContainer.clickReaction = function(self) {
    var choiceId = self.attr('id');
    testResult.currentQuestion.setChoice(choiceId);
};

currentCheckboxContainer.isExists = testResult.isExists;
