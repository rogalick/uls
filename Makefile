NAME = uls

SRCD = src
INCD = inc
OBJD = obj
LBMXD = libmx

LMBX = libmx.a
INC = uls.h
SRC = main.c \
mx_print_x.c \
mx_get_flags_for_file.c \
mx_get_flag_f.c \
mx_print_flag_f.c \
mx_color.c \
mx_print_m.c \
mx_read_dir.c \
mx_num_file.c \
mx_sort_dir_alp.c \
mx_sort_dir.c \
mx_check_control_char.c \
mx_columns.c \
mx_print_file.c \
mx_print_to_file.c \
mx_head_size.c \
mx_get_result.c \
mx_size_all.c \
mx_read_link.c \
mx_sort_file.c \
mx_get_time.c \
mx_get_ino.c \
mx_get_link.c \
mx_get_uid.c \
mx_get_gid.c \
mx_get_blocks.c \
mx_get_law.c \
mx_get_flag_l.c \
mx_get_size_bytes.c \
mx_get_dev.c \
mx_get_rdev.c \
mx_get_minmaj.c \
mx_get_acl.c \
mx_isspecial.c \
mx_islink.c \
mx_print_l.c \
mx_sort_my_list.c \
mx_print_spase.c \
mx_printstr_update.c \
mx_control_char_name.c \
mx_itoa_sp.c \
mx_full_path.c \
mx_sort_revers.c \
mx_sort_all.c \
mx_get_data.c \
mx_sort_size.c \
mx_read_flags.c \
mx_count_flags_in_str.c \
mx_dir_arr.c \
mx_printerr.c \
mx_print_error.c \
mx_check_flags.c \
mx_basic_flags.c \
mx_flags_for_sort.c \
mx_other_flags.c \
mx_printerr_char.c \
mx_flags_into_arr.c \
mx_get_is.c \
mx_creat_list.c \
mx_sort_time.c \
mx_get_file_col.c \
mx_many_argument.c \
mx_error_print.c \
mx_file_argument.c \
mx_dir_argument.c \
mx_last_char.c \
mx_sort_dir_arr.c \
mx_one_argument.c \
mx_flag_link.c \
mx_flag_r.c \
mx_error_printer.c \
mx_return_value.c \
mx_flags_parser.c \
mx_permission_denied.c \
mx_error.c \
mx_directories.c \
mx_specified_directories.c \
mx_recursion.c \
mx_list_of_files.c \
mx_list_of_dirs.c \
mx_files_list_maker.c \
mx_quicksort_strarr.c \
mx_strarr_size.c \
mx_second_section.c \
mx_is_in_arr.c \
mx_count_list.c \
mx_pure_output.c \
mx_rest.c \
mx_sort_output.c \
mx_free_strarr.c \
mx_tfiles_freesher.c \
mx_create_tdirs.c \
mx_create_tfiles.c \
mx_push_back_tdirs.c \
mx_push_back_tfiles.c \
mx_file_exists.c \
mx_argv_index.c \
mx_file_type.c \
mx_flag_d.c \
mx_new_strarr.c \
mx_type.c \
mx_char_in_arr_counter.c \
mx_a_checker.c \
mx_three_join.c \
mx_string_copy.c \
mx_is_directory.c \
mx_flag_m.c \
mx_minus_one.c \
mx_convert_date.c \
mx_file_mode.c \
mx_flag_l_output.c \
mx_get_stgid.c \
mx_getuser.c \
mx_print_total.c \
mx_flag_p.c \
mx_flag_p_for_pureoutput.c \
mx_link.c \
mx_file_name_retriever.c \
mx_getint_len.c \
mx_strarr.c \
mx_super_print.c \
mx_file_mode_add.c \

INCLUDE = -I $(LBMXD) \
	-I $(INCD) \

LBMXS = $(addprefix $(LBMXD)/, $(LMBX))
INCS = $(addprefix $(INCD)/, $(INC))
SRCS = $(addprefix $(SRCD)/, $(SRC))
OBJS = $(addprefix $(OBJD)/, $(SRC:%.c=%.o))
	
CFLAGS = -std=c99 $(addprefix -W, all extra error pedantic)
CC = clang

all: $(NAME)

install: $(NAME) clean

$(LBMXS):
	@make -sC $(LBMXD)

$(NAME): $(OBJS) $(LBMXS)
	@$(CC) $(CFLAGS) $(LBMXS) $(OBJS) -o $@
	@printf "\x1b[32;1m$@ created\x1b[0m\n"

$(OBJD)/%.o: $(SRCD)/%.c $(INCS)
	@$(CC) $(CFLAGS) -c $< -o $@ $(INCLUDE)
	@printf "\x1b[32mcompiled: \x1b[0m[$(<:$(SRCD)/%.c=%.c)]\n"

$(OBJS): | $(OBJD)

$(OBJD):
	@mkdir -p $@

uninstall: clean
	@make -sC $(LBMXD) $@
	@rm -rf $(NAME)
	@printf "\x1b[34;1mdeleted $(NAME)\x1b[0m\n"

clean:
	@make -sC $(LBMXD) $@
	@rm -rf $(OBJD)
	@printf "\x1b[34;1mdeleted $(OBJD)\x1b[0m\n"

reinstall: uninstall install