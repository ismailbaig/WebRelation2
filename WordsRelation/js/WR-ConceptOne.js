
//Self executing functions on load of the js file.
$(function () {

    $("#selConceptOne").select2().on('select2:close', function () {
        //var el = $(this);
        //if (el.val() === "NEW") {
        //    var newval = prompt("Enter new value: ");

        //    if (newval !== null && newval !== '') {

        //        var request = { val: newval };

        //        var strRequest = JSON.stringify(request);

        //        $.ajax({
        //            url: 'NewTopics.aspx/GetNewConceptOne',
        //            data: strRequest,
        //            dataType: "json",
        //            contentType: "application/json",
        //            cache: false,
        //            context: document.body,
        //            type: 'POST',
        //            success: function (response) {
        //                $("#selConceptOne").select2({ data: response.d });
        //                //el.append('<option value=' + newval + '>' + newval + '</option>')
        //                //.val(newval);
        //            }
        //        });
        //    } else {
        //        alert('pleae enter something!!');
        //    }
        //}
    });

    
    //Retrieve ConceptOne OnLoad page
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

            $("#selConceptOne").select2({ data: response.d });

        }
    });

});

//$("#exampleModal").on("click", "btn-default", function () {
//    alert('1');
//});

//$("#exampleModal").on("click", "btn-primary", function () {
//    alert('2');
//});

addNewC1 = function () {

    var _newVal = $('#newC1Val').val();
    var _newType = $('#newC1Type').val();
    var _newProperty = $('#newC1Property').val();
    if (_newVal !== null && _newVal !== '') {

        var request = { newVal: _newVal, newType: _newType, newProperty: _newProperty };

        var strRequest = JSON.stringify(request);

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
                $(".modal-body input").val("");
                $('#newConceptOneId').modal('hide');
            }
        });
    } else {
        alert('pleae enter something!!');
    }
};

$('.modal').on('hidden.bs.modal', function (e) {
    $(this).removeData();
});

