define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'order_form/index' + location.search,
                    add_url: 'order_form/add',
                    edit_url: 'order_form/edit',
                    del_url: 'order_form/del',
                    multi_url: 'order_form/multi',
                    import_url: 'order_form/import',
                    table: 'order_form',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'desk_name_text', title: __('Desk_id')},
                        {field: 'user_name_text', title: __('User')},
                        {field: 'status', title: __('Status')},
                        {field: 'sum', title: __('Sum')},
                        {field: 'start_time_text', title: __('Start_time'), operate: 'LIKE'},
                        {field: 'end_time_text', title: __('End_time'), operate: 'LIKE'},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});