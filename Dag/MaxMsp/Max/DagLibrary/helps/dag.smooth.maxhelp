{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 0,
			"revision" : 8
		}
,
		"rect" : [ 401.0, 107.0, 913.0, 515.0 ],
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
					"id" : "obj-9",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 4.0, 62.0, 562.0, 33.0 ],
					"text" : "dag.smooth computes the weighted moving average to smooth the variations. The size of the subset is defined bu the size argument.",
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
					"patching_rect" : [ 4.0, 62.0, 562.0, 33.0 ],
					"rounded" : 15,
					"shadow" : -1
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"frgb" : 0.0,
					"id" : "obj-1",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 509.5, 17.0, 321.0, 19.0 ],
					"text" : "daglibrary | Pierre Guillot  © 2012 CICM / Universite Paris 8",
					"textcolor" : [ 0.317518, 0.317518, 0.317518, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.05 ],
					"bordercolor" : [ 0.235294, 0.235294, 0.235294, 0.2 ],
					"id" : "obj-2",
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 509.5, 17.0, 321.0, 19.0 ],
					"rounded" : 6,
					"shadow" : -1
				}

			}
, 			{
				"box" : 				{
					"args" : [ "@obj-name", "dag.smooth", "@obj-desc", "A", "value", "blender." ],
					"id" : "obj-5",
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
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"contdata" : 1,
					"id" : "obj-83",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 644.0, 105.0, 186.0, 78.0 ],
					"setminmax" : [ 0.0, 1.0 ],
					"size" : 150
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 1,
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 0,
							"revision" : 8
						}
,
						"rect" : [ 404.0, 102.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
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
						"boxes" : [ 							{
								"box" : 								{
									"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
									"contdata" : 1,
									"id" : "obj-55",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 274.0, 361.0, 186.0, 78.0 ],
									"setminmax" : [ 0.0, 1.0 ],
									"size" : 150
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-23",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 156.0, 273.0, 125.0, 18.0 ],
									"text" : "mode-funtionnality 50"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-22",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 245.0, 318.0, 136.0, 18.0 ],
									"text" : "mode-funtionnality -200"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-19",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 65.0, 108.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-16",
									"int" : 1,
									"maxclass" : "gswitch2",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 155.0, 198.0, 39.0, 32.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 245.0, 183.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 3,
									"outlettype" : [ "bang", "bang", "int" ],
									"patching_rect" : [ 50.0, 153.0, 49.0, 20.0 ],
									"text" : "uzi 200"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 125.0, 183.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 5,
									"numoutlets" : 4,
									"outlettype" : [ "int", "", "", "int" ],
									"patching_rect" : [ 125.0, 153.0, 87.0, 20.0 ],
									"text" : "counter 0 0 98"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-18",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "list" ],
									"patching_rect" : [ 95.0, 409.0, 116.0, 19.0 ],
									"saved_object_attributes" : 									{
										"size" : 8
									}
,
									"text" : "dag.smooth @size 8"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-50",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 129.0, 100.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-52",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 129.0, 125.0, 50.0, 19.0 ],
									"text" : "metro 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-2",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 290.0, 288.0, 32.5, 18.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-14",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 95.0, 347.0, 80.0, 19.0 ],
									"text" : "zl stream 150"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-9",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 95.0, 273.0, 32.5, 17.0 ],
									"text" : "1"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-61",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 76.333328, 40.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-62",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 95.0, 488.0, 25.0, 25.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-55", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-16", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-22", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-16", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-23", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-62", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-22", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-23", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-4", 3 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-52", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-52", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-18", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-55", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-61", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-61", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-61", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-9", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 765.0, 55.0, 27.0, 20.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 12.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p z"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"contdata" : 1,
					"id" : "obj-80",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 644.0, 105.0, 186.0, 78.0 ],
					"setminmax" : [ 0.0, 1.0 ],
					"size" : 200
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"contdata" : 1,
					"id" : "obj-22",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 644.0, 105.0, 186.0, 78.0 ],
					"setminmax" : [ 0.0, 1.0 ],
					"size" : 150
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 1,
					"id" : "obj-74",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 0,
							"revision" : 8
						}
,
						"rect" : [ 404.0, 102.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
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
						"boxes" : [ 							{
								"box" : 								{
									"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
									"contdata" : 1,
									"id" : "obj-55",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 245.0, 318.0, 186.0, 78.0 ],
									"setminmax" : [ 0.0, 1.0 ],
									"size" : 150
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-31",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "bang" ],
									"patching_rect" : [ 275.0, 243.0, 54.0, 20.0 ],
									"text" : "togedge"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-30",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 245.0, 213.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-23",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 155.0, 273.0, 132.0, 18.0 ],
									"text" : "mode-funtionnality 200"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-22",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 245.0, 318.0, 136.0, 18.0 ],
									"text" : "mode-funtionnality -200"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-19",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 65.0, 108.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-16",
									"maxclass" : "gswitch2",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 155.0, 198.0, 39.0, 32.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 245.0, 183.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 3,
									"outlettype" : [ "bang", "bang", "int" ],
									"patching_rect" : [ 50.0, 153.0, 49.0, 20.0 ],
									"text" : "uzi 200"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 125.0, 183.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 5,
									"numoutlets" : 4,
									"outlettype" : [ "int", "", "", "int" ],
									"patching_rect" : [ 125.0, 153.0, 87.0, 20.0 ],
									"text" : "counter 0 0 98"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-18",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "list" ],
									"patching_rect" : [ 95.0, 409.0, 116.0, 19.0 ],
									"saved_object_attributes" : 									{
										"size" : 8
									}
,
									"text" : "dag.smooth @size 8"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-50",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 129.0, 100.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-52",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 129.0, 125.0, 50.0, 19.0 ],
									"text" : "metro 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-2",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 290.0, 288.0, 32.5, 18.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-14",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 95.0, 347.0, 80.0, 19.0 ],
									"text" : "zl stream 150"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-9",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 95.0, 273.0, 32.5, 17.0 ],
									"text" : "1"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-61",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 76.333328, 40.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-62",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 95.0, 488.0, 25.0, 25.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-55", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-16", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-62", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-22", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-23", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-31", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-22", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-31", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-23", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-31", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-4", 3 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-52", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-52", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-18", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-55", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-61", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-61", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-61", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-9", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 704.0, 55.0, 27.0, 20.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 12.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p z"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"contdata" : 1,
					"id" : "obj-23",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 644.0, 105.0, 186.0, 78.0 ],
					"setminmax" : [ 0.0, 1.0 ],
					"size" : 52
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 1,
					"id" : "obj-71",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 0,
							"revision" : 8
						}
,
						"rect" : [ 410.0, 100.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
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
						"boxes" : [ 							{
								"box" : 								{
									"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
									"contdata" : 1,
									"id" : "obj-53",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 53.0, 343.0, 186.0, 78.0 ],
									"setminmax" : [ 0.0, 1.0 ],
									"size" : 52
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-34",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 185.0, 273.0, 132.0, 18.0 ],
									"text" : "mode-funtionnality 200"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-35",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 318.0, 136.0, 18.0 ],
									"text" : "mode-funtionnality -200"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-36",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 95.0, 108.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-37",
									"int" : 1,
									"maxclass" : "gswitch2",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 185.0, 198.0, 39.0, 32.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-38",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 275.0, 183.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-39",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 3,
									"outlettype" : [ "bang", "bang", "int" ],
									"patching_rect" : [ 80.0, 153.0, 49.0, 20.0 ],
									"text" : "uzi 200"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-40",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 155.0, 183.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-41",
									"maxclass" : "newobj",
									"numinlets" : 5,
									"numoutlets" : 4,
									"outlettype" : [ "int", "", "", "int" ],
									"patching_rect" : [ 155.0, 153.0, 87.0, 20.0 ],
									"text" : "counter 0 0 18"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-43",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "list" ],
									"patching_rect" : [ 216.0, 431.0, 129.0, 19.0 ],
									"saved_object_attributes" : 									{
										"size" : 200
									}
,
									"text" : "dag.smooth @size 200"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-45",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 159.0, 100.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-46",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 159.0, 125.0, 50.0, 19.0 ],
									"text" : "metro 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-47",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 320.0, 288.0, 32.5, 18.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-48",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 125.0, 318.0, 74.0, 19.0 ],
									"text" : "zl stream 52"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-49",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 125.0, 273.0, 32.5, 17.0 ],
									"text" : "1"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-64",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 106.333344, 40.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-65",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 125.0, 473.0, 25.0, 25.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-34", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-39", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-36", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-34", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-37", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-37", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-37", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-37", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-38", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-40", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-41", 3 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-40", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-41", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-65", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-41", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-46", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-53", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-48", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-49", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-53", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-36", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-64", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-39", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-64", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-45", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-64", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 644.0, 55.0, 27.0, 20.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 12.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p z"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"contdata" : 1,
					"id" : "obj-24",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 644.0, 105.0, 186.0, 78.0 ],
					"setminmax" : [ 0.0, 1.0 ],
					"size" : 20
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 1,
					"id" : "obj-69",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 0,
							"revision" : 8
						}
,
						"rect" : [ 410.0, 100.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
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
						"boxes" : [ 							{
								"box" : 								{
									"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
									"contdata" : 1,
									"id" : "obj-53",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 53.0, 343.0, 186.0, 78.0 ],
									"setminmax" : [ 0.0, 1.0 ],
									"size" : 20
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-34",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 185.0, 273.0, 132.0, 18.0 ],
									"text" : "mode-funtionnality 200"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-35",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 318.0, 136.0, 18.0 ],
									"text" : "mode-funtionnality -200"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-36",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 95.0, 108.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-37",
									"int" : 1,
									"maxclass" : "gswitch2",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 185.0, 198.0, 39.0, 32.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-38",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 275.0, 183.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-39",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 3,
									"outlettype" : [ "bang", "bang", "int" ],
									"patching_rect" : [ 80.0, 153.0, 49.0, 20.0 ],
									"text" : "uzi 200"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-40",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 155.0, 183.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-41",
									"maxclass" : "newobj",
									"numinlets" : 5,
									"numoutlets" : 4,
									"outlettype" : [ "int", "", "", "int" ],
									"patching_rect" : [ 155.0, 153.0, 94.0, 20.0 ],
									"text" : "counter 0 0 158"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-43",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "list" ],
									"patching_rect" : [ 216.0, 431.0, 123.0, 19.0 ],
									"saved_object_attributes" : 									{
										"size" : 60
									}
,
									"text" : "dag.smooth @size 60"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-45",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 159.0, 100.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-46",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 159.0, 125.0, 50.0, 19.0 ],
									"text" : "metro 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-47",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 320.0, 288.0, 32.5, 18.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-48",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 125.0, 318.0, 74.0, 19.0 ],
									"text" : "zl stream 20"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-49",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 125.0, 273.0, 32.5, 17.0 ],
									"text" : "1"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-64",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 106.333344, 40.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-65",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 125.0, 473.0, 25.0, 25.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-34", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-39", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-36", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-34", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-37", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-37", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-37", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-37", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-38", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-40", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-41", 3 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-40", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-41", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-65", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-41", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-46", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-53", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-48", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-49", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-53", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-36", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-64", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-39", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-64", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-45", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-64", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 674.0, 55.0, 27.0, 20.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 12.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p z"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 1,
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 0,
							"revision" : 8
						}
,
						"rect" : [ 54.0, 92.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
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
						"boxes" : [ 							{
								"box" : 								{
									"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
									"contdata" : 1,
									"id" : "obj-53",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 50.0, 318.0, 186.0, 78.0 ],
									"setminmax" : [ 0.0, 1.0 ],
									"size" : 200
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-34",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 185.0, 273.0, 132.0, 18.0 ],
									"text" : "mode-funtionnality 150"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-35",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 318.0, 129.0, 18.0 ],
									"text" : "mode-funtionnality -20"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-36",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 95.0, 108.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-37",
									"maxclass" : "gswitch2",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 185.0, 198.0, 39.0, 32.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-38",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 275.0, 183.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-39",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 3,
									"outlettype" : [ "bang", "bang", "int" ],
									"patching_rect" : [ 80.0, 153.0, 49.0, 20.0 ],
									"text" : "uzi 200"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-40",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 155.0, 183.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-41",
									"maxclass" : "newobj",
									"numinlets" : 5,
									"numoutlets" : 4,
									"outlettype" : [ "int", "", "", "int" ],
									"patching_rect" : [ 155.0, 153.0, 94.0, 20.0 ],
									"text" : "counter 0 0 200"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-43",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "list" ],
									"patching_rect" : [ 125.0, 403.0, 129.0, 19.0 ],
									"saved_object_attributes" : 									{
										"size" : 200
									}
,
									"text" : "dag.smooth @size 200"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-45",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 159.0, 100.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-46",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 159.0, 125.0, 50.0, 19.0 ],
									"text" : "metro 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-47",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 320.0, 288.0, 32.5, 18.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-48",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 125.0, 318.0, 80.0, 19.0 ],
									"text" : "zl stream 200"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-49",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 125.0, 273.0, 32.5, 17.0 ],
									"text" : "1"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-64",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 106.333344, 40.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-65",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 125.0, 473.0, 25.0, 25.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-34", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-39", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-36", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-34", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-37", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-37", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-37", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-37", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-38", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-40", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-41", 3 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-40", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-41", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-65", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-41", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-46", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-53", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-48", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-49", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-53", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-36", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-64", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-39", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-64", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-45", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-64", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 734.0, 55.0, 27.0, 20.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 12.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p z"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"contdata" : 1,
					"id" : "obj-42",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 644.0, 105.0, 186.0, 78.0 ],
					"setminmax" : [ 0.0, 1.0 ],
					"size" : 200
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"hidden" : 1,
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 704.0, 4.0, 70.0, 19.0 ],
					"text" : "loadmess 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"hidden" : 1,
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 51.0, 457.0, 39.0, 19.0 ],
					"text" : "r set1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"hidden" : 1,
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 0,
							"revision" : 8
						}
,
						"rect" : [ 29.0, 67.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
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
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-12",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "bang" ],
									"patching_rect" : [ 298.0, 134.0, 54.0, 20.0 ],
									"text" : "togedge"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-13",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 175.0, 128.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 234.0, 112.0, 35.0, 20.0 ],
									"text" : "<= 3"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-3",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 144.0, 187.0, 148.0, 18.0 ],
									"text" : "set You're far away man..."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-2",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 311.0, 186.0, 56.0, 18.0 ],
									"text" : "set oops"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 235.0, 260.0, 41.0, 19.0 ],
									"text" : "s set1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-30",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 67.0, 136.0, 34.0, 19.0 ],
									"text" : "+~ 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-28",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 57.0, 160.0, 38.0, 19.0 ],
									"text" : "*~ 20"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-24",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 53.0, 264.0, 58.0, 19.0 ],
									"text" : "s smooth"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-22",
									"maxclass" : "number~",
									"mode" : 2,
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "signal", "float" ],
									"patching_rect" : [ 53.0, 183.0, 56.0, 19.0 ],
									"sig" : 0.0
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-23",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 73.0, 100.0, 69.0, 19.0 ],
									"text" : "cycle~ 0.03"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-19",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "int", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 50.0, 202.0, 43.0, 19.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-20",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 228.0, 47.0, 17.0 ],
									"text" : "size $1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-12", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-20", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-20", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-22", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-23", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-22", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-30", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 13.0, 325.0, 42.0, 19.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 12.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p seto"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"hidden" : 1,
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 76.0, 222.0, 56.0, 19.0 ],
					"text" : "r smooth"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"hidden" : 1,
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 0,
							"revision" : 8
						}
,
						"rect" : [ 49.0, 119.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
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
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-12",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "bang" ],
									"patching_rect" : [ 51.0, 114.0, 54.0, 20.0 ],
									"text" : "togedge"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-13",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 46.0, 86.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 104.0, 69.0, 41.0, 20.0 ],
									"text" : "<= 30"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "bang" ],
									"patching_rect" : [ 176.0, 107.0, 54.0, 20.0 ],
									"text" : "togedge"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 170.0, 79.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 168.0, 54.0, 34.0, 20.0 ],
									"text" : "> 30"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-4",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 78.0, 28.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-3",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 15.0, 144.0, 79.0, 18.0 ],
									"text" : "set too fast!!!"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-2",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 182.0, 145.0, 92.0, 18.0 ],
									"text" : "set Yeah cool..."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 106.0, 218.0, 41.0, 19.0 ],
									"text" : "s set3"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-8", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 839.0, 331.0, 42.0, 19.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 12.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p seto"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"hidden" : 1,
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 525.0, 457.0, 39.0, 19.0 ],
					"text" : "r set3"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"hidden" : 1,
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 0,
							"revision" : 8
						}
,
						"rect" : [ 49.0, 119.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
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
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 76.0, 59.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 175.0, 108.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 93.0, 81.0, 69.0, 20.0 ],
									"text" : "delay 1000"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-4",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 78.0, 28.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-3",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 15.0, 144.0, 132.0, 18.0 ],
									"text" : "set damned... you can!"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-2",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 182.0, 144.0, 143.0, 18.0 ],
									"text" : "set catch me if you can..."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 106.0, 218.0, 41.0, 19.0 ],
									"text" : "s set2"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 143.0, 209.0, 42.0, 19.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 12.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p seto"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"hidden" : 1,
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 375.0, 287.0, 39.0, 19.0 ],
					"text" : "r set2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"hidden" : 1,
					"id" : "obj-123",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 555.0, 90.0, 70.0, 19.0 ],
					"text" : "loadmess 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"hidden" : 1,
					"id" : "obj-122",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 240.0, 75.0, 70.0, 19.0 ],
					"text" : "loadmess 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"frgb" : 0.0,
					"id" : "obj-121",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 781.0, 248.0, 96.0, 19.0 ],
					"text" : "Change the size "
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"frgb" : 0.0,
					"id" : "obj-119",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 354.5, 333.0, 124.0, 19.0 ],
					"text" : "catch me if you can..."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"hidden" : 1,
					"id" : "obj-116",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 309.5, 330.0, 32.0, 19.0 ],
					"text" : "r lcd"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-115",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 390.0, 225.0, 50.0, 19.0 ],
					"tricolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-113",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 315.0, 285.0, 50.0, 19.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-112",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 315.0, 255.0, 129.0, 19.0 ],
					"saved_object_attributes" : 					{
						"size" : 150
					}
,
					"text" : "dag.smooth @size 150"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-111",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 0,
							"revision" : 8
						}
,
						"rect" : [ 29.0, 67.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
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
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 130.0, 297.0, 39.0, 20.0 ],
									"text" : "s line"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 272.0, 323.0, 35.0, 20.0 ],
									"text" : "s lcd"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 147.0, 79.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-98",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 157.0, 197.5, 33.0, 19.0 ],
									"text" : "+ 20"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-94",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 192.0, 195.5, 33.0, 19.0 ],
									"text" : "+ 20"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-93",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 123.0, 225.5, 87.0, 19.0 ],
									"text" : "pack 0. 0. 0. 0."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-88",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 173.0, 265.833313, 144.0, 17.0 ],
									"text" : "paintoval $1 $2 $3 $4 250"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-12",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "int", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 50.0, 197.5, 50.0, 19.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-105",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 52.0, 40.0, 25.0, 25.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-93", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-94", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-105", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-93", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-98", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-88", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-93", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-88", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-93", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-93", 3 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-94", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-93", 2 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-98", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 240.0, 315.0, 45.0, 19.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 12.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p paint"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-110",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 240.0, 165.0, 50.0, 19.0 ],
					"tricolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-108",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 0,
							"revision" : 8
						}
,
						"rect" : [ 165.0, 77.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
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
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-30",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 205.0, 111.0, 38.0, 20.0 ],
									"text" : "- 108"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-29",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 22.0, 133.0, 38.0, 20.0 ],
									"text" : "- 108"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-28",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 227.0, 163.0, 62.0, 20.0 ],
									"text" : "clip 0 108"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-27",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 21.0, 155.0, 62.0, 20.0 ],
									"text" : "clip 0 108"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-26",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 166.0, 99.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-24",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 257.0, 60.0, 58.0, 20.0 ],
									"text" : "metro 10"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-22",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 179.0, 303.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-17",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "float" ],
									"patching_rect" : [ 460.0, 186.0, 76.0, 20.0 ],
									"text" : "unpack 0. 0."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-16",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 452.0, 151.0, 37.0, 20.0 ],
									"text" : "r line"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-15",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 384.0, 294.5, 81.0, 19.0 ],
									"text" : "pak 0. 0. 0. 0."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 530.0, 240.5, 33.0, 19.0 ],
									"text" : "+ 10"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 485.0, 244.5, 33.0, 19.0 ],
									"text" : "+ 10"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 451.0, 244.5, 33.0, 19.0 ],
									"text" : "+ 10"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 404.0, 244.5, 33.0, 19.0 ],
									"text" : "+ 10"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-19",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 176.0, 356.0, 160.0, 17.0 ],
									"text" : "linesegment $1 $2 $3 $4 250"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-13",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 42.0, 181.0, 47.0, 18.0 ],
									"text" : "$1 300"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-14",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 32.0, 208.0, 46.0, 20.0 ],
									"text" : "line"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-11",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 252.0, 109.0, 47.0, 18.0 ],
									"text" : "$1 300"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 241.0, 136.0, 46.0, 20.0 ],
									"text" : "line"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-8",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 288.0, 397.0, 35.0, 20.0 ],
									"text" : "s lcd"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-7",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 125.0, 339.833313, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 147.0, 42.5, 63.0, 19.0 ],
									"text" : "metro 500"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 146.0, 70.5, 72.0, 19.0 ],
									"text" : "random 324"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-6",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "int", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 137.0, 160.5, 50.0, 19.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-98",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 157.0, 197.5, 33.0, 19.0 ],
									"text" : "+ 20"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-97",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 383.0, 106.5, 36.0, 17.0 ],
									"text" : "clear"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-94",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 200.0, 203.5, 33.0, 19.0 ],
									"text" : "+ 20"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-93",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 123.0, 225.5, 87.0, 19.0 ],
									"text" : "pack 0. 0. 0. 0."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-88",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 174.0, 265.833313, 150.0, 17.0 ],
									"text" : "paintoval $1 $2 $3 $4 0 0 0"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-82",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 31.0, 82.5, 63.0, 19.0 ],
									"text" : "metro 500"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-80",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 30.0, 110.5, 72.0, 19.0 ],
									"text" : "random 324"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-12",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "int", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 20.0, 234.5, 50.0, 19.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-105",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 36.0, 17.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-106",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 343.833313, 25.0, 25.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 3 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-105", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-105", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-82", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-105", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-106", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-93", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-98", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-17", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-17", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-22", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-26", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-26", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-27", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-29", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 2 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-93", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-94", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-29", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-80", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-80", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-82", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-88", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-9", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-88", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-93", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-97", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-93", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-93", 3 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-94", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-97", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-93", 2 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-98", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 240.0, 135.0, 45.0, 19.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 12.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p paint"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"frgb" : 0.0,
					"id" : "obj-87",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 143.0, 124.0, 48.0, 45.0 ],
					"text" : "clear last result"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-84",
					"maxclass" : "lcd",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "list", "list", "int", "" ],
					"patching_rect" : [ 309.5, 360.0, 128.0, 128.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-81",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 240.0, 105.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"frgb" : 0.0,
					"id" : "obj-79",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 127.0, 459.0, 77.0, 32.0 ],
					"text" : "You're far away man..."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"hidden" : 1,
					"id" : "obj-76",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 12.0, 104.0, 70.0, 19.0 ],
					"text" : "loadmess 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-75",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 12.0, 134.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-73",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 12.0, 164.0, 36.0, 19.0 ],
					"text" : "dac~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"frgb" : 0.0,
					"id" : "obj-72",
					"linecount" : 5,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 473.0, 209.0, 42.0, 71.0 ],
					"text" : "bang to report last value"
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
					"patching_rect" : [ 578.0, 455.0, 157.0, 19.0 ],
					"text" : "too fast!!!"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-66",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 136.0, 310.0, 20.0, 140.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-65",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 166.0, 310.0, 20.0, 140.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-58",
					"maxclass" : "number~",
					"mode" : 2,
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "float" ],
					"patching_rect" : [ 13.0, 224.0, 56.0, 19.0 ],
					"sig" : 0.0
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-57",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 13.0, 194.0, 69.0, 19.0 ],
					"text" : "cycle~ 0.05"
				}

			}
, 			{
				"box" : 				{
					"contdata" : 1,
					"id" : "obj-54",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 555.0, 373.0, 186.0, 78.0 ],
					"setminmax" : [ 0.0, 1.0 ],
					"size" : 64
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-50",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 555.0, 120.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-51",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 555.0, 170.0, 32.0, 17.0 ],
					"text" : "next"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-52",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 555.0, 145.0, 63.0, 19.0 ],
					"text" : "metro 100"
				}

			}
, 			{
				"box" : 				{
					"coll_data" : 					{
						"count" : 131,
						"data" : [ 							{
								"key" : 0,
								"value" : [ 0.431068, 0.366383, 0.251799, 0.182331, 0.081453, 0.163217, 0.084562, 0.105573, 0.128753, 0.074793, 0.048481, 0.077124, 0.084423, 0.057842, 0.095317, 0.081553, 0.097946, 0.10101, 0.065065, 0.035387, 0.064463, 0.024922, 0.029048, 0.050792, 0.070506, 0.078494, 0.076608, 0.069074, 0.092202, 0.086685, 0.018018, 0.048068, 0.085552, 0.080095, 0.060178, 0.08951, 0.069101, 0.084794, 0.056088, 0.068763, 0.076829, 0.0316, 0.053449, 0.043415, 0.040339, 0.042416, 0.064145, 0.050212, 0.048788, 0.05637, 0.033353, 0.049226, 0.051195, 0.059268, 0.030275, 0.015557, 0.019082, 0.039206, 0.023898, 0.040906, 0.028428, 0.031196, 0.004999, 0.070836 ]
							}
, 							{
								"key" : 1,
								"value" : [ 0.405671, 0.355651, 0.259757, 0.209031, 0.164345, 0.128083, 0.168575, 0.166351, 0.16289, 0.175636, 0.126589, 0.049972, 0.088437, 0.136062, 0.138528, 0.095824, 0.136426, 0.154043, 0.064937, 0.085308, 0.085762, 0.068926, 0.131992, 0.099051, 0.115649, 0.106896, 0.09499, 0.123864, 0.058171, 0.140355, 0.119712, 0.0697, 0.098437, 0.078809, 0.061937, 0.116043, 0.092159, 0.109409, 0.019266, 0.043404, 0.08257, 0.102271, 0.078865, 0.087379, 0.067751, 0.043815, 0.082357, 0.008712, 0.080699, 0.086514, 0.078725, 0.096058, 0.091129, 0.107556, 0.107642, 0.050675, 0.09674, 0.095388, 0.022504, 0.076415, 0.080698, 0.064838, 0.071075, 0.080359 ]
							}
, 							{
								"key" : 2,
								"value" : [ 0.474937, 0.405869, 0.281352, 0.241456, 0.246921, 0.133998, 0.125149, 0.136423, 0.175062, 0.11428, 0.143714, 0.147922, 0.074223, 0.126496, 0.164209, 0.178826, 0.155071, 0.091061, 0.120454, 0.112292, 0.087675, 0.090407, 0.124007, 0.157281, 0.156679, 0.11043, 0.136975, 0.157607, 0.139126, 0.066085, 0.036283, 0.107306, 0.108781, 0.107844, 0.113511, 0.038978, 0.118835, 0.049872, 0.08113, 0.071411, 0.113489, 0.110898, 0.05297, 0.079499, 0.078318, 0.071259, 0.067561, 0.111659, 0.104125, 0.07585, 0.058043, 0.078328, 0.086493, 0.113284, 0.092145, 0.015005, 0.094031, 0.090025, 0.072718, 0.029399, 0.01038, 0.08361, 0.071727, 0.104651 ]
							}
, 							{
								"key" : 3,
								"value" : [ 0.47926, 0.405636, 0.311446, 0.208911, 0.215256, 0.18132, 0.15817, 0.158527, 0.162058, 0.110786, 0.061437, 0.161325, 0.183722, 0.150686, 0.12515, 0.068532, 0.064904, 0.076652, 0.135769, 0.072128, 0.110037, 0.074162, 0.140161, 0.11155, 0.143618, 0.134992, 0.062417, 0.132922, 0.141611, 0.119385, 0.107376, 0.054857, 0.122649, 0.098241, 0.109413, 0.079405, 0.103037, 0.10504, 0.110948, 0.096183, 0.09245, 0.056814, 0.065233, 0.120024, 0.026059, 0.056716, 0.022116, 0.104499, 0.074064, 0.089343, 0.013417, 0.069491, 0.084045, 0.0745, 0.092346, 0.071342, 0.035329, 0.071583, 0.110059, 0.122919, 0.077364, 0.093643, 0.071202, 0.066492 ]
							}
, 							{
								"key" : 4,
								"value" : [ 0.341516, 0.331475, 0.242399, 0.22819, 0.133455, 0.149006, 0.137169, 0.146595, 0.107539, 0.109805, 0.166676, 0.158312, 0.161577, 0.160245, 0.1072, 0.117102, 0.131118, 0.076689, 0.147584, 0.17369, 0.123347, 0.103152, 0.116711, 0.079218, 0.051822, 0.118418, 0.075169, 0.162076, 0.183985, 0.171666, 0.063685, 0.125134, 0.076405, 0.070225, 0.134809, 0.122129, 0.131481, 0.112666, 0.11115, 0.134165, 0.108486, 0.073481, 0.073448, 0.052434, 0.095581, 0.086819, 0.11388, 0.069701, 0.073961, 0.094282, 0.083645, 0.065078, 0.089502, 0.133115, 0.143958, 0.137967, 0.100367, 0.083603, 0.057029, 0.074149, 0.086641, 0.096292, 0.086424, 0.022036 ]
							}
, 							{
								"key" : 5,
								"value" : [ 0.467826, 0.39365, 0.295736, 0.20749, 0.202315, 0.179792, 0.211082, 0.12524, 0.168318, 0.113976, 0.154149, 0.114923, 0.17257, 0.140521, 0.124833, 0.045898, 0.094151, 0.045609, 0.154261, 0.153997, 0.137749, 0.098799, 0.11015, 0.08172, 0.086957, 0.175793, 0.167249, 0.145994, 0.094515, 0.169228, 0.160612, 0.106662, 0.076384, 0.053938, 0.131094, 0.143621, 0.076772, 0.085229, 0.10104, 0.128169, 0.099987, 0.069422, 0.106003, 0.100321, 0.106929, 0.131444, 0.110949, 0.089607, 0.028513, 0.045158, 0.075914, 0.096055, 0.124756, 0.130021, 0.128193, 0.131033, 0.132901, 0.093828, 0.087608, 0.08101, 0.084891, 0.11528, 0.099885, 0.052388 ]
							}
, 							{
								"key" : 6,
								"value" : [ 0.421971, 0.346813, 0.177303, 0.19965, 0.21122, 0.172706, 0.166817, 0.154053, 0.100561, 0.138031, 0.141891, 0.166294, 0.111816, 0.175351, 0.174962, 0.111487, 0.174754, 0.126345, 0.131475, 0.193198, 0.193137, 0.182531, 0.145371, 0.167452, 0.101104, 0.204262, 0.217465, 0.136555, 0.172135, 0.100841, 0.110392, 0.056417, 0.067309, 0.094084, 0.139902, 0.185484, 0.198899, 0.117766, 0.099507, 0.121299, 0.103471, 0.075099, 0.035317, 0.094384, 0.10704, 0.122296, 0.113958, 0.082037, 0.102423, 0.091552, 0.163422, 0.176754, 0.125126, 0.142872, 0.134077, 0.125606, 0.144398, 0.137432, 0.14194, 0.114585, 0.142127, 0.13722, 0.140207, 0.15385 ]
							}
, 							{
								"key" : 7,
								"value" : [ 0.375868, 0.369557, 0.224339, 0.199686, 0.248795, 0.194196, 0.157735, 0.138903, 0.159451, 0.184316, 0.1352, 0.137855, 0.186371, 0.16486, 0.043416, 0.201207, 0.174605, 0.074073, 0.076629, 0.182908, 0.199765, 0.157963, 0.186182, 0.175224, 0.163461, 0.134772, 0.155467, 0.233833, 0.232529, 0.186402, 0.135253, 0.175123, 0.139264, 0.080785, 0.125752, 0.200202, 0.211291, 0.190526, 0.13269, 0.174356, 0.151648, 0.126263, 0.076261, 0.122896, 0.145159, 0.09424, 0.080866, 0.119606, 0.133059, 0.198056, 0.212697, 0.138058, 0.123349, 0.101802, 0.029285, 0.171595, 0.150178, 0.095883, 0.135892, 0.144811, 0.10981, 0.136901, 0.145275, 0.091057 ]
							}
, 							{
								"key" : 8,
								"value" : [ 0.146878, 0.339895, 0.333963, 0.419033, 0.461934, 0.46151, 0.406119, 0.350967, 0.35054, 0.393006, 0.372429, 0.351355, 0.339408, 0.329266, 0.383391, 0.370703, 0.322368, 0.336149, 0.361135, 0.380293, 0.415822, 0.427464, 0.403436, 0.344228, 0.342844, 0.376137, 0.385939, 0.325631, 0.370443, 0.350495, 0.277341, 0.26869, 0.279617, 0.310145, 0.357196, 0.341587, 0.3314, 0.243791, 0.237847, 0.331812, 0.319963, 0.268943, 0.290908, 0.252508, 0.300858, 0.383979, 0.418738, 0.414619, 0.380199, 0.336851, 0.364044, 0.355628, 0.271329, 0.305812, 0.300853, 0.263036, 0.126197, 0.238827, 0.246897, 0.334441, 0.358167, 0.36143, 0.346069, 0.322831 ]
							}
, 							{
								"key" : 9,
								"value" : [ 0.478425, 0.408449, 0.276868, 0.111326, 0.314108, 0.330926, 0.206631, 0.370666, 0.245153, 0.293421, 0.268022, 0.227192, 0.237128, 0.265825, 0.247455, 0.280359, 0.178445, 0.241906, 0.28954, 0.289211, 0.331662, 0.341831, 0.310473, 0.338493, 0.358175, 0.299728, 0.330646, 0.330683, 0.344309, 0.332739, 0.185213, 0.259445, 0.227523, 0.195524, 0.18654, 0.166147, 0.278771, 0.262875, 0.266865, 0.26507, 0.247867, 0.220442, 0.299191, 0.303922, 0.194523, 0.176909, 0.316401, 0.292087, 0.252668, 0.196457, 0.264584, 0.244446, 0.270069, 0.275086, 0.314389, 0.25211, 0.253845, 0.177479, 0.274646, 0.299667, 0.321712, 0.203727, 0.284782, 0.323954 ]
							}
, 							{
								"key" : 10,
								"value" : [ 0.464327, 0.385422, 0.310754, 0.346946, 0.394184, 0.372403, 0.314862, 0.33437, 0.31629, 0.26786, 0.182874, 0.22388, 0.321274, 0.324815, 0.254808, 0.2721, 0.224984, 0.282456, 0.25082, 0.243151, 0.303865, 0.322771, 0.252414, 0.329349, 0.337148, 0.349243, 0.373467, 0.352356, 0.331893, 0.346972, 0.328219, 0.272649, 0.253506, 0.140281, 0.235437, 0.200919, 0.266264, 0.269977, 0.324269, 0.326544, 0.33733, 0.27597, 0.250892, 0.29138, 0.229804, 0.190708, 0.213086, 0.219437, 0.103628, 0.090486, 0.231418, 0.245561, 0.250676, 0.26517, 0.281279, 0.258371, 0.268097, 0.206276, 0.253161, 0.225633, 0.286799, 0.221151, 0.270126, 0.31335 ]
							}
, 							{
								"key" : 11,
								"value" : [ 0.396188, 0.346291, 0.261425, 0.271931, 0.308071, 0.274928, 0.202341, 0.32285, 0.361816, 0.310742, 0.303859, 0.267444, 0.239506, 0.263392, 0.325817, 0.309624, 0.311419, 0.302161, 0.299976, 0.326124, 0.311049, 0.330794, 0.362016, 0.396302, 0.287024, 0.3382, 0.33625, 0.277278, 0.265648, 0.18361, 0.104812, 0.209856, 0.158345, 0.2793, 0.315344, 0.293255, 0.166968, 0.292951, 0.240382, 0.158993, 0.194789, 0.270624, 0.291731, 0.176651, 0.246059, 0.256976, 0.258914, 0.255646, 0.247919, 0.137602, 0.131646, 0.168665, 0.218831, 0.228327, 0.280183, 0.275327, 0.210219, 0.219814, 0.274142, 0.300197, 0.216135, 0.259069, 0.216257, 0.24562 ]
							}
, 							{
								"key" : 12,
								"value" : [ 0.481957, 0.408747, 0.313217, 0.253016, 0.269479, 0.286393, 0.238196, 0.271902, 0.331022, 0.278331, 0.313704, 0.346653, 0.335783, 0.348733, 0.338874, 0.194114, 0.291784, 0.278268, 0.295832, 0.298483, 0.328146, 0.360144, 0.36004, 0.352701, 0.227786, 0.307637, 0.291376, 0.340139, 0.336651, 0.294663, 0.248401, 0.307228, 0.254614, 0.192331, 0.235158, 0.31563, 0.33311, 0.304727, 0.379512, 0.353955, 0.329094, 0.22394, 0.237843, 0.322892, 0.274093, 0.290328, 0.248462, 0.280539, 0.148228, 0.219292, 0.219726, 0.230357, 0.04411, 0.195997, 0.256009, 0.246389, 0.262918, 0.247495, 0.26863, 0.256523, 0.283559, 0.251082, 0.331601, 0.243996 ]
							}
, 							{
								"key" : 13,
								"value" : [ 0.446406, 0.360438, 0.240087, 0.222149, 0.324241, 0.219901, 0.271495, 0.302885, 0.251604, 0.154225, 0.301029, 0.332642, 0.285278, 0.275636, 0.248398, 0.175913, 0.230748, 0.307022, 0.285713, 0.324863, 0.223467, 0.226411, 0.174944, 0.181501, 0.225705, 0.324362, 0.299961, 0.307276, 0.292358, 0.290131, 0.204199, 0.149889, 0.247177, 0.233563, 0.277143, 0.270431, 0.303624, 0.317917, 0.257864, 0.31713, 0.273273, 0.323543, 0.264579, 0.211262, 0.176951, 0.213232, 0.209338, 0.25809, 0.267778, 0.223256, 0.21983, 0.199944, 0.229729, 0.251284, 0.191238, 0.174198, 0.2207, 0.199183, 0.289497, 0.215477, 0.306721, 0.318471, 0.218948, 0.295059 ]
							}
, 							{
								"key" : 14,
								"value" : [ 0.214413, 0.327388, 0.12712, 0.248798, 0.304169, 0.288006, 0.223403, 0.230879, 0.20898, 0.209538, 0.283021, 0.296597, 0.274882, 0.250949, 0.270717, 0.127604, 0.250356, 0.285753, 0.198849, 0.246297, 0.3089, 0.308488, 0.204821, 0.239078, 0.318795, 0.307984, 0.222837, 0.272655, 0.255416, 0.102916, 0.228535, 0.255216, 0.154161, 0.178802, 0.236529, 0.290145, 0.242825, 0.31529, 0.314707, 0.20937, 0.296948, 0.287274, 0.235433, 0.231652, 0.251942, 0.174814, 0.274538, 0.261145, 0.21501, 0.227212, 0.20626, 0.195998, 0.204688, 0.254424, 0.210744, 0.156009, 0.236201, 0.2232, 0.201421, 0.264528, 0.214172, 0.189076, 0.235573, 0.200064 ]
							}
, 							{
								"key" : 15,
								"value" : [ 0.420672, 0.360524, 0.243777, 0.191866, 0.338521, 0.294851, 0.236165, 0.157703, 0.21224, 0.224457, 0.225742, 0.237135, 0.225704, 0.276863, 0.292704, 0.27515, 0.249489, 0.238076, 0.198175, 0.32633, 0.363785, 0.308476, 0.293824, 0.242329, 0.216095, 0.102651, 0.257659, 0.259463, 0.160191, 0.203796, 0.178363, 0.190352, 0.214786, 0.122968, 0.244324, 0.16977, 0.225424, 0.249293, 0.278981, 0.308996, 0.29293, 0.226142, 0.235817, 0.232607, 0.157541, 0.196385, 0.176392, 0.200813, 0.181177, 0.202435, 0.177771, 0.149635, 0.20933, 0.228627, 0.244549, 0.243995, 0.150187, 0.210928, 0.238018, 0.239524, 0.230223, 0.263917, 0.184824, 0.252618 ]
							}
, 							{
								"key" : 16,
								"value" : [ 0.445497, 0.359806, 0.292953, 0.270933, 0.26307, 0.246594, 0.143534, 0.249715, 0.224497, 0.225882, 0.252357, 0.209822, 0.274106, 0.24432, 0.218138, 0.201593, 0.145832, 0.290469, 0.200635, 0.151972, 0.247083, 0.195173, 0.176155, 0.250312, 0.220715, 0.148457, 0.223702, 0.201395, 0.235181, 0.192927, 0.092764, 0.125027, 0.162609, 0.191601, 0.209779, 0.219673, 0.220609, 0.107074, 0.165289, 0.172174, 0.186756, 0.162842, 0.200414, 0.214491, 0.114384, 0.205888, 0.179007, 0.074371, 0.126633, 0.186167, 0.185808, 0.110698, 0.196715, 0.19694, 0.197945, 0.147028, 0.131825, 0.16541, 0.163473, 0.164171, 0.237116, 0.133153, 0.19418, 0.222727 ]
							}
, 							{
								"key" : 17,
								"value" : [ 0.442715, 0.392861, 0.193294, 0.227051, 0.187272, 0.121279, 0.136669, 0.137163, 0.203273, 0.214474, 0.167504, 0.231581, 0.266634, 0.181469, 0.167721, 0.206219, 0.244138, 0.227481, 0.274198, 0.268276, 0.238617, 0.246379, 0.133637, 0.123905, 0.171094, 0.156905, 0.135784, 0.160516, 0.156274, 0.187641, 0.134349, 0.086137, 0.115974, 0.123595, 0.136008, 0.099726, 0.145284, 0.151972, 0.173136, 0.195053, 0.135717, 0.092547, 0.111938, 0.103454, 0.097076, 0.089905, 0.13272, 0.116844, 0.124471, 0.129321, 0.075698, 0.065054, 0.13978, 0.128173, 0.121271, 0.104316, 0.074196, 0.123696, 0.175515, 0.182438, 0.13784, 0.147161, 0.122666, 0.129667 ]
							}
, 							{
								"key" : 18,
								"value" : [ 0.414688, 0.366053, 0.248036, 0.194124, 0.247092, 0.123968, 0.164139, 0.110024, 0.133882, 0.161805, 0.17865, 0.175085, 0.168722, 0.10644, 0.124458, 0.123396, 0.074501, 0.159465, 0.204169, 0.185088, 0.104294, 0.110967, 0.137492, 0.13951, 0.14159, 0.080182, 0.092505, 0.118759, 0.155945, 0.082221, 0.122107, 0.127597, 0.117827, 0.113148, 0.082413, 0.079546, 0.085684, 0.119838, 0.110083, 0.050264, 0.080981, 0.045177, 0.111885, 0.127514, 0.119746, 0.072688, 0.099091, 0.139082, 0.024275, 0.115246, 0.038645, 0.135615, 0.091953, 0.118306, 0.099409, 0.043802, 0.114488, 0.109044, 0.127815, 0.065906, 0.086363, 0.09772, 0.103964, 0.10077 ]
							}
, 							{
								"key" : 19,
								"value" : [ 0.470699, 0.402061, 0.268641, 0.253902, 0.231933, 0.180205, 0.148751, 0.14918, 0.085901, 0.175501, 0.143936, 0.232706, 0.239971, 0.204962, 0.228459, 0.204709, 0.18407, 0.175506, 0.183617, 0.156807, 0.139622, 0.131498, 0.076722, 0.109049, 0.082412, 0.096565, 0.038462, 0.184291, 0.195176, 0.183387, 0.141524, 0.154283, 0.14135, 0.118061, 0.048455, 0.104884, 0.073585, 0.112259, 0.16127, 0.1585, 0.063397, 0.133771, 0.129435, 0.050869, 0.129881, 0.106988, 0.078854, 0.067042, 0.066311, 0.130662, 0.147419, 0.122506, 0.1412, 0.155231, 0.187463, 0.162183, 0.186397, 0.166849, 0.164296, 0.164045, 0.151431, 0.141884, 0.15591, 0.152316 ]
							}
, 							{
								"key" : 20,
								"value" : [ 0.467302, 0.383687, 0.29651, 0.233891, 0.154342, 0.176111, 0.11895, 0.148143, 0.180584, 0.157955, 0.131068, 0.128469, 0.131953, 0.108967, 0.112351, 0.170065, 0.122327, 0.160248, 0.187537, 0.157546, 0.15978, 0.150986, 0.155636, 0.12737, 0.129108, 0.136758, 0.121157, 0.137507, 0.134359, 0.13696, 0.098001, 0.090676, 0.08989, 0.050333, 0.038661, 0.033585, 0.025785, 0.116733, 0.075288, 0.131743, 0.108732, 0.082036, 0.115894, 0.141975, 0.095118, 0.07141, 0.087659, 0.041036, 0.080333, 0.099159, 0.027569, 0.109742, 0.108733, 0.089581, 0.06898, 0.019384, 0.053887, 0.030353, 0.112331, 0.125597, 0.117633, 0.112847, 0.029487, 0.081951 ]
							}
, 							{
								"key" : 21,
								"value" : [ 0.423111, 0.358183, 0.185067, 0.245257, 0.052959, 0.207434, 0.217615, 0.207903, 0.123017, 0.090785, 0.158234, 0.091819, 0.061525, 0.094138, 0.136609, 0.184576, 0.101512, 0.15262, 0.121627, 0.151657, 0.132018, 0.098826, 0.131802, 0.155212, 0.143945, 0.07558, 0.094954, 0.129315, 0.094682, 0.053766, 0.119214, 0.145295, 0.110431, 0.116879, 0.134559, 0.090461, 0.132411, 0.12497, 0.089279, 0.06326, 0.105311, 0.113816, 0.088916, 0.082238, 0.089518, 0.0581, 0.078776, 0.06695, 0.110316, 0.076793, 0.094773, 0.072855, 0.107408, 0.100967, 0.06397, 0.101392, 0.034717, 0.058068, 0.117192, 0.097738, 0.102883, 0.083677, 0.120704, 0.108044 ]
							}
, 							{
								"key" : 22,
								"value" : [ 0.474159, 0.40451, 0.260477, 0.24408, 0.129466, 0.176826, 0.106217, 0.101674, 0.103592, 0.062289, 0.163568, 0.168726, 0.154241, 0.164709, 0.150984, 0.155587, 0.183796, 0.174976, 0.180167, 0.128768, 0.133069, 0.140404, 0.053083, 0.176402, 0.179826, 0.128094, 0.136961, 0.068268, 0.051987, 0.143634, 0.129752, 0.075658, 0.096678, 0.135146, 0.119242, 0.073705, 0.087251, 0.090381, 0.132165, 0.077479, 0.126217, 0.087616, 0.07947, 0.133831, 0.167948, 0.081352, 0.107848, 0.04747, 0.093298, 0.084164, 0.131611, 0.138999, 0.137961, 0.114479, 0.117558, 0.113841, 0.137055, 0.050199, 0.079319, 0.112637, 0.134876, 0.123862, 0.102558, 0.132579 ]
							}
, 							{
								"key" : 23,
								"value" : [ 0.444408, 0.39428, 0.353594, 0.367021, 0.391949, 0.399832, 0.450225, 0.454076, 0.461662, 0.494041, 0.553472, 0.591903, 0.597116, 0.546211, 0.511382, 0.522553, 0.569797, 0.607313, 0.622165, 0.610875, 0.571221, 0.520456, 0.520412, 0.524527, 0.510459, 0.494104, 0.478227, 0.480721, 0.506411, 0.527687, 0.547793, 0.550197, 0.524422, 0.474774, 0.451512, 0.433991, 0.414347, 0.407648, 0.436491, 0.426246, 0.438442, 0.464043, 0.4698, 0.460952, 0.434091, 0.437299, 0.467254, 0.471328, 0.449865, 0.408672, 0.368601, 0.371326, 0.436084, 0.441271, 0.41502, 0.376302, 0.307674, 0.319314, 0.38954, 0.367445, 0.417367, 0.39529, 0.389008, 0.396139 ]
							}
, 							{
								"key" : 24,
								"value" : [ 0.452025, 0.401887, 0.655734, 0.623659, 0.594982, 0.599678, 0.478084, 0.564589, 0.520952, 0.589887, 0.589507, 0.607423, 0.578046, 0.551845, 0.533675, 0.514632, 0.534191, 0.482715, 0.575286, 0.443893, 0.447299, 0.515819, 0.491997, 0.408393, 0.465007, 0.478788, 0.502545, 0.482042, 0.403073, 0.461951, 0.431267, 0.473933, 0.474452, 0.479254, 0.384496, 0.27531, 0.383085, 0.341713, 0.375241, 0.455633, 0.437352, 0.449183, 0.430737, 0.377513, 0.423381, 0.442915, 0.31259, 0.449674, 0.396533, 0.390308, 0.360813, 0.356596, 0.422794, 0.377553, 0.341549, 0.339657, 0.330649, 0.370039, 0.335111, 0.402077, 0.39889, 0.42115, 0.337914, 0.370466 ]
							}
, 							{
								"key" : 25,
								"value" : [ 0.390467, 0.521843, 0.661155, 0.614985, 0.59165, 0.581333, 0.478712, 0.40135, 0.580206, 0.626808, 0.582627, 0.484358, 0.46175, 0.518657, 0.485838, 0.383157, 0.429721, 0.592817, 0.614135, 0.576833, 0.616447, 0.4863, 0.571805, 0.450957, 0.498294, 0.417544, 0.350628, 0.462096, 0.44524, 0.4478, 0.447754, 0.493692, 0.481184, 0.456705, 0.404252, 0.373404, 0.33983, 0.352568, 0.372696, 0.401573, 0.409366, 0.381505, 0.422537, 0.455839, 0.429626, 0.427274, 0.431777, 0.426976, 0.409446, 0.349455, 0.390463, 0.420904, 0.424069, 0.343176, 0.338822, 0.447247, 0.36554, 0.304719, 0.348596, 0.365138, 0.372233, 0.314229, 0.389064, 0.439793 ]
							}
, 							{
								"key" : 26,
								"value" : [ 0.534462, 0.542108, 0.660038, 0.608407, 0.606161, 0.571974, 0.366961, 0.477483, 0.601632, 0.616061, 0.50175, 0.542688, 0.569313, 0.531286, 0.481826, 0.547651, 0.481557, 0.558033, 0.555267, 0.531046, 0.564343, 0.542236, 0.545505, 0.475415, 0.516966, 0.387901, 0.397311, 0.486992, 0.490085, 0.459841, 0.36621, 0.490895, 0.479621, 0.510396, 0.4584, 0.424988, 0.255574, 0.309736, 0.368557, 0.358739, 0.414347, 0.40575, 0.400191, 0.432766, 0.422427, 0.325386, 0.438402, 0.444731, 0.432645, 0.435546, 0.448932, 0.431049, 0.401164, 0.412465, 0.368582, 0.409629, 0.389074, 0.402047, 0.341756, 0.436856, 0.448523, 0.455645, 0.3479, 0.452771 ]
							}
, 							{
								"key" : 27,
								"value" : [ 0.409011, 0.550206, 0.657748, 0.612226, 0.610836, 0.58699, 0.419731, 0.483727, 0.636105, 0.65427, 0.546147, 0.425183, 0.52225, 0.572726, 0.486669, 0.538036, 0.480149, 0.565411, 0.570977, 0.58454, 0.562714, 0.565013, 0.448265, 0.470626, 0.513067, 0.477182, 0.486256, 0.38559, 0.448607, 0.480303, 0.522867, 0.446667, 0.376221, 0.433489, 0.449412, 0.443123, 0.42039, 0.398027, 0.319815, 0.347488, 0.418614, 0.414381, 0.382445, 0.414048, 0.357853, 0.37711, 0.425648, 0.357479, 0.408025, 0.366212, 0.414408, 0.426383, 0.415495, 0.454419, 0.415841, 0.411677, 0.354243, 0.397601, 0.378582, 0.364319, 0.393263, 0.378329, 0.292773, 0.446477 ]
							}
, 							{
								"key" : 28,
								"value" : [ 0.513595, 0.540656, 0.65812, 0.611685, 0.616894, 0.587735, 0.534279, 0.497011, 0.629636, 0.6362, 0.513266, 0.508464, 0.538484, 0.560362, 0.443371, 0.524488, 0.488855, 0.559661, 0.503716, 0.554411, 0.550305, 0.557554, 0.510078, 0.423377, 0.431848, 0.476834, 0.501689, 0.488711, 0.515248, 0.441793, 0.381004, 0.3945, 0.529647, 0.477103, 0.461974, 0.389392, 0.398231, 0.386062, 0.382028, 0.394474, 0.385804, 0.330213, 0.365166, 0.359458, 0.404455, 0.388464, 0.289779, 0.398428, 0.435136, 0.298002, 0.39308, 0.355568, 0.322702, 0.352207, 0.426869, 0.328182, 0.413777, 0.424309, 0.395376, 0.405081, 0.421471, 0.456598, 0.414201, 0.461613 ]
							}
, 							{
								"key" : 29,
								"value" : [ 0.530374, 0.538869, 0.659372, 0.598653, 0.63009, 0.584713, 0.55392, 0.551963, 0.638412, 0.652183, 0.542717, 0.539978, 0.51297, 0.509074, 0.435858, 0.492051, 0.40274, 0.55406, 0.499417, 0.522896, 0.496325, 0.552704, 0.552008, 0.499858, 0.398158, 0.373093, 0.47511, 0.411663, 0.494187, 0.442126, 0.510213, 0.455001, 0.56309, 0.553009, 0.438112, 0.432594, 0.381305, 0.371463, 0.370657, 0.394534, 0.421059, 0.439967, 0.403262, 0.387317, 0.245843, 0.318783, 0.341388, 0.399351, 0.274257, 0.269224, 0.477481, 0.456068, 0.387883, 0.420755, 0.312004, 0.411804, 0.343008, 0.352391, 0.444619, 0.355592, 0.382654, 0.368158, 0.416547, 0.400888 ]
							}
, 							{
								"key" : 30,
								"value" : [ 0.499103, 0.538948, 0.662769, 0.606362, 0.618552, 0.591491, 0.541695, 0.541451, 0.64412, 0.658702, 0.462142, 0.520049, 0.485852, 0.528835, 0.474303, 0.449034, 0.451964, 0.520818, 0.512898, 0.492534, 0.525649, 0.421785, 0.54837, 0.545897, 0.474027, 0.353944, 0.502495, 0.456976, 0.437412, 0.477501, 0.449518, 0.458134, 0.501214, 0.500104, 0.462019, 0.415315, 0.335904, 0.293222, 0.421971, 0.437414, 0.375088, 0.412749, 0.399268, 0.357803, 0.353754, 0.371705, 0.408323, 0.36088, 0.403115, 0.401866, 0.478264, 0.460943, 0.450027, 0.397242, 0.425015, 0.3921, 0.427096, 0.424288, 0.39011, 0.443779, 0.386153, 0.422501, 0.407688, 0.362669 ]
							}
, 							{
								"key" : 31,
								"value" : [ 0.497913, 0.556985, 0.663848, 0.622256, 0.607218, 0.600823, 0.567108, 0.551387, 0.622015, 0.642547, 0.418396, 0.533776, 0.453317, 0.502644, 0.417598, 0.465396, 0.339105, 0.532242, 0.503575, 0.467624, 0.518491, 0.490648, 0.519384, 0.455887, 0.525441, 0.486864, 0.527207, 0.425954, 0.518866, 0.509077, 0.519673, 0.54414, 0.481746, 0.461057, 0.447842, 0.468614, 0.363975, 0.371527, 0.279524, 0.400986, 0.393859, 0.401344, 0.349378, 0.325788, 0.36608, 0.311951, 0.385683, 0.416478, 0.435155, 0.472565, 0.511644, 0.468956, 0.432035, 0.421895, 0.408339, 0.380937, 0.288968, 0.342089, 0.292932, 0.337705, 0.399636, 0.44716, 0.469049, 0.458459 ]
							}
, 							{
								"key" : 32,
								"value" : [ 0.519586, 0.545429, 0.667661, 0.613944, 0.622844, 0.585295, 0.593002, 0.584019, 0.612205, 0.628425, 0.496604, 0.514596, 0.353756, 0.495343, 0.334614, 0.461484, 0.430934, 0.490195, 0.433425, 0.530472, 0.476479, 0.500129, 0.429719, 0.358885, 0.512205, 0.471786, 0.514069, 0.468972, 0.559729, 0.521047, 0.540745, 0.493081, 0.521754, 0.308116, 0.461489, 0.334424, 0.456302, 0.461199, 0.435466, 0.443824, 0.385964, 0.372407, 0.302086, 0.367373, 0.384961, 0.380876, 0.293671, 0.419042, 0.409653, 0.46043, 0.400551, 0.449539, 0.463842, 0.415473, 0.420892, 0.357748, 0.394233, 0.41756, 0.409123, 0.459981, 0.365119, 0.395388, 0.446613, 0.476756 ]
							}
, 							{
								"key" : 33,
								"value" : [ 0.484291, 0.541788, 0.673416, 0.619517, 0.616628, 0.586173, 0.580891, 0.59426, 0.567378, 0.600567, 0.372971, 0.478604, 0.479175, 0.467804, 0.409108, 0.398095, 0.382756, 0.473639, 0.465116, 0.458818, 0.474314, 0.391953, 0.410536, 0.461422, 0.503623, 0.438051, 0.510579, 0.396478, 0.517404, 0.487664, 0.498926, 0.519237, 0.443841, 0.485379, 0.49133, 0.372478, 0.421536, 0.366359, 0.337617, 0.349082, 0.36994, 0.28346, 0.403773, 0.401937, 0.215322, 0.326209, 0.357279, 0.330074, 0.372907, 0.342404, 0.452645, 0.428814, 0.428242, 0.40799, 0.406101, 0.330306, 0.419292, 0.410557, 0.396055, 0.425234, 0.37665, 0.410457, 0.397097, 0.438865 ]
							}
, 							{
								"key" : 34,
								"value" : [ 0.458667, 0.565939, 0.675663, 0.635107, 0.588474, 0.591517, 0.596663, 0.599054, 0.571746, 0.594461, 0.477963, 0.462647, 0.443443, 0.360139, 0.385243, 0.383568, 0.368611, 0.417866, 0.456631, 0.411367, 0.434885, 0.353412, 0.286793, 0.439999, 0.455641, 0.38968, 0.509822, 0.468234, 0.505562, 0.541608, 0.510943, 0.424968, 0.490479, 0.483671, 0.400804, 0.499511, 0.348876, 0.419513, 0.404097, 0.370453, 0.334382, 0.373828, 0.377612, 0.302557, 0.270782, 0.389718, 0.363842, 0.342057, 0.445235, 0.377112, 0.444505, 0.467878, 0.453996, 0.409181, 0.359526, 0.38148, 0.396598, 0.41266, 0.357382, 0.394868, 0.392814, 0.308281, 0.372849, 0.45538 ]
							}
, 							{
								"key" : 35,
								"value" : [ 0.490806, 0.563104, 0.682353, 0.641367, 0.595872, 0.571938, 0.585952, 0.608825, 0.533326, 0.575502, 0.479053, 0.44395, 0.411724, 0.394935, 0.355829, 0.238383, 0.331609, 0.460262, 0.485278, 0.404384, 0.462925, 0.391701, 0.438913, 0.416858, 0.478486, 0.510011, 0.500765, 0.519956, 0.513363, 0.531601, 0.465238, 0.504384, 0.450681, 0.462651, 0.445553, 0.388306, 0.428722, 0.402969, 0.392342, 0.403109, 0.412531, 0.255959, 0.446849, 0.419612, 0.356702, 0.404192, 0.369521, 0.28869, 0.343012, 0.38409, 0.426549, 0.45849, 0.31955, 0.426625, 0.28076, 0.396597, 0.378091, 0.296021, 0.394136, 0.329499, 0.427211, 0.363347, 0.422189, 0.362935 ]
							}
, 							{
								"key" : 36,
								"value" : [ 0.402134, 0.555638, 0.685372, 0.650991, 0.569792, 0.558797, 0.56565, 0.603196, 0.530631, 0.561749, 0.465893, 0.432135, 0.419925, 0.324991, 0.341552, 0.317051, 0.334857, 0.291613, 0.407137, 0.429174, 0.438158, 0.422554, 0.423405, 0.463379, 0.40668, 0.487626, 0.426045, 0.402922, 0.446996, 0.475325, 0.496104, 0.488742, 0.445467, 0.492846, 0.446911, 0.402771, 0.447765, 0.36412, 0.339367, 0.438149, 0.435999, 0.436977, 0.405278, 0.395374, 0.321369, 0.410039, 0.416833, 0.34313, 0.282266, 0.449775, 0.445164, 0.44425, 0.410683, 0.387176, 0.332869, 0.35202, 0.363978, 0.376765, 0.404891, 0.43453, 0.384953, 0.427469, 0.367213, 0.44387 ]
							}
, 							{
								"key" : 37,
								"value" : [ 0.522509, 0.491843, 0.689691, 0.671394, 0.530107, 0.540485, 0.492086, 0.610326, 0.522371, 0.581312, 0.556054, 0.371095, 0.458857, 0.404481, 0.354736, 0.356169, 0.402849, 0.419802, 0.361406, 0.45117, 0.416534, 0.410675, 0.429311, 0.463998, 0.419457, 0.419297, 0.468818, 0.499944, 0.556136, 0.540114, 0.43731, 0.473969, 0.439727, 0.457299, 0.519049, 0.487823, 0.42343, 0.336626, 0.397154, 0.360122, 0.425048, 0.410461, 0.298498, 0.34036, 0.266115, 0.376798, 0.345232, 0.307737, 0.298242, 0.403557, 0.4083, 0.288219, 0.458457, 0.403087, 0.401146, 0.376016, 0.357482, 0.420073, 0.380013, 0.36741, 0.35156, 0.391311, 0.379793, 0.389092 ]
							}
, 							{
								"key" : 38,
								"value" : [ 0.429793, 0.486064, 0.691107, 0.678638, 0.491038, 0.552299, 0.444448, 0.618177, 0.589391, 0.566655, 0.601282, 0.337161, 0.333832, 0.367956, 0.407203, 0.400259, 0.438496, 0.446876, 0.384782, 0.473482, 0.393967, 0.424356, 0.365856, 0.410441, 0.4884, 0.519641, 0.430555, 0.501408, 0.495873, 0.488716, 0.498947, 0.501947, 0.45368, 0.433843, 0.390949, 0.455674, 0.443368, 0.448681, 0.406342, 0.444324, 0.441349, 0.423416, 0.384693, 0.37111, 0.344105, 0.336526, 0.348916, 0.318246, 0.388005, 0.336098, 0.380771, 0.333627, 0.37482, 0.260182, 0.37786, 0.331038, 0.30132, 0.376197, 0.383946, 0.281585, 0.349169, 0.340835, 0.402584, 0.455379 ]
							}
, 							{
								"key" : 39,
								"value" : [ 0.479874, 0.448032, 0.681894, 0.673992, 0.465374, 0.554155, 0.392742, 0.627823, 0.602908, 0.573702, 0.628684, 0.515824, 0.437944, 0.402833, 0.403326, 0.372399, 0.280547, 0.325102, 0.381063, 0.482251, 0.508348, 0.430463, 0.499066, 0.424266, 0.468413, 0.411613, 0.470901, 0.483725, 0.440493, 0.454867, 0.425515, 0.397734, 0.452931, 0.181293, 0.432228, 0.468116, 0.475351, 0.464427, 0.319363, 0.425212, 0.399083, 0.352295, 0.378736, 0.342742, 0.414584, 0.414243, 0.337702, 0.400876, 0.361105, 0.357886, 0.309362, 0.387679, 0.406871, 0.356563, 0.299216, 0.246309, 0.331521, 0.368673, 0.414864, 0.392198, 0.293524, 0.449599, 0.438853, 0.469259 ]
							}
, 							{
								"key" : 40,
								"value" : [ 0.456833, 0.348479, 0.682409, 0.679559, 0.453578, 0.549735, 0.462588, 0.627972, 0.612175, 0.550843, 0.616946, 0.545858, 0.405587, 0.44031, 0.409253, 0.432367, 0.343084, 0.375912, 0.323754, 0.473528, 0.525816, 0.46075, 0.482156, 0.451161, 0.423336, 0.46499, 0.437977, 0.452171, 0.462075, 0.417532, 0.463188, 0.355583, 0.307561, 0.411509, 0.334621, 0.426772, 0.448106, 0.429766, 0.415415, 0.398915, 0.389054, 0.384954, 0.352358, 0.269112, 0.366892, 0.396753, 0.376005, 0.336913, 0.394988, 0.396424, 0.407553, 0.286927, 0.30056, 0.260875, 0.235756, 0.255943, 0.244371, 0.3084, 0.337276, 0.326795, 0.425964, 0.460535, 0.460161, 0.438736 ]
							}
, 							{
								"key" : 41,
								"value" : [ 0.266915, 0.391938, 0.681984, 0.681054, 0.522349, 0.581443, 0.440191, 0.627522, 0.610038, 0.507715, 0.5784, 0.469976, 0.425953, 0.371239, 0.435153, 0.449411, 0.36094, 0.377757, 0.432351, 0.534281, 0.545539, 0.440435, 0.51007, 0.482326, 0.450754, 0.432884, 0.415751, 0.451898, 0.388119, 0.409621, 0.440683, 0.340337, 0.397752, 0.342591, 0.346304, 0.41179, 0.400885, 0.329865, 0.323681, 0.335085, 0.294188, 0.378145, 0.406559, 0.305301, 0.416122, 0.38868, 0.326731, 0.369389, 0.426797, 0.355103, 0.407387, 0.391765, 0.381639, 0.395809, 0.411198, 0.364186, 0.406832, 0.405826, 0.385961, 0.288646, 0.370128, 0.367446, 0.340513, 0.307521 ]
							}
, 							{
								"key" : 42,
								"value" : [ 0.325352, 0.442519, 0.69179, 0.685937, 0.554699, 0.615303, 0.530194, 0.55516, 0.518885, 0.347884, 0.475169, 0.371387, 0.264706, 0.388919, 0.378811, 0.441378, 0.398527, 0.428366, 0.42809, 0.397008, 0.468383, 0.394514, 0.424385, 0.40289, 0.399955, 0.422047, 0.347163, 0.455339, 0.392697, 0.294296, 0.404872, 0.303373, 0.290599, 0.28212, 0.274663, 0.261271, 0.228157, 0.229602, 0.229476, 0.302795, 0.315289, 0.316087, 0.354071, 0.22467, 0.333572, 0.425123, 0.413655, 0.318668, 0.330784, 0.290724, 0.366114, 0.294369, 0.206337, 0.34177, 0.251139, 0.317254, 0.245446, 0.224591, 0.284987, 0.320339, 0.326746, 0.341458, 0.291425, 0.248286 ]
							}
, 							{
								"key" : 43,
								"value" : [ 0.370613, 0.468237, 0.703078, 0.698175, 0.580033, 0.638427, 0.543676, 0.469571, 0.478824, 0.309076, 0.399201, 0.342629, 0.376804, 0.348843, 0.309771, 0.331003, 0.308751, 0.427441, 0.42173, 0.414896, 0.441432, 0.344663, 0.436379, 0.380832, 0.360385, 0.409694, 0.315928, 0.373078, 0.369718, 0.454495, 0.410509, 0.360939, 0.441557, 0.303979, 0.283962, 0.261722, 0.214082, 0.164961, 0.126527, 0.258648, 0.251629, 0.339937, 0.353146, 0.361265, 0.334052, 0.394377, 0.375747, 0.282523, 0.253326, 0.307667, 0.317354, 0.322058, 0.33566, 0.29135, 0.300407, 0.32403, 0.344531, 0.247018, 0.315992, 0.395801, 0.341309, 0.341356, 0.337945, 0.261318 ]
							}
, 							{
								"key" : 44,
								"value" : [ 0.197256, 0.489038, 0.7091, 0.701614, 0.597367, 0.638591, 0.549301, 0.430818, 0.467418, 0.373138, 0.4213, 0.298416, 0.419299, 0.332182, 0.320603, 0.306792, 0.138259, 0.343107, 0.327813, 0.421129, 0.416601, 0.317743, 0.395444, 0.365755, 0.262567, 0.32101, 0.349736, 0.42093, 0.377863, 0.433123, 0.417364, 0.341593, 0.386787, 0.341271, 0.299134, 0.278525, 0.274292, 0.280861, 0.254007, 0.208867, 0.286072, 0.383704, 0.364073, 0.323581, 0.297041, 0.290117, 0.234417, 0.178178, 0.092303, 0.215389, 0.222094, 0.302401, 0.303383, 0.327772, 0.356375, 0.378743, 0.401235, 0.256447, 0.274978, 0.364621, 0.272413, 0.332392, 0.251933, 0.277772 ]
							}
, 							{
								"key" : 45,
								"value" : [ 0.003399, 0.520484, 0.705703, 0.69086, 0.594554, 0.614636, 0.460089, 0.487, 0.413006, 0.3277, 0.373613, 0.303636, 0.389194, 0.341597, 0.317598, 0.357226, 0.290906, 0.336484, 0.35107, 0.432531, 0.405911, 0.409777, 0.378364, 0.403809, 0.351199, 0.340128, 0.309298, 0.204725, 0.358524, 0.281598, 0.337976, 0.275844, 0.260461, 0.260923, 0.266116, 0.330693, 0.338888, 0.335877, 0.340732, 0.395828, 0.379489, 0.37247, 0.367433, 0.33661, 0.297689, 0.255123, 0.26786, 0.254563, 0.259766, 0.27359, 0.214491, 0.315325, 0.342009, 0.376237, 0.353663, 0.386759, 0.364951, 0.321122, 0.353852, 0.282156, 0.352647, 0.306574, 0.312294, 0.278797 ]
							}
, 							{
								"key" : 46,
								"value" : [ 0.370425, 0.524323, 0.61548, 0.55851, 0.507312, 0.421722, 0.225798, 0.414747, 0.369584, 0.391155, 0.415147, 0.443161, 0.492629, 0.394305, 0.459333, 0.362917, 0.383157, 0.401829, 0.309871, 0.376685, 0.381557, 0.405266, 0.337276, 0.412771, 0.320469, 0.352081, 0.392563, 0.345959, 0.354878, 0.330653, 0.38236, 0.377695, 0.322022, 0.361342, 0.28994, 0.412206, 0.276082, 0.411195, 0.235111, 0.461123, 0.33215, 0.421771, 0.466072, 0.52189, 0.548071, 0.525583, 0.421051, 0.500372, 0.53132, 0.531055, 0.528076, 0.488626, 0.472806, 0.529277, 0.5282, 0.553431, 0.544701, 0.578965, 0.585933, 0.587897, 0.571638, 0.608444, 0.580325, 0.535586 ]
							}
, 							{
								"key" : 47,
								"value" : [ 0.478541, 0.416747, 0.475057, 0.461618, 0.371231, 0.36617, 0.319691, 0.339232, 0.407785, 0.289882, 0.404965, 0.394952, 0.343417, 0.33872, 0.337552, 0.326248, 0.345158, 0.344564, 0.341326, 0.262631, 0.346087, 0.297637, 0.43636, 0.335404, 0.413665, 0.430029, 0.368145, 0.399021, 0.389506, 0.324566, 0.368366, 0.411234, 0.359513, 0.377905, 0.339883, 0.461451, 0.411548, 0.378552, 0.333736, 0.429774, 0.45883, 0.341666, 0.443421, 0.455834, 0.495534, 0.454411, 0.418323, 0.399835, 0.387821, 0.240923, 0.465659, 0.472495, 0.533233, 0.498455, 0.501322, 0.519314, 0.483248, 0.482238, 0.490237, 0.510222, 0.471162, 0.584801, 0.559325, 0.601945 ]
							}
, 							{
								"key" : 48,
								"value" : [ 0.41249, 0.366452, 0.411897, 0.402904, 0.367724, 0.395162, 0.394085, 0.373008, 0.312894, 0.405571, 0.430391, 0.309046, 0.445561, 0.423364, 0.368213, 0.349235, 0.403443, 0.399883, 0.331838, 0.369353, 0.354899, 0.308483, 0.367209, 0.382766, 0.419951, 0.367817, 0.400642, 0.380559, 0.187379, 0.313796, 0.334883, 0.343365, 0.27603, 0.349206, 0.374198, 0.31634, 0.37347, 0.444836, 0.412325, 0.369072, 0.397376, 0.384081, 0.37171, 0.345135, 0.40603, 0.314102, 0.386152, 0.330111, 0.389092, 0.432825, 0.44481, 0.464864, 0.400072, 0.428735, 0.438415, 0.377925, 0.415266, 0.44085, 0.495699, 0.505038, 0.470996, 0.512309, 0.538746, 0.36827 ]
							}
, 							{
								"key" : 49,
								"value" : [ 0.440845, 0.379373, 0.440616, 0.414539, 0.391937, 0.363941, 0.314152, 0.414918, 0.393401, 0.418577, 0.310963, 0.321994, 0.400422, 0.406948, 0.415818, 0.397648, 0.358966, 0.390972, 0.374076, 0.295685, 0.312549, 0.36548, 0.421384, 0.263438, 0.358094, 0.369209, 0.325924, 0.420561, 0.389287, 0.329956, 0.334174, 0.396416, 0.356974, 0.364783, 0.364808, 0.368513, 0.338685, 0.428289, 0.410776, 0.400979, 0.375328, 0.444029, 0.456034, 0.446343, 0.338499, 0.336773, 0.392307, 0.405857, 0.340872, 0.318141, 0.439744, 0.41119, 0.410619, 0.395353, 0.466221, 0.443967, 0.411663, 0.476459, 0.426284, 0.463592, 0.495702, 0.487406, 0.48328, 0.410127 ]
							}
, 							{
								"key" : 50,
								"value" : [ 0.477623, 0.414299, 0.364168, 0.412413, 0.366595, 0.391641, 0.397729, 0.385863, 0.409849, 0.349116, 0.357879, 0.336033, 0.405939, 0.381166, 0.362135, 0.40615, 0.411555, 0.437063, 0.336132, 0.388297, 0.299564, 0.368633, 0.366947, 0.427782, 0.429888, 0.413229, 0.392054, 0.428809, 0.454125, 0.402036, 0.402207, 0.44421, 0.423552, 0.389767, 0.385828, 0.449406, 0.516763, 0.505894, 0.433586, 0.431065, 0.32607, 0.398547, 0.270023, 0.33594, 0.383963, 0.37161, 0.343137, 0.405231, 0.352777, 0.36161, 0.353952, 0.451266, 0.475479, 0.529743, 0.492055, 0.501431, 0.483318, 0.456863, 0.489012, 0.51054, 0.468385, 0.495089, 0.484634, 0.498134 ]
							}
, 							{
								"key" : 51,
								"value" : [ 0.428076, 0.366899, 0.402625, 0.403284, 0.404085, 0.405508, 0.360417, 0.480057, 0.476908, 0.395513, 0.409498, 0.389066, 0.405427, 0.383505, 0.430965, 0.422966, 0.418834, 0.444776, 0.458237, 0.431316, 0.396207, 0.436932, 0.498012, 0.526977, 0.400143, 0.497583, 0.488401, 0.467998, 0.3943, 0.384259, 0.418429, 0.43451, 0.426034, 0.402019, 0.350144, 0.486306, 0.540425, 0.493139, 0.290409, 0.39704, 0.371985, 0.428485, 0.389294, 0.346787, 0.332297, 0.444962, 0.451156, 0.414031, 0.452682, 0.384686, 0.349051, 0.45429, 0.53896, 0.567749, 0.509054, 0.397292, 0.44233, 0.454313, 0.397597, 0.45241, 0.414144, 0.40824, 0.508986, 0.487243 ]
							}
, 							{
								"key" : 52,
								"value" : [ 0.448221, 0.472632, 0.66743, 0.691767, 0.568345, 0.682121, 0.652217, 0.530708, 0.502684, 0.421746, 0.456758, 0.487176, 0.374073, 0.398927, 0.398616, 0.41019, 0.445776, 0.337567, 0.301307, 0.31561, 0.321506, 0.386117, 0.471896, 0.522386, 0.431818, 0.408346, 0.462628, 0.373468, 0.4073, 0.408278, 0.287876, 0.436857, 0.416499, 0.408461, 0.463475, 0.43606, 0.512213, 0.508806, 0.457574, 0.41356, 0.340275, 0.396393, 0.132277, 0.319463, 0.291367, 0.304664, 0.34714, 0.3042, 0.364142, 0.372769, 0.196378, 0.371247, 0.231513, 0.480636, 0.450184, 0.442527, 0.324291, 0.383085, 0.382921, 0.368961, 0.449613, 0.376709, 0.440739, 0.376323 ]
							}
, 							{
								"key" : 53,
								"value" : [ 0.44596, 0.443362, 0.663521, 0.688732, 0.570797, 0.729406, 0.689426, 0.543255, 0.393424, 0.466115, 0.505342, 0.466865, 0.375593, 0.414237, 0.343744, 0.413176, 0.433937, 0.301261, 0.370883, 0.395169, 0.374469, 0.484789, 0.462202, 0.531606, 0.544081, 0.43443, 0.506113, 0.44539, 0.435839, 0.429894, 0.373827, 0.469135, 0.448797, 0.426155, 0.500075, 0.443838, 0.479449, 0.497624, 0.437961, 0.408819, 0.311064, 0.399787, 0.383123, 0.110399, 0.16338, 0.218222, 0.242791, 0.247531, 0.310483, 0.413049, 0.431171, 0.432573, 0.516618, 0.47711, 0.380735, 0.389344, 0.375577, 0.383304, 0.364155, 0.388894, 0.39859, 0.396141, 0.424427, 0.438444 ]
							}
, 							{
								"key" : 54,
								"value" : [ 0.418646, 0.443422, 0.662439, 0.677701, 0.614766, 0.738352, 0.692967, 0.553935, 0.536186, 0.46326, 0.496771, 0.500568, 0.382471, 0.422579, 0.357857, 0.440604, 0.435379, 0.191039, 0.393254, 0.350239, 0.432519, 0.46288, 0.407023, 0.515726, 0.484777, 0.499625, 0.528101, 0.458576, 0.450203, 0.45121, 0.363117, 0.478495, 0.435142, 0.457411, 0.498326, 0.339985, 0.480311, 0.413363, 0.424488, 0.347788, 0.317231, 0.396739, 0.397402, 0.282168, 0.253604, 0.189039, 0.285665, 0.334651, 0.319501, 0.380625, 0.4328, 0.377387, 0.481356, 0.34019, 0.438097, 0.430323, 0.405138, 0.454483, 0.397065, 0.449847, 0.456084, 0.42354, 0.447711, 0.311799 ]
							}
, 							{
								"key" : 55,
								"value" : [ 0.36707, 0.503831, 0.660606, 0.658705, 0.622397, 0.735307, 0.68797, 0.491148, 0.57778, 0.423351, 0.510946, 0.492432, 0.396179, 0.40258, 0.382759, 0.432412, 0.451258, 0.278744, 0.376128, 0.307041, 0.365402, 0.428545, 0.364688, 0.499361, 0.450642, 0.496636, 0.518779, 0.39426, 0.449152, 0.466412, 0.378208, 0.480044, 0.324727, 0.456964, 0.486305, 0.405509, 0.537543, 0.459974, 0.462131, 0.286977, 0.303172, 0.364971, 0.36433, 0.316716, 0.339087, 0.282181, 0.331198, 0.333589, 0.364009, 0.380934, 0.363104, 0.461646, 0.488963, 0.475735, 0.412922, 0.395027, 0.35083, 0.378083, 0.41887, 0.428386, 0.384811, 0.427792, 0.42342, 0.383687 ]
							}
, 							{
								"key" : 56,
								"value" : [ 0.459541, 0.463718, 0.650959, 0.660806, 0.608904, 0.734567, 0.693847, 0.52093, 0.581907, 0.429452, 0.495383, 0.499116, 0.217599, 0.405948, 0.283685, 0.415167, 0.45269, 0.330965, 0.371434, 0.36585, 0.339876, 0.34538, 0.269374, 0.439463, 0.452338, 0.462877, 0.475622, 0.380021, 0.39548, 0.475054, 0.403047, 0.454079, 0.472079, 0.431637, 0.523999, 0.492149, 0.501689, 0.502003, 0.412191, 0.35363, 0.288006, 0.267442, 0.267865, 0.302237, 0.307994, 0.32861, 0.301612, 0.254043, 0.357028, 0.316183, 0.381509, 0.382493, 0.481444, 0.442702, 0.460463, 0.378293, 0.350068, 0.391422, 0.456668, 0.429246, 0.448703, 0.412706, 0.408102, 0.456681 ]
							}
, 							{
								"key" : 57,
								"value" : [ 0.444558, 0.463637, 0.649828, 0.670331, 0.598369, 0.734983, 0.691461, 0.582367, 0.567359, 0.491255, 0.493152, 0.497351, 0.38623, 0.374218, 0.363786, 0.429711, 0.451405, 0.235894, 0.367429, 0.297045, 0.328011, 0.370844, 0.31769, 0.46424, 0.434955, 0.460229, 0.518575, 0.385331, 0.449911, 0.474456, 0.36638, 0.486694, 0.467318, 0.467943, 0.517928, 0.429757, 0.533565, 0.506572, 0.320852, 0.384304, 0.379502, 0.304848, 0.369044, 0.33205, 0.180214, 0.147432, 0.268418, 0.292252, 0.353204, 0.304962, 0.414937, 0.433981, 0.413715, 0.430799, 0.461003, 0.435089, 0.320226, 0.320788, 0.365721, 0.384008, 0.438762, 0.369884, 0.473837, 0.484427 ]
							}
, 							{
								"key" : 58,
								"value" : [ 0.361043, 0.426327, 0.650392, 0.676537, 0.597573, 0.737861, 0.695758, 0.584948, 0.56148, 0.493343, 0.514682, 0.467626, 0.338895, 0.384819, 0.292683, 0.409471, 0.428964, 0.273097, 0.413372, 0.37626, 0.298967, 0.372978, 0.358177, 0.472937, 0.475265, 0.256833, 0.515316, 0.466301, 0.414181, 0.429499, 0.424028, 0.496464, 0.448337, 0.421143, 0.484323, 0.427469, 0.493098, 0.481281, 0.423126, 0.400269, 0.359437, 0.333926, 0.408469, 0.374459, 0.283645, 0.327979, 0.278336, 0.345851, 0.329715, 0.305527, 0.381931, 0.327877, 0.427329, 0.453865, 0.451366, 0.449464, 0.331143, 0.384534, 0.363618, 0.361808, 0.392019, 0.422425, 0.313418, 0.447767 ]
							}
, 							{
								"key" : 59,
								"value" : [ 0.434859, 0.390528, 0.653985, 0.668112, 0.594227, 0.721965, 0.679623, 0.558388, 0.594387, 0.475309, 0.463575, 0.479736, 0.445945, 0.499374, 0.374995, 0.415295, 0.423457, 0.345942, 0.392222, 0.194989, 0.362211, 0.343185, 0.379654, 0.472795, 0.488234, 0.436605, 0.51394, 0.434464, 0.452692, 0.467356, 0.405898, 0.463553, 0.421179, 0.437278, 0.488343, 0.436619, 0.543587, 0.537093, 0.447639, 0.41976, 0.297913, 0.300307, 0.361688, 0.272096, 0.266104, 0.291238, 0.289862, 0.317601, 0.306972, 0.245046, 0.330293, 0.339028, 0.479339, 0.473969, 0.411737, 0.432104, 0.332103, 0.448312, 0.434339, 0.398356, 0.437114, 0.366601, 0.440431, 0.437167 ]
							}
, 							{
								"key" : 60,
								"value" : [ 0.502579, 0.461373, 0.660326, 0.664418, 0.601716, 0.719659, 0.673912, 0.483559, 0.614809, 0.45465, 0.497738, 0.454075, 0.293457, 0.441999, 0.395736, 0.417203, 0.416835, 0.275397, 0.275923, 0.32113, 0.411729, 0.417611, 0.308646, 0.495816, 0.45758, 0.483906, 0.568122, 0.484637, 0.432159, 0.467028, 0.370405, 0.477748, 0.426658, 0.472394, 0.505972, 0.479289, 0.566763, 0.541768, 0.414717, 0.464579, 0.389268, 0.355056, 0.314332, 0.340573, 0.283083, 0.28769, 0.244171, 0.312574, 0.307252, 0.360358, 0.346072, 0.467844, 0.457518, 0.447614, 0.431767, 0.44465, 0.426063, 0.393435, 0.356623, 0.384219, 0.400851, 0.352721, 0.285737, 0.316379 ]
							}
, 							{
								"key" : 61,
								"value" : [ 0.335942, 0.475687, 0.663079, 0.681383, 0.598447, 0.723605, 0.682592, 0.552231, 0.599433, 0.496389, 0.476319, 0.51007, 0.27349, 0.444795, 0.325224, 0.373621, 0.436877, 0.375602, 0.370174, 0.342194, 0.313936, 0.41151, 0.367715, 0.462475, 0.482871, 0.478302, 0.549482, 0.51099, 0.311167, 0.434582, 0.334855, 0.417343, 0.466357, 0.358174, 0.509914, 0.484788, 0.523457, 0.557863, 0.424366, 0.367572, 0.344155, 0.364465, 0.376104, 0.320027, 0.3147, 0.248704, 0.263258, 0.319249, 0.259921, 0.312474, 0.339348, 0.34916, 0.499355, 0.515287, 0.430762, 0.318022, 0.384222, 0.393878, 0.445287, 0.389111, 0.385828, 0.372493, 0.312225, 0.347675 ]
							}
, 							{
								"key" : 62,
								"value" : [ 0.330158, 0.409303, 0.636509, 0.629353, 0.485182, 0.527429, 0.424942, 0.396478, 0.428316, 0.319612, 0.385758, 0.305053, 0.387726, 0.363587, 0.266802, 0.290394, 0.300756, 0.105239, 0.216333, 0.199748, 0.275256, 0.322305, 0.214119, 0.283671, 0.252995, 0.268061, 0.284884, 0.25292, 0.204903, 0.280385, 0.278567, 0.213247, 0.215331, 0.221309, 0.301545, 0.305142, 0.245559, 0.283875, 0.320567, 0.292126, 0.316578, 0.293611, 0.304549, 0.345292, 0.315692, 0.291475, 0.282681, 0.310316, 0.331552, 0.343349, 0.330218, 0.280479, 0.31586, 0.323428, 0.335902, 0.283619, 0.352397, 0.378869, 0.331115, 0.357239, 0.281848, 0.320247, 0.201805, 0.24035 ]
							}
, 							{
								"key" : 63,
								"value" : [ 0.421957, 0.484317, 0.628614, 0.654421, 0.482824, 0.495661, 0.426568, 0.40508, 0.446593, 0.334747, 0.371401, 0.215228, 0.211755, 0.175116, 0.341352, 0.315277, 0.303551, 0.256596, 0.270811, 0.313056, 0.302489, 0.306991, 0.30527, 0.287541, 0.231952, 0.29136, 0.310339, 0.355361, 0.265783, 0.200705, 0.311945, 0.350497, 0.325041, 0.249383, 0.300948, 0.306303, 0.311495, 0.281643, 0.276762, 0.381786, 0.329896, 0.304046, 0.359766, 0.370765, 0.3511, 0.370608, 0.335173, 0.415, 0.425709, 0.324059, 0.466138, 0.462388, 0.347357, 0.420993, 0.310536, 0.490571, 0.452799, 0.484856, 0.477832, 0.391953, 0.361102, 0.284112, 0.442818, 0.407775 ]
							}
, 							{
								"key" : 64,
								"value" : [ 0.439533, 0.529137, 0.645912, 0.74737, 0.687232, 0.582923, 0.699908, 0.652348, 0.515629, 0.545042, 0.511953, 0.403307, 0.483933, 0.440325, 0.297105, 0.411586, 0.389227, 0.291931, 0.437217, 0.436626, 0.328947, 0.392047, 0.340256, 0.318159, 0.491544, 0.533637, 0.487946, 0.486138, 0.519762, 0.438313, 0.390024, 0.463201, 0.430387, 0.468178, 0.517227, 0.504467, 0.311096, 0.536, 0.521806, 0.437122, 0.431441, 0.363007, 0.414628, 0.445752, 0.364191, 0.328108, 0.34267, 0.376498, 0.387398, 0.40046, 0.408215, 0.451458, 0.477785, 0.475596, 0.456117, 0.440597, 0.426118, 0.407014, 0.417605, 0.450333, 0.34219, 0.405047, 0.410055, 0.304922 ]
							}
, 							{
								"key" : 65,
								"value" : [ 0.537248, 0.538831, 0.631928, 0.750886, 0.705623, 0.586474, 0.723613, 0.718183, 0.4927, 0.556173, 0.577874, 0.38912, 0.433171, 0.504974, 0.333672, 0.286403, 0.39723, 0.361385, 0.342856, 0.480171, 0.420513, 0.300178, 0.366111, 0.391933, 0.340638, 0.490178, 0.512381, 0.301101, 0.385054, 0.492742, 0.448403, 0.447155, 0.505081, 0.456768, 0.478708, 0.557768, 0.538203, 0.42179, 0.582981, 0.56101, 0.443548, 0.420575, 0.420912, 0.338423, 0.412538, 0.435918, 0.403277, 0.279103, 0.444324, 0.385208, 0.358012, 0.43513, 0.339976, 0.426225, 0.434457, 0.42898, 0.374836, 0.379569, 0.387218, 0.349952, 0.382919, 0.426285, 0.355314, 0.297565 ]
							}
, 							{
								"key" : 66,
								"value" : [ 0.530347, 0.510955, 0.595929, 0.752979, 0.72392, 0.578229, 0.702046, 0.723052, 0.536622, 0.539396, 0.619333, 0.50327, 0.292509, 0.517414, 0.464309, 0.304445, 0.405874, 0.409182, 0.291914, 0.424338, 0.482162, 0.382941, 0.317098, 0.438929, 0.41893, 0.35674, 0.490356, 0.51531, 0.472412, 0.394218, 0.466403, 0.427898, 0.442271, 0.475879, 0.444773, 0.40364, 0.5589, 0.520925, 0.385421, 0.503376, 0.485472, 0.407852, 0.429652, 0.485345, 0.367073, 0.388135, 0.4068, 0.413901, 0.333323, 0.465029, 0.465238, 0.418511, 0.379927, 0.396988, 0.281215, 0.334598, 0.4314, 0.321529, 0.373007, 0.363777, 0.232599, 0.358775, 0.303039, 0.326152 ]
							}
, 							{
								"key" : 67,
								"value" : [ 0.251648, 0.518881, 0.606965, 0.757504, 0.725123, 0.584559, 0.684413, 0.691116, 0.522777, 0.568698, 0.61233, 0.521566, 0.451031, 0.503065, 0.469224, 0.352927, 0.393977, 0.393175, 0.196802, 0.35456, 0.432652, 0.145091, 0.338695, 0.384667, 0.337811, 0.333546, 0.418069, 0.452729, 0.468165, 0.450284, 0.45333, 0.433941, 0.420687, 0.506908, 0.445942, 0.511969, 0.560562, 0.510547, 0.292807, 0.364645, 0.426411, 0.380325, 0.415098, 0.465455, 0.338212, 0.309463, 0.405857, 0.335027, 0.275937, 0.466019, 0.434117, 0.315156, 0.271633, 0.344367, 0.211586, 0.234609, 0.357696, 0.279423, 0.177148, 0.384571, 0.357046, 0.312067, 0.265167, 0.16442 ]
							}
, 							{
								"key" : 68,
								"value" : [ 0.507003, 0.520031, 0.634316, 0.758077, 0.707944, 0.586197, 0.608394, 0.613408, 0.467058, 0.555121, 0.569309, 0.417417, 0.441162, 0.4643, 0.393665, 0.365091, 0.315727, 0.306412, 0.323238, 0.301409, 0.323748, 0.218129, 0.324625, 0.312181, 0.276894, 0.336332, 0.397617, 0.381025, 0.451958, 0.481981, 0.378041, 0.315198, 0.397674, 0.406139, 0.397241, 0.47698, 0.446143, 0.251615, 0.358639, 0.353539, 0.278197, 0.270772, 0.37953, 0.338839, 0.329558, 0.319865, 0.266029, 0.385718, 0.346849, 0.429656, 0.463118, 0.391657, 0.282623, 0.400245, 0.429968, 0.404837, 0.338474, 0.394414, 0.348547, 0.360705, 0.426078, 0.383364, 0.2902, 0.308226 ]
							}
, 							{
								"key" : 69,
								"value" : [ 0.546618, 0.574315, 0.660995, 0.770556, 0.720013, 0.588069, 0.553555, 0.556066, 0.465047, 0.517549, 0.489029, 0.396236, 0.484706, 0.474623, 0.40992, 0.420124, 0.420074, 0.366973, 0.312626, 0.358341, 0.35635, 0.316978, 0.387487, 0.343015, 0.32448, 0.333478, 0.327224, 0.321998, 0.355816, 0.345184, 0.332243, 0.31307, 0.340737, 0.30477, 0.373681, 0.436039, 0.354685, 0.20961, 0.294844, 0.27408, 0.1912, 0.202177, 0.240062, 0.26499, 0.319, 0.307099, 0.237982, 0.305322, 0.348298, 0.222696, 0.425853, 0.411988, 0.348924, 0.364104, 0.400886, 0.391892, 0.351117, 0.416344, 0.399598, 0.389469, 0.373783, 0.305478, 0.341822, 0.310569 ]
							}
, 							{
								"key" : 70,
								"value" : [ 0.51986, 0.540411, 0.652229, 0.77616, 0.727053, 0.578292, 0.583833, 0.495197, 0.443806, 0.481677, 0.518122, 0.346947, 0.485374, 0.503794, 0.400003, 0.332316, 0.432301, 0.329876, 0.196898, 0.375276, 0.332686, 0.173203, 0.408772, 0.375415, 0.270493, 0.337866, 0.361056, 0.312243, 0.38557, 0.37499, 0.24974, 0.358762, 0.389528, 0.231308, 0.317171, 0.376295, 0.267622, 0.313801, 0.442479, 0.397935, 0.288429, 0.280232, 0.20952, 0.242145, 0.267476, 0.288885, 0.138392, 0.213711, 0.247616, 0.206318, 0.306485, 0.328414, 0.298115, 0.336349, 0.338311, 0.370693, 0.317865, 0.380601, 0.37325, 0.332534, 0.328164, 0.219922, 0.287761, 0.302866 ]
							}
, 							{
								"key" : 71,
								"value" : [ 0.4984, 0.528236, 0.644535, 0.775645, 0.731705, 0.569549, 0.472335, 0.535743, 0.410373, 0.475563, 0.51798, 0.34946, 0.425793, 0.4907, 0.355909, 0.391416, 0.439964, 0.388378, 0.189816, 0.351423, 0.35137, 0.248343, 0.394713, 0.374163, 0.133862, 0.34571, 0.38175, 0.337306, 0.421221, 0.457792, 0.359493, 0.319585, 0.415288, 0.325745, 0.27942, 0.279024, 0.316912, 0.291328, 0.440243, 0.459705, 0.342947, 0.330462, 0.310961, 0.294415, 0.304082, 0.350072, 0.30377, 0.16984, 0.205677, 0.193875, 0.274272, 0.281311, 0.101858, 0.316961, 0.348322, 0.356698, 0.348649, 0.385285, 0.414041, 0.429521, 0.300372, 0.381823, 0.154915, 0.297335 ]
							}
, 							{
								"key" : 72,
								"value" : [ 0.555322, 0.558658, 0.657098, 0.755855, 0.696827, 0.565842, 0.520156, 0.505186, 0.426942, 0.485181, 0.370724, 0.349018, 0.326805, 0.342915, 0.416329, 0.3968, 0.359283, 0.333518, 0.394303, 0.389811, 0.291013, 0.422889, 0.389017, 0.292455, 0.252242, 0.290182, 0.36437, 0.307776, 0.372403, 0.385282, 0.375812, 0.378854, 0.278872, 0.343421, 0.346485, 0.29427, 0.36126, 0.323135, 0.296762, 0.391439, 0.411493, 0.295721, 0.307265, 0.195285, 0.276584, 0.248431, 0.236927, 0.185954, 0.082518, 0.204319, 0.274175, 0.28196, 0.318831, 0.354842, 0.353791, 0.446833, 0.410184, 0.412213, 0.449391, 0.429612, 0.393909, 0.341238, 0.292832, 0.183362 ]
							}
, 							{
								"key" : 73,
								"value" : [ 0.485895, 0.475009, 0.600783, 0.717272, 0.673757, 0.538804, 0.432569, 0.434186, 0.38181, 0.446101, 0.385276, 0.3954, 0.423964, 0.395311, 0.430272, 0.399531, 0.316197, 0.346383, 0.372246, 0.223039, 0.3113, 0.300966, 0.252506, 0.290504, 0.286932, 0.296583, 0.34317, 0.365639, 0.339617, 0.32487, 0.327137, 0.158961, 0.275508, 0.293675, 0.336606, 0.369404, 0.386936, 0.37201, 0.253854, 0.334832, 0.246814, 0.237956, 0.206909, 0.150911, 0.140127, 0.145946, 0.063888, 0.150667, 0.203097, 0.241784, 0.273111, 0.292183, 0.312764, 0.361842, 0.356062, 0.276566, 0.283469, 0.369436, 0.330943, 0.384355, 0.375705, 0.146278, 0.229989, 0.228262 ]
							}
, 							{
								"key" : 74,
								"value" : [ 0.476594, 0.398304, 0.458927, 0.482068, 0.437436, 0.537851, 0.45181, 0.417567, 0.345333, 0.345302, 0.363292, 0.294951, 0.2568, 0.340657, 0.325711, 0.249565, 0.248334, 0.189835, 0.127132, 0.206683, 0.220355, 0.171157, 0.222746, 0.215511, 0.232393, 0.189574, 0.213501, 0.228535, 0.198237, 0.206582, 0.298744, 0.197811, 0.20136, 0.237751, 0.276648, 0.292628, 0.251711, 0.237825, 0.181583, 0.142417, 0.163032, 0.092527, 0.182678, 0.189036, 0.173544, 0.157148, 0.196303, 0.163508, 0.18124, 0.242151, 0.179682, 0.267264, 0.324993, 0.250417, 0.169135, 0.290076, 0.32298, 0.2945, 0.295263, 0.220338, 0.282199, 0.258852, 0.284175, 0.269649 ]
							}
, 							{
								"key" : 75,
								"value" : [ 0.43282, 0.385165, 0.429317, 0.5377, 0.494888, 0.443865, 0.437239, 0.117139, 0.352602, 0.333554, 0.314726, 0.247439, 0.203704, 0.212905, 0.249417, 0.215762, 0.203166, 0.211127, 0.21359, 0.222376, 0.263286, 0.241654, 0.225101, 0.214606, 0.212908, 0.233529, 0.275381, 0.226839, 0.210993, 0.210711, 0.17345, 0.189071, 0.187348, 0.232332, 0.233272, 0.155441, 0.226497, 0.211511, 0.219102, 0.1814, 0.136034, 0.190597, 0.163854, 0.163237, 0.173934, 0.146997, 0.145251, 0.114685, 0.129924, 0.155049, 0.153655, 0.109463, 0.180271, 0.094544, 0.207142, 0.191334, 0.165108, 0.16874, 0.165437, 0.14458, 0.13578, 0.14028, 0.104593, 0.167686 ]
							}
, 							{
								"key" : 76,
								"value" : [ 0.408081, 0.384257, 0.44045, 0.509833, 0.469784, 0.467996, 0.454021, 0.406322, 0.419466, 0.393832, 0.37164, 0.363298, 0.366039, 0.361304, 0.340576, 0.346776, 0.334323, 0.350998, 0.352459, 0.361057, 0.361927, 0.357806, 0.361913, 0.363491, 0.373712, 0.384708, 0.407034, 0.423455, 0.417033, 0.373228, 0.286886, 0.326647, 0.368323, 0.399687, 0.427405, 0.439738, 0.430835, 0.391728, 0.340322, 0.306389, 0.261342, 0.246015, 0.239664, 0.215427, 0.228248, 0.222238, 0.223628, 0.17232, 0.226341, 0.29961, 0.350351, 0.36964, 0.362363, 0.353198, 0.341012, 0.327229, 0.323392, 0.323518, 0.333906, 0.336562, 0.34101, 0.347433, 0.354177, 0.360617 ]
							}
, 							{
								"key" : 77,
								"value" : [ 0.465127, 0.349804, 0.435822, 0.516192, 0.496596, 0.477556, 0.404831, 0.42305, 0.350954, 0.357206, 0.344862, 0.363178, 0.351454, 0.331775, 0.254602, 0.204961, 0.173623, 0.264144, 0.281084, 0.285893, 0.294339, 0.296213, 0.296109, 0.313249, 0.30094, 0.28742, 0.320055, 0.406601, 0.430744, 0.42581, 0.416133, 0.411381, 0.405004, 0.400472, 0.378667, 0.327768, 0.206148, 0.351755, 0.380471, 0.37484, 0.370594, 0.356996, 0.346329, 0.339165, 0.308439, 0.253089, 0.146907, 0.251369, 0.311822, 0.372104, 0.412913, 0.411608, 0.382197, 0.363452, 0.344105, 0.302611, 0.262826, 0.261475, 0.314914, 0.331716, 0.357906, 0.373201, 0.359442, 0.350144 ]
							}
, 							{
								"key" : 78,
								"value" : [ 0.425633, 0.556026, 0.627745, 0.613148, 0.615752, 0.534175, 0.561833, 0.518738, 0.434613, 0.451427, 0.401231, 0.420643, 0.423437, 0.407254, 0.185096, 0.328733, 0.331759, 0.341776, 0.31935, 0.333326, 0.297278, 0.342023, 0.343371, 0.350239, 0.379074, 0.436184, 0.493322, 0.50464, 0.475843, 0.338895, 0.396729, 0.384211, 0.44263, 0.433911, 0.456867, 0.483655, 0.478114, 0.472927, 0.431873, 0.424881, 0.393068, 0.39885, 0.342174, 0.375095, 0.357426, 0.373748, 0.327809, 0.264132, 0.306838, 0.38001, 0.374804, 0.307485, 0.313591, 0.337456, 0.341146, 0.328737, 0.351968, 0.319322, 0.349911, 0.371905, 0.310121, 0.314511, 0.339641, 0.346448 ]
							}
, 							{
								"key" : 79,
								"value" : [ 0.393379, 0.559269, 0.648566, 0.598516, 0.598299, 0.534045, 0.548943, 0.468992, 0.45233, 0.389205, 0.400839, 0.389787, 0.407779, 0.388678, 0.310505, 0.139618, 0.230667, 0.274966, 0.30159, 0.238363, 0.219704, 0.263775, 0.27407, 0.31095, 0.377227, 0.329381, 0.458924, 0.414271, 0.385899, 0.420631, 0.317739, 0.421066, 0.392535, 0.343221, 0.370479, 0.378999, 0.398238, 0.417061, 0.355841, 0.359842, 0.393782, 0.36505, 0.234836, 0.3202, 0.277406, 0.304557, 0.181361, 0.191854, 0.369517, 0.413931, 0.402811, 0.389303, 0.288335, 0.253077, 0.172225, 0.238016, 0.23343, 0.306299, 0.265963, 0.163402, 0.279891, 0.325947, 0.33996, 0.335481 ]
							}
, 							{
								"key" : 80,
								"value" : [ 0.529837, 0.569322, 0.654842, 0.619381, 0.624231, 0.578888, 0.489584, 0.383682, 0.432112, 0.43355, 0.414317, 0.40924, 0.444665, 0.44324, 0.352008, 0.3666, 0.34168, 0.350972, 0.341468, 0.350712, 0.298257, 0.250862, 0.295722, 0.308997, 0.316603, 0.474086, 0.454465, 0.363005, 0.352648, 0.387246, 0.319553, 0.356092, 0.27688, 0.269329, 0.23931, 0.38191, 0.392428, 0.387642, 0.359827, 0.398797, 0.335251, 0.282834, 0.286693, 0.175367, 0.24236, 0.304703, 0.143056, 0.249151, 0.347197, 0.428142, 0.433115, 0.341654, 0.118473, 0.217364, 0.204599, 0.179675, 0.224881, 0.288783, 0.294756, 0.339664, 0.304537, 0.297244, 0.315122, 0.302126 ]
							}
, 							{
								"key" : 81,
								"value" : [ 0.536999, 0.564149, 0.655573, 0.602274, 0.636234, 0.591916, 0.391834, 0.463791, 0.466607, 0.443349, 0.382807, 0.407527, 0.445566, 0.437671, 0.366484, 0.364268, 0.266265, 0.354366, 0.255398, 0.342459, 0.303162, 0.367801, 0.295998, 0.373886, 0.40259, 0.42738, 0.391602, 0.369349, 0.291014, 0.391687, 0.359797, 0.301346, 0.286774, 0.164476, 0.26451, 0.299643, 0.294699, 0.403669, 0.425533, 0.355948, 0.337027, 0.249561, 0.326684, 0.30025, 0.294489, 0.266614, 0.228788, 0.315049, 0.372205, 0.36936, 0.32246, 0.264562, 0.314046, 0.303607, 0.257855, 0.306093, 0.240684, 0.259142, 0.327993, 0.308668, 0.310809, 0.237232, 0.274651, 0.304109 ]
							}
, 							{
								"key" : 82,
								"value" : [ 0.432701, 0.54694, 0.6549, 0.572621, 0.625795, 0.575858, 0.491132, 0.487663, 0.428493, 0.408134, 0.365254, 0.334866, 0.385098, 0.357604, 0.365949, 0.326445, 0.30798, 0.369117, 0.271545, 0.320089, 0.256802, 0.406266, 0.395268, 0.446989, 0.395747, 0.30086, 0.370187, 0.281328, 0.36478, 0.369109, 0.372872, 0.257775, 0.184987, 0.173415, 0.186609, 0.123566, 0.280658, 0.344228, 0.347916, 0.319694, 0.295579, 0.219345, 0.247183, 0.177532, 0.21558, 0.217553, 0.245197, 0.292805, 0.31629, 0.296477, 0.293491, 0.325062, 0.276403, 0.320776, 0.327438, 0.310317, 0.304732, 0.253809, 0.307925, 0.338686, 0.296023, 0.291269, 0.312558, 0.300222 ]
							}
, 							{
								"key" : 83,
								"value" : [ 0.247439, 0.556685, 0.657085, 0.608149, 0.596484, 0.554301, 0.435562, 0.427157, 0.308606, 0.270899, 0.367027, 0.347806, 0.341339, 0.377777, 0.288185, 0.29569, 0.186829, 0.249149, 0.313327, 0.407716, 0.38242, 0.362215, 0.316448, 0.217099, 0.282052, 0.324516, 0.253879, 0.267611, 0.255563, 0.307792, 0.336076, 0.300266, 0.286447, 0.298979, 0.306238, 0.241094, 0.30156, 0.355811, 0.324255, 0.163517, 0.198524, 0.189565, 0.128651, 0.179082, 0.063737, 0.158052, 0.169563, 0.207285, 0.252961, 0.364124, 0.328988, 0.337426, 0.26822, 0.357465, 0.355498, 0.346606, 0.353592, 0.373327, 0.303805, 0.324537, 0.282925, 0.337171, 0.245194, 0.191182 ]
							}
, 							{
								"key" : 84,
								"value" : [ 0.451125, 0.527372, 0.657103, 0.615562, 0.562798, 0.554313, 0.453683, 0.437267, 0.321559, 0.253011, 0.212652, 0.318813, 0.283781, 0.357027, 0.307865, 0.294333, 0.24557, 0.293382, 0.364091, 0.408588, 0.386588, 0.319105, 0.356016, 0.239086, 0.270355, 0.284376, 0.335516, 0.281348, 0.336878, 0.268988, 0.335468, 0.319809, 0.258594, 0.290031, 0.327835, 0.316933, 0.243885, 0.285954, 0.308203, 0.300085, 0.249463, 0.218163, 0.184476, 0.080351, 0.157187, 0.167001, 0.191263, 0.18712, 0.261746, 0.360733, 0.369156, 0.331705, 0.328904, 0.260803, 0.26885, 0.293553, 0.352515, 0.308009, 0.189999, 0.241184, 0.234312, 0.19711, 0.131774, 0.239072 ]
							}
, 							{
								"key" : 85,
								"value" : [ 0.447436, 0.524322, 0.65695, 0.617621, 0.590914, 0.569923, 0.393309, 0.440667, 0.279364, 0.32571, 0.300766, 0.333669, 0.3034, 0.366848, 0.316302, 0.2357, 0.218595, 0.325039, 0.303501, 0.383584, 0.36417, 0.330532, 0.37822, 0.263432, 0.279233, 0.275151, 0.331875, 0.24112, 0.336136, 0.34315, 0.349589, 0.296952, 0.27975, 0.273618, 0.181691, 0.266991, 0.289653, 0.290055, 0.322871, 0.288866, 0.236644, 0.180035, 0.186528, 0.131035, 0.149767, 0.137417, 0.089158, 0.298735, 0.310694, 0.345246, 0.372536, 0.311169, 0.275459, 0.269453, 0.185478, 0.361229, 0.297361, 0.301655, 0.29111, 0.271403, 0.304536, 0.311437, 0.231861, 0.312221 ]
							}
, 							{
								"key" : 86,
								"value" : [ 0.455254, 0.534336, 0.660494, 0.626921, 0.583245, 0.574284, 0.340938, 0.447077, 0.286293, 0.31262, 0.309186, 0.316238, 0.336835, 0.379214, 0.358262, 0.21492, 0.258551, 0.327214, 0.329777, 0.308788, 0.327698, 0.335367, 0.388765, 0.331322, 0.27484, 0.251546, 0.197917, 0.250993, 0.38292, 0.395787, 0.306724, 0.298351, 0.33503, 0.311644, 0.281312, 0.308039, 0.296467, 0.296818, 0.29041, 0.295137, 0.2436, 0.16294, 0.207697, 0.184889, 0.087925, 0.171625, 0.201442, 0.188594, 0.247948, 0.342922, 0.331733, 0.335382, 0.265999, 0.36296, 0.379187, 0.317511, 0.332224, 0.326992, 0.352987, 0.367424, 0.327812, 0.310211, 0.282375, 0.201727 ]
							}
, 							{
								"key" : 87,
								"value" : [ 0.511243, 0.526844, 0.672944, 0.644378, 0.556563, 0.586099, 0.330499, 0.425766, 0.360005, 0.266407, 0.268541, 0.322912, 0.29422, 0.359259, 0.37867, 0.238884, 0.304741, 0.337153, 0.408569, 0.379715, 0.297861, 0.276312, 0.296856, 0.259421, 0.169825, 0.184893, 0.266848, 0.293811, 0.331782, 0.343161, 0.287861, 0.247814, 0.31489, 0.214191, 0.299677, 0.288256, 0.269401, 0.244892, 0.302476, 0.219894, 0.255602, 0.252254, 0.099253, 0.122357, 0.130532, 0.095891, 0.163776, 0.228381, 0.232964, 0.329565, 0.362399, 0.317112, 0.330005, 0.278984, 0.344782, 0.293239, 0.352606, 0.356118, 0.268021, 0.343824, 0.13466, 0.350237, 0.184847, 0.237678 ]
							}
, 							{
								"key" : 88,
								"value" : [ 0.389598, 0.548518, 0.680694, 0.648708, 0.593399, 0.585711, 0.360993, 0.470291, 0.340744, 0.261073, 0.204588, 0.319927, 0.332272, 0.318935, 0.351677, 0.32395, 0.356896, 0.380594, 0.433439, 0.357042, 0.32102, 0.304565, 0.346119, 0.359522, 0.279869, 0.280192, 0.26689, 0.302792, 0.338803, 0.359128, 0.320103, 0.241047, 0.283653, 0.300513, 0.259684, 0.267973, 0.342027, 0.217465, 0.337943, 0.350206, 0.274471, 0.205063, 0.201959, 0.144171, 0.160944, 0.189261, 0.149473, 0.188526, 0.258765, 0.249039, 0.309972, 0.271279, 0.305228, 0.349956, 0.340659, 0.359639, 0.363164, 0.336903, 0.288269, 0.302938, 0.321399, 0.321514, 0.22789, 0.33285 ]
							}
, 							{
								"key" : 89,
								"value" : [ 0.416952, 0.557268, 0.690229, 0.653185, 0.593432, 0.587152, 0.297552, 0.468177, 0.308187, 0.32254, 0.24467, 0.333876, 0.347685, 0.345952, 0.287215, 0.376304, 0.410541, 0.384491, 0.443546, 0.367705, 0.354576, 0.33281, 0.338841, 0.334552, 0.268447, 0.302392, 0.244202, 0.284897, 0.298396, 0.323215, 0.325925, 0.298333, 0.227386, 0.25829, 0.28394, 0.274547, 0.336804, 0.302218, 0.362821, 0.340008, 0.267151, 0.108898, 0.195443, 0.155654, 0.109524, 0.23735, 0.246626, 0.234976, 0.291287, 0.3726, 0.356966, 0.295342, 0.34683, 0.36032, 0.293902, 0.365688, 0.245346, 0.3282, 0.358844, 0.381132, 0.327653, 0.332654, 0.347221, 0.247909 ]
							}
, 							{
								"key" : 90,
								"value" : [ 0.410594, 0.530137, 0.699701, 0.670092, 0.574435, 0.60341, 0.357908, 0.464535, 0.352941, 0.312461, 0.264827, 0.358699, 0.346162, 0.342911, 0.374512, 0.349494, 0.420346, 0.375361, 0.415292, 0.393524, 0.291399, 0.297319, 0.31108, 0.310309, 0.30687, 0.14626, 0.328083, 0.377021, 0.311812, 0.220767, 0.327599, 0.27284, 0.327512, 0.260295, 0.320669, 0.366562, 0.288002, 0.342193, 0.351564, 0.296405, 0.221807, 0.184421, 0.190159, 0.060147, 0.14302, 0.165007, 0.216163, 0.211536, 0.400239, 0.452013, 0.379313, 0.335535, 0.314306, 0.327415, 0.364626, 0.293533, 0.327867, 0.358521, 0.25349, 0.302417, 0.321901, 0.213674, 0.291521, 0.236477 ]
							}
, 							{
								"key" : 91,
								"value" : [ 0.297178, 0.532507, 0.693914, 0.671861, 0.580197, 0.584851, 0.541257, 0.597929, 0.543148, 0.427255, 0.397191, 0.465391, 0.499072, 0.446814, 0.440373, 0.450959, 0.552557, 0.512596, 0.382258, 0.457267, 0.375596, 0.422867, 0.3286, 0.246068, 0.296125, 0.339193, 0.33733, 0.368422, 0.338517, 0.374416, 0.356299, 0.361856, 0.273864, 0.332974, 0.228335, 0.311305, 0.254427, 0.371593, 0.359795, 0.225777, 0.262515, 0.270622, 0.286823, 0.301272, 0.195298, 0.231386, 0.351602, 0.366173, 0.370648, 0.348863, 0.315757, 0.361281, 0.349826, 0.354431, 0.355249, 0.41252, 0.42178, 0.385765, 0.383394, 0.372297, 0.32563, 0.29128, 0.335961, 0.275026 ]
							}
, 							{
								"key" : 92,
								"value" : [ 0.050385, 0.512281, 0.689688, 0.671341, 0.580345, 0.587835, 0.504413, 0.564658, 0.50442, 0.349067, 0.390971, 0.406151, 0.470128, 0.418104, 0.477947, 0.367056, 0.328708, 0.421958, 0.360453, 0.409993, 0.382619, 0.387799, 0.39842, 0.307981, 0.312663, 0.276068, 0.302197, 0.339789, 0.365455, 0.345184, 0.350972, 0.276247, 0.268071, 0.292806, 0.310029, 0.285287, 0.226024, 0.208852, 0.194685, 0.234038, 0.17618, 0.223967, 0.208368, 0.203264, 0.351845, 0.368971, 0.308486, 0.308811, 0.32212, 0.299245, 0.333003, 0.275146, 0.333255, 0.333743, 0.274287, 0.351778, 0.305529, 0.363822, 0.332031, 0.242876, 0.322163, 0.310283, 0.308064, 0.280489 ]
							}
, 							{
								"key" : 93,
								"value" : [ 0.494628, 0.452255, 0.699581, 0.681407, 0.572057, 0.624864, 0.473207, 0.398326, 0.402199, 0.396787, 0.370141, 0.386584, 0.475531, 0.345128, 0.367779, 0.328422, 0.34384, 0.347919, 0.28287, 0.369971, 0.324832, 0.377482, 0.38966, 0.176687, 0.343514, 0.26247, 0.379031, 0.381639, 0.240412, 0.371236, 0.343445, 0.369997, 0.30202, 0.326237, 0.244456, 0.297486, 0.311391, 0.220668, 0.134594, 0.14215, 0.180634, 0.209512, 0.144082, 0.231213, 0.244676, 0.331787, 0.364573, 0.280151, 0.30301, 0.293217, 0.259358, 0.274936, 0.304201, 0.30183, 0.304951, 0.357673, 0.325934, 0.383698, 0.376711, 0.340421, 0.370151, 0.321052, 0.295291, 0.296883 ]
							}
, 							{
								"key" : 94,
								"value" : [ 0.405169, 0.50486, 0.698819, 0.683206, 0.580189, 0.630271, 0.492072, 0.427714, 0.428374, 0.422486, 0.433463, 0.439938, 0.484688, 0.373492, 0.351978, 0.334037, 0.324562, 0.325336, 0.279342, 0.377574, 0.31588, 0.367756, 0.341657, 0.339401, 0.355997, 0.130439, 0.353885, 0.175701, 0.379791, 0.385607, 0.233149, 0.343995, 0.142145, 0.349526, 0.28574, 0.304918, 0.33997, 0.27189, 0.126108, 0.121579, 0.158807, 0.16011, 0.240629, 0.257938, 0.175943, 0.219212, 0.2747, 0.339446, 0.32563, 0.207782, 0.307477, 0.176246, 0.298959, 0.325903, 0.214557, 0.233613, 0.241442, 0.397989, 0.388505, 0.343419, 0.380176, 0.30565, 0.337456, 0.311955 ]
							}
, 							{
								"key" : 95,
								"value" : [ 0.403097, 0.506888, 0.703554, 0.69288, 0.585675, 0.615354, 0.490984, 0.483027, 0.421613, 0.371049, 0.350301, 0.407711, 0.455737, 0.406658, 0.295609, 0.351, 0.277047, 0.36734, 0.29872, 0.391317, 0.338037, 0.381517, 0.395421, 0.309583, 0.347468, 0.320768, 0.344048, 0.304595, 0.325105, 0.330239, 0.306971, 0.183791, 0.219016, 0.314372, 0.327294, 0.243286, 0.325703, 0.281962, 0.171911, 0.207851, 0.170196, 0.145907, 0.197209, 0.229941, 0.228239, 0.320692, 0.346291, 0.266529, 0.298939, 0.224575, 0.301049, 0.323452, 0.330226, 0.323727, 0.306812, 0.299943, 0.267816, 0.384248, 0.396473, 0.352451, 0.333578, 0.353442, 0.316485, 0.320964 ]
							}
, 							{
								"key" : 96,
								"value" : [ 0.321045, 0.468412, 0.703258, 0.694568, 0.585404, 0.622518, 0.507631, 0.497198, 0.410179, 0.369862, 0.35956, 0.399284, 0.47632, 0.439615, 0.342484, 0.323144, 0.249827, 0.394283, 0.380816, 0.372934, 0.356037, 0.361714, 0.394426, 0.312648, 0.306476, 0.333795, 0.354928, 0.346395, 0.356148, 0.33379, 0.278514, 0.285128, 0.188504, 0.284816, 0.294694, 0.346475, 0.343102, 0.232535, 0.066154, 0.121514, 0.117254, 0.165769, 0.160406, 0.203268, 0.270402, 0.345424, 0.329672, 0.165225, 0.160759, 0.290059, 0.273666, 0.206515, 0.23829, 0.323515, 0.263516, 0.304528, 0.32159, 0.352668, 0.385795, 0.34527, 0.343503, 0.338438, 0.251172, 0.236423 ]
							}
, 							{
								"key" : 97,
								"value" : [ 0.491677, 0.423879, 0.699755, 0.692811, 0.574996, 0.630918, 0.527134, 0.506432, 0.447877, 0.411545, 0.470035, 0.348478, 0.492738, 0.443895, 0.385833, 0.253297, 0.231979, 0.353141, 0.355516, 0.299598, 0.331263, 0.310613, 0.361275, 0.297291, 0.322214, 0.315111, 0.324056, 0.34559, 0.341213, 0.398568, 0.3423, 0.202556, 0.288975, 0.285212, 0.35787, 0.327511, 0.303983, 0.247726, 0.216424, 0.132948, 0.162422, 0.172469, 0.213777, 0.244791, 0.308951, 0.289075, 0.390715, 0.335953, 0.29188, 0.319097, 0.28482, 0.327879, 0.348708, 0.335818, 0.303483, 0.340042, 0.244505, 0.349653, 0.386363, 0.364023, 0.251275, 0.335359, 0.286004, 0.144801 ]
							}
, 							{
								"key" : 98,
								"value" : [ 0.479678, 0.434069, 0.701863, 0.70518, 0.511078, 0.620528, 0.592906, 0.507052, 0.528867, 0.485506, 0.479864, 0.501587, 0.492035, 0.47079, 0.486366, 0.500354, 0.493376, 0.48249, 0.485844, 0.474275, 0.469861, 0.473782, 0.46699, 0.473943, 0.460831, 0.473264, 0.462318, 0.471909, 0.482418, 0.43497, 0.469689, 0.449595, 0.435877, 0.434935, 0.421965, 0.411595, 0.394051, 0.413267, 0.415724, 0.410313, 0.403408, 0.400011, 0.392251, 0.390931, 0.390656, 0.402719, 0.367453, 0.369924, 0.369622, 0.330492, 0.317343, 0.34492, 0.281694, 0.339855, 0.379709, 0.369, 0.378003, 0.342934, 0.403798, 0.402245, 0.360251, 0.390944, 0.384541, 0.385331 ]
							}
, 							{
								"key" : 99,
								"value" : [ 0.476941, 0.388995, 0.682029, 0.691606, 0.496987, 0.605193, 0.55288, 0.626833, 0.642536, 0.503364, 0.561513, 0.511448, 0.459244, 0.460387, 0.341932, 0.313681, 0.342384, 0.352045, 0.398902, 0.345254, 0.299032, 0.279134, 0.312714, 0.35545, 0.331795, 0.338162, 0.356767, 0.332499, 0.406468, 0.376535, 0.299791, 0.317511, 0.233804, 0.22725, 0.26944, 0.293861, 0.233022, 0.164849, 0.222135, 0.15657, 0.231432, 0.231865, 0.224881, 0.288598, 0.120637, 0.364169, 0.375653, 0.298197, 0.313548, 0.233329, 0.240823, 0.253788, 0.231089, 0.237261, 0.261432, 0.206046, 0.21509, 0.218886, 0.278711, 0.17513, 0.200847, 0.254011, 0.226561, 0.220525 ]
							}
, 							{
								"key" : 100,
								"value" : [ 0.484218, 0.435326, 0.679839, 0.689149, 0.52779, 0.619411, 0.580086, 0.643449, 0.676162, 0.545577, 0.55765, 0.543387, 0.453715, 0.50034, 0.403872, 0.400788, 0.369446, 0.301496, 0.416937, 0.338545, 0.317525, 0.331398, 0.269164, 0.316702, 0.307847, 0.293058, 0.355861, 0.253995, 0.392371, 0.387882, 0.306567, 0.359334, 0.284249, 0.260854, 0.213484, 0.18839, 0.312676, 0.254602, 0.207226, 0.233557, 0.171147, 0.268892, 0.248665, 0.250438, 0.29757, 0.309478, 0.293074, 0.304904, 0.302975, 0.316205, 0.288729, 0.227643, 0.143019, 0.230331, 0.180647, 0.250804, 0.281546, 0.222059, 0.184282, 0.190565, 0.170795, 0.225917, 0.199477, 0.240925 ]
							}
, 							{
								"key" : 101,
								"value" : [ 0.501872, 0.401811, 0.675492, 0.682296, 0.546447, 0.628646, 0.574284, 0.654924, 0.686261, 0.553255, 0.539544, 0.533241, 0.412814, 0.466135, 0.336372, 0.370807, 0.376549, 0.371041, 0.414733, 0.345521, 0.251403, 0.314833, 0.294449, 0.354688, 0.285394, 0.318988, 0.323875, 0.322329, 0.376273, 0.373907, 0.282828, 0.316816, 0.188709, 0.17846, 0.294758, 0.233468, 0.324063, 0.270686, 0.248606, 0.266306, 0.238482, 0.260984, 0.20978, 0.281695, 0.259945, 0.296225, 0.360363, 0.314766, 0.251178, 0.268579, 0.177558, 0.220901, 0.197103, 0.125432, 0.096917, 0.1007, 0.210677, 0.219303, 0.234813, 0.258013, 0.291765, 0.232184, 0.21719, 0.216809 ]
							}
, 							{
								"key" : 102,
								"value" : [ 0.300489, 0.434486, 0.673931, 0.676926, 0.545807, 0.630077, 0.548405, 0.658399, 0.678122, 0.507418, 0.538166, 0.463464, 0.375271, 0.439656, 0.34974, 0.344253, 0.362554, 0.342984, 0.384509, 0.195803, 0.276346, 0.282057, 0.290617, 0.325257, 0.093282, 0.305521, 0.308128, 0.323959, 0.372516, 0.334064, 0.292953, 0.265154, 0.175386, 0.240243, 0.258625, 0.283917, 0.175099, 0.282667, 0.288595, 0.287814, 0.252959, 0.174645, 0.203569, 0.295529, 0.227174, 0.328797, 0.36148, 0.241625, 0.321853, 0.273284, 0.223423, 0.219591, 0.114008, 0.217605, 0.231185, 0.300214, 0.331846, 0.241782, 0.249143, 0.187215, 0.220878, 0.205499, 0.244869, 0.236723 ]
							}
, 							{
								"key" : 103,
								"value" : [ 0.473506, 0.389399, 0.670266, 0.672411, 0.53287, 0.631495, 0.54519, 0.658826, 0.675748, 0.483653, 0.557153, 0.519694, 0.478887, 0.509823, 0.320745, 0.378169, 0.326813, 0.363762, 0.409634, 0.331916, 0.28834, 0.257621, 0.319645, 0.32421, 0.264665, 0.287876, 0.218508, 0.327776, 0.365701, 0.281972, 0.257798, 0.264737, 0.217338, 0.267148, 0.308569, 0.234328, 0.133344, 0.170412, 0.27289, 0.18632, 0.227387, 0.22415, 0.287363, 0.279302, 0.157937, 0.262879, 0.264991, 0.345251, 0.304359, 0.166487, 0.221976, 0.19877, 0.176827, 0.150161, 0.168957, 0.297554, 0.22588, 0.249608, 0.167386, 0.214458, 0.277942, 0.237906, 0.169648, 0.2697 ]
							}
, 							{
								"key" : 104,
								"value" : [ 0.469866, 0.387002, 0.669619, 0.674998, 0.538377, 0.6319, 0.550471, 0.652191, 0.671126, 0.493659, 0.543719, 0.485434, 0.478457, 0.516332, 0.356284, 0.380379, 0.324361, 0.365405, 0.40087, 0.274755, 0.298003, 0.304151, 0.247131, 0.306261, 0.231867, 0.335782, 0.320717, 0.312401, 0.387211, 0.343991, 0.224331, 0.221366, 0.208991, 0.286169, 0.23969, 0.229451, 0.263523, 0.25215, 0.237679, 0.221237, 0.218088, 0.227484, 0.155869, 0.174376, 0.188054, 0.315339, 0.333169, 0.270284, 0.34498, 0.288251, 0.270716, 0.250316, 0.188627, 0.176506, 0.066123, 0.26597, 0.306067, 0.232498, 0.267336, 0.255482, 0.194186, 0.184413, 0.277569, 0.22061 ]
							}
, 							{
								"key" : 105,
								"value" : [ 0.415298, 0.404352, 0.669991, 0.678933, 0.539296, 0.640931, 0.572165, 0.649763, 0.67674, 0.509535, 0.540612, 0.517413, 0.462697, 0.536095, 0.428571, 0.403247, 0.341045, 0.348488, 0.412478, 0.272578, 0.320372, 0.240772, 0.207992, 0.322173, 0.123355, 0.323349, 0.313675, 0.26191, 0.324179, 0.28229, 0.286923, 0.238988, 0.214563, 0.318343, 0.310773, 0.266498, 0.269265, 0.232453, 0.287502, 0.16738, 0.224831, 0.259692, 0.158617, 0.273554, 0.186808, 0.273463, 0.376414, 0.343697, 0.308767, 0.238279, 0.275003, 0.280555, 0.177933, 0.191991, 0.154141, 0.154409, 0.300494, 0.327931, 0.326467, 0.345902, 0.245647, 0.279739, 0.292844, 0.257407 ]
							}
, 							{
								"key" : 106,
								"value" : [ 0.435457, 0.419254, 0.664971, 0.67645, 0.520984, 0.635086, 0.582459, 0.648076, 0.676734, 0.516227, 0.524096, 0.484821, 0.50259, 0.563074, 0.457808, 0.345415, 0.385548, 0.370425, 0.451949, 0.361126, 0.253395, 0.298607, 0.264875, 0.337113, 0.287414, 0.297937, 0.333583, 0.320563, 0.357013, 0.310073, 0.210998, 0.236308, 0.230156, 0.363183, 0.357941, 0.234391, 0.265123, 0.238793, 0.279457, 0.30474, 0.2541, 0.275191, 0.231064, 0.174059, 0.283203, 0.332978, 0.337162, 0.265588, 0.25631, 0.307389, 0.29078, 0.247558, 0.261645, 0.160431, 0.173111, 0.210293, 0.314486, 0.363875, 0.349518, 0.402361, 0.372755, 0.325448, 0.293409, 0.180451 ]
							}
, 							{
								"key" : 107,
								"value" : [ 0.457181, 0.413176, 0.668295, 0.677442, 0.524993, 0.626373, 0.576795, 0.651114, 0.670136, 0.450192, 0.521855, 0.459836, 0.491059, 0.555695, 0.505965, 0.463527, 0.400436, 0.374747, 0.441882, 0.331065, 0.3422, 0.318817, 0.307938, 0.27845, 0.223823, 0.363563, 0.356379, 0.281797, 0.370544, 0.319003, 0.270475, 0.24735, 0.334128, 0.380422, 0.296542, 0.22101, 0.274028, 0.30102, 0.279107, 0.247301, 0.243202, 0.254801, 0.235315, 0.230095, 0.222032, 0.257664, 0.354423, 0.29935, 0.337743, 0.307679, 0.252443, 0.25832, 0.222016, 0.063727, 0.251655, 0.235632, 0.264484, 0.32269, 0.333804, 0.367807, 0.265895, 0.3238, 0.356875, 0.282037 ]
							}
, 							{
								"key" : 108,
								"value" : [ 0.479781, 0.464034, 0.665895, 0.675383, 0.533148, 0.623966, 0.582546, 0.64823, 0.671208, 0.516488, 0.517993, 0.478362, 0.457207, 0.482623, 0.432526, 0.500857, 0.46591, 0.448974, 0.489055, 0.382643, 0.248601, 0.258315, 0.103976, 0.302231, 0.275832, 0.338308, 0.372923, 0.299499, 0.385946, 0.338926, 0.306722, 0.325114, 0.320026, 0.359036, 0.279809, 0.228057, 0.278185, 0.237133, 0.305635, 0.277981, 0.287391, 0.293243, 0.231974, 0.207453, 0.269303, 0.32449, 0.342168, 0.184891, 0.286968, 0.279564, 0.246154, 0.27036, 0.217675, 0.222062, 0.234159, 0.203096, 0.251351, 0.308437, 0.360329, 0.398076, 0.340992, 0.34716, 0.341374, 0.322627 ]
							}
, 							{
								"key" : 109,
								"value" : [ 0.468768, 0.410884, 0.667443, 0.674764, 0.524626, 0.61606, 0.56029, 0.653316, 0.665318, 0.456365, 0.495855, 0.445521, 0.457257, 0.453685, 0.345967, 0.513552, 0.485584, 0.480013, 0.515307, 0.39118, 0.300707, 0.333505, 0.319639, 0.32661, 0.271668, 0.358865, 0.342142, 0.337905, 0.394379, 0.36354, 0.323058, 0.371811, 0.309463, 0.341866, 0.290531, 0.26792, 0.270539, 0.294765, 0.310904, 0.267394, 0.254609, 0.162397, 0.218055, 0.261196, 0.270674, 0.308435, 0.266779, 0.331707, 0.347452, 0.329473, 0.306916, 0.207157, 0.192359, 0.225288, 0.219137, 0.271036, 0.305415, 0.29138, 0.35436, 0.323998, 0.355768, 0.381717, 0.307481, 0.293592 ]
							}
, 							{
								"key" : 110,
								"value" : [ 0.485385, 0.436355, 0.670269, 0.679851, 0.552671, 0.624479, 0.580394, 0.646941, 0.673306, 0.51371, 0.406078, 0.446094, 0.459688, 0.468971, 0.367127, 0.484523, 0.481682, 0.503591, 0.542529, 0.449492, 0.382138, 0.346695, 0.292038, 0.367045, 0.33293, 0.341906, 0.384818, 0.289495, 0.300149, 0.277414, 0.338792, 0.379603, 0.320387, 0.384634, 0.30893, 0.269775, 0.224232, 0.229191, 0.241669, 0.252613, 0.225938, 0.255529, 0.197561, 0.286233, 0.319317, 0.23678, 0.337348, 0.249487, 0.322381, 0.358717, 0.328335, 0.200277, 0.172221, 0.214104, 0.231113, 0.253441, 0.285838, 0.341495, 0.307495, 0.409886, 0.365459, 0.387419, 0.401288, 0.351852 ]
							}
, 							{
								"key" : 111,
								"value" : [ 0.491325, 0.382141, 0.670818, 0.675272, 0.534203, 0.623464, 0.566464, 0.648523, 0.674236, 0.513664, 0.44972, 0.457626, 0.418168, 0.47934, 0.316839, 0.410912, 0.433963, 0.533114, 0.586494, 0.495925, 0.358997, 0.363958, 0.297146, 0.407877, 0.280416, 0.398773, 0.396103, 0.372016, 0.441423, 0.371059, 0.387527, 0.429985, 0.404035, 0.390332, 0.325132, 0.210969, 0.280528, 0.239174, 0.267957, 0.239095, 0.24891, 0.211453, 0.224385, 0.274711, 0.26735, 0.260923, 0.241576, 0.273108, 0.256345, 0.183568, 0.245631, 0.224681, 0.16968, 0.075401, 0.122417, 0.238964, 0.301896, 0.276197, 0.35901, 0.313583, 0.406158, 0.452246, 0.320449, 0.363221 ]
							}
, 							{
								"key" : 112,
								"value" : [ 0.359479, 0.460649, 0.673485, 0.682411, 0.526995, 0.616859, 0.550986, 0.630927, 0.666493, 0.513483, 0.423676, 0.451391, 0.426491, 0.416092, 0.363313, 0.394, 0.433365, 0.52183, 0.608513, 0.54778, 0.464601, 0.443825, 0.347189, 0.41511, 0.321215, 0.405614, 0.433555, 0.368077, 0.425764, 0.408081, 0.393206, 0.443841, 0.353334, 0.302576, 0.32445, 0.235941, 0.316913, 0.169329, 0.31075, 0.327624, 0.154617, 0.292754, 0.186175, 0.223956, 0.303831, 0.300981, 0.315772, 0.349992, 0.347374, 0.258037, 0.238795, 0.196965, 0.193113, 0.162516, 0.187426, 0.131474, 0.231711, 0.268795, 0.32265, 0.286895, 0.38559, 0.386132, 0.300086, 0.326052 ]
							}
, 							{
								"key" : 113,
								"value" : [ 0.449142, 0.459751, 0.680574, 0.693853, 0.521719, 0.614268, 0.51941, 0.613008, 0.663688, 0.543979, 0.404884, 0.473668, 0.417139, 0.370905, 0.298312, 0.367451, 0.462225, 0.449344, 0.560651, 0.518652, 0.439851, 0.522276, 0.473986, 0.39975, 0.337731, 0.344878, 0.457916, 0.430086, 0.441058, 0.393854, 0.387397, 0.447058, 0.41494, 0.391614, 0.317192, 0.315778, 0.27769, 0.326753, 0.308031, 0.282393, 0.265312, 0.345798, 0.285495, 0.269268, 0.296423, 0.309404, 0.371717, 0.401606, 0.416345, 0.371601, 0.269298, 0.197281, 0.189381, 0.115343, 0.250228, 0.239448, 0.343527, 0.391692, 0.308327, 0.339942, 0.39145, 0.374712, 0.333175, 0.32047 ]
							}
, 							{
								"key" : 114,
								"value" : [ 0.413025, 0.473822, 0.687063, 0.70098, 0.446749, 0.595646, 0.534077, 0.621043, 0.656827, 0.524822, 0.467807, 0.418774, 0.430501, 0.417214, 0.326688, 0.364357, 0.402263, 0.329768, 0.441339, 0.344252, 0.514574, 0.584861, 0.502828, 0.455218, 0.438306, 0.32144, 0.403624, 0.409549, 0.426357, 0.455178, 0.34985, 0.442415, 0.46567, 0.299353, 0.285966, 0.302215, 0.280776, 0.213403, 0.324232, 0.28097, 0.245942, 0.350537, 0.259067, 0.292001, 0.284996, 0.322645, 0.40468, 0.37952, 0.250887, 0.303198, 0.243029, 0.267995, 0.336477, 0.249311, 0.370311, 0.363207, 0.358816, 0.288392, 0.328619, 0.280674, 0.320567, 0.254462, 0.142294, 0.078832 ]
							}
, 							{
								"key" : 115,
								"value" : [ 0.47072, 0.41516, 0.696599, 0.688205, 0.595967, 0.58084, 0.541945, 0.572497, 0.571813, 0.472511, 0.403837, 0.418373, 0.415944, 0.406012, 0.293073, 0.390502, 0.386408, 0.398287, 0.444281, 0.362193, 0.484162, 0.472668, 0.491065, 0.509472, 0.500531, 0.337565, 0.418081, 0.484482, 0.504534, 0.455818, 0.372165, 0.386452, 0.375262, 0.389566, 0.372624, 0.452381, 0.422683, 0.390318, 0.413398, 0.371014, 0.263162, 0.293542, 0.252347, 0.291085, 0.238209, 0.189682, 0.219295, 0.182085, 0.31625, 0.229466, 0.373391, 0.406068, 0.319266, 0.417746, 0.355342, 0.349654, 0.337116, 0.24448, 0.240532, 0.299919, 0.306986, 0.298907, 0.257332, 0.254387 ]
							}
, 							{
								"key" : 116,
								"value" : [ 0.47412, 0.516548, 0.721438, 0.746968, 0.579567, 0.592054, 0.540737, 0.410845, 0.414198, 0.38522, 0.37579, 0.392501, 0.363077, 0.371498, 0.318498, 0.247551, 0.297601, 0.228692, 0.345109, 0.330408, 0.288107, 0.377474, 0.407034, 0.353426, 0.368508, 0.362165, 0.301806, 0.250393, 0.283804, 0.347056, 0.386019, 0.307568, 0.30974, 0.266285, 0.292143, 0.364591, 0.36645, 0.194814, 0.250147, 0.076784, 0.170411, 0.132306, 0.064125, 0.129289, 0.056719, 0.22477, 0.069721, 0.237368, 0.281156, 0.337677, 0.383999, 0.365332, 0.409026, 0.373927, 0.428865, 0.419294, 0.219425, 0.392451, 0.401693, 0.370542, 0.346733, 0.355042, 0.327747, 0.223726 ]
							}
, 							{
								"key" : 117,
								"value" : [ 0.52864, 0.561709, 0.717283, 0.767643, 0.649803, 0.530765, 0.562017, 0.447522, 0.430728, 0.403343, 0.334843, 0.467033, 0.438467, 0.377249, 0.378238, 0.268201, 0.293993, 0.302664, 0.272737, 0.252662, 0.265796, 0.349849, 0.450101, 0.421581, 0.362873, 0.370637, 0.39125, 0.329999, 0.37205, 0.388831, 0.368321, 0.36825, 0.275813, 0.281038, 0.305698, 0.121479, 0.288253, 0.233477, 0.16653, 0.259065, 0.197199, 0.19121, 0.164581, 0.134857, 0.190388, 0.231259, 0.247958, 0.192813, 0.312605, 0.365057, 0.404505, 0.41091, 0.397462, 0.361157, 0.300746, 0.285109, 0.356047, 0.352331, 0.282557, 0.325537, 0.330872, 0.242, 0.205197, 0.20966 ]
							}
, 							{
								"key" : 118,
								"value" : [ 0.537141, 0.552837, 0.653048, 0.751413, 0.6702, 0.606356, 0.653649, 0.635381, 0.416692, 0.598233, 0.581761, 0.361794, 0.476015, 0.49324, 0.198686, 0.418556, 0.42578, 0.342387, 0.275466, 0.427353, 0.36405, 0.272459, 0.410201, 0.417259, 0.433708, 0.522768, 0.505843, 0.465146, 0.501266, 0.4493, 0.422325, 0.456733, 0.430354, 0.382009, 0.475695, 0.468284, 0.411995, 0.44137, 0.493023, 0.383396, 0.372428, 0.415133, 0.362756, 0.43461, 0.40305, 0.364038, 0.369916, 0.418264, 0.430969, 0.405131, 0.382296, 0.442604, 0.394633, 0.426441, 0.308948, 0.396412, 0.394057, 0.374704, 0.31192, 0.324144, 0.25839, 0.27887, 0.25111, 0.206711 ]
							}
, 							{
								"key" : 119,
								"value" : [ 0.524301, 0.51601, 0.600293, 0.75594, 0.727077, 0.561774, 0.680758, 0.693589, 0.552275, 0.595759, 0.648528, 0.550108, 0.488794, 0.488812, 0.480887, 0.385781, 0.426388, 0.438999, 0.257657, 0.484234, 0.511506, 0.408782, 0.395912, 0.49724, 0.455733, 0.498342, 0.561475, 0.48785, 0.416443, 0.428248, 0.486248, 0.399425, 0.428623, 0.476128, 0.4457, 0.462324, 0.550542, 0.467126, 0.409005, 0.447994, 0.42955, 0.358131, 0.363382, 0.402662, 0.360841, 0.365704, 0.411747, 0.428422, 0.403117, 0.501471, 0.445849, 0.406168, 0.380048, 0.344607, 0.3361, 0.310231, 0.403395, 0.356417, 0.397604, 0.374448, 0.275383, 0.254285, 0.344306, 0.237216 ]
							}
, 							{
								"key" : 120,
								"value" : [ 0.47791, 0.47825, 0.574055, 0.754536, 0.728945, 0.495531, 0.676404, 0.710459, 0.523462, 0.571241, 0.663762, 0.585462, 0.464895, 0.427186, 0.434068, 0.379978, 0.355392, 0.399188, 0.337081, 0.409333, 0.477261, 0.412644, 0.25146, 0.42648, 0.448727, 0.521334, 0.572411, 0.550991, 0.431244, 0.42842, 0.462677, 0.435656, 0.419298, 0.484786, 0.490305, 0.45054, 0.511141, 0.498287, 0.379244, 0.391948, 0.437328, 0.359872, 0.332917, 0.42659, 0.404792, 0.321586, 0.438262, 0.463622, 0.384837, 0.421245, 0.355842, 0.300313, 0.338717, 0.30116, 0.331098, 0.268093, 0.348292, 0.400433, 0.395205, 0.43806, 0.453283, 0.386374, 0.307531, 0.32343 ]
							}
, 							{
								"key" : 121,
								"value" : [ 0.51941, 0.491457, 0.579407, 0.752694, 0.728869, 0.564497, 0.676047, 0.693496, 0.543529, 0.569876, 0.654722, 0.571396, 0.424, 0.466789, 0.391115, 0.291531, 0.378571, 0.33177, 0.350578, 0.339652, 0.42034, 0.323368, 0.339416, 0.440763, 0.432935, 0.484455, 0.497194, 0.477529, 0.32994, 0.383758, 0.481183, 0.402549, 0.427507, 0.491939, 0.48508, 0.419238, 0.489408, 0.491108, 0.394225, 0.399087, 0.436288, 0.349568, 0.363589, 0.436841, 0.398892, 0.286241, 0.34932, 0.384889, 0.434948, 0.485263, 0.492685, 0.398778, 0.231077, 0.352686, 0.261976, 0.151534, 0.252876, 0.334524, 0.332942, 0.40762, 0.43404, 0.322794, 0.289598, 0.273609 ]
							}
, 							{
								"key" : 122,
								"value" : [ 0.490197, 0.52722, 0.597644, 0.754859, 0.72563, 0.564091, 0.667862, 0.677465, 0.496917, 0.588418, 0.650693, 0.552805, 0.449124, 0.49179, 0.465294, 0.341123, 0.422772, 0.386789, 0.322852, 0.368197, 0.409037, 0.315222, 0.362463, 0.451043, 0.415967, 0.434888, 0.491161, 0.427576, 0.371913, 0.423375, 0.399731, 0.372366, 0.434252, 0.51008, 0.448622, 0.411869, 0.478155, 0.454922, 0.338198, 0.357168, 0.372468, 0.282274, 0.37635, 0.409837, 0.306219, 0.317867, 0.387427, 0.323296, 0.348704, 0.480202, 0.471971, 0.293228, 0.340272, 0.320302, 0.054051, 0.179173, 0.304049, 0.36534, 0.378476, 0.371337, 0.421676, 0.336492, 0.322231, 0.323369 ]
							}
, 							{
								"key" : 123,
								"value" : [ 0.504347, 0.54149, 0.620181, 0.762054, 0.727286, 0.557425, 0.630549, 0.646644, 0.412867, 0.579918, 0.621325, 0.516065, 0.44938, 0.48121, 0.44065, 0.351937, 0.35612, 0.32345, 0.293998, 0.327366, 0.399558, 0.302974, 0.382254, 0.416954, 0.301495, 0.360401, 0.348134, 0.3678, 0.200794, 0.276647, 0.278805, 0.174974, 0.348373, 0.398247, 0.295744, 0.326601, 0.427861, 0.38798, 0.272794, 0.331127, 0.32623, 0.287384, 0.30164, 0.324379, 0.270447, 0.314626, 0.367803, 0.304765, 0.291507, 0.426193, 0.418836, 0.381665, 0.429695, 0.392069, 0.220541, 0.300089, 0.297967, 0.272231, 0.338456, 0.326405, 0.326926, 0.310456, 0.296648, 0.199429 ]
							}
, 							{
								"key" : 124,
								"value" : [ 0.530779, 0.580299, 0.658788, 0.77903, 0.731846, 0.604092, 0.565254, 0.532162, 0.45716, 0.540768, 0.54672, 0.454686, 0.462186, 0.484746, 0.402771, 0.368008, 0.41381, 0.401304, 0.352503, 0.389856, 0.356584, 0.329082, 0.294567, 0.301043, 0.267327, 0.233669, 0.366043, 0.252847, 0.251743, 0.417026, 0.372395, 0.278324, 0.294581, 0.306227, 0.283198, 0.288165, 0.357054, 0.308182, 0.151294, 0.200183, 0.222838, 0.227219, 0.113519, 0.203252, 0.214005, 0.24085, 0.188006, 0.219524, 0.331471, 0.334326, 0.301613, 0.399537, 0.408466, 0.285792, 0.381217, 0.432285, 0.405575, 0.335161, 0.344519, 0.211955, 0.339101, 0.303199, 0.301949, 0.276732 ]
							}
, 							{
								"key" : 125,
								"value" : [ 0.566738, 0.565404, 0.656725, 0.787077, 0.746878, 0.59463, 0.584783, 0.517118, 0.413195, 0.490896, 0.523349, 0.369701, 0.429852, 0.536063, 0.407432, 0.350458, 0.442926, 0.40379, 0.325609, 0.397066, 0.373418, 0.309807, 0.370896, 0.349241, 0.250536, 0.328955, 0.432076, 0.188436, 0.357231, 0.407694, 0.385983, 0.325135, 0.401799, 0.382407, 0.350546, 0.398853, 0.409236, 0.357185, 0.351847, 0.282041, 0.267961, 0.223825, 0.229302, 0.193296, 0.206992, 0.230319, 0.206979, 0.172595, 0.23543, 0.095738, 0.283389, 0.344495, 0.37848, 0.348713, 0.354575, 0.381477, 0.382015, 0.389462, 0.42794, 0.29255, 0.383427, 0.272802, 0.316085, 0.246329 ]
							}
, 							{
								"key" : 126,
								"value" : [ 0.544968, 0.5458, 0.63965, 0.77459, 0.736945, 0.57801, 0.559006, 0.571658, 0.443099, 0.472616, 0.522604, 0.424767, 0.515201, 0.577479, 0.509531, 0.32874, 0.406281, 0.37111, 0.34186, 0.372493, 0.359512, 0.354, 0.265469, 0.241115, 0.283479, 0.363053, 0.425041, 0.367352, 0.39053, 0.42722, 0.413579, 0.322652, 0.344694, 0.364659, 0.323384, 0.370005, 0.322716, 0.311186, 0.346366, 0.341163, 0.289561, 0.253002, 0.099228, 0.173449, 0.160542, 0.252343, 0.210424, 0.170717, 0.249737, 0.247067, 0.245091, 0.291434, 0.362521, 0.247551, 0.361512, 0.375251, 0.395054, 0.405011, 0.367266, 0.311004, 0.300186, 0.345282, 0.31504, 0.22405 ]
							}
, 							{
								"key" : 127,
								"value" : [ 0.497706, 0.468303, 0.589512, 0.689992, 0.619884, 0.603411, 0.560797, 0.501177, 0.530178, 0.51465, 0.503811, 0.411401, 0.430684, 0.531135, 0.490149, 0.458961, 0.378818, 0.339455, 0.420013, 0.36629, 0.395047, 0.372276, 0.389859, 0.371502, 0.328769, 0.378693, 0.357776, 0.400142, 0.446422, 0.393889, 0.45187, 0.360072, 0.376965, 0.400056, 0.361939, 0.392691, 0.389973, 0.431271, 0.400304, 0.329421, 0.327337, 0.222232, 0.254716, 0.246978, 0.161124, 0.172942, 0.16925, 0.098575, 0.201305, 0.205443, 0.313424, 0.251817, 0.233972, 0.402688, 0.364992, 0.394972, 0.458754, 0.472248, 0.42429, 0.318762, 0.414001, 0.267196, 0.311537, 0.313794 ]
							}
, 							{
								"key" : 128,
								"value" : [ 0.490231, 0.418217, 0.415115, 0.481542, 0.434514, 0.362108, 0.366135, 0.372153, 0.371308, 0.274513, 0.287918, 0.241837, 0.288878, 0.283697, 0.191228, 0.16549, 0.072163, 0.196713, 0.299821, 0.233597, 0.169289, 0.230117, 0.147783, 0.253149, 0.232718, 0.26503, 0.225155, 0.200613, 0.064002, 0.235281, 0.111683, 0.186206, 0.082707, 0.172935, 0.121579, 0.145418, 0.201913, 0.090141, 0.194988, 0.107339, 0.095574, 0.145958, 0.186043, 0.114265, 0.143856, 0.150529, 0.144941, 0.136097, 0.104576, 0.083953, 0.089977, 0.164935, 0.137726, 0.112283, 0.179157, 0.175462, 0.15532, 0.136322, 0.137445, 0.136245, 0.129998, 0.070701, 0.125102, 0.083524 ]
							}
, 							{
								"key" : 129,
								"value" : [ 0.437895, 0.379335, 0.432492, 0.510639, 0.462608, 0.273883, 0.307149, 0.366752, 0.381025, 0.294646, 0.330916, 0.193031, 0.279842, 0.299206, 0.22403, 0.169407, 0.202955, 0.199119, 0.241786, 0.210308, 0.208735, 0.248238, 0.198716, 0.189456, 0.2152, 0.255704, 0.170345, 0.237125, 0.24685, 0.188357, 0.204652, 0.189823, 0.151623, 0.169319, 0.063664, 0.163542, 0.149171, 0.153822, 0.115751, 0.147778, 0.15473, 0.153994, 0.117707, 0.139285, 0.090453, 0.111053, 0.142475, 0.128704, 0.164129, 0.11466, 0.165797, 0.114319, 0.153338, 0.133405, 0.111559, 0.120769, 0.120482, 0.140195, 0.11499, 0.179462, 0.167237, 0.147883, 0.110194, 0.038281 ]
							}
, 							{
								"key" : 130,
								"value" : [ 0.364261, 0.325335, 0.393545, 0.453245, 0.398721, 0.325954, 0.322808, 0.373324, 0.380094, 0.145051, 0.337853, 0.245601, 0.266873, 0.235292, 0.167276, 0.110284, 0.148882, 0.084181, 0.227803, 0.217299, 0.216429, 0.274622, 0.11773, 0.195286, 0.241585, 0.260794, 0.249565, 0.223725, 0.09554, 0.115746, 0.195729, 0.128245, 0.105918, 0.139631, 0.074793, 0.064728, 0.099138, 0.107545, 0.109455, 0.174548, 0.163312, 0.123285, 0.073049, 0.117338, 0.092172, 0.07559, 0.103349, 0.122117, 0.14658, 0.185948, 0.105974, 0.072244, 0.149619, 0.138012, 0.027794, 0.156365, 0.130401, 0.137131, 0.124815, 0.08248, 0.056205, 0.087459, 0.074669, 0.125797 ]
							}
 ]
					}
,
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-53",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 555.0, 195.0, 59.0, 19.0 ],
					"saved_object_attributes" : 					{
						"embed" : 1
					}
,
					"text" : "coll"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 518.0, 238.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"contdata" : 1,
					"id" : "obj-25",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 555.0, 238.0, 186.0, 78.0 ],
					"setminmax" : [ 0.0, 1.0 ],
					"size" : 64
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 786.0, 273.0, 70.0, 19.0 ],
					"text" : "loadmess 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-6",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 786.0, 324.0, 43.0, 19.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-7",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 786.0, 354.0, 47.0, 17.0 ],
					"text" : "size $1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-21",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 240.0, 255.0, 50.0, 19.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-16",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 143.0, 172.0, 36.0, 17.0 ],
					"text" : "clear"
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
					"patching_rect" : [ 555.0, 339.0, 71.0, 19.0 ],
					"saved_object_attributes" : 					{
						"size" : 1
					}
,
					"text" : "dag.smooth"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 240.0, 195.0, 123.0, 19.0 ],
					"saved_object_attributes" : 					{
						"size" : 150
					}
,
					"text" : "pg.smooth @size 150"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-11",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 12.0, 284.0, 89.0, 19.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.595187,
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 12.0, 254.0, 123.0, 19.0 ],
					"saved_object_attributes" : 					{
						"size" : 31
					}
,
					"text" : "dag.smooth @size 10"
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
					"patching_rect" : [ 135.0, 120.0, 60.0, 81.0 ],
					"rounded" : 15,
					"shadow" : -1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.94324, 0.954082, 0.954082, 1.0 ],
					"bordercolor" : [ 0.235294, 0.235294, 0.235294, 0.2 ],
					"id" : "obj-14",
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 470.0, 204.0, 74.0, 76.0 ],
					"rounded" : 15,
					"shadow" : -1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.94324, 0.954082, 0.954082, 1.0 ],
					"bordercolor" : [ 0.235294, 0.235294, 0.235294, 0.2 ],
					"id" : "obj-19",
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 106.0, 280.0, 115.0, 223.0 ],
					"rounded" : 15,
					"shadow" : -1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.94324, 0.954082, 0.954082, 1.0 ],
					"bordercolor" : [ 0.235294, 0.235294, 0.235294, 0.2 ],
					"id" : "obj-34",
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 294.5, 325.0, 200.0, 176.0 ],
					"rounded" : 15,
					"shadow" : -1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.94324, 0.954082, 0.954082, 1.0 ],
					"bordercolor" : [ 0.235294, 0.235294, 0.235294, 0.2 ],
					"id" : "obj-35",
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 631.0, 87.0, 212.0, 123.0 ],
					"rounded" : 15,
					"shadow" : -1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.94324, 0.954082, 0.954082, 1.0 ],
					"bordercolor" : [ 0.235294, 0.235294, 0.235294, 0.2 ],
					"id" : "obj-36",
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 541.0, 364.0, 212.0, 123.0 ],
					"rounded" : 15,
					"shadow" : -1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.94324, 0.954082, 0.954082, 1.0 ],
					"bordercolor" : [ 0.235294, 0.235294, 0.235294, 0.2 ],
					"id" : "obj-37",
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 761.0, 238.0, 136.0, 152.0 ],
					"rounded" : 15,
					"shadow" : -1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-110", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-108", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-115", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 275.5, 161.0, 399.5, 161.0 ],
					"source" : [ "obj-108", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-110", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-113", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-112", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-111", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-113", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-112", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-115", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-116", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-70", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-122", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-50", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-123", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-112", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 152.5, 191.0, 225.0, 191.0, 225.0, 240.0, 324.5, 240.0 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-83", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-111", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 527.5, 264.0, 527.0, 264.0, 527.0, 336.0, 564.5, 336.0 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-69", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-71", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-74", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-50", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-58", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-58", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-69", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 795.5, 372.0, 768.0, 372.0, 768.0, 336.0, 564.5, 336.0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-74", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-73", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-75", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-76", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-119", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-108", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-81", 0 ]
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
				"name" : "dag.smooth.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "pg.smooth.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
