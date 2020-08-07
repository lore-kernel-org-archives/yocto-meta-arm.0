Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.61])
 by mx.groups.io with SMTP id smtpd.web11.5105.1596804140553757796
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 05:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=cfNmYYBz;
 spf=pass (domain: arm.com, ip: 40.107.4.61, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGYiVAbYBmA66U1exc+5ZRUFvT+YIimtPj9DI12IVe0=;
 b=cfNmYYBzXidGJ9IdoRCg+e+aR35CocmlIIlEIXHbU1qqys/n30frFuutAGhby18LSH9ctvai60iZX5d/3CRV7UpgegVpyok+8AcSgG+MZTi70qeKDWMC1m7oJtLPNyPet/lFlmWZK0Y8WUclIOn+25+kjGgkTIf7VYgVwsh8x9I=
Received: from DB6PR0601CA0036.eurprd06.prod.outlook.com (2603:10a6:4:17::22)
 by DB8PR08MB5465.eurprd08.prod.outlook.com (2603:10a6:10:118::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Fri, 7 Aug
 2020 12:42:18 +0000
Received: from DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::da) by DB6PR0601CA0036.outlook.office365.com
 (2603:10a6:4:17::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15 via Frontend
 Transport; Fri, 7 Aug 2020 12:42:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT008.mail.protection.outlook.com (10.152.20.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Fri, 7 Aug 2020 12:42:17 +0000
Received: ("Tessian outbound bac899b43a54:v64"); Fri, 07 Aug 2020 12:42:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 537b3fce817060ec
X-CR-MTA-TID: 64aa7808
Received: from be636e131578.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 794EF7D8-1C5F-44E2-BC44-D2B0B60130B5.1;
	Fri, 07 Aug 2020 12:42:12 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id be636e131578.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Aug 2020 12:42:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfMpzHJ7N+q1ubKgkQph4Gpr/0+KlznEHvAuByt1ACzhFrcXEuvWn5tji1UgHs0qQK88s5aUHuZdHBSO2EYHHQiHH+aWn6TRHsgxl7P0OUMqN95FpqK9BesyIyDL9tDMk8CoTUixoEv8SON38/CBtpiPfNytfePEu6HUOC2DqcO6WZx4SrvCe6BQikP359aJ0v9pgySAhqaO8YwmXSZGEs6uE0n4mbcF04nG1ZHgqmVyZGjXpKa0Q+q7Yr+UwaxE04eusXqrC0tWVp6El3tqpJbHrN8mwQIJWw1kWUQ2p41adtm1+7B/sIEuewwRYEK2psTiqFaKvicxutrSyLgwZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGYiVAbYBmA66U1exc+5ZRUFvT+YIimtPj9DI12IVe0=;
 b=Grdsrk90TBoQTLWh9NkbOnFDfBZckQ6U7fvdcNtofxiyFO9u1mIwsU5eKWtLFj+qTtFOWJx6LIis/Par55NLxtlyjVtPquvEkY9PbgpJ0ys/ZhbSPXaOiMXBxgySkwYB3rMHLlL9MPGDLFGgfv/inlxH2A68fMeivwUBFBbs7BEva+ZMMG93k6iQmKkdv6UI371QfRrq3jteE29ejYNo7GMiytFweA2gALBlk4FSVNmJ6hodsUkV+HtpMQ2Izil+/c1M3VNrd2MFe0/ULfb8gvTXNZK3djmvG9XT57ciTFc3u3H1kbICRG/eSz5EqJuEZH24ocip71trRj8CvHQYew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGYiVAbYBmA66U1exc+5ZRUFvT+YIimtPj9DI12IVe0=;
 b=cfNmYYBzXidGJ9IdoRCg+e+aR35CocmlIIlEIXHbU1qqys/n30frFuutAGhby18LSH9ctvai60iZX5d/3CRV7UpgegVpyok+8AcSgG+MZTi70qeKDWMC1m7oJtLPNyPet/lFlmWZK0Y8WUclIOn+25+kjGgkTIf7VYgVwsh8x9I=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM6PR08MB5175.eurprd08.prod.outlook.com (2603:10a6:20b:ef::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Fri, 7 Aug
 2020 12:42:11 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 12:42:11 +0000
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 0/9] Adding support for corstone700 platform
Date: Fri,  7 Aug 2020 13:41:46 +0100
Message-Id: <20200807124155.24198-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SN4PR0401CA0043.namprd04.prod.outlook.com
 (2603:10b6:803:2a::29) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by SN4PR0401CA0043.namprd04.prod.outlook.com (2603:10b6:803:2a::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Fri, 7 Aug 2020 12:42:09 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3d41d52b-2d1f-4a35-5d93-08d83acf51c4
X-MS-TrafficTypeDiagnostic: AM6PR08MB5175:|DB8PR08MB5465:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB5465C9412B6EED6A1672B1D3FD490@DB8PR08MB5465.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 mNMc6ks4X5o8082GuOngoZDgLjE99nSPwsE/FhEJYnB+YBcjRyJnKGqWfSuJn9j5f6OuXxTENG818xsy7mKqlUTFuSlMoNUlV1BtSwII1869ORh9cJ3c8ACrcEfIj6xtXYDV3cKX0dXF+QSgbW/m3SEn2Aws3xifALKhZSVAavJllWUFqc8RxGrsNuo/iNT872+t0JofUfGBdRwSZ4n+q0gV6lbrQ1iXgaolOoVrBcMFSZ9tRcdmdxmbenBcYrKxk2ReRBvaKiRQnVivHsluyHgdrVbp5Y1RJzp9v+dlNNXjWa1k5763aehj5Zx73WLJ3r2Fy0dcf8QHi7J3ZVd4hlbVREzhMIY0d0wy3zPAVJ4ssOBqbd9rbmf5XFdHn7F0qLBbuqij1Hd+ZYU9QNfs2w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(8676002)(2906002)(83380400001)(6916009)(26005)(9686003)(186003)(16526019)(956004)(2616005)(8936002)(966005)(478600001)(6666004)(316002)(66476007)(4326008)(19627235002)(52116002)(7696005)(6486002)(5660300002)(86362001)(1076003)(36756003)(66556008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 LZdAA+z87Vzg8joJv2XoPEm+56O+kTG8nukHjQrKpRWJQgYeobMvQJ7yY7XuTfJB5mqtRS10KFR9+Qsy5+y6W62+uAa5YmQ1qEdap94wmSins1QPW4bjnjov5zb0auS23mvIkW1KTCtb4E1MZwi7hSzqH2Ca+y1hWFiWnKviC8Zyy7odB54tG/aDxvRna4bLq1dmyEu57W0+GUOktpiDkaDh7wHHtwqi98Of/ALG6mI99bC5MYsSHIDleAEIEdSUsmBZdfUphXCPrK83hKVOy/bw5D0XRkQaLuKaxlguWSyCkRr9cLlra7eyaqjJ6+qcR9J9racF5FQbB9nangCI68fhvuJE+A1wMH4S+G5sfDQEN4WqWakhoMG6mEuev5WMnRx2uJqAQXHKtjCZ55pBoZwaCnUidWv64ekV/TseW1xLsLym18lulZ+kD4lalYPTtPQAIou1AXiXZ9+YGylLHIjXVsjL+Esv3u5RtCpTxGK12LwQg00D/zbcJ6iNqiZKIlDKvIigkagvsOCR1S3PiTaJWtKS0AIpxoDS7G0X2SmjLS9vZ+IqNOlzzkzxKcL+ObdBBesK5suoDjL5RCIore9aLHdxkp8G/QS2j3wevTlyS/+9UI7DADsHYQ5uJ+nNNqCcj/xwZDUMj20esu7r1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5175
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4638c323-501b-44d0-5a3c-08d83acf4d7c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3cjMpdHK7htnXjEi4aEC32zNfWIAoeF2p/RMNuYdaF4Y5GwZOfwq0/uGvFxsnwekoybSzKy0XzwKI05NFiWqLvZNARTc9FFHR+xt+8pQrvACkteAqCP7nl8k7eDQ4IItjt/yoqTAVZ5+bifaVdJsacMaWq0DQLMC5jLmFGBz56vLsImO5usYtKE57CtCzL/Ox3ycQtNCuUZ+gL5gHbdJrAGksWwust/5kl9PPjtn1tJ4B9yGk87qLjkq6jw+Sg9uPWrTqqLlCInvtbutzFkTK1xVe/cIIyciIZpIO4h9XVr4PKfVJEU8yW4h/S5fQ680P/KOup4IYt5pG1yZ24olgG0Ug1QvAlDcPBb/KvXLiJ42yK65M7mamfvpm3HpKYSmvs6Sf2/AxhgmxPko6bB/kTuOGFxFsLpMTsPDo62oaI4in0h0nlv/Iphq/C1oUqaAzX92NinHNYUsxxTE+1g/u4/5XCKZwcxOXGB57PuBeW0=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(46966005)(6486002)(8676002)(36756003)(966005)(8936002)(86362001)(2906002)(186003)(478600001)(7696005)(26005)(9686003)(16526019)(83380400001)(956004)(2616005)(5660300002)(356005)(6666004)(81166007)(70206006)(70586007)(82310400002)(6916009)(4326008)(47076004)(336012)(82740400003)(19627235002)(316002)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 12:42:17.7310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d41d52b-2d1f-4a35-5d93-08d83acf51c4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5465
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

These patches add support for corstone700 platform on Arm fast model and
MPS3 FPGA board.

For more information about the platform, please check:

https://developer.arm.com/ip-products/subsystem/corstone-foundation-ip/cors=
tone-700

https://community.arm.com/developer/tools-software/oss-platforms/w/docs/444=
/corstone-700

Abdellatif El Khlifi (8):
  arm-bsp/machine: adding corstone700-fvp machine
  arm-bsp/linux: configuring v5.6 kernel for corstone700 platforms
  arm-bsp/trusted-firmware-a: adding support for corstone700 platform
  arm-bsp/external-system: enabling corstone700 platform support
  arm-bsp/u-boot: adding corstone700 platform to u-boot
  arm-bsp/scp-firmware: adding scp support for corstone700 platform
  arm-bsp/machine: adding corstone700-mps3 machine
  arm-bsp/linux: Enabling lan9115 Ethernet for corstone700-mps3

Rui Miguel Silva (1):
  arm-bsp/external-system: add external system recipe

 .../conf/machine/corstone700-fvp.conf         |   12 +
 .../conf/machine/corstone700-mps3.conf        |   12 +
 .../conf/machine/include/corstone700.inc      |   34 +
 .../external-system/external-system_0.1.0.bb  |   45 +
 .../scp-firmware/scp-firmware-corstone700.inc |   37 +
 .../scp-firmware/scp-firmware_%.bbappend      |    1 +
 .../trusted-firmware-a-corstone700.inc        |   26 +
 .../trusted-firmware-a_2.3.bbappend           |    1 +
 .../0001-armv7-add-mmio-timer.patch           |  108 +
 ...-arm-add-designstart-cortex-a5-board.patch |  312 +++
 .../0003-arm-Add-corstone700-platform.patch   |  301 +++
 ...dd-bootx-command-to-start-XiP-images.patch |  136 +
 ...g-the-XIP-kernel-using-bootx-command.patch |   39 +
 ...6-arm-enabling-the-arch_timer-driver.patch |   61 +
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   12 +
 .../bsp/arm-platforms/corstone700-bsp.scc     |    6 +
 .../bsp/arm-platforms/corstone700/base.cfg    |   35 +
 .../arm-platforms/corstone700/eth_lan9115.scc |    4 +
 .../corstone700/eth_lan91c111.scc             |    4 +
 .../bsp/arm-platforms/corstone700/lan9115.cfg |    1 +
 .../arm-platforms/corstone700/lan91c111.cfg   |    1 +
 .../bsp/arm-platforms/corstone700/pnp.cfg     |    4 +
 .../bsp/arm-platforms/corstone700/xip.cfg     |   12 +
 .../arm-platforms/corstone700/xip_cmdline.cfg |    3 +
 .../corstone700/xip_dhcp_cmdline.cfg          |    3 +
 ...-for-a-single-ARMv7-A-based-platform.patch |   97 +
 .../0002-arm-Add-tiny-vexpress-machine.patch  |  101 +
 ...-arm-introduce-corstone700_defconfig.patch |  197 ++
 ...ilbox-handling-unit-controller-versi.patch |  322 +++
 ...d-on-rpmsg-char-driver-using-mailbox.patch |  202 ++
 ...arm-MHU-driver-and-RPMSG-char-driver.patch |   30 +
 ...ation-of-multiple-arm-rpmsg-channels.patch |  148 ++
 ...ombined-receiver-interrupt-when-usin.patch |   59 +
 ...stone700-external-system-harness-dri.patch |  232 ++
 ...ize-endpoint-and-mailbox-information.patch |  181 ++
 ...ox-channel-ownership-to-rpmsg-endpoi.patch |  107 +
 ...v2-add-new-AMBA-ID-to-support-MHU-v2.patch |   36 +
 ...hu_v2-dynamic-allocation-of-channels.patch |  119 +
 ...t-XIP-physical-address-to-3MB-offset.patch |   42 +
 ...ble-ARM_VIRT-extension-if-XIP_KERNEL.patch |   50 +
 ...onfig-use-DDR-address-instead-of-sha.patch |   34 +
 ...config-enable-configs-for-cramfs-xip.patch |   61 +
 ...0-move-to-regmap-for-register-access.patch | 2297 +++++++++++++++++
 ...cd-refactor-mempool-config-and-setup.patch |  302 +++
 ...-usb-isp1760-add-support-for-isp1763.patch | 1755 +++++++++++++
 .../linux/linux-stable-corstone700.inc        |   62 +
 .../linux/linux-stable_%.bbappend             |    8 +
 .../wic/arm-reference-image.corstone700.wks   |   22 +
 meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb |   26 +
 49 files changed, 7700 insertions(+)
 create mode 100644 meta-arm-bsp/conf/machine/corstone700-fvp.conf
 create mode 100644 meta-arm-bsp/conf/machine/corstone700-mps3.conf
 create mode 100644 meta-arm-bsp/conf/machine/include/corstone700.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/external-system/external-syste=
m_0.1.0.bb
 create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-cors=
tone700.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a-corstone700.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0001-=
armv7-add-mmio-timer.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0002-=
board-arm-add-designstart-cortex-a5-board.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0003-=
arm-Add-corstone700-platform.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0004-=
boot-add-bootx-command-to-start-XiP-images.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0005-=
boot-starting-the-XIP-kernel-using-bootx-command.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0006-=
arm-enabling-the-arch_timer-driver.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/b=
sp/arm-platforms/corstone700-bsp.scc
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/b=
sp/arm-platforms/corstone700/base.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/b=
sp/arm-platforms/corstone700/eth_lan9115.scc
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/b=
sp/arm-platforms/corstone700/eth_lan91c111.scc
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/b=
sp/arm-platforms/corstone700/lan9115.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/b=
sp/arm-platforms/corstone700/lan91c111.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/b=
sp/arm-platforms/corstone700/pnp.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/b=
sp/arm-platforms/corstone700/xip.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/b=
sp/arm-platforms/corstone700/xip_cmdline.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/b=
sp/arm-platforms/corstone700/xip_dhcp_cmdline.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/000=
1-arm-support-for-a-single-ARMv7-A-based-platform.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/000=
2-arm-Add-tiny-vexpress-machine.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/000=
3-arm-introduce-corstone700_defconfig.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/000=
4-add-driver-of-mailbox-handling-unit-controller-versi.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/000=
5-add-rpmsg-based-on-rpmsg-char-driver-using-mailbox.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/000=
6-enable-arm-MHU-driver-and-RPMSG-char-driver.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/000=
7-allow-creation-of-multiple-arm-rpmsg-channels.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/000=
8-mailbox-enable-combined-receiver-interrupt-when-usin.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/000=
9-misc-arm-add-corstone700-external-system-harness-dri.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/001=
0-arm-containerize-endpoint-and-mailbox-information.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/001=
1-arm-couple-mailbox-channel-ownership-to-rpmsg-endpoi.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/001=
2-mailbox-arm_mhu_v2-add-new-AMBA-ID-to-support-MHU-v2.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/001=
3-mailbox-arm_mhu_v2-dynamic-allocation-of-channels.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/001=
4-defconfig-adjust-XIP-physical-address-to-3MB-offset.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/001=
5-arm-Kconfig-disable-ARM_VIRT-extension-if-XIP_KERNEL.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/001=
6-corstone700_defconfig-use-DDR-address-instead-of-sha.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/001=
7-corstone700_defconfig-enable-configs-for-cramfs-xip.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/001=
8-usb-isp1760-move-to-regmap-for-register-access.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/001=
9-usb-isp1760-hcd-refactor-mempool-config-and-setup.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/002=
0-usb-isp1760-add-support-for-isp1763.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone=
700.inc
 create mode 100644 meta-arm-bsp/wic/arm-reference-image.corstone700.wks
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb

--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
