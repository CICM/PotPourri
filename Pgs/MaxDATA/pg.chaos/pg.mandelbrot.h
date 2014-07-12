
#ifndef DEF_mandelbrot
#define DEF_mandelbrot

#include "pg.chaos.h"

void mandelbrot_bang(t_chaos *x);
void mandelbrot_list(t_chaos *x, t_symbol *s, short ac, t_atom *av);
void mandelbrot_set(t_chaos *x, t_symbol *s, short ac, t_atom *av);
void mandelbrot_print(t_chaos *x);
void mandelbrot_record(t_chaos *x);
void *mandelbrot_new(t_symbol *s, int argc, t_atom *argv);
void mandelbrot_free(t_chaos *x);
void mandelbrot_reset(t_chaos *x);
void mandelbrot_init(t_chaos *x, t_symbol *s, short argc, t_atom *argv);
void mandelbrot_assist(t_chaos *x, void *b, long m, long a, char *s);

#endif