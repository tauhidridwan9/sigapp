-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2024 at 04:59 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sig`
--

-- --------------------------------------------------------

--
-- Table structure for table `apps_countries`
--

CREATE TABLE `apps_countries` (
  `id` int(11) NOT NULL,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT '',
  `latitude` varchar(25) NOT NULL,
  `longitude` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `apps_countries`
--

INSERT INTO `apps_countries` (`id`, `country_code`, `country_name`, `latitude`, `longitude`) VALUES
(1, 'AF', 'Afghanistan', '33.93911', '67.709953'),
(2, 'AL', 'Albania', '41.153332', '20.168331'),
(3, 'DZ', 'Algeria', '28.033886', '1.659626'),
(4, 'DS', 'American Samoa', '', ''),
(5, 'AD', 'Andorra', '', ''),
(6, 'AO', 'Angola', '-11.202692', '17.873887'),
(7, 'AI', 'Anguilla', '18.220554', '-63.068615'),
(8, 'AQ', 'Antarctica', '-82.8627519', '135'),
(9, 'AG', 'Antigua and Barbuda', '17.060816', '-61.796428'),
(10, 'AR', 'Argentina', '-38.416097', '-63.616672'),
(11, 'AM', 'Armenia', '', ''),
(12, 'AW', 'Aruba', '12.52111', '-69.968338'),
(13, 'AU', 'Australia', '-25.274398', '133.775136'),
(14, 'AT', 'Austria', '47.516231', '14.550072'),
(15, 'AZ', 'Azerbaijan', '40.143105', '47.576927'),
(16, 'BS', 'Bahamas', '25.03428', '-77.39628'),
(17, 'BH', 'Bahrain', '', ''),
(18, 'BD', 'Bangladesh', '', ''),
(19, 'BB', 'Barbados', '13.193887', '-59.543198'),
(20, 'BY', 'Belarus', '53.709807', '27.953389'),
(21, 'BE', 'Belgium', '50.503887', '4.469936'),
(22, 'BZ', 'Belize', '17.189877', '-88.49765'),
(23, 'BJ', 'Benin', '9.30769', '2.315834'),
(24, 'BM', 'Bermuda', '', ''),
(25, 'BT', 'Bhutan', '', ''),
(26, 'BO', 'Bolivia', '', ''),
(27, 'BA', 'Bosnia and Herzegovina', '', ''),
(28, 'BW', 'Botswana', '', ''),
(29, 'BV', 'Bouvet Island', '-54.423199', '3.413194'),
(30, 'BR', 'Brazil', '-14.235004', '-51.92528'),
(31, 'IO', 'British Indian Ocean Territory', '-7.3346232', '72.4242508'),
(32, 'BN', 'Brunei Darussalam', '4.535277', '114.727669'),
(33, 'BG', 'Bulgaria', '42.733883', '25.48583'),
(34, 'BF', 'Burkina Faso', '12.238333', '-1.561593'),
(35, 'BI', 'Burundi', '-3.373056', '29.918886'),
(36, 'KH', 'Cambodia', '12.565679', '104.990963'),
(37, 'CM', 'Cameroon', '7.369722', '12.354722'),
(38, 'CA', 'Canada', '56.130366', '-106.346771'),
(39, 'CV', 'Cape Verde', '', ''),
(40, 'KY', 'Cayman Islands', '', ''),
(41, 'CF', 'Central African Republic', '6.611111', '20.939444'),
(42, 'TD', 'Chad', '15.454166', '18.732207'),
(43, 'CL', 'Chile', '-35.675147', '-71.542969'),
(44, 'CN', 'China', '35.86166', '104.195397'),
(45, 'CX', 'Christmas Island', '-10.447525', '105.690449'),
(46, 'CC', 'Cocos (Keeling) Islands', '', ''),
(47, 'CO', 'Colombia', '', ''),
(48, 'KM', 'Comoros', '-11.6455', '43.3333'),
(49, 'CG', 'Congo', '-0.228021', '15.827659'),
(50, 'CK', 'Cook Islands', '-21.236736', '-159.777671'),
(51, 'CR', 'Costa Rica', '9.748917', '-83.753428'),
(52, 'HR', 'Croatia (Hrvatska)', '45.1', '15.2'),
(53, 'CU', 'Cuba', '21.521757', '-77.781167'),
(54, 'CY', 'Cyprus', '35.126413', '33.429859'),
(55, 'CZ', 'Czech Republic', '49.817492', '15.472962'),
(56, 'DK', 'Denmark', '56.26392', '9.501785'),
(57, 'DJ', 'Djibouti', '11.825138', '42.590275'),
(58, 'DM', 'Dominica', '15.414999', '-61.370976'),
(59, 'DO', 'Dominican Republic', '18.735693', '-70.162651'),
(60, 'TP', 'East Timor', '-8.874217', '125.727539'),
(61, 'EC', 'Ecuador', '', ''),
(62, 'EG', 'Egypt', '26.820553', '30.802498'),
(63, 'SV', 'El Salvador', '13.794185', '-88.89653'),
(64, 'GQ', 'Equatorial Guinea', '1.650801', '10.267895'),
(65, 'ER', 'Eritrea', '15.179384', '39.782334'),
(66, 'EE', 'Estonia', '58.595272', '25.013607'),
(67, 'ET', 'Ethiopia', '9.145', '40.489673'),
(68, 'FK', 'Falkland Islands (Malvinas)', '-51.796253', '-59.523613'),
(69, 'FO', 'Faroe Islands', '61.892635', '-6.911806'),
(70, 'FJ', 'Fiji', '-17.713371', '178.065032'),
(71, 'FI', 'Finland', '61.92411', '25.748151'),
(72, 'FR', 'France', '46.227638', '2.213749'),
(73, 'FX', 'France, Metropolitan', '14.4811297', '121.0304117'),
(74, 'GF', 'French Guiana', '3.933889', '-53.125782'),
(75, 'PF', 'French Polynesia', '-17.679742', '-149.406843'),
(76, 'TF', 'French Southern Territories', '-49.280366', '69.348557'),
(77, 'GA', 'Gabon', '-0.803689', '11.609444'),
(78, 'GM', 'Gambia', '13.443182', '-15.310139'),
(79, 'GE', 'Georgia', '32.1656221', '-82.9000751'),
(80, 'DE', 'Germany', '51.165691', '10.451526'),
(81, 'GH', 'Ghana', '7.946527', '-1.023194'),
(82, 'GI', 'Gibraltar', '36.140751', '-5.353585'),
(83, 'GK', 'Guernsey', '49.465691', '-2.585278'),
(84, 'GR', 'Greece', '39.074208', '21.824312'),
(85, 'GL', 'Greenland', '71.706936', '-42.604303'),
(86, 'GD', 'Grenada', '12.1165', '-61.679'),
(87, 'GP', 'Guadeloupe', '16.265', '-61.551'),
(88, 'GU', 'Guam', '13.444304', '144.793731'),
(89, 'GT', 'Guatemala', '15.783471', '-90.230759'),
(90, 'GN', 'Guinea', '9.945587', '-9.696645'),
(91, 'GW', 'Guinea-Bissau', '11.803749', '-15.180413'),
(92, 'GY', 'Guyana', '4.860416', '-58.93018'),
(93, 'HT', 'Haiti', '18.971187', '-72.285215'),
(94, 'HM', 'Heard and Mc Donald Islands', '-53.1', '73.5'),
(95, 'HN', 'Honduras', '15.199999', '-86.241905'),
(96, 'HK', 'Hong Kong', '22.396428', '114.109497'),
(97, 'HU', 'Hungary', '47.162494', '19.503304'),
(98, 'IS', 'Iceland', '64.963051', '-19.020835'),
(99, 'IN', 'India', '20.593684', '78.96288'),
(100, 'IM', 'Isle of Man', '54.236107', '-4.548056'),
(101, 'ID', 'Indonesia', '-0.789275', '113.921327'),
(102, 'IR', 'Iran (Islamic Republic of)', '38.4703541', '47.0571193'),
(103, 'IQ', 'Iraq', '33.223191', '43.679291'),
(104, 'IE', 'Ireland', '53.41291', '-8.24389'),
(105, 'IL', 'Israel', '31.046051', '34.851612'),
(106, 'IT', 'Italy', '41.87194', '12.56738'),
(107, 'CI', 'Ivory Coast', '7.539989', '-5.54708'),
(108, 'JE', 'Jersey', '49.214439', '-2.13125'),
(109, 'JM', 'Jamaica', '18.109581', '-77.297508'),
(110, 'JP', 'Japan', '36.204824', '138.252924'),
(111, 'JO', 'Jordan', '30.585164', '36.238414'),
(112, 'KZ', 'Kazakhstan', '48.019573', '66.923684'),
(113, 'KE', 'Kenya', '-0.023559', '37.906193'),
(114, 'KI', 'Kiribati', '1.8708833', '-157.3630262'),
(115, 'KP', 'Korea, Democratic People\'s Republic of', '', ''),
(116, 'KR', 'Korea, Republic of', '24.4975048', '118.1257661'),
(117, 'XK', 'Kosovo', '42.6026359', '20.902977'),
(118, 'KW', 'Kuwait', '29.31166', '47.481766'),
(119, 'KG', 'Kyrgyzstan', '41.20438', '74.766098'),
(120, 'LA', 'Lao People\'s Democratic Republic', '19.85627', '102.495496'),
(121, 'LV', 'Latvia', '56.879635', '24.603189'),
(122, 'LB', 'Lebanon', '33.854721', '35.862285'),
(123, 'LS', 'Lesotho', '-29.609988', '28.233608'),
(124, 'LR', 'Liberia', '6.428055', '-9.429499'),
(125, 'LY', 'Libyan Arab Jamahiriya', '26.3351', '17.228331'),
(126, 'LI', 'Liechtenstein', '47.166', '9.555373'),
(127, 'LT', 'Lithuania', '55.169438', '23.881275'),
(128, 'LU', 'Luxembourg', '49.815273', '6.129583'),
(129, 'MO', 'Macau', '22.198745', '113.543873'),
(130, 'MK', 'Macedonia', '41.608635', '21.745275'),
(131, 'MG', 'Madagascar', '-18.766947', '46.869107'),
(132, 'MW', 'Malawi', '-13.254308', '34.301525'),
(133, 'MY', 'Malaysia', '4.210484', '101.975766'),
(134, 'MV', 'Maldives', '1.977247', '73.5361034'),
(135, 'ML', 'Mali', '17.570692', '-3.996166'),
(136, 'MT', 'Malta', '35.937496', '14.375416'),
(137, 'MH', 'Marshall Islands', '6.0683017', '171.989379'),
(138, 'MQ', 'Martinique', '14.641528', '-61.024174'),
(139, 'MR', 'Mauritania', '21.00789', '-10.940835'),
(140, 'MU', 'Mauritius', '-20.348404', '57.552152'),
(141, 'TY', 'Mayotte', '-12.8275', '45.166244'),
(142, 'MX', 'Mexico', '23.634501', '-102.552784'),
(143, 'FM', 'Micronesia, Federated States of', '', ''),
(144, 'MD', 'Moldova, Republic of', '46.9821667', '28.8365339'),
(145, 'MC', 'Monaco', '43.7384176', '7.4246158'),
(146, 'MN', 'Mongolia', '46.862496', '103.846656'),
(147, 'ME', 'Montenegro', '42.708678', '19.37439'),
(148, 'MS', 'Montserrat', '16.742498', '-62.187366'),
(149, 'MA', 'Morocco', '31.791702', '-7.09262'),
(150, 'MZ', 'Mozambique', '-18.665695', '35.529562'),
(151, 'MM', 'Myanmar', '21.916221', '95.955974'),
(152, 'NA', 'Namibia', '-22.95764', '18.49041'),
(153, 'NR', 'Nauru', '-0.522778', '166.931503'),
(154, 'NP', 'Nepal', '28.394857', '84.124008'),
(155, 'NL', 'Netherlands', '52.132633', '5.291266'),
(156, 'AN', 'Netherlands Antilles', '12.2018902', '-68.2623822'),
(157, 'NC', 'New Caledonia', '-20.904305', '165.618042'),
(158, 'NZ', 'New Zealand', '-40.900557', '174.885971'),
(159, 'NI', 'Nicaragua', '12.865416', '-85.207229'),
(160, 'NE', 'Niger', '17.607789', '8.081666'),
(161, 'NG', 'Nigeria', '9.081999', '8.675277'),
(162, 'NU', 'Niue', '-19.054445', '-169.867233'),
(163, 'NF', 'Norfolk Island', '-29.040835', '167.954712'),
(164, 'MP', 'Northern Mariana Islands', '15.0979', '145.6739'),
(165, 'NO', 'Norway', '60.472024', '8.468946'),
(166, 'OM', 'Oman', '21.512583', '55.923255'),
(167, 'PK', 'Pakistan', '30.375321', '69.345116'),
(168, 'PW', 'Palau', '7.51498', '134.58252'),
(169, 'PS', 'Palestine', '31.952162', '35.233154'),
(170, 'PA', 'Panama', '8.537981', '-80.782127'),
(171, 'PG', 'Papua New Guinea', '-6.314993', '143.95555'),
(172, 'PY', 'Paraguay', '-23.442503', '-58.443832'),
(173, 'PE', 'Peru', '-9.189967', '-75.015152'),
(174, 'PH', 'Philippines', '12.879721', '121.774017'),
(175, 'PN', 'Pitcairn', '-24.3767452', '-128.3242353'),
(176, 'PL', 'Poland', '51.919438', '19.145136'),
(177, 'PT', 'Portugal', '39.399872', '-8.224454'),
(178, 'PR', 'Puerto Rico', '18.220833', '-66.590149'),
(179, 'QA', 'Qatar', '25.354826', '51.183884'),
(180, 'RE', 'Reunion', '-21.115141', '55.536384'),
(181, 'RO', 'Romania', '45.943161', '24.96676'),
(182, 'RU', 'Russian Federation', '61.52401', '105.318756'),
(183, 'RW', 'Rwanda', '-1.940278', '29.873888'),
(184, 'KN', 'Saint Kitts and Nevis', '17.357822', '-62.782998'),
(185, 'LC', 'Saint Lucia', '13.909444', '-60.978893'),
(186, 'VC', 'Saint Vincent and the Grenadines', '13.2528179', '-61.1971628'),
(187, 'WS', 'Samoa', '-13.759029', '-172.104629'),
(188, 'SM', 'San Marino', '43.94236', '12.457777'),
(189, 'ST', 'Sao Tome and Principe', '0.18636', '6.613081'),
(190, 'SA', 'Saudi Arabia', '23.885942', '45.079162'),
(191, 'SN', 'Senegal', '14.497401', '-14.452362'),
(192, 'RS', 'Serbia', '44.016521', '21.005859'),
(193, 'SC', 'Seychelles', '-4.679574', '55.491977'),
(194, 'SL', 'Sierra Leone', '8.460555', '-11.779889'),
(195, 'SG', 'Singapore', '1.352083', '103.819836'),
(196, 'SK', 'Slovakia', '48.669026', '19.699024'),
(197, 'SI', 'Slovenia', '46.151241', '14.995463'),
(198, 'SB', 'Solomon Islands', '-9.64571', '160.156194'),
(199, 'SO', 'Somalia', '5.152149', '46.199616'),
(200, 'ZA', 'South Africa', '-30.559482', '22.937506'),
(201, 'GS', 'South Georgia South Sandwich Islands', '', ''),
(202, 'ES', 'Spain', '40.463667', '-3.74922'),
(203, 'LK', 'Sri Lanka', '7.873054', '80.771797'),
(204, 'SH', 'St. Helena', '38.5052429', '-122.4703868'),
(205, 'PM', 'St. Pierre and Miquelon', '46.8852', '-56.3159'),
(206, 'SD', 'Sudan', '12.862807', '30.217636'),
(207, 'SR', 'Suriname', '3.919305', '-56.027783'),
(208, 'SJ', 'Svalbard and Jan Mayen Islands', '71.031818', '-8.2920347'),
(209, 'SZ', 'Swaziland', '-26.522503', '31.465866'),
(210, 'SE', 'Sweden', '60.128161', '18.643501'),
(211, 'CH', 'Switzerland', '46.818188', '8.227512'),
(212, 'SY', 'Syrian Arab Republic', '34.802075', '38.996815'),
(213, 'TW', 'Taiwan', '23.69781', '120.960515'),
(214, 'TJ', 'Tajikistan', '38.861034', '71.276093'),
(215, 'TZ', 'Tanzania, United Republic of', '', ''),
(216, 'TH', 'Thailand', '15.870032', '100.992541'),
(217, 'TG', 'Togo', '8.619543', '0.824782'),
(218, 'TK', 'Tokelau', '-9.2002', '-171.8484'),
(219, 'TO', 'Tonga', '-21.178986', '-175.198242'),
(220, 'TT', 'Trinidad and Tobago', '10.691803', '-61.222503'),
(221, 'TN', 'Tunisia', '33.886917', '9.537499'),
(222, 'TR', 'Turkey', '38.963745', '35.243322'),
(223, 'TM', 'Turkmenistan', '38.969719', '59.556278'),
(224, 'TC', 'Turks and Caicos Islands', '21.694025', '-71.797928'),
(225, 'TV', 'Tuvalu', '-7.4784206', '178.679924'),
(226, 'UG', 'Uganda', '1.373333', '32.290275'),
(227, 'UA', 'Ukraine', '48.379433', '31.16558'),
(228, 'AE', 'United Arab Emirates', '23.424076', '53.847818'),
(229, 'GB', 'United Kingdom', '55.378051', '-3.435973'),
(230, 'US', 'United States', '37.09024', '-95.712891'),
(231, 'UM', 'United States minor outlying islands', '19.2823192', '166.647047'),
(232, 'UY', 'Uruguay', '-32.522779', '-55.765835'),
(233, 'UZ', 'Uzbekistan', '41.377491', '64.585262'),
(234, 'VU', 'Vanuatu', '-15.376706', '166.959158');

-- --------------------------------------------------------

--
-- Table structure for table `kordinat_gis`
--

CREATE TABLE `kordinat_gis` (
  `nomor` int(5) NOT NULL,
  `x` decimal(8,5) NOT NULL,
  `y` decimal(8,5) NOT NULL,
  `nama_tempat` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kordinat_gis`
--

INSERT INTO `kordinat_gis` (`nomor`, `x`, `y`, `nama_tempat`, `status`) VALUES
(7, -8.21961, 114.34965, 'Banyuwangi', 0),
(10, -8.72490, 115.17981, 'Pantai Kuta', 0),
(11, -8.24272, 114.48629, 'Melaya', 0),
(12, -8.64887, 115.19354, 'Denpasar', 0),
(13, -8.41121, 115.14273, 'Penebel', 1),
(14, -7.70687, 113.97817, 'Situbondo', 0),
(15, -8.43838, 115.62063, 'Karangasem', 0),
(16, -8.55247, 115.03836, 'Kerambitan', 0),
(17, -8.31202, 115.02188, 'Pupuan', 1),
(18, -8.00072, 114.40390, 'Wongsorejo', 0),
(19, -8.44109, 115.31714, 'Tampak Siring', 0),
(20, -8.73440, 115.54648, 'Nusa Penida', 1),
(21, -8.14756, 115.11389, 'Sukasada', 1),
(22, -8.54296, 115.12350, 'Tabanan', 1),
(24, -8.27839, 114.29455, 'Macan Putih', 0);

-- --------------------------------------------------------

--
-- Table structure for table `operator`
--

CREATE TABLE `operator` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `operator`
--

INSERT INTO `operator` (`id`, `username`, `password`) VALUES
(1, 'admin', '40bd001563085fc35165329ea1ff5c5ecbdbbeef');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apps_countries`
--
ALTER TABLE `apps_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kordinat_gis`
--
ALTER TABLE `kordinat_gis`
  ADD PRIMARY KEY (`nomor`);

--
-- Indexes for table `operator`
--
ALTER TABLE `operator`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apps_countries`
--
ALTER TABLE `apps_countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=235;

--
-- AUTO_INCREMENT for table `kordinat_gis`
--
ALTER TABLE `kordinat_gis`
  MODIFY `nomor` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `operator`
--
ALTER TABLE `operator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
