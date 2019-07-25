-- *************** AisDecodeMessageStore: PostgreSQL DB ****************;
-- *********************************************************************;
DROP TABLE IF EXISTS "message_data";

DROP TABLE IF EXISTS "vessel_signature";

DROP TABLE IF EXISTS "navigation_data";

DROP TABLE IF EXISTS "voyage_data";

DROP TABLE IF EXISTS "vessel_type";

DROP TABLE IF EXISTS "vessel_data";

DROP TABLE IF EXISTS "nav_status";

DROP TABLE IF EXISTS "message_type";

DROP TABLE IF EXISTS "maneuver_indicator";

DROP TABLE IF EXISTS "geospatial_data";



-- ************************************** "voyage_data"

CREATE TABLE "voyage_data"
(
 "voyage_data_id" bigint NOT NULL,
 "draught"        decimal(5,1) NULL,
 "eta"            timestamp with time zone NULL,
 "destination"    varchar(100) NULL

);

CREATE UNIQUE INDEX "PK_voyage_data" ON "voyage_data"
(
 "voyage_data_id"
);








-- ************************************** "vessel_type"

CREATE TABLE "vessel_type"
(
 "vessel_type_id"                int NOT NULL,
 "vessel_group"                  varchar(50) NOT NULL,
 "ais_vessel_code"               int NOT NULL,
 "ais_ship_cargo_classification" varchar(100) NOT NULL,
 "note"                          varchar(1024)

);

CREATE UNIQUE INDEX "PK_vessel_type" ON "vessel_type"
(
 "vessel_type_id"
);

-- AIS Vessel Type and Group Codes v2018-05-23 used by the Marine Cadastre Project - USCG, NOAA, BOEM
-- **not including AVIS Vessel Service
-- https://marinecadastre.gov/ais/AIS%20Documents/VesselTypeCodes2018.pdf
INSERT INTO vessel_type VALUES
(0 ,    'Not Available'         ,     0, 'Not available or no ship'          ,  'default'                                      ),
(1 ,    'Other'                 ,     1, 'Reserved for future use'           ,  NULL                                           ),
(2 ,    'Other'                 ,     2, 'Reserved for future use'           ,  NULL                                           ),
(3 ,    'Other'                 ,     3, 'Reserved for future use'           ,  NULL                                           ),
(4 ,    'Other'                 ,     4, 'Reserved for future use'           ,  NULL                                           ),
(5 ,    'Other'                 ,     5, 'Reserved for future use'           ,  NULL                                           ),
(6 ,    'Other'                 ,     6, 'Reserved for future use'           ,  NULL                                           ),
(7 ,    'Other'                 ,     7, 'Reserved for future use'           ,  NULL                                           ),
(8 ,    'Other'                 ,     8, 'Reserved for future use'           ,  NULL                                           ),
(9 ,    'Other'                 ,     9, 'Reserved for future use'           ,  NULL                                           ),
(10,    'Other'                 ,    10, 'Reserved for future use'           ,  NULL                                           ),
(11,    'Other'                 ,    11, 'Reserved for future use'           ,  NULL                                           ),
(12,    'Other'                 ,    12, 'Reserved for future use'           ,  NULL                                           ),
(13,    'Other'                 ,    13, 'Reserved for future use'           ,  NULL                                           ),
(14,    'Other'                 ,    14, 'Reserved for future use'           ,  NULL                                           ),
(15,    'Other'                 ,    15, 'Reserved for future use'           ,  NULL                                           ),
(16,    'Other'                 ,    16, 'Reserved for future use'           ,  NULL                                           ),
(17,    'Other'                 ,    17, 'Reserved for future use'           ,  NULL                                           ),
(18,    'Other'                 ,    18, 'Reserved for future use'           ,  NULL                                           ),
(19,    'Other'                 ,    19, 'Reserved for future use'           ,  NULL                                           ),
(20,    'Other'                 ,    20, 'Wing in ground (WIG)'              ,  'all ships of this type'                       ),
(21,    'Tug Tow'               ,    21, 'Wing in ground (WIG)'              ,  'hazardous category A'                         ),
(22,    'Tug Tow'               ,    22, 'Wing in ground (WIG)'              ,  'hazardous category B'                         ),
(23,    'Other'                 ,    23, 'Wing in ground (WIG)'              ,  'hazardous category C'                         ),
(24,    'Other'                 ,    24, 'Wing in ground (WIG)'              ,  'hazardous category D'                         ),
(25,    'Other'                 ,    25, 'Wing in ground (WIG)'              ,  'reserved for future use'                      ),
(26,    'Other'                 ,    26, 'Wing in ground (WIG)'              ,  'reserved for future use'                      ),
(27,    'Other'                 ,    27, 'Wing in ground (WIG)'              ,  'reserved for future use'                      ),
(28,    'Other'                 ,    28, 'Wing in ground (WIG)'              ,  'reserved for future use'                      ),
(29,    'Other'                 ,    29, 'Wing in ground (WIG)'              ,  'reserved for future use'                      ),
(30,    'Fishing'               ,    30, 'Fishing'                           ,  NULL                                           ),
(31,    'Tug Tow'               ,    31, 'Towing'                            ,  NULL                                           ),
(32,    'Tug Tow'               ,    32, 'Towing'                            ,  'length exceeds 200m or breadth exceeds 25m'   ),
(33,    'Other'                 ,    33, 'Dredging or underwater operations' ,  NULL                                           ),
(34,    'Other'                 ,    34, 'Diving operations'                 ,  NULL                                           ),
(35,    'Military'              ,    35, 'Military operations'               ,  NULL                                           ),
(36,    'Pleasure Craft/Sailing',    36, 'Sailing'                           ,  NULL                                           ),
(37,    'Pleasure Craft/Sailing',    37, 'Pleasure Craft'                    ,  NULL                                           ),
(38,    'Other'                 ,    38, 'Reserved'                          ,  NULL                                           ),
(39,    'Other'                 ,    39, 'Reserved'                          ,  NULL                                           ),
(40,    'Other'                 ,    40, 'High speed craft (HSC)'            ,  'all ships of this type'                       ),
(41,    'Other'                 ,    41, 'High speed craft (HSC)'            ,  'hazardous category A'                         ),
(42,    'Other'                 ,    42, 'High speed craft (HSC)'            ,  'hazardous category B'                         ),
(43,    'Other'                 ,    43, 'High speed craft (HSC)'            ,  'hazardous category C'                         ),
(44,    'Other'                 ,    44, 'High speed craft (HSC)'            ,  'hazardous category D'                         ),
(45,    'Other'                 ,    45, 'High speed craft (HSC)'            ,  'reserved for future use'                      ),
(46,    'Other'                 ,    46, 'High speed craft (HSC)'            ,  'reserved for future use'                      ),
(47,    'Other'                 ,    47, 'High speed craft (HSC)'            ,  'reserved for future use'                      ),
(48,    'Other'                 ,    48, 'High speed craft (HSC)'            ,  'reserved for future use'                      ),
(49,    'Other'                 ,    49, 'High speed craft (HSC)'            ,  'no additional information'                    ),
(50,    'Other'                 ,    50, 'Pilot Vessel'                      ,  NULL                                           ),
(51,    'Other'                 ,    51, 'Search and Rescue vessel'          ,  NULL                                           ),
(52,    'Tug Tow' 	            ,    52, 'Tug'                               ,  NULL                                           ),
(53,    'Other'                 ,    53, 'Port Tender'                       ,  NULL                                           ),
(54,    'Other'                 ,    54, 'Anti-pollution equipment'          ,  NULL                                           ),
(55,    'Other'                 ,    55, 'Law Enforcement'                   ,  NULL                                           ),
(56,    'Other'                 ,    56, 'Spare'                             ,  'for assignment to local vessel'               ),
(57,    'Other'                 ,    57, 'Spare'                             ,  'for assignment to local vessel'               ),
(58,    'Other'                 ,    58, 'Medical Transport'                 ,  NULL                                           ),
(59,    'Other'                 ,    59, 'Ship'                              ,  'according to RR Resolution No. 18'            ),
(60,    'Passenger'             ,  	 60, 'Passenger'                         ,  'all ships of this type'                       ),
(61,    'Passenger'             ,  	 61, 'Passenger'                         ,  'hazardous category A'                         ),
(62,    'Passenger'             ,  	 62, 'Passenger'                         ,  'hazardous category B'                         ),
(63,    'Passenger'             ,  	 63, 'Passenger'                         ,  'hazardous category C'                         ),
(64,    'Passenger'             ,  	 64, 'Passenger'                         ,  'hazardous category D'                         ),
(65,    'Passenger'             ,  	 65, 'Passenger'                         ,  'reserved for future use'                      ),
(66,    'Passenger'             ,  	 66, 'Passenger'                         ,  'reserved for future use'                      ),
(67,    'Passenger'             ,  	 67, 'Passenger'                         ,  'reserved for future use'                      ),
(68,    'Passenger'             ,  	 68, 'Passenger'                         ,  'reserved for future use'                      ),
(69,    'Passenger'             ,  	 69, 'Passenger'                         ,  'no additional information'                    ),
(70,    'Cargo'                 ,    70, 'Cargo'                             ,  'all ships of this type'                       ),
(71,    'Cargo'                 ,    71, 'Cargo'                             ,  'hazardous category A'                         ),
(72,    'Cargo'                 ,    72, 'Cargo'                             ,  'hazardous category B'                         ),
(73,    'Cargo'                 ,    73, 'Cargo'                             ,  'hazardous category C'                         ),
(74,    'Cargo'                 ,    74, 'Cargo'                             ,  'hazardous category D'                         ),
(75,    'Cargo'                 ,    75, 'Cargo'                             ,  'reserved for future use'                      ),
(76,    'Cargo'                 ,    76, 'Cargo'                             ,  'reserved for future use'                      ),
(77,    'Cargo'                 ,    77, 'Cargo'                             ,  'reserved for future use'                      ),
(78,    'Cargo'                 ,    78, 'Cargo'                             ,  'reserved for future use'                      ),
(79,    'Cargo'                 ,    79, 'Cargo'                             ,  'no additional information'                    ),
(80,    'Tanker'                ,    80, 'Tanker'                            ,  'all ships of this type'                       ),
(81,    'Tanker'                ,    81, 'Tanker'                            ,  'hazardous category A'                         ),
(82,    'Tanker'                ,    82, 'Tanker'                            ,  'hazardous category B'                         ),
(83,    'Tanker'                ,    83, 'Tanker'                            ,  'hazardous category C'                         ),
(84,    'Tanker'                ,    84, 'Tanker'                            ,  'hazardous category D'                         ),
(85,    'Tanker'                ,    85, 'Tanker'                            ,  'reserved for future use'                      ),
(86,    'Tanker'                ,    86, 'Tanker'                            ,  'reserved for future use'                      ),
(87,    'Tanker'                ,    87, 'Tanker'                            ,  'reserved for future use'                      ),
(88,    'Tanker'                ,    88, 'Tanker'                            ,  'reserved for future use'                      ),
(89,    'Tanker'                ,    89, 'Tanker'                            ,  'no additional information'                    ),
(90,    'Other'                 ,    90, 'Other Type'                        ,  'all ships of this type'                       ),
(91,    'Other'                 ,    91, 'Other Type'                        ,  'hazardous category A'                         ),
(92,    'Other'                 ,    92, 'Other Type'                        ,  'hazardous category B'                         ),
(93,    'Other'                 ,    93, 'Other Type'                        ,  'hazardous category C'                         ),
(94,    'Other'                 ,    94, 'Other Type'                        ,  'hazardous category D'                         ),
(95,    'Other'                 ,    95, 'Other Type'                        ,  'reserved for future use'                      ),
(96,    'Other'                 ,    96, 'Other Type'                        ,  'reserved for future use'                      ),
(97,    'Other'                 ,    97, 'Other Type'                        ,  'reserved for future use'                      ),
(98,    'Other'                 ,    98, 'Other Type'                        ,  'reserved for future use'                      ),
(99,    'Other'                 ,    99, 'Other Type'                        ,  'no additional information'                    ),
(100,   'Other'                 ,   100, 'Reserved for regional use'         ,  NULL                                           ),
(101,   'Other'                 ,   101, 'Reserved for regional use'         ,  NULL                                           ),
(102,   'Other'                 ,   102, 'Reserved for regional use'         ,  NULL                                           ),
(103,   'Other'                 ,   103, 'Reserved for regional use'         ,  NULL                                           ),
(104,   'Other'                 ,   104, 'Reserved for regional use'         ,  NULL                                           ),
(105,   'Other'                 ,   105, 'Reserved for regional use'         ,  NULL                                           ),
(106,   'Other'                 ,   106, 'Reserved for regional use'         ,  NULL                                           ),
(107,   'Other'                 ,   107, 'Reserved for regional use'         ,  NULL                                           ),
(108,   'Other'                 ,   108, 'Reserved for regional use'         ,  NULL                                           ),
(109,   'Other'                 ,   109, 'Reserved for regional use'         ,  NULL                                           ),
(110,   'Other'                 ,   110, 'Reserved for regional use'         ,  NULL                                           ),
(111,   'Other'                 ,   111, 'Reserved for regional use'         ,  NULL                                           ),
(112,   'Other'                 ,   112, 'Reserved for regional use'         ,  NULL                                           ),
(113,   'Other'                 ,   113, 'Reserved for regional use'         ,  NULL                                           ),
(114,   'Other'                 ,   114, 'Reserved for regional use'         ,  NULL                                           ),
(115,   'Other'                 ,   115, 'Reserved for regional use'         ,  NULL                                           ),
(116,   'Other'                 ,   116, 'Reserved for regional use'         ,  NULL                                           ),
(117,   'Other'                 ,   117, 'Reserved for regional use'         ,  NULL                                           ),
(118,   'Other'                 ,   118, 'Reserved for regional use'         ,  NULL                                           ),
(119,   'Other'                 ,   119, 'Reserved for regional use'         ,  NULL                                           ),
(120,   'Other'                 ,   120, 'Reserved for regional use'         ,  NULL                                           ),
(121,   'Other'                 ,   121, 'Reserved for regional use'         ,  NULL                                           ),
(122,   'Other'                 ,   122, 'Reserved for regional use'         ,  NULL                                           ),
(123,   'Other'                 ,   123, 'Reserved for regional use'         ,  NULL                                           ),
(124,   'Other'                 ,   124, 'Reserved for regional use'         ,  NULL                                           ),
(125,   'Other'                 ,   125, 'Reserved for regional use'         ,  NULL                                           ),
(126,   'Other'                 ,   126, 'Reserved for regional use'         ,  NULL                                           ),
(127,   'Other'                 ,   127, 'Reserved for regional use'         ,  NULL                                           ),
(128,   'Other'                 ,   128, 'Reserved for regional use'         ,  NULL                                           ),
(129,   'Other'                 ,   129, 'Reserved for regional use'         ,  NULL                                           ),
(130,   'Other'                 ,   130, 'Reserved for regional use'         ,  NULL                                           ),
(131,   'Other'                 ,   131, 'Reserved for regional use'         ,  NULL                                           ),
(132,   'Other'                 ,   132, 'Reserved for regional use'         ,  NULL                                           ),
(133,   'Other'                 ,   133, 'Reserved for regional use'         ,  NULL                                           ),
(134,   'Other'                 ,   134, 'Reserved for regional use'         ,  NULL                                           ),
(135,   'Other'                 ,   135, 'Reserved for regional use'         ,  NULL                                           ),
(136,   'Other'                 ,   136, 'Reserved for regional use'         ,  NULL                                           ),
(137,   'Other'                 ,   137, 'Reserved for regional use'         ,  NULL                                           ),
(138,   'Other'                 ,   138, 'Reserved for regional use'         ,  NULL                                           ),
(139,   'Other'                 ,   139, 'Reserved for regional use'         ,  NULL                                           ),
(140,   'Other'                 ,   140, 'Reserved for regional use'         ,  NULL                                           ),
(141,   'Other'                 ,   141, 'Reserved for regional use'         ,  NULL                                           ),
(142,   'Other'                 ,   142, 'Reserved for regional use'         ,  NULL                                           ),
(143,   'Other'                 ,   143, 'Reserved for regional use'         ,  NULL                                           ),
(144,   'Other'                 ,   144, 'Reserved for regional use'         ,  NULL                                           ),
(145,   'Other'                 ,   145, 'Reserved for regional use'         ,  NULL                                           ),
(146,   'Other'                 ,   146, 'Reserved for regional use'         ,  NULL                                           ),
(147,   'Other'                 ,   147, 'Reserved for regional use'         ,  NULL                                           ),
(148,   'Other'                 ,   148, 'Reserved for regional use'         ,  NULL                                           ),
(149,   'Other'                 ,   149, 'Reserved for regional use'         ,  NULL                                           ),
(150,   'Other'                 ,   150, 'Reserved for regional use'         ,  NULL                                           ),
(151,   'Other'                 ,   151, 'Reserved for regional use'         ,  NULL                                           ),
(152,   'Other'                 ,   152, 'Reserved for regional use'         ,  NULL                                           ),
(153,   'Other'                 ,   153, 'Reserved for regional use'         ,  NULL                                           ),
(154,   'Other'                 ,   154, 'Reserved for regional use'         ,  NULL                                           ),
(155,   'Other'                 ,   155, 'Reserved for regional use'         ,  NULL                                           ),
(156,   'Other'                 ,   156, 'Reserved for regional use'         ,  NULL                                           ),
(157,   'Other'                 ,   157, 'Reserved for regional use'         ,  NULL                                           ),
(158,   'Other'                 ,   158, 'Reserved for regional use'         ,  NULL                                           ),
(159,   'Other'                 ,   159, 'Reserved for regional use'         ,  NULL                                           ),
(160,   'Other'                 ,   160, 'Reserved for regional use'         ,  NULL                                           ),
(161,   'Other'                 ,   161, 'Reserved for regional use'         ,  NULL                                           ),
(162,   'Other'                 ,   162, 'Reserved for regional use'         ,  NULL                                           ),
(163,   'Other'                 ,   163, 'Reserved for regional use'         ,  NULL                                           ),
(164,   'Other'                 ,   164, 'Reserved for regional use'         ,  NULL                                           ),
(165,   'Other'                 ,   165, 'Reserved for regional use'         ,  NULL                                           ),
(166,   'Other'                 ,   166, 'Reserved for regional use'         ,  NULL                                           ),
(167,   'Other'                 ,   167, 'Reserved for regional use'         ,  NULL                                           ),
(168,   'Other'                 ,   168, 'Reserved for regional use'         ,  NULL                                           ),
(169,   'Other'                 ,   169, 'Reserved for regional use'         ,  NULL                                           ),
(170,   'Other'                 ,   170, 'Reserved for regional use'         ,  NULL                                           ),
(171,   'Other'                 ,   171, 'Reserved for regional use'         ,  NULL                                           ),
(172,   'Other'                 ,   172, 'Reserved for regional use'         ,  NULL                                           ),
(173,   'Other'                 ,   173, 'Reserved for regional use'         ,  NULL                                           ),
(174,   'Other'                 ,   174, 'Reserved for regional use'         ,  NULL                                           ),
(175,   'Other'                 ,   175, 'Reserved for regional use'         ,  NULL                                           ),
(176,   'Other'                 ,   176, 'Reserved for regional use'         ,  NULL                                           ),
(177,   'Other'                 ,   177, 'Reserved for regional use'         ,  NULL                                           ),
(178,   'Other'                 ,   178, 'Reserved for regional use'         ,  NULL                                           ),
(179,   'Other'                 ,   179, 'Reserved for regional use'         ,  NULL                                           ),
(180,   'Other'                 ,   180, 'Reserved for regional use'         ,  NULL                                           ),
(181,   'Other'                 ,   181, 'Reserved for regional use'         ,  NULL                                           ),
(182,   'Other'                 ,   182, 'Reserved for regional use'         ,  NULL                                           ),
(183,   'Other'                 ,   183, 'Reserved for regional use'         ,  NULL                                           ),
(184,   'Other'                 ,   184, 'Reserved for regional use'         ,  NULL                                           ),
(185,   'Other'                 ,   185, 'Reserved for regional use'         ,  NULL                                           ),
(186,   'Other'                 ,   186, 'Reserved for regional use'         ,  NULL                                           ),
(187,   'Other'                 ,   187, 'Reserved for regional use'         ,  NULL                                           ),
(188,   'Other'                 ,   188, 'Reserved for regional use'         ,  NULL                                           ),
(189,   'Other'                 ,   189, 'Reserved for regional use'         ,  NULL                                           ),
(190,   'Other'                 ,   190, 'Reserved for regional use'         ,  NULL                                           ),
(191,   'Other'                 ,   191, 'Reserved for regional use'         ,  NULL                                           ),
(192,   'Other'                 ,   192, 'Reserved for regional use'         ,  NULL                                           ),
(193,   'Other'                 ,   193, 'Reserved for regional use'         ,  NULL                                           ),
(194,   'Other'                 ,   194, 'Reserved for regional use'         ,  NULL                                           ),
(195,   'Other'                 ,   195, 'Reserved for regional use'         ,  NULL                                           ),
(196,   'Other'                 ,   196, 'Reserved for regional use'         ,  NULL                                           ),
(197,   'Other'                 ,   197, 'Reserved for regional use'         ,  NULL                                           ),
(198,   'Other'                 ,   198, 'Reserved for regional use'         ,  NULL                                           ),
(199,   'Other'                 ,   199, 'Reserved for regional use'         ,  NULL                                           ),
(200,   'Other'                 ,   200, 'Reserved for future use'           ,  NULL                                           ),
(201,   'Other'                 ,   201, 'Reserved for future use'           ,  NULL                                           ),
(202,   'Other'                 ,   202, 'Reserved for future use'           ,  NULL                                           ),
(203,   'Other'                 ,   203, 'Reserved for future use'           ,  NULL                                           ),
(204,   'Other'                 ,   204, 'Reserved for future use'           ,  NULL                                           ),
(205,   'Other'                 ,   205, 'Reserved for future use'           ,  NULL                                           ),
(206,   'Other'                 ,   206, 'Reserved for future use'           ,  NULL                                           ),
(207,   'Other'                 ,   207, 'Reserved for future use'           ,  NULL                                           ),
(208,   'Other'                 ,   208, 'Reserved for future use'           ,  NULL                                           ),
(209,   'Other'                 ,   209, 'Reserved for future use'           ,  NULL                                           ),
(210,   'Other'                 ,   210, 'Reserved for future use'           ,  NULL                                           ),
(211,   'Other'                 ,   211, 'Reserved for future use'           ,  NULL                                           ),
(212,   'Other'                 ,   212, 'Reserved for future use'           ,  NULL                                           ),
(213,   'Other'                 ,   213, 'Reserved for future use'           ,  NULL                                           ),
(214,   'Other'                 ,   214, 'Reserved for future use'           ,  NULL                                           ),
(215,   'Other'                 ,   215, 'Reserved for future use'           ,  NULL                                           ),
(216,   'Other'                 ,   216, 'Reserved for future use'           ,  NULL                                           ),
(217,   'Other'                 ,   217, 'Reserved for future use'           ,  NULL                                           ),
(218,   'Other'                 ,   218, 'Reserved for future use'           ,  NULL                                           ),
(219,   'Other'                 ,   219, 'Reserved for future use'           ,  NULL                                           ),
(220,   'Other'                 ,   220, 'Reserved for future use'           ,  NULL                                           ),
(221,   'Other'                 ,   221, 'Reserved for future use'           ,  NULL                                           ),
(222,   'Other'                 ,   222, 'Reserved for future use'           ,  NULL                                           ),
(223,   'Other'                 ,   223, 'Reserved for future use'           ,  NULL                                           ),
(224,   'Other'                 ,   224, 'Reserved for future use'           ,  NULL                                           ),
(225,   'Other'                 ,   225, 'Reserved for future use'           ,  NULL                                           ),
(226,   'Other'                 ,   226, 'Reserved for future use'           ,  NULL                                           ),
(227,   'Other'                 ,   227, 'Reserved for future use'           ,  NULL                                           ),
(228,   'Other'                 ,   228, 'Reserved for future use'           ,  NULL                                           ),
(229,   'Other'                 ,   229, 'Reserved for future use'           ,  NULL                                           ),
(230,   'Other'                 ,   230, 'Reserved for future use'           ,  NULL                                           ),
(231,   'Other'                 ,   231, 'Reserved for future use'           ,  NULL                                           ),
(232,   'Other'                 ,   232, 'Reserved for future use'           ,  NULL                                           ),
(233,   'Other'                 ,   233, 'Reserved for future use'           ,  NULL                                           ),
(234,   'Other'                 ,   234, 'Reserved for future use'           ,  NULL                                           ),
(235,   'Other'                 ,   235, 'Reserved for future use'           ,  NULL                                           ),
(236,   'Other'                 ,   236, 'Reserved for future use'           ,  NULL                                           ),
(237,   'Other'                 ,   237, 'Reserved for future use'           ,  NULL                                           ),
(238,   'Other'                 ,   238, 'Reserved for future use'           ,  NULL                                           ),
(239,   'Other'                 ,   239, 'Reserved for future use'           ,  NULL                                           ),
(240,   'Other'                 ,   240, 'Reserved for future use'           ,  NULL                                           ),
(241,   'Other'                 ,   241, 'Reserved for future use'           ,  NULL                                           ),
(242,   'Other'                 ,   242, 'Reserved for future use'           ,  NULL                                           ),
(243,   'Other'                 ,   243, 'Reserved for future use'           ,  NULL                                           ),
(244,   'Other'                 ,   244, 'Reserved for future use'           ,  NULL                                           ),
(245,   'Other'                 ,   245, 'Reserved for future use'           ,  NULL                                           ),
(246,   'Other'                 ,   246, 'Reserved for future use'           ,  NULL                                           ),
(247,   'Other'                 ,   247, 'Reserved for future use'           ,  NULL                                           ),
(248,   'Other'                 ,   248, 'Reserved for future use'           ,  NULL                                           ),
(249,   'Other'                 ,   249, 'Reserved for future use'           ,  NULL                                           ),
(250,   'Other'                 ,   250, 'Reserved for future use'           ,  NULL                                           ),
(251,   'Other'                 ,   251, 'Reserved for future use'           ,  NULL                                           ),
(252,   'Other'                 ,   252, 'Reserved for future use'           ,  NULL                                           ),
(253,   'Other'                 ,   253, 'Reserved for future use'           ,  NULL                                           ),
(254,   'Other'                 ,   254, 'Reserved for future use'           ,  NULL                                           ),
(255,   'Other'                 ,   255, 'Reserved for future use'           ,  NULL                                           ),
(256,   'Other'                 ,   256, 'No designation'                    ,  NULL                                           ),
(257,   'Other'                 ,   257, 'No designation'                    ,  NULL                                           ),
(258,   'Other'                 ,   258, 'No designation'                    ,  NULL                                           ),
(259,   'Other'                 ,   259, 'No designation'                    ,  NULL                                           ),
(260,   'Other'                 ,   260, 'No designation'                    ,  NULL                                           ),
(261,   'Other'                 ,   261, 'No designation'                    ,  NULL                                           ),
(262,   'Other'                 ,   262, 'No designation'                    ,  NULL                                           ),
(263,   'Other'                 ,   263, 'No designation'                    ,  NULL                                           ),
(264,   'Other'                 ,   264, 'No designation'                    ,  NULL                                           ),
(265,   'Other'                 ,   265, 'No designation'                    ,  NULL                                           ),
(266,   'Other'                 ,   266, 'No designation'                    ,  NULL                                           ),
(267,   'Other'                 ,   267, 'No designation'                    ,  NULL                                           ),
(268,   'Other'                 ,   268, 'No designation'                    ,  NULL                                           ),
(269,   'Other'                 ,   269, 'No designation'                    ,  NULL                                           ),
(270,   'Other'                 ,   270, 'No designation'                    ,  NULL                                           ),
(271,   'Other'                 ,   271, 'No designation'                    ,  NULL                                           ),
(272,   'Other'                 ,   272, 'No designation'                    ,  NULL                                           ),
(273,   'Other'                 ,   273, 'No designation'                    ,  NULL                                           ),
(274,   'Other'                 ,   274, 'No designation'                    ,  NULL                                           ),
(275,   'Other'                 ,   275, 'No designation'                    ,  NULL                                           ),
(276,   'Other'                 ,   276, 'No designation'                    ,  NULL                                           ),
(277,   'Other'                 ,   277, 'No designation'                    ,  NULL                                           ),
(278,   'Other'                 ,   278, 'No designation'                    ,  NULL                                           ),
(279,   'Other'                 ,   279, 'No designation'                    ,  NULL                                           ),
(280,   'Other'                 ,   280, 'No designation'                    ,  NULL                                           ),
(281,   'Other'                 ,   281, 'No designation'                    ,  NULL                                           ),
(282,   'Other'                 ,   282, 'No designation'                    ,  NULL                                           ),
(283,   'Other'                 ,   283, 'No designation'                    ,  NULL                                           ),
(284,   'Other'                 ,   284, 'No designation'                    ,  NULL                                           ),
(285,   'Other'                 ,   285, 'No designation'                    ,  NULL                                           ),
(286,   'Other'                 ,   286, 'No designation'                    ,  NULL                                           ),
(287,   'Other'                 ,   287, 'No designation'                    ,  NULL                                           ),
(288,   'Other'                 ,   288, 'No designation'                    ,  NULL                                           ),
(289,   'Other'                 ,   289, 'No designation'                    ,  NULL                                           ),
(290,   'Other'                 ,   290, 'No designation'                    ,  NULL                                           ),
(291,   'Other'                 ,   291, 'No designation'                    ,  NULL                                           ),
(292,   'Other'                 ,   292, 'No designation'                    ,  NULL                                           ),
(293,   'Other'                 ,   293, 'No designation'                    ,  NULL                                           ),
(294,   'Other'                 ,   294, 'No designation'                    ,  NULL                                           ),
(295,   'Other'                 ,   295, 'No designation'                    ,  NULL                                           ),
(296,   'Other'                 ,   296, 'No designation'                    ,  NULL                                           ),
(297,   'Other'                 ,   297, 'No designation'                    ,  NULL                                           ),
(298,   'Other'                 ,   298, 'No designation'                    ,  NULL                                           ),
(299,   'Other'                 ,   299, 'No designation'                    ,  NULL                                           ),
(300,   'Other'                 ,   300, 'No designation'                    ,  NULL                                           ),
(301,   'Other'                 ,   301, 'No designation'                    ,  NULL                                           ),
(302,   'Other'                 ,   302, 'No designation'                    ,  NULL                                           ),
(303,   'Other'                 ,   303, 'No designation'                    ,  NULL                                           ),
(304,   'Other'                 ,   304, 'No designation'                    ,  NULL                                           ),
(305,   'Other'                 ,   305, 'No designation'                    ,  NULL                                           ),
(306,   'Other'                 ,   306, 'No designation'                    ,  NULL                                           ),
(307,   'Other'                 ,   307, 'No designation'                    ,  NULL                                           ),
(308,   'Other'                 ,   308, 'No designation'                    ,  NULL                                           ),
(309,   'Other'                 ,   309, 'No designation'                    ,  NULL                                           ),
(310,   'Other'                 ,   310, 'No designation'                    ,  NULL                                           ),
(311,   'Other'                 ,   311, 'No designation'                    ,  NULL                                           ),
(312,   'Other'                 ,   312, 'No designation'                    ,  NULL                                           ),
(313,   'Other'                 ,   313, 'No designation'                    ,  NULL                                           ),
(314,   'Other'                 ,   314, 'No designation'                    ,  NULL                                           ),
(315,   'Other'                 ,   315, 'No designation'                    ,  NULL                                           ),
(316,   'Other'                 ,   316, 'No designation'                    ,  NULL                                           ),
(317,   'Other'                 ,   317, 'No designation'                    ,  NULL                                           ),
(318,   'Other'                 ,   318, 'No designation'                    ,  NULL                                           ),
(319,   'Other'                 ,   319, 'No designation'                    ,  NULL                                           ),
(320,   'Other'                 ,   320, 'No designation'                    ,  NULL                                           ),
(321,   'Other'                 ,   321, 'No designation'                    ,  NULL                                           ),
(322,   'Other'                 ,   322, 'No designation'                    ,  NULL                                           ),
(323,   'Other'                 ,   323, 'No designation'                    ,  NULL                                           ),
(324,   'Other'                 ,   324, 'No designation'                    ,  NULL                                           ),
(325,   'Other'                 ,   325, 'No designation'                    ,  NULL                                           ),
(326,   'Other'                 ,   326, 'No designation'                    ,  NULL                                           ),
(327,   'Other'                 ,   327, 'No designation'                    ,  NULL                                           ),
(328,   'Other'                 ,   328, 'No designation'                    ,  NULL                                           ),
(329,   'Other'                 ,   329, 'No designation'                    ,  NULL                                           ),
(330,   'Other'                 ,   330, 'No designation'                    ,  NULL                                           ),
(331,   'Other'                 ,   331, 'No designation'                    ,  NULL                                           ),
(332,   'Other'                 ,   332, 'No designation'                    ,  NULL                                           ),
(333,   'Other'                 ,   333, 'No designation'                    ,  NULL                                           ),
(334,   'Other'                 ,   334, 'No designation'                    ,  NULL                                           ),
(335,   'Other'                 ,   335, 'No designation'                    ,  NULL                                           ),
(336,   'Other'                 ,   336, 'No designation'                    ,  NULL                                           ),
(337,   'Other'                 ,   337, 'No designation'                    ,  NULL                                           ),
(338,   'Other'                 ,   338, 'No designation'                    ,  NULL                                           ),
(339,   'Other'                 ,   339, 'No designation'                    ,  NULL                                           ),
(340,   'Other'                 ,   340, 'No designation'                    ,  NULL                                           ),
(341,   'Other'                 ,   341, 'No designation'                    ,  NULL                                           ),
(342,   'Other'                 ,   342, 'No designation'                    ,  NULL                                           ),
(343,   'Other'                 ,   343, 'No designation'                    ,  NULL                                           ),
(344,   'Other'                 ,   344, 'No designation'                    ,  NULL                                           ),
(345,   'Other'                 ,   345, 'No designation'                    ,  NULL                                           ),
(346,   'Other'                 ,   346, 'No designation'                    ,  NULL                                           ),
(347,   'Other'                 ,   347, 'No designation'                    ,  NULL                                           ),
(348,   'Other'                 ,   348, 'No designation'                    ,  NULL                                           ),
(349,   'Other'                 ,   349, 'No designation'                    ,  NULL                                           ),
(350,   'Other'                 ,   350, 'No designation'                    ,  NULL                                           ),
(351,   'Other'                 ,   351, 'No designation'                    ,  NULL                                           ),
(352,   'Other'                 ,   352, 'No designation'                    ,  NULL                                           ),
(353,   'Other'                 ,   353, 'No designation'                    ,  NULL                                           ),
(354,   'Other'                 ,   354, 'No designation'                    ,  NULL                                           ),
(355,   'Other'                 ,   355, 'No designation'                    ,  NULL                                           ),
(356,   'Other'                 ,   356, 'No designation'                    ,  NULL                                           ),
(357,   'Other'                 ,   357, 'No designation'                    ,  NULL                                           ),
(358,   'Other'                 ,   358, 'No designation'                    ,  NULL                                           ),
(359,   'Other'                 ,   359, 'No designation'                    ,  NULL                                           ),
(360,   'Other'                 ,   360, 'No designation'                    ,  NULL                                           ),
(361,   'Other'                 ,   361, 'No designation'                    ,  NULL                                           ),
(362,   'Other'                 ,   362, 'No designation'                    ,  NULL                                           ),
(363,   'Other'                 ,   363, 'No designation'                    ,  NULL                                           ),
(364,   'Other'                 ,   364, 'No designation'                    ,  NULL                                           ),
(365,   'Other'                 ,   365, 'No designation'                    ,  NULL                                           ),
(366,   'Other'                 ,   366, 'No designation'                    ,  NULL                                           ),
(367,   'Other'                 ,   367, 'No designation'                    ,  NULL                                           ),
(368,   'Other'                 ,   368, 'No designation'                    ,  NULL                                           ),
(369,   'Other'                 ,   369, 'No designation'                    ,  NULL                                           ),
(370,   'Other'                 ,   370, 'No designation'                    ,  NULL                                           ),
(371,   'Other'                 ,   371, 'No designation'                    ,  NULL                                           ),
(372,   'Other'                 ,   372, 'No designation'                    ,  NULL                                           ),
(373,   'Other'                 ,   373, 'No designation'                    ,  NULL                                           ),
(374,   'Other'                 ,   374, 'No designation'                    ,  NULL                                           ),
(375,   'Other'                 ,   375, 'No designation'                    ,  NULL                                           ),
(376,   'Other'                 ,   376, 'No designation'                    ,  NULL                                           ),
(377,   'Other'                 ,   377, 'No designation'                    ,  NULL                                           ),
(378,   'Other'                 ,   378, 'No designation'                    ,  NULL                                           ),
(379,   'Other'                 ,   379, 'No designation'                    ,  NULL                                           ),
(380,   'Other'                 ,   380, 'No designation'                    ,  NULL                                           ),
(381,   'Other'                 ,   381, 'No designation'                    ,  NULL                                           ),
(382,   'Other'                 ,   382, 'No designation'                    ,  NULL                                           ),
(383,   'Other'                 ,   383, 'No designation'                    ,  NULL                                           ),
(384,   'Other'                 ,   384, 'No designation'                    ,  NULL                                           ),
(385,   'Other'                 ,   385, 'No designation'                    ,  NULL                                           ),
(386,   'Other'                 ,   386, 'No designation'                    ,  NULL                                           ),
(387,   'Other'                 ,   387, 'No designation'                    ,  NULL                                           ),
(388,   'Other'                 ,   388, 'No designation'                    ,  NULL                                           ),
(389,   'Other'                 ,   389, 'No designation'                    ,  NULL                                           ),
(390,   'Other'                 ,   390, 'No designation'                    ,  NULL                                           ),
(391,   'Other'                 ,   391, 'No designation'                    ,  NULL                                           ),
(392,   'Other'                 ,   392, 'No designation'                    ,  NULL                                           ),
(393,   'Other'                 ,   393, 'No designation'                    ,  NULL                                           ),
(394,   'Other'                 ,   394, 'No designation'                    ,  NULL                                           ),
(395,   'Other'                 ,   395, 'No designation'                    ,  NULL                                           ),
(396,   'Other'                 ,   396, 'No designation'                    ,  NULL                                           ),
(397,   'Other'                 ,   397, 'No designation'                    ,  NULL                                           ),
(398,   'Other'                 ,   398, 'No designation'                    ,  NULL                                           ),
(399,   'Other'                 ,   399, 'No designation'                    ,  NULL                                           ),
(400,   'Other'                 ,   400, 'No designation'                    ,  NULL                                           ),
(401,   'Other'                 ,   401, 'No designation'                    ,  NULL                                           ),
(402,   'Other'                 ,   402, 'No designation'                    ,  NULL                                           ),
(403,   'Other'                 ,   403, 'No designation'                    ,  NULL                                           ),
(404,   'Other'                 ,   404, 'No designation'                    ,  NULL                                           ),
(405,   'Other'                 ,   405, 'No designation'                    ,  NULL                                           ),
(406,   'Other'                 ,   406, 'No designation'                    ,  NULL                                           ),
(407,   'Other'                 ,   407, 'No designation'                    ,  NULL                                           ),
(408,   'Other'                 ,   408, 'No designation'                    ,  NULL                                           ),
(409,   'Other'                 ,   409, 'No designation'                    ,  NULL                                           ),
(410,   'Other'                 ,   410, 'No designation'                    ,  NULL                                           ),
(411,   'Other'                 ,   411, 'No designation'                    ,  NULL                                           ),
(412,   'Other'                 ,   412, 'No designation'                    ,  NULL                                           ),
(413,   'Other'                 ,   413, 'No designation'                    ,  NULL                                           ),
(414,   'Other'                 ,   414, 'No designation'                    ,  NULL                                           ),
(415,   'Other'                 ,   415, 'No designation'                    ,  NULL                                           ),
(416,   'Other'                 ,   416, 'No designation'                    ,  NULL                                           ),
(417,   'Other'                 ,   417, 'No designation'                    ,  NULL                                           ),
(418,   'Other'                 ,   418, 'No designation'                    ,  NULL                                           ),
(419,   'Other'                 ,   419, 'No designation'                    ,  NULL                                           ),
(420,   'Other'                 ,   420, 'No designation'                    ,  NULL                                           ),
(421,   'Other'                 ,   421, 'No designation'                    ,  NULL                                           ),
(422,   'Other'                 ,   422, 'No designation'                    ,  NULL                                           ),
(423,   'Other'                 ,   423, 'No designation'                    ,  NULL                                           ),
(424,   'Other'                 ,   424, 'No designation'                    ,  NULL                                           ),
(425,   'Other'                 ,   425, 'No designation'                    ,  NULL                                           ),
(426,   'Other'                 ,   426, 'No designation'                    ,  NULL                                           ),
(427,   'Other'                 ,   427, 'No designation'                    ,  NULL                                           ),
(428,   'Other'                 ,   428, 'No designation'                    ,  NULL                                           ),
(429,   'Other'                 ,   429, 'No designation'                    ,  NULL                                           ),
(430,   'Other'                 ,   430, 'No designation'                    ,  NULL                                           ),
(431,   'Other'                 ,   431, 'No designation'                    ,  NULL                                           ),
(432,   'Other'                 ,   432, 'No designation'                    ,  NULL                                           ),
(433,   'Other'                 ,   433, 'No designation'                    ,  NULL                                           ),
(434,   'Other'                 ,   434, 'No designation'                    ,  NULL                                           ),
(435,   'Other'                 ,   435, 'No designation'                    ,  NULL                                           ),
(436,   'Other'                 ,   436, 'No designation'                    ,  NULL                                           ),
(437,   'Other'                 ,   437, 'No designation'                    ,  NULL                                           ),
(438,   'Other'                 ,   438, 'No designation'                    ,  NULL                                           ),
(439,   'Other'                 ,   439, 'No designation'                    ,  NULL                                           ),
(440,   'Other'                 ,   440, 'No designation'                    ,  NULL                                           ),
(441,   'Other'                 ,   441, 'No designation'                    ,  NULL                                           ),
(442,   'Other'                 ,   442, 'No designation'                    ,  NULL                                           ),
(443,   'Other'                 ,   443, 'No designation'                    ,  NULL                                           ),
(444,   'Other'                 ,   444, 'No designation'                    ,  NULL                                           ),
(445,   'Other'                 ,   445, 'No designation'                    ,  NULL                                           ),
(446,   'Other'                 ,   446, 'No designation'                    ,  NULL                                           ),
(447,   'Other'                 ,   447, 'No designation'                    ,  NULL                                           ),
(448,   'Other'                 ,   448, 'No designation'                    ,  NULL                                           ),
(449,   'Other'                 ,   449, 'No designation'                    ,  NULL                                           ),
(450,   'Other'                 ,   450, 'No designation'                    ,  NULL                                           ),
(451,   'Other'                 ,   451, 'No designation'                    ,  NULL                                           ),
(452,   'Other'                 ,   452, 'No designation'                    ,  NULL                                           ),
(453,   'Other'                 ,   453, 'No designation'                    ,  NULL                                           ),
(454,   'Other'                 ,   454, 'No designation'                    ,  NULL                                           ),
(455,   'Other'                 ,   455, 'No designation'                    ,  NULL                                           ),
(456,   'Other'                 ,   456, 'No designation'                    ,  NULL                                           ),
(457,   'Other'                 ,   457, 'No designation'                    ,  NULL                                           ),
(458,   'Other'                 ,   458, 'No designation'                    ,  NULL                                           ),
(459,   'Other'                 ,   459, 'No designation'                    ,  NULL                                           ),
(460,   'Other'                 ,   460, 'No designation'                    ,  NULL                                           ),
(461,   'Other'                 ,   461, 'No designation'                    ,  NULL                                           ),
(462,   'Other'                 ,   462, 'No designation'                    ,  NULL                                           ),
(463,   'Other'                 ,   463, 'No designation'                    ,  NULL                                           ),
(464,   'Other'                 ,   464, 'No designation'                    ,  NULL                                           ),
(465,   'Other'                 ,   465, 'No designation'                    ,  NULL                                           ),
(466,   'Other'                 ,   466, 'No designation'                    ,  NULL                                           ),
(467,   'Other'                 ,   467, 'No designation'                    ,  NULL                                           ),
(468,   'Other'                 ,   468, 'No designation'                    ,  NULL                                           ),
(469,   'Other'                 ,   469, 'No designation'                    ,  NULL                                           ),
(470,   'Other'                 ,   470, 'No designation'                    ,  NULL                                           ),
(471,   'Other'                 ,   471, 'No designation'                    ,  NULL                                           ),
(472,   'Other'                 ,   472, 'No designation'                    ,  NULL                                           ),
(473,   'Other'                 ,   473, 'No designation'                    ,  NULL                                           ),
(474,   'Other'                 ,   474, 'No designation'                    ,  NULL                                           ),
(475,   'Other'                 ,   475, 'No designation'                    ,  NULL                                           ),
(476,   'Other'                 ,   476, 'No designation'                    ,  NULL                                           ),
(477,   'Other'                 ,   477, 'No designation'                    ,  NULL                                           ),
(478,   'Other'                 ,   478, 'No designation'                    ,  NULL                                           ),
(479,   'Other'                 ,   479, 'No designation'                    ,  NULL                                           ),
(480,   'Other'                 ,   480, 'No designation'                    ,  NULL                                           ),
(481,   'Other'                 ,   481, 'No designation'                    ,  NULL                                           ),
(482,   'Other'                 ,   482, 'No designation'                    ,  NULL                                           ),
(483,   'Other'                 ,   483, 'No designation'                    ,  NULL                                           ),
(484,   'Other'                 ,   484, 'No designation'                    ,  NULL                                           ),
(485,   'Other'                 ,   485, 'No designation'                    ,  NULL                                           ),
(486,   'Other'                 ,   486, 'No designation'                    ,  NULL                                           ),
(487,   'Other'                 ,   487, 'No designation'                    ,  NULL                                           ),
(488,   'Other'                 ,   488, 'No designation'                    ,  NULL                                           ),
(489,   'Other'                 ,   489, 'No designation'                    ,  NULL                                           ),
(490,   'Other'                 ,   490, 'No designation'                    ,  NULL                                           ),
(491,   'Other'                 ,   491, 'No designation'                    ,  NULL                                           ),
(492,   'Other'                 ,   492, 'No designation'                    ,  NULL                                           ),
(493,   'Other'                 ,   493, 'No designation'                    ,  NULL                                           ),
(494,   'Other'                 ,   494, 'No designation'                    ,  NULL                                           ),
(495,   'Other'                 ,   495, 'No designation'                    ,  NULL                                           ),
(496,   'Other'                 ,   496, 'No designation'                    ,  NULL                                           ),
(497,   'Other'                 ,   497, 'No designation'                    ,  NULL                                           ),
(498,   'Other'                 ,   498, 'No designation'                    ,  NULL                                           ),
(499,   'Other'                 ,   499, 'No designation'                    ,  NULL                                           ),
(500,   'Other'                 ,   500, 'No designation'                    ,  NULL                                           ),
(501,   'Other'                 ,   501, 'No designation'                    ,  NULL                                           ),
(502,   'Other'                 ,   502, 'No designation'                    ,  NULL                                           ),
(503,   'Other'                 ,   503, 'No designation'                    ,  NULL                                           ),
(504,   'Other'                 ,   504, 'No designation'                    ,  NULL                                           ),
(505,   'Other'                 ,   505, 'No designation'                    ,  NULL                                           ),
(506,   'Other'                 ,   506, 'No designation'                    ,  NULL                                           ),
(507,   'Other'                 ,   507, 'No designation'                    ,  NULL                                           ),
(508,   'Other'                 ,   508, 'No designation'                    ,  NULL                                           ),
(509,   'Other'                 ,   509, 'No designation'                    ,  NULL                                           ),
(510,   'Other'                 ,   510, 'No designation'                    ,  NULL                                           ),
(511,   'Other'                 ,   511, 'No designation'                    ,  NULL                                           ),
(512,   'Other'                 ,   512, 'No designation'                    ,  NULL                                           ),
(513,   'Other'                 ,   513, 'No designation'                    ,  NULL                                           ),
(514,   'Other'                 ,   514, 'No designation'                    ,  NULL                                           ),
(515,   'Other'                 ,   515, 'No designation'                    ,  NULL                                           ),
(516,   'Other'                 ,   516, 'No designation'                    ,  NULL                                           ),
(517,   'Other'                 ,   517, 'No designation'                    ,  NULL                                           ),
(518,   'Other'                 ,   518, 'No designation'                    ,  NULL                                           ),
(519,   'Other'                 ,   519, 'No designation'                    ,  NULL                                           ),
(520,   'Other'                 ,   520, 'No designation'                    ,  NULL                                           ),
(521,   'Other'                 ,   521, 'No designation'                    ,  NULL                                           ),
(522,   'Other'                 ,   522, 'No designation'                    ,  NULL                                           ),
(523,   'Other'                 ,   523, 'No designation'                    ,  NULL                                           ),
(524,   'Other'                 ,   524, 'No designation'                    ,  NULL                                           ),
(525,   'Other'                 ,   525, 'No designation'                    ,  NULL                                           ),
(526,   'Other'                 ,   526, 'No designation'                    ,  NULL                                           ),
(527,   'Other'                 ,   527, 'No designation'                    ,  NULL                                           ),
(528,   'Other'                 ,   528, 'No designation'                    ,  NULL                                           ),
(529,   'Other'                 ,   529, 'No designation'                    ,  NULL                                           ),
(530,   'Other'                 ,   530, 'No designation'                    ,  NULL                                           ),
(531,   'Other'                 ,   531, 'No designation'                    ,  NULL                                           ),
(532,   'Other'                 ,   532, 'No designation'                    ,  NULL                                           ),
(533,   'Other'                 ,   533, 'No designation'                    ,  NULL                                           ),
(534,   'Other'                 ,   534, 'No designation'                    ,  NULL                                           ),
(535,   'Other'                 ,   535, 'No designation'                    ,  NULL                                           ),
(536,   'Other'                 ,   536, 'No designation'                    ,  NULL                                           ),
(537,   'Other'                 ,   537, 'No designation'                    ,  NULL                                           ),
(538,   'Other'                 ,   538, 'No designation'                    ,  NULL                                           ),
(539,   'Other'                 ,   539, 'No designation'                    ,  NULL                                           ),
(540,   'Other'                 ,   540, 'No designation'                    ,  NULL                                           ),
(541,   'Other'                 ,   541, 'No designation'                    ,  NULL                                           ),
(542,   'Other'                 ,   542, 'No designation'                    ,  NULL                                           ),
(543,   'Other'                 ,   543, 'No designation'                    ,  NULL                                           ),
(544,   'Other'                 ,   544, 'No designation'                    ,  NULL                                           ),
(545,   'Other'                 ,   545, 'No designation'                    ,  NULL                                           ),
(546,   'Other'                 ,   546, 'No designation'                    ,  NULL                                           ),
(547,   'Other'                 ,   547, 'No designation'                    ,  NULL                                           ),
(548,   'Other'                 ,   548, 'No designation'                    ,  NULL                                           ),
(549,   'Other'                 ,   549, 'No designation'                    ,  NULL                                           ),
(550,   'Other'                 ,   550, 'No designation'                    ,  NULL                                           ),
(551,   'Other'                 ,   551, 'No designation'                    ,  NULL                                           ),
(552,   'Other'                 ,   552, 'No designation'                    ,  NULL                                           ),
(553,   'Other'                 ,   553, 'No designation'                    ,  NULL                                           ),
(554,   'Other'                 ,   554, 'No designation'                    ,  NULL                                           ),
(555,   'Other'                 ,   555, 'No designation'                    ,  NULL                                           ),
(556,   'Other'                 ,   556, 'No designation'                    ,  NULL                                           ),
(557,   'Other'                 ,   557, 'No designation'                    ,  NULL                                           ),
(558,   'Other'                 ,   558, 'No designation'                    ,  NULL                                           ),
(559,   'Other'                 ,   559, 'No designation'                    ,  NULL                                           ),
(560,   'Other'                 ,   560, 'No designation'                    ,  NULL                                           ),
(561,   'Other'                 ,   561, 'No designation'                    ,  NULL                                           ),
(562,   'Other'                 ,   562, 'No designation'                    ,  NULL                                           ),
(563,   'Other'                 ,   563, 'No designation'                    ,  NULL                                           ),
(564,   'Other'                 ,   564, 'No designation'                    ,  NULL                                           ),
(565,   'Other'                 ,   565, 'No designation'                    ,  NULL                                           ),
(566,   'Other'                 ,   566, 'No designation'                    ,  NULL                                           ),
(567,   'Other'                 ,   567, 'No designation'                    ,  NULL                                           ),
(568,   'Other'                 ,   568, 'No designation'                    ,  NULL                                           ),
(569,   'Other'                 ,   569, 'No designation'                    ,  NULL                                           ),
(570,   'Other'                 ,   570, 'No designation'                    ,  NULL                                           ),
(571,   'Other'                 ,   571, 'No designation'                    ,  NULL                                           ),
(572,   'Other'                 ,   572, 'No designation'                    ,  NULL                                           ),
(573,   'Other'                 ,   573, 'No designation'                    ,  NULL                                           ),
(574,   'Other'                 ,   574, 'No designation'                    ,  NULL                                           ),
(575,   'Other'                 ,   575, 'No designation'                    ,  NULL                                           ),
(576,   'Other'                 ,   576, 'No designation'                    ,  NULL                                           ),
(577,   'Other'                 ,   577, 'No designation'                    ,  NULL                                           ),
(578,   'Other'                 ,   578, 'No designation'                    ,  NULL                                           ),
(579,   'Other'                 ,   579, 'No designation'                    ,  NULL                                           ),
(580,   'Other'                 ,   580, 'No designation'                    ,  NULL                                           ),
(581,   'Other'                 ,   581, 'No designation'                    ,  NULL                                           ),
(582,   'Other'                 ,   582, 'No designation'                    ,  NULL                                           ),
(583,   'Other'                 ,   583, 'No designation'                    ,  NULL                                           ),
(584,   'Other'                 ,   584, 'No designation'                    ,  NULL                                           ),
(585,   'Other'                 ,   585, 'No designation'                    ,  NULL                                           ),
(586,   'Other'                 ,   586, 'No designation'                    ,  NULL                                           ),
(587,   'Other'                 ,   587, 'No designation'                    ,  NULL                                           ),
(588,   'Other'                 ,   588, 'No designation'                    ,  NULL                                           ),
(589,   'Other'                 ,   589, 'No designation'                    ,  NULL                                           ),
(590,   'Other'                 ,   590, 'No designation'                    ,  NULL                                           ),
(591,   'Other'                 ,   591, 'No designation'                    ,  NULL                                           ),
(592,   'Other'                 ,   592, 'No designation'                    ,  NULL                                           ),
(593,   'Other'                 ,   593, 'No designation'                    ,  NULL                                           ),
(594,   'Other'                 ,   594, 'No designation'                    ,  NULL                                           ),
(595,   'Other'                 ,   595, 'No designation'                    ,  NULL                                           ),
(596,   'Other'                 ,   596, 'No designation'                    ,  NULL                                           ),
(597,   'Other'                 ,   597, 'No designation'                    ,  NULL                                           ),
(598,   'Other'                 ,   598, 'No designation'                    ,  NULL                                           ),
(599,   'Other'                 ,   599, 'No designation'                    ,  NULL                                           ),
(600,   'Other'                 ,   600, 'No designation'                    ,  NULL                                           ),
(601,   'Other'                 ,   601, 'No designation'                    ,  NULL                                           ),
(602,   'Other'                 ,   602, 'No designation'                    ,  NULL                                           ),
(603,   'Other'                 ,   603, 'No designation'                    ,  NULL                                           ),
(604,   'Other'                 ,   604, 'No designation'                    ,  NULL                                           ),
(605,   'Other'                 ,   605, 'No designation'                    ,  NULL                                           ),
(606,   'Other'                 ,   606, 'No designation'                    ,  NULL                                           ),
(607,   'Other'                 ,   607, 'No designation'                    ,  NULL                                           ),
(608,   'Other'                 ,   608, 'No designation'                    ,  NULL                                           ),
(609,   'Other'                 ,   609, 'No designation'                    ,  NULL                                           ),
(610,   'Other'                 ,   610, 'No designation'                    ,  NULL                                           ),
(611,   'Other'                 ,   611, 'No designation'                    ,  NULL                                           ),
(612,   'Other'                 ,   612, 'No designation'                    ,  NULL                                           ),
(613,   'Other'                 ,   613, 'No designation'                    ,  NULL                                           ),
(614,   'Other'                 ,   614, 'No designation'                    ,  NULL                                           ),
(615,   'Other'                 ,   615, 'No designation'                    ,  NULL                                           ),
(616,   'Other'                 ,   616, 'No designation'                    ,  NULL                                           ),
(617,   'Other'                 ,   617, 'No designation'                    ,  NULL                                           ),
(618,   'Other'                 ,   618, 'No designation'                    ,  NULL                                           ),
(619,   'Other'                 ,   619, 'No designation'                    ,  NULL                                           ),
(620,   'Other'                 ,   620, 'No designation'                    ,  NULL                                           ),
(621,   'Other'                 ,   621, 'No designation'                    ,  NULL                                           ),
(622,   'Other'                 ,   622, 'No designation'                    ,  NULL                                           ),
(623,   'Other'                 ,   623, 'No designation'                    ,  NULL                                           ),
(624,   'Other'                 ,   624, 'No designation'                    ,  NULL                                           ),
(625,   'Other'                 ,   625, 'No designation'                    ,  NULL                                           ),
(626,   'Other'                 ,   626, 'No designation'                    ,  NULL                                           ),
(627,   'Other'                 ,   627, 'No designation'                    ,  NULL                                           ),
(628,   'Other'                 ,   628, 'No designation'                    ,  NULL                                           ),
(629,   'Other'                 ,   629, 'No designation'                    ,  NULL                                           ),
(630,   'Other'                 ,   630, 'No designation'                    ,  NULL                                           ),
(631,   'Other'                 ,   631, 'No designation'                    ,  NULL                                           ),
(632,   'Other'                 ,   632, 'No designation'                    ,  NULL                                           ),
(633,   'Other'                 ,   633, 'No designation'                    ,  NULL                                           ),
(634,   'Other'                 ,   634, 'No designation'                    ,  NULL                                           ),
(635,   'Other'                 ,   635, 'No designation'                    ,  NULL                                           ),
(636,   'Other'                 ,   636, 'No designation'                    ,  NULL                                           ),
(637,   'Other'                 ,   637, 'No designation'                    ,  NULL                                           ),
(638,   'Other'                 ,   638, 'No designation'                    ,  NULL                                           ),
(639,   'Other'                 ,   639, 'No designation'                    ,  NULL                                           ),
(640,   'Other'                 ,   640, 'No designation'                    ,  NULL                                           ),
(641,   'Other'                 ,   641, 'No designation'                    ,  NULL                                           ),
(642,   'Other'                 ,   642, 'No designation'                    ,  NULL                                           ),
(643,   'Other'                 ,   643, 'No designation'                    ,  NULL                                           ),
(644,   'Other'                 ,   644, 'No designation'                    ,  NULL                                           ),
(645,   'Other'                 ,   645, 'No designation'                    ,  NULL                                           ),
(646,   'Other'                 ,   646, 'No designation'                    ,  NULL                                           ),
(647,   'Other'                 ,   647, 'No designation'                    ,  NULL                                           ),
(648,   'Other'                 ,   648, 'No designation'                    ,  NULL                                           ),
(649,   'Other'                 ,   649, 'No designation'                    ,  NULL                                           ),
(650,   'Other'                 ,   650, 'No designation'                    ,  NULL                                           ),
(651,   'Other'                 ,   651, 'No designation'                    ,  NULL                                           ),
(652,   'Other'                 ,   652, 'No designation'                    ,  NULL                                           ),
(653,   'Other'                 ,   653, 'No designation'                    ,  NULL                                           ),
(654,   'Other'                 ,   654, 'No designation'                    ,  NULL                                           ),
(655,   'Other'                 ,   655, 'No designation'                    ,  NULL                                           ),
(656,   'Other'                 ,   656, 'No designation'                    ,  NULL                                           ),
(657,   'Other'                 ,   657, 'No designation'                    ,  NULL                                           ),
(658,   'Other'                 ,   658, 'No designation'                    ,  NULL                                           ),
(659,   'Other'                 ,   659, 'No designation'                    ,  NULL                                           ),
(660,   'Other'                 ,   660, 'No designation'                    ,  NULL                                           ),
(661,   'Other'                 ,   661, 'No designation'                    ,  NULL                                           ),
(662,   'Other'                 ,   662, 'No designation'                    ,  NULL                                           ),
(663,   'Other'                 ,   663, 'No designation'                    ,  NULL                                           ),
(664,   'Other'                 ,   664, 'No designation'                    ,  NULL                                           ),
(665,   'Other'                 ,   665, 'No designation'                    ,  NULL                                           ),
(666,   'Other'                 ,   666, 'No designation'                    ,  NULL                                           ),
(667,   'Other'                 ,   667, 'No designation'                    ,  NULL                                           ),
(668,   'Other'                 ,   668, 'No designation'                    ,  NULL                                           ),
(669,   'Other'                 ,   669, 'No designation'                    ,  NULL                                           ),
(670,   'Other'                 ,   670, 'No designation'                    ,  NULL                                           ),
(671,   'Other'                 ,   671, 'No designation'                    ,  NULL                                           ),
(672,   'Other'                 ,   672, 'No designation'                    ,  NULL                                           ),
(673,   'Other'                 ,   673, 'No designation'                    ,  NULL                                           ),
(674,   'Other'                 ,   674, 'No designation'                    ,  NULL                                           ),
(675,   'Other'                 ,   675, 'No designation'                    ,  NULL                                           ),
(676,   'Other'                 ,   676, 'No designation'                    ,  NULL                                           ),
(677,   'Other'                 ,   677, 'No designation'                    ,  NULL                                           ),
(678,   'Other'                 ,   678, 'No designation'                    ,  NULL                                           ),
(679,   'Other'                 ,   679, 'No designation'                    ,  NULL                                           ),
(680,   'Other'                 ,   680, 'No designation'                    ,  NULL                                           ),
(681,   'Other'                 ,   681, 'No designation'                    ,  NULL                                           ),
(682,   'Other'                 ,   682, 'No designation'                    ,  NULL                                           ),
(683,   'Other'                 ,   683, 'No designation'                    ,  NULL                                           ),
(684,   'Other'                 ,   684, 'No designation'                    ,  NULL                                           ),
(685,   'Other'                 ,   685, 'No designation'                    ,  NULL                                           ),
(686,   'Other'                 ,   686, 'No designation'                    ,  NULL                                           ),
(687,   'Other'                 ,   687, 'No designation'                    ,  NULL                                           ),
(688,   'Other'                 ,   688, 'No designation'                    ,  NULL                                           ),
(689,   'Other'                 ,   689, 'No designation'                    ,  NULL                                           ),
(690,   'Other'                 ,   690, 'No designation'                    ,  NULL                                           ),
(691,   'Other'                 ,   691, 'No designation'                    ,  NULL                                           ),
(692,   'Other'                 ,   692, 'No designation'                    ,  NULL                                           ),
(693,   'Other'                 ,   693, 'No designation'                    ,  NULL                                           ),
(694,   'Other'                 ,   694, 'No designation'                    ,  NULL                                           ),
(695,   'Other'                 ,   695, 'No designation'                    ,  NULL                                           ),
(696,   'Other'                 ,   696, 'No designation'                    ,  NULL                                           ),
(697,   'Other'                 ,   697, 'No designation'                    ,  NULL                                           ),
(698,   'Other'                 ,   698, 'No designation'                    ,  NULL                                           ),
(699,   'Other'                 ,   699, 'No designation'                    ,  NULL                                           ),
(700,   'Other'                 ,   700, 'No designation'                    ,  NULL                                           ),
(701,   'Other'                 ,   701, 'No designation'                    ,  NULL                                           ),
(702,   'Other'                 ,   702, 'No designation'                    ,  NULL                                           ),
(703,   'Other'                 ,   703, 'No designation'                    ,  NULL                                           ),
(704,   'Other'                 ,   704, 'No designation'                    ,  NULL                                           ),
(705,   'Other'                 ,   705, 'No designation'                    ,  NULL                                           ),
(706,   'Other'                 ,   706, 'No designation'                    ,  NULL                                           ),
(707,   'Other'                 ,   707, 'No designation'                    ,  NULL                                           ),
(708,   'Other'                 ,   708, 'No designation'                    ,  NULL                                           ),
(709,   'Other'                 ,   709, 'No designation'                    ,  NULL                                           ),
(710,   'Other'                 ,   710, 'No designation'                    ,  NULL                                           ),
(711,   'Other'                 ,   711, 'No designation'                    ,  NULL                                           ),
(712,   'Other'                 ,   712, 'No designation'                    ,  NULL                                           ),
(713,   'Other'                 ,   713, 'No designation'                    ,  NULL                                           ),
(714,   'Other'                 ,   714, 'No designation'                    ,  NULL                                           ),
(715,   'Other'                 ,   715, 'No designation'                    ,  NULL                                           ),
(716,   'Other'                 ,   716, 'No designation'                    ,  NULL                                           ),
(717,   'Other'                 ,   717, 'No designation'                    ,  NULL                                           ),
(718,   'Other'                 ,   718, 'No designation'                    ,  NULL                                           ),
(719,   'Other'                 ,   719, 'No designation'                    ,  NULL                                           ),
(720,   'Other'                 ,   720, 'No designation'                    ,  NULL                                           ),
(721,   'Other'                 ,   721, 'No designation'                    ,  NULL                                           ),
(722,   'Other'                 ,   722, 'No designation'                    ,  NULL                                           ),
(723,   'Other'                 ,   723, 'No designation'                    ,  NULL                                           ),
(724,   'Other'                 ,   724, 'No designation'                    ,  NULL                                           ),
(725,   'Other'                 ,   725, 'No designation'                    ,  NULL                                           ),
(726,   'Other'                 ,   726, 'No designation'                    ,  NULL                                           ),
(727,   'Other'                 ,   727, 'No designation'                    ,  NULL                                           ),
(728,   'Other'                 ,   728, 'No designation'                    ,  NULL                                           ),
(729,   'Other'                 ,   729, 'No designation'                    ,  NULL                                           ),
(730,   'Other'                 ,   730, 'No designation'                    ,  NULL                                           ),
(731,   'Other'                 ,   731, 'No designation'                    ,  NULL                                           ),
(732,   'Other'                 ,   732, 'No designation'                    ,  NULL                                           ),
(733,   'Other'                 ,   733, 'No designation'                    ,  NULL                                           ),
(734,   'Other'                 ,   734, 'No designation'                    ,  NULL                                           ),
(735,   'Other'                 ,   735, 'No designation'                    ,  NULL                                           ),
(736,   'Other'                 ,   736, 'No designation'                    ,  NULL                                           ),
(737,   'Other'                 ,   737, 'No designation'                    ,  NULL                                           ),
(738,   'Other'                 ,   738, 'No designation'                    ,  NULL                                           ),
(739,   'Other'                 ,   739, 'No designation'                    ,  NULL                                           ),
(740,   'Other'                 ,   740, 'No designation'                    ,  NULL                                           ),
(741,   'Other'                 ,   741, 'No designation'                    ,  NULL                                           ),
(742,   'Other'                 ,   742, 'No designation'                    ,  NULL                                           ),
(743,   'Other'                 ,   743, 'No designation'                    ,  NULL                                           ),
(744,   'Other'                 ,   744, 'No designation'                    ,  NULL                                           ),
(745,   'Other'                 ,   745, 'No designation'                    ,  NULL                                           ),
(746,   'Other'                 ,   746, 'No designation'                    ,  NULL                                           ),
(747,   'Other'                 ,   747, 'No designation'                    ,  NULL                                           ),
(748,   'Other'                 ,   748, 'No designation'                    ,  NULL                                           ),
(749,   'Other'                 ,   749, 'No designation'                    ,  NULL                                           ),
(750,   'Other'                 ,   750, 'No designation'                    ,  NULL                                           ),
(751,   'Other'                 ,   751, 'No designation'                    ,  NULL                                           ),
(752,   'Other'                 ,   752, 'No designation'                    ,  NULL                                           ),
(753,   'Other'                 ,   753, 'No designation'                    ,  NULL                                           ),
(754,   'Other'                 ,   754, 'No designation'                    ,  NULL                                           ),
(755,   'Other'                 ,   755, 'No designation'                    ,  NULL                                           ),
(756,   'Other'                 ,   756, 'No designation'                    ,  NULL                                           ),
(757,   'Other'                 ,   757, 'No designation'                    ,  NULL                                           ),
(758,   'Other'                 ,   758, 'No designation'                    ,  NULL                                           ),
(759,   'Other'                 ,   759, 'No designation'                    ,  NULL                                           ),
(760,   'Other'                 ,   760, 'No designation'                    ,  NULL                                           ),
(761,   'Other'                 ,   761, 'No designation'                    ,  NULL                                           ),
(762,   'Other'                 ,   762, 'No designation'                    ,  NULL                                           ),
(763,   'Other'                 ,   763, 'No designation'                    ,  NULL                                           ),
(764,   'Other'                 ,   764, 'No designation'                    ,  NULL                                           ),
(765,   'Other'                 ,   765, 'No designation'                    ,  NULL                                           ),
(766,   'Other'                 ,   766, 'No designation'                    ,  NULL                                           ),
(767,   'Other'                 ,   767, 'No designation'                    ,  NULL                                           ),
(768,   'Other'                 ,   768, 'No designation'                    ,  NULL                                           ),
(769,   'Other'                 ,   769, 'No designation'                    ,  NULL                                           ),
(770,   'Other'                 ,   770, 'No designation'                    ,  NULL                                           ),
(771,   'Other'                 ,   771, 'No designation'                    ,  NULL                                           ),
(772,   'Other'                 ,   772, 'No designation'                    ,  NULL                                           ),
(773,   'Other'                 ,   773, 'No designation'                    ,  NULL                                           ),
(774,   'Other'                 ,   774, 'No designation'                    ,  NULL                                           ),
(775,   'Other'                 ,   775, 'No designation'                    ,  NULL                                           ),
(776,   'Other'                 ,   776, 'No designation'                    ,  NULL                                           ),
(777,   'Other'                 ,   777, 'No designation'                    ,  NULL                                           ),
(778,   'Other'                 ,   778, 'No designation'                    ,  NULL                                           ),
(779,   'Other'                 ,   779, 'No designation'                    ,  NULL                                           ),
(780,   'Other'                 ,   780, 'No designation'                    ,  NULL                                           ),
(781,   'Other'                 ,   781, 'No designation'                    ,  NULL                                           ),
(782,   'Other'                 ,   782, 'No designation'                    ,  NULL                                           ),
(783,   'Other'                 ,   783, 'No designation'                    ,  NULL                                           ),
(784,   'Other'                 ,   784, 'No designation'                    ,  NULL                                           ),
(785,   'Other'                 ,   785, 'No designation'                    ,  NULL                                           ),
(786,   'Other'                 ,   786, 'No designation'                    ,  NULL                                           ),
(787,   'Other'                 ,   787, 'No designation'                    ,  NULL                                           ),
(788,   'Other'                 ,   788, 'No designation'                    ,  NULL                                           ),
(789,   'Other'                 ,   789, 'No designation'                    ,  NULL                                           ),
(790,   'Other'                 ,   790, 'No designation'                    ,  NULL                                           ),
(791,   'Other'                 ,   791, 'No designation'                    ,  NULL                                           ),
(792,   'Other'                 ,   792, 'No designation'                    ,  NULL                                           ),
(793,   'Other'                 ,   793, 'No designation'                    ,  NULL                                           ),
(794,   'Other'                 ,   794, 'No designation'                    ,  NULL                                           ),
(795,   'Other'                 ,   795, 'No designation'                    ,  NULL                                           ),
(796,   'Other'                 ,   796, 'No designation'                    ,  NULL                                           ),
(797,   'Other'                 ,   797, 'No designation'                    ,  NULL                                           ),
(798,   'Other'                 ,   798, 'No designation'                    ,  NULL                                           ),
(799,   'Other'                 ,   799, 'No designation'                    ,  NULL                                           ),
(800,   'Other'                 ,   800, 'No designation'                    ,  NULL                                           ),
(801,   'Other'                 ,   801, 'No designation'                    ,  NULL                                           ),
(802,   'Other'                 ,   802, 'No designation'                    ,  NULL                                           ),
(803,   'Other'                 ,   803, 'No designation'                    ,  NULL                                           ),
(804,   'Other'                 ,   804, 'No designation'                    ,  NULL                                           ),
(805,   'Other'                 ,   805, 'No designation'                    ,  NULL                                           ),
(806,   'Other'                 ,   806, 'No designation'                    ,  NULL                                           ),
(807,   'Other'                 ,   807, 'No designation'                    ,  NULL                                           ),
(808,   'Other'                 ,   808, 'No designation'                    ,  NULL                                           ),
(809,   'Other'                 ,   809, 'No designation'                    ,  NULL                                           ),
(810,   'Other'                 ,   810, 'No designation'                    ,  NULL                                           ),
(811,   'Other'                 ,   811, 'No designation'                    ,  NULL                                           ),
(812,   'Other'                 ,   812, 'No designation'                    ,  NULL                                           ),
(813,   'Other'                 ,   813, 'No designation'                    ,  NULL                                           ),
(814,   'Other'                 ,   814, 'No designation'                    ,  NULL                                           ),
(815,   'Other'                 ,   815, 'No designation'                    ,  NULL                                           ),
(816,   'Other'                 ,   816, 'No designation'                    ,  NULL                                           ),
(817,   'Other'                 ,   817, 'No designation'                    ,  NULL                                           ),
(818,   'Other'                 ,   818, 'No designation'                    ,  NULL                                           ),
(819,   'Other'                 ,   819, 'No designation'                    ,  NULL                                           ),
(820,   'Other'                 ,   820, 'No designation'                    ,  NULL                                           ),
(821,   'Other'                 ,   821, 'No designation'                    ,  NULL                                           ),
(822,   'Other'                 ,   822, 'No designation'                    ,  NULL                                           ),
(823,   'Other'                 ,   823, 'No designation'                    ,  NULL                                           ),
(824,   'Other'                 ,   824, 'No designation'                    ,  NULL                                           ),
(825,   'Other'                 ,   825, 'No designation'                    ,  NULL                                           ),
(826,   'Other'                 ,   826, 'No designation'                    ,  NULL                                           ),
(827,   'Other'                 ,   827, 'No designation'                    ,  NULL                                           ),
(828,   'Other'                 ,   828, 'No designation'                    ,  NULL                                           ),
(829,   'Other'                 ,   829, 'No designation'                    ,  NULL                                           ),
(830,   'Other'                 ,   830, 'No designation'                    ,  NULL                                           ),
(831,   'Other'                 ,   831, 'No designation'                    ,  NULL                                           ),
(832,   'Other'                 ,   832, 'No designation'                    ,  NULL                                           ),
(833,   'Other'                 ,   833, 'No designation'                    ,  NULL                                           ),
(834,   'Other'                 ,   834, 'No designation'                    ,  NULL                                           ),
(835,   'Other'                 ,   835, 'No designation'                    ,  NULL                                           ),
(836,   'Other'                 ,   836, 'No designation'                    ,  NULL                                           ),
(837,   'Other'                 ,   837, 'No designation'                    ,  NULL                                           ),
(838,   'Other'                 ,   838, 'No designation'                    ,  NULL                                           ),
(839,   'Other'                 ,   839, 'No designation'                    ,  NULL                                           ),
(840,   'Other'                 ,   840, 'No designation'                    ,  NULL                                           ),
(841,   'Other'                 ,   841, 'No designation'                    ,  NULL                                           ),
(842,   'Other'                 ,   842, 'No designation'                    ,  NULL                                           ),
(843,   'Other'                 ,   843, 'No designation'                    ,  NULL                                           ),
(844,   'Other'                 ,   844, 'No designation'                    ,  NULL                                           ),
(845,   'Other'                 ,   845, 'No designation'                    ,  NULL                                           ),
(846,   'Other'                 ,   846, 'No designation'                    ,  NULL                                           ),
(847,   'Other'                 ,   847, 'No designation'                    ,  NULL                                           ),
(848,   'Other'                 ,   848, 'No designation'                    ,  NULL                                           ),
(849,   'Other'                 ,   849, 'No designation'                    ,  NULL                                           ),
(850,   'Other'                 ,   850, 'No designation'                    ,  NULL                                           ),
(851,   'Other'                 ,   851, 'No designation'                    ,  NULL                                           ),
(852,   'Other'                 ,   852, 'No designation'                    ,  NULL                                           ),
(853,   'Other'                 ,   853, 'No designation'                    ,  NULL                                           ),
(854,   'Other'                 ,   854, 'No designation'                    ,  NULL                                           ),
(855,   'Other'                 ,   855, 'No designation'                    ,  NULL                                           ),
(856,   'Other'                 ,   856, 'No designation'                    ,  NULL                                           ),
(857,   'Other'                 ,   857, 'No designation'                    ,  NULL                                           ),
(858,   'Other'                 ,   858, 'No designation'                    ,  NULL                                           ),
(859,   'Other'                 ,   859, 'No designation'                    ,  NULL                                           ),
(860,   'Other'                 ,   860, 'No designation'                    ,  NULL                                           ),
(861,   'Other'                 ,   861, 'No designation'                    ,  NULL                                           ),
(862,   'Other'                 ,   862, 'No designation'                    ,  NULL                                           ),
(863,   'Other'                 ,   863, 'No designation'                    ,  NULL                                           ),
(864,   'Other'                 ,   864, 'No designation'                    ,  NULL                                           ),
(865,   'Other'                 ,   865, 'No designation'                    ,  NULL                                           ),
(866,   'Other'                 ,   866, 'No designation'                    ,  NULL                                           ),
(867,   'Other'                 ,   867, 'No designation'                    ,  NULL                                           ),
(868,   'Other'                 ,   868, 'No designation'                    ,  NULL                                           ),
(869,   'Other'                 ,   869, 'No designation'                    ,  NULL                                           ),
(870,   'Other'                 ,   870, 'No designation'                    ,  NULL                                           ),
(871,   'Other'                 ,   871, 'No designation'                    ,  NULL                                           ),
(872,   'Other'                 ,   872, 'No designation'                    ,  NULL                                           ),
(873,   'Other'                 ,   873, 'No designation'                    ,  NULL                                           ),
(874,   'Other'                 ,   874, 'No designation'                    ,  NULL                                           ),
(875,   'Other'                 ,   875, 'No designation'                    ,  NULL                                           ),
(876,   'Other'                 ,   876, 'No designation'                    ,  NULL                                           ),
(877,   'Other'                 ,   877, 'No designation'                    ,  NULL                                           ),
(878,   'Other'                 ,   878, 'No designation'                    ,  NULL                                           ),
(879,   'Other'                 ,   879, 'No designation'                    ,  NULL                                           ),
(880,   'Other'                 ,   880, 'No designation'                    ,  NULL                                           ),
(881,   'Other'                 ,   881, 'No designation'                    ,  NULL                                           ),
(882,   'Other'                 ,   882, 'No designation'                    ,  NULL                                           ),
(883,   'Other'                 ,   883, 'No designation'                    ,  NULL                                           ),
(884,   'Other'                 ,   884, 'No designation'                    ,  NULL                                           ),
(885,   'Other'                 ,   885, 'No designation'                    ,  NULL                                           ),
(886,   'Other'                 ,   886, 'No designation'                    ,  NULL                                           ),
(887,   'Other'                 ,   887, 'No designation'                    ,  NULL                                           ),
(888,   'Other'                 ,   888, 'No designation'                    ,  NULL                                           ),
(889,   'Other'                 ,   889, 'No designation'                    ,  NULL                                           ),
(890,   'Other'                 ,   890, 'No designation'                    ,  NULL                                           ),
(891,   'Other'                 ,   891, 'No designation'                    ,  NULL                                           ),
(892,   'Other'                 ,   892, 'No designation'                    ,  NULL                                           ),
(893,   'Other'                 ,   893, 'No designation'                    ,  NULL                                           ),
(894,   'Other'                 ,   894, 'No designation'                    ,  NULL                                           ),
(895,   'Other'                 ,   895, 'No designation'                    ,  NULL                                           ),
(896,   'Other'                 ,   896, 'No designation'                    ,  NULL                                           ),
(897,   'Other'                 ,   897, 'No designation'                    ,  NULL                                           ),
(898,   'Other'                 ,   898, 'No designation'                    ,  NULL                                           ),
(899,   'Other'                 ,   899, 'No designation'                    ,  NULL                                           ),
(900,   'Other'                 ,   900, 'No designation'                    ,  NULL                                           ),
(901,   'Other'                 ,   901, 'No designation'                    ,  NULL                                           ),
(902,   'Other'                 ,   902, 'No designation'                    ,  NULL                                           ),
(903,   'Other'                 ,   903, 'No designation'                    ,  NULL                                           ),
(904,   'Other'                 ,   904, 'No designation'                    ,  NULL                                           ),
(905,   'Other'                 ,   905, 'No designation'                    ,  NULL                                           ),
(906,   'Other'                 ,   906, 'No designation'                    ,  NULL                                           ),
(907,   'Other'                 ,   907, 'No designation'                    ,  NULL                                           ),
(908,   'Other'                 ,   908, 'No designation'                    ,  NULL                                           ),
(909,   'Other'                 ,   909, 'No designation'                    ,  NULL                                           ),
(910,   'Other'                 ,   910, 'No designation'                    ,  NULL                                           ),
(911,   'Other'                 ,   911, 'No designation'                    ,  NULL                                           ),
(912,   'Other'                 ,   912, 'No designation'                    ,  NULL                                           ),
(913,   'Other'                 ,   913, 'No designation'                    ,  NULL                                           ),
(914,   'Other'                 ,   914, 'No designation'                    ,  NULL                                           ),
(915,   'Other'                 ,   915, 'No designation'                    ,  NULL                                           ),
(916,   'Other'                 ,   916, 'No designation'                    ,  NULL                                           ),
(917,   'Other'                 ,   917, 'No designation'                    ,  NULL                                           ),
(918,   'Other'                 ,   918, 'No designation'                    ,  NULL                                           ),
(919,   'Other'                 ,   919, 'No designation'                    ,  NULL                                           ),
(920,   'Other'                 ,   920, 'No designation'                    ,  NULL                                           ),
(921,   'Other'                 ,   921, 'No designation'                    ,  NULL                                           ),
(922,   'Other'                 ,   922, 'No designation'                    ,  NULL                                           ),
(923,   'Other'                 ,   923, 'No designation'                    ,  NULL                                           ),
(924,   'Other'                 ,   924, 'No designation'                    ,  NULL                                           ),
(925,   'Other'                 ,   925, 'No designation'                    ,  NULL                                           ),
(926,   'Other'                 ,   926, 'No designation'                    ,  NULL                                           ),
(927,   'Other'                 ,   927, 'No designation'                    ,  NULL                                           ),
(928,   'Other'                 ,   928, 'No designation'                    ,  NULL                                           ),
(929,   'Other'                 ,   929, 'No designation'                    ,  NULL                                           ),
(930,   'Other'                 ,   930, 'No designation'                    ,  NULL                                           ),
(931,   'Other'                 ,   931, 'No designation'                    ,  NULL                                           ),
(932,   'Other'                 ,   932, 'No designation'                    ,  NULL                                           ),
(933,   'Other'                 ,   933, 'No designation'                    ,  NULL                                           ),
(934,   'Other'                 ,   934, 'No designation'                    ,  NULL                                           ),
(935,   'Other'                 ,   935, 'No designation'                    ,  NULL                                           ),
(936,   'Other'                 ,   936, 'No designation'                    ,  NULL                                           ),
(937,   'Other'                 ,   937, 'No designation'                    ,  NULL                                           ),
(938,   'Other'                 ,   938, 'No designation'                    ,  NULL                                           ),
(939,   'Other'                 ,   939, 'No designation'                    ,  NULL                                           ),
(940,   'Other'                 ,   940, 'No designation'                    ,  NULL                                           ),
(941,   'Other'                 ,   941, 'No designation'                    ,  NULL                                           ),
(942,   'Other'                 ,   942, 'No designation'                    ,  NULL                                           ),
(943,   'Other'                 ,   943, 'No designation'                    ,  NULL                                           ),
(944,   'Other'                 ,   944, 'No designation'                    ,  NULL                                           ),
(945,   'Other'                 ,   945, 'No designation'                    ,  NULL                                           ),
(946,   'Other'                 ,   946, 'No designation'                    ,  NULL                                           ),
(947,   'Other'                 ,   947, 'No designation'                    ,  NULL                                           ),
(948,   'Other'                 ,   948, 'No designation'                    ,  NULL                                           ),
(949,   'Other'                 ,   949, 'No designation'                    ,  NULL                                           ),
(950,   'Other'                 ,   950, 'No designation'                    ,  NULL                                           ),
(951,   'Other'                 ,   951, 'No designation'                    ,  NULL                                           ),
(952,   'Other'                 ,   952, 'No designation'                    ,  NULL                                           ),
(953,   'Other'                 ,   953, 'No designation'                    ,  NULL                                           ),
(954,   'Other'                 ,   954, 'No designation'                    ,  NULL                                           ),
(955,   'Other'                 ,   955, 'No designation'                    ,  NULL                                           ),
(956,   'Other'                 ,   956, 'No designation'                    ,  NULL                                           ),
(957,   'Other'                 ,   957, 'No designation'                    ,  NULL                                           ),
(958,   'Other'                 ,   958, 'No designation'                    ,  NULL                                           ),
(959,   'Other'                 ,   959, 'No designation'                    ,  NULL                                           ),
(960,   'Other'                 ,   960, 'No designation'                    ,  NULL                                           ),
(961,   'Other'                 ,   961, 'No designation'                    ,  NULL                                           ),
(962,   'Other'                 ,   962, 'No designation'                    ,  NULL                                           ),
(963,   'Other'                 ,   963, 'No designation'                    ,  NULL                                           ),
(964,   'Other'                 ,   964, 'No designation'                    ,  NULL                                           ),
(965,   'Other'                 ,   965, 'No designation'                    ,  NULL                                           ),
(966,   'Other'                 ,   966, 'No designation'                    ,  NULL                                           ),
(967,   'Other'                 ,   967, 'No designation'                    ,  NULL                                           ),
(968,   'Other'                 ,   968, 'No designation'                    ,  NULL                                           ),
(969,   'Other'                 ,   969, 'No designation'                    ,  NULL                                           ),
(970,   'Other'                 ,   970, 'No designation'                    ,  NULL                                           ),
(971,   'Other'                 ,   971, 'No designation'                    ,  NULL                                           ),
(972,   'Other'                 ,   972, 'No designation'                    ,  NULL                                           ),
(973,   'Other'                 ,   973, 'No designation'                    ,  NULL                                           ),
(974,   'Other'                 ,   974, 'No designation'                    ,  NULL                                           ),
(975,   'Other'                 ,   975, 'No designation'                    ,  NULL                                           ),
(976,   'Other'                 ,   976, 'No designation'                    ,  NULL                                           ),
(977,   'Other'                 ,   977, 'No designation'                    ,  NULL                                           ),
(978,   'Other'                 ,   978, 'No designation'                    ,  NULL                                           ),
(979,   'Other'                 ,   979, 'No designation'                    ,  NULL                                           ),
(980,   'Other'                 ,   980, 'No designation'                    ,  NULL                                           ),
(981,   'Other'                 ,   981, 'No designation'                    ,  NULL                                           ),
(982,   'Other'                 ,   982, 'No designation'                    ,  NULL                                           ),
(983,   'Other'                 ,   983, 'No designation'                    ,  NULL                                           ),
(984,   'Other'                 ,   984, 'No designation'                    ,  NULL                                           ),
(985,   'Other'                 ,   985, 'No designation'                    ,  NULL                                           ),
(986,   'Other'                 ,   986, 'No designation'                    ,  NULL                                           ),
(987,   'Other'                 ,   987, 'No designation'                    ,  NULL                                           ),
(988,   'Other'                 ,   988, 'No designation'                    ,  NULL                                           ),
(989,   'Other'                 ,   989, 'No designation'                    ,  NULL                                           ),
(990,   'Other'                 ,   990, 'No designation'                    ,  NULL                                           ),
(991,   'Other'                 ,   991, 'No designation'                    ,  NULL                                           ),
(992,   'Other'                 ,   992, 'No designation'                    ,  NULL                                           ),
(993,   'Other'                 ,   993, 'No designation'                    ,  NULL                                           ),
(994,   'Other'                 ,   994, 'No designation'                    ,  NULL                                           ),
(995,   'Other'                 ,   995, 'No designation'                    ,  NULL                                           ),
(996,   'Other'                 ,   996, 'No designation'                    ,  NULL                                           ),
(997,   'Other'                 ,   997, 'No designation'                    ,  NULL                                           ),
(998,   'Other'                 ,   998, 'No designation'                    ,  NULL                                           ),
(999,   'Other'                 ,   999, 'No designation'                    ,  NULL                                           );







-- ************************************** "vessel_data"

CREATE TABLE "vessel_data"
(
 "vessel_data_id" bigint NOT NULL,
 "to_bow"         decimal(5,2) NULL,
 "to_stern"       decimal(5,2) NULL,
 "to_port"        decimal(5,2) NULL,
 "to_starboard"   decimal(5,2) NULL

);

CREATE UNIQUE INDEX "PK_vessel_data" ON "vessel_data"
(
 "vessel_data_id"
);








-- ************************************** "nav_status"

CREATE TABLE "nav_status"
(
 "nav_status_id" int NOT NULL,
 "description"   varchar(1024) NOT NULL,
 "note"          varchar(1024) NULL

);

CREATE UNIQUE INDEX "PK_nav_status" ON "nav_status"
(
 "nav_status_id"
);
-- AIS Class A Position Report Navigational Status Descriptions
-- Source: USCG
-- https://www.navcen.uscg.gov/?pageName=AISMessagesA
INSERT INTO nav_status VALUES
(0 ,    'under way using engine'                                ,   NULL    ),
(1 ,    'at anchor'                                             ,   NULL    ),
(2 ,    'not under command'                                     ,   NULL    ),
(3 ,    'restricted manoeuverability'                           ,   NULL    ),
(4 ,    'constrained by her draught'	                        ,   NULL    ),
(5 ,    'moored'            	                                ,   NULL    ),
(6 ,    'aground'	                                            ,   NULL    ),
(7 ,    'engaged in fishing'	                                ,   NULL    ),
(8 ,    'under way sailing'	                                    ,   NULL    ),
(9 ,    'reserved for future use'                               ,	'reserved for future amendment of navigational status for ships carrying DG, HS, or MP, or IMO hazard or pollutant category C, high speed craft (HSC)'  ),
(10,    'reserved for future use'                               ,	'reserved for future amendment of navigational status for ships carrying dangerous goods (DG), harmful substances (HS) or marine pollutants (MP), or IMO hazard or pollutant category A, wing in ground (WIG)'  ),
(11,    'power-driven vessel towing astern'                     ,   'regional use'  ),
(12,    'power-driven vessel pushing ahead or towing alongside' ,   'regional use'  ),
(13,    'reserved for future use'                               ,   NULL    ),
(14,    'AIS-SART (active), MOB-AIS, EPIRB-AIS'                 ,   'search and rescue, man overboard, or emergency position-indicating radiobeacon'),
(15,    'undefined'                                             ,	'default (also used by AIS-SART, MOB-AIS and EPIRB-AIS under test)'             );







-- ************************************** "message_type"

CREATE TABLE "message_type"
(
 "message_type_id" int NOT NULL,
 "name"            varchar(1024) NOT NULL,
 "description"     varchar(1024) NOT NULL,
 "supported"       boolean NOT NULL,
 "note"            varchar(1024)

);

CREATE UNIQUE INDEX "PK_message_type" ON "message_type"
(
 "message_type_id"
);
-- AIS Message Types and Descriptions
-- Source: USCG
-- https://www.navcen.uscg.gov/?pageName=AISMessages
INSERT INTO message_type VALUES
(0 , 'Undefined or invalid AIS message'                         ,   'INVALID or ERROR'                                                                                                              ,  FALSE   ,    NULL   ),
(1 , 'Position report'                                          ,   'Scheduled position report; Class A shipborne mobile equipment'                                                                 ,  TRUE    ,    NULL   ),
(2 , 'Position report'                                          ,   'Assigned scheduled position report; Class A shipborne mobile equipment'                                                        ,  TRUE    ,    NULL   ),
(3 , 'Position report'                                          ,   'Special position report, response to interrogation; Class A shipborne mobile equipment'                                        ,  TRUE    ,    NULL   ),
(4 , 'Base station report'                                      ,   'Position, UTC, date and current slot number of base station'                                                                   ,  FALSE   ,    NULL   ),
(5 , 'Static and voyage related data'                           ,   'Scheduled static and voyage related vessel data report, Class A shipborne mobile equipment'                                    ,  TRUE    ,    NULL   ),
(6 , 'Binary addressed message'                                 ,   'Binary data for addressed communication'                                                                                       ,  FALSE   ,    NULL   ),
(7 , 'Binary acknowledgement'                                   ,   'Acknowledgement of received addressed binary data'                                                                             ,  FALSE   ,    NULL   ),
(8 , 'Binary broadcast message'                                 ,   'Binary data for broadcast communication'                                                                                       ,  FALSE   ,    NULL   ),
(9 , 'Standard SAR aircraft position report'                    ,   'Position report for airborne stations involved in SAR operations only'                                                         ,  FALSE   ,    NULL   ),
(10, 'UTC/date inquiry'                                         ,   'Request UTC and date'                                                                                                          ,  FALSE   ,    NULL   ),
(11, 'UTC/date response'                                        ,   'Current UTC and date if available'                                                                                             ,  FALSE   ,    NULL   ),
(12, 'Addressed safety related message'                         ,   'Safety related data for addressed communication'                                                                               ,  FALSE   ,    NULL   ),
(13, 'Safety related acknowledgement'                           ,   'Acknowledgement of received addressed safety related message'                                                                  ,  FALSE   ,    NULL   ),
(14, 'Safety related broadcast message'                         ,   'Safety related data for broadcast communication'                                                                               ,  FALSE   ,    NULL   ),
(15, 'Interrogation'                                            ,   'Request for a specific message type can result in multiple responses from one or several stations'                             ,  FALSE   ,    NULL   ),
(16, 'Assignment mode command'                                  ,   'Assignment of a specific report behaviour by competent authority using a Base station'                                         ,  FALSE   ,    NULL   ),
(17, 'DGNSS broadcast binary message'                           ,   'DGNSS corrections provided by a base station'                                                                                  ,  FALSE   ,    NULL   ),
(18, 'Standard Class B equipment position report'               ,   'Standard position report for Class B shipborne mobile equipment to be used instead of Messages 1, 2, 3'                        ,  FALSE   ,    NULL   ),
(19, 'Extended Class B equipment position report'               ,   'No longer required. Extended position report for Class B shipborne mobile equipment; contains additional static information'   ,  FALSE   ,    NULL   ),
(20, 'Data link management message'                             ,   'Reserve slots for Base station(s)'                                                                                             ,  FALSE   ,    NULL   ),
(21, 'Aids-to-navigation report'                                ,   'Position and status report for aids-to-navigation'                                                                             ,  FALSE   ,    NULL   ),
(22, 'Channel management'                                       ,   'Management of channels and transceiver modes by a Base station'                                                                ,  FALSE   ,    NULL   ),
(23, 'Group assignment command'                                 ,   'Assignment of a specific report behaviour by competent authority using a Base station to a specific group of mobiles'          ,  FALSE   ,    NULL   ),
(24, 'Static data report'                                       ,   'Additional data assigned to an MMSI - Part A: Name, Part B: Static Data'                                                       ,  FALSE   ,    NULL   ),
(25, 'Single slot binary message'                               ,   'Short unscheduled binary data transmission Broadcast or addressed'                                                             ,  FALSE   ,    NULL   ),
(26, 'Multiple slot binary message with Communications State'   ,   'Scheduled binary data transmission Broadcast or addressed'                                                                     ,  FALSE   ,    NULL   ),
(27, 'Position report for long range applications'              ,   'Class A and Class B "SO" shipborne mobile equipment outside base station coverage'                                             ,  FALSE   ,    NULL   );









-- ************************************** "maneuver_indicator"

CREATE TABLE "maneuver_indicator"
(
 "maneuver_indicator_id" int NOT NULL,
 "description"           varchar(1024) NOT NULL,
 "note"                  varchar(1024) NULL

);

CREATE UNIQUE INDEX "PK_maneuver_indicator" ON "maneuver_indicator"
(
 "maneuver_indicator_id"
);

-- AIS Class A Position Report Special Maneuver Indicator descriptions used by USCG
-- https://www.navcen.uscg.gov/?pageName=AISMessagesA

INSERT INTO maneuver_indicator VALUES
(0, 'not available'                   , 'default'                                               ),
(2, 'not engaged in special maneuver' , NULL                                                    ),
(3, 'engaged in special maneuver'     , 'i.e.: regional passing arrangement on Inland Waterway' );




-- ************************************** "geospatial_data"

CREATE TABLE "geospatial_data"
(
 "geospatial_data_id" bigint NOT NULL,
 "coord"              point NOT NULL,
 "accuracy"           smallint NULL

);

CREATE UNIQUE INDEX "PK_geospatial_data" ON "geospatial_data"
(
 "geospatial_data_id"
);








-- ************************************** "vessel_signature"

CREATE TABLE "vessel_signature"
(
 "vessel_signature_id" bigint NOT NULL,
 "mmsi"                int NOT NULL,
 "imo"                 int NULL,
 "call_sign"           varchar(50) NULL,
 "name"                varchar(50) NULL,
 "vessel_type_id"      int NOT NULL,
 CONSTRAINT "Indx_unique_vessel_signature" UNIQUE ( "call_sign", "imo", "mmsi", "name", "vessel_type_id" ),
 CONSTRAINT "FK_102" FOREIGN KEY ( "vessel_type_id" ) REFERENCES "vessel_type" ( "vessel_type_id" )
);

CREATE UNIQUE INDEX "PK_vessel_signature_id" ON "vessel_signature"
(
 "vessel_signature_id"
);

CREATE INDEX "fkIdx_vessel_type" ON "vessel_signature"
(
 "vessel_type_id"
);








-- ************************************** "navigation_data"

CREATE TABLE "navigation_data"
(
 "navigation_data_id"    bigint NOT NULL,
 "speed_over_ground"     decimal(5,2) NULL,
 "course_over_ground"    decimal(5,2) NULL,
 "heading"               decimal(5,2) NULL,
 "rate_of_turn"          decimal(5,2) NULL,
 "nav_status_id"         int NOT NULL,
 "maneuver_indicator_id" int NOT NULL,
 CONSTRAINT "FK_209" FOREIGN KEY ( "maneuver_indicator_id" ) REFERENCES "maneuver_indicator" ( "maneuver_indicator_id" ),
 CONSTRAINT "FK_202" FOREIGN KEY ( "nav_status_id" ) REFERENCES "nav_status" ( "nav_status_id" )
);

CREATE UNIQUE INDEX "PK_navigation_data" ON "navigation_data"
(
 "navigation_data_id"
);

CREATE INDEX "fkIdx_maneuver_indicator" ON "navigation_data"
(
 "maneuver_indicator_id"
);

CREATE INDEX "fkIdx_nav_status" ON "navigation_data"
(
 "nav_status_id"
);






-- ************************************** "message_data"

CREATE TABLE "message_data"
(
 "message_id"          bigint NOT NULL,
 "time_received"       timestamp with time zone NOT NULL,
 "is_valid_msg"        boolean NOT NULL,
 "is_multi_part"       boolean NOT NULL,
 "raw_nmea"            varchar(2048) NOT NULL,
 "message_type_id"     int NOT NULL,
 "geospatial_data_id"  bigint NULL,
 "navigation_data_id"  bigint NULL,
 "voyage_data_id"      bigint NULL,
 "vessel_signature_id" bigint NOT NULL,
 "vessel_data_id"      bigint NULL,
 CONSTRAINT "FK_50" FOREIGN KEY ( "geospatial_data_id" ) REFERENCES "geospatial_data" ( "geospatial_data_id" ),
 CONSTRAINT "FK_37" FOREIGN KEY ( "message_type_id" ) REFERENCES "message_type" ( "message_type_id" ),
 CONSTRAINT "FK_60" FOREIGN KEY ( "navigation_data_id" ) REFERENCES "navigation_data" ( "navigation_data_id" ),
 CONSTRAINT "FK_187" FOREIGN KEY ( "vessel_data_id" ) REFERENCES "vessel_data" ( "vessel_data_id" ),
 CONSTRAINT "FK_155" FOREIGN KEY ( "vessel_signature_id" ) REFERENCES "vessel_signature" ( "vessel_signature_id" ),
 CONSTRAINT "FK_66" FOREIGN KEY ( "voyage_data_id" ) REFERENCES "voyage_data" ( "voyage_data_id" )
);

CREATE UNIQUE INDEX "PK_msg_data" ON "message_data"
(
 "message_id"
);

CREATE INDEX "fkIdx_geospatial_data" ON "message_data"
(
 "geospatial_data_id"
);

CREATE INDEX "fkIdx_message_type" ON "message_data"
(
 "message_type_id"
);

CREATE INDEX "fkIdx_navigation_data" ON "message_data"
(
 "navigation_data_id"
);

CREATE INDEX "fkIdx_vessel_data" ON "message_data"
(
 "vessel_data_id"
);

CREATE INDEX "fkIdx_vessel_signature" ON "message_data"
(
 "vessel_signature_id"
);

CREATE INDEX "fkIdx_voyage_data" ON "message_data"
(
 "voyage_data_id"
);
