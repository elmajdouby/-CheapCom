  import flatpickr from "flatpickr";
  $(document).ready(function(){
    $('.datepicker').datepicker({
            // datepicker: { showOtherMonths: true },
            modal: true,
            footer: true,
            dateFormat: 'dd-mm-yy'
    });
  });


