
#include "../push_swap.h"

void	ft_reverse_rotate(t_list **stack)
{
	t_list	*temp;

	if (!(*stack) || !((*stack)->next))
		return ;
	temp = ft_lstlast(*stack);
	ft_lstlast(*stack)->next = *stack;
	while ((*stack)->next != temp)
		*stack = (*stack)->next;
	(*stack)->next = NULL;
	*stack = temp;
}

int	rra(t_list **stack_a, char moves[], int i)
{
	ft_reverse_rotate(stack_a);
	moves[i] = '9';
	i++;
	return (i);
}

int	rrb(t_list **stack_b, char moves[], int i)
{
	ft_reverse_rotate(stack_b);
	moves[i] = '3';
	i++;
	return (i);
}

void	rrr(t_list **stack_a, t_list **stack_b)
{
	ft_reverse_rotate(stack_a);
	ft_reverse_rotate(stack_b);
}
