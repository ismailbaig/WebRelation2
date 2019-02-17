//Self executing functions on load of the js file.
$(function () {

    // Initialize select2
    $("#selRelation").select2().on('select2:close', function () {
        var el = $(this);
        if (el.val() === "NEW") {
            var newval = prompt("Enter new value: ");
            
            if (newval !== null && newval !== '') {

                var request = { rtNew: newval };

                var strRequest = JSON.stringify(request);

                $.ajax({
                    url: 'NewTopics.aspx/GetNewRT',
                    data: strRequest,
                    dataType: "json",
                    contentType: "application/json",
                    cache: false,
                    context: document.body,
                    type: 'POST',
                    success: function (response) {
                        $("#selRelation").select2({ data: response.d });
                        //el.append('<option value=' + newval + '>' + newval + '</option>')
                        //.val(newval);
                    }
                });
            } else {
                alert('pleae enter something!!');
            }
        }
    });

    
    //Retrieve Relations OnLoad Page
    var request = { rtVal: 'onloadCall' };

    var strRequest = JSON.stringify(request);
    $.ajax({
        url: 'NewTopics.aspx/GetAllRelations',
        data: strRequest,
        dataType: "json",
        contentType: "application/json",
        cache: false,
        context: document.body,
        type: 'POST',
        success: function (response) {

            $("#selRelation").select2({ data: response.d });

        }
    });

});

