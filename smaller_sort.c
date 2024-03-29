
#include "push_swap.h"

int	ft_sort_four(t_list **stack_a, t_list **stack_b, char moves[], int i)
{
	int	j;

	j = ft_get_index(ft_get_min(*stack_a), *stack_a);
	i = ft_put_top_a(stack_a, j, moves, i);
	i = pb(stack_a, stack_b, moves, i);
	i = ft_sort_three(stack_a, moves, i);
	i = pa(stack_a, stack_b, moves, i);
	return (i);
}

int	ft_sort_three(t_list **stack_a, char moves[], int i)
{
	int	first;
	int	second;
	int	third;

	first = (*stack_a)->content;
	second = (*stack_a)->next->content;
	third = (*stack_a)->next->next->content;
	if ((first > second) && (second < third) && (first < third))
		i = sa(*stack_a, moves, i);
	else if ((first > second) && (second > third) && (first > third))
	{
		i = sa(*stack_a, moves, i);
		i = rra(stack_a, moves, i);
	}
	else if ((first > second) && (second < third) && (first > third))
		i = ra(stack_a, moves, i);
	else if ((first < second) && (second > third) && (first < third))
	{
		i = sa(*stack_a, moves, i);
		i = ra(stack_a, moves, i);
	}	
	else if ((first < second) && (second > third) && (first > third))
		i = rra(stack_a, moves, i);
	return (i);
}

int	ft_sort_five(t_list **stack_a, t_list **stack_b, char moves[], int i)
{
	int	index_min;
	int	index_max;

	index_max = ft_get_index(ft_get_max(*stack_a), *stack_a);
	i = ft_put_top_a(stack_a, index_max, moves, i);
	i = pb(stack_a, stack_b, moves, i);
	index_min = ft_get_index(ft_get_min(*stack_a), *stack_a);
	i = ft_put_top_a(stack_a, index_min, moves, i);
	i = pb(stack_a, stack_b, moves, i);
	i = ft_sort_three(stack_a, moves, i);
	i = pa(stack_a, stack_b, moves, i);
	i = pa(stack_a, stack_b, moves, i);
	i = ra(stack_a, moves, i);
	return (i);
}
