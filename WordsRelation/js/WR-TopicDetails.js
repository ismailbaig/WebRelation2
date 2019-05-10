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
                topic_data += "<td  id='td_topidId' style='visibility: hidden'>" + val.TopicDetailsId + "</td>";
                topic_data += "<td  id='td_c1_" + val.TopicDetailsId + "'>" + val.ConceptOne + "</td>";
                topic_data += "<td  id='td_c2_" + val.TopicDetailsId + "'>" + val.ConceptTwo + '</td>';
                topic_data += "<td  id='td_rt_" + val.TopicDetailsId + "'>" + val.RelationType + '</td>';
                topic_data += "<td><input  type='button' value='Edit Topic Details' id='EdittopicDettsId" + val.TopicDetailsId +  
                    "'class='btn btn - primary' onclick = editTopic(event)></td>";
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
            if (response.d.length === 0) {
                alert('No data found!');
            }
            else {
                var topic_data = '';
                $.each(response.d, function (key, val) {
                    topic_data += '<tr>';
                    topic_data += '<td style="visibility: hidden">' + val.TopicDetailsId + '</td>';
                    topic_data += "<td  id='td_c1_" + val.TopicDetailsId + "'>" + val.ConceptOne + "</td>";
                    topic_data += "<td  id='td_c2_" + val.TopicDetailsId + "'>" + val.ConceptTwo + '</td>';
                    topic_data += "<td  id='td_rt_" + val.TopicDetailsId + "'>" + val.RelationType + '</td>';
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
        }
    });

}

function getNeo4jQuery(topicName, c1, c2, rt) {

    //Retrieve Relations OnLoad Page
    var request = {
        topic: topicName, c1: (!c1 ? '0' : c1), c2: (!c2 ? '0' : c2), rt: (!rt ? '0' : rt)
    };

    var inputData = JSON.stringify(request);
    $.ajax({
        //url: 'NewTopics.aspx/GetNeo4JQuery',
        url: 'Neo4j.aspx/GetNeo4JQuery',
        data: inputData,
        dataType: "json",
        contentType: "application/json",
        cache: false,
        context: document.body,
        type: 'POST',
        success: function (response) {
            var topic_data2 = '';
            $.each(response.d, function (key, val) {
                topic_data2 += val.Text;
            });
           //$('#PlaceHolder2').append(topic_data2);
            $('#PlaceHolder2').append(topic_data2);

            //var url = 'Neo4j.aspx';
            //url += "?param1=" + topic_data2;
            ////url += "&param2=" + escape(DD2Value);
            ////url += "&param3=" + escape(xyz);
            //window.location = url;
            
        }
    });

}

function editTopic(val) {
    editTopcid = null;
    editTopcid = val.target.id.replace('EdittopicDettsId', '');

    //var $item = $(this).closest("tr")   // Finds the closest row <tr> 
    //    .text();         // Retrieves the text within <td>
    //console.log($item);
    //var $row = $(this).closest("tr");    // Find the row
    //var $text = $row.find(".nr").val(); // Find the text

    //let tr = $(this).closest('tr');
    //let a = tr.find('td:eq(1)').val();
    //let b = tr.find('td:eq(2)').val(); 
    //alert('Table 1: ' + a + ' ' + b); 

    $c1 = $('#td_c1_' + editTopcid)[0].innerText;
    $c2 = $('#td_c2_' + editTopcid)[0].innerText;
    $rt = $('#td_rt_' + editTopcid)[0].innerText;

    setC1OnEdit($c1);
    setC2OnEdit($c2);
    setRTOnEdit($rt);
    //$("#selConceptOne").select2('val', null);
    //$("#selConceptOne").select2('val', $c1).trigger('change');
    //var $newOption = $("<option selected='selected'></option>").val("TheID").text("The text")

    //$("#myMultipleSelect2").append($newOption).trigger('change');
    //$("#selConceptOne").val(2).trigger('change');



    //var $el = $('#selConceptOne');
    //var data = $el.select2('data')[0]['text'];
    //alert(data);

    //var value = $el.select2('data')[0]['id'];
    //alert(value);


    //var data = $('#selConceptOne').select2($c1);
    //alert(data[0].text);
    //alert(data[0].id);

    $('#updateTopicDetails').removeClass('btnHide').addClass('btnShow');
    $('#saveAll').removeClass('btnShow').addClass('btnHide');
}

function setC1OnEdit($c1Val) {
    $("#selConceptOne > option").each(function () {
        if (this.text === $c1Val) {

            $("#selConceptOne").val(this.value).trigger('change');
        }
    });
}

function setC2OnEdit($c2Val) {
    $("#selConceptTwo > option").each(function () {
        if (this.text === $c2Val) {
            $("#selConceptTwo").val(this.value).trigger('change');
        }
    });
}

function setRTOnEdit($rtVal) {
    $("#selRelation > option").each(function () {
        if (this.text === $rtVal) {
            $("#selRelation").val(this.value).trigger('change');
        }
    });
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

//Reset Select 
function resetTopicDetails() {
    $("#selConceptOne").val(0).trigger('change');
    $("#selConceptTwo").val(0).trigger('change');
    $("#selRelation").val(0).trigger('change');

    $('#updateTopicDetails').removeClass('btnShow').addClass('btnHide');
    $('#saveAll').removeClass('btnHide').addClass('btnShow');
}

//update CR
function updateCR() {
    //alert(editTopcid);
    //oldValues = { c1: $c1, c2: $c2, rt: $rt };
    saveAllWR(true, editTopcid);
}








