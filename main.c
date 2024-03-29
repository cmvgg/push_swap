
#include "push_swap.h"

int	ft_is_sorted(t_list *stack_a)
{
	if (!stack_a)
		return (1);
	while (stack_a->next != NULL)
	{
		if ((stack_a->next->content) < (stack_a->content))
			return (0);
		stack_a = stack_a->next;
	}
	return (1);
}

void	possible_sorts(t_list *stack_a, t_list *stack_b, char moves[], int nb)
{
	int	i;

	i = 0;
	if (ft_is_sorted(stack_a))
		;
	else if (nb == 1)
		;
	else if (nb == 2)
	{
		if ((stack_a)->content > (stack_a)->next->content)
			i = sa(stack_a, moves, i);
	}
	else if (nb == 3)
		i = ft_sort_three(&stack_a, moves, i);
	else if (nb == 4)
		i = ft_sort_four(&stack_a, &stack_b, moves, i);
	else if (nb == 5)
		i = ft_sort_five(&stack_a, &stack_b, moves, i);
	else
		i = ft_cost_algorithm(&stack_a, &stack_b, moves, i);
	ft_print_moves(moves, i);
	ft_free_stack(stack_b);
	ft_free_stack(stack_a);
}

int	main(int ac, char **av)
{
	t_list			*stack_a;
	t_list			*stack_b;
	char			moves[99999];
	int				nb_elem;

	stack_b = NULL;
	nb_elem = 0;
	if (empty_file(av[1]))
		return (0);
	if (ac == 1)
		return (write(2, "Error\n", 6));
	nb_elem = ft_count_numbers(av);
	stack_a = ft_list_loading(av);
	if (stack_a == NULL)
		return(write(2, "Error\n", 6));
	else
		possible_sorts(stack_a, stack_b, moves, nb_elem);
}
