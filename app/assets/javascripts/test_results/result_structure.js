var resultStructure = {
    TestResult: function (variants) {
        this.variants = variants;
    },

    Variant: function (variant_id, questions) {
        this.variant_id = variant_id;
        this.questions = questions;
    },

    Question: function (question_id, choice_id) {
        this.question = question_id;
        this.choice_id = choice_id;
    }
};