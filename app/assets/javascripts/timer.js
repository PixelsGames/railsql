var timer = {
    stop: false
};

timer.tick = function(){

    if (timer.stop) return;

    var hour = document.getElementById('hour').innerHTML;
    var minute = document.getElementById('minute').innerHTML;
    var second = document.getElementById('second').innerHTML;
    var end = false;

    if (second > 0) second--;
    else {
        second = 60;

        if (minute > 0) minute--;
        else {
            minute = 59;
            second = 59;

            if(hour > 0) hour--;
            else end = true;
        }
    }

    if (end) {
        clearInterval(intervalID);
        var isContinue = confirm("Ваше время истекло! Ок - показать результаты тестирования; Отмена - продолжить без таймера");
        if (isContinue) {
            document.getElementById('submit_data_button').click();
        }
    } else {
        document.getElementById('hour').innerHTML = hour;
        document.getElementById('minute').innerHTML = minute;
        document.getElementById('second').innerHTML = second;
    }
};

timer.init = function(){
    window.intervalID = setInterval(timer.tick, 1000);
};

timer.isExists = function(){
    return $('#time').length > 0;
};
