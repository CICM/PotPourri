
#ifndef DEF_IKEDA
#define DEF_IKEDA

#include "pg.chaos.h"

void ikeda_bang(t_chaos *x);
void ikeda_list(t_chaos *x, t_symbol *s, short ac, t_atom *av);
void ikeda_set(t_chaos *x, t_symbol *s, short ac, t_atom *av);
void ikeda_print(t_chaos *x);
void ikeda_record(t_chaos *x);
void *ikeda_new(t_symbol *s, int argc, t_atom *argv);
void ikeda_free(t_chaos *x);
void ikeda_reset(t_chaos *x);
void ikeda_init(t_chaos *x, t_symbol *s, short argc, t_atom *argv);
void ikeda_assist(t_chaos *x, void *b, long m, long a, char *s);

#endif