/*
--------------------------------------------------------------------------------------
 Post-Deployment Script : jeu de données de démo (La Bande à Picsou & World of Warcraft)
--------------------------------------------------------------------------------------
*/
SET NOCOUNT ON;

DECLARE @NbPlayer INT;
SELECT @NbPlayer = COUNT(*) FROM [dbo].[PlayerAccount];

IF @NbPlayer = 0
BEGIN
    -- ===============================================================================
    -- 1. Joueurs
    -- ===============================================================================
    SET IDENTITY_INSERT [dbo].[PlayerAccount] ON;

    INSERT INTO [dbo].[PlayerAccount] ([Id], [Username], [Is_Banned])
    VALUES
        -- La Bande à Picsou
        ( 1, N'Della Duck',          0),
        ( 2, N'Balthazar Picsou',    0),
        ( 3, N'Riri Duck',           0),
        ( 4, N'Fifi Duck',           0),
        ( 5, N'Loulou Duck',         0),
        ( 6, N'Zaza Vanderquack',    0),
        ( 7, N'Flagada Jones',       0),
        ( 8, N'Archibald Gripsou',   1),
        -- World of Warcraft
        ( 9, N'Thrall',              0),
        (10, N'Jaina Portvaillant',  0),
        (11, N'Sylvanas Coursevent', 1),
        (12, N'Anduin Wrynn',        0),
        (13, N'Illidan Hurlorage',   0),
        (14, N'Leeroy Jenkins',      0),
        (15, N'Chromie',             0);

    SET IDENTITY_INSERT [dbo].[PlayerAccount] OFF;

    -- ===============================================================================
    -- 2. Commentaires
    -- ===============================================================================
    SET IDENTITY_INSERT [dbo].[Comment] ON;

    INSERT INTO [dbo].[Comment] ([Id], [Content], [Create_At], [Player_Id])
    VALUES
        ( 1, N'Meilleure pilote du serveur : elle a posé notre zeppelin en plein orage sans une égratignure.', '2025-01-08T19:42:00',  1),
        ( 2, N'Toujours partante pour une expédition, même à 3 h du matin. Une vraie aventurière !', '2025-01-21T03:12:00',  1),
        ( 3, N'M''a aidé à finir le donjon des Ruines de Canardville, patiente et super pédagogue.', '2025-02-03T20:15:00',  1),
        ( 4, N'Elle a réparé son jetpack en pleine chute libre. Je n''ai rien compris, mais c''était magnifique.', '2025-02-17T21:30:00',  1),
        ( 5, N'Leadeuse née : en raid, tout le monde l''écoute et tout le monde survit.', '2025-03-02T22:05:00',  1),
        ( 6, N'Revenue de la Lune avec un stuff légendaire... et elle l''a partagé avec la guilde. Respect.', '2025-03-19T18:47:00',  1),
        ( 7, N'Gentille avec les nouveaux joueurs, elle prend le temps d''expliquer chaque mécanique.', '2025-04-05T14:20:00',  1),
        ( 8, N'Son pilotage manuel est plus fiable que le pilote automatique.', '2025-04-22T17:55:00',  1),
        ( 9, N'Énergie incroyable, impossible de s''ennuyer en groupe avec elle.', '2025-05-09T20:40:00',  1),
        (10, N'A sauvé tout le groupe d''un wipe avec une manœuvre aérienne improbable. GG !', '2025-05-28T23:10:00',  1),
        (11, N'Elle ne lâche jamais rien, même quand le boss est à 1 % et nous à 2 PV.', '2025-06-14T21:25:00',  1),
        (12, N'Super ambiance sur le vocal, elle raconte ses aventures entre deux pulls.', '2025-07-01T20:00:00',  1),
        (13, N'Le vaisseau qu''elle a bricolé à l''atelier est une véritable œuvre d''art.', '2025-07-18T16:35:00',  1),
        (14, N'Fiable, ponctuelle, motivée : la coéquipière idéale.', '2025-08-04T19:50:00',  1),
        (15, N'Partie « faire un petit tour » avec le vaisseau de la guilde... revenue dix ans plus tard. Une étoile.', '2025-08-23T11:02:00',  1),
        (16, N'Elle a appris à piloter à mes neveux en mode tutoriel. Merci Della !', '2025-09-10T15:45:00',  1),
        (17, N'Explore chaque recoin de la carte : grâce à elle, on a trouvé trois coffres secrets.', '2025-09-29T22:18:00',  1),
        (18, N'Excellente stratège, elle avait anticipé chaque phase du boss final.', '2025-10-16T21:05:00',  1),
        (19, N'Toujours le sourire, même après dix wipes d''affilée.', '2025-11-02T23:48:00',  1),
        (20, N'Une légende vivante du serveur. Rien à ajouter.', '2025-11-20T18:30:00',  1),
        (21, N'A partagé son itinéraire de vol optimisé avec toute la communauté, gain de temps énorme.', '2025-12-07T13:15:00',  1),
        (22, N'Courageuse jusqu''à la témérité... mais ça marche à chaque fois !', '2025-12-26T20:22:00',  1),
        (23, N'Le plus bel atterrissage en catastrophe que j''aie jamais vu. Personne n''a perdu de PV.', '2026-01-13T19:40:00',  1),
        (24, N'Elle a défendu un débutant qui se faisait insulter dans le chat général. La classe.', '2026-02-01T17:10:00',  1),
        (25, N'Ses conseils de build m''ont fait gagner 30 % de DPS. Merci !', '2026-02-24T21:55:00',  1),
        (26, N'Quand Della organise une sortie, on sait que ce sera épique.', '2026-03-15T20:05:00',  1),
        (27, N'Adorable avec tout le monde, même avec Gripsou, c''est dire.', '2026-04-08T18:25:00',  1),
        (28, N'Toujours prête à aider à récupérer un stuff perdu, peu importe la zone.', '2026-05-27T22:40:00',  1),
        (29, N'Elle a cartographié la face cachée de la Lune pour toute la guilde. Incroyable.', '2026-07-19T16:50:00',  1),
        (30, N'Partie seule explorer une zone inconnue... revenue avec une monture rarissime. Chapeau !', '2026-10-11T21:33:00',  1),
        (31, N'Joueur le plus riche du serveur, mais il compte chaque pièce d''or du butin.', '2025-02-11T10:15:00',  2),
        (32, N'A refusé de payer la réparation de mon armure alors que c''était sa faute. Radin !', '2025-04-30T19:20:00',  2),
        (33, N'Connaît toutes les routes commerciales par cœur, idéal pour farmer.', '2025-07-07T14:00:00',  2),
        (34, N'Plonge dans son coffre de banque tous les matins. Étrange, mais efficace.', '2025-10-22T08:05:00',  2),
        (35, N'Rappelle à chaque raid qu''il a gagné chaque pièce honnêtement.', '2026-03-03T21:45:00',  2),
        (36, N'Toujours son Manuel des Castors Juniors à la main, il a réponse à tout.', '2025-05-16T16:30:00',  3),
        (37, N'Super organisé, il a planifié toute la quête de groupe dans un tableur.', '2026-01-27T18:12:00',  3),
        (38, N'Fonce tête baissée dans chaque pack de mobs. Divertissant, mais épuisant.', '2025-03-25T20:50:00',  4),
        (39, N'Streame toutes ses parties, c''est sympa à regarder.', '2025-08-12T17:35:00',  4),
        (40, N'Très enthousiaste, parfait pour motiver une équipe.', '2025-12-14T19:05:00',  4),
        (41, N'A encore pull le boss sans prévenir...', '2026-06-02T22:28:00',  4),
        (42, N'Connaît le lore du jeu mieux que les développeurs.', '2025-06-06T15:40:00',  6),
        (43, N'Corps à corps impressionnant, ne la sous-estimez pas.', '2025-11-11T20:18:00',  6),
        (44, N'Super gentille, elle m''a offert un objet rare sans rien demander.', '2026-08-21T14:55:00',  6),
        (45, N'Le crash le plus spectaculaire de ma vie. 10/10, je recommande.', '2025-01-30T21:00:00',  7),
        (46, N'Tous ses atterrissages sont des crashs, mais on arrive toujours à destination.', '2025-05-05T18:44:00',  7),
        (47, N'Gentil comme tout, toujours partant pour transporter le groupe.', '2025-09-18T19:27:00',  7),
        (48, N'A confondu le bouton « décoller » et le bouton « éjecter ». Encore.', '2026-02-09T20:36:00',  7),
        (49, N'Pilote fidèle : il ne laisse jamais tomber ses amis (son avion, si).', '2026-09-04T17:13:00',  7),
        (50, N'Tentative d''arnaque à l''hôtel des ventes. Signalé.', '2025-03-08T23:02:00',  8),
        (51, N'Prétend être le joueur le plus riche du serveur. Il ne l''est pas.', '2025-06-27T12:40:00',  8),
        (52, N'A essayé de me revendre un objet de quête en le faisant passer pour légendaire.', '2025-10-03T21:19:00',  8),
        (53, N'Banni, et c''est mérité.', '2026-01-05T09:30:00',  8),
        (54, N'Chef de guilde sage et posé, il apaise toutes les tensions.', '2025-02-22T20:10:00',  9),
        (55, N'Chaman redoutable : ses totems ont sauvé le raid.', '2025-08-30T22:47:00',  9),
        (56, N'Toujours le mot juste pour remotiver l''équipe après un wipe.', '2026-04-18T21:38:00',  9),
        (57, N'Ses portails font gagner un temps fou à tout le groupe.', '2025-04-12T19:00:00', 10),
        (58, N'Mage de givre impressionnante, contrôle de foule parfait.', '2026-05-09T20:52:00', 10),
        (59, N'A trahi la guilde en plein raid pour rejoindre la faction adverse. Signalée.', '2025-09-23T23:59:00', 11),
        (60, N'Répète en boucle que nous ne sommes pas prêts.', '2025-03-14T22:14:00', 13),
        (61, N'Gameplay de chasseur de démons impeccable.', '2025-11-28T20:33:00', 13),
        (62, N'Dix mille ans de prison, et ça se ressent sur son humeur.', '2026-07-02T19:08:00', 13),
        (63, N'LEEEEROY JENKINS ! Et voilà, encore un wipe...', '2025-01-15T21:37:00', 14),
        (64, N'Est parti chercher du poulet en plein briefing de raid.', '2025-04-19T20:21:00', 14),
        (65, N'A ignoré les 15 minutes de stratégie du chef de raid. Classique.', '2025-07-26T22:09:00', 14),
        (66, N'Bon, au moins, il a eu son poulet.', '2025-12-31T23:30:00', 14),
        (67, N'Enthousiasme débordant, coordination inexistante.', '2026-06-20T21:16:00', 14),
        (68, N'Spécialiste des voyages dans le temps : elle arrive toujours pile à l''heure.', '2026-03-28T12:00:00', 15);

    SET IDENTITY_INSERT [dbo].[Comment] OFF;
END
