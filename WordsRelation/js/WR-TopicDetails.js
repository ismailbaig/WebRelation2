//Self executing functions on load of the js file.
function getAllDetailsForTopic(topicName) {

    //Retrieve Relations OnLoad Page
    var request = { topic: topicName };

    var inputData = JSON.stringify(request);
    $.ajax({
        url: 'NewTopics.aspx/GetAllDetailsForTopic',
        data: inputData,
        dataType: "json",
        contentType: "application/json",
        cache: false,
        context: document.body,
        type: 'POST',
        success: function (response) {
            var topic_data = '';
            $.each(response.d, function (key, val) {
                topic_data += '<tr>';
                topic_data += '<td style="visibility: hidden">' + val.TopicDetailsId + '</td>';
                topic_data += '<td>' + val.RelationType + '</td>';
                topic_data += '<td>' + val.ConceptOne + '</td>';
                topic_data += '<td>' + val.ConceptTwo + '</td>';
                topic_data += "<td><input  type='button' value='Edit Topic Details' id='EdittopicDettsId' class='btn btn-primary'></td>";
                topic_data += '</tr>';
            });
            $("#topicDetailsTable tr").remove();
            //$('#topicDetailsTable').Clear();
            $('#topicDetailsTable').append('<tr><th style="visibility: hidden">topicId</th><th>Concept One</th><th>Concept Two</th><th>Relation Type</th><th>Action</th></tr>');
            $('#topicDetailsTable').append(topic_data);
        }
    });

}