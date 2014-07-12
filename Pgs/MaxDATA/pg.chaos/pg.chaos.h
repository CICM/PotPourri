
#ifndef DEF_CHAOS
#define DEF_CHAOS

#include "ext.h"
#include "ext_obex.h"
#include "ext_common.h"

#define TWOPI	6.28318530717958647692

typedef struct  _chaos
{
	t_object f_ob;

	void	*out;
	void	*out2;
	void	*out3;
	void	*out4;
	long	f_inlet;
	void	*f_proxy;
	

	float	f_parameter[7];
	float	f_parameterInit[7];

	int f_mode;
	int	f_count;

} t_chaos;

t_symbol *ps_bang;

void *chaos_class;

#endif