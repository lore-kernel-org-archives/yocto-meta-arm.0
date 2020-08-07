Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.77])
 by mx.groups.io with SMTP id smtpd.web11.2768.1596792381160098994
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 02:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=pHjRcuz1;
 spf=pass (domain: arm.com, ip: 40.107.15.77, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGYiVAbYBmA66U1exc+5ZRUFvT+YIimtPj9DI12IVe0=;
 b=pHjRcuz1GMC4bvgMMvrBR+7XJM/50b9uVf+RloAzeZtK3Gf7tTqDvUa/FUsEiUkLu6Q02lyrq+vAAq029DTKjrbF3ZyZtbwk5XFSrqvEEsG03x2VwDf/5OfpOJ5WUWcud+UpPykRCEYnuP7Z7ryQgEQChAWLSGACFZYat7Dyhsw=
Received: from AM6P191CA0022.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::35)
 by VI1PR0801MB2094.eurprd08.prod.outlook.com (2603:10a6:800:8f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 09:26:18 +0000
Received: from VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::f2) by AM6P191CA0022.outlook.office365.com
 (2603:10a6:209:8b::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15 via Frontend
 Transport; Fri, 7 Aug 2020 09:26:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT058.mail.protection.outlook.com (10.152.19.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Fri, 7 Aug 2020 09:26:17 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64"); Fri, 07 Aug 2020 09:26:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a123378401ce790a
X-CR-MTA-TID: 64aa7808
Received: from 0c79d2052d20.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 38C38386-76FC-4F6F-982F-7856DF944EEF.1;
	Fri, 07 Aug 2020 09:26:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0c79d2052d20.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Aug 2020 09:26:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AjxlwqyfRp+zAFgNRyZDj3r4w6bap42kI/jwXKvjy5XZ9kfU+/DYj6XvM+f2dC+ahlIVEHlVH/ONhvVlkEqDwuTy958Q8Zx8p88oisJ436XjIKLeF4h2MRV1zwGiEoQ2KXVIxxPYvBIP3/FjsLsEJvtxVQKV81ZUKxbMmeuhuvIDkcGetjSl7x4kLuCk5KzkuBUlGDjacaroj0a6hICtGchOEjhu85dCVoDgmpDeik3lBWnTpUmPiLqOyuPS/pIxSwPUEpxNBS0AB4s2L+DHKNXiO7y+w7CqjHVU5VaCM6mDg/ZoXvANvCqb1tz0uFhCUpPAw9RrSXxoOxMzrON+kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGYiVAbYBmA66U1exc+5ZRUFvT+YIimtPj9DI12IVe0=;
 b=SvCRlyYEIkC79VXTytD/eP8+UkRlwB9hNV6sGX6/RkicoDHFPqNTf6OwtX7Fge7GM2duH4/jh+lL9O2F9DV+R3S8d3cANUzwoTrNft+MU8ceoxVfX6a9Nb+MyZzGjtxyf4fnmtah4m7O0pR/vgl/Yd/HuXpixbNQMBOEVZcotbzeaf+4KaWM0wMRac0Qli+ROJvYcdUBffQtOKtb4s+gilFeFvdxcCG6vVxYrwGf+kJD5RGFewFSIi+Ke2i6z0mMmLlC4VVW803hffuUBbTI1kAQshi6SW30WViHZ/EPxZhl29dZMAZq41QOKkpL5/1r/tVQqy2IsekF1tsvvROZ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGYiVAbYBmA66U1exc+5ZRUFvT+YIimtPj9DI12IVe0=;
 b=pHjRcuz1GMC4bvgMMvrBR+7XJM/50b9uVf+RloAzeZtK3Gf7tTqDvUa/FUsEiUkLu6Q02lyrq+vAAq029DTKjrbF3ZyZtbwk5XFSrqvEEsG03x2VwDf/5OfpOJ5WUWcud+UpPykRCEYnuP7Z7ryQgEQChAWLSGACFZYat7Dyhsw=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM6PR08MB4705.eurprd08.prod.outlook.com (2603:10a6:20b:cf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 09:26:10 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 09:26:10 +0000
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 0/9] Adding support for corstone700 platform
Date: Fri,  7 Aug 2020 10:25:44 +0100
Message-Id: <20200807092553.18876-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SN4PR0501CA0112.namprd05.prod.outlook.com
 (2603:10b6:803:42::29) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by SN4PR0501CA0112.namprd05.prod.outlook.com (2603:10b6:803:42::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.7 via Frontend Transport; Fri, 7 Aug 2020 09:26:08 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3896a28b-8d67-409a-2684-08d83ab3f050
X-MS-TrafficTypeDiagnostic: AM6PR08MB4705:|VI1PR0801MB2094:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0801MB2094DB9488DBCFB75632CAC9FD490@VI1PR0801MB2094.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 dc2K1zjarNT+kmmR4dANtEuI55CEgAUMqZCIm+vJ6y3RIrAxN3qpyJr3fyyNaw5XatfBymsOYzKzXvG9+2zdecIhEsCCfADvLPkROKnR1scbHTwksM4EmbMoeLA5zN8yWGMsw8bKoNfSZU5rd7ZJ/Wr4FkqunOfaQgvKTpmKbyDZE4qB8WunB9E2/cSnO+iE0ggBV/Jp0Gy5XW2LKmnGSisvu8Djn9P4grY0ukXqgIwvO5yA6KsctOtcquIMAHzf2xsVIH3HnsXjXAlUb82X9kxl4hlGbXiGAviO8pbuucb2c8niMpissC7LcJmdSkpoXs2O6QWQkzuyrGz+/OAn5Lf0RY1hS890moyAOr3UsFsgfEjth4kmxCsPl/UPbNpN8hf3veUtzRsW4NTS6fstwQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(83380400001)(4326008)(9686003)(6666004)(86362001)(19627235002)(6916009)(8936002)(6486002)(956004)(2616005)(7696005)(16526019)(52116002)(186003)(1076003)(2906002)(26005)(66476007)(66556008)(66946007)(316002)(36756003)(966005)(5660300002)(8676002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 QWi4ES9+juCTmyXGeDxhdVFCZbNagCd4wPdxDWEYJLINn4EHB4ZRI3TpirVqxu7c7Uvba2gAJF8961Jwy8XnNcIMSllHSkMmdWDp6qf9FQYO6oHN6RvDR9+3zY7UQIvJWbs1YeIRT0wRVvi4uKH+5sbXlEivlhFcx3ZogiA/XSg0R5zJ4p0fEjW9QpK1KwhgKkcsrdtevbSLYrQhir9Td+bJmWOfTKzPhkeAxEZC0waH2Zl8+82SubKh/wZ/Axy0P0WqMLjWlzrCqdm5CO6LvUxHPqidOxCf7ZeVwDRkYet3bhRQ/2Y6Y4++IdmiMOlwnWHNx8HVxOPbnFUQVmCpf62YfCC7ip3r86oxhtNmKqU7XnozYij/AKSga2ucTegk+rLhYgAOhXweG6WLR269tKAP+K/WIr020FZkuQmZQ6FTQNZrQkJI832qdrRuobI0Kh6QeRLVhPE7o0cOIKQE16NAud98OXc0yD7Byxh3FzoFPO5uwZpJwDLdLFA6eDC2s0qH2tuBOvnixsuWCDBl/5AS43S+mIN/NkG8hJ26EqHImvaicxkoTxfSDalc/+zJZIOW/FnoKJ3tHeyttNJCOW3ydgWu+M5qjZlxwNymVbL/nFbHStcse6bGiogPhWpb6VrjU4r86xi+hlCZo4UWDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4705
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	33739776-6023-4086-f43e-08d83ab3eb85
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VCfqG24xGRWTCyStxvOeXgSSQbROypEDWerE6YnNK8Hp1yx7EOgMONS4ZnBANSuvtr0hdr6ErNtgoRsSjFd0ThsA15+ezMUNZcGCNbldjRI4GYtvaVX9yqX0e2mQrNM0UOZh9heMAsy2wfWWTRuty6IkEExwllanjVPqQl1lATbwTbFUyBYBQ4rXQF9nPMxFfBzW+x7JenGVGUw071ApRYOHBqnyx2cOechCpyS3agtKL+95g0j23eiDDA0E4FF4simRwpp6kNNObktRvCVaNtl6zlum6UC9YaxS8JXY1RvONUWPNI7xbwKWQ6Dc3Pcd2+Zdwda1X42Pn0Iw6CdQDtrBcmtwDBfoOd4pDc6ksiIavChJsUbDRyXALXWO9Yeg9A3dwsHP0UTs5C0N9cOwCUS4ms8uwfSbL8nuspXhDcLZZEpSTMo6M489cLBb77qXewFUy9XrqeikoLIYmQiczPgpDGOzZzrx2MW3fXKBchM=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966005)(36906005)(336012)(2616005)(956004)(86362001)(1076003)(6916009)(36756003)(9686003)(316002)(83380400001)(8936002)(16526019)(2906002)(7696005)(82740400003)(8676002)(966005)(47076004)(82310400002)(4326008)(26005)(19627235002)(6666004)(70586007)(186003)(81166007)(70206006)(6486002)(5660300002)(478600001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 09:26:17.6767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3896a28b-8d67-409a-2684-08d83ab3f050
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2094
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
