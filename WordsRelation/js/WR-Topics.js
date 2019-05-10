function saveTopic() {
    //save topic
    var request = { topic: $('#topic').val() };

    var strRequest = JSON.stringify(request);
    $.ajax({
        url: 'NewTopics.aspx/SaveTopic',
        data: strRequest,
        dataType: "json",
        contentType: "application/json",
        cache: false,
        context: document.body,
        type: 'POST',
        success: function (response) {
            if (response.d) {
                $('#topic').attr('readonly', true);
                alert('Topic saved successfully!!');
            }
            else {
                alert('Topic was not saved successfull!!');
            }
        },
        error: function (err) {
            alert('error occured!!');
        }
    });
}
