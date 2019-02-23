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
                topic_data += '<td class="nr">' + val.ConceptOne + '</td>';
                topic_data += '<td>' + val.ConceptTwo + '</td>';
                topic_data += '<td>' + val.RelationType + '</td>';
                topic_data += "<td><input  type='button' value='Edit Topic Details' id='EdittopicDettsId" + val.TopicDetailsId +  
                    "'class='btn btn - primary' onclick = editTopic(this)></td>";
                topic_data += "<td><input  type='button' value='Delete' id='deletetopicDetsId" + val.TopicDetailsId +
                    "'class='btn btn - primary' onclick = Delete(event)></td>";
                topic_data += '</tr>';
            });
            $("#topicDetailsTable tr").remove();
            //$('#topicDetailsTable').Clear();
            $('#topicDetailsTable').append('<tr><th style="visibility: hidden">topicId</th><th>Concept One</th><th>Concept Two</th><th>Relation Type</th><th>Edit</th><th>Delete</th></tr>');
            $('#topicDetailsTable').append(topic_data);
        }
    });

}

function searchDetailsForTopic(topicName, c1, c2, rt) {

    //Retrieve Relations OnLoad Page
    var request = {
        topic: topicName, c1: (!c1 ? '0' : c1), c2: (!c2 ? '0' : c2), rt: (!rt ? '0' : rt)  };

    var inputData = JSON.stringify(request);
    $.ajax({
        url: 'NewTopics.aspx/Search',
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
                topic_data += '<td>' + val.ConceptOne + '</td>';
                topic_data += '<td>' + val.ConceptTwo + '</td>';
                topic_data += '<td>' + val.RelationType + '</td>';
                //topic_data += '<td>' + val.TopicName + '</td>';
                topic_data += "<td><input  type='button' value='Edit Topic Details' id='EdittopicDettsId" + val.TopicDetailsId +
                    "'class='btn btn - primary' onclick = editTopic(this)></td>";
                topic_data += "<td><input  type='button' value='Delete' id='deletetopicDetsId" + val.TopicDetailsId +
                    "'class='btn btn - primary' onclick = Delete(event)></td>";
                topic_data += '</tr>';
            });
            $("#topicDetailsTable tr").remove();
            //$('#topicDetailsTable').Clear();
            $('#topicDetailsTable').append('<tr><th style="visibility: hidden">topicId</th><th>Concept One</th><th>Concept Two</th><th>Relation Type</th><th>Edit</th><th>Delete</th></tr>');
            $('#topicDetailsTable').append(topic_data);
        }
    });

}

function editTopic(val) {
    //console.log(val.target.id.replace('EdittopicDettsId', ''));
    //var $item = $(this).closest("tr")   // Finds the closest row <tr> 
    //    .text();         // Retrieves the text within <td>
    //console.log($item);
    var $row = $(this).closest("tr");    // Find the row
    var $text = $row.find(".nr").text(); // Find the text
    console.log($text);

}

function Delete(val) {
    console.log(val.target.id.replace('deletetopicDetsId', ''));

    //Retrieve Relations OnLoad Page
    var request = {
        topicId: val.target.id.replace('deletetopicDetsId', '')
    };

    var inputData = JSON.stringify(request);
    $.ajax({
        url: 'NewTopics.aspx/DeleteTopic',
        data: inputData,
        dataType: "json",
        contentType: "application/json",
        cache: false,
        context: document.body,
        type: 'POST',
        success: function (response) {
            if (response.d) {
                alert('Deleted Successfully!!');
                //call the search again from Database, kind of refresh
                topicName = $('#topic').val();
                c1 = $('#selConceptOne').val();
                c2 = $('#selConceptTwo').val();
                rt = $('#selRelation').val();
                if (topicName !== null && topicName !== '') {
                    searchDetailsForTopic(topicName, c1, c2, rt);
                } else {
                    alert('Topic field cannot be empty!!');
                }
            } else {
                alert('Sorry, Unable to deleted!!');
            }
        },
        error: function (err) {
            alert('Error occured, Unable to deleted!!');
        }
    });
}