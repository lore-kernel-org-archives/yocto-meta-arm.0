Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.87])
 by mx.groups.io with SMTP id smtpd.web10.5534.1583924235115695860
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Mar 2020 03:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=TxL2qXDc;
 spf=pass (domain: arm.com, ip: 40.107.8.87, mailfrom: rui.silva@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jdONBGCRu8mFP/PWkN66G4tOi4zmtKp1edCMDQCc5bA=;
 b=TxL2qXDcVo54OlFZshmWOG3ggRW7kc3c6OzI9T+r+cfeKEnnqVlWUfFfLL6+obtb14VzBR8jgavY2QCp4qKLGJxYc2UsS4whUzLcV+ABpNBxSPthSLqhrrgZmrOlk+2lDBu2vhY2pUOU2CPVlV0nmehRX2dOA1NixWvhcLENcJk=
Received: from DB8PR09CA0031.eurprd09.prod.outlook.com (2603:10a6:10:a0::44)
 by VE1PR08MB4671.eurprd08.prod.outlook.com (2603:10a6:802:ad::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Wed, 11 Mar
 2020 10:57:11 +0000
Received: from DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::14) by DB8PR09CA0031.outlook.office365.com
 (2603:10a6:10:a0::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.15 via Frontend
 Transport; Wed, 11 Mar 2020 10:57:10 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT035.mail.protection.outlook.com (10.152.20.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13 via Frontend Transport; Wed, 11 Mar 2020 10:57:10 +0000
Received: ("Tessian outbound 3a0cbd311638:v42"); Wed, 11 Mar 2020 10:57:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: eaf949381d13b9fa
X-CR-MTA-TID: 64aa7808
Received: from 35c8eb87e2bf.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1C243A7B-CC78-4AB2-91D8-5AD270091F0B.1;
	Wed, 11 Mar 2020 10:57:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 35c8eb87e2bf.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 11 Mar 2020 10:57:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5Lxe6nG8SqBX81Fasov26myPJ7VNR6cJARIiTCZwKLJGEObwYGjgyJBnLDnBFO6DqcCIGZd4aLhXo6ki0j8g8kQYzbU8wrvILrqTc3ammEGkrwwjF2K8wdSZTh+GXGteuPM4I8YiaHDnyYkMJ9EtNMdYJBBeag7Z9ybngrIQXa4nWPfBf2A5iZ2jcDnwr6PcXjPdh13w9/p8R6Y2ufFZvTbOyQgFz84ADGoIHT2XPmwQW8AiXFLVpZbdG3SezpqFuc6LBMKJ1onueicVhXXk72VSe01uv55Vpsfc/H2gfnAj7dy8YjSCuBpYYVA8EfC0e30MRLO11BjXpneT94a+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jdONBGCRu8mFP/PWkN66G4tOi4zmtKp1edCMDQCc5bA=;
 b=QEDrgRWXa0xdK8kzUeyNv/V7M1BqnKMd6xpf6rdzhEA3Nl76SdzVwwKNNiVhtdv6tv9p+0LkJwLQm2EZN4z/wouFPC8BQT/zKW9qN3rEdO+87HYJB+CrYB2xWRDV9xvYM4UPacfWVjB9rkOca6AQ0FJAch0yGcdNqv1+baKzmDHXNO7ZUUzRyJG853jngfuEilVJLmx80jZ8FZW+jWPak7rwAFZvKz9rynoeu6QrFmGb9JpIIWb/dxyNUL1NBLflKRvrTxYZEZNjgZfBT8ylOL4GqIxUUqWShTLRz1dRl9a2P37prfBDJ8895zd3BKhfmYd6d8vACtR4OsMda5MWGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jdONBGCRu8mFP/PWkN66G4tOi4zmtKp1edCMDQCc5bA=;
 b=TxL2qXDcVo54OlFZshmWOG3ggRW7kc3c6OzI9T+r+cfeKEnnqVlWUfFfLL6+obtb14VzBR8jgavY2QCp4qKLGJxYc2UsS4whUzLcV+ABpNBxSPthSLqhrrgZmrOlk+2lDBu2vhY2pUOU2CPVlV0nmehRX2dOA1NixWvhcLENcJk=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Rui.Silva@arm.com; 
Received: from HE1PR0801MB2044.eurprd08.prod.outlook.com (10.168.95.21) by
 HE1PR0801MB2028.eurprd08.prod.outlook.com (10.168.98.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.16; Wed, 11 Mar 2020 10:57:03 +0000
Received: from HE1PR0801MB2044.eurprd08.prod.outlook.com
 ([fe80::42b:e060:9180:6be]) by HE1PR0801MB2044.eurprd08.prod.outlook.com
 ([fe80::42b:e060:9180:6be%8]) with mapi id 15.20.2814.007; Wed, 11 Mar 2020
 10:57:03 +0000
From: "Rui Miguel Silva" <rui.silva@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Rui Silva <rui.silva@arm.com>
Subject: [PATCH 3/3] arm-bsp: add support to cortex-a5 designstart
Date: Wed, 11 Mar 2020 10:56:43 +0000
Message-Id: <20200311105643.159467-4-rui.silva@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311105643.159467-1-rui.silva@arm.com>
References: <20200311105643.159467-1-rui.silva@arm.com>
X-ClientProxiedBy: MRXP264CA0020.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::32) To HE1PR0801MB2044.eurprd08.prod.outlook.com
 (2603:10a6:3:50::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from arch-thunder.local (109.49.46.234) by MRXP264CA0020.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.14 via Frontend Transport; Wed, 11 Mar 2020 10:57:02 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [109.49.46.234]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c4759f55-2918-4a67-6e68-08d7c5aaf302
X-MS-TrafficTypeDiagnostic: HE1PR0801MB2028:|HE1PR0801MB2028:|VE1PR08MB4671:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB46711FF5E5D7D3B3CB4CB393EAFC0@VE1PR08MB4671.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:8882;
X-Forefront-PRVS: 0339F89554
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(199004)(4326008)(6512007)(26005)(66476007)(36756003)(52116002)(66946007)(186003)(66556008)(2906002)(478600001)(1076003)(6506007)(316002)(8676002)(81156014)(6486002)(16526019)(6666004)(86362001)(2616005)(81166006)(6916009)(30864003)(956004)(8936002)(5660300002)(966005);DIR:OUT;SFP:1101;SCL:1;SRVR:HE1PR0801MB2028;H:HE1PR0801MB2044.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 UBd2RevXgwuyNDtUNSuegrvcQ8zddHmLtHzmcVnjmrx3UASWUh0SxjqgpyysmkJ5wim9rMgcUbn297Njn+SG/c7hQs+8wjRDs1LbsonVe0O43O8y95RIgAPOgfSnSMwi9rAMx/3PHaPQMbHchIL0/Vobxy82hDPQcXn/em5ap6d3qmuNumQoYWtIkct8og/zbtaW8sc0sAQVy/Z7rJeZaursJDaayH6DTovHSOpEcDWe/UsvhZRUZDMs3CBjBNJnwMDJvAuSuefArKBNNFrNYybd06xrdktQhi25r4SQ5fqg3tRlHIueXAYykSjcgeeV3mnx5Z3pfp0s8x06jo7vGl8OZNkWf/l1L0XssidZWAXoMXfEknCMhqYbkO5hgoZUFIHP9HIsX2bIpIUU5vgn8BG+FTV8XZnDYfzSg+ia0dZjUwO3+XoYR9ZOo72Ei8KyHLOLJ1L5xoGZUm4ttsLf/7dRCC0H7Xaw1QOCELa6siZkU6F9O9TzTO+MjrRacEpmn7Ga4io9qlfVsgajEN8bfw==
X-MS-Exchange-AntiSpam-MessageData: 
 ezWlemVmD4C1QspjQFZFIn6zRj+loXG4lQObiOUrbtlimBpcqZ+fLznmjuV2h4Nu/vV2trJ8k8wESzqP7bD3cQTV7HoTnx7RC9mkU3LlNPLBlv1T8Ly3aoD5EyxxYT641a0dA6szLblLJj/IavShHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2028
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Rui.Silva@arm.com; 
Return-Path: Rui.Silva@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(376002)(396003)(346002)(39860400002)(136003)(199004)(956004)(70206006)(26005)(6512007)(336012)(5660300002)(70586007)(36756003)(6486002)(6916009)(4326008)(2616005)(86362001)(16526019)(26826003)(966005)(6666004)(81166006)(356004)(30864003)(478600001)(186003)(2906002)(8676002)(1076003)(316002)(81156014)(6506007)(8936002);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR08MB4671;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	132d283e-a752-4c69-6e58-08d7c5aaee5a
X-Forefront-PRVS: 0339F89554
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	N0My+uWWEuvmR3LHwP4m7RvsLD9o7qjfpKCAh9KgaXoZ9QW9se1mU65lVM0VXC8mS2HiJvOg7hDsjX18FIBBCXUF79iuhfv3gywYHwkQCmyYZtq03gxt5KVxT3iXht7ykJ/4ZQ5oMF6dWMbGaY/cZS6KptQA8wzxGF+YBQA88JG87QYNc46lRUvC8jeE7KzhNIgkje2ygg5jaHSUo+DcEyYlk9HJeAMnflvZk9AcgUOY8vY7wg4ulhWaiuXrroEl+JIB2wWVqOBMKoKaTBVpaVc021uYR4NzsIEuvAa4edl2A3Es5h+jQObvarnzKQrcnk/qQmtI1mhefjj34iUXELxkXgzanLzru8BY1trbHJWm0MCORCjoOCdotjYOMgTsYz+o38S9JfLVhYXg+F8fMJ8mXJ1XQGACA2NViMnA7fau1bcvpwu5nqz3t+ByXmVS1vgmoK8txwDt3O1MUF4LTotZUcE/bPNzocRbOWrl/GbYq90lnkbLd5JGRMDb2Tk+6xUizvel9oCpOfw47vfh1g==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2020 10:57:10.8279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4759f55-2918-4a67-6e68-08d7c5aaf302
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4671
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Rui Silva <rui.silva@arm.com>

Add tf-a recipes, u-boot, machine configuration, and documentation to
support Arm Cortex-A5 Designstart.

The output of this build is compatible to run on the FVP and
the FPGA implementation of the package.

For more information see:
https://community.arm.com/developer/ip-products/processors/\
designstart/b/blog/posts/\
pre-silicon-software-development-with-arm-models-for-cortex-a5-designstart

Change-Id: Ie2715ad1871975cb7620d7a195c8dd74144629da
Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
---
 meta-arm-bsp/conf/machine/a5ds.conf           |  25 ++
 meta-arm-bsp/documentation/a5ds.md            |  24 ++
 ...t-arm-a5ds-move-dtb-to-a-new-address.patch |  31 ++
 .../trusted-firmware-a-a5ds.inc               |  22 ++
 .../trusted-firmware-a_git.bbappend           |   7 +
 .../a5ds/0001-armv7-add-mmio-timer.patch      | 105 ++++++
 ...-arm-add-designstart-cortex-a5-board.patch | 309 ++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   8 +
 8 files changed, 531 insertions(+)
 create mode 100644 meta-arm-bsp/conf/machine/a5ds.conf
 create mode 100644 meta-arm-bsp/documentation/a5ds.md
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/a5ds/=
0001-plat-arm-a5ds-move-dtb-to-a-new-address.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a-a5ds.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_git.bbappend
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0001-armv7-a=
dd-mmio-timer.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0002-board-a=
rm-add-designstart-cortex-a5-board.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend

diff --git a/meta-arm-bsp/conf/machine/a5ds.conf b/meta-arm-bsp/conf/machin=
e/a5ds.conf
new file mode 100644
index 000000000000..d220423ecca8
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/a5ds.conf
@@ -0,0 +1,25 @@
+# Configuration for Cortex-A5 DesignStart development board
+
+#@TYPE: Machine
+#@NAME: a5ds machine
+#@DESCRIPTION: Machine configuration for Cortex-A5 DesignStart
+
+require conf/machine/include/tune-cortexa5.inc
+
+PREFERRED_PROVIDER_virtual/kernel =3D "linux-upstream-arm"
+PREFERRED_VERSION_linux-upstream-arm ?=3D "5.3%"
+KBUILD_DEFCONFIG =3D "multi_v7_defconfig"
+
+EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a u-boot"
+
+SERIAL_CONSOLES =3D "115200;ttyAMA0"
+
+IMAGE_FSTYPES +=3D "tar.bz2 wic wic.nopt cpio.gz"
+
+EXTRA_IMAGEDEPENDS +=3D "u-boot"
+
+# Cortex-a5 u-boot configuration
+UBOOT_MACHINE =3D "designstart_ca5_defconfig"
+UBOOT_IMAGE_ENTRYPOINT =3D "0x84000000"
+UBOOT_IMAGE_LOADADDRESS =3D "0x84000000"
+
diff --git a/meta-arm-bsp/documentation/a5ds.md b/meta-arm-bsp/documentatio=
n/a5ds.md
new file mode 100644
index 000000000000..9f88abc1d449
--- /dev/null
+++ b/meta-arm-bsp/documentation/a5ds.md
@@ -0,0 +1,24 @@
+# Cortex-A5 DesignStart A5DS Platform Support in meta-arm-platforms
+
+## Howto Build and Run
+
+### Configuration:
+In the local.conf file, MACHINE should be set as follow:
+MACHINE ?=3D "a5ds"
+DISTRO ?=3D "iota-tiny"
+
+Or set environment variables with that values:
+
+MACHINE "a5ds"
+DISTRO "iota-tiny"
+
+### Build:
+``bash$ bitbake iota-tiny-image```
+
+### Run:
+To run the result in a Fixed Virtual Platform please get:
+https://git.linaro.org/landing-teams/working/arm/model-scripts
+
+and follow the instructions in the readme.txt file in that
+repository.
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/a5ds/0001-pl=
at-arm-a5ds-move-dtb-to-a-new-address.patch b/meta-arm-bsp/recipes-bsp/trus=
ted-firmware-a/files/a5ds/0001-plat-arm-a5ds-move-dtb-to-a-new-address.patc=
h
new file mode 100644
index 000000000000..389bc52842be
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/a5ds/0001-plat-arm-=
a5ds-move-dtb-to-a-new-address.patch
@@ -0,0 +1,31 @@
+From d3cadbc6f1060020960dc05af0465db919bbbe2b Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Fri, 30 Aug 2019 13:38:44 +0100
+Subject: [PATCH] plat/arm: a5ds: move dtb to a new address
+
+When Using bigger kernel images (>8.4MB compressed zImage) and at
+decompress and final location init stage of kernel start makes it
+override dtb at this address, to avoid this move the dtb a little
+higher in address related.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ plat/arm/board/a5ds/fdts/a5ds_tb_fw_config.dts | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/plat/arm/board/a5ds/fdts/a5ds_tb_fw_config.dts b/plat/arm/boa=
rd/a5ds/fdts/a5ds_tb_fw_config.dts
+index 9ab2d9656600..c616ff772237 100644
+--- a/plat/arm/board/a5ds/fdts/a5ds_tb_fw_config.dts
++++ b/plat/arm/board/a5ds/fdts/a5ds_tb_fw_config.dts
+@@ -10,7 +10,7 @@
+       /* Platform Config */
+       plat_arm_bl2 {
+               compatible =3D "arm,tb_fw";
+-              hw_config_addr =3D <0x0 0x82000000>;
++              hw_config_addr =3D <0x0 0x83000000>;
+               hw_config_max_size =3D <0x01000000>;
+               /* Disable authentication for development */
+               disable_auth =3D <0x0>;
+--
+2.22.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
-a5ds.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
a5ds.inc
new file mode 100644
index 000000000000..aa21b7431d3b
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-a5ds.i=
nc
@@ -0,0 +1,22 @@
+# Cortex-A5 Designstart specific TFA support
+
+COMPATIBLE_MACHINE =3D "a5ds"
+TFA_PLATFORM =3D "a5ds"
+TFA_DEBUG =3D "1"
+TFA_UBOOT =3D "1"
+TFA_BUILD_TARGET =3D "all fip"
+TFA_INSTALL_TARGET =3D "bl1.bin fip.bin"
+
+SRCREV =3D "5d3ee0764b03567bf3501edf47d67d72daff0cb3"
+LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D1dd070c98a281d18d9eefd93872=
9b031"
+
+EXTRA_OEMAKE_append =3D " \
+                    ARCH=3Daarch32 \
+                    FVP_HW_CONFIG_DTS=3Dfdts/a5ds.dts \
+                    ARM_ARCH_MAJOR=3D7 \
+                    AARCH32_SP=3Dsp_min \
+                    ARM_CORTEX_A5=3Dyes \
+                    ARM_XLAT_TABLES_LIB_V1=3D1 \
+                    "
+
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
_git.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a_git.bbappend
new file mode 100644
index 000000000000..772f65a175ff
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb=
append
@@ -0,0 +1,7 @@
+# Machine specific TFAs
+
+MACHINE_TFA_REQUIRE ?=3D ""
+
+MACHINE_TFA_REQUIRE_a5ds =3D "trusted-firmware-a-a5ds.inc"
+
+require ${MACHINE_TFA_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0001-armv7-add-mmio=
-timer.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0001-armv7-add-mm=
io-timer.patch
new file mode 100644
index 000000000000..2a25726923a2
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0001-armv7-add-mmio-timer.=
patch
@@ -0,0 +1,105 @@
+From 8525c72c438b0aa66f1f38db37bd7aacf7e3ce34 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Wed, 18 Dec 2019 21:52:34 +0000
+Subject: [PATCH 1/2] armv7: add mmio timer
+
+This timer can be used by u-boot when arch-timer is not available in
+core, for example, Cortex-A5.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ arch/arm/cpu/armv7/Makefile     |  1 +
+ arch/arm/cpu/armv7/mmio_timer.c | 56 +++++++++++++++++++++++++++++++++
+ scripts/config_whitelist.txt    |  1 +
+ 3 files changed, 58 insertions(+)
+ create mode 100644 arch/arm/cpu/armv7/mmio_timer.c
+
+diff --git a/arch/arm/cpu/armv7/Makefile b/arch/arm/cpu/armv7/Makefile
+index 8c955d0d5284..82af9c031277 100644
+--- a/arch/arm/cpu/armv7/Makefile
++++ b/arch/arm/cpu/armv7/Makefile
+@@ -28,6 +28,7 @@ obj-$(CONFIG_ARMV7_PSCI)     +=3D psci.o psci-common.o
+ obj-$(CONFIG_IPROC) +=3D iproc-common/
+ obj-$(CONFIG_KONA) +=3D kona-common/
+ obj-$(CONFIG_SYS_ARCH_TIMER) +=3D arch_timer.o
++obj-$(CONFIG_SYS_MMIO_TIMER) +=3D mmio_timer.o
+
+ ifneq (,$(filter s5pc1xx exynos,$(SOC)))
+ obj-y +=3D s5p-common/
+diff --git a/arch/arm/cpu/armv7/mmio_timer.c b/arch/arm/cpu/armv7/mmio_tim=
er.c
+new file mode 100644
+index 000000000000..1b905db8bb19
+--- /dev/null
++++ b/arch/arm/cpu/armv7/mmio_timer.c
+@@ -0,0 +1,56 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * Copyright (c) 2019, Arm Limited. All rights reserved.
++ *
++ */
++
++#include <common.h>
++#include <asm/io.h>
++#include <div64.h>
++#include <bootstage.h>
++
++DECLARE_GLOBAL_DATA_PTR;
++
++#define CNTCTLBASE    0x1a020000UL
++#define CNTREADBASE   0x1a030000UL
++
++static inline uint32_t mmio_read32(uintptr_t addr)
++{
++      return *(volatile uint32_t*)addr;
++}
++
++int timer_init(void)
++{
++      gd->arch.timer_rate_hz =3D mmio_read32(CNTCTLBASE);
++
++      return 0;
++}
++
++unsigned long long get_ticks(void)
++{
++      return ((mmio_read32(CNTCTLBASE + 0x4) << 32) |
++              mmio_read32(CNTREADBASE));
++}
++
++ulong get_timer(ulong base)
++{
++      return lldiv(get_ticks(), gd->arch.timer_rate_hz) - base;
++}
++
++void __udelay(unsigned long usec)
++{
++      unsigned long endtime;
++
++      endtime =3D lldiv((unsigned long long)usec * gd->arch.timer_rate_hz=
,
++                      1000UL);
++
++      endtime +=3D get_ticks();
++
++      while (get_ticks() < endtime)
++              ;
++}
++
++ulong get_tbclk(void)
++{
++      return gd->arch.timer_rate_hz;
++}
+diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
+index cf1808e051c8..8624714ae7a6 100644
+--- a/scripts/config_whitelist.txt
++++ b/scripts/config_whitelist.txt
+@@ -3138,6 +3138,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
+ CONFIG_SYS_MMC_U_BOOT_OFFS
+ CONFIG_SYS_MMC_U_BOOT_SIZE
+ CONFIG_SYS_MMC_U_BOOT_START
++CONFIG_SYS_MMIO_TIMER
+ CONFIG_SYS_MONITOR_
+ CONFIG_SYS_MONITOR_BASE
+ CONFIG_SYS_MONITOR_BASE_EARLY
+--
+2.25.0
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0002-board-arm-add-=
designstart-cortex-a5-board.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/a=
5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
new file mode 100644
index 000000000000..6efd8c092c6a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0002-board-arm-add-designs=
tart-cortex-a5-board.patch
@@ -0,0 +1,309 @@
+From 2417d0991f73ee2c83946fcac208a7d6894f4530 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Wed, 8 Jan 2020 09:48:11 +0000
+Subject: [PATCH 2/2] board: arm: add designstart cortex-a5 board
+
+Arm added a new board, designstart, with a cortex-a5 chip, add the
+default configuration, initialization and makefile for this system.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ arch/arm/Kconfig                       |   7 ++
+ board/armltd/designstart/Kconfig       |  12 +++
+ board/armltd/designstart/Makefile      |   8 ++
+ board/armltd/designstart/designstart.c |  49 ++++++++++
+ configs/designstart_ca5_defconfig      |  37 ++++++++
+ include/configs/designstart_ca5.h      | 122 +++++++++++++++++++++++++
+ 6 files changed, 235 insertions(+)
+ create mode 100644 board/armltd/designstart/Kconfig
+ create mode 100644 board/armltd/designstart/Makefile
+ create mode 100644 board/armltd/designstart/designstart.c
+ create mode 100644 configs/designstart_ca5_defconfig
+ create mode 100644 include/configs/designstart_ca5.h
+
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index f9dab073ea14..2cc9413114de 100644
+--- a/arch/arm/Kconfig
++++ b/arch/arm/Kconfig
+@@ -628,6 +628,12 @@ config ARCH_BCM6858
+       select OF_CONTROL
+       imply CMD_DM
+
++config TARGET_DESIGNSTART_CA5
++      bool "Support Designstart Cortex-A5"
++      select CPU_V7A
++      select SEMIHOSTING
++      select PL01X_SERIAL
++
+ config TARGET_VEXPRESS_CA15_TC2
+       bool "Support vexpress_ca15_tc2"
+       select CPU_V7A
+@@ -1782,6 +1788,7 @@ source "board/Marvell/gplugd/Kconfig"
+ source "board/armadeus/apf27/Kconfig"
+ source "board/armltd/vexpress/Kconfig"
+ source "board/armltd/vexpress64/Kconfig"
++source "board/armltd/designstart/Kconfig"
+ source "board/broadcom/bcm23550_w1d/Kconfig"
+ source "board/broadcom/bcm28155_ap/Kconfig"
+ source "board/broadcom/bcm963158/Kconfig"
+diff --git a/board/armltd/designstart/Kconfig b/board/armltd/designstart/K=
config
+new file mode 100644
+index 000000000000..6446fe3f4492
+--- /dev/null
++++ b/board/armltd/designstart/Kconfig
+@@ -0,0 +1,12 @@
++if TARGET_DESIGNSTART_CA5
++
++config SYS_BOARD
++      default "designstart"
++
++config SYS_VENDOR
++      default "armltd"
++
++config SYS_CONFIG_NAME
++      default "designstart_ca5"
++
++endif
+diff --git a/board/armltd/designstart/Makefile b/board/armltd/designstart/=
Makefile
+new file mode 100644
+index 000000000000..b64c905c7021
+--- /dev/null
++++ b/board/armltd/designstart/Makefile
+@@ -0,0 +1,8 @@
++# SPDX-License-Identifier: GPL-2.0+
++#
++# (C) Copyright 2020 ARM Limited
++# (C) Copyright 2020 Linaro
++# Rui Miguel Silva <rui.silva@linaro.org>
++#
++
++obj-y :=3D designstart.o
+diff --git a/board/armltd/designstart/designstart.c b/board/armltd/designs=
tart/designstart.c
+new file mode 100644
+index 000000000000..b0400f110ce2
+--- /dev/null
++++ b/board/armltd/designstart/designstart.c
+@@ -0,0 +1,49 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * (C) Copyright 2020 ARM Limited
++ * (C) Copyright 2020 Linaro
++ * Rui Miguel Silva <rui.silva@linaro.org>
++ */
++
++#include <common.h>
++#include <dm.h>
++#include <dm/platform_data/serial_pl01x.h>
++#include <malloc.h>
++
++DECLARE_GLOBAL_DATA_PTR;
++
++static const struct pl01x_serial_platdata serial_platdata =3D {
++      .base =3D V2M_UART0,
++      .type =3D TYPE_PL011,
++      .clock =3D CONFIG_PL011_CLOCK,
++};
++
++U_BOOT_DEVICE(designstart_serials) =3D {
++      .name =3D "serial_pl01x",
++      .platdata =3D &serial_platdata,
++};
++
++int board_init(void)
++{
++      return 0;
++}
++
++int dram_init(void)
++{
++      gd->ram_size =3D PHYS_SDRAM_1_SIZE;
++
++      return 0;
++}
++
++int dram_init_banksize(void)
++{
++      gd->bd->bi_dram[0].start =3D PHYS_SDRAM_1;
++      gd->bd->bi_dram[0].size =3D PHYS_SDRAM_1_SIZE;
++
++      return 0;
++}
++
++void reset_cpu(ulong addr)
++{
++}
++
+diff --git a/configs/designstart_ca5_defconfig b/configs/designstart_ca5_d=
efconfig
+new file mode 100644
+index 000000000000..a2a756740295
+--- /dev/null
++++ b/configs/designstart_ca5_defconfig
+@@ -0,0 +1,37 @@
++CONFIG_ARM=3Dy
++CONFIG_TARGET_DESIGNSTART_CA5=3Dy
++CONFIG_SYS_TEXT_BASE=3D0x88000000
++CONFIG_SYS_MALLOC_F_LEN=3D0x2000
++CONFIG_NR_DRAM_BANKS=3D1
++CONFIG_IDENT_STRING=3D" ca5ds aarch32"
++CONFIG_BOOTDELAY=3D1
++CONFIG_USE_BOOTARGS=3Dy
++CONFIG_BOOTARGS=3D"console=3DttyAMA0 earlycon=3Dpl011,0x1a200000 root=3D/=
dev/ram0 rw loglevel=3D9"
++# CONFIG_DISPLAY_CPUINFO is not set
++# CONFIG_DISPLAY_BOARDINFO is not set
++CONFIG_HUSH_PARSER=3Dy
++CONFIG_SYS_PROMPT=3D"ca5ds32# "
++CONFIG_CMD_BOOTZ=3Dy
++# CONFIG_CMD_CONSOLE is not set
++# CONFIG_CMD_IMLS is not set
++# CONFIG_CMD_XIMG is not set
++# CONFIG_CMD_EDITENV is not set
++# CONFIG_CMD_ENV_EXISTS is not set
++CONFIG_CMD_MEMTEST=3Dy
++CONFIG_MTD_NOR_FLASH=3Dy
++# CONFIG_CMD_LOADS is not set
++CONFIG_CMD_ARMFLASH=3Dy
++# CONFIG_CMD_FPGA is not set
++# CONFIG_CMD_ITEST is not set
++# CONFIG_CMD_SETEXPR is not set
++CONFIG_CMD_DHCP=3Dy
++# CONFIG_CMD_NFS is not set
++CONFIG_CMD_MII=3Dy
++CONFIG_CMD_PING=3Dy
++CONFIG_CMD_CACHE=3Dy
++# CONFIG_CMD_MISC is not set
++CONFIG_CMD_FAT=3Dy
++CONFIG_DM=3Dy
++CONFIG_DM_SERIAL=3Dy
++CONFIG_OF_LIBFDT=3Dy
++
+diff --git a/include/configs/designstart_ca5.h b/include/configs/designsta=
rt_ca5.h
+new file mode 100644
+index 000000000000..79c4b36060d2
+--- /dev/null
++++ b/include/configs/designstart_ca5.h
+@@ -0,0 +1,122 @@
++/* SPDX-License-Identifier: GPL-2.0+ */
++/*
++ * (C) Copyright 2020 ARM Limited
++ * (C) Copyright 2020 Linaro
++ * Rui Miguel Silva <rui.silva@linaro.org>
++ *
++ * Configuration for Cortex-A5 Designstart. Parts were derived from other=
 ARM
++ * configurations.
++ */
++
++#ifndef __DESISGNSTART_CA5_H
++#define __DESISGNSTART_CA5_H
++
++#define CONFIG_SYS_INIT_SP_ADDR               (CONFIG_SYS_SDRAM_BASE + 0x=
03f00000)
++#define CONFIG_SKIP_LOWLEVEL_INIT
++
++/* Generic Timer Definitions */
++#define CONFIG_SYS_HZ_CLOCK   7500000
++#define CONFIG_SYS_HZ         1000
++#define COUNTER_FREQUENCY     CONFIG_SYS_HZ_CLOCK
++
++#ifdef CONFIG_DESIGNSTART_MEMORY_MAP_EXTENDED
++#define V2M_SRAM0             0x00010000
++#define V2M_SRAM1             0x02200000
++#define V2M_QSPI              0x0A800000
++#else
++#define V2M_SRAM0             0x00000000
++#define V2M_SRAM1             0x02000000
++#define V2M_QSPI              0x08000000
++#endif
++
++#define V2M_DEBUG             0x10000000
++#define V2M_BASE_PERIPH               0x1A000000
++#define V2M_A5_PERIPH         0x1C000000
++#define V2M_L2CC_PERIPH               0x1C010000
++
++#define V2M_MASTER_EXPANSION0 0x40000000
++#define V2M_MASTER_EXPANSION1 0x60000000
++
++#define V2M_BASE              0x80000000
++
++#define V2M_PERIPH_OFFSET(x)  (x << 16)
++
++#define V2M_SYSID             (V2M_BASE_PERIPH)
++#define V2M_SYCTL             (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(1))
++#define V2M_COUNTER_CTL               (V2M_BASE_PERIPH + V2M_PERIPH_OFFSE=
T(2))
++#define V2M_COUNTER_READ      (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(3))
++#define V2M_TIMER_CTL         (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(4))
++#define V2M_TIMER0            (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(5))
++
++#define V2M_WATCHDOG_CTL      (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(16))
++#define V2M_WATCHDOG_REFRESH  (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(17))
++
++#define V2M_UART0             (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(32))
++#define V2M_UART1             (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(33))
++
++#define V2M_RTC                       (V2M_BASE_PERIPH + V2M_PERIPH_OFFSE=
T(34))
++#define V2M_TRNG              (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(35))
++
++/* PL011 Serial Configuration */
++#define CONFIG_CONS_INDEX     0
++#define CONFIG_PL011_CLOCK    7500000
++
++/* Physical Memory Map */
++#define PHYS_SDRAM_1          (V2M_BASE)
++
++/* Top 16MB reserved for secure world use */
++#define DRAM_SEC_SIZE         0x01000000
++#define PHYS_SDRAM_1_SIZE     0x80000000 - DRAM_SEC_SIZE
++
++/* Size of malloc() pool */
++#define CONFIG_SYS_MALLOC_LEN (CONFIG_ENV_SIZE + (8 << 20))
++
++/* Miscellaneous configurable options */
++#define CONFIG_SYS_LOAD_ADDR  (V2M_BASE + 0x10000000)
++
++#define CONFIG_SYS_SDRAM_BASE PHYS_SDRAM_1
++
++#define CONFIG_SYS_MMIO_TIMER
++
++/* Enable memtest */
++#define CONFIG_SYS_MEMTEST_START      PHYS_SDRAM_1
++#define CONFIG_SYS_MEMTEST_END                (PHYS_SDRAM_1 + PHYS_SDRAM_=
1_SIZE)
++
++#define CONFIG_EXTRA_ENV_SETTINGS     \
++                              "kernel_name=3DImage\0"           \
++                              "kernel_addr=3D0x80F00000\0"      \
++                              "initrd_name=3Dramdisk.img\0"     \
++                              "initrd_addr=3D0x84000000\0"      \
++                              "fdt_name=3Ddevtree.dtb\0"        \
++                              "fdt_addr=3D0x83000000\0"         \
++                              "fdt_high=3D0xffffffff\0"         \
++                              "initrd_high=3D0xffffffff\0"
++
++#define CONFIG_BOOTCOMMAND    "echo copy to RAM...; " \
++                              "cp.b 0x80100000 $kernel_addr 0xB00000; " \
++                              "cp.b 0x80D00000 $initrd_addr 0x800000; " \
++                              "bootz $kernel_addr $initrd_addr $fdt_addr"
++
++/* Monitor Command Prompt */
++#define CONFIG_SYS_CBSIZE             512     /* Console I/O Buffer Size =
*/
++#define CONFIG_SYS_MAXARGS            64      /* max command args */
++
++#define CONFIG_SYS_FLASH_BASE         0x80000000
++/* 256 x 256KiB sectors */
++#define CONFIG_SYS_MAX_FLASH_SECT     256
++/* Store environment at top of flash */
++#define CONFIG_ENV_ADDR                       0x0A7C0000
++#define CONFIG_ENV_SECT_SIZE          0x00040000
++
++#define CONFIG_SYS_FLASH_CFI          1
++#define CONFIG_FLASH_CFI_DRIVER               1
++#define CONFIG_SYS_FLASH_CFI_WIDTH    FLASH_CFI_32BIT
++#define CONFIG_SYS_MAX_FLASH_BANKS    1
++
++#define CONFIG_SYS_FLASH_USE_BUFFER_WRITE /* use buffered writes */
++#define CONFIG_SYS_FLASH_PROTECTION   /* The devices have real protection=
 */
++#define CONFIG_SYS_FLASH_EMPTY_INFO   /* flinfo indicates empty blocks */
++#define FLASH_MAX_SECTOR_SIZE         0x00040000
++#define CONFIG_ENV_SIZE                       CONFIG_ENV_SECT_SIZE
++#define CONFIG_ENV_IS_IN_FLASH                1
++#endif
+--
+2.25.0
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-b=
sp/recipes-bsp/u-boot/u-boot_%.bbappend
new file mode 100644
index 000000000000..20133a4de85d
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -0,0 +1,8 @@
+# Machine specific u-boot
+
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files/${MACHINE}:"
+
+SRC_URI_append_a5ds =3D " file://0001-armv7-add-mmio-timer.patch \
+                    file://0002-board-arm-add-designstart-cortex-a5-board.=
patch"
+
+
--
2.25.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
