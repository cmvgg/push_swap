#include "push_swap.h"

int	ft_get_max(t_list *lst)
{
	int	max;

	if (!lst)
		return (-1);
	max = lst->content;
	while (lst)
	{
		if (lst->content > max)
			max = lst->content;
		lst = lst->next;
	}	
	return (max);
}

int	ft_get_min(t_list *lst)
{
	int	min;

	if (!lst)
		return (-1);
	min = lst->content;
	while (lst)
	{
		if (lst->content < min)
			min = lst->content;
		lst = lst->next;
	}	
	return (min);
}

int	ft_get_index(int nb, t_list *lst)
{
	int	i;

	i = 0;
	while (lst)
	{
		if (lst->content == nb)
			return (i);
		i++;
		lst = lst->next;
	}
	return (-1);
}

int	ft_lstsize(t_list *lst)
{
	size_t	i;

	i = 0;
	while (lst)
	{
		lst = lst->next;
		i++;
	}
	return (i);
}
