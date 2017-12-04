var ajaxChannel = {};

ajaxChannel.send = function(link, data, method) {
    $.ajax({
        url: link,
        type: method,
        data: data,

        success: function(result) {
            afterTest.renderResults(result);
        },
        error: function(result) {
            alert('Извините, что-то пошло не так');
        }
    });
};