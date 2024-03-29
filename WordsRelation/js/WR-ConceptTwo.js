﻿
//Self executing functions on load of the js file.
$(function () {

    $("#selConceptTwo").select2().on('select2:close', function () {

    });

    
    //Retrieve ConceptOne OnLoad page
    //var request = { c2Val: 'onloadCall' };
    var request = { c1Val: 'onloadCall' };

    var strRequest = JSON.stringify(request);
    $.ajax({
        url: 'NewTopics.aspx/GetAllConceptOne',
        data: strRequest,
        dataType: "json",
        contentType: "application/json",
        cache: false,
        context: document.body,
        type: 'POST',
        success: function (response) {

            $("#selConceptTwo").select2({ data: response.d });

        }
    });

});

addNewC2 = function () {

    var _newVal = $('#newC2Val').val();
    var _newType = $('#newC2Type').val();
    var _newProperty = $('#newC2Property').val();
    if (_newVal !== null && _newVal !== '') {

        var request = { newVal: _newVal, newType: _newType, newProperty: _newProperty };

        var strRequest = JSON.stringify(request);

        //Storing in Concept One Table and not Cocept Two as per new requirement
        $.ajax({
            url: 'NewTopics.aspx/GetNewConceptOne',
            data: strRequest,
            dataType: "json",
            contentType: "application/json",
            cache: false,
            context: document.body,
            type: 'POST',
            success: function (response) {
                $("#selConceptOne").select2({ data: response.d });
                $("#selConceptTwo").select2({ data: response.d });
                $(".modal-body input").val("");
                $('#newConceptTwoId').modal('hide');
            },
            error: function (err) {
                $(".modal-body input").val("");
                $('#newConceptTwoId').modal('hide');
            },
            complete: function () {
                $(".modal-body input").val("");
                $('#newConceptTwoId').modal('hide');
            }
        });
    } else {
        alert('pleae enter something!!');
    }
};
