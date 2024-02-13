/*
 * No code was selected, so no documentation can be generated.
*/

#include "push_swap.h"

static unsigned int	parse_digits(const char **str)
{
	unsigned int	nb;

	nb = 0;
	while (**str >= '0' && **str <= '9')
	{
		nb = (nb * 10) + (**str - '0');
		(*str)++;
	}
	return (nb);
}

int	ft_atoi(const char *str)
{
	unsigned int	nb;
	short int		sign;

	sign = 1;
	nb = 0;
	while (*str == ' ' || (*str >= '\t' && *str <= '\r'))
		str++;
	if (*str == '-')
	{
		sign = -1;
		str++;
	}
	else if (*str == '+')
		str++;
		nb = parse_digits(&str);
	if (nb > 2147483647 && sign == 1)
		return (-1);
	else if (nb - 1 > 2147483647 && sign == -1)
		return (0);
	return ((int)(nb * sign));
}

int	ft_isdigit(int i)
{
	if ((i >= '0' && i <= '9'))
		return (1);
	return (0);
}

char	**recursive_split(char *str, char **arr, int words, char c)
{
	char	*new_str;
	int		i;

	i = 0;
	new_str = 0;
	while (str && *str && *str == c)
		str++;
	while (str && str[i] && str[i] != c)
		i++;
	if (i > 0)
		new_str = (char *)malloc(i + 1);
	if (new_str)
		new_str[i] = 0;
	i = 0;
	while (new_str && str && *str && *str != c)
		new_str[i++] = *str++;
	if (new_str)
		arr = recursive_split(str, arr, words + 1, c);
	else
		arr = (char **)malloc(sizeof(char *) * (words + 1));
	if (arr)
		arr[words] = new_str;
	return (arr);
}

char	**ft_split(const char *str, char c)
{
	return (recursive_split((char *)str, NULL, 0, c));
}


size_t	ft_strlen(const char *str)
{
	size_t	x;

	x = 0;
	while (str[x] != '\0')
		x++;
	return (x);
}
