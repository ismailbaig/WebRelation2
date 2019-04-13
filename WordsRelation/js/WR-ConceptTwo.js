
//Self executing functions on load of the js file.
$(function () {

    $("#selConceptTwo").select2().on('select2:close', function () {
        //var el = $(this);
        //if (el.val() === "NEW") {
        //    var newval = prompt("Enter new value: ");

        //    if (newval !== null && newval !== '') {

        //        var request = { c2NewVal: newval };

        //        var strRequest = JSON.stringify(request);

        //        $.ajax({
        //            url: 'NewTopics.aspx/GetNewConceptTwo',
        //            data: strRequest,
        //            dataType: "json",
        //            contentType: "application/json",
        //            cache: false,
        //            context: document.body,
        //            type: 'POST',
        //            success: function (response) {
        //                $("#selConceptTwo").select2({ data: response.d });
        //            },
        //            error: function (err) {
        //            }
        //        });
        //    } else {
        //        alert('pleae enter something!!');
        //    }
        //}
    });

    
    //Retrieve ConceptOne OnLoad page
    var request = { c2Val: 'onloadCall' };

    var strRequest = JSON.stringify(request);
    $.ajax({
        url: 'NewTopics.aspx/GetAllConceptTwo',
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

        $.ajax({
            url: 'NewTopics.aspx/GetNewConceptTwo',
            data: strRequest,
            dataType: "json",
            contentType: "application/json",
            cache: false,
            context: document.body,
            type: 'POST',
            success: function (response) {
                $("#selConceptTwo").select2({ data: response.d });
                $(".modal-body input").val("");
                $('#newConceptTwoId').modal('hide');
            }
        });
    } else {
        alert('pleae enter something!!');
    }
};
