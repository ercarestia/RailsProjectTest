//= require active_admin/base
//= require select2-full
//= require sweetalert2

$(function () {
  $('select').select2();

  // CONFIGURE PANELS COLLAPSER
  $(".panel[data-panel]").each(function () {
    var $this = $(this);
    var $a = $("<a href='javascript:void(null)'>").on("click", function (event) {
      $(this).closest(".panel").find(".panel_contents").each(function () {
        $(this).slideToggle();
      });
      $(this).closest("h3").each(function () {
        $(this).toggleClass("panel-collapsed");
      });
    })
    var $h3 = $this.find("h3:first");
    $h3.each(function () { $(this).wrapInner($a) });
    if ($this.data("panel") == 'collapsed') {
      $h3.each(function () { $(this).addClass('panel-collapsed') });
      $this.find(".panel_contents").each(function () { $(this).hide() });
    }
  });

  // Add week section
  if ($('a[href="#add_week"]').length) {
    $('a[href="#add_week"]').click(function (event) {
      event.preventDefault();
      return $.getJSON(window.uri() + "/add_week", function (data) {
          window.location.href = window.uri() + "?tab=" 
            + data.week + "&size=" 
            + new URL(location.href).searchParams.get('size');
      });
    });
  }
  // remove food section
  if ($('.remove-food').length) {
    $('.remove-food').click(function (event) {
      event.preventDefault();
      return $.get($(event.target).attr('href') || $(event.target).parent().attr('href'), function () {
        const newUrl = window.uri() + "?tab=" + (
          $('.food-selector li[aria-selected="true"] a').attr("href") || $('.food-selector li:first a').attr("href")
        ).replace('#', '') + "&size=" + new URL(location.href).searchParams.get('size') + '&scroll=' + $(document).scrollTop().valueOf();
        return window.location.href = newUrl;
      });
    });
  }

  // remove week section
  if($('.food-selector li').length > 2) {
    (
      $('li[aria-controls="add_week"]').length ? $('.food-selector li:nth-last-child(2)') : $('.food-selector li:nth-last-child(1)')
    ).append("<span class=last-week-close><i class='fa fa-close'></i></span>")
  }
  if ($('.last-week-close').length) {
    $('.last-week-close').click(function (event) {
      event.preventDefault();
      confirm("Delete week?", 'Remove', function() {
        $.get(window.uri() + "/remove_week", function () {
          const newUrl = window.uri() + "?tab=" + (
            $('.food-selector li[aria-selected="true"] a').attr("href") || $('.food-selector li:first a').attr("href")
          ).replace('#', '') + "&size=" + new URL(location.href).searchParams.get('size') + '&scroll=' + $(document).scrollTop().valueOf();
          return window.location.href = newUrl;
        });
      });
    });
  }

  // Custom popup for Edit Food
  if ($('.edit-food').length) {
    $('.edit-food').click(function (event) {
      event.preventDefault();
      const _this = $(event.target);
      $.getJSON("/admin/foods.json?per_page=10000", function (data) {
        foods = $.map(data, function (n, i) {
          return ([[n.name, n.id]]);
        });
        $( "body" ).on( "modal_dialog:before_open", function() {
          $('#dialog_confirm select').val(_this.data('food-id'));
        });
        ActiveAdmin.ModalDialog("Select Food", { food: foods }, function (inputs) {
          return $.get((_this.attr('href') || $(event.target).parent().attr('href')) + '&food=' + inputs.food, function () {
            const newUrl = window.uri() + "?tab=" + (
              $('.food-selector li[aria-selected="true"] a').attr("href") || $('.food-selector li:first a').attr("href")
            ).replace('#', '') + "&size=" + new URL(location.href).searchParams.get('size') + '&scroll=' + $(document).scrollTop().valueOf();
            return window.location.href = newUrl;
          });
        });

      }).fail(function (jqxhr, settings, ex) { alert('failed, ' + ex); });
    });
  }

  // JSON Panel Renderer
  const outputElem = document.getElementById('panel-json-raw');
  if (outputElem) {
    const testObj = JSON.parse(outputElem.innerHTML);
    new JSONEditor(document.getElementById('panel-json-pre'), { 'mode': 'view' }, testObj)
  }

  // Multi button selector for Gallery Thumbnail
  $('.multi-button button i, .multi-button button').click(function(event) {
    window.location.href = window.uri() + "?tab=" + (
      $('.food-selector li[aria-selected="true"] a').attr("href") || $('.food-selector li:first a').attr("href")
    ).replace('#', '') + "&size=" + ($(event.target).data('size') || $(event.target).find('i').data('size'))
  });

  // Select tab and scroll on page load
  const tab = new URL(location.href).searchParams.get('tab')
  if(tab) $('a[href="#' + tab + '"').click()
  const scroll = new URL(location.href).searchParams.get('scroll')
  if(scroll) $("html, body").animate({scrollTop: scroll}, 10)


  // Format Active admin dialog and select 2
  $( "body" ).on( "modal_dialog:after_open", function() {
    $('div[role="dialog"]').css('width', '50%');
    $('div[role="dialog"]').css('margin-left', '-15%');
    $('#dialog_confirm select').select2();
    $('span.select2.select2-container').css('width', '100%');
  });

  if($('.flashes .flash_notice').length) {
    Swal.fire({
      position: 'top-end',
      title: $('.flashes .flash_notice').text(),
      showConfirmButton: false,
      timer: 1500,
      toast: true
    })
  }

  $('table.sm-gallery-table td').on('mousemove', function(e){
    elem = $(e.target).find('img.hover-image-td')[0];
    elem.style.left = e.pageX + 'px';
    elem.style.top = e.pageY + 70 + 'px';
  });

  $.rails.allowAction = function(link){
    if (link.data("confirm") == undefined){
      return true;
    }
    $.rails.showConfirmationDialog(link);
    return false;
  }
  
  //User click confirm button
  $.rails.confirmed = function(link){
    link.data("confirm", null);
    link.trigger("click.rails");
  }
  
  //Display the confirmation dialog
  $.rails.showConfirmationDialog = function(link){
    var message = link.data("confirm");
    swal({
      title: message,
      type: 'warning',
      confirmButtonText: 'Sure',
      confirmButtonColor: 'teal',
      showCancelButton: true
    }).then(function(e){
      if (e.value) {
        $.rails.confirmed(link);
      }
    });
  };
});

var msngr;
window.confirm = (msg, btn, perfm) => {
  Swal.fire({
    title: msg,
    type: 'warning',
    showCancelButton: true,
    confirmButtonText: btn,
    confirmButtonColor: 'teal'
  }).then((result) => {
    console.log(result.value)
    /* Read more about isConfirmed, isDenied below */
    if (result.value) {
      perfm()
    } else {
      Swal.fire({
        position: 'top-end',
        title: 'Cancelled!',
        showConfirmButton: false,
        timer: 1500,
        toast: true
      })
    }
  })
}

window.uri = () => window.location.href.match(/^[^\#\?]+/)[0];


