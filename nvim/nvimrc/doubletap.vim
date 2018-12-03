
" " Default insert map for all file types
" " let g:doubletap_insert = {
" "     \"(": {'insert': '()', 'r': ')'},
" "     \"[": {'insert': '[]', 'r': ']'},
" "     \"{": {'insert': '{}', 'r': '}'},
" "     \"<": {'insert': '<>', 'r': '>'},
" "     \"'": {'insert': "''", 'string': 1},
" "     \"`": {'insert': "``"},
" " \}
" 
" " Default finishers map for all file types
" " let g:doubletap_finishers = {
" "     \';': ';',
" "     \',': ',',
" " \}
" 
" " Both the finishers and insert settings can be tuned at the filetype level.
" " The filetype settings are merged into the global settings. To disable a
" " particular pattern, add "'disabled': 1" to your settings.
" let g:doubletap_python_finishers = {';': '', ',': ','}
" let g:doubletap_python_insert = {"\\": {'insert': '""""""', 'bs': -2}}
" " let g:doubletap_python_insert = {"\\": {'insert': '""""""', 'bs': -2}, '`': {'disabled': 1}}
" 
" " How big is the time window to look for a double tap event in milliseconds
" " Default: 750
" let g:doubletap_timeout = 750
" 
" " Allow double tap inserts to happen while inside a string
" " Default is no
" let g:doubletap_insert_in_string = 0
" " let g:doubletap_python_insert_in_string = 1
" 
" " The timeout is supported at the fileype level
" " For example, shorten the timeout to 700 for python files
" let g:doubletap_python_timeout = 700
