DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180528022202');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180528022202');
-- Add your query below.

UPDATE `creature_template` SET `speed_run`=(10.0 / 7.0), `minmana`='0', `maxmana`='0', `speed_walk`='1' WHERE `entry`='16297' and`patch`='0';
UPDATE `creature_template` SET `speed_run`=(10.0 / 7.0), `minmana`='0', `maxmana`='0', `scale`='0' WHERE `entry`='16036' and`patch`='0';
UPDATE `creature_template` SET `speed_run`=(10.0 / 7.0), `scale`='0' WHERE `entry`='16037' and`patch`='0';
UPDATE `creature_template` SET `speed_run`=(10.0 / 7.0) WHERE `entry`='16034' and`patch`='0';

DELETE FROM `creature_linking` WHERE `master_guid`='88205';
REPLACE INTO `creature_linking_template` (`entry`, `map`, `master_entry`, `flag`, `search_range`) VALUES
('16297', '533', '15936', '3072', '0'),
('16036', '533', '15936', '3072', '0'),
('16037', '533', '15936', '3072', '0'),
('16034', '533', '15936', '3072', '0');

-- Plague Beast
SET @GUID := '88201';
DELETE FROM `creature` WHERE `id`='16034';
REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `curhealth`, `MovementType`, `patch_min`) VALUES
(@GUID + 0, '16034', '533', '0', '0', '2844.969', '-3609.418', '261.3669', '4.066617', '240', '240', '56067', '2', '9'),
(@GUID + 1, '16034', '533', '0', '0', '2770.457', '-3586.753', '256.1761', '1.448623', '240', '240', '56067', '2', '9'),
(@GUID + 2, '16034', '533', '0', '0', '2709.596', '-3601.897', '260.6107', '2.827433', '240', '240', '56067', '2', '9'),
(@GUID + 3, '16034', '533', '0', '0', '2850.604', '-3686.670', '279.1599', '1.780236', '240', '240', '56067', '2', '9');

DELETE FROM `creature_movement` WHERE `id` BETWEEN @GUID AND @GUID + 3;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES
(@GUID + 0, '1', '2857.005', '-3599.331', '263.6574', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 0, '2', '2873.124', '-3590.235', '267.1259', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 0, '3', '2887.852', '-3592.763', '270.6516', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 0, '4', '2897.192', '-3605.390', '273.2923', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 0, '5', '2899.383', '-3619.342', '275.0362', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 0, '6', '2891.756', '-3631.639', '274.1990', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 0, '7', '2879.466', '-3638.177', '273.2294', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 0, '8', '2866.484', '-3640.015', '271.3249', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 0, '9', '2879.466', '-3638.177', '273.2294', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 0, '10', '2891.756', '-3631.639', '274.1990', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 0, '11', '2899.383', '-3619.342', '275.0362', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 0, '12', '2897.192', '-3605.390', '273.2923', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 0, '13', '2887.852', '-3592.763', '270.6516', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 0, '14', '2873.124', '-3590.235', '267.1259', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 0, '15', '2857.005', '-3599.331', '263.6574', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 0, '16', '2847.407', '-3611.501', '261.8391', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 1, '1', '2777.605', '-3575.896', '253.7501', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 1, '2', '2790.739', '-3564.992', '251.5120', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 1, '3', '2806.231', '-3568.648', '252.5588', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 1, '4', '2817.801', '-3583.097', '254.5759', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 1, '5', '2822.715', '-3595.134', '257.7792', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 1, '6', '2829.620', '-3612.201', '259.9153', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 1, '7', '2822.715', '-3595.134', '257.7792', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 1, '8', '2817.801', '-3583.097', '254.5759', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 1, '9', '2806.231', '-3568.648', '252.5588', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 1, '10', '2790.979', '-3565.049', '251.5441', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 1, '11', '2777.605', '-3575.896', '253.7501', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 1, '12', '2767.949', '-3589.933', '256.6421', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 2, '1', '2736.519', '-3591.672', '257.9109', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 2, '2', '2743.838', '-3597.846', '257.6705', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 2, '3', '2720.893', '-3620.152', '260.0700', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 2, '4', '2723.637', '-3604.718', '259.6884', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 2, '5', '2752.585', '-3595.404', '257.0601', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 2, '6', '2755.268', '-3585.129', '256.3048', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 2, '7', '2757.008', '-3575.477', '255.6363', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 2, '8', '2755.268', '-3585.129', '256.3048', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 2, '9', '2752.585', '-3595.404', '257.0601', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 2, '10', '2723.637', '-3604.718', '259.6884', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 2, '11', '2720.893', '-3620.152', '260.0700', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 2, '12', '2743.838', '-3597.846', '257.6705', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 2, '13', '2736.519', '-3591.672', '257.9109', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 2, '14', '2727.223', '-3594.056', '258.8783', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 3, '1', '2884.267', '-3662.161', '277.4121', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 3, '2', '2897.484', '-3671.875', '280.3942', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 3, '3', '2900.623', '-3683.831', '284.0012', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 3, '4', '2894.853', '-3698.010', '285.4735', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 3, '5', '2881.999', '-3708.828', '285.7334', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 3, '6', '2865.732', '-3705.732', '284.1666', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 3, '7', '2858.935', '-3691.243', '281.1445', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 3, '8', '2846.578', '-3686.145', '278.5287', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 3, '9', '2827.884', '-3686.887', '275.8903', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 3, '10', '2846.578', '-3686.145', '278.5287', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 3, '11', '2858.935', '-3691.243', '281.1445', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 3, '12', '2865.732', '-3705.732', '284.1666', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 3, '13', '2881.999', '-3708.828', '285.7334', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 3, '14', '2894.650', '-3698.181', '285.4752', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 3, '15', '2900.623', '-3683.831', '284.0012', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 3, '16', '2897.484', '-3671.875', '280.3942', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 3, '17', '2884.267', '-3662.161', '277.4121', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
(@GUID + 3, '18', '2867.519', '-3655.968', '274.4418', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0');

-- Mutated Grub
SET @GUID := '81641';
DELETE FROM `creature` WHERE `id`='16297';
REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `curhealth`, `MovementType`, `patch_min`) VALUES
(@GUID + 0, '16297', '533', '0', '0', '2689.724', '-3579.799', '261.3246', '1.1600160', '30', '30', '5', '24843', '1', '9'),
(@GUID + 1, '16297', '533', '0', '0', '2678.695', '-3570.476', '261.9421', '0.5599494', '30', '30', '5', '24843', '1', '9'),
(@GUID + 2, '16297', '533', '0', '0', '2877.335', '-3583.536', '267.7086', '1.2693640', '30', '30', '5', '24843', '1', '9'),
(@GUID + 3, '16297', '533', '0', '0', '2873.479', '-3605.539', '267.3330', '2.2566160', '30', '30', '5', '24843', '1', '9'),
(@GUID + 4, '16297', '533', '0', '0', '2839.146', '-3615.113', '260.4509', '4.9916420', '30', '30', '5', '24843', '1', '9'),
(@GUID + 5, '16297', '533', '0', '0', '2834.190', '-3590.738', '257.5071', '0.8995356', '30', '30', '5', '24843', '1', '9'),
(@GUID + 6, '16297', '533', '0', '0', '2841.539', '-3686.111', '278.1367', '2.8963410', '30', '30', '5', '24843', '1', '9'),
(@GUID + 7, '16297', '533', '0', '0', '2859.833', '-3683.379', '279.2765', '2.3913340', '30', '30', '5', '24843', '1', '9'),
(@GUID + 8, '16297', '533', '0', '0', '2785.109', '-3584.643', '253.6366', '4.3951410', '30', '30', '5', '24843', '1', '9'),
(@GUID + 9, '16297', '533', '0', '0', '2763.862', '-3577.336', '255.7524', '3.2975440', '30', '30', '5', '24843', '1', '9'),
(@GUID + 10, '16297', '533', '0', '0', '2734.747', '-3603.468', '258.6944', '2.3505830', '30', '30', '5', '24843', '1', '9'),
(@GUID + 11, '16297', '533', '0', '0', '2712.688', '-3607.779', '260.6323', '3.0539670', '30', '30', '5', '24843', '1', '9'),
(@GUID + 12, '16297', '533', '0', '0', '2900.054', '-3687.158', '284.8765', '4.7434980', '30', '30', '5', '24843', '1', '9'),
(@GUID + 13, '16297', '533', '0', '0', '2887.587', '-3669.024', '279.1860', '5.7020190', '30', '30', '5', '24843', '1', '9');

REPLACE INTO `creature_groups` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `flags`) VALUES
(@GUID + 0, @GUID + 1, '0', '0', '6'),
(@GUID + 2, @GUID + 3, '0', '0', '6'),
(@GUID + 4, @GUID + 5, '0', '0', '6'),
(@GUID + 6, @GUID + 7, '0', '0', '6'),
(@GUID + 8, @GUID + 9, '0', '0', '6'),
(@GUID + 10, @GUID + 11, '0', '0', '6'),
(@GUID + 12, @GUID + 13, '0', '0', '6');

-- Plagued Bat
SET @GUID := '81781';
DELETE FROM `creature` WHERE `id`='16037';
REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `curhealth`, `MovementType`, `patch_min`) VALUES
(@GUID + 0, '16037', '533', '0', '0', '2766.364', '-3610.829', '255.6902', '1.9547690', '30', '30', '3', '10283', '1', '9'),
(@GUID + 1, '16037', '533', '0', '0', '2759.656', '-3575.943', '255.7154', '3.6781620', '30', '30', '3', '10283', '1', '9'),
(@GUID + 2, '16037', '533', '0', '0', '2750.463', '-3613.719', '256.7167', '3.4125890', '30', '30', '3', '10283', '1', '9'),
(@GUID + 3, '16037', '533', '0', '0', '2749.982', '-3572.633', '255.6230', '5.9553610', '30', '30', '3', '10283', '1', '9'),
(@GUID + 4, '16037', '533', '0', '0', '2756.837', '-3593.134', '257.1085', '0.2459719', '30', '30', '3', '10283', '1', '9'),
(@GUID + 5, '16037', '533', '0', '0', '2773.698', '-3570.050', '253.2635', '4.0531730', '30', '30', '3', '10283', '1', '9'),
(@GUID + 6, '16037', '533', '0', '0', '2696.845', '-3599.212', '261.2896', '3.7080510', '30', '30', '3', '10283', '1', '9'),
(@GUID + 7, '16037', '533', '0', '0', '2804.557', '-3591.253', '255.4044', '4.7144650', '30', '30', '3', '10283', '1', '9'),
(@GUID + 8, '16037', '533', '0', '0', '2677.901', '-3596.345', '261.5819', '3.3875290', '30', '30', '3', '10283', '1', '9'),
(@GUID + 9, '16037', '533', '0', '0', '2705.656', '-3572.007', '261.4941', '5.4042030', '30', '30', '3', '10283', '1', '9'),
(@GUID + 10, '16037', '533', '0', '0', '2833.935', '-3555.913', '253.2687', '1.3683580', '30', '30', '3', '10283', '1', '9'),
(@GUID + 11, '16037', '533', '0', '0', '2728.026', '-3593.528', '258.8707', '2.2016760', '30', '30', '3', '10283', '1', '9'),
(@GUID + 12, '16037', '533', '0', '0', '2811.493', '-3601.532', '257.7995', '3.6566110', '30', '30', '3', '10283', '1', '9'),
(@GUID + 13, '16037', '533', '0', '0', '2679.465', '-3611.752', '262.6963', '4.5029490', '30', '30', '3', '10283', '1', '9'),
(@GUID + 14, '16037', '533', '0', '0', '2816.567', '-3583.168', '254.7005', '1.8133660', '30', '30', '3', '10283', '1', '9'),
(@GUID + 15, '16037', '533', '0', '0', '2713.610', '-3599.974', '260.2629', '4.1015240', '30', '30', '3', '10283', '1', '9'),
(@GUID + 16, '16037', '533', '0', '0', '2860.913', '-3585.208', '262.4479', '5.0338760', '30', '30', '3', '10283', '1', '9'),
(@GUID + 17, '16037', '533', '0', '0', '2887.214', '-3633.743', '273.8759', '3.5946620', '30', '30', '3', '10283', '1', '9'),
(@GUID + 18, '16037', '533', '0', '0', '2856.490', '-3653.809', '272.6925', '0.7952903', '30', '30', '3', '10283', '1', '9'),
(@GUID + 19, '16037', '533', '0', '0', '2846.786', '-3576.005', '256.7085', '2.1617580', '30', '30', '3', '10283', '1', '9'),
(@GUID + 20, '16037', '533', '0', '0', '2887.766', '-3591.834', '270.7162', '6.2268260', '30', '30', '3', '10283', '1', '9'),
(@GUID + 21, '16037', '533', '0', '0', '2840.970', '-3601.423', '260.3569', '4.0727790', '30', '30', '3', '10283', '1', '9'),
(@GUID + 22, '16037', '533', '0', '0', '2895.610', '-3610.247', '273.2861', '0.6672850', '30', '30', '3', '10283', '1', '9'),
(@GUID + 23, '16037', '533', '0', '0', '2869.124', '-3643.082', '272.3780', '0.6359065', '30', '30', '3', '10283', '1', '9'),
(@GUID + 24, '16037', '533', '0', '0', '2893.387', '-3653.699', '277.0403', '3.7924570', '30', '30', '3', '10283', '1', '9'),
(@GUID + 25, '16037', '533', '0', '0', '2908.208', '-3598.815', '275.4491', '6.0025670', '30', '30', '3', '10283', '1', '9'),
(@GUID + 26, '16037', '533', '0', '0', '2851.075', '-3693.534', '281.2535', '1.4510410', '30', '30', '3', '10283', '1', '9'),
(@GUID + 27, '16037', '533', '0', '0', '2910.164', '-3581.518', '274.2117', '4.9959950', '30', '30', '3', '10283', '1', '9'),
(@GUID + 28, '16037', '533', '0', '0', '2899.712', '-3694.113', '285.4397', '4.8101560', '30', '30', '3', '10283', '1', '9'),
(@GUID + 29, '16037', '533', '0', '0', '2851.452', '-3717.975', '286.6672', '3.2637650', '30', '30', '3', '10283', '1', '9'),
(@GUID + 30, '16037', '533', '0', '0', '2915.778', '-3663.674', '278.5815', '2.8767610', '30', '30', '3', '10283', '1', '9'),
(@GUID + 31, '16037', '533', '0', '0', '2869.803', '-3718.724', '284.1617', '4.1684450', '30', '30', '3', '10283', '1', '9'),
(@GUID + 32, '16037', '533', '0', '0', '2862.947', '-3702.279', '283.3751', '1.3229940', '30', '30', '3', '10283', '1', '9'),
(@GUID + 33, '16037', '533', '0', '0', '2906.188', '-3715.619', '284.8616', '2.4893190', '30', '30', '3', '10283', '1', '9'),
(@GUID + 34, '16037', '533', '0', '0', '2881.447', '-3723.308', '284.6229', '3.7005700', '30', '30', '3', '10283', '1', '9'),
(@GUID + 35, '16037', '533', '0', '0', '2914.798', '-3690.415', '286.2263', '0.8837789', '30', '30', '3', '10283', '1', '9');

-- Frenzied Bat
SET @GUID := '81817';
DELETE FROM `creature` WHERE `id`='16036';
REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `curhealth`, `MovementType`, `patch_min`) VALUES
(@GUID + 0, '16036', '533', '0', '0', '2746.833', '-3596.910', '257.5289', '4.0680890', '30', '30', '3', '10283', '1', '9'),
(@GUID + 1, '16036', '533', '0', '0', '2773.892', '-3553.934', '251.0009', '1.8265720', '30', '30', '3', '10283', '1', '9'),
(@GUID + 2, '16036', '533', '0', '0', '2721.048', '-3615.260', '260.1215', '1.2980950', '30', '30', '3', '10283', '1', '9'),
(@GUID + 3, '16036', '533', '0', '0', '2764.992', '-3540.809', '253.5745', '0.5346282', '30', '30', '3', '10283', '1', '9'),
(@GUID + 4, '16036', '533', '0', '0', '2735.002', '-3608.374', '258.8584', '3.4657770', '30', '30', '3', '10283', '1', '9'),
(@GUID + 5, '16036', '533', '0', '0', '2753.106', '-3554.853', '255.3629', '1.9593390', '30', '30', '3', '10283', '1', '9'),
(@GUID + 6, '16036', '533', '0', '0', '2719.043', '-3576.173', '260.1240', '3.9793510', '30', '30', '3', '10283', '1', '9'),
(@GUID + 7, '16036', '533', '0', '0', '2796.732', '-3566.922', '252.0768', '4.9236600', '30', '30', '3', '10283', '1', '9'),
(@GUID + 8, '16036', '533', '0', '0', '2799.166', '-3611.105', '255.9104', '4.3298040', '30', '30', '3', '10283', '1', '9'),
(@GUID + 9, '16036', '533', '0', '0', '2659.542', '-3605.862', '262.4703', '5.6747060', '30', '30', '3', '10283', '1', '9'),
(@GUID + 10, '16036', '533', '0', '0', '2814.128', '-3572.996', '253.3909', '0.6767032', '30', '30', '3', '10283', '1', '9'),
(@GUID + 11, '16036', '533', '0', '0', '2696.570', '-3624.927', '262.6946', '5.7444900', '30', '30', '3', '10283', '1', '9'),
(@GUID + 12, '16036', '533', '0', '0', '2698.497', '-3585.110', '260.7792', '4.6983990', '30', '30', '3', '10283', '1', '9'),
(@GUID + 13, '16036', '533', '0', '0', '2799.896', '-3621.678', '256.0590', '1.5007440', '30', '30', '3', '10283', '1', '9'),
(@GUID + 14, '16036', '533', '0', '0', '2827.710', '-3545.165', '253.8345', '1.0670820', '30', '30', '3', '10283', '1', '9'),
(@GUID + 15, '16036', '533', '0', '0', '2819.885', '-3611.047', '258.7599', '3.0747760', '30', '30', '3', '10283', '1', '9'),
(@GUID + 16, '16036', '533', '0', '0', '2690.143', '-3610.980', '262.2883', '3.5220010', '30', '30', '3', '10283', '1', '9'),
(@GUID + 17, '16036', '533', '0', '0', '2672.378', '-3626.032', '266.2162', '2.2304250', '30', '30', '3', '10283', '1', '9'),
(@GUID + 18, '16036', '533', '0', '0', '2798.311', '-3550.752', '250.4881', '5.3026760', '30', '30', '3', '10283', '1', '9'),
(@GUID + 19, '16036', '533', '0', '0', '2865.585', '-3666.234', '276.2854', '0.5061455', '30', '30', '3', '10283', '1', '9'),
(@GUID + 20, '16036', '533', '0', '0', '2826.026', '-3625.748', '260.0031', '3.3287640', '30', '30', '3', '10283', '1', '9'),
(@GUID + 21, '16036', '533', '0', '0', '2847.231', '-3629.752', '264.2359', '5.8230500', '30', '30', '3', '10283', '1', '9'),
(@GUID + 22, '16036', '533', '0', '0', '2862.882', '-3597.033', '264.9629', '3.7581070', '30', '30', '3', '10283', '1', '9'),
(@GUID + 23, '16036', '533', '0', '0', '2895.225', '-3581.664', '272.6213', '4.5672100', '30', '30', '3', '10283', '1', '9'),
(@GUID + 24, '16036', '533', '0', '0', '2846.931', '-3673.215', '275.3965', '0.5182968', '30', '30', '3', '10283', '1', '9'),
(@GUID + 25, '16036', '533', '0', '0', '2838.076', '-3585.054', '256.5099', '3.1358170', '30', '30', '3', '10283', '1', '9'),
(@GUID + 26, '16036', '533', '0', '0', '2884.368', '-3609.457', '270.0616', '4.5378560', '30', '30', '3', '10283', '1', '9'),
(@GUID + 27, '16036', '533', '0', '0', '2858.012', '-3625.881', '266.0598', '0.5332515', '30', '30', '3', '10283', '1', '9'),
(@GUID + 28, '16036', '533', '0', '0', '2849.720', '-3598.388', '262.1687', '6.0716040', '30', '30', '3', '10283', '1', '9'),
(@GUID + 29, '16036', '533', '0', '0', '2882.462', '-3684.127', '281.9717', '4.6535710', '30', '30', '3', '10283', '1', '9'),
(@GUID + 30, '16036', '533', '0', '0', '2903.493', '-3623.252', '276.5471', '4.5701160', '30', '30', '3', '10283', '1', '9'),
(@GUID + 31, '16036', '533', '0', '0', '2910.600', '-3645.100', '276.4793', '0.6058805', '30', '30', '3', '10283', '1', '9'),
(@GUID + 32, '16036', '533', '0', '0', '2898.025', '-3678.331', '281.7563', '4.2057740', '30', '30', '3', '10283', '1', '9'),
(@GUID + 33, '16036', '533', '0', '0', '2882.088', '-3666.310', '278.3139', '0.1957645', '30', '30', '3', '10283', '1', '9'),
(@GUID + 34, '16036', '533', '0', '0', '2876.120', '-3701.309', '284.4327', '0.8469842', '30', '30', '3', '10283', '1', '9'),
(@GUID + 35, '16036', '533', '0', '0', '2894.943', '-3706.862', '286.0635', '6.1608480', '30', '30', '3', '10283', '1', '9');

REPLACE INTO `creature_groups` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `flags`) VALUES
('81826', '81789', '0', '0', '6'),
('81826', '81794', '0', '0', '6'),
('81826', '81833', '0', '0', '6'),
('81826', '81834', '0', '0', '6'),
('81826', '81828', '0', '0', '6'),
('81787', '81829', '0', '0', '6'),
('81787', '81796', '0', '0', '6'),
('81787', '81790', '0', '0', '6'),
('81787', '81823', '0', '0', '6'),
('81787', '81792', '0', '0', '6'),
('81819', '81821', '0', '0', '6'),
('81819', '81817', '0', '0', '6'),
('81819', '81783', '0', '0', '6'),
('81819', '81785', '0', '0', '6'),
('81819', '81781', '0', '0', '6'),
('81784', '81782', '0', '0', '6'),
('81784', '81822', '0', '0', '6'),
('81784', '81786', '0', '0', '6'),
('81784', '81818', '0', '0', '6'),
('81784', '81820', '0', '0', '6'),
('81824', '81835', '0', '0', '6'),
('81824', '81831', '0', '0', '6'),
('81824', '81791', '0', '0', '6'),
('81824', '81827', '0', '0', '6'),
('81824', '81795', '0', '0', '6'),
('81788', '81793', '0', '0', '6'),
('81788', '81832', '0', '0', '6'),
('81788', '81825', '0', '0', '6'),
('81788', '81830', '0', '0', '6'),
('81788', '81837', '0', '0', '6'),
('81802', '81842', '0', '0', '6'),
('81802', '81800', '0', '0', '6'),
('81802', '81845', '0', '0', '6'),
('81802', '81797', '0', '0', '6'),
('81802', '81839', '0', '0', '6'),
('81801', '81840', '0', '0', '6'),
('81801', '81808', '0', '0', '6'),
('81801', '81843', '0', '0', '6'),
('81801', '81803', '0', '0', '6'),
('81801', '81806', '0', '0', '6'),
('81844', '81838', '0', '0', '6'),
('81844', '81804', '0', '0', '6'),
('81844', '81836', '0', '0', '6'),
('81844', '81799', '0', '0', '6'),
('81844', '81841', '0', '0', '6'),
('81798', '81847', '0', '0', '6'),
('81798', '81848', '0', '0', '6'),
('81798', '81805', '0', '0', '6'),
('81798', '81850', '0', '0', '6'),
('81798', '81811', '0', '0', '6'),
('81846', '81849', '0', '0', '6'),
('81846', '81816', '0', '0', '6'),
('81846', '81809', '0', '0', '6'),
('81846', '81814', '0', '0', '6'),
('81846', '81852', '0', '0', '6'),
('81851', '81815', '0', '0', '6'),
('81851', '81812', '0', '0', '6'),
('81851', '81813', '0', '0', '6'),
('81851', '81810', '0', '0', '6'),
('81851', '81807', '0', '0', '6');

DELETE FROM `creature_groups` WHERE `leaderGUID` IN (2530452, 2530454, 2530481);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;