//= require spree/backend

$(function () {
    $('#add_volume_price').unbind('click');
    $('#add_volume_price').click(function () {
        const target = $(this).data('target')
        const newTableRow = $('tr:visible:last', target).clone()
        const newId = new Date().getTime();

        newTableRow.find('span.select2').remove()

        newTableRow.find('input, select').each(function () {
            const el = $(this);

            el.val('')
            el.prop('id', el.prop('id').replace(/\d+/, newId))
            el.prop('name', el.prop('name').replace(/\d+/, newId))
            if (el.hasClass('select2')) {
                el.removeClass('select2-hidden-accessible')
                el.removeAttr('data-select2-id')
            }
        })

        newTableRow.find('a').each(function () {
            const el = $(this)
            el.prop('href', '#')
        })

        $(target).prepend(newTableRow);

        $('select.select2', newTableRow).select2({
            allowClear: true,
            dropdownAutoWidth: true
        });
    });
});
