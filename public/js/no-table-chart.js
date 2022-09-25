var no_table_chart_draw = function (content, idx) {
    var html_content = `<thead><tr><th></th>`;

    for (var k = 1; k < content[0].length; k++) {
        html_content += `<th>`+ content[0][k] + `</th>`;
    }
    html_content += `</tr></thead>`;

    for (var i = 1; i < content.length; i++) {
        html_content += `<br>`;
        html_content += `<td>` + content[i][0] + `</td>`;

        for (var s = 1; s < content[i].length; s++) {
            let val = content[i][s];
            if(val == undefined){
                val = 0;
            }
            html_content += `<td>` + val + `</td>`;
        }
        html_content += `</tr>`;
    }
    $('#no_table_chart'+idx).html(html_content);
    $('#no_table_chart'+idx).show();
}