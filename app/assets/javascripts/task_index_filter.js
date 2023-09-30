function changeTaskFilterSelectValue() {
    let order = $("#task_filter_input").val();
    $("#task_filter_select").val(order).trigger();
}

$(document).ready(function(){changeTaskFilterSelectValue});

function handleTaskFilterSelectChange() {
    let order = $(this).val();
    $("#task_filter_input").val(order);
    $("#task_filter_form").submit();
}

$(document).delegate("#task_filter_select", "change", handleTaskFilterSelectChange);