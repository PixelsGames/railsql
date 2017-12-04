var testResult = {
    changingCss: {
        text: '.question-text',
        choiceBlock: '.choices-box'
    },
    currentCss: {
        text: 'question-text-current',
        choiceBlock: 'choices-box-current'
    },
    otherCss: {
        currentQuestion: 'question-cell-current'
    },

    callbacks: {
        beforeAction: [],
        afterAction: [],
        setBeforeAction: function(action) {
            testResult.callbacks.beforeAction.push(action);
        },
        setAfterAction: function(action) {
            testResult.callbacks.afterAction.push(action);
        },
        callBefore: function() {
            for (var i = 0; i < testResult.callbacks.beforeAction.length; i++){
                testResult.callbacks.beforeAction[i]();
            }
        },
        callAfter: function() {
            for (var i = 0; i < testResult.callbacks.afterAction.length; i++){
                testResult.callbacks.afterAction[i]();
            }
        }
    },

    currentQuestion: {
        id: '',
        answerId: '',
        answerColor: '',

        getCell: function() {
            return $('#' + testResult.currentQuestion.id + '.question-cell')
        },

        setId: function(id) {

            testResult.callbacks.callBefore();

            testResult.currentQuestion.getCell().removeClass(testResult.otherCss.currentQuestion);
            testResult.currentQuestion.id = id;

            testResult.currentQuestion.getCell().addClass(testResult.otherCss.currentQuestion);
            testResult.showQuestion(testResult.currentQuestion.id);

            testResult.callbacks.callAfter();
        },

        toNextQuestion: function() {
            var nextCell = testResult.currentQuestion.getCell().next();
            if (nextCell.length === 0 || !nextCell.hasClass('question-cell')) {
                //trying to find in next row
                var parent = testResult.currentQuestion.getCell().parent();
                if (parent.next().length === 0 || !parent.next().hasClass('row')) {
                    return;
                }

                nextCell = parent.next().children('.question-cell').first();
            }

            var nextId = nextCell.attr('id');

            testResult.currentQuestion.setId(nextId);
        },

        setChoice: function(choiceId) {
            testResult.currentQuestion.getCell().attr('choice-id', choiceId);
        },

        init: function() {
            testResult.currentQuestion.id = $('.question-cell').first().attr('id');
            testResult.currentQuestion.setId(testResult.currentQuestion.id);
        }
    }
};

testResult.showQuestion = function(id) {
    for (var cssName in testResult.changingCss){
        if (testResult.changingCss.hasOwnProperty(cssName)) {
            $('.' + testResult.currentCss[cssName]).toggle()
                .removeClass(testResult.currentCss[cssName]);

            $('#' + id + testResult.changingCss[cssName]).toggle()
                .addClass(testResult.currentCss[cssName]);
        }
    }
};

testResult.init = function() {
    testResult.currentQuestion.init();

    $('.question-cell').on('click', function() {
        var self = $(this);
        testResult.currentQuestion.setId(self.attr('id'));
    });
};

testResult.isExists = function() {
    return $('.question-page-js').length > 0;
};
