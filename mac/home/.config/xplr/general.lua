xplr.config.general.disable_debug_error_mode = false
xplr.config.general.enable_mouse = false
xplr.config.general.show_hidden = false
xplr.config.general.read_only = false
xplr.config.general.enable_recover_mode = true
xplr.config.general.hide_remaps_in_help_menu = false
xplr.config.general.enforce_bounded_index_navigation = false
xplr.config.general.prompt.format = '❯ '

------ Default UI
xplr.config.general.default_ui.prefix = ' '
xplr.config.general.default_ui.suffix = ''

------ Focus UI
xplr.config.general.focus_ui.prefix = '▸'
xplr.config.general.focus_ui.suffix = ''
xplr.config.general.focus_ui.style.add_modifiers = { 'Bold' }
xplr.config.general.focus_ui.style.fg = 'Yellow'

------ Selection UI
xplr.config.general.selection_ui.prefix = ' '
xplr.config.general.selection_ui.suffix = ''
xplr.config.general.selection_ui.style.add_modifiers = { 'Bold' }
xplr.config.general.selection_ui.style.fg = 'Green'

------ Sort & filter UI
-------- Separator
xplr.config.general.sort_and_filter_ui.separator.format = ' › '
xplr.config.general.sort_and_filter_ui.separator.style.add_modifiers = { 'Dim' }

-------- Default identidier
xplr.config.general.sort_and_filter_ui.default_identifier.style = {}

-------- Col spacing
xplr.config.general.table.col_spacing = 1

-------- Col widths
xplr.config.general.table.col_widths = {
    { Percentage = 10 },
    { Percentage = 50 },
    { Percentage = 10 },
    { Percentage = 10 },
    { Percentage = 20 },
}

-------- Tree
xplr.config.general.table.tree = {
    { format = '├─', style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil } },
    { format = '├─', style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil } },
    { format = '╰─', style = { add_modifiers = nil, bg = nil, fg = nil, sub_modifiers = nil } },
}

---- Node types
------ Directory
xplr.config.node_types.directory.meta.icon = ''
xplr.config.node_types.directory.style.add_modifiers = { 'Bold' }
xplr.config.node_types.directory.style.fg = 'Cyan'

------ File
xplr.config.node_types.file.meta.icon = ''

------ Symlink
xplr.config.node_types.symlink.meta.icon = '§'
xplr.config.node_types.symlink.style.add_modifiers = { 'Italic' }
xplr.config.node_types.symlink.style.fg = 'Magenta'

------ Panel UI
xplr.config.general.panel_ui.default.title.style = {
    fg = 'Reset',
    add_modifiers = { 'Bold' },
}

-- xplr.config.general.panel_ui.default.borders = {
--     'Bottom',
-- }
