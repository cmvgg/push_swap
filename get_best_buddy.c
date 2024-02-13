#include "push_swap.h"

int	ft_calculate_cost_up(int size, int index)
{
	int	counter;

	counter = 0;
	if (index <= (size / 2))
	{
		counter = index;
	}
	else if (index > (size / 2))
		counter = size - index;
	return (counter);
}

int	ft_get_best_buddy(t_list **stack_a, long long nb)
{
	long int	best_buddy;
	long int	counter;
	long int	tmp;
	t_list		*temp;

	counter = __LONG_LONG_MAX__;
	best_buddy = __LONG_LONG_MAX__;
	temp = *stack_a;
	while (*stack_a)
	{
		tmp = (*stack_a)->content - nb;
		if ((tmp < counter) && ((*stack_a)->content > nb))
		{
			counter = tmp;
			best_buddy = (*stack_a)->content;
		}
		(*stack_a) = (*stack_a)->next;
	}
	*stack_a = temp;
	if (best_buddy == __LONG_LONG_MAX__)
		return (-1);
	return (ft_get_index(best_buddy, *stack_a));
}
