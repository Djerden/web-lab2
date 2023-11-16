const tableData = $('#result-table > tbody'); // тело таблицы

const yInput = $('#Y-text');
const rInput = $('#R-text');
const xButtons = $('.x-button');

let xActiveButton = null;


function validateInput(input, a, b) { // проверка на валидность для текстовых инпутов
    if (input >= a && input <= b) {
        return true;
    }
    return false;
}

function validateX(a, b) {
    if (xActiveButton >= a && xActiveButton <= b) {
        return true;
    }
    return false;
}

function validateAll() {
    return validateX(-5, 3) && validateInput(yInput.val(), -5, 3) && validateInput(rInput.val(), 2, 5);
}

function sendRequest(x, y, r, action) {
    $.ajax({
        url: '/web/controller',
        method: 'GET',
        dataType: 'html',
        data: {'x': x, 'y': y, 'r': r, 'action': action},
        success: function(data) {
            if (action === 'form') {
                window.location.href = 'jsp/result.jsp';
            } else if (action === 'grap') {
                console.log("График")
                // получить данные и отрисовать их на графике и в таблице
                //window.location.href = 'index.jsp';
                console.log(data)
                jsonObject = JSON.parse(data);
                console.log(jsonObject)
                if (jsonObject != null) {
                    let x = jsonObject["x"];
                    let y = jsonObject["y"];
                    let r = jsonObject["r"];
                    let result = jsonObject["result"];
                    let timeExec= jsonObject["time"];
                    console.log(x + ' ' + y + ' ' + r + ' ' + result + ' ' + timeExec)

                    // отрисовка точки на графике
                    let pointString = `<circle id="point" r="4" cx="${((300 / 2 + (x + 0.02) / r * 100))}" cy="${((300 / 2 + (y - 0.02) / r * -100))}" fill="${result ? "green" : "red"}" stroke="white" />`;
                    console.log(pointString)
                    $('svg').html($('svg').html() + pointString);



                    // добавление данных в таблицу
                    let tBodyString = `<tr class="${result ? "table-response-right" : "table-response-wrong"}">
                                    <th>${x}</th>
                                    <th>${y}</th>
                                    <th>${r}</th>
                                    <th>${timeExec}</th>
                                    <th>${result ? "Попал" : "Мимо"}</th> 
                                </tr>`;
                    console.log(tBodyString)
                    tableData.prepend(tBodyString);

                }
            }
            //console.log('Success');
        },
        error: function(error) {
            console.log(error)
        }
    });
}


$('svg').mousedown(function(event) {

    // реализовать точке на графике
    const r = rInput.val();
    $('.tip').remove();
    if (r) {
        const position = $('svg').offset();
        const rowX = event.pageX - position.left;
        const rowY = event.pageY - position.top;
        console.log('x ' + rowX + ' y ' + rowY);

        const x = (((r / 50) * (250 / 2 - rowX) * -1) / 2 - 0.2 * r).toFixed(2);
        const y = (((r / 50) * (250 / 2 - rowY)) / 2 + 0.2 * r).toFixed(2);
        console.log('x ' + x + ' y ' + y);
        if (validateInput(r, 2, 5)) {
            sendRequest(x, y, r, 'grap');
        }
    } else {
        if (!validateInput(rInput, 1, 4)) {
            rInput.after('<div class="tip">R должен быть от 2 до 5</div>');
        }
    }
});

xButtons.click(function(event) {
    event.preventDefault();
    xButtons.css('background-color', 'rgba(255, 140, 0, 0.3)');
    xActiveButton = $(this).val();
    $(this).css('background-color', 'rgba(255, 140, 0, 0.5)');
});

$('#clear-button').click(function() {
    xActiveButton = null;
    xButtons.css('background-color', 'rgba(255, 140, 0, 0.3)');
    $('.tip').remove();
});

$('#coordinates-form').on('submit', function(event) {
    event.preventDefault();
    $('.tip').remove();
    if (!validateAll()) {
        console.log('data not valid');
        console.log($('#coordinates-form .x-checkbox:checked'));
        if (xActiveButton === null) {
            $('.x-buttons').after('<div class="tip">Нужно задать X</div>');
        }

        if (!validateInput(yInput, -5, 5)) {
            yInput.after('<div class="tip">Y должен быть от -5 до 3</div>');
        }

        if (!validateInput(rInput, 1, 4)) {
            rInput.after('<div class="tip">R должен быть от 2 до 5</div>');
        }
        return;
    } else {
        console.log('data valid');
        sendRequest(xActiveButton, yInput.val(), rInput.val(), 'form');
    }
});