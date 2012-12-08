jQuery(document).ready(function($) {
  $('.email_domain_settings .add').click(function(e) {
    var input_to_add = $(this).attr('data-tag')
    
    var controls = $('.domain_table .controls')
    $(input_to_add).insertBefore(controls)
    e.preventDefault()
  })

  $('.email_domain_settings').on('click', '.remove', (function(e) {
    var this_tr = $(this).parents(".domain_container")
    this_tr.remove()
    e.preventDefault()
  }))

})
