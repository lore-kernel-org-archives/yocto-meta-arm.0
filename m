Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.88])
 by mx.groups.io with SMTP id smtpd.web12.11540.1597330371707672742
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 13 Aug 2020 07:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=2jyblkJX;
 spf=pass (domain: arm.com, ip: 40.107.2.88, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqitN0NdyizeNmKa18keXJ5KeFNCFnIKwJnr8eQ2H84=;
 b=2jyblkJXFDEM/rhPiUhEThr+Zt6M8d94o6L1fOYiXRGHvvdYZvC2LXeti+LlkaUzLHXarjMWFvl3s5CnD5HgarIiFKlMUn+9GklhbRjrNTYkUHtgM2fkpX+4ME0fOKNEvcj0q6uJOnPjoCab3zsGkrin59tjg7L9tAcDHst0fCA=
Received: from DB6PR0402CA0018.eurprd04.prod.outlook.com (2603:10a6:4:91::28)
 by AM0PR08MB5076.eurprd08.prod.outlook.com (2603:10a6:208:15e::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Thu, 13 Aug
 2020 14:52:48 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::31) by DB6PR0402CA0018.outlook.office365.com
 (2603:10a6:4:91::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Thu, 13 Aug 2020 14:52:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Thu, 13 Aug 2020 14:52:48 +0000
Received: ("Tessian outbound a0bffebca527:v64"); Thu, 13 Aug 2020 14:52:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 370bea64a4ceb548
X-CR-MTA-TID: 64aa7808
Received: from da33eb56ae30.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C7B2879F-772E-420E-BE50-D309946C0B60.1;
	Thu, 13 Aug 2020 14:52:42 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id da33eb56ae30.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 13 Aug 2020 14:52:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=guDikjYvbnbQonje6yGkJMjH7qlPuSrvs2VDMF6r6ui0p8Dc4wkjhMAAvSPoUKXkGFHXZGOhDBa/Y/VYUqCx7Yec3my5tm+OPfF7fPV+cAwknnmDEaN2JfUBLZnhid/4Km8todf7wTj6+1LHmlY52LttcHb+JWoGtslz2aI8gfd6NmAPayYl5KVdFk2mWswus2Go+GdUMvz0Ev+1gyiPH3kjT7m/eQm1QzYerJ8UfhuGP2Nn2Kajy7Qfjz6/BbUIQ5JRdrwslLBtbpp8sEJm1bTL3v0LObUFd9GeKXE5LeR4KdDs+ZtSVSBD2t7OTy5Boebx49vtQgqZUHmbygFj2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqitN0NdyizeNmKa18keXJ5KeFNCFnIKwJnr8eQ2H84=;
 b=MH5npOgFAKt/cGOfytOdW7eP+7kIEOhupcoG3nV/IQ2gX/iaWKWE72mF15SECXuBPp9GseBQLyzdlKdNpR/wrDsosyMRsqnKaQA2pRQYC0Q3a8G2RjzwslTbaXxf1dl4XUupxPBc7Xux4DQGha3qJKybKuChI/tP24oZLr02QnHRBcrKm6K44txUQRdRXicLfeAC+/Ea+O8L20gncyfZ/pAQZErysuuDVv2emxWKBaKjfQJsb/rgM13JtFBrUjLxQpvQZzqOpGmiU8mOwdYZyKo+BFM9kyLbERS0ENteNfQRe5+uGbXa+OjJC+h/HX4slDfjtwfuLquBd2sOV/6imw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqitN0NdyizeNmKa18keXJ5KeFNCFnIKwJnr8eQ2H84=;
 b=2jyblkJXFDEM/rhPiUhEThr+Zt6M8d94o6L1fOYiXRGHvvdYZvC2LXeti+LlkaUzLHXarjMWFvl3s5CnD5HgarIiFKlMUn+9GklhbRjrNTYkUHtgM2fkpX+4ME0fOKNEvcj0q6uJOnPjoCab3zsGkrin59tjg7L9tAcDHst0fCA=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM7PR08MB5320.eurprd08.prod.outlook.com (2603:10a6:20b:103::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Thu, 13 Aug
 2020 14:52:41 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3283.016; Thu, 13 Aug 2020
 14:52:41 +0000
From: "Abdellatif El Khlifi" <abdellatif.elkhlifi@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH v2 0/9] Adding support for corstone700 platform
Date: Thu, 13 Aug 2020 15:52:21 +0100
Message-Id: <20200813145230.22140-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO3P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::8) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by LO3P123CA0003.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:ba::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Thu, 13 Aug 2020 14:52:40 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d7bccbc1-e276-48c9-f943-08d83f988bd3
X-MS-TrafficTypeDiagnostic: AM7PR08MB5320:|AM0PR08MB5076:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB50765150A4DF1AAFC6575E5DFD430@AM0PR08MB5076.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 QXgqKI/YQlbctSVvybthfyH8RrdF0kms4SgnjC7jl+RioBgen4TRf/P1poiupJQ6c1ukVYJcuKFz7AAOu+03sNNBGnbnpkA5EYNWVYj+Ji0XCDmQIVKGGank7TVQlZANKVKnmjeKorzyZqmRE+RT5OlCviFz6RXeCrfUrrbVT08/5D645dwL4N9bJ4VJkY8HQ1ztXBzLw9aNguz2/pvrLtvOJelzi0PvEbIt+JlJiZeWM2ppWGMyFmtqGt1lS1VPJ690iR12mfTA1KHAPydWW9q4WEoeKAFpTInlwnDdSm99AjazYqlGoScFywCzkgCUI3Rerq6YJAXxgQDP1WL4nGTA5G6sYeKWofzpmas1XDPD3kZt7q7z5xx/3R1IuZfwPBU8IPUlgm8rXS7BjwKcoQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(86362001)(6486002)(2906002)(83380400001)(7696005)(2616005)(956004)(316002)(52116002)(36756003)(9686003)(8936002)(66476007)(6666004)(66556008)(66946007)(8676002)(1076003)(478600001)(16526019)(186003)(966005)(4326008)(6916009)(26005)(5660300002)(19627235002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 1ePipaLXEkUfl904BBGsL/HIfUN31f3kqfxiXFy2w91+Rc9061f2mA7iK5UCPz5QOksmfCBbi8FFW5epYOPyWY7KVMzyTL2mvM0n9X29IIsRUXkpXWVV2fD9NHWVsMycrelrPKUph/l/qOA49cM8S0wAy9CuxGRJYHNgvqqJMRH1+DZFqagSEeXcReDSFOCuZV3k+spOkhTUp6Hb3LvFlTWUi9USeOzYQUw5Ib2EpmEU/Qq3OW9trEFdWrFggW3cs3yVx3oXMCGUky277vULyK/Wm4dm0ba+CobQqVsMjdJ/5sl4rWdQHY55ldw2dhMPuOt/o+9UtiTaUHztcMhoqhKM14oKTCZa5gq6NcvU3k2M4AtvOzP7lOvUL5Q1bxw+7oQ/E/Brfs6bEHfULHpRFwBy7ljH/WYJCN+bOdEnPlTSnY3DO7Uki2cnMCafqCLy3hoRQnQdmOoOu07bQY5Y54ITs46cmwuRV3ckc4JfdvmBBeG//IJFlRDM+zfeo6p6ynNqm/tJVh8jWaM26riCkx2PWXgImjgZfhWzdCfYSIkekfhH28v56VKLOYVW812A8h37Uhwpy3zLNA+5RBdGDS3b6EwVFkzvJ7nLbvNZ4kb4ptr0HEWta7cYzRmbhLHcfIHLUoJCA1ScdFacqyanFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5320
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	80dd30b1-272c-4205-ae1b-08d83f988730
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	77ldYCf5aY9cC2lX5mKv2CDWREG4Q6xlp1bnIic6uLn+6x1NkfmolygrkwNjtUFQ4XSVLxk2xUUaz5clUzgMP8NixIU8ZXPSndZDq/peYVe5AmLuQaOnjQ8+WdvhM4c6qm4mNzqvj/0505Uq/Mko46QtQsMRlsGQnf+nn0OYCH2UIkWiw8IfZgBkW8EI0uXnx45VuPGwo2RCcgWSkBjHKfzT+SQxalnVPyaVXUjQwz2AlMRosx3O0ACaHACylXGhsaUK1pT1OaiTVSAPdVMDATPzYKtlFU6SwkSF0F96hoH4+UeLP2xIiqcx3mjiYgyN38v5AmtmIwS8fC4aticxdkmoZH+GzINH1fvgo6y0eAGY5/hhSGVYLc4CM9jA7OteFHDxPkcEXyOK/WdC/52g5qqYqq3zMuLQZCI0yANdu6S/9lfJdZ4PmCyqVivEgB5Mj6BSFbP9dThm6hvaaMDPqyUdGpyYXQSYrMUw3PR9HKM=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(396003)(376002)(46966005)(7696005)(6486002)(8936002)(16526019)(956004)(2616005)(316002)(2906002)(47076004)(356005)(8676002)(70586007)(186003)(19627235002)(82310400002)(26005)(70206006)(36756003)(1076003)(4326008)(83380400001)(966005)(6666004)(5660300002)(336012)(82740400003)(9686003)(86362001)(478600001)(6916009)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 14:52:48.6349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7bccbc1-e276-48c9-f943-08d83f988bd3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5076
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
 .../0001-arm-Add-corstone700-platform.patch   |  268 ++
 ...dd-bootx-command-to-start-XiP-images.patch |  136 +
 ...g-the-XIP-kernel-using-bootx-command.patch |   39 +
 ...4-arm-enabling-the-arch_timer-driver.patch |   61 +
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   10 +
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
 meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb |   28 +
 47 files changed, 7247 insertions(+)
 create mode 100644 meta-arm-bsp/conf/machine/corstone700-fvp.conf
 create mode 100644 meta-arm-bsp/conf/machine/corstone700-mps3.conf
 create mode 100644 meta-arm-bsp/conf/machine/include/corstone700.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
 create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-corstone700.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0001-arm-Add-corstone700-platform.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0002-boot-add-bootx-command-to-start-XiP-images.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0003-boot-starting-the-XIP-kernel-using-bootx-command.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0004-arm-enabling-the-arch_timer-driver.patch
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

