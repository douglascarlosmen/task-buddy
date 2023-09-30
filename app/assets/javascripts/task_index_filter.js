function changeTaskOrderSelectValue() {
    let order = $("#task_order_input").val();
    $("#task_order_select").val(order).trigger();
}

$(document).ready(function(){changeTaskOrderSelectValue});

function handleTaskOrderSelectChange() {
    let order = $(this).val();
    $("#task_order_input").val(order);
    $("#task_order_form").submit();
}

$(document).delegate("#task_order_select", "change", handleTaskOrderSelectChange);

function handleTaskStatusButtonClick() {
    let status = $(this).data('status');
    $("#task_status_input").val(status);
    $("#task_status_form").submit();
}

$(document).delegate(".task_status_btn", "click", handleTaskStatusButtonClick);