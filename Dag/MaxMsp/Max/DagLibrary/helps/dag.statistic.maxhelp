{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 0,
			"revision" : 8
		}
,
		"rect" : [ 173.0, 93.0, 849.0, 437.0 ],
		"bgcolor" : [ 0.93, 0.93, 0.92, 1.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 11.595187,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 0,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"boxes" : [ 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-5",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 4.0, 63.0, 562.0, 33.0 ],
					"text" : "dag.statitic gets the minimum, maximum, average, variance, standard deviation, average deviation, skewness and kurtosis of a list.",
					"textcolor" : [ 0.30292, 0.30292, 0.30292, 1.0 ],
					"varname" : "autohelp_top_description[1]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.94324, 0.954082, 0.954082, 1.0 ],
					"bordercolor" : [ 0.235294, 0.235294, 0.235294, 0.2 ],
					"id" : "obj-43",
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 4.0, 63.0, 562.0, 33.0 ],
					"rounded" : 15,
					"shadow" : -1
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"frgb" : 0.0,
					"id" : "obj-14",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 501.0, 4.0, 141.0, 45.0 ],
					"text" : "daglibrary | Pierre Guillot  © 2012 CICM / Universite Paris 8",
					"textcolor" : [ 0.317518, 0.317518, 0.317518, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.05 ],
					"bordercolor" : [ 0.235294, 0.235294, 0.235294, 0.2 ],
					"id" : "obj-15",
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 501.0, 4.0, 141.0, 45.0 ],
					"rounded" : 6,
					"shadow" : -1
				}

			}
, 			{
				"box" : 				{
					"args" : [ "@obj-name", "dag.statistic", "@obj-desc", "A", "statistic", "calculator." ],
					"id" : "obj-25",
					"maxclass" : "bpatcher",
					"name" : "dag.helpheader.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 4.0, 4.0, 483.0, 56.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 7.180877,
					"hidden" : 1,
					"id" : "obj-38",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 0,
					"patching_rect" : [ 418.0, 26.5, 52.0, 23.0 ],
					"text" : "bgcolor 0.93 0.93 0.92 1."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"frgb" : 0.0,
					"id" : "obj-34",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 390.0, 255.0, 150.0, 19.0 ],
					"text" : "Advanced"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"frgb" : 0.0,
					"id" : "obj-32",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 90.0, 255.0, 150.0, 19.0 ],
					"text" : "Basic"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"frgb" : 0.0,
					"id" : "obj-30",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 302.0, 133.0, 95.0, 45.0 ],
					"text" : "Call a preset or play with the list..."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "preset",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "preset", "int", "preset", "int" ],
					"patching_rect" : [ 277.0, 124.0, 18.0, 53.0 ],
					"preset_data" : [ 						{
							"number" : 1,
							"data" : [ 204, "obj-28", "multislider", "list", 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.009091, 0.018182, 0.024242, 0.030303, 0.036364, 0.054545, 0.054545, 0.054545, 0.072727, 0.072727, 0.072727, 0.090909, 0.109091, 0.109091, 0.109091, 0.145455, 0.145455, 0.145455, 0.163636, 0.163636, 0.181818, 0.190909, 0.2, 0.2, 0.2, 0.218182, 0.227273, 0.236364, 0.245455, 0.254545, 0.272727, 0.278788, 0.284848, 0.290909, 0.309091, 0.345455, 0.363636, 0.381818, 0.4, 0.4, 0.436364, 0.436364, 0.454545, 0.454545, 0.472727, 0.518182, 0.527273, 0.527273, 0.527273, 0.545455, 0.572727, 0.581818, 0.6, 0.618182, 0.654545, 0.654545, 0.654545, 0.672727, 0.709091, 0.709091, 0.745455, 0.763636, 0.781818, 0.818182, 0.854545, 0.854545, 0.881818, 0.890909, 0.909091, 0.909091, 0.909091, 0.963636, 0.963636, 0.981818, 0.981818, 0.981818, 0.981818, 0.981818, 0.981818, 0.981818, 0.981818, 0.981818, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.972727, 0.963636, 0.963636, 0.945455, 0.927273, 0.9, 0.890909, 0.872727, 0.836364, 0.790909, 0.781818, 0.772727, 0.763636, 0.745455, 0.709091, 0.709091, 0.690909, 0.690909, 0.672727, 0.636364, 0.618182, 0.581818, 0.545455, 0.527273, 0.490909, 0.454545, 0.436364, 0.418182, 0.363636, 0.345455, 0.327273, 0.309091, 0.309091, 0.309091, 0.290909, 0.272727, 0.272727, 0.236364, 0.236364, 0.218182, 0.218182, 0.2, 0.181818, 0.181818, 0.145455, 0.127273, 0.127273, 0.109091, 0.090909, 0.090909, 0.054545, 0.054545, 0.036364, 0.036364, 0.036364, 0.036364, 0.036364, 0.036364, 0.036364, 0.036364, 0.027273, 0.018182, 0.018182, 0.018182, 0.018182, 0.018182, 0.018182, 0.018182, 0.018182, 0.018182, 0.018182, 0.018182, 0.009091, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5, "obj-64", "flonum", "float", 0.0, 5, "obj-63", "flonum", "float", 1.0, 5, "<invalid>", "flonum", "float", 0.236364, 5, "obj-61", "flonum", "float", 0.357409, 5, "obj-79", "flonum", "float", 0.355084, 5, "obj-78", "flonum", "float", 0.025108, 5, "obj-77", "flonum", "float", 0.126085, 5, "obj-76", "flonum", "float", 13.177318, 5, "obj-73", "flonum", "float", -1.177159 ]
						}
, 						{
							"number" : 2,
							"data" : [ 204, "obj-28", "multislider", "list", 0.345455, 0.327273, 0.327273, 0.327273, 0.327273, 0.327273, 0.327273, 0.327273, 0.327273, 0.327273, 0.327273, 0.336364, 0.345455, 0.345455, 0.345455, 0.345455, 0.345455, 0.354545, 0.363636, 0.369697, 0.375758, 0.381818, 0.385455, 0.389091, 0.392727, 0.396364, 0.4, 0.412121, 0.424242, 0.454545, 0.472727, 0.490909, 0.509091, 0.536364, 0.563636, 0.581818, 0.6, 0.654545, 0.672727, 0.745455, 0.763636, 0.781818, 0.836364, 0.963636, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.945455, 0.909091, 0.872727, 0.818182, 0.745455, 0.6, 0.545455, 0.509091, 0.490909, 0.454545, 0.436364, 0.4, 0.4, 0.4, 0.381818, 0.381818, 0.363636, 0.363636, 0.363636, 0.363636, 0.363636, 0.363636, 0.363636, 0.363636, 0.354545, 0.345455, 0.345455, 0.345455, 0.345455, 0.345455, 0.345455, 0.345455, 0.345455, 0.345455, 0.345455, 0.345455, 0.345455, 0.345455, 0.345455, 0.345455, 0.345455, 0.345455, 0.336364, 0.327273, 0.327273, 0.327273, 0.327273, 0.327273, 0.327273, 0.327273, 0.327273, 0.327273, 0.321212, 0.315152, 0.309091, 0.309091, 0.309091, 0.309091, 0.309091, 0.309091, 0.30303, 0.29697, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.290909, 0.284848, 0.278788, 0.272727, 0.272727, 0.272727, 0.266667, 0.260606, 0.254545, 0.254545, 0.254545, 0.254545, 0.254545, 0.254545, 0.254545, 0.254545, 0.254545, 0.254545, 0.254545, 0.254545, 0.254545, 0.254545, 0.254545, 0.254545, 0.254545, 0.254545, 0.254545, 0.254545, 0.263636, 0.272727, 5, "obj-64", "flonum", "float", 0.254545, 5, "obj-63", "flonum", "float", 1.0, 5, "<invalid>", "flonum", "float", 0.327273, 5, "obj-61", "flonum", "float", 0.387909, 5, "obj-79", "flonum", "float", 0.188622, 5, "obj-78", "flonum", "float", 0.013338, 5, "obj-77", "flonum", "float", 0.035578, 5, "obj-76", "flonum", "float", 340.704773, 5, "obj-73", "flonum", "float", 5.92411 ]
						}
, 						{
							"number" : 3,
							"data" : [ 204, "obj-28", "multislider", "list", 0.6, 0.6, 0.6, 0.6, 0.581818, 0.581818, 0.581818, 0.581818, 0.581818, 0.581818, 0.581818, 0.581818, 0.581818, 0.581818, 0.581818, 0.581818, 0.581818, 0.581818, 0.581818, 0.574545, 0.567273, 0.56, 0.552727, 0.545455, 0.536364, 0.527273, 0.522727, 0.518182, 0.513636, 0.509091, 0.504545, 0.5, 0.495455, 0.490909, 0.478788, 0.466667, 0.454545, 0.454545, 0.454545, 0.454545, 0.445455, 0.436364, 0.427273, 0.418182, 0.410909, 0.403636, 0.396364, 0.389091, 0.381818, 0.369697, 0.357576, 0.345455, 0.336364, 0.327273, 0.313636, 0.3, 0.286364, 0.272727, 0.254545, 0.236364, 0.218182, 0.2, 0.181818, 0.163636, 0.109091, 0.090909, 0.072727, 0.054545, 0.054545, 0.045455, 0.036364, 0.018182, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.014545, 0.029091, 0.043636, 0.058182, 0.072727, 0.109091, 0.145455, 0.151515, 0.157576, 0.163636, 0.190909, 0.218182, 0.245455, 0.272727, 0.281818, 0.290909, 0.3, 0.309091, 0.327273, 0.363636, 0.372727, 0.381818, 0.418182, 0.418182, 0.454545, 0.463636, 0.472727, 0.490909, 0.49697, 0.50303, 0.509091, 0.515152, 0.521212, 0.527273, 0.539394, 0.551515, 0.563636, 0.572727, 0.581818, 0.586364, 0.590909, 0.595455, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.604545, 0.609091, 0.613636, 0.618182, 0.618182, 0.618182, 0.618182, 0.618182, 0.618182, 0.618182, 0.618182, 0.618182, 0.618182, 0.618182, 0.618182, 0.618182, 0.618182, 0.618182, 0.618182, 0.618182, 0.618182, 0.618182, 0.618182, 0.618182, 0.618182, 0.618182, 0.618182, 0.636364, 5, "obj-64", "flonum", "float", 0.0, 5, "obj-63", "flonum", "float", 0.636364, 5, "<invalid>", "flonum", "float", 0.475758, 5, "obj-61", "flonum", "float", 0.377681, 5, "obj-79", "flonum", "float", 0.24034, 5, "obj-78", "flonum", "float", 0.016995, 5, "obj-77", "flonum", "float", 0.057763, 5, "obj-76", "flonum", "float", -41.185627, 5, "obj-73", "flonum", "float", -1.626511 ]
						}
, 						{
							"number" : 4,
							"data" : [ 204, "obj-28", "multislider", "list", 0.981818, 0.981818, 0.981818, 0.981818, 0.981818, 0.981818, 0.981818, 0.981818, 0.981818, 0.981818, 0.981818, 0.981818, 0.981818, 0.977273, 0.972727, 0.968182, 0.963636, 0.959091, 0.954545, 0.95, 0.945455, 0.940909, 0.936364, 0.931818, 0.927273, 0.92028, 0.913287, 0.906294, 0.899301, 0.892308, 0.885315, 0.878322, 0.871329, 0.864336, 0.857343, 0.85035, 0.843357, 0.836364, 0.830682, 0.825, 0.819318, 0.813636, 0.807955, 0.802273, 0.796591, 0.790909, 0.785227, 0.779545, 0.773864, 0.768182, 0.7625, 0.756818, 0.751136, 0.745455, 0.736759, 0.728063, 0.719368, 0.710672, 0.701976, 0.693281, 0.684585, 0.675889, 0.667194, 0.658498, 0.649802, 0.641107, 0.632411, 0.623715, 0.61502, 0.606324, 0.597628, 0.588933, 0.580237, 0.571541, 0.562846, 0.55415, 0.545455, 0.538843, 0.532231, 0.52562, 0.519008, 0.512397, 0.505785, 0.499174, 0.492562, 0.48595, 0.479339, 0.472727, 0.466116, 0.459504, 0.452893, 0.446281, 0.439669, 0.433058, 0.426446, 0.419835, 0.413223, 0.406612, 0.4, 0.393939, 0.387879, 0.381818, 0.375758, 0.369697, 0.363636, 0.357576, 0.351515, 0.345455, 0.339394, 0.333333, 0.327273, 0.322727, 0.318182, 0.313636, 0.309091, 0.304545, 0.3, 0.295455, 0.290909, 0.284848, 0.278788, 0.272727, 0.266667, 0.260606, 0.254545, 0.248485, 0.242424, 0.236364, 0.231818, 0.227273, 0.222727, 0.218182, 0.213636, 0.209091, 0.204545, 0.2, 0.195455, 0.190909, 0.186364, 0.181818, 0.178788, 0.175758, 0.172727, 0.169697, 0.166667, 0.163636, 0.160606, 0.157576, 0.154545, 0.151515, 0.148485, 0.145455, 0.142424, 0.139394, 0.136364, 0.133333, 0.130303, 0.127273, 0.123636, 0.12, 0.116364, 0.112727, 0.109091, 0.10303, 0.09697, 0.090909, 0.086364, 0.081818, 0.077273, 0.072727, 0.072727, 0.072727, 0.069091, 0.065455, 0.061818, 0.058182, 0.054545, 0.050505, 0.046465, 0.042424, 0.038384, 0.034343, 0.030303, 0.026263, 0.022222, 0.018182, 0.016162, 0.014141, 0.012121, 0.010101, 0.008081, 0.006061, 0.00404, 0.00202, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5, "obj-64", "flonum", "float", 0.0, 5, "obj-63", "flonum", "float", 0.981818, 5, "<invalid>", "flonum", "float", 0.390909, 5, "obj-61", "flonum", "float", 0.448409, 5, "obj-79", "flonum", "float", 0.329789, 5, "obj-78", "flonum", "float", 0.02332, 5, "obj-77", "flonum", "float", 0.108761, 5, "obj-76", "flonum", "float", 7.515539, 5, "obj-73", "flonum", "float", -1.396632 ]
						}
 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"frgb" : 0.0,
					"id" : "obj-70",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 209.0, 375.0, 60.0, 19.0 ],
					"text" : "variance"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"frgb" : 0.0,
					"id" : "obj-71",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 510.0, 375.0, 49.0, 19.0 ],
					"text" : "kurtosis"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"frgb" : 0.0,
					"id" : "obj-72",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 445.0, 375.0, 60.0, 19.0 ],
					"text" : "skewness"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-73",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 510.0, 345.0, 50.0, 19.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"frgb" : 0.0,
					"id" : "obj-74",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 390.0, 375.0, 60.0, 32.0 ],
					"text" : "average deviation"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"frgb" : 0.0,
					"id" : "obj-75",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 330.0, 375.0, 60.0, 32.0 ],
					"text" : "standard deviation"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-76",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 450.0, 345.0, 50.0, 19.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-77",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 390.0, 345.0, 50.0, 19.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-78",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 330.0, 345.0, 50.0, 19.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-79",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 210.0, 345.0, 50.0, 19.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-80",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "float", "float", "float" ],
					"patching_rect" : [ 330.0, 300.0, 199.0, 19.0 ],
					"text" : "unpack 0. 0. 0. 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"frgb" : 0.0,
					"id" : "obj-57",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 150.0, 375.0, 52.0, 19.0 ],
					"text" : "average"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"frgb" : 0.0,
					"id" : "obj-59",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 85.0, 375.0, 60.0, 19.0 ],
					"text" : "maximum"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"frgb" : 0.0,
					"id" : "obj-60",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 25.0, 375.0, 60.0, 19.0 ],
					"text" : "minimum"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-61",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 150.0, 345.0, 50.0, 19.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-63",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 90.0, 345.0, 50.0, 19.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-64",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 30.0, 345.0, 50.0, 19.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-65",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "float", "float", "float" ],
					"patching_rect" : [ 30.0, 300.0, 199.0, 19.0 ],
					"text" : "unpack 0. 0. 0. 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-56",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 30.0, 255.0, 55.0, 19.0 ],
					"text" : "zl slice 4"
				}

			}
, 			{
				"box" : 				{
					"contdata" : 1,
					"id" : "obj-28",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 30.0, 120.0, 243.0, 57.0 ],
					"setminmax" : [ 0.0, 1.0 ],
					"size" : 200
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 30.0, 210.0, 72.0, 19.0 ],
					"text" : "dag.statistic"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.94324, 0.954082, 0.954082, 1.0 ],
					"bordercolor" : [ 0.235294, 0.235294, 0.235294, 0.2 ],
					"id" : "obj-44",
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 13.0, 110.0, 408.0, 78.0 ],
					"rounded" : 15,
					"shadow" : -1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.94324, 0.954082, 0.954082, 1.0 ],
					"bordercolor" : [ 0.235294, 0.235294, 0.235294, 0.2 ],
					"id" : "obj-17",
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 325.0, 325.0, 239.0, 81.0 ],
					"rounded" : 15,
					"shadow" : -1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.94324, 0.954082, 0.954082, 1.0 ],
					"bordercolor" : [ 0.235294, 0.235294, 0.235294, 0.2 ],
					"id" : "obj-16",
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 25.0, 325.0, 239.0, 81.0 ],
					"rounded" : 15,
					"shadow" : -1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-56", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-80", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 75.5, 285.0, 339.5, 285.0 ],
					"source" : [ "obj-56", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-65", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-63", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-65", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-65", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-73", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-80", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-80", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-77", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-80", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-78", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-80", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "dag.helpheader.maxpat",
				"bootpath" : "/Users/Pierre/SourceTree/DagLibrary/MaxMsp/Max/others",
				"patcherrelativepath" : "../others",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "dag-icon.png",
				"bootpath" : "/Users/Pierre/SourceTree/DagLibrary/MaxMsp/Max/others",
				"patcherrelativepath" : "../others",
				"type" : "PNG ",
				"implicit" : 1
			}
, 			{
				"name" : "dag.statistic.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
