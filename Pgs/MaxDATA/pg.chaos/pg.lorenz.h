
#ifndef DEF_lorenz
#define DEF_lorenz

#include "pg.chaos.h"

void lorenz_bang(t_chaos *x);
void lorenz_list(t_chaos *x, t_symbol *s, short ac, t_atom *av);
void lorenz_set(t_chaos *x, t_symbol *s, short ac, t_atom *av);
void lorenz_print(t_chaos *x);
void lorenz_record(t_chaos *x);
void *lorenz_new(t_symbol *s, int argc, t_atom *argv);
void lorenz_free(t_chaos *x);
void lorenz_reset(t_chaos *x);
void lorenz_init(t_chaos *x, t_symbol *s, short argc, t_atom *argv);
void lorenz_assist(t_chaos *x, void *b, long m, long a, char *s);

#endif