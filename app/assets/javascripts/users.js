// when the page is ready for manipulation
$(document).on("turbolinks:load", function () {
    // when the load more link is clicked
    $('a.load-more').click(function (e) {

        // prevent the default click action
        e.preventDefault();

        // hide load more link
        $('.load-more').hide();

        // show loading gif
        $('.loading-gif').show();

        // get the last id and save it in a variable 'last-id'
        var last_id = $('.record').last().attr('data-id');
        var electricians_arr_string = $('.load-more-container').attr('data-id');
        var page_limit = $('.initial-list').attr('data-id');
        electricians_arr = JSON.parse("[" + electricians_arr_string + "]")[0]
        var arr_length = electricians_arr.length
        var current_index = electricians_arr.indexOf(parseInt(last_id))
        if ((arr_length - current_index) < parseInt(page_limit)) {
          last_entry = true
        } else {
          last_entry = false
        }
        // 

        // make an ajax call passing along our last user id
        $.ajax({

            // make a get request to the server
            type: "GET",
            // get the url from the href attribute of our link
            url: $(this).attr('href'),
            // send the last id to our rails app
            data: {
                id: last_id
            },
            // the response will be a script
            dataType: "script",

            // upon success 
            success: function () {
              // hide the loading gif
              $('.loading-gif').hide();
              if (last_entry) {
                // show our load more link
                $('.load-more-container').hide();
              } else {
                // show our load more link
                $('.load-more').show();                
              }
            }
        });

    });
});