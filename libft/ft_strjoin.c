/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strjoin.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: merlich <merlich@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/10/07 15:22:42 by merlich           #+#    #+#             */
/*   Updated: 2022/05/12 22:32:03 by merlich          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strjoin(char const	*s1, char const	*s2)
{
	size_t	i;
	char	*new_str;

	i = 0;
	if (s1 == NULL || s2 == NULL)
		return (NULL);
	new_str = malloc((sizeof(char)) * (ft_strlen(s1) + ft_strlen(s2) + 1));
	if (NULL == new_str)
		return (NULL);
	else
	{
		while (s1[i] != '\0')
		{
			new_str[i] = s1[i];
			i++;
		}
		while (*s2 != '\0')
		{
			new_str[i] = *s2;
			i++;
			s2++;
		}
		new_str[i] = '\0';
		return (new_str);
	}
}
