let tbody = document.getElementById('message');


let token = localStorage.getItem('token');

let menu = document.getElementById('dropdown-menu');


if (localStorage.getItem('token') != 'null'&& localStorage.getItem('token') != null ) {
    menu.innerHTML = '<li class="nav-item">\n' +
        '                        <a class="nav-link" href="logout.html">Выйти</a>\n' +
        '                    </li>';
}


obj = {
    type: 'get',
    url: 'http://rest-api.com/message?expand=user',
    data: [],
    dataType: 'json',
    processData: false,
    success: function(data) {
        tbody.innerHTML = getUsers(data.items);
    }
};

jQuery.ajax(obj);


function getUsers(data) {
    let str = '';
    for (let k in data) {
        str += `<tr>
            <th scope="col">${data[k].id}</th>
            <th scope="col">${data[k].user.fio}</th>
            <th scope="col">${data[k].text}</th>
            <th scope="col">${data[k].date}</th>
        </tr>
        `;
    }
    return str;
}

