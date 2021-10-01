let tbody = document.getElementById('user');
let messages = document.getElementById('message');
let token = localStorage.getItem('token');

let menu = document.getElementById('dropdown-menu');

if (localStorage.getItem('token')) {
    menu.innerHTML = '<li class="nav-item">\n' +
        '                        <a class="nav-link" href="logout.html">Выйти</a>\n' +
        '                    </li>';
}
headerParams = {'Authorization': 'Bearer ' + token};
obj = {
    type: 'get',
    url: 'http://rest-api.com/user',
    headers: headerParams,
    data: [],
    dataType: 'json',
    processData: false,
    success: function (data) {
        tbody.innerHTML = getUsers(data.items[0]);
        messages.innerHTML = getMessage(data.items[0].message);
    }
};

jQuery.ajax(obj);


function getUsers(data) {
    let str = '';

    str += `<tr>
            <th scope="col">${data.id}</th>
            <th scope="col">${data.fio}</th>
            <th scope="col">${data.date}</th>
            <th scope="col">${data.city}</th>
            <th scope="col">${data.phone}</th>
            <th scope="col">${data.email}</th>
            <th scope="col"><img src='${data.avatar}' width="100" height="100"></img></th>
        </tr>
        `;

    return str;
}


function getMessage(data) {
    let str = '';
    var checked = '';

    for (let k = 0; k < data.length; k++) {

        if (data[k].status == 1) {
            checked = 'checked';
        }

        str += `<tr>
            <th scope="col">${data[k].id}</th>
            <th scope="col">${data[k].date}</th>
            <th scope="col"><textarea id="mess${data[k].id}" cols="20" class="form-control">${data[k].text}</textarea></th>
            <td><input type="checkbox" id="cb${data[k].id}" class="form-check-input" ${checked}></td>
            <td><button id="id${data[k].id}" class="btn btn-primary" onclick="setMessage(${data[k].id})">Изменить</button></td>
            <td><button class="btn btn-danger" onclick="delMessage(${data[k].id})">Удалить</button></td>
        </tr>
        `;
    }

    return str;
}

function setMessage(id) {

    let text = document.getElementById('mess' + id)
    let checkbox = document.getElementById('cb' + id)

    let status = 0;

    if (checkbox.checked) {
        status = 1;
    }

    $.ajax({
        url: 'http://rest-api.com/message/' + id,
        method: 'PUT',
        dataType: 'json',
        headers: {'Authorization': 'Bearer ' + token},
        data: {text: text.value, status: status},
        success: function(data){
            console.log(data)
            location.href = 'user.html';
        }
    });

}


function delMessage(id) {
    $.ajax({
        url: 'http://rest-api.com/message/' + id,
        method: 'DELETE',
        dataType: 'json',
        headers: {'Authorization': 'Bearer ' + token},
        success: function(data){
            location.href = 'user.html';
        }
    });
}