
#ifndef DEF_clifford
#define DEF_clifford

#include "pg.chaos.h"

void clifford_bang(t_chaos *x);
void clifford_list(t_chaos *x, t_symbol *s, short ac, t_atom *av);
void clifford_set(t_chaos *x, t_symbol *s, short ac, t_atom *av);
void clifford_print(t_chaos *x);
void clifford_record(t_chaos *x);
void *clifford_new(t_symbol *s, int argc, t_atom *argv);
void clifford_free(t_chaos *x);
void clifford_reset(t_chaos *x);
void clifford_init(t_chaos *x, t_symbol *s, short argc, t_atom *argv);
void clifford_assist(t_chaos *x, void *b, long m, long a, char *s);

#endif