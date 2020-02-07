#include "uls.h"

void mx_check_flags(char *s, t_data *app) {
    if (mx_get_char_index(s, 'R') >= 0)
    	app->flags[18] = 1;
    mx_basic_flags(s, app);
    mx_flags_for_sort(s, app);
    mx_other_flags(s, app);
    free(s);
}

