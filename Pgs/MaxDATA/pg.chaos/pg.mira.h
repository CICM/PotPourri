
#ifndef DEF_mira
#define DEF_mira

#include "pg.chaos.h"

void mira_bang(t_chaos *x);
void mira_list(t_chaos *x, t_symbol *s, short ac, t_atom *av);
void mira_set(t_chaos *x, t_symbol *s, short ac, t_atom *av);
void mira_print(t_chaos *x);
void mira_record(t_chaos *x);
void *mira_new(t_symbol *s, int argc, t_atom *argv);
void mira_free(t_chaos *x);
void mira_reset(t_chaos *x);
void mira_init(t_chaos *x, t_symbol *s, short argc, t_atom *argv);
void mira_assist(t_chaos *x, void *b, long m, long a, char *s);

#endif