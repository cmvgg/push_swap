
#include "../push_swap.h"

void	ft_rotate(t_list **stack)
{
	t_list	*temp;

	if (!(*stack) || !((*stack)->next))
		return ;
	temp = (*stack)->next;
	ft_lstlast(*stack)->next = *stack;
	(*stack)->next = NULL;
	*stack = temp;
}

int	ra(t_list **stack_a, char moves[], int i)
{
	ft_rotate(stack_a);
	moves[i] = '6';
	i++;
	return (i);
}

int	rb(t_list **stack_b, char moves[], int i)
{
	ft_rotate(stack_b);
	moves[i] = '7';
	i++;
	return (i);
}

void	rr(t_list **stack_a, t_list **stack_b)
{
	ft_rotate(stack_a);
	ft_rotate(stack_b);
}
