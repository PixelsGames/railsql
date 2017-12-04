testResultSelect = {};

testResultSelect.init = function() {
    $('.new-result-test-select').select2();
};

testResultSelect.isExists = function(){
    return $('.new-result-test-select').length > 0;
};