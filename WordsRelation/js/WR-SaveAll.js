
//Save all WRs
function saveAllWR(isEdit, editTopicId) {

    var topic = $('#topic').val();
    var relTypeVal = $('#selRelation').val();
    var c1Val = $('#selConceptOne').val();
    var c2Val = $('#selConceptTwo').val();

    if (topic !== null && topic !== ''
        && relTypeVal !== null && relTypeVal !== ''
        && c1Val !== null && c1Val !== ''
        && c2Val !== null && c2Val !== '') {

        var request = { topic: topic, rtVal: relTypeVal, c1Val: c1Val, c2Val: c2Val, isEdit: isEdit, editTopicId: editTopicId };

        var strRequest = JSON.stringify(request);

        $.ajax({
            url: 'NewTopics.aspx/SaveAllDetails',
            data: strRequest,
            dataType: "json",
            contentType: "application/json",
            cache: false,
            context: document.body,
            type: 'POST',
            success: function (response) {
                if (response.d) {
                    alert('Saved Scuccesfully!!');
                    //call the search again from Database, kind of refresh
                    topicName = $('#topic').val();
                    c1 = $('#selConceptOne').val();
                    c2 = $('#selConceptTwo').val();
                    rt = $('#selRelation').val();
                    if (topicName !== null && topicName !== '') {
                        if (!isEdit) {
                            searchDetailsForTopic(topicName, c1, c2, rt);
                        } else {
                            searchDetailsForTopic(topicName, null, null, null);
                        }
                    } else {
                        alert('Topic field cannot be empty!!');
                    }
                } else {
                    alert('Unable to Save, contact administrator!!');
                }
            },
            error: function (err) {

            }
        });


    } else {
        alert('None of the fields can be empty!!')
    }
    
}