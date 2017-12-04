//= require active_admin/base
//= require select2

$(document).ready(function() {
    $(".multiple-select").select2({
        maximumSelectionLength: 25,
        placeholder: 'Выберите 25 вопросов для варианта',
        minimumInputLength: 0,
        width: 500
    });
});