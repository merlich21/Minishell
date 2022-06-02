# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: merlich <merlich@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/20 19:17:52 by lcorinna          #+#    #+#              #
#    Updated: 2022/06/02 18:39:40 by merlich          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME_M			=	minishell

FILES			=	minishell.c \
					envp.c envp_utils.c llist.c ft_readline.c exit.c \
					lexer.c ft_get_tokens.c \
					lexer_utils_1.c lexer_utils_2.c lexer_utils_3.c \
					lexer_utils_4.c lexer_env_var.c lexer_env_var_utils.c \
					ft_split_symbols.c \
					parser.c parser_cmd_utils.c parser_group_utils.c \
					ft_check_redir_insource.c ft_check_redir_in.c \
					ft_check_redir_out.c ft_check_redir_append.c \
					ft_check_words.c ft_perror.c \
					bin_tree.c bin_tree_utils.c bin_tree_branches_utils.c \
					wildcards_argv.c wildcards_filename.c wildcards_utils.c \
					checkers.c \
					executor.c executor_one_cmd.c executor_many_cmd.c \
					exec_m_c_utils.c executor_utils.c \
					builtins/builtin_utils.c builtins/b_pwd.c \
					builtins/b_cd.c builtins/b_cd_utils.c builtins/b_unset.c \
					builtins/b_echo.c builtins/b_env.c builtins/b_exit.c \
					builtins/b_export.c builtins/b_export_print.c \
					builtins/b_export_utils.c builtins/b_export_new_elem.c \
					signal.c \
				

PATH_LIBFT		=	./libft/
LIBFT			=	libft.a

HOMEBREW_PREFIX	:=	$(shell test -n "$$(which brew)" \
						&& brew config | grep HOMEBREW_PREFIX | cut -d' ' -f2)
						
SRC_PATH		=	./srcs/
SRC				=	$(addprefix $(SRC_PATH), $(FILES))
OBJ				=	$(SRC:.c=.o)
DEP				=	$(SRC:.c=.d)
INCLUDE			=	./includes
INCLUDE_SYS		=	$(HOMEBREW_PREFIX)/opt/readline/include
LIB_SYS			=	$(HOMEBREW_PREFIX)/opt/readline/lib
CFLAGS			=	-Wall -Wextra -Werror -MMD -g

all				:	libmake $(NAME_M)

libmake			:
					make -C $(PATH_LIBFT)

bonus			:	all

$(NAME_M)		:	$(OBJ) $(PATH_LIBFT)$(LIBFT)
					cc $(CFLAGS) $(OBJ) $(PATH_LIBFT)$(LIBFT) -o $(NAME_M) \
					-lreadline -L$(LIB_SYS)

%.o				:	%.c Makefile
					cc $(CFLAGS) -c $< -o $@ -I$(LIB_SYS) -I$(INCLUDE_SYS)

clean			:
					rm -f $(OBJ) $(DEP) $(LIBFT)
					make clean -C $(PATH_LIBFT)

fclean			:	clean
					rm -f $(NAME_M)
					make fclean -C $(PATH_LIBFT)

re				:	fclean all

-include $(DEP)

.PHONY			:	all clean fclean re bonus
