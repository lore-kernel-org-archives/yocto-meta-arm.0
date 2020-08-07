Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.81])
 by mx.groups.io with SMTP id smtpd.web10.4209.1596829398749542331
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 12:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=NXg0IqI1;
 spf=pass (domain: arm.com, ip: 40.107.2.81, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODCqTiMf12z/W5P4tfGZvPaXXh7EHZrmDUUS8+REAB4=;
 b=NXg0IqI1MRcLq8on5yCmeaQOGX5PpLKp+++j9ZEx46fmH1/UbBTvCZMIf9p4cxAXEOyJtbURsPg27zWSh3Ovd9jzZqtxF0Q8nk6DVRMnLXPATfO/LQWQVf/5QcmUUv/20YRWXtK1N/6G9axo/qPRLS0b9RJMnfOh5vlIHmHv9VM=
Received: from AM7PR04CA0019.eurprd04.prod.outlook.com (2603:10a6:20b:110::29)
 by VI1PR08MB3005.eurprd08.prod.outlook.com (2603:10a6:803:44::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 19:43:15 +0000
Received: from AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::63) by AM7PR04CA0019.outlook.office365.com
 (2603:10a6:20b:110::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16 via Frontend
 Transport; Fri, 7 Aug 2020 19:43:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT004.mail.protection.outlook.com (10.152.16.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Fri, 7 Aug 2020 19:43:15 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64"); Fri, 07 Aug 2020 19:43:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1c1147dc1bc15751
X-CR-MTA-TID: 64aa7808
Received: from 37ecc9dad3e6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 67848977-00B0-43C4-96C6-CDF04E61DAC8.1;
	Fri, 07 Aug 2020 19:43:09 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 37ecc9dad3e6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Aug 2020 19:43:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iz7yHw/l7xsiHMVnpT7vwSF3Nqh6fZCp8N9lkh4CA9ipLFdXAbSo+A9LIu9wybkUJs77PZUn8TKWj8ZP6r65Hfgf2Xm1xOhgmEi0o2NMtyxqnN+kp7oZ+aEpfRH189ZrHG/+IIo/n4dD3HMOp2tbBle3oVn3kVQONCvnRank1j37I1+gVaak+NNXPEy0or+sK5B2ua00cnornS4gpVRhEX9DnFY5xIZz9drL5kNEmwLL/E4WjDEQFs6iEvaOgnvyuSlXFN7lnO1Cf5rLBwp/tYkySdHyblWZQ1pvIpTLttxNF0H81zHdEugluWRyyVIKcvBw3zph1aXrsxFBreG0Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODCqTiMf12z/W5P4tfGZvPaXXh7EHZrmDUUS8+REAB4=;
 b=JPSajFUtZzgnQogPfPfg5FlX2JWBaVL3Q7i4MpLc6SpiZNd7Cq6JQ7imIm7fUZNCDcaImbPZV3IYQdSvmhTZlFBNd5IhxI7JBJV6XaS+f83eo5M7iG7554IhmPEEp0/6KtX+ExOT/FjEn6Pv+AmplK7dpbCz+s6DTSMD0Nd9tXNjMdRrjMGLbVoUOFdcbKlUtOVeFiiY0PI0wCzdM3B0zaT4DO8UNWoA5+S1bx5XkSi4yagj8ZTCQ+5U7NzlmUo8vkP/oeyIKcnM4/MyvQvi6uLMIPeiDGr6T3n0xRCqkS0mYX4g2Pw3+HUVJfex3TmjVq3PnQxa51Zly17d4cXcvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODCqTiMf12z/W5P4tfGZvPaXXh7EHZrmDUUS8+REAB4=;
 b=NXg0IqI1MRcLq8on5yCmeaQOGX5PpLKp+++j9ZEx46fmH1/UbBTvCZMIf9p4cxAXEOyJtbURsPg27zWSh3Ovd9jzZqtxF0Q8nk6DVRMnLXPATfO/LQWQVf/5QcmUUv/20YRWXtK1N/6G9axo/qPRLS0b9RJMnfOh5vlIHmHv9VM=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM6PR08MB4868.eurprd08.prod.outlook.com (2603:10a6:20b:c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Fri, 7 Aug
 2020 19:43:08 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 19:43:08 +0000
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 0/9] Adding support for corstone700 platform
Date: Fri,  7 Aug 2020 20:42:44 +0100
Message-Id: <20200807194253.14748-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SN6PR2101CA0013.namprd21.prod.outlook.com
 (2603:10b6:805:106::23) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by SN6PR2101CA0013.namprd21.prod.outlook.com (2603:10b6:805:106::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.2 via Frontend Transport; Fri, 7 Aug 2020 19:43:07 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7fcadbb8-e356-43dc-33bb-08d83b0a2080
X-MS-TrafficTypeDiagnostic: AM6PR08MB4868:|VI1PR08MB3005:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB3005370C9054DEF16F4B2C3CFD490@VI1PR08MB3005.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 A300rQLFhHB3J04x8GLF25gYs2HictOtJSQCDUz9UoyQSt3hUscjHlid56zPa4w+wDmCG7ySoq9yFmyqc7n78vQhvOfET2JbxolWhG3/Ed4Qc9aqVxlv0GCbaZOSC3WQQHeObVUvZRpzd8zJwtRp9mCL4B/3PFkz02LoEm+oo9iooeFGLXizoAbWbyNuxUZVLfbyTTOOlERNPxjF6UmjnFuzRSE/GuoUQpt/2rpFtEQwv2RVGaAGVW66cfU0ji52MoXTD9LKJYG3gqbwms5nW+dvPMgxNDgWpwYbMjHYhUUhHFCFdrk4cmsZ8yRCbhIrMu3JOJFlomOCMx+7PmpdQwrqzLstA+NgVCDvYYBgUdZVZXDxlbRPXgM5ci9Ld2oRTChfZY7nOtUzkFtOpSFgpg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(83380400001)(8936002)(4326008)(6916009)(1076003)(5660300002)(966005)(956004)(2616005)(8676002)(6486002)(26005)(86362001)(36756003)(52116002)(7696005)(16526019)(6666004)(478600001)(66476007)(9686003)(66556008)(186003)(66946007)(19627235002)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 0/xKje6PS+MIbFVhg5o2jsOWaZRQCaEWeXh4RRMv6VS9UjVJgXFsMPSJ73ny7iAhKdNLjY90eC/fhJkvZjHSjPFLXzLH5CpRN112geDMaAT071J50vXLS47oP5C8zKBUscyoteAyCz9ScEDFdUk4shPZbs5FJIyN58e0xxtq02Mke43ydQ/CDeUtL7/zWk10ps4hMxPgEvXTz+oEN7B8JCVCsSIgpYMnM4QtUuffA71q1hvlqilLfCAPRq7L25uT6QUxKOKzsbESGwD3iEp40w4UWhOveY82mJ3LeN07l1/BOeJstLY6EfMQtX8r06QggzK6ifqDZpGhYD6dinj6hlgSV7/rYsVHYi3j0gR5COp9783X6CvbhmZWspmc5Fxqvd+qi4uFx0ZsGPF9lCJ8zwa6zCrQEd6e72Fmc8tUU/0tQ507PDoi7yquVVOHwFdXrejT0pE5d1uL41OVkBDXs8cUawXCVTCiXJBgP8rIQn9g9wOQKPKl00KbBxu/y1jRloY62ISsSHX7EASOZLAchT8FaI6/Dcxlp+z3AyAwaXF1fQcLwR9MM+nJVrBlcC6YNvOEANMrOPrgAkxpfYRcX865KRKQs/jGT1ujU/3BVnQfQ1WJCDrUjofCWeMhgx4PeClYlb0IIzzIePOX/py3Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4868
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e1435032-13fa-45f1-4c64-08d83b0a1c4b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7JdJeefnC1bpN06mIca9W/v2ysKqz3J5JhuoPYF6UfGBYwXrgvTJRM5jMpg6TtgiYAvQHCPZCI044DrsA9UrMSZ3/kj2cBhYGmGRn4vguQCSrhYXcG3uTf8Cmn1Hr8Td7FLQ/Y/ylOeVvlIfisTEUiFf+GSotFu6ao752IWR3bGtHcv8I7DMFDqk8np0FBTdBsXIW1zSV/ni89BObXJ6KhOsWu6+22e+F9d/Pvf8WyakLoevlGBhB5Cla4BqGndmYZCWFqIFQEl8dAzJEhQ00v7qyvTnbiKwyQPz4vyXvPb8e2w7i7lsYD0TuKNtLZH3j5cW/0HTYOU0tldfYn/K9OeWaVzKtS+M9XbUM3ux9rsG4qcndldSpjYlxarlWxbvbOiECvYCmRs33xja1faj4LYPF2sEPDolvEKx6wbwhV7cRRi5A3kkp0fWG2GJL8M7hc80QHvBiltXmc/YMisU50YoPgmlTe425PBGTEMLLUc=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(46966005)(356005)(336012)(4326008)(83380400001)(5660300002)(82310400002)(8676002)(8936002)(9686003)(19627235002)(316002)(36756003)(7696005)(47076004)(6916009)(16526019)(26005)(478600001)(2906002)(70206006)(70586007)(1076003)(86362001)(2616005)(956004)(6666004)(82740400003)(81166007)(186003)(6486002)(966005)(36906005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 19:43:15.3080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fcadbb8-e356-43dc-33bb-08d83b0a2080
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3005
Content-Type: text/plain

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

These patches add support for corstone700 platform on Arm fast model and
MPS3 FPGA board.
    
For more information about the platform, please check:

https://developer.arm.com/ip-products/subsystem/corstone-foundation-ip/corstone-700

https://community.arm.com/developer/tools-software/oss-platforms/w/docs/444/corstone-700

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
 create mode 100644 meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
 create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-corstone700.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0001-armv7-add-mmio-timer.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0002-board-arm-add-designstart-cortex-a5-board.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0003-arm-Add-corstone700-platform.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0004-boot-add-bootx-command-to-start-XiP-images.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0005-boot-starting-the-XIP-kernel-using-bootx-command.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0006-arm-enabling-the-arch_timer-driver.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700-bsp.scc
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/base.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/eth_lan9115.scc
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/eth_lan91c111.scc
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/lan9115.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/lan91c111.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/pnp.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/xip.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/xip_cmdline.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/xip_dhcp_cmdline.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0001-arm-support-for-a-single-ARMv7-A-based-platform.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0002-arm-Add-tiny-vexpress-machine.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0003-arm-introduce-corstone700_defconfig.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0004-add-driver-of-mailbox-handling-unit-controller-versi.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0005-add-rpmsg-based-on-rpmsg-char-driver-using-mailbox.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0006-enable-arm-MHU-driver-and-RPMSG-char-driver.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0007-allow-creation-of-multiple-arm-rpmsg-channels.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0008-mailbox-enable-combined-receiver-interrupt-when-usin.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0009-misc-arm-add-corstone700-external-system-harness-dri.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0010-arm-containerize-endpoint-and-mailbox-information.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0011-arm-couple-mailbox-channel-ownership-to-rpmsg-endpoi.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0012-mailbox-arm_mhu_v2-add-new-AMBA-ID-to-support-MHU-v2.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0013-mailbox-arm_mhu_v2-dynamic-allocation-of-channels.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0014-defconfig-adjust-XIP-physical-address-to-3MB-offset.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0015-arm-Kconfig-disable-ARM_VIRT-extension-if-XIP_KERNEL.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0016-corstone700_defconfig-use-DDR-address-instead-of-sha.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0017-corstone700_defconfig-enable-configs-for-cramfs-xip.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0018-usb-isp1760-move-to-regmap-for-register-access.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0019-usb-isp1760-hcd-refactor-mempool-config-and-setup.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0020-usb-isp1760-add-support-for-isp1763.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc
 create mode 100644 meta-arm-bsp/wic/arm-reference-image.corstone700.wks
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb

-- 
2.17.1

