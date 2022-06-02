/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   lexer_utils_1.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: merlich <merlich@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/04/17 21:17:51 by merlich           #+#    #+#             */
/*   Updated: 2022/06/02 18:41:08 by merlich          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../minishell.h"

t_token	*ft_token_lstnew(char *value)
{
	t_token	*new;

	new = NULL;
	if (value)
	{
		new = malloc(sizeof(t_token));
		if (NULL == new)
		{
			free(value);
			exit (ENOMEM);
		}
		new->str_val = value;
		new->type = UNDEFINED;
		new->next = NULL;
		new->prev = NULL;
	}
	return (new);
}

int	ft_token_lstsize(t_token *head)
{
	int	count;

	count = 0;
	while (head)
	{
		head = head->next;
		count++;
	}
	return (count);
}

t_token	*ft_token_lstlast(t_token *head)
{
	if (head != NULL)
	{
		while (head->next != NULL)
		{
			head = head->next;
		}
	}
	return (head);
}

void	ft_token_lstadd_front(t_token **head, t_token *new)
{
	if (NULL != new)
	{
		new->prev = NULL;
		new->next = *head;
		if (*head)
			(*head)->prev = new;
		*head = new;
	}
}

void	ft_token_lstadd_back(t_token **head, t_token *new)
{
	t_token	*lst_last;

	if (NULL != new)
	{
		lst_last = ft_token_lstlast(*head);
		if (lst_last == NULL)
		{
			ft_token_lstadd_front(head, new);
		}
		else
		{
			lst_last->next = new;
			new->prev = lst_last;
			new->next = NULL;
		}
	}
}
