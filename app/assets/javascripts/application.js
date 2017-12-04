// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery_ujs

//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require select2

//= require timer

//= require test_results/select

//= require test_results/result_structure
//= require test_results/test_result
//= require test_results/checkbox
//= require test_results/color_buttons
//= require test_results/question_container
//= require test_results/publish_data
//= require test_results/ajax_channel
//= require test_results/question_info
//= require test_results/after_test

modulesToInit = [
    timer,
    testResultSelect,
    testResult,
    currentCheckboxContainer,
    colorButtons,
    questionContainer,
    publishData,
    questionInfo
];

$(document).ready(function() {
    for (var i = 0; i < modulesToInit.length; i++) {
        if (modulesToInit[i].isExists()) {
            modulesToInit[i].init();
        }
    }
});