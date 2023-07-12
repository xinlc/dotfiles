export def get-menus [] {
	[
      # Configuration for default nushell menus
      # Note the lack of source parameter
      {
        name: completion_menu
        only_buffer_difference: false
        marker: "| "
        type: {
            layout: columnar
            columns: 1
            col_width: 20   # Optional value. If missing all the screen width is used to calculate column width
            col_padding: 2

            # layout: list
            # page_size: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
      }
	]
}
