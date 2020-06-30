Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.45])
 by mx.groups.io with SMTP id smtpd.web10.1947.1593537072777649901
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Jun 2020 10:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ZSAQdCDU;
 spf=pass (domain: arm.com, ip: 40.107.22.45, mailfrom: teo.coupriediaz@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+d1IcvHfgnMFggZ05wXhEovNoa0+snX+svYG5HqqWQ=;
 b=ZSAQdCDUTsfT84iBNTFVvASOYpODrP1aajAzX9XOCjlSX/Xx94B3MkYpUB/EBDZy5Z1a4T3mjA8/HfUZPd115gQWX858tdY4b1VdSKmN+mlmBWRRLkobz62lhhOFP19KOOnjcpzkp3F7vsdpAK5H3tTIj7Ne5oNhw61pOwGHwpI=
Received: from MR2P264CA0136.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:30::28)
 by AM5PR0802MB2403.eurprd08.prod.outlook.com (2603:10a6:203:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Tue, 30 Jun
 2020 17:11:08 +0000
Received: from VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:30::4) by MR2P264CA0136.outlook.office365.com
 (2603:10a6:500:30::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23 via Frontend
 Transport; Tue, 30 Jun 2020 17:11:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT028.mail.protection.outlook.com (10.152.18.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Tue, 30 Jun 2020 17:11:07 +0000
Received: ("Tessian outbound aa49e94c93f4:v61"); Tue, 30 Jun 2020 17:11:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e796c85165e85f36
X-CR-MTA-TID: 64aa7808
Received: from 6f40aeaae460.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2E83791F-FB84-4DDD-B796-C1DF4939BE62.1;
	Tue, 30 Jun 2020 17:11:02 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6f40aeaae460.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 30 Jun 2020 17:11:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdeH5COs4OsBdbe+uX5fHJ2l+XHVJbUW3JdLJmoiBdLrZ7p9/R7rjwDE9u5u5J3aYabB7OyBPKTu+z3Mxakzkmi/BwbtmjAfOfGuruXg+ZvYjcuee5L4UMPSxO1rjj7DFW2lh/AaYvUjQCbDC2clotdehheUbdgyL9gyVtVgLhQwPHWmsidqZEWZ0icwpNTcwmV+8BNusyJbnlyYpoIDIOuUCAGZxAPhoTifTXtqlsRdN0ioq4q6GmW7a+T2EFtf7USKYM+Od7gXTrdsHaDz/MLJllGAHhglL9aggbE5Se1/dF0tXj8rS/fkAsOuxtqzJtjSIGzUAgazfWtTZq9SWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+d1IcvHfgnMFggZ05wXhEovNoa0+snX+svYG5HqqWQ=;
 b=B0W5p9pV011exBLyljU1QZnTcFHI+ky1Jl9Pf+Dwx/9HAq31nCstwO9fBR8m90sA1BxaOw74AXTUrlYiUq7yVv8AJiwC5u2DBMDs6t+vnFNMeKXqWCROeIElwOPPRaMoQrMe10hAx+0WXYUkgARrQfJkQ2iVj1rcEHHUEX/9xJnum8tpdsN1EjHaehBR6OSQmgNrnu9PbHx1Ly9F/+MBWRI+abvLhKqrCYCm3c4cYvxU2xwRs4Seh/4DJYsyGFO5xZPwEJvZ8UWq3sxEqGtS9fLOExQP05lQUqlvewSZwImkdK9W2pdqcmzcxw2Q/d6tCzMiqCCpB8PfQr0gjIYx6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+d1IcvHfgnMFggZ05wXhEovNoa0+snX+svYG5HqqWQ=;
 b=ZSAQdCDUTsfT84iBNTFVvASOYpODrP1aajAzX9XOCjlSX/Xx94B3MkYpUB/EBDZy5Z1a4T3mjA8/HfUZPd115gQWX858tdY4b1VdSKmN+mlmBWRRLkobz62lhhOFP19KOOnjcpzkp3F7vsdpAK5H3tTIj7Ne5oNhw61pOwGHwpI=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3208.eurprd08.prod.outlook.com (2603:10a6:209:4b::10)
 by AM6PR08MB3733.eurprd08.prod.outlook.com (2603:10a6:20b:89::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Tue, 30 Jun
 2020 17:10:58 +0000
Received: from AM6PR08MB3208.eurprd08.prod.outlook.com
 ([fe80::a4fd:b8df:a939:965e]) by AM6PR08MB3208.eurprd08.prod.outlook.com
 ([fe80::a4fd:b8df:a939:965e%4]) with mapi id 15.20.3131.028; Tue, 30 Jun 2020
 17:10:58 +0000
Subject: Re: [meta-arm] [PATCH RESEND 2/2] arm-bsp : Introduce TC0 platform and BSP
To: jdmason@kudzu.us, Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org
References: <20200629154124.9825-2-teo.coupriediaz@arm.com>
 <15141.1593504832077339029@lists.yoctoproject.org>
 <20200630152629.GA11599@kudzu.us>
From: "Teo Couprie Diaz" <teo.coupriediaz@arm.com>
Message-ID: <e7c8a230-5066-c4d2-87a3-d04877c25a3a@arm.com>
Date: Tue, 30 Jun 2020 18:10:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200630152629.GA11599@kudzu.us>
X-ClientProxiedBy: LO3P265CA0006.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::11) To AM6PR08MB3208.eurprd08.prod.outlook.com
 (2603:10a6:209:4b::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.57.58.28] (217.140.99.251) by LO3P265CA0006.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:bb::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Tue, 30 Jun 2020 17:10:57 +0000
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: db1baefd-4e62-4fc9-2d0d-08d81d189463
X-MS-TrafficTypeDiagnostic: AM6PR08MB3733:|AM5PR0802MB2403:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM5PR0802MB2403D5895A0197B32A60D67CFA6F0@AM5PR0802MB2403.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:350;OLM:350;
X-Forefront-PRVS: 0450A714CB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 SPBk0ExdeWBEcadErpzeSFnrxQC+fYYculUaI++u1v5wcs35HE6CbpDbYWFGOtRfA4j0xe9d+0D7E4aW7TJixSnVCa0Pz+qUzydsW6DQUpywRPvopF/zeGgfkRP5qdCLZIc8RhnXGTAJucQXxl6ip8ZR1Ol8j69Y7GO1F2McrxAyJ24fa0v3Qb38ttxgDF4IX1mpNI2nMjr+ul+Dr6ebXY41hr2E9IPLR6oGlAFQ/hr3jc3fGdl80rroAj8n4mCt8LWMMZ23HslDHDMh1Wn0hgWoD87tBlb5fiHpV8GdibiorCopnzFlia/eEOSWMwmwLHpRjJmyCHDk9Jv/lZZUTHacZMixsr1ja+wyadByk0LJjDV7j0oVa7/7JYkxviiQ9fPSrdJHUdSi8eiyzS7oU3OF6G8QSk8PRd7/84Fp90/kjSOV3kpG0Wljq+yLJIJYpiA83dDY9nZafcP3DtwCrQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3208.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(956004)(6636002)(2906002)(16526019)(26005)(186003)(2616005)(6486002)(66556008)(45080400002)(66946007)(8936002)(966005)(478600001)(66476007)(31686004)(8676002)(66574015)(31696002)(86362001)(52116002)(37006003)(16576012)(166002)(30864003)(83380400001)(316002)(33964004)(4326008)(36756003)(5660300002)(53546011)(6862004)(43740500002)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 N+F+dSaSa94nW3eung10M27jXYZA6BJJpmldHOaxbDNIuSZFiJ6G70mf/i7bqSqX4CHnc90larGTRRfzj/Qx0WgfVyY+7Sq+oBZs4l8iEZoEqVKaFy3/bBxjeIUKBDBG1qiiHXZyS2T4ooRGywSq4rIhBdiEUGXEy3tgSi6Of2Yeq7LbjT444RGGB1u8zucEN6tuz96rhMpeFtn42GKRt8XdpMtB0hq0Ebx/1tKus9ZKAeMfN83pSPSygqk84slQ4Kyt3H1uPIA/l+rthWF7l0kCd7+s+n6U+Whmy853HOGVL/1fYj0v3OOeA317J57CGpvp4xXeHEjW3apTwMGSlxJirZaNFQwU6o3GNyaaMIR8xXDb+T+2KoUxJBi7yM1Gq1sUMCH7bbNR/ivHzktwMkbWiFzL2/IfcIQYnJzRrHK+vfTPfjtQAbQAamOjy9X/WHt3wBQ+Br+i3KMsmAGIWcrKCvn8Hl1tjpvQweI+Xts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3733
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Teo.CouprieDiaz@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(46966005)(5660300002)(966005)(6486002)(33964004)(30864003)(53546011)(4326008)(31696002)(36756003)(2616005)(86362001)(956004)(6862004)(186003)(26005)(336012)(16526019)(31686004)(316002)(81166007)(8936002)(8676002)(478600001)(45080400002)(70206006)(70586007)(16576012)(36906005)(37006003)(6636002)(166002)(82310400002)(2906002)(83380400001)(356005)(47076004)(66574015)(82740400003)(43740500002)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	43a2e75b-b6da-448a-a3a0-08d81d188e39
X-Forefront-PRVS: 0450A714CB
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NjCv6JhnPrUbkRiObXIXLE+6uOTku9vPeS19E+3ZIy9vr8DLY22vx1bYWa4swmI7/BSZ3J56QuThW+N06dxPcDVoMpgheggS8Bn9quWsb9fOuQ7xvhvODTb2MeAqu3s99cx4G3UB9bv5M/Al1WRYJyl/CTRQh5K5LfsCwzi9VhWpMP88fKxSihVt6DDYDG1APZPSrC+pg8YgPPysdtr/K/ryJDolnFZKduwg5Zo3TI/0DLYLfqvXhAx2uAwIbUvFxUyahQoLEA/J23mBIYB4+vY+LY9njSIY3c4kOvXvdSD+gTABUES7D7Tg0kdvoPA4ujWVY8zkw4h9k3WqikisZsMa6gyD/pUPJvZoUZmI8JUrFrkIqrQ1e5sdXs6W7k/elNvyWimQbxVDX0VGxZXMaMzX8jz7L386EYsDuvoSFohOFMkFNnQXkvNavKoXj6m0g+A08efjRRMC7IWB2IC5GVahtmdG7sj4AY9E3wF2jk+X5RQNd7zTcbRErq21RLrK
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2020 17:11:07.7364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db1baefd-4e62-4fc9-2d0d-08d81d189463
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2403
Content-Type: multipart/alternative;
 boundary="------------5B10D931E9B7B3A8E7E50DBA"
Content-Language: en-US

--------------5B10D931E9B7B3A8E7E50DBA
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 6/30/20 4:26 PM, Jon Mason via lists.yoctoproject.org wrote:

On Tue, Jun 30, 2020 at 01:13:52AM -0700, Diego Sueiro wrote:


On Mon, Jun 29, 2020 at 04:41 PM, Teo Couprie Diaz wrote:




This patch introduces the Total Compute platform.
It adds support for the TC0 platform to the Android Common Kernel and
allows building all binaries needed to run Android on TC0.
It adds patches specific to TC0 for TF-A, SCP and U-Boot.

Change-Id: Ia83b79571c7381967c7449db031e3177b1990546
Signed-off-by: Teo Couprie Diaz <teo.coupriediaz@arm.com><mailto:teo.coupr=
iediaz@arm.com>
Signed-off-by: Usama Arif <usama.arif@arm.com><mailto:usama.arif@arm.com>



Reviewed-by: Diego Sueiro <diego.sueiro@arm.com><mailto:diego.sueiro@arm.c=
om>



Series applied to master.

NOTE: there is corruption to the patch files in this series.  It
appears to be a problem with the SMTP servers from Arm.  Behind the
scenes work is being done to resolve it.

Thanks,
Jon

Thanks for applying the patches. Could the series be pulled into dunfell ?

Thanks,
Teo







---
 meta-arm-bsp/conf/machine/tc0.conf            |  27 +
 .../scp-firmware/scp-firmware-tc0.inc         |  13 +
 .../scp-firmware/scp-firmware_git.bbappend    |   1 +
 .../trusted-firmware-a-tc0.inc                |  23 +
 .../trusted-firmware-a_2.3.bbappend           |   6 +
 .../tc0/tc0-config-and-android-boot.patch     | 160 ++++
 .../recipes-bsp/u-boot/u-boot-tc0.inc         |   6 +
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   4 +
 .../recipes-kernel/linux/files/tc0/defconfig  | 906 ++++++++++++++++++
 ...m-Add-component-aware-simple-encoder.patch | 368 +++++++
 ...-red-and-blue-colors-in-HDLCD-driver.patch |  43 +
 .../linux/linux-arm64-ack-tc0.inc             |  15 +
 .../linux/linux-arm64-ack_4.19.bbappend       |   6 +
 13 files changed, 1578 insertions(+)
 create mode 100644 meta-arm-bsp/conf/machine/tc0.conf
 create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0=
.inc
 create mode 100644
meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc
 create mode 100644
meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappen=
d
 create mode 100644
meta-arm-bsp/recipes-bsp/u-boot/files/tc0/tc0-config-and-android-boot.patc=
h
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc0.inc
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/tc0/defconfig
 create mode 100644
meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0001-drm-Add-co=
mponent-aware-simple-encoder.patch
 create mode 100644
meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0002-swap-red-a=
nd-blue-colors-in-HDLCD-driver.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-tc0.=
inc
 create mode 100644
meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend

diff --git a/meta-arm-bsp/conf/machine/tc0.conf
b/meta-arm-bsp/conf/machine/tc0.conf
new file mode 100644
index 0000000..9b4f1ae
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/tc0.conf
@@ -0,0 +1,27 @@
+# Configuration for TC0
+
+#@TYPE: Machine
+#@NAME: TC0
+#@DESCRIPTION: Machine configuration for TC0
+
+TUNE_FEATURES =3D "aarch64"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Das U-boot
+UBOOT_MACHINE ?=3D "total_compute_defconfig"
+
+# Trusted firmware A v2.3
+PREFERRED_PROVIDER_virtual/trusted-firmware-a ?=3D "trusted-firmware-a"
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.3%"
+
+EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a"
+
+PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-arm64-ack"
+
+# Cannot use the default zImage on arm64
+KERNEL_IMAGETYPE =3D "Image"
+KERNEL_BOOTCMD =3D "booti"
+IMAGE_FSTYPES +=3D "cpio.gz.u-boot"
+
+SERIAL_CONSOLES =3D "115200;ttyAMA0"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
new file mode 100644
index 0000000..5b29305
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
@@ -0,0 +1,13 @@
+# TC0 specicif SCP configuration
+
+# Intermediate SHA with 2.6 baseline version
+SRCREV_scp    =3D "ba1db5fb0ee4a520836722f7a694177d461ab716"
+# 5.2.0 tag commit
+SRCREV_cmsis  =3D "80cc44bba16cb4c8f495b7aa9709d41ac50e9529"
+
+COMPATIBLE_MACHINE =3D "tc0"
+
+SCP_PLATFORM =3D "tc0"
+FW_TARGETS =3D "scp"
+
+PV =3D "2.6+git${SRCPV}"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_git.bbappe=
nd
b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_git.bbappend
index 53bd022..33ae7fe 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_git.bbappend
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_git.bbappend
@@ -3,5 +3,6 @@
 MACHINE_SCP_REQUIRE ?=3D ""

 MACHINE_SCP_REQUIRE_n1sdp =3D "scp-firmware-n1sdp.inc"
+MACHINE_SCP_REQUIRE_tc0 =3D "scp-firmware-tc0.inc"

 require ${MACHINE_SCP_REQUIRE}
diff --git
a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc
b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc
new file mode 100644
index 0000000..555fb1d
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.i=
nc
@@ -0,0 +1,23 @@
+# TCO specific TFA configuration
+
+# Intermediate SHA with 2.3 baseline version
+SRCREV_tfa =3D "2fe7d18b0d99fdf4c4dbf84863bb2036dfebc537"
+# mbedtls-2.16.4 tag commit
+SRCREV_mbedtls =3D "39e2c0eeb6501980764793e8d54c49c0a42bde48"
+
+SRC_URI_append =3D " ${SRC_URI_MBEDTLS}"
+
+DEPENDS +=3D "scp-firmware"
+
+COMPATIBLE_MACHINE =3D "tc0"
+
+TFA_PLATFORM =3D "tc0"
+TFA_BUILD_TARGET =3D "all fip"
+TFA_UBOOT =3D "1"
+TFA_INSTALL_TARGET =3D "bl1 fip"
+TFA_MBEDTLS =3D "1"
+TFA_DEBUG =3D "1"
+
+EXTRA_OEMAKE +=3D "SCP_BL2=3D${RECIPE_SYSROOT}/firmware/scp_ramfw.bin"
+EXTRA_OEMAKE +=3D "MBEDTLS_DIR=3Dmbedtls TRUSTED_BOARD_BOOT=3D1 GENERATE_=
COT=3D1
ARM_ROTPK_LOCATION=3Ddevel_rsa \
+
ROT_KEY=3Dplat/arm/board/common/rotpk/arm_rotprivk_rsa.pem"
diff --git
a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbapp=
end
b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbapp=
end
new file mode 100644
index 0000000..b642708
--- /dev/null
+++
b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbapp=
end
@@ -0,0 +1,6 @@
+# Machine specific TFAs
+
+MACHINE_TFA_REQUIRE ?=3D ""
+MACHINE_TFA_REQUIRE_tc0 =3D "trusted-firmware-a-tc0.inc"
+
+require ${MACHINE_TFA_REQUIRE}
diff --git
a/meta-arm-bsp/recipes-bsp/u-boot/files/tc0/tc0-config-and-android-boot.pa=
tch
b/meta-arm-bsp/recipes-bsp/u-boot/files/tc0/tc0-config-and-android-boot.pa=
tch
new file mode 100644
index 0000000..a66898e
--- /dev/null
+++
b/meta-arm-bsp/recipes-bsp/u-boot/files/tc0/tc0-config-and-android-boot.pa=
tch
@@ -0,0 +1,160 @@
+From 0867e715d3563b0bc0ee7e04f9ec6b615de626b2 Mon Sep 17 00:00:00 2001
+From: Usama Arif <usama.arif@arm.com><mailto:usama.arif@arm.com>
+Date: Thu, 04 Jun 2020 14:16:02 +0100
+Subject: [PATCH] Introduce Total Compute platform
+
+This is based off vexpress64 platform. It includes support for
+NOR flash and has bootargs setup for android boot.
+
+Change-Id: I965c81001a1c4a1a6788106f0ba2ca577dee4096
+Signed-off-by: Usama Arif <usama.arif@arm.com><mailto:usama.arif@arm.com>
+Upstream-Status: Pending
+Signed-off-by: Teo Couprie Diaz <teo.coupriediaz@arm.com><mailto:teo.coup=
riediaz@arm.com>
+---
+
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index 21df1c4..c208a40 100644
+--- a/arch/arm/Kconfig
++++ b/arch/arm/Kconfig
+@@ -1174,6 +1174,14 @@
+       select USB
+       select DM_USB
+
++config TARGET_TOTAL_COMPUTE
++      bool "Support Total Compute Platform"
++      select ARM64
++      select PL01X_SERIAL
++      select DM
++      select DM_SERIAL
++      select DM_ETH
++
+ config TARGET_LS2080A_EMU
+       bool "Support ls2080a_emu"
+       select ARCH_LS2080A
+diff --git a/board/armltd/vexpress64/Kconfig
b/board/armltd/vexpress64/Kconfig
+index 1d13f54..d59769f 100644
+--- a/board/armltd/vexpress64/Kconfig
++++ b/board/armltd/vexpress64/Kconfig
+@@ -1,4 +1,4 @@
+-if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO
++if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO ||
TARGET_TOTAL_COMPUTE
+
+ config SYS_BOARD
+       default "vexpress64"
+diff --git a/configs/total_compute_defconfig
b/configs/total_compute_defconfig
+new file mode 100644
+index 0000000..1faeb36
+--- /dev/null
++++ b/configs/total_compute_defconfig
+@@ -0,0 +1,40 @@
++CONFIG_ARM=3Dy
++CONFIG_TARGET_TOTAL_COMPUTE=3Dy
++CONFIG_SYS_TEXT_BASE=3D0xe0000000
++CONFIG_SYS_MALLOC_F_LEN=3D0x2000
++CONFIG_ENV_SIZE=3D0x10000
++CONFIG_NR_DRAM_BANKS=3D2
++CONFIG_DISTRO_DEFAULTS=3Dy
++CONFIG_BOOTDELAY=3D1
++CONFIG_USE_BOOTARGS=3Dy
++CONFIG_BOOTARGS=3D"console=3DttyAMA0 debug user_debug=3D31
earlycon=3Dpl011,0x7ff80000 loglevel=3D9 androidboot.hardware=3Dtotal_comp=
ute
video=3D640x480-32@60 root=3D/dev/vda2 ip=3Ddhcp androidboot.selinux=3Dper=
missive"
++# CONFIG_USE_BOOTCOMMAND is not set
++# CONFIG_DISPLAY_CPUINFO is not set
++# CONFIG_DISPLAY_BOARDINFO is not set
++CONFIG_SYS_PROMPT=3D"TOTAL_COMPUTE# "
++# CONFIG_CMD_CONSOLE is not set
++# CONFIG_CMD_XIMG is not set
++# CONFIG_CMD_EDITENV is not set
++CONFIG_CMD_MEMTEST=3Dy
++CONFIG_SYS_MEMTEST_START=3D0x80000000
++CONFIG_SYS_MEMTEST_END=3D0xff000000
++CONFIG_CMD_ARMFLASH=3Dy
++# CONFIG_CMD_LOADS is not set
++# CONFIG_CMD_ITEST is not set
++# CONFIG_CMD_SETEXPR is not set
++# CONFIG_CMD_NFS is not set
++CONFIG_CMD_CACHE=3Dy
++# CONFIG_CMD_MISC is not set
++CONFIG_CMD_UBI=3Dy
++# CONFIG_ISO_PARTITION is not set
++# CONFIG_EFI_PARTITION is not set
++# CONFIG_MMC is not set
++CONFIG_MTD=3Dy
++CONFIG_MTD_NOR_FLASH=3Dy
++CONFIG_FLASH_CFI_DRIVER=3Dy
++CONFIG_SYS_FLASH_USE_BUFFER_WRITE=3Dy
++CONFIG_SYS_FLASH_PROTECTION=3Dy
++CONFIG_SYS_FLASH_CFI=3Dy
++CONFIG_SMC911X=3Dy
++CONFIG_SMC911X_32_BIT=3Dy
++CONFIG_OF_LIBFDT=3Dy
+diff --git a/include/configs/vexpress_aemv8a.h
b/include/configs/vexpress_aemv8a.h
+index 09cdd3d..e39699e 100644
+--- a/include/configs/vexpress_aemv8a.h
++++ b/include/configs/vexpress_aemv8a.h
+@@ -13,7 +13,7 @@
+ #ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
+ /* ATF loads u-boot here for BASE_FVP model */
+ #define CONFIG_SYS_INIT_SP_ADDR         (CONFIG_SYS_SDRAM_BASE + 0x03f00=
000)
+-#elif CONFIG_TARGET_VEXPRESS64_JUNO
++#elif defined(CONFIG_TARGET_VEXPRESS64_JUNO) ||
defined(CONFIG_TARGET_TOTAL_COMPUTE)
+ #define CONFIG_SYS_INIT_SP_ADDR         (CONFIG_SYS_SDRAM_BASE + 0x7fff0=
)
+ #endif
+
+@@ -40,7 +40,7 @@
+ #define V2M_KMI0                      (V2M_PA_CS3 + V2M_PERIPH_OFFSET(6)=
)
+ #define V2M_KMI1                      (V2M_PA_CS3 + V2M_PERIPH_OFFSET(7)=
)
+
+-#ifdef CONFIG_TARGET_VEXPRESS64_JUNO
++#if defined(CONFIG_TARGET_VEXPRESS64_JUNO) ||
defined(CONFIG_TARGET_TOTAL_COMPUTE)
+ #define V2M_UART0                     0x7ff80000
+ #define V2M_UART1                     0x7ff70000
+ #else /* Not Juno */
+@@ -79,7 +79,7 @@
+ #ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
+ #define GICD_BASE                     (0x2f000000)
+ #define GICC_BASE                     (0x2c000000)
+-#elif CONFIG_TARGET_VEXPRESS64_JUNO
++#elif defined(CONFIG_TARGET_VEXPRESS64_JUNO) ||
defined(CONFIG_TARGET_TOTAL_COMPUTE)
+ #define GICD_BASE                     (0x2C010000)
+ #define GICC_BASE                     (0x2C02f000)
+ #endif
+@@ -88,14 +88,19 @@
+ /* Size of malloc() pool */
+ #define CONFIG_SYS_MALLOC_LEN         (CONFIG_ENV_SIZE + (8 << 20))
+
++#ifdef CONFIG_TARGET_TOTAL_COMPUTE
++#define CONFIG_SMC911X_BASE           0x18000000
++#else
++
+ #ifndef CONFIG_TARGET_VEXPRESS64_JUNO
+ /* The Vexpress64 simulators use SMSC91C111 */
+ #define CONFIG_SMC91111                       1
+ #define CONFIG_SMC91111_BASE          (0x01A000000)
+ #endif
+
++#endif
+ /* PL011 Serial Configuration */
+-#ifdef CONFIG_TARGET_VEXPRESS64_JUNO
++#if defined(CONFIG_TARGET_VEXPRESS64_JUNO) ||
defined(CONFIG_TARGET_TOTAL_COMPUTE)
+ #define CONFIG_PL011_CLOCK            7372800
+ #else
+ #define CONFIG_PL011_CLOCK            24000000
+@@ -189,8 +194,17 @@
+                               "fi"
+
+
+-#endif
++#elif CONFIG_TARGET_TOTAL_COMPUTE
++#define CONFIG_EXTRA_ENV_SETTINGS     \
++                              "kernel_addr_r=3D0x80080000\0"    \
++                              "initrd_addr_r=3D0x88000000\0"    \
++                              "fdt_addr_r=3D0x83000000\0"       \
++                              "fdt_high=3D0xffffffffffffffff\0" \
++                              "initrd_high=3D0xffffffffffffffff\0"
+
++#define CONFIG_BOOTCOMMAND    "booti ${kernel_addr_r} ${initrd_addr_r}
${fdt_addr_r}"
++
++#endif
+ /* Monitor Command Prompt */
+ #define CONFIG_SYS_CBSIZE             512     /* Console I/O Buffer Size=
 */
+ #define CONFIG_SYS_MAXARGS            64      /* max command args */
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc0.inc
b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc0.inc
new file mode 100644
index 0000000..6c2ed5f
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc0.inc
@@ -0,0 +1,6 @@
+# TC0 specific Das U-Boot configuration and patch
+
+SRC_URI_append =3D ' file://tc0-config-and-android-boot.patch'
+
+# v2020.07-rc3 tag commit
+SRCREV =3D "8c48bb21bd6a1778d1f299de30ff62c07929702b"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 20133a4..0df13a4 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -5,4 +5,8 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files/${MACHINE}:=
"
 SRC_URI_append_a5ds =3D " file://0001-armv7-add-mmio-timer.patch \

file://0002-board-arm-add-designstart-cortex-a5-board.patch"<file://0001-a=
rmv7-add-mmio-timer.patch\file://0002-board-arm-add-designstart-cortex-a5-b=
oard.patch>

+MACHINE_UBOOT_REQUIRE ?=3D ""

+MACHINE_UBOOT_REQUIRE_tc0 =3D "u-boot-tc0.inc"
+
+require ${MACHINE_UBOOT_REQUIRE}
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/tc0/defconfig
b/meta-arm-bsp/recipes-kernel/linux/files/tc0/defconfig
new file mode 100644
index 0000000..f981b3f
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/tc0/defconfig
@@ -0,0 +1,906 @@
+CONFIG_POSIX_MQUEUE=3Dy
+CONFIG_AUDIT=3Dy
+CONFIG_NO_HZ=3Dy
+CONFIG_HIGH_RES_TIMERS=3Dy
+CONFIG_PREEMPT=3Dy
+CONFIG_IRQ_TIME_ACCOUNTING=3Dy
+CONFIG_BSD_PROCESS_ACCT=3Dy
+CONFIG_BSD_PROCESS_ACCT_V3=3Dy
+CONFIG_TASKSTATS=3Dy
+CONFIG_TASK_DELAY_ACCT=3Dy
+CONFIG_TASK_XACCT=3Dy
+CONFIG_TASK_IO_ACCOUNTING=3Dy
+CONFIG_PSI=3Dy
+CONFIG_IKCONFIG=3Dy
+CONFIG_IKCONFIG_PROC=3Dy
+CONFIG_NUMA_BALANCING=3Dy
+CONFIG_MEMCG=3Dy
+CONFIG_MEMCG_SWAP=3Dy
+CONFIG_BLK_CGROUP=3Dy
+CONFIG_RT_GROUP_SCHED=3Dy
+CONFIG_CGROUP_PIDS=3Dy
+CONFIG_CGROUP_FREEZER=3Dy
+CONFIG_CGROUP_HUGETLB=3Dy
+CONFIG_CPUSETS=3Dy
+CONFIG_CGROUP_DEVICE=3Dy
+CONFIG_CGROUP_CPUACCT=3Dy
+CONFIG_CGROUP_PERF=3Dy
+CONFIG_CGROUP_BPF=3Dy
+CONFIG_SCHED_AUTOGROUP=3Dy
+CONFIG_SCHED_TUNE=3Dy
+CONFIG_BLK_DEV_INITRD=3Dy
+# CONFIG_FHANDLE is not set
+CONFIG_KALLSYMS_ALL=3Dy
+CONFIG_BPF_SYSCALL=3Dy
+CONFIG_BPF_JIT_ALWAYS_ON=3Dy
+CONFIG_EMBEDDED=3Dy
+# CONFIG_COMPAT_BRK is not set
+CONFIG_PROFILING=3Dy
+CONFIG_ARCH_SUNXI=3Dy
+CONFIG_ARCH_ALPINE=3Dy
+CONFIG_ARCH_BCM2835=3Dy
+CONFIG_ARCH_BCM_IPROC=3Dy
+CONFIG_ARCH_BERLIN=3Dy
+CONFIG_ARCH_BRCMSTB=3Dy
+CONFIG_ARCH_EXYNOS=3Dy
+CONFIG_ARCH_K3=3Dy
+CONFIG_ARCH_LAYERSCAPE=3Dy
+CONFIG_ARCH_LG1K=3Dy
+CONFIG_ARCH_HISI=3Dy
+CONFIG_ARCH_MEDIATEK=3Dy
+CONFIG_ARCH_MESON=3Dy
+CONFIG_ARCH_MVEBU=3Dy
+CONFIG_ARCH_QCOM=3Dy
+CONFIG_ARCH_ROCKCHIP=3Dy
+CONFIG_ARCH_SEATTLE=3Dy
+CONFIG_ARCH_SYNQUACER=3Dy
+CONFIG_ARCH_RENESAS=3Dy
+CONFIG_ARCH_R8A7795=3Dy
+CONFIG_ARCH_R8A7796=3Dy
+CONFIG_ARCH_R8A77965=3Dy
+CONFIG_ARCH_R8A77970=3Dy
+CONFIG_ARCH_R8A77980=3Dy
+CONFIG_ARCH_R8A77990=3Dy
+CONFIG_ARCH_R8A77995=3Dy
+CONFIG_ARCH_STRATIX10=3Dy
+CONFIG_ARCH_TEGRA=3Dy
+CONFIG_ARCH_SPRD=3Dy
+CONFIG_ARCH_THUNDER=3Dy
+CONFIG_ARCH_THUNDER2=3Dy
+CONFIG_ARCH_UNIPHIER=3Dy
+CONFIG_ARCH_VEXPRESS=3Dy
+CONFIG_ARCH_XGENE=3Dy
+CONFIG_ARCH_ZX=3Dy
+CONFIG_ARCH_ZYNQMP=3Dy
+CONFIG_PCI=3Dy
+CONFIG_PCI_IOV=3Dy
+CONFIG_HOTPLUG_PCI=3Dy
+CONFIG_HOTPLUG_PCI_ACPI=3Dy
+CONFIG_PCI_AARDVARK=3Dy
+CONFIG_PCI_TEGRA=3Dy
+CONFIG_PCIE_RCAR=3Dy
+CONFIG_PCI_HOST_GENERIC=3Dy
+CONFIG_PCI_XGENE=3Dy
+CONFIG_PCI_HOST_THUNDER_PEM=3Dy
+CONFIG_PCI_HOST_THUNDER_ECAM=3Dy
+CONFIG_PCIE_ROCKCHIP_HOST=3Dm
+CONFIG_PCI_LAYERSCAPE=3Dy
+CONFIG_PCI_HISI=3Dy
+CONFIG_PCIE_QCOM=3Dy
+CONFIG_PCIE_ARMADA_8K=3Dy
+CONFIG_PCIE_KIRIN=3Dy
+CONFIG_PCIE_HISI_STB=3Dy
+CONFIG_ARM64_VA_BITS_48=3Dy
+CONFIG_SCHED_MC=3Dy
+CONFIG_NUMA=3Dy
+CONFIG_SECCOMP=3Dy
+CONFIG_KEXEC=3Dy
+CONFIG_CRASH_DUMP=3Dy
+CONFIG_XEN=3Dy
+CONFIG_ARM64_SW_TTBR0_PAN=3Dy
+CONFIG_RANDOMIZE_BASE=3Dy
+CONFIG_COMPAT=3Dy
+CONFIG_HIBERNATION=3Dy
+CONFIG_PM_DEBUG=3Dy
+CONFIG_WQ_POWER_EFFICIENT_DEFAULT=3Dy
+CONFIG_ENERGY_MODEL=3Dy
+CONFIG_ARM_CPUIDLE=3Dy
+CONFIG_CPU_FREQ=3Dy
+CONFIG_CPU_FREQ_STAT=3Dy
+CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL=3Dy
+CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
+CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
+CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
+CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
+CONFIG_CPUFREQ_DT=3Dy
+CONFIG_ACPI_CPPC_CPUFREQ=3Dm
+CONFIG_ARM_ARMADA_37XX_CPUFREQ=3Dy
+CONFIG_ARM_BIG_LITTLE_CPUFREQ=3Dy
+CONFIG_ARM_SCPI_CPUFREQ=3Dy
+CONFIG_ARM_TEGRA186_CPUFREQ=3Dy
+CONFIG_ARM_SCPI_PROTOCOL=3Dy
+CONFIG_RASPBERRYPI_FIRMWARE=3Dy
+CONFIG_EFI_CAPSULE_LOADER=3Dy
+CONFIG_ACPI=3Dy
+CONFIG_ACPI_APEI=3Dy
+CONFIG_ACPI_APEI_GHES=3Dy
+CONFIG_ACPI_APEI_MEMORY_FAILURE=3Dy
+CONFIG_ACPI_APEI_EINJ=3Dy
+CONFIG_VIRTUALIZATION=3Dy
+CONFIG_KVM=3Dy
+CONFIG_ARM64_CRYPTO=3Dy
+CONFIG_CRYPTO_SHA1_ARM64_CE=3Dy
+CONFIG_CRYPTO_SHA2_ARM64_CE=3Dy
+CONFIG_CRYPTO_SHA512_ARM64_CE=3Dm
+CONFIG_CRYPTO_SHA3_ARM64=3Dm
+CONFIG_CRYPTO_SM3_ARM64_CE=3Dm
+CONFIG_CRYPTO_GHASH_ARM64_CE=3Dy
+CONFIG_CRYPTO_CRCT10DIF_ARM64_CE=3Dm
+CONFIG_CRYPTO_CRC32_ARM64_CE=3Dm
+CONFIG_CRYPTO_AES_ARM64_CE_CCM=3Dy
+CONFIG_CRYPTO_AES_ARM64_CE_BLK=3Dy
+CONFIG_CRYPTO_CHACHA20_NEON=3Dm
+CONFIG_CRYPTO_AES_ARM64_BS=3Dm
+CONFIG_KPROBES=3Dy
+CONFIG_JUMP_LABEL=3Dy
+CONFIG_MODULES=3Dy
+CONFIG_MODULE_UNLOAD=3Dy
+CONFIG_MODVERSIONS=3Dy
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_MEMORY_FAILURE=3Dy
+CONFIG_TRANSPARENT_HUGEPAGE=3Dy
+CONFIG_CMA=3Dy
+CONFIG_NET=3Dy
+CONFIG_PACKET=3Dy
+CONFIG_UNIX=3Dy
+CONFIG_XFRM_USER=3Dy
+CONFIG_XFRM_INTERFACE=3Dy
+CONFIG_XFRM_STATISTICS=3Dy
+CONFIG_NET_KEY=3Dy
+CONFIG_INET=3Dy
+CONFIG_IP_MULTICAST=3Dy
+CONFIG_IP_ADVANCED_ROUTER=3Dy
+CONFIG_IP_MULTIPLE_TABLES=3Dy
+CONFIG_IP_PNP=3Dy
+CONFIG_IP_PNP_DHCP=3Dy
+CONFIG_IP_PNP_BOOTP=3Dy
+CONFIG_NET_IPGRE_DEMUX=3Dy
+CONFIG_NET_IPVTI=3Dy
+CONFIG_INET_ESP=3Dy
+CONFIG_INET_UDP_DIAG=3Dy
+CONFIG_INET_DIAG_DESTROY=3Dy
+CONFIG_IPV6_ROUTER_PREF=3Dy
+CONFIG_IPV6_ROUTE_INFO=3Dy
+CONFIG_IPV6_OPTIMISTIC_DAD=3Dy
+CONFIG_INET6_ESP=3Dy
+CONFIG_INET6_IPCOMP=3Dy
+CONFIG_IPV6_MIP6=3Dy
+CONFIG_IPV6_VTI=3Dy
+CONFIG_IPV6_MULTIPLE_TABLES=3Dy
+CONFIG_NETFILTER=3Dy
+CONFIG_NF_CONNTRACK=3Dy
+CONFIG_NF_CONNTRACK_SECMARK=3Dy
+CONFIG_NF_CONNTRACK_EVENTS=3Dy
+CONFIG_NF_CONNTRACK_AMANDA=3Dy
+CONFIG_NF_CONNTRACK_FTP=3Dy
+CONFIG_NF_CONNTRACK_H323=3Dy
+CONFIG_NF_CONNTRACK_IRC=3Dy
+CONFIG_NF_CONNTRACK_NETBIOS_NS=3Dy
+CONFIG_NF_CONNTRACK_PPTP=3Dy
+CONFIG_NF_CONNTRACK_SANE=3Dy
+CONFIG_NF_CONNTRACK_TFTP=3Dy
+CONFIG_NF_CT_NETLINK=3Dy
+CONFIG_NETFILTER_XT_TARGET_CHECKSUM=3Dm
+CONFIG_NETFILTER_XT_TARGET_CLASSIFY=3Dy
+CONFIG_NETFILTER_XT_TARGET_CONNMARK=3Dy
+CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=3Dy
+CONFIG_NETFILTER_XT_TARGET_CT=3Dy
+CONFIG_NETFILTER_XT_TARGET_IDLETIMER=3Dy
+CONFIG_NETFILTER_XT_TARGET_LOG=3Dm
+CONFIG_NETFILTER_XT_TARGET_MARK=3Dy
+CONFIG_NETFILTER_XT_TARGET_NFLOG=3Dy
+CONFIG_NETFILTER_XT_TARGET_NFQUEUE=3Dy
+CONFIG_NETFILTER_XT_TARGET_TPROXY=3Dy
+CONFIG_NETFILTER_XT_TARGET_TRACE=3Dy
+CONFIG_NETFILTER_XT_TARGET_SECMARK=3Dy
+CONFIG_NETFILTER_XT_TARGET_TCPMSS=3Dy
+CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=3Dm
+CONFIG_NETFILTER_XT_MATCH_BPF=3Dy
+CONFIG_NETFILTER_XT_MATCH_COMMENT=3Dy
+CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=3Dy
+CONFIG_NETFILTER_XT_MATCH_CONNMARK=3Dy
+CONFIG_NETFILTER_XT_MATCH_CONNTRACK=3Dy
+CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=3Dy
+CONFIG_NETFILTER_XT_MATCH_HELPER=3Dy
+CONFIG_NETFILTER_XT_MATCH_IPRANGE=3Dy
+CONFIG_NETFILTER_XT_MATCH_LENGTH=3Dy
+CONFIG_NETFILTER_XT_MATCH_LIMIT=3Dy
+CONFIG_NETFILTER_XT_MATCH_MAC=3Dy
+CONFIG_NETFILTER_XT_MATCH_MARK=3Dy
+CONFIG_NETFILTER_XT_MATCH_OWNER=3Dy
+CONFIG_NETFILTER_XT_MATCH_POLICY=3Dy
+CONFIG_NETFILTER_XT_MATCH_PKTTYPE=3Dy
+CONFIG_NETFILTER_XT_MATCH_QUOTA=3Dy
+CONFIG_NETFILTER_XT_MATCH_QUOTA2=3Dy
+CONFIG_NETFILTER_XT_MATCH_SOCKET=3Dy
+CONFIG_NETFILTER_XT_MATCH_STATE=3Dy
+CONFIG_NETFILTER_XT_MATCH_STATISTIC=3Dy
+CONFIG_NETFILTER_XT_MATCH_STRING=3Dy
+CONFIG_NETFILTER_XT_MATCH_TIME=3Dy
+CONFIG_NETFILTER_XT_MATCH_U32=3Dy
+CONFIG_IP_NF_IPTABLES=3Dy
+CONFIG_IP_NF_MATCH_ECN=3Dy
+CONFIG_IP_NF_MATCH_TTL=3Dy
+CONFIG_IP_NF_FILTER=3Dy
+CONFIG_IP_NF_TARGET_REJECT=3Dy
+CONFIG_IP_NF_NAT=3Dy
+CONFIG_IP_NF_TARGET_MASQUERADE=3Dy
+CONFIG_IP_NF_TARGET_NETMAP=3Dy
+CONFIG_IP_NF_TARGET_REDIRECT=3Dy
+CONFIG_IP_NF_MANGLE=3Dy
+CONFIG_IP_NF_RAW=3Dy
+CONFIG_IP_NF_SECURITY=3Dy
+CONFIG_IP_NF_ARPTABLES=3Dy
+CONFIG_IP_NF_ARPFILTER=3Dy
+CONFIG_IP_NF_ARP_MANGLE=3Dy
+CONFIG_IP6_NF_IPTABLES=3Dy
+CONFIG_IP6_NF_MATCH_RPFILTER=3Dy
+CONFIG_IP6_NF_FILTER=3Dy
+CONFIG_IP6_NF_TARGET_REJECT=3Dy
+CONFIG_IP6_NF_MANGLE=3Dy
+CONFIG_IP6_NF_RAW=3Dy
+CONFIG_L2TP=3Dy
+CONFIG_BRIDGE=3Dm
+CONFIG_BRIDGE_VLAN_FILTERING=3Dy
+CONFIG_VLAN_8021Q=3Dm
+CONFIG_VLAN_8021Q_GVRP=3Dy
+CONFIG_VLAN_8021Q_MVRP=3Dy
+CONFIG_NET_SCHED=3Dy
+CONFIG_NET_SCH_HTB=3Dy
+CONFIG_NET_SCH_NETEM=3Dy
+CONFIG_NET_SCH_INGRESS=3Dy
+CONFIG_NET_CLS_U32=3Dy
+CONFIG_NET_CLS_BPF=3Dy
+CONFIG_NET_EMATCH=3Dy
+CONFIG_NET_EMATCH_U32=3Dy
+CONFIG_NET_CLS_ACT=3Dy
+CONFIG_BPF_JIT=3Dy
+CONFIG_BT=3Dm
+CONFIG_BT_HIDP=3Dm
+# CONFIG_BT_HS is not set
+# CONFIG_BT_LE is not set
+CONFIG_BT_LEDS=3Dy
+# CONFIG_BT_DEBUGFS is not set
+CONFIG_BT_HCIBTUSB=3Dm
+CONFIG_BT_HCIUART=3Dm
+CONFIG_BT_HCIUART_LL=3Dy
+CONFIG_BT_HCIUART_BCM=3Dy
+CONFIG_CFG80211=3Dm
+CONFIG_MAC80211=3Dm
+CONFIG_MAC80211_LEDS=3Dy
+CONFIG_RFKILL=3Dm
+CONFIG_NET_9P=3Dy
+CONFIG_NET_9P_VIRTIO=3Dy
+CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
+CONFIG_DEVTMPFS=3Dy
+CONFIG_DEVTMPFS_MOUNT=3Dy
+CONFIG_DMA_CMA=3Dy
+CONFIG_CMA_SIZE_MBYTES=3D32
+CONFIG_HISILICON_LPC=3Dy
+CONFIG_SIMPLE_PM_BUS=3Dy
+CONFIG_MTD=3Dy
+CONFIG_MTD_BLOCK=3Dy
+CONFIG_MTD_M25P80=3Dy
+CONFIG_MTD_NAND=3Dy
+CONFIG_MTD_NAND_DENALI_DT=3Dy
+CONFIG_MTD_NAND_MARVELL=3Dy
+CONFIG_MTD_NAND_QCOM=3Dy
+CONFIG_MTD_SPI_NOR=3Dy
+CONFIG_BLK_DEV_LOOP=3Dy
+CONFIG_BLK_DEV_NBD=3Dm
+CONFIG_BLK_DEV_RAM=3Dy
+CONFIG_BLK_DEV_RAM_SIZE=3D8192
+CONFIG_VIRTIO_BLK=3Dy
+CONFIG_BLK_DEV_NVME=3Dm
+CONFIG_SRAM=3Dy
+CONFIG_UID_SYS_STATS=3Dy
+CONFIG_EEPROM_AT25=3Dm
+# CONFIG_SCSI_PROC_FS is not set
+CONFIG_BLK_DEV_SD=3Dy
+CONFIG_SCSI_SAS_ATA=3Dy
+CONFIG_SCSI_HISI_SAS=3Dy
+CONFIG_SCSI_HISI_SAS_PCI=3Dy
+CONFIG_SCSI_UFSHCD=3Dm
+CONFIG_SCSI_UFSHCD_PLATFORM=3Dm
+CONFIG_SCSI_UFS_QCOM=3Dm
+CONFIG_SCSI_UFS_HISI=3Dm
+CONFIG_ATA=3Dy
+CONFIG_SATA_AHCI=3Dy
+CONFIG_SATA_AHCI_PLATFORM=3Dy
+CONFIG_AHCI_CEVA=3Dy
+CONFIG_AHCI_MVEBU=3Dy
+CONFIG_AHCI_XGENE=3Dy
+CONFIG_AHCI_QORIQ=3Dy
+CONFIG_SATA_SIL24=3Dy
+CONFIG_SATA_RCAR=3Dy
+CONFIG_PATA_PLATFORM=3Dy
+CONFIG_PATA_OF_PLATFORM=3Dy
+CONFIG_MD=3Dy
+CONFIG_BLK_DEV_DM=3Dy
+CONFIG_DM_CRYPT=3Dy
+CONFIG_DM_SNAPSHOT=3Dy
+CONFIG_DM_UEVENT=3Dy
+CONFIG_DM_VERITY=3Dy
+CONFIG_DM_VERITY_FEC=3Dy
+CONFIG_DM_BOW=3Dy
+CONFIG_NETDEVICES=3Dy
+CONFIG_MACVLAN=3Dm
+CONFIG_MACVTAP=3Dm
+CONFIG_TUN=3Dy
+CONFIG_VETH=3Dm
+CONFIG_VIRTIO_NET=3Dy
+CONFIG_AMD_XGBE=3Dy
+CONFIG_NET_XGENE=3Dy
+CONFIG_ATL1C=3Dm
+CONFIG_MACB=3Dy
+CONFIG_THUNDER_NIC_PF=3Dy
+CONFIG_HIX5HD2_GMAC=3Dy
+CONFIG_HNS_DSAF=3Dy
+CONFIG_HNS_ENET=3Dy
+CONFIG_E1000E=3Dy
+CONFIG_IGB=3Dy
+CONFIG_IGBVF=3Dy
+CONFIG_MVNETA=3Dy
+CONFIG_MVPP2=3Dy
+CONFIG_SKY2=3Dy
+CONFIG_QCOM_EMAC=3Dm
+CONFIG_RAVB=3Dy
+CONFIG_SMC91X=3Dy
+CONFIG_SMSC911X=3Dy
+CONFIG_SNI_AVE=3Dy
+CONFIG_SNI_NETSEC=3Dy
+CONFIG_STMMAC_ETH=3Dm
+CONFIG_MDIO_BUS_MUX_MMIOREG=3Dy
+CONFIG_AT803X_PHY=3Dm
+CONFIG_MARVELL_PHY=3Dm
+CONFIG_MARVELL_10G_PHY=3Dm
+CONFIG_MESON_GXL_PHY=3Dm
+CONFIG_MICREL_PHY=3Dy
+CONFIG_REALTEK_PHY=3Dm
+CONFIG_ROCKCHIP_PHY=3Dy
+CONFIG_PPP=3Dy
+CONFIG_PPP_BSDCOMP=3Dy
+CONFIG_PPP_DEFLATE=3Dy
+CONFIG_PPP_MPPE=3Dy
+CONFIG_PPTP=3Dy
+CONFIG_PPPOL2TP=3Dy
+CONFIG_USB_PEGASUS=3Dm
+CONFIG_USB_RTL8150=3Dm
+CONFIG_USB_RTL8152=3Dy
+CONFIG_USB_LAN78XX=3Dm
+CONFIG_USB_USBNET=3Dy
+CONFIG_USB_NET_DM9601=3Dm
+CONFIG_USB_NET_SR9800=3Dm
+CONFIG_USB_NET_SMSC75XX=3Dm
+CONFIG_USB_NET_SMSC95XX=3Dm
+CONFIG_USB_NET_PLUSB=3Dm
+CONFIG_USB_NET_MCS7830=3Dm
+CONFIG_ATH10K=3Dm
+CONFIG_ATH10K_PCI=3Dm
+CONFIG_BRCMFMAC=3Dm
+CONFIG_MWIFIEX=3Dm
+CONFIG_MWIFIEX_PCIE=3Dm
+CONFIG_WL18XX=3Dm
+CONFIG_WLCORE_SDIO=3Dm
+CONFIG_INPUT_EVDEV=3Dy
+CONFIG_KEYBOARD_ADC=3Dm
+CONFIG_KEYBOARD_GPIO=3Dy
+CONFIG_KEYBOARD_CROS_EC=3Dy
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_INPUT_JOYSTICK=3Dy
+CONFIG_JOYSTICK_XPAD=3Dy
+CONFIG_JOYSTICK_XPAD_FF=3Dy
+CONFIG_JOYSTICK_XPAD_LEDS=3Dy
+CONFIG_INPUT_TABLET=3Dy
+CONFIG_TABLET_USB_ACECAD=3Dy
+CONFIG_TABLET_USB_AIPTEK=3Dy
+CONFIG_TABLET_USB_GTCO=3Dy
+CONFIG_TABLET_USB_HANWANG=3Dy
+CONFIG_TABLET_USB_KBTAB=3Dy
+CONFIG_INPUT_TOUCHSCREEN=3Dy
+CONFIG_TOUCHSCREEN_ATMEL_MXT=3Dm
+CONFIG_INPUT_MISC=3Dy
+CONFIG_INPUT_PM8941_PWRKEY=3Dy
+CONFIG_INPUT_UINPUT=3Dy
+CONFIG_INPUT_HISI_POWERKEY=3Dy
+# CONFIG_SERIO_SERPORT is not set
+CONFIG_SERIO_AMBAKMI=3Dy
+# CONFIG_VT is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_DEVMEM is not set
+CONFIG_SERIAL_8250=3Dy
+CONFIG_SERIAL_8250_CONSOLE=3Dy
+CONFIG_SERIAL_8250_EXTENDED=3Dy
+CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
+CONFIG_SERIAL_8250_BCM2835AUX=3Dy
+CONFIG_SERIAL_8250_DW=3Dy
+CONFIG_SERIAL_8250_MT6577=3Dy
+CONFIG_SERIAL_8250_UNIPHIER=3Dy
+CONFIG_SERIAL_OF_PLATFORM=3Dy
+CONFIG_SERIAL_AMBA_PL011=3Dy
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=3Dy
+CONFIG_SERIAL_MESON=3Dy
+CONFIG_SERIAL_MESON_CONSOLE=3Dy
+CONFIG_SERIAL_SAMSUNG=3Dy
+CONFIG_SERIAL_SAMSUNG_CONSOLE=3Dy
+CONFIG_SERIAL_TEGRA=3Dy
+CONFIG_SERIAL_SH_SCI=3Dy
+CONFIG_SERIAL_MSM=3Dy
+CONFIG_SERIAL_MSM_CONSOLE=3Dy
+CONFIG_SERIAL_XILINX_PS_UART=3Dy
+CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=3Dy
+CONFIG_SERIAL_MVEBU_UART=3Dy
+CONFIG_SERIAL_DEV_BUS=3Dy
+CONFIG_VIRTIO_CONSOLE=3Dy
+CONFIG_TCG_TPM=3Dy
+CONFIG_TCG_TIS_I2C_INFINEON=3Dy
+CONFIG_I2C_CHARDEV=3Dy
+CONFIG_I2C_MUX_PCA954x=3Dy
+CONFIG_I2C_BCM2835=3Dm
+CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
+CONFIG_I2C_IMX=3Dy
+CONFIG_I2C_MESON=3Dy
+CONFIG_I2C_MV64XXX=3Dy
+CONFIG_I2C_PXA=3Dy
+CONFIG_I2C_QUP=3Dy
+CONFIG_I2C_RK3X=3Dy
+CONFIG_I2C_SH_MOBILE=3Dy
+CONFIG_I2C_TEGRA=3Dy
+CONFIG_I2C_UNIPHIER_F=3Dy
+CONFIG_I2C_VERSATILE=3Dy
+CONFIG_I2C_RCAR=3Dy
+CONFIG_I2C_CROS_EC_TUNNEL=3Dy
+CONFIG_SPI=3Dy
+CONFIG_SPI_ARMADA_3700=3Dy
+CONFIG_SPI_BCM2835=3Dm
+CONFIG_SPI_BCM2835AUX=3Dm
+CONFIG_SPI_MESON_SPICC=3Dm
+CONFIG_SPI_MESON_SPIFC=3Dm
+CONFIG_SPI_ORION=3Dy
+CONFIG_SPI_PL022=3Dy
+CONFIG_SPI_ROCKCHIP=3Dy
+CONFIG_SPI_QUP=3Dy
+CONFIG_SPI_S3C64XX=3Dy
+CONFIG_SPI_SPIDEV=3Dm
+CONFIG_SPMI=3Dy
+CONFIG_PINCTRL_SINGLE=3Dy
+CONFIG_PINCTRL_MAX77620=3Dy
+CONFIG_PINCTRL_IPQ8074=3Dy
+CONFIG_PINCTRL_MSM8916=3Dy
+CONFIG_PINCTRL_MSM8994=3Dy
+CONFIG_PINCTRL_MSM8996=3Dy
+CONFIG_PINCTRL_QDF2XXX=3Dy
+CONFIG_PINCTRL_QCOM_SPMI_PMIC=3Dy
+CONFIG_PINCTRL_MT7622=3Dy
+CONFIG_GPIO_DWAPB=3Dy
+CONFIG_GPIO_MB86S7X=3Dy
+CONFIG_GPIO_PL061=3Dy
+CONFIG_GPIO_RCAR=3Dy
+CONFIG_GPIO_UNIPHIER=3Dy
+CONFIG_GPIO_XGENE=3Dy
+CONFIG_GPIO_XGENE_SB=3Dy
+CONFIG_GPIO_PCA953X=3Dy
+CONFIG_GPIO_PCA953X_IRQ=3Dy
+CONFIG_GPIO_MAX77620=3Dy
+CONFIG_POWER_AVS=3Dy
+CONFIG_ROCKCHIP_IODOMAIN=3Dy
+CONFIG_POWER_RESET_MSM=3Dy
+CONFIG_POWER_RESET_XGENE=3Dy
+CONFIG_POWER_RESET_SYSCON=3Dy
+CONFIG_SYSCON_REBOOT_MODE=3Dy
+CONFIG_BATTERY_SBS=3Dm
+CONFIG_BATTERY_BQ27XXX=3Dy
+CONFIG_SENSORS_ARM_SCPI=3Dy
+CONFIG_SENSORS_LM90=3Dm
+CONFIG_SENSORS_RASPBERRYPI_HWMON=3Dm
+CONFIG_SENSORS_INA2XX=3Dm
+CONFIG_THERMAL_GOV_POWER_ALLOCATOR=3Dy
+CONFIG_CPU_THERMAL=3Dy
+CONFIG_THERMAL_EMULATION=3Dy
+CONFIG_ROCKCHIP_THERMAL=3Dm
+CONFIG_RCAR_GEN3_THERMAL=3Dy
+CONFIG_ARMADA_THERMAL=3Dy
+CONFIG_BRCMSTB_THERMAL=3Dm
+CONFIG_EXYNOS_THERMAL=3Dy
+CONFIG_TEGRA_BPMP_THERMAL=3Dm
+CONFIG_QCOM_TSENS=3Dy
+CONFIG_UNIPHIER_THERMAL=3Dy
+CONFIG_WATCHDOG=3Dy
+CONFIG_ARM_SP805_WATCHDOG=3Dy
+CONFIG_S3C2410_WATCHDOG=3Dy
+CONFIG_MESON_GXBB_WATCHDOG=3Dm
+CONFIG_MESON_WATCHDOG=3Dm
+CONFIG_RENESAS_WDT=3Dy
+CONFIG_UNIPHIER_WATCHDOG=3Dy
+CONFIG_BCM2835_WDT=3Dy
+CONFIG_MFD_BD9571MWV=3Dy
+CONFIG_MFD_AXP20X_RSB=3Dy
+CONFIG_MFD_CROS_EC=3Dy
+CONFIG_MFD_CROS_EC_CHARDEV=3Dm
+CONFIG_MFD_EXYNOS_LPASS=3Dm
+CONFIG_MFD_HI6421_PMIC=3Dy
+CONFIG_MFD_HI655X_PMIC=3Dy
+CONFIG_MFD_MAX77620=3Dy
+CONFIG_MFD_SPMI_PMIC=3Dy
+CONFIG_MFD_RK808=3Dy
+CONFIG_MFD_SEC_CORE=3Dy
+CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
+CONFIG_REGULATOR_AXP20X=3Dy
+CONFIG_REGULATOR_BD9571MWV=3Dy
+CONFIG_REGULATOR_FAN53555=3Dy
+CONFIG_REGULATOR_GPIO=3Dy
+CONFIG_REGULATOR_HI6421V530=3Dy
+CONFIG_REGULATOR_HI655X=3Dy
+CONFIG_REGULATOR_MAX77620=3Dy
+CONFIG_REGULATOR_PWM=3Dy
+CONFIG_REGULATOR_QCOM_SMD_RPM=3Dy
+CONFIG_REGULATOR_QCOM_SPMI=3Dy
+CONFIG_REGULATOR_RK808=3Dy
+CONFIG_REGULATOR_S2MPS11=3Dy
+CONFIG_REGULATOR_VCTRL=3Dm
+CONFIG_RC_CORE=3Dm
+CONFIG_RC_DECODERS=3Dy
+CONFIG_RC_DEVICES=3Dy
+CONFIG_IR_MESON=3Dm
+CONFIG_MEDIA_SUPPORT=3Dy
+CONFIG_MEDIA_CAMERA_SUPPORT=3Dy
+CONFIG_MEDIA_ANALOG_TV_SUPPORT=3Dy
+CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
+CONFIG_MEDIA_CONTROLLER=3Dy
+CONFIG_VIDEO_V4L2_SUBDEV_API=3Dy
+# CONFIG_DVB_NET is not set
+CONFIG_MEDIA_USB_SUPPORT=3Dy
+CONFIG_USB_VIDEO_CLASS=3Dm
+CONFIG_V4L_MEM2MEM_DRIVERS=3Dy
+CONFIG_VIDEO_SAMSUNG_S5P_JPEG=3Dm
+CONFIG_VIDEO_SAMSUNG_S5P_MFC=3Dm
+CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=3Dm
+CONFIG_VIDEO_RENESAS_FCP=3Dm
+CONFIG_VIDEO_RENESAS_VSP1=3Dm
+CONFIG_DRM=3Dy
+CONFIG_DRM_LOAD_EDID_FIRMWARE=3Dy
+CONFIG_DRM_I2C_NXP_TDA998X=3Dy
+CONFIG_DRM_HDLCD=3Dy
+CONFIG_DRM_NOUVEAU=3Dm
+CONFIG_DRM_VIRT_ENCODER=3Dy
+CONFIG_DRM_EXYNOS=3Dm
+CONFIG_DRM_EXYNOS5433_DECON=3Dy
+CONFIG_DRM_EXYNOS7_DECON=3Dy
+CONFIG_DRM_EXYNOS_DSI=3Dy
+# CONFIG_DRM_EXYNOS_DP is not set
+CONFIG_DRM_EXYNOS_HDMI=3Dy
+CONFIG_DRM_EXYNOS_MIC=3Dy
+CONFIG_DRM_ROCKCHIP=3Dm
+CONFIG_ROCKCHIP_ANALOGIX_DP=3Dy
+CONFIG_ROCKCHIP_CDN_DP=3Dy
+CONFIG_ROCKCHIP_DW_HDMI=3Dy
+CONFIG_ROCKCHIP_DW_MIPI_DSI=3Dy
+CONFIG_ROCKCHIP_INNO_HDMI=3Dy
+CONFIG_DRM_RCAR_DU=3Dm
+CONFIG_DRM_RCAR_LVDS=3Dm
+CONFIG_DRM_TEGRA=3Dm
+CONFIG_DRM_PANEL_SIMPLE=3Dm
+CONFIG_DRM_I2C_ADV7511=3Dm
+CONFIG_DRM_VC4=3Dm
+CONFIG_DRM_HISI_HIBMC=3Dm
+CONFIG_DRM_HISI_KIRIN=3Dm
+CONFIG_DRM_MESON=3Dm
+CONFIG_FB_ARMCLCD=3Dy
+CONFIG_BACKLIGHT_GENERIC=3Dm
+CONFIG_BACKLIGHT_PWM=3Dm
+CONFIG_BACKLIGHT_LP855X=3Dm
+CONFIG_LOGO=3Dy
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+CONFIG_SOUND=3Dy
+CONFIG_SND=3Dy
+CONFIG_SND_SOC=3Dy
+CONFIG_SND_BCM2835_SOC_I2S=3Dm
+CONFIG_SND_SOC_ROCKCHIP=3Dm
+CONFIG_SND_SOC_ROCKCHIP_SPDIF=3Dm
+CONFIG_SND_SOC_ROCKCHIP_RT5645=3Dm
+CONFIG_SND_SOC_RK3399_GRU_SOUND=3Dm
+CONFIG_SND_SOC_SAMSUNG=3Dy
+CONFIG_SND_SOC_RCAR=3Dm
+CONFIG_SND_SOC_AK4613=3Dm
+CONFIG_SND_SIMPLE_CARD=3Dm
+CONFIG_SND_AUDIO_GRAPH_CARD=3Dm
+CONFIG_HIDRAW=3Dy
+CONFIG_UHID=3Dy
+CONFIG_HID_A4TECH=3Dy
+CONFIG_HID_ACRUX=3Dy
+CONFIG_HID_ACRUX_FF=3Dy
+CONFIG_HID_APPLE=3Dy
+CONFIG_HID_BELKIN=3Dy
+CONFIG_HID_CHERRY=3Dy
+CONFIG_HID_CHICONY=3Dy
+CONFIG_HID_PRODIKEYS=3Dy
+CONFIG_HID_CYPRESS=3Dy
+CONFIG_HID_DRAGONRISE=3Dy
+CONFIG_DRAGONRISE_FF=3Dy
+CONFIG_HID_EMS_FF=3Dy
+CONFIG_HID_ELECOM=3Dy
+CONFIG_HID_EZKEY=3Dy
+CONFIG_HID_HOLTEK=3Dy
+CONFIG_HID_KEYTOUCH=3Dy
+CONFIG_HID_KYE=3Dy
+CONFIG_HID_UCLOGIC=3Dy
+CONFIG_HID_WALTOP=3Dy
+CONFIG_HID_GYRATION=3Dy
+CONFIG_HID_TWINHAN=3Dy
+CONFIG_HID_KENSINGTON=3Dy
+CONFIG_HID_LCPOWER=3Dy
+CONFIG_HID_LOGITECH=3Dy
+CONFIG_HID_LOGITECH_DJ=3Dy
+CONFIG_LOGITECH_FF=3Dy
+CONFIG_LOGIRUMBLEPAD2_FF=3Dy
+CONFIG_LOGIG940_FF=3Dy
+CONFIG_HID_MAGICMOUSE=3Dy
+CONFIG_HID_MICROSOFT=3Dy
+CONFIG_HID_MONTEREY=3Dy
+CONFIG_HID_MULTITOUCH=3Dy
+CONFIG_HID_NTRIG=3Dy
+CONFIG_HID_ORTEK=3Dy
+CONFIG_HID_PANTHERLORD=3Dy
+CONFIG_PANTHERLORD_FF=3Dy
+CONFIG_HID_PETALYNX=3Dy
+CONFIG_HID_PICOLCD=3Dy
+CONFIG_HID_PRIMAX=3Dy
+CONFIG_HID_ROCCAT=3Dy
+CONFIG_HID_SAITEK=3Dy
+CONFIG_HID_SAMSUNG=3Dy
+CONFIG_HID_SONY=3Dy
+CONFIG_HID_SPEEDLINK=3Dy
+CONFIG_HID_SUNPLUS=3Dy
+CONFIG_HID_GREENASIA=3Dy
+CONFIG_GREENASIA_FF=3Dy
+CONFIG_HID_SMARTJOYPLUS=3Dy
+CONFIG_SMARTJOYPLUS_FF=3Dy
+CONFIG_HID_TIVO=3Dy
+CONFIG_HID_TOPSEED=3Dy
+CONFIG_HID_THRUSTMASTER=3Dy
+CONFIG_HID_WACOM=3Dy
+CONFIG_HID_WIIMOTE=3Dy
+CONFIG_HID_ZEROPLUS=3Dy
+CONFIG_HID_ZYDACRON=3Dy
+CONFIG_USB_HIDDEV=3Dy
+CONFIG_I2C_HID=3Dm
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
+CONFIG_USB_OTG=3Dy
+CONFIG_USB_XHCI_HCD=3Dy
+CONFIG_USB_XHCI_TEGRA=3Dy
+CONFIG_USB_EHCI_HCD=3Dy
+CONFIG_USB_EHCI_EXYNOS=3Dy
+CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
+CONFIG_USB_OHCI_HCD=3Dy
+CONFIG_USB_OHCI_EXYNOS=3Dy
+CONFIG_USB_OHCI_HCD_PLATFORM=3Dy
+CONFIG_USB_RENESAS_USBHS=3Dm
+CONFIG_USB_STORAGE=3Dy
+CONFIG_USB_MUSB_HDRC=3Dy
+CONFIG_USB_MUSB_SUNXI=3Dy
+CONFIG_USB_DWC3=3Dy
+CONFIG_USB_DWC2=3Dy
+CONFIG_USB_CHIPIDEA=3Dy
+CONFIG_USB_CHIPIDEA_UDC=3Dy
+CONFIG_USB_CHIPIDEA_HOST=3Dy
+CONFIG_USB_ISP1760=3Dy
+CONFIG_USB_HSIC_USB3503=3Dy
+CONFIG_NOP_USB_XCEIV=3Dy
+CONFIG_USB_ULPI=3Dy
+CONFIG_USB_GADGET=3Dy
+CONFIG_USB_RENESAS_USBHS_UDC=3Dm
+CONFIG_USB_RENESAS_USB3=3Dm
+CONFIG_USB_CONFIGFS=3Dy
+CONFIG_USB_CONFIGFS_UEVENT=3Dy
+CONFIG_USB_CONFIGFS_F_FS=3Dy
+CONFIG_USB_CONFIGFS_F_ACC=3Dy
+CONFIG_USB_CONFIGFS_F_AUDIO_SRC=3Dy
+CONFIG_USB_CONFIGFS_F_MIDI=3Dy
+CONFIG_MMC=3Dy
+CONFIG_MMC_BLOCK_MINORS=3D32
+CONFIG_MMC_ARMMMCI=3Dy
+CONFIG_MMC_SDHCI=3Dy
+CONFIG_MMC_SDHCI_ACPI=3Dy
+CONFIG_MMC_SDHCI_PLTFM=3Dy
+CONFIG_MMC_SDHCI_OF_ARASAN=3Dy
+CONFIG_MMC_SDHCI_OF_ESDHC=3Dy
+CONFIG_MMC_SDHCI_CADENCE=3Dy
+CONFIG_MMC_SDHCI_TEGRA=3Dy
+CONFIG_MMC_SDHCI_F_SDH30=3Dy
+CONFIG_MMC_MESON_GX=3Dy
+CONFIG_MMC_SDHCI_MSM=3Dy
+CONFIG_MMC_SPI=3Dy
+CONFIG_MMC_SDHI=3Dy
+CONFIG_MMC_DW=3Dy
+CONFIG_MMC_DW_EXYNOS=3Dy
+CONFIG_MMC_DW_HI3798CV200=3Dy
+CONFIG_MMC_DW_K3=3Dy
+CONFIG_MMC_DW_ROCKCHIP=3Dy
+CONFIG_MMC_SUNXI=3Dy
+CONFIG_MMC_BCM2835=3Dy
+CONFIG_MMC_SDHCI_XENON=3Dy
+CONFIG_LEDS_GPIO=3Dy
+CONFIG_LEDS_PWM=3Dy
+CONFIG_LEDS_SYSCON=3Dy
+CONFIG_LEDS_TRIGGER_DISK=3Dy
+CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
+CONFIG_LEDS_TRIGGER_CPU=3Dy
+CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dy
+CONFIG_LEDS_TRIGGER_PANIC=3Dy
+CONFIG_EDAC=3Dy
+CONFIG_EDAC_GHES=3Dy
+CONFIG_RTC_CLASS=3Dy
+CONFIG_RTC_DRV_MAX77686=3Dy
+CONFIG_RTC_DRV_RK808=3Dm
+CONFIG_RTC_DRV_S5M=3Dy
+CONFIG_RTC_DRV_DS3232=3Dy
+CONFIG_RTC_DRV_EFI=3Dy
+CONFIG_RTC_DRV_CROS_EC=3Dy
+CONFIG_RTC_DRV_S3C=3Dy
+CONFIG_RTC_DRV_PL031=3Dy
+CONFIG_RTC_DRV_SUN6I=3Dy
+CONFIG_RTC_DRV_ARMADA38X=3Dy
+CONFIG_RTC_DRV_TEGRA=3Dy
+CONFIG_RTC_DRV_XGENE=3Dy
+CONFIG_DMADEVICES=3Dy
+CONFIG_DMA_BCM2835=3Dm
+CONFIG_K3_DMA=3Dy
+CONFIG_MV_XOR_V2=3Dy
+CONFIG_PL330_DMA=3Dy
+CONFIG_TEGRA20_APB_DMA=3Dy
+CONFIG_QCOM_BAM_DMA=3Dy
+CONFIG_QCOM_HIDMA_MGMT=3Dy
+CONFIG_QCOM_HIDMA=3Dy
+CONFIG_RCAR_DMAC=3Dy
+CONFIG_RENESAS_USB_DMAC=3Dm
+CONFIG_VFIO=3Dy
+CONFIG_VFIO_PCI=3Dy
+CONFIG_VIRTIO_PCI=3Dy
+CONFIG_VIRTIO_BALLOON=3Dy
+CONFIG_VIRTIO_MMIO=3Dy
+CONFIG_XEN_GNTDEV=3Dy
+CONFIG_XEN_GRANT_DEV_ALLOC=3Dy
+CONFIG_STAGING=3Dy
+CONFIG_ASHMEM=3Dy
+CONFIG_ION=3Dy
+CONFIG_CROS_EC_I2C=3Dy
+CONFIG_CROS_EC_SPI=3Dy
+CONFIG_COMMON_CLK_RK808=3Dy
+CONFIG_COMMON_CLK_SCPI=3Dy
+CONFIG_COMMON_CLK_CS2000_CP=3Dy
+CONFIG_COMMON_CLK_S2MPS11=3Dy
+CONFIG_CLK_QORIQ=3Dy
+CONFIG_COMMON_CLK_PWM=3Dy
+CONFIG_COMMON_CLK_QCOM=3Dy
+CONFIG_QCOM_CLK_SMD_RPM=3Dy
+CONFIG_IPQ_GCC_8074=3Dy
+CONFIG_MSM_GCC_8916=3Dy
+CONFIG_MSM_GCC_8994=3Dy
+CONFIG_MSM_MMCC_8996=3Dy
+CONFIG_HWSPINLOCK=3Dy
+CONFIG_HWSPINLOCK_QCOM=3Dy
+CONFIG_ARM_MHU=3Dy
+CONFIG_PLATFORM_MHU=3Dy
+CONFIG_BCM2835_MBOX=3Dy
+CONFIG_QCOM_APCS_IPC=3Dy
+CONFIG_ROCKCHIP_IOMMU=3Dy
+CONFIG_TEGRA_IOMMU_SMMU=3Dy
+CONFIG_ARM_SMMU=3Dy
+CONFIG_ARM_SMMU_V3=3Dy
+CONFIG_QCOM_IOMMU=3Dy
+CONFIG_RPMSG_QCOM_GLINK_RPM=3Dy
+CONFIG_RPMSG_QCOM_SMD=3Dy
+CONFIG_RASPBERRYPI_POWER=3Dy
+CONFIG_QCOM_SMEM=3Dy
+CONFIG_QCOM_SMD_RPM=3Dy
+CONFIG_QCOM_SMP2P=3Dy
+CONFIG_QCOM_SMSM=3Dy
+CONFIG_ROCKCHIP_PM_DOMAINS=3Dy
+CONFIG_ARCH_TEGRA_132_SOC=3Dy
+CONFIG_ARCH_TEGRA_210_SOC=3Dy
+CONFIG_ARCH_TEGRA_186_SOC=3Dy
+CONFIG_ARCH_TEGRA_194_SOC=3Dy
+CONFIG_ARCH_K3_AM6_SOC=3Dy
+CONFIG_SOC_TI=3Dy
+CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dy
+CONFIG_EXTCON_USB_GPIO=3Dy
+CONFIG_EXTCON_USBC_CROS_EC=3Dy
+CONFIG_MEMORY=3Dy
+CONFIG_IIO=3Dy
+CONFIG_EXYNOS_ADC=3Dy
+CONFIG_ROCKCHIP_SARADC=3Dm
+CONFIG_IIO_CROS_EC_SENSORS_CORE=3Dm
+CONFIG_IIO_CROS_EC_SENSORS=3Dm
+CONFIG_IIO_CROS_EC_LIGHT_PROX=3Dm
+CONFIG_IIO_CROS_EC_BARO=3Dm
+CONFIG_PWM=3Dy
+CONFIG_PWM_BCM2835=3Dm
+CONFIG_PWM_CROS_EC=3Dm
+CONFIG_PWM_MESON=3Dm
+CONFIG_PWM_RCAR=3Dm
+CONFIG_PWM_ROCKCHIP=3Dy
+CONFIG_PWM_SAMSUNG=3Dy
+CONFIG_PWM_TEGRA=3Dm
+CONFIG_PHY_XGENE=3Dy
+CONFIG_PHY_SUN4I_USB=3Dy
+CONFIG_PHY_HI6220_USB=3Dy
+CONFIG_PHY_HISTB_COMBPHY=3Dy
+CONFIG_PHY_HISI_INNO_USB2=3Dy
+CONFIG_PHY_MVEBU_CP110_COMPHY=3Dy
+CONFIG_PHY_QCOM_QMP=3Dm
+CONFIG_PHY_QCOM_USB_HS=3Dy
+CONFIG_PHY_RCAR_GEN3_USB2=3Dy
+CONFIG_PHY_RCAR_GEN3_USB3=3Dm
+CONFIG_PHY_ROCKCHIP_EMMC=3Dy
+CONFIG_PHY_ROCKCHIP_INNO_USB2=3Dy
+CONFIG_PHY_ROCKCHIP_PCIE=3Dm
+CONFIG_PHY_ROCKCHIP_TYPEC=3Dy
+CONFIG_PHY_TEGRA_XUSB=3Dy
+CONFIG_HISI_PMU=3Dy
+CONFIG_QCOM_L2_PMU=3Dy
+CONFIG_QCOM_L3_PMU=3Dy
+CONFIG_ANDROID=3Dy
+CONFIG_ANDROID_BINDER_IPC=3Dy
+CONFIG_QCOM_QFPROM=3Dy
+CONFIG_ROCKCHIP_EFUSE=3Dy
+CONFIG_UNIPHIER_EFUSE=3Dy
+CONFIG_MESON_EFUSE=3Dm
+CONFIG_TEE=3Dy
+CONFIG_OPTEE=3Dy
+CONFIG_EXT2_FS=3Dy
+CONFIG_EXT3_FS=3Dy
+CONFIG_EXT4_FS_POSIX_ACL=3Dy
+CONFIG_EXT4_FS_SECURITY=3Dy
+CONFIG_EXT4_ENCRYPTION=3Dy
+CONFIG_BTRFS_FS=3Dm
+CONFIG_BTRFS_FS_POSIX_ACL=3Dy
+CONFIG_F2FS_FS=3Dy
+CONFIG_F2FS_FS_SECURITY=3Dy
+CONFIG_F2FS_FS_ENCRYPTION=3Dy
+CONFIG_FANOTIFY=3Dy
+CONFIG_FANOTIFY_ACCESS_PERMISSIONS=3Dy
+CONFIG_QUOTA=3Dy
+CONFIG_QFMT_V2=3Dy
+CONFIG_AUTOFS4_FS=3Dy
+CONFIG_FUSE_FS=3Dy
+CONFIG_CUSE=3Dm
+CONFIG_OVERLAY_FS=3Dy
+CONFIG_MSDOS_FS=3Dy
+CONFIG_VFAT_FS=3Dy
+CONFIG_TMPFS_POSIX_ACL=3Dy
+CONFIG_HUGETLBFS=3Dy
+CONFIG_EFIVAR_FS=3Dy
+CONFIG_SDCARD_FS=3Dy
+CONFIG_SQUASHFS=3Dy
+CONFIG_PSTORE_CONSOLE=3Dy
+CONFIG_PSTORE_RAM=3Dy
+CONFIG_9P_FS=3Dy
+CONFIG_NLS_CODEPAGE_437=3Dy
+CONFIG_NLS_ISO8859_1=3Dy
+CONFIG_SECURITY_PERF_EVENTS_RESTRICT=3Dy
+CONFIG_SECURITY=3Dy
+CONFIG_SECURITY_NETWORK=3Dy
+CONFIG_HARDENED_USERCOPY=3Dy
+CONFIG_SECURITY_SELINUX=3Dy
+CONFIG_CRYPTO_GCM=3Dy
+CONFIG_CRYPTO_SHA512=3Dy
+CONFIG_CRYPTO_ANSI_CPRNG=3Dy
+CONFIG_PRINTK_TIME=3Dy
+CONFIG_DEBUG_INFO=3Dy
+CONFIG_MAGIC_SYSRQ=3Dy
+CONFIG_PANIC_TIMEOUT=3D5
+CONFIG_SCHEDSTATS=3Dy
+# CONFIG_DEBUG_PREEMPT is not set
+CONFIG_ENABLE_DEFAULT_TRACERS=3Dy
+CONFIG_MEMTEST=3Dy
diff --git
b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0001-drm-Add-=
component-aware-simple-encoder.patch
new file mode 100644
index 0000000..96cc651
--- /dev/null
+++
b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0001-drm-Add-=
component-aware-simple-encoder.patch
@@ -0,0 +1,368 @@
+From 6fd66138c44107786879d0adebe78ca94cf6292f Mon Sep 17 00:00:00 2001
+From: Liviu Dudau <Liviu.Dudau@arm.com><mailto:Liviu.Dudau@arm.com>
+Date: Wed, 1 Apr 2020 12:10:14 +0100
+Subject: [PATCH 1/2] drm: Add component-aware simple encoder
+
+This is a simple DRM encoder that gets its connector timings information
+from a OF subnode in the device tree and exposes that as a "discovered"
+panel. It can be used together with component-based DRM drivers in an
+emulated environment where no real encoder or connector hardware exists
+and the display output is configured outside the kernel.
+
+Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com><mailto:Liviu.Dudau@arm.c=
om>
+[Backported to gem5's 4.3 kernel]
+Signed-off-by: Andreas Sandberg <andreas.sandberg@arm.com><mailto:andreas=
.sandberg@arm.com>
+[Ported to gem5's 4.9 kernel. Added dep. on VIDEOMODE_HELPERS.]
+Signed-off-by: Andreas Sandberg <andreas.sandberg@arm.com><mailto:andreas=
.sandberg@arm.com>
+[Ported to gem5's 4.14 kernel.]
+Signed-off-by: Andreas Sandberg <andreas.sandberg@arm.com><mailto:andreas=
.sandberg@arm.com>
+Upstream-Status: Backport
+Signed-off-by: Teo Couprie Diaz <teo.coupriediaz@arm.com><mailto:teo.coup=
riediaz@arm.com>
+---
+ drivers/gpu/drm/Kconfig               |  10 ++
+ drivers/gpu/drm/Makefile              |   3 +
+ drivers/gpu/drm/drm_virtual_encoder.c | 297
++++++++++++++++++++++++++++++++++
+ 3 files changed, 310 insertions(+)
+ create mode 100644 drivers/gpu/drm/drm_virtual_encoder.c
+
+diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
+index e44e567..6e95357 100644
+--- a/drivers/gpu/drm/Kconfig
++++ b/drivers/gpu/drm/Kconfig
+@@ -255,6 +255,16 @@ config DRM_VKMS
+
+         If M is selected the module will be called vkms.
+
++config DRM_VIRT_ENCODER
++      tristate "Virtual OF-based encoder"
++      depends on DRM && OF
++      select VIDEOMODE_HELPERS
++      help
++        Choose this option to get a virtual encoder and its associated
++        connector that will use the device tree to read the display
++        timings information. If M is selected the module will be called
++        drm_vencoder.
++
+ source "drivers/gpu/drm/exynos/Kconfig"
+
+ source "drivers/gpu/drm/rockchip/Kconfig"
+diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
+index a6771ce..733ad62 100644
+--- a/drivers/gpu/drm/Makefile
++++ b/drivers/gpu/drm/Makefile
+@@ -46,6 +46,9 @@ drm_kms_helper-$(CONFIG_DRM_DP_CEC) +=3D drm_dp_cec.o
+ obj-$(CONFIG_DRM_KMS_HELPER) +=3D drm_kms_helper.o
+ obj-$(CONFIG_DRM_DEBUG_SELFTEST) +=3D selftests/
+
++drm_vencoder-y :=3D drm_virtual_encoder.o
++obj-$(CONFIG_DRM_VIRT_ENCODER) +=3D drm_vencoder.o
++
+ obj-$(CONFIG_DRM)     +=3D drm.o
+ obj-$(CONFIG_DRM_MIPI_DSI) +=3D drm_mipi_dsi.o
+ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) +=3D drm_panel_orientation_qu=
irks.o
+diff --git a/drivers/gpu/drm/drm_virtual_encoder.c
b/drivers/gpu/drm/drm_virtual_encoder.c
+new file mode 100644
+index 00000000..2e2c51d
+--- /dev/null
++++ b/drivers/gpu/drm/drm_virtual_encoder.c
+@@ -0,0 +1,297 @@
++/*
++ * Copyright (C) 2016 ARM Limited
++ * Author: Liviu Dudau <Liviu.Dudau@arm.com><mailto:Liviu.Dudau@arm.com>
++ *
++ * Dummy encoder and connector that use the OF to "discover" the attache=
d
++ * display timings. Can be used in situations where the encoder and
connector's
++ * functionality are emulated and no setup steps are needed, or to descr=
ibe
++ * attached panels for which no driver exists but can be used without
++ * additional hardware setup.
++ *
++ * The encoder also uses the component framework so that it can be a qui=
ck
++ * replacement for existing drivers when testing in an emulated environm=
ent.
++ *
++ * This file is subject to the terms and conditions of the GNU General
Public
++ * License.  See the file COPYING in the main directory of this archive
++ * for more details.
++ *
++ */
++
++#include <drm/drmP.h>
++#include <drm/drm_crtc.h>
++#include <drm/drm_atomic_helper.h>
++#include <drm/drm_crtc_helper.h>
++#include <drm/drm_of.h>
++#include <linux/component.h>
++#include <video/display_timing.h>
++#include <video/of_display_timing.h>
++#include <video/videomode.h>
++
++struct drm_virt_priv {
++      struct drm_connector connector;
++      struct drm_encoder encoder;
++      struct display_timings *timings;
++};
++
++#define connector_to_drm_virt_priv(x) \
++      container_of(x, struct drm_virt_priv, connector)
++
++#define encoder_to_drm_virt_priv(x) \
++      container_of(x, struct drm_virt_priv, encoder)
++
++static void drm_virtcon_destroy(struct drm_connector *connector)
++{
++      struct drm_virt_priv *conn =3D connector_to_drm_virt_priv(connecto=
r);
++
++      drm_connector_cleanup(connector);
++      display_timings_release(conn->timings);
++}
++
++static enum drm_connector_status
++drm_virtcon_detect(struct drm_connector *connector, bool force)
++{
++      return connector_status_connected;
++}
++
++static const struct drm_connector_funcs drm_virtcon_funcs =3D {
++      .reset =3D drm_atomic_helper_connector_reset,
++      .detect =3D drm_virtcon_detect,
++      .fill_modes =3D drm_helper_probe_single_connector_modes,
++      .destroy =3D drm_virtcon_destroy,
++      .atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_=
state,
++      .atomic_destroy_state =3D drm_atomic_helper_connector_destroy_stat=
e,
++};
++
++static int drm_virtcon_get_modes(struct drm_connector *connector)
++{
++      struct drm_virt_priv *conn =3D connector_to_drm_virt_priv(connecto=
r);
++      struct display_timings *timings =3D conn->timings;
++      int i;
++
++      for (i =3D 0; i < timings->num_timings; i++) {
++              struct drm_display_mode *mode =3D
drm_mode_create(connector->dev);
++              struct videomode vm;
++
++              if (videomode_from_timings(timings, &vm, i))
++                      break;
++
++              drm_display_mode_from_videomode(&vm, mode);
++              mode->type =3D DRM_MODE_TYPE_DRIVER;
++              if (timings->native_mode =3D=3D i)
++                      mode->type =3D DRM_MODE_TYPE_PREFERRED;
++
++              drm_mode_set_name(mode);
++              drm_mode_probed_add(connector, mode);
++      }
++
++      return i;
++}
++
++static int drm_virtcon_mode_valid(struct drm_connector *connector,
++                                 struct drm_display_mode *mode)
++{
++      return MODE_OK;
++}
++
++struct drm_encoder *drm_virtcon_best_encoder(struct drm_connector
*connector)
++{
++      struct drm_virt_priv *priv =3D connector_to_drm_virt_priv(connecto=
r);
++
++      return &priv->encoder;
++}
++
++struct drm_encoder *
++drm_virtcon_atomic_best_encoder(struct drm_connector *connector,
++                               struct drm_connector_state *connector_sta=
te)
++{
++      struct drm_virt_priv *priv =3D connector_to_drm_virt_priv(connecto=
r);
++
++      return &priv->encoder;
++}
++
++static const struct drm_connector_helper_funcs drm_virtcon_helper_funcs =
=
=3D {
++      .get_modes =3D drm_virtcon_get_modes,
++      .mode_valid =3D drm_virtcon_mode_valid,
++      .best_encoder =3D drm_virtcon_best_encoder,
++      .atomic_best_encoder =3D drm_virtcon_atomic_best_encoder,
++};
++
++static void drm_vencoder_destroy(struct drm_encoder *encoder)
++{
++      drm_encoder_cleanup(encoder);
++}
++
++static const struct drm_encoder_funcs drm_vencoder_funcs =3D {
++      .destroy =3D drm_vencoder_destroy,
++};
++
++static void drm_vencoder_dpms(struct drm_encoder *encoder, int mode)
++{
++      /* nothing needed */
++}
++
++static bool drm_vencoder_mode_fixup(struct drm_encoder *encoder,
++                                  const struct drm_display_mode *mode,
++                                  struct drm_display_mode *adjusted_mode=
)
++{
++      /* nothing needed */
++      return true;
++}
++
++static void drm_vencoder_prepare(struct drm_encoder *encoder)
++{
++      drm_vencoder_dpms(encoder, DRM_MODE_DPMS_OFF);
++}
++
++static void drm_vencoder_commit(struct drm_encoder *encoder)
++{
++      drm_vencoder_dpms(encoder, DRM_MODE_DPMS_ON);
++}
++
++static void drm_vencoder_mode_set(struct drm_encoder *encoder,
++                                struct drm_display_mode *mode,
++                                struct drm_display_mode *adjusted_mode)
++{
++      /* nothing needed */
++}
++
++static const struct drm_encoder_helper_funcs drm_vencoder_helper_funcs =
=3D {
++      .dpms           =3D drm_vencoder_dpms,
++      .mode_fixup     =3D drm_vencoder_mode_fixup,
++      .prepare        =3D drm_vencoder_prepare,
++      .commit         =3D drm_vencoder_commit,
++      .mode_set       =3D drm_vencoder_mode_set,
++};
++
++static int drm_vencoder_bind(struct device *dev, struct device *master,
++                           void *data)
++{
++      struct drm_encoder *encoder;
++      struct drm_virt_priv *con;
++      struct drm_connector *connector;
++      struct drm_device *drm =3D data;
++      u32 crtcs =3D 0;
++      int ret;
++
++      con =3D devm_kzalloc(dev, sizeof(*con), GFP_KERNEL);
++      if (!con)
++              return -ENOMEM;
++
++      dev_set_drvdata(dev, con);
++      connector =3D &con->connector;
++      encoder =3D &con->encoder;
++
++      if (dev->of_node) {
++              struct drm_bridge *bridge;
++              crtcs =3D drm_of_find_possible_crtcs(drm, dev->of_node);
++              bridge =3D of_drm_find_bridge(dev->of_node);
++              if (bridge) {
++                      ret =3D drm_bridge_attach(encoder, bridge, NULL);
++                      if (ret) {
++                              DRM_ERROR("Failed to initialize bridge\n")=
;
++                              return ret;
++                      }
++              }
++              con->timings =3D of_get_display_timings(dev->of_node);
++              if (!con->timings) {
++                      dev_err(dev, "failed to get display panel timings\=
n");
++                      return ENXIO;
++              }
++      }
++
++      /* If no CRTCs were found, fall back to the old encoder's behaviou=
r */
++      if (crtcs =3D=3D 0) {
++              dev_warn(dev, "Falling back to first CRTC\n");
++              crtcs =3D 1 << 0;
++      }
++
++      encoder->possible_crtcs =3D crtcs ? crtcs : 1;
++      encoder->possible_clones =3D 0;
++
++      ret =3D drm_encoder_init(drm, encoder, &drm_vencoder_funcs,
++                             DRM_MODE_ENCODER_VIRTUAL, NULL);
++      if (ret)
++              goto encoder_init_err;
++
++      drm_encoder_helper_add(encoder, &drm_vencoder_helper_funcs);
++
++      /* bogus values, pretend we're a 24" screen for DPI calculations *=
/
++      connector->display_info.width_mm =3D 519;
++      connector->display_info.height_mm =3D 324;
++      connector->interlace_allowed =3D false;
++      connector->doublescan_allowed =3D false;
++      connector->polled =3D 0;
++
++      ret =3D drm_connector_init(drm, connector, &drm_virtcon_funcs,
++                               DRM_MODE_CONNECTOR_VIRTUAL);
++      if (ret)
++              goto connector_init_err;
++
++      drm_connector_helper_add(connector, &drm_virtcon_helper_funcs);
++
++      drm_connector_register(connector);
++
++      ret =3D drm_connector_attach_encoder(connector, encoder);
++      if (ret)
++              goto attach_err;
++
++      return ret;
++
++attach_err:
++      drm_connector_unregister(connector);
++      drm_connector_cleanup(connector);
++connector_init_err:
++      drm_encoder_cleanup(encoder);
++encoder_init_err:
++      display_timings_release(con->timings);
++
++      return ret;
++};
++
++static void drm_vencoder_unbind(struct device *dev, struct device *maste=
r,
++                              void *data)
++{
++      struct drm_virt_priv *con =3D dev_get_drvdata(dev);
++
++      drm_connector_unregister(&con->connector);
++      drm_connector_cleanup(&con->connector);
++      drm_encoder_cleanup(&con->encoder);
++      display_timings_release(con->timings);
++}
++
++static const struct component_ops drm_vencoder_ops =3D {
++      .bind =3D drm_vencoder_bind,
++      .unbind =3D drm_vencoder_unbind,
++};
++
++static int drm_vencoder_probe(struct platform_device *pdev)
++{
++      return component_add(&pdev->dev, &drm_vencoder_ops);
++}
++
++static int drm_vencoder_remove(struct platform_device *pdev)
++{
++      component_del(&pdev->dev, &drm_vencoder_ops);
++      return 0;
++}
++
++static const struct of_device_id drm_vencoder_of_match[] =3D {
++      { .compatible =3D "drm,virtual-encoder", },
++      {},
++};
++MODULE_DEVICE_TABLE(of, drm_vencoder_of_match);
++
++static struct platform_driver drm_vencoder_driver =3D {
++      .probe =3D drm_vencoder_probe,
++      .remove =3D drm_vencoder_remove,
++      .driver =3D {
++              .name =3D "drm_vencoder",
++              .of_match_table =3D drm_vencoder_of_match,
++      },
++};
++
++module_platform_driver(drm_vencoder_driver);
++
++MODULE_AUTHOR("Liviu Dudau");
++MODULE_DESCRIPTION("Virtual DRM Encoder");
++MODULE_LICENSE("GPL v2");
+--
+2.7.4
+
diff --git
b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0002-swap-red=
-and-blue-colors-in-HDLCD-driver.patch
new file mode 100644
index 0000000..621209f
--- /dev/null
+++
b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0002-swap-red=
-and-blue-colors-in-HDLCD-driver.patch
@@ -0,0 +1,43 @@
+From 064807d22a0a2865a930d4cc48b61f917f4bf15f Mon Sep 17 00:00:00 2001
+From: Anders Dellien <anders.dellien@arm.com><mailto:anders.dellien@arm.c=
om>
+Date: Fri, 17 Apr 2020 16:06:03 +0100
+Subject: [PATCH 2/2] swap red and blue colors in HDLCD driver
+
+The HDLCD drivers is configured to use BGR888 but Android needs
+RGB888 - so we need to swap the red and blue components.
+
+Change-Id: Ib47ddff9280a53757925f6c1b1f373089d038025
+Signed-off-by: Anders Dellien<anders.dellien@arm.com><mailto:anders.delli=
en@arm.com>
+Upstream-Status: Inappropriate [Color swap needed for TC0 only]
+Signed-off-by: Teo Couprie Diaz <teo.coupriediaz@arm.com><mailto:teo.coup=
riediaz@arm.com>
+---
+ drivers/gpu/drm/arm/hdlcd_crtc.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c
b/drivers/gpu/drm/arm/hdlcd_crtc.c
+index e69d996..a46ba4f 100644
+--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
++++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
+@@ -110,15 +110,15 @@ static int hdlcd_set_pxl_fmt(struct drm_crtc *crtc)
+        * pixel is outside the visible frame area or when there is a
+        * buffer underrun.
+        */
+-      hdlcd_write(hdlcd, HDLCD_REG_RED_SELECT, format->red.offset |
++      hdlcd_write(hdlcd, HDLCD_REG_RED_SELECT, format->blue.offset |
+ #ifdef CONFIG_DRM_HDLCD_SHOW_UNDERRUN
+                   0x00ff0000 |        /* show underruns in red */
+ #endif
+-                  ((format->red.length & 0xf) << 8));
++                  ((format->blue.length & 0xf) << 8));
+       hdlcd_write(hdlcd, HDLCD_REG_GREEN_SELECT, format->green.offset |
+                   ((format->green.length & 0xf) << 8));
+-      hdlcd_write(hdlcd, HDLCD_REG_BLUE_SELECT, format->blue.offset |
+-                  ((format->blue.length & 0xf) << 8));
++      hdlcd_write(hdlcd, HDLCD_REG_BLUE_SELECT, format->red.offset |
++                  ((format->red.length & 0xf) << 8));
+
+       return 0;
+ }
+--
+2.7.4
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-tc0.inc
b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-tc0.inc
new file mode 100644
index 0000000..a8fe6ff
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-tc0.inc
@@ -0,0 +1,15 @@
+#
+# TC0 MACHINE specific configurations
+#
+
+FILESEXTRAPATHS_prepend :=3D
"${THISDIR}/linux-arm64-ack-4.19:${THISDIR}/files:"
+
+SRC_URI_append =3D " \
+    file://defconfig \
+    file://0001-drm-Add-component-aware-simple-encoder.patch \
+    file://0002-swap-red-and-blue-colors-in-HDLCD-driver.patch \
+    "
+
+KCONFIG_MODE =3D "--alldefconfig"
+
+COMPATIBLE_MACHINE =3D "tc0"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappe=
nd
b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend
new file mode 100644
index 0000000..4df4831
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend
@@ -0,0 +1,6 @@
+# Machine specific configurations
+
+MACHINE_ACK_REQUIRE ?=3D ""
+MACHINE_ACK_REQUIRE_tc0 =3D "linux-arm64-ack-tc0.inc"
+
+require ${MACHINE_ACK_REQUIRE}
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are
confidential and may also be privileged. If you are not the intended
recipient, please notify the sender immediately and do not disclose the
contents to any other person, use it for any purpose, or store or copy the
information in any medium. Thank you.

















IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose, or store or copy the information in=
 any medium. Thank you.

--------------5B10D931E9B7B3A8E7E50DBA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
</head>
<body>
<div class=3D"moz-cite-prefix">On 6/30/20 4:26 PM, Jon Mason via lists.yoc=
toproject.org wrote:<br>
</div>
<blockquote type=3D"cite" cite=3D"mid:20200630152629.GA11599@kudzu.us">
<pre class=3D"moz-quote-pre" wrap=3D"">On Tue, Jun 30, 2020 at 01:13:52AM =
-0700, Diego Sueiro wrote:
</pre>
<blockquote type=3D"cite">
<pre class=3D"moz-quote-pre" wrap=3D"">On Mon, Jun 29, 2020 at 04:41 PM, T=
eo Couprie Diaz wrote:

</pre>
<blockquote type=3D"cite">
<pre class=3D"moz-quote-pre" wrap=3D"">
This patch introduces the Total Compute platform.
It adds support for the TC0 platform to the Android Common Kernel and
allows building all binaries needed to run Android on TC0.
It adds patches specific to TC0 for TF-A, SCP and U-Boot.

Change-Id: Ia83b79571c7381967c7449db031e3177b1990546
Signed-off-by: Teo Couprie Diaz <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:teo.coupriediaz@arm.com">&lt;teo.coupriediaz@arm.com&gt;</a>
Signed-off-by: Usama Arif <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:usama.arif@arm.com">&lt;usama.arif@arm.com&gt;</a>
</pre>
</blockquote>
<pre class=3D"moz-quote-pre" wrap=3D"">
Reviewed-by: Diego Sueiro <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:diego.sueiro@arm.com">&lt;diego.sueiro@arm.com&gt;</a>
</pre>
</blockquote>
<pre class=3D"moz-quote-pre" wrap=3D"">
Series applied to master.

NOTE: there is corruption to the patch files in this series.  It
appears to be a problem with the SMTP servers from Arm.  Behind the
scenes work is being done to resolve it.

Thanks,
Jon</pre>
</blockquote>
Thanks for applying the patches. Could the series be pulled into dunfell ?=
<br>
<br>
Thanks,<br>
Teo<br>
<blockquote type=3D"cite" cite=3D"mid:20200630152629.GA11599@kudzu.us">
<pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
<blockquote type=3D"cite">
<pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
<blockquote type=3D"cite">
<pre class=3D"moz-quote-pre" wrap=3D"">---
 meta-arm-bsp/conf/machine/tc0.conf            |  27 &#43;
 .../scp-firmware/scp-firmware-tc0.inc         |  13 &#43;
 .../scp-firmware/scp-firmware_git.bbappend    |   1 &#43;
 .../trusted-firmware-a-tc0.inc                |  23 &#43;
 .../trusted-firmware-a_2.3.bbappend           |   6 &#43;
 .../tc0/tc0-config-and-android-boot.patch     | 160 &#43;&#43;&#43;&#43;
 .../recipes-bsp/u-boot/u-boot-tc0.inc         |   6 &#43;
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   4 &#43;
 .../recipes-kernel/linux/files/tc0/defconfig  | 906 &#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 ...m-Add-component-aware-simple-encoder.patch | 368 &#43;&#43;&#43;&#43;&=
#43;&#43;&#43;
 ...-red-and-blue-colors-in-HDLCD-driver.patch |  43 &#43;
 .../linux/linux-arm64-ack-tc0.inc             |  15 &#43;
 .../linux/linux-arm64-ack_4.19.bbappend       |   6 &#43;
 13 files changed, 1578 insertions(&#43;)
 create mode 100644 meta-arm-bsp/conf/machine/tc0.conf
 create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0=
.inc
 create mode 100644
meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc
 create mode 100644
meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappen=
d
 create mode 100644
meta-arm-bsp/recipes-bsp/u-boot/files/tc0/tc0-config-and-android-boot.patc=
h
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc0.inc
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/tc0/defconfig
 create mode 100644
meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0001-drm-Add-co=
mponent-aware-simple-encoder.patch
 create mode 100644
meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0002-swap-red-a=
nd-blue-colors-in-HDLCD-driver.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-tc0.=
inc
 create mode 100644
meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend

diff --git a/meta-arm-bsp/conf/machine/tc0.conf
b/meta-arm-bsp/conf/machine/tc0.conf
new file mode 100644
index 0000000..9b4f1ae
--- /dev/null
&#43;&#43;&#43; b/meta-arm-bsp/conf/machine/tc0.conf
@@ -0,0 &#43;1,27 @@
&#43;# Configuration for TC0
&#43;
&#43;#@TYPE: Machine
&#43;#@NAME: TC0
&#43;#@DESCRIPTION: Machine configuration for TC0
&#43;
&#43;TUNE_FEATURES =3D &quot;aarch64&quot;
&#43;
&#43;require conf/machine/include/arm/arch-armv8a.inc
&#43;
&#43;# Das U-boot
&#43;UBOOT_MACHINE ?=3D &quot;total_compute_defconfig&quot;
&#43;
&#43;# Trusted firmware A v2.3
&#43;PREFERRED_PROVIDER_virtual/trusted-firmware-a ?=3D &quot;trusted-firm=
ware-a&quot;
&#43;PREFERRED_VERSION_trusted-firmware-a ?=3D &quot;2.3%&quot;
&#43;
&#43;EXTRA_IMAGEDEPENDS &#43;=3D &quot;virtual/trusted-firmware-a&quot;
&#43;
&#43;PREFERRED_PROVIDER_virtual/kernel ?=3D &quot;linux-arm64-ack&quot;
&#43;
&#43;# Cannot use the default zImage on arm64
&#43;KERNEL_IMAGETYPE =3D &quot;Image&quot;
&#43;KERNEL_BOOTCMD =3D &quot;booti&quot;
&#43;IMAGE_FSTYPES &#43;=3D &quot;cpio.gz.u-boot&quot;
&#43;
&#43;SERIAL_CONSOLES =3D &quot;115200;ttyAMA0&quot;
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
new file mode 100644
index 0000000..5b29305
--- /dev/null
&#43;&#43;&#43; b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.i=
nc
@@ -0,0 &#43;1,13 @@
&#43;# TC0 specicif SCP configuration
&#43;
&#43;# Intermediate SHA with 2.6 baseline version
&#43;SRCREV_scp    =3D &quot;ba1db5fb0ee4a520836722f7a694177d461ab716&quot=
;
&#43;# 5.2.0 tag commit
&#43;SRCREV_cmsis  =3D &quot;80cc44bba16cb4c8f495b7aa9709d41ac50e9529&quot=
;
&#43;
&#43;COMPATIBLE_MACHINE =3D &quot;tc0&quot;
&#43;
&#43;SCP_PLATFORM =3D &quot;tc0&quot;
&#43;FW_TARGETS =3D &quot;scp&quot;
&#43;
&#43;PV =3D &quot;2.6&#43;git${SRCPV}&quot;
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_git.bbappe=
nd
b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_git.bbappend
index 53bd022..33ae7fe 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_git.bbappend
&#43;&#43;&#43; b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_git.b=
bappend
@@ -3,5 &#43;3,6 @@
 MACHINE_SCP_REQUIRE ?=3D &quot;&quot;

 MACHINE_SCP_REQUIRE_n1sdp =3D &quot;scp-firmware-n1sdp.inc&quot;
&#43;MACHINE_SCP_REQUIRE_tc0 =3D &quot;scp-firmware-tc0.inc&quot;

 require ${MACHINE_SCP_REQUIRE}
diff --git
a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc
b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc
new file mode 100644
index 0000000..555fb1d
--- /dev/null
&#43;&#43;&#43; b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firm=
ware-a-tc0.inc
@@ -0,0 &#43;1,23 @@
&#43;# TCO specific TFA configuration
&#43;
&#43;# Intermediate SHA with 2.3 baseline version
&#43;SRCREV_tfa =3D &quot;2fe7d18b0d99fdf4c4dbf84863bb2036dfebc537&quot;
&#43;# mbedtls-2.16.4 tag commit
&#43;SRCREV_mbedtls =3D &quot;39e2c0eeb6501980764793e8d54c49c0a42bde48&quo=
t;
&#43;
&#43;SRC_URI_append =3D &quot; ${SRC_URI_MBEDTLS}&quot;
&#43;
&#43;DEPENDS &#43;=3D &quot;scp-firmware&quot;
&#43;
&#43;COMPATIBLE_MACHINE =3D &quot;tc0&quot;
&#43;
&#43;TFA_PLATFORM =3D &quot;tc0&quot;
&#43;TFA_BUILD_TARGET =3D &quot;all fip&quot;
&#43;TFA_UBOOT =3D &quot;1&quot;
&#43;TFA_INSTALL_TARGET =3D &quot;bl1 fip&quot;
&#43;TFA_MBEDTLS =3D &quot;1&quot;
&#43;TFA_DEBUG =3D &quot;1&quot;
&#43;
&#43;EXTRA_OEMAKE &#43;=3D &quot;SCP_BL2=3D${RECIPE_SYSROOT}/firmware/scp_=
ramfw.bin&quot;
&#43;EXTRA_OEMAKE &#43;=3D &quot;MBEDTLS_DIR=3Dmbedtls TRUSTED_BOARD_BOOT=
=3D1 GENERATE_COT=3D1
ARM_ROTPK_LOCATION=3Ddevel_rsa \
&#43;
ROT_KEY=3Dplat/arm/board/common/rotpk/arm_rotprivk_rsa.pem&quot;
diff --git
a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbapp=
end
b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbapp=
end
new file mode 100644
index 0000000..b642708
--- /dev/null
&#43;&#43;&#43;
b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbapp=
end
@@ -0,0 &#43;1,6 @@
&#43;# Machine specific TFAs
&#43;
&#43;MACHINE_TFA_REQUIRE ?=3D &quot;&quot;
&#43;MACHINE_TFA_REQUIRE_tc0 =3D &quot;trusted-firmware-a-tc0.inc&quot;
&#43;
&#43;require ${MACHINE_TFA_REQUIRE}
diff --git
a/meta-arm-bsp/recipes-bsp/u-boot/files/tc0/tc0-config-and-android-boot.pa=
tch
b/meta-arm-bsp/recipes-bsp/u-boot/files/tc0/tc0-config-and-android-boot.pa=
tch
new file mode 100644
index 0000000..a66898e
--- /dev/null
&#43;&#43;&#43;
b/meta-arm-bsp/recipes-bsp/u-boot/files/tc0/tc0-config-and-android-boot.pa=
tch
@@ -0,0 &#43;1,160 @@
&#43;From 0867e715d3563b0bc0ee7e04f9ec6b615de626b2 Mon Sep 17 00:00:00 200=
1
&#43;From: Usama Arif <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:us=
ama.arif@arm.com">&lt;usama.arif@arm.com&gt;</a>
&#43;Date: Thu, 04 Jun 2020 14:16:02 &#43;0100
&#43;Subject: [PATCH] Introduce Total Compute platform
&#43;
&#43;This is based off vexpress64 platform. It includes support for
&#43;NOR flash and has bootargs setup for android boot.
&#43;
&#43;Change-Id: I965c81001a1c4a1a6788106f0ba2ca577dee4096
&#43;Signed-off-by: Usama Arif <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:usama.arif@arm.com">&lt;usama.arif@arm.com&gt;</a>
&#43;Upstream-Status: Pending
&#43;Signed-off-by: Teo Couprie Diaz <a class=3D"moz-txt-link-rfc2396E" hr=
ef=3D"mailto:teo.coupriediaz@arm.com">&lt;teo.coupriediaz@arm.com&gt;</a>
&#43;---
&#43;
&#43;diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
&#43;index 21df1c4..c208a40 100644
&#43;--- a/arch/arm/Kconfig
&#43;&#43;&#43;&#43; b/arch/arm/Kconfig
&#43;@@ -1174,6 &#43;1174,14 @@
&#43;       select USB
&#43;       select DM_USB
&#43;
&#43;&#43;config TARGET_TOTAL_COMPUTE
&#43;&#43;      bool &quot;Support Total Compute Platform&quot;
&#43;&#43;      select ARM64
&#43;&#43;      select PL01X_SERIAL
&#43;&#43;      select DM
&#43;&#43;      select DM_SERIAL
&#43;&#43;      select DM_ETH
&#43;&#43;
&#43; config TARGET_LS2080A_EMU
&#43;       bool &quot;Support ls2080a_emu&quot;
&#43;       select ARCH_LS2080A
&#43;diff --git a/board/armltd/vexpress64/Kconfig
b/board/armltd/vexpress64/Kconfig
&#43;index 1d13f54..d59769f 100644
&#43;--- a/board/armltd/vexpress64/Kconfig
&#43;&#43;&#43;&#43; b/board/armltd/vexpress64/Kconfig
&#43;@@ -1,4 &#43;1,4 @@
&#43;-if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO
&#43;&#43;if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO ||
TARGET_TOTAL_COMPUTE
&#43;
&#43; config SYS_BOARD
&#43;       default &quot;vexpress64&quot;
&#43;diff --git a/configs/total_compute_defconfig
b/configs/total_compute_defconfig
&#43;new file mode 100644
&#43;index 0000000..1faeb36
&#43;--- /dev/null
&#43;&#43;&#43;&#43; b/configs/total_compute_defconfig
&#43;@@ -0,0 &#43;1,40 @@
&#43;&#43;CONFIG_ARM=3Dy
&#43;&#43;CONFIG_TARGET_TOTAL_COMPUTE=3Dy
&#43;&#43;CONFIG_SYS_TEXT_BASE=3D0xe0000000
&#43;&#43;CONFIG_SYS_MALLOC_F_LEN=3D0x2000
&#43;&#43;CONFIG_ENV_SIZE=3D0x10000
&#43;&#43;CONFIG_NR_DRAM_BANKS=3D2
&#43;&#43;CONFIG_DISTRO_DEFAULTS=3Dy
&#43;&#43;CONFIG_BOOTDELAY=3D1
&#43;&#43;CONFIG_USE_BOOTARGS=3Dy
&#43;&#43;CONFIG_BOOTARGS=3D&quot;console=3DttyAMA0 debug user_debug=3D31
earlycon=3Dpl011,0x7ff80000 loglevel=3D9 androidboot.hardware=3Dtotal_comp=
ute
video=3D640x480-32@60 root=3D/dev/vda2 ip=3Ddhcp androidboot.selinux=3Dper=
missive&quot;
&#43;&#43;# CONFIG_USE_BOOTCOMMAND is not set
&#43;&#43;# CONFIG_DISPLAY_CPUINFO is not set
&#43;&#43;# CONFIG_DISPLAY_BOARDINFO is not set
&#43;&#43;CONFIG_SYS_PROMPT=3D&quot;TOTAL_COMPUTE# &quot;
&#43;&#43;# CONFIG_CMD_CONSOLE is not set
&#43;&#43;# CONFIG_CMD_XIMG is not set
&#43;&#43;# CONFIG_CMD_EDITENV is not set
&#43;&#43;CONFIG_CMD_MEMTEST=3Dy
&#43;&#43;CONFIG_SYS_MEMTEST_START=3D0x80000000
&#43;&#43;CONFIG_SYS_MEMTEST_END=3D0xff000000
&#43;&#43;CONFIG_CMD_ARMFLASH=3Dy
&#43;&#43;# CONFIG_CMD_LOADS is not set
&#43;&#43;# CONFIG_CMD_ITEST is not set
&#43;&#43;# CONFIG_CMD_SETEXPR is not set
&#43;&#43;# CONFIG_CMD_NFS is not set
&#43;&#43;CONFIG_CMD_CACHE=3Dy
&#43;&#43;# CONFIG_CMD_MISC is not set
&#43;&#43;CONFIG_CMD_UBI=3Dy
&#43;&#43;# CONFIG_ISO_PARTITION is not set
&#43;&#43;# CONFIG_EFI_PARTITION is not set
&#43;&#43;# CONFIG_MMC is not set
&#43;&#43;CONFIG_MTD=3Dy
&#43;&#43;CONFIG_MTD_NOR_FLASH=3Dy
&#43;&#43;CONFIG_FLASH_CFI_DRIVER=3Dy
&#43;&#43;CONFIG_SYS_FLASH_USE_BUFFER_WRITE=3Dy
&#43;&#43;CONFIG_SYS_FLASH_PROTECTION=3Dy
&#43;&#43;CONFIG_SYS_FLASH_CFI=3Dy
&#43;&#43;CONFIG_SMC911X=3Dy
&#43;&#43;CONFIG_SMC911X_32_BIT=3Dy
&#43;&#43;CONFIG_OF_LIBFDT=3Dy
&#43;diff --git a/include/configs/vexpress_aemv8a.h
b/include/configs/vexpress_aemv8a.h
&#43;index 09cdd3d..e39699e 100644
&#43;--- a/include/configs/vexpress_aemv8a.h
&#43;&#43;&#43;&#43; b/include/configs/vexpress_aemv8a.h
&#43;@@ -13,7 &#43;13,7 @@
&#43; #ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
&#43; /* ATF loads u-boot here for BASE_FVP model */
&#43; #define CONFIG_SYS_INIT_SP_ADDR         (CONFIG_SYS_SDRAM_BASE &#43;=
 0x03f00000)
&#43;-#elif CONFIG_TARGET_VEXPRESS64_JUNO
&#43;&#43;#elif defined(CONFIG_TARGET_VEXPRESS64_JUNO) ||
defined(CONFIG_TARGET_TOTAL_COMPUTE)
&#43; #define CONFIG_SYS_INIT_SP_ADDR         (CONFIG_SYS_SDRAM_BASE &#43;=
 0x7fff0)
&#43; #endif
&#43;
&#43;@@ -40,7 &#43;40,7 @@
&#43; #define V2M_KMI0                      (V2M_PA_CS3 &#43; V2M_PERIPH_O=
FFSET(6))
&#43; #define V2M_KMI1                      (V2M_PA_CS3 &#43; V2M_PERIPH_O=
FFSET(7))
&#43;
&#43;-#ifdef CONFIG_TARGET_VEXPRESS64_JUNO
&#43;&#43;#if defined(CONFIG_TARGET_VEXPRESS64_JUNO) ||
defined(CONFIG_TARGET_TOTAL_COMPUTE)
&#43; #define V2M_UART0                     0x7ff80000
&#43; #define V2M_UART1                     0x7ff70000
&#43; #else /* Not Juno */
&#43;@@ -79,7 &#43;79,7 @@
&#43; #ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
&#43; #define GICD_BASE                     (0x2f000000)
&#43; #define GICC_BASE                     (0x2c000000)
&#43;-#elif CONFIG_TARGET_VEXPRESS64_JUNO
&#43;&#43;#elif defined(CONFIG_TARGET_VEXPRESS64_JUNO) ||
defined(CONFIG_TARGET_TOTAL_COMPUTE)
&#43; #define GICD_BASE                     (0x2C010000)
&#43; #define GICC_BASE                     (0x2C02f000)
&#43; #endif
&#43;@@ -88,14 &#43;88,19 @@
&#43; /* Size of malloc() pool */
&#43; #define CONFIG_SYS_MALLOC_LEN         (CONFIG_ENV_SIZE &#43; (8 &lt;=
&lt; 20))
&#43;
&#43;&#43;#ifdef CONFIG_TARGET_TOTAL_COMPUTE
&#43;&#43;#define CONFIG_SMC911X_BASE           0x18000000
&#43;&#43;#else
&#43;&#43;
&#43; #ifndef CONFIG_TARGET_VEXPRESS64_JUNO
&#43; /* The Vexpress64 simulators use SMSC91C111 */
&#43; #define CONFIG_SMC91111                       1
&#43; #define CONFIG_SMC91111_BASE          (0x01A000000)
&#43; #endif
&#43;
&#43;&#43;#endif
&#43; /* PL011 Serial Configuration */
&#43;-#ifdef CONFIG_TARGET_VEXPRESS64_JUNO
&#43;&#43;#if defined(CONFIG_TARGET_VEXPRESS64_JUNO) ||
defined(CONFIG_TARGET_TOTAL_COMPUTE)
&#43; #define CONFIG_PL011_CLOCK            7372800
&#43; #else
&#43; #define CONFIG_PL011_CLOCK            24000000
&#43;@@ -189,8 &#43;194,17 @@
&#43;                               &quot;fi&quot;
&#43;
&#43;
&#43;-#endif
&#43;&#43;#elif CONFIG_TARGET_TOTAL_COMPUTE
&#43;&#43;#define CONFIG_EXTRA_ENV_SETTINGS     \
&#43;&#43;                              &quot;kernel_addr_r=3D0x80080000\0=
&quot;    \
&#43;&#43;                              &quot;initrd_addr_r=3D0x88000000\0=
&quot;    \
&#43;&#43;                              &quot;fdt_addr_r=3D0x83000000\0&qu=
ot;       \
&#43;&#43;                              &quot;fdt_high=3D0xfffffffffffffff=
f\0&quot; \
&#43;&#43;                              &quot;initrd_high=3D0xffffffffffff=
ffff\0&quot;
&#43;
&#43;&#43;#define CONFIG_BOOTCOMMAND    &quot;booti ${kernel_addr_r} ${ini=
trd_addr_r}
${fdt_addr_r}&quot;
&#43;&#43;
&#43;&#43;#endif
&#43; /* Monitor Command Prompt */
&#43; #define CONFIG_SYS_CBSIZE             512     /* Console I/O Buffer =
Size */
&#43; #define CONFIG_SYS_MAXARGS            64      /* max command args */
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc0.inc
b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc0.inc
new file mode 100644
index 0000000..6c2ed5f
--- /dev/null
&#43;&#43;&#43; b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc0.inc
@@ -0,0 &#43;1,6 @@
&#43;# TC0 specific Das U-Boot configuration and patch
&#43;
&#43;SRC_URI_append =3D ' <a class=3D"moz-txt-link-freetext" href=3D"file:=
//tc0-config-and-android-boot.patch">file://tc0-config-and-android-boot.pat=
ch</a>'
&#43;
&#43;# v2020.07-rc3 tag commit
&#43;SRCREV =3D &quot;8c48bb21bd6a1778d1f299de30ff62c07929702b&quot;
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 20133a4..0df13a4 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
&#43;&#43;&#43; b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -5,4 &#43;5,8 @@ FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/files/${=
MACHINE}:&quot;
 SRC_URI_append_a5ds =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file:/=
/0001-armv7-add-mmio-timer.patch\file://0002-board-arm-add-designstart-cort=
ex-a5-board.patch">&quot; file://0001-armv7-add-mmio-timer.patch \
                    
file://0002-board-arm-add-designstart-cortex-a5-board.patch&quot;</a>

&#43;MACHINE_UBOOT_REQUIRE ?=3D &quot;&quot;

&#43;MACHINE_UBOOT_REQUIRE_tc0 =3D &quot;u-boot-tc0.inc&quot;
&#43;
&#43;require ${MACHINE_UBOOT_REQUIRE}
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/tc0/defconfig
b/meta-arm-bsp/recipes-kernel/linux/files/tc0/defconfig
new file mode 100644
index 0000000..f981b3f
--- /dev/null
&#43;&#43;&#43; b/meta-arm-bsp/recipes-kernel/linux/files/tc0/defconfig
@@ -0,0 &#43;1,906 @@
&#43;CONFIG_POSIX_MQUEUE=3Dy
&#43;CONFIG_AUDIT=3Dy
&#43;CONFIG_NO_HZ=3Dy
&#43;CONFIG_HIGH_RES_TIMERS=3Dy
&#43;CONFIG_PREEMPT=3Dy
&#43;CONFIG_IRQ_TIME_ACCOUNTING=3Dy
&#43;CONFIG_BSD_PROCESS_ACCT=3Dy
&#43;CONFIG_BSD_PROCESS_ACCT_V3=3Dy
&#43;CONFIG_TASKSTATS=3Dy
&#43;CONFIG_TASK_DELAY_ACCT=3Dy
&#43;CONFIG_TASK_XACCT=3Dy
&#43;CONFIG_TASK_IO_ACCOUNTING=3Dy
&#43;CONFIG_PSI=3Dy
&#43;CONFIG_IKCONFIG=3Dy
&#43;CONFIG_IKCONFIG_PROC=3Dy
&#43;CONFIG_NUMA_BALANCING=3Dy
&#43;CONFIG_MEMCG=3Dy
&#43;CONFIG_MEMCG_SWAP=3Dy
&#43;CONFIG_BLK_CGROUP=3Dy
&#43;CONFIG_RT_GROUP_SCHED=3Dy
&#43;CONFIG_CGROUP_PIDS=3Dy
&#43;CONFIG_CGROUP_FREEZER=3Dy
&#43;CONFIG_CGROUP_HUGETLB=3Dy
&#43;CONFIG_CPUSETS=3Dy
&#43;CONFIG_CGROUP_DEVICE=3Dy
&#43;CONFIG_CGROUP_CPUACCT=3Dy
&#43;CONFIG_CGROUP_PERF=3Dy
&#43;CONFIG_CGROUP_BPF=3Dy
&#43;CONFIG_SCHED_AUTOGROUP=3Dy
&#43;CONFIG_SCHED_TUNE=3Dy
&#43;CONFIG_BLK_DEV_INITRD=3Dy
&#43;# CONFIG_FHANDLE is not set
&#43;CONFIG_KALLSYMS_ALL=3Dy
&#43;CONFIG_BPF_SYSCALL=3Dy
&#43;CONFIG_BPF_JIT_ALWAYS_ON=3Dy
&#43;CONFIG_EMBEDDED=3Dy
&#43;# CONFIG_COMPAT_BRK is not set
&#43;CONFIG_PROFILING=3Dy
&#43;CONFIG_ARCH_SUNXI=3Dy
&#43;CONFIG_ARCH_ALPINE=3Dy
&#43;CONFIG_ARCH_BCM2835=3Dy
&#43;CONFIG_ARCH_BCM_IPROC=3Dy
&#43;CONFIG_ARCH_BERLIN=3Dy
&#43;CONFIG_ARCH_BRCMSTB=3Dy
&#43;CONFIG_ARCH_EXYNOS=3Dy
&#43;CONFIG_ARCH_K3=3Dy
&#43;CONFIG_ARCH_LAYERSCAPE=3Dy
&#43;CONFIG_ARCH_LG1K=3Dy
&#43;CONFIG_ARCH_HISI=3Dy
&#43;CONFIG_ARCH_MEDIATEK=3Dy
&#43;CONFIG_ARCH_MESON=3Dy
&#43;CONFIG_ARCH_MVEBU=3Dy
&#43;CONFIG_ARCH_QCOM=3Dy
&#43;CONFIG_ARCH_ROCKCHIP=3Dy
&#43;CONFIG_ARCH_SEATTLE=3Dy
&#43;CONFIG_ARCH_SYNQUACER=3Dy
&#43;CONFIG_ARCH_RENESAS=3Dy
&#43;CONFIG_ARCH_R8A7795=3Dy
&#43;CONFIG_ARCH_R8A7796=3Dy
&#43;CONFIG_ARCH_R8A77965=3Dy
&#43;CONFIG_ARCH_R8A77970=3Dy
&#43;CONFIG_ARCH_R8A77980=3Dy
&#43;CONFIG_ARCH_R8A77990=3Dy
&#43;CONFIG_ARCH_R8A77995=3Dy
&#43;CONFIG_ARCH_STRATIX10=3Dy
&#43;CONFIG_ARCH_TEGRA=3Dy
&#43;CONFIG_ARCH_SPRD=3Dy
&#43;CONFIG_ARCH_THUNDER=3Dy
&#43;CONFIG_ARCH_THUNDER2=3Dy
&#43;CONFIG_ARCH_UNIPHIER=3Dy
&#43;CONFIG_ARCH_VEXPRESS=3Dy
&#43;CONFIG_ARCH_XGENE=3Dy
&#43;CONFIG_ARCH_ZX=3Dy
&#43;CONFIG_ARCH_ZYNQMP=3Dy
&#43;CONFIG_PCI=3Dy
&#43;CONFIG_PCI_IOV=3Dy
&#43;CONFIG_HOTPLUG_PCI=3Dy
&#43;CONFIG_HOTPLUG_PCI_ACPI=3Dy
&#43;CONFIG_PCI_AARDVARK=3Dy
&#43;CONFIG_PCI_TEGRA=3Dy
&#43;CONFIG_PCIE_RCAR=3Dy
&#43;CONFIG_PCI_HOST_GENERIC=3Dy
&#43;CONFIG_PCI_XGENE=3Dy
&#43;CONFIG_PCI_HOST_THUNDER_PEM=3Dy
&#43;CONFIG_PCI_HOST_THUNDER_ECAM=3Dy
&#43;CONFIG_PCIE_ROCKCHIP_HOST=3Dm
&#43;CONFIG_PCI_LAYERSCAPE=3Dy
&#43;CONFIG_PCI_HISI=3Dy
&#43;CONFIG_PCIE_QCOM=3Dy
&#43;CONFIG_PCIE_ARMADA_8K=3Dy
&#43;CONFIG_PCIE_KIRIN=3Dy
&#43;CONFIG_PCIE_HISI_STB=3Dy
&#43;CONFIG_ARM64_VA_BITS_48=3Dy
&#43;CONFIG_SCHED_MC=3Dy
&#43;CONFIG_NUMA=3Dy
&#43;CONFIG_SECCOMP=3Dy
&#43;CONFIG_KEXEC=3Dy
&#43;CONFIG_CRASH_DUMP=3Dy
&#43;CONFIG_XEN=3Dy
&#43;CONFIG_ARM64_SW_TTBR0_PAN=3Dy
&#43;CONFIG_RANDOMIZE_BASE=3Dy
&#43;CONFIG_COMPAT=3Dy
&#43;CONFIG_HIBERNATION=3Dy
&#43;CONFIG_PM_DEBUG=3Dy
&#43;CONFIG_WQ_POWER_EFFICIENT_DEFAULT=3Dy
&#43;CONFIG_ENERGY_MODEL=3Dy
&#43;CONFIG_ARM_CPUIDLE=3Dy
&#43;CONFIG_CPU_FREQ=3Dy
&#43;CONFIG_CPU_FREQ_STAT=3Dy
&#43;CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL=3Dy
&#43;CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
&#43;CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
&#43;CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
&#43;CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
&#43;CONFIG_CPUFREQ_DT=3Dy
&#43;CONFIG_ACPI_CPPC_CPUFREQ=3Dm
&#43;CONFIG_ARM_ARMADA_37XX_CPUFREQ=3Dy
&#43;CONFIG_ARM_BIG_LITTLE_CPUFREQ=3Dy
&#43;CONFIG_ARM_SCPI_CPUFREQ=3Dy
&#43;CONFIG_ARM_TEGRA186_CPUFREQ=3Dy
&#43;CONFIG_ARM_SCPI_PROTOCOL=3Dy
&#43;CONFIG_RASPBERRYPI_FIRMWARE=3Dy
&#43;CONFIG_EFI_CAPSULE_LOADER=3Dy
&#43;CONFIG_ACPI=3Dy
&#43;CONFIG_ACPI_APEI=3Dy
&#43;CONFIG_ACPI_APEI_GHES=3Dy
&#43;CONFIG_ACPI_APEI_MEMORY_FAILURE=3Dy
&#43;CONFIG_ACPI_APEI_EINJ=3Dy
&#43;CONFIG_VIRTUALIZATION=3Dy
&#43;CONFIG_KVM=3Dy
&#43;CONFIG_ARM64_CRYPTO=3Dy
&#43;CONFIG_CRYPTO_SHA1_ARM64_CE=3Dy
&#43;CONFIG_CRYPTO_SHA2_ARM64_CE=3Dy
&#43;CONFIG_CRYPTO_SHA512_ARM64_CE=3Dm
&#43;CONFIG_CRYPTO_SHA3_ARM64=3Dm
&#43;CONFIG_CRYPTO_SM3_ARM64_CE=3Dm
&#43;CONFIG_CRYPTO_GHASH_ARM64_CE=3Dy
&#43;CONFIG_CRYPTO_CRCT10DIF_ARM64_CE=3Dm
&#43;CONFIG_CRYPTO_CRC32_ARM64_CE=3Dm
&#43;CONFIG_CRYPTO_AES_ARM64_CE_CCM=3Dy
&#43;CONFIG_CRYPTO_AES_ARM64_CE_BLK=3Dy
&#43;CONFIG_CRYPTO_CHACHA20_NEON=3Dm
&#43;CONFIG_CRYPTO_AES_ARM64_BS=3Dm
&#43;CONFIG_KPROBES=3Dy
&#43;CONFIG_JUMP_LABEL=3Dy
&#43;CONFIG_MODULES=3Dy
&#43;CONFIG_MODULE_UNLOAD=3Dy
&#43;CONFIG_MODVERSIONS=3Dy
&#43;# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
&#43;CONFIG_MEMORY_FAILURE=3Dy
&#43;CONFIG_TRANSPARENT_HUGEPAGE=3Dy
&#43;CONFIG_CMA=3Dy
&#43;CONFIG_NET=3Dy
&#43;CONFIG_PACKET=3Dy
&#43;CONFIG_UNIX=3Dy
&#43;CONFIG_XFRM_USER=3Dy
&#43;CONFIG_XFRM_INTERFACE=3Dy
&#43;CONFIG_XFRM_STATISTICS=3Dy
&#43;CONFIG_NET_KEY=3Dy
&#43;CONFIG_INET=3Dy
&#43;CONFIG_IP_MULTICAST=3Dy
&#43;CONFIG_IP_ADVANCED_ROUTER=3Dy
&#43;CONFIG_IP_MULTIPLE_TABLES=3Dy
&#43;CONFIG_IP_PNP=3Dy
&#43;CONFIG_IP_PNP_DHCP=3Dy
&#43;CONFIG_IP_PNP_BOOTP=3Dy
&#43;CONFIG_NET_IPGRE_DEMUX=3Dy
&#43;CONFIG_NET_IPVTI=3Dy
&#43;CONFIG_INET_ESP=3Dy
&#43;CONFIG_INET_UDP_DIAG=3Dy
&#43;CONFIG_INET_DIAG_DESTROY=3Dy
&#43;CONFIG_IPV6_ROUTER_PREF=3Dy
&#43;CONFIG_IPV6_ROUTE_INFO=3Dy
&#43;CONFIG_IPV6_OPTIMISTIC_DAD=3Dy
&#43;CONFIG_INET6_ESP=3Dy
&#43;CONFIG_INET6_IPCOMP=3Dy
&#43;CONFIG_IPV6_MIP6=3Dy
&#43;CONFIG_IPV6_VTI=3Dy
&#43;CONFIG_IPV6_MULTIPLE_TABLES=3Dy
&#43;CONFIG_NETFILTER=3Dy
&#43;CONFIG_NF_CONNTRACK=3Dy
&#43;CONFIG_NF_CONNTRACK_SECMARK=3Dy
&#43;CONFIG_NF_CONNTRACK_EVENTS=3Dy
&#43;CONFIG_NF_CONNTRACK_AMANDA=3Dy
&#43;CONFIG_NF_CONNTRACK_FTP=3Dy
&#43;CONFIG_NF_CONNTRACK_H323=3Dy
&#43;CONFIG_NF_CONNTRACK_IRC=3Dy
&#43;CONFIG_NF_CONNTRACK_NETBIOS_NS=3Dy
&#43;CONFIG_NF_CONNTRACK_PPTP=3Dy
&#43;CONFIG_NF_CONNTRACK_SANE=3Dy
&#43;CONFIG_NF_CONNTRACK_TFTP=3Dy
&#43;CONFIG_NF_CT_NETLINK=3Dy
&#43;CONFIG_NETFILTER_XT_TARGET_CHECKSUM=3Dm
&#43;CONFIG_NETFILTER_XT_TARGET_CLASSIFY=3Dy
&#43;CONFIG_NETFILTER_XT_TARGET_CONNMARK=3Dy
&#43;CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=3Dy
&#43;CONFIG_NETFILTER_XT_TARGET_CT=3Dy
&#43;CONFIG_NETFILTER_XT_TARGET_IDLETIMER=3Dy
&#43;CONFIG_NETFILTER_XT_TARGET_LOG=3Dm
&#43;CONFIG_NETFILTER_XT_TARGET_MARK=3Dy
&#43;CONFIG_NETFILTER_XT_TARGET_NFLOG=3Dy
&#43;CONFIG_NETFILTER_XT_TARGET_NFQUEUE=3Dy
&#43;CONFIG_NETFILTER_XT_TARGET_TPROXY=3Dy
&#43;CONFIG_NETFILTER_XT_TARGET_TRACE=3Dy
&#43;CONFIG_NETFILTER_XT_TARGET_SECMARK=3Dy
&#43;CONFIG_NETFILTER_XT_TARGET_TCPMSS=3Dy
&#43;CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=3Dm
&#43;CONFIG_NETFILTER_XT_MATCH_BPF=3Dy
&#43;CONFIG_NETFILTER_XT_MATCH_COMMENT=3Dy
&#43;CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=3Dy
&#43;CONFIG_NETFILTER_XT_MATCH_CONNMARK=3Dy
&#43;CONFIG_NETFILTER_XT_MATCH_CONNTRACK=3Dy
&#43;CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=3Dy
&#43;CONFIG_NETFILTER_XT_MATCH_HELPER=3Dy
&#43;CONFIG_NETFILTER_XT_MATCH_IPRANGE=3Dy
&#43;CONFIG_NETFILTER_XT_MATCH_LENGTH=3Dy
&#43;CONFIG_NETFILTER_XT_MATCH_LIMIT=3Dy
&#43;CONFIG_NETFILTER_XT_MATCH_MAC=3Dy
&#43;CONFIG_NETFILTER_XT_MATCH_MARK=3Dy
&#43;CONFIG_NETFILTER_XT_MATCH_OWNER=3Dy
&#43;CONFIG_NETFILTER_XT_MATCH_POLICY=3Dy
&#43;CONFIG_NETFILTER_XT_MATCH_PKTTYPE=3Dy
&#43;CONFIG_NETFILTER_XT_MATCH_QUOTA=3Dy
&#43;CONFIG_NETFILTER_XT_MATCH_QUOTA2=3Dy
&#43;CONFIG_NETFILTER_XT_MATCH_SOCKET=3Dy
&#43;CONFIG_NETFILTER_XT_MATCH_STATE=3Dy
&#43;CONFIG_NETFILTER_XT_MATCH_STATISTIC=3Dy
&#43;CONFIG_NETFILTER_XT_MATCH_STRING=3Dy
&#43;CONFIG_NETFILTER_XT_MATCH_TIME=3Dy
&#43;CONFIG_NETFILTER_XT_MATCH_U32=3Dy
&#43;CONFIG_IP_NF_IPTABLES=3Dy
&#43;CONFIG_IP_NF_MATCH_ECN=3Dy
&#43;CONFIG_IP_NF_MATCH_TTL=3Dy
&#43;CONFIG_IP_NF_FILTER=3Dy
&#43;CONFIG_IP_NF_TARGET_REJECT=3Dy
&#43;CONFIG_IP_NF_NAT=3Dy
&#43;CONFIG_IP_NF_TARGET_MASQUERADE=3Dy
&#43;CONFIG_IP_NF_TARGET_NETMAP=3Dy
&#43;CONFIG_IP_NF_TARGET_REDIRECT=3Dy
&#43;CONFIG_IP_NF_MANGLE=3Dy
&#43;CONFIG_IP_NF_RAW=3Dy
&#43;CONFIG_IP_NF_SECURITY=3Dy
&#43;CONFIG_IP_NF_ARPTABLES=3Dy
&#43;CONFIG_IP_NF_ARPFILTER=3Dy
&#43;CONFIG_IP_NF_ARP_MANGLE=3Dy
&#43;CONFIG_IP6_NF_IPTABLES=3Dy
&#43;CONFIG_IP6_NF_MATCH_RPFILTER=3Dy
&#43;CONFIG_IP6_NF_FILTER=3Dy
&#43;CONFIG_IP6_NF_TARGET_REJECT=3Dy
&#43;CONFIG_IP6_NF_MANGLE=3Dy
&#43;CONFIG_IP6_NF_RAW=3Dy
&#43;CONFIG_L2TP=3Dy
&#43;CONFIG_BRIDGE=3Dm
&#43;CONFIG_BRIDGE_VLAN_FILTERING=3Dy
&#43;CONFIG_VLAN_8021Q=3Dm
&#43;CONFIG_VLAN_8021Q_GVRP=3Dy
&#43;CONFIG_VLAN_8021Q_MVRP=3Dy
&#43;CONFIG_NET_SCHED=3Dy
&#43;CONFIG_NET_SCH_HTB=3Dy
&#43;CONFIG_NET_SCH_NETEM=3Dy
&#43;CONFIG_NET_SCH_INGRESS=3Dy
&#43;CONFIG_NET_CLS_U32=3Dy
&#43;CONFIG_NET_CLS_BPF=3Dy
&#43;CONFIG_NET_EMATCH=3Dy
&#43;CONFIG_NET_EMATCH_U32=3Dy
&#43;CONFIG_NET_CLS_ACT=3Dy
&#43;CONFIG_BPF_JIT=3Dy
&#43;CONFIG_BT=3Dm
&#43;CONFIG_BT_HIDP=3Dm
&#43;# CONFIG_BT_HS is not set
&#43;# CONFIG_BT_LE is not set
&#43;CONFIG_BT_LEDS=3Dy
&#43;# CONFIG_BT_DEBUGFS is not set
&#43;CONFIG_BT_HCIBTUSB=3Dm
&#43;CONFIG_BT_HCIUART=3Dm
&#43;CONFIG_BT_HCIUART_LL=3Dy
&#43;CONFIG_BT_HCIUART_BCM=3Dy
&#43;CONFIG_CFG80211=3Dm
&#43;CONFIG_MAC80211=3Dm
&#43;CONFIG_MAC80211_LEDS=3Dy
&#43;CONFIG_RFKILL=3Dm
&#43;CONFIG_NET_9P=3Dy
&#43;CONFIG_NET_9P_VIRTIO=3Dy
&#43;CONFIG_UEVENT_HELPER_PATH=3D&quot;/sbin/hotplug&quot;
&#43;CONFIG_DEVTMPFS=3Dy
&#43;CONFIG_DEVTMPFS_MOUNT=3Dy
&#43;CONFIG_DMA_CMA=3Dy
&#43;CONFIG_CMA_SIZE_MBYTES=3D32
&#43;CONFIG_HISILICON_LPC=3Dy
&#43;CONFIG_SIMPLE_PM_BUS=3Dy
&#43;CONFIG_MTD=3Dy
&#43;CONFIG_MTD_BLOCK=3Dy
&#43;CONFIG_MTD_M25P80=3Dy
&#43;CONFIG_MTD_NAND=3Dy
&#43;CONFIG_MTD_NAND_DENALI_DT=3Dy
&#43;CONFIG_MTD_NAND_MARVELL=3Dy
&#43;CONFIG_MTD_NAND_QCOM=3Dy
&#43;CONFIG_MTD_SPI_NOR=3Dy
&#43;CONFIG_BLK_DEV_LOOP=3Dy
&#43;CONFIG_BLK_DEV_NBD=3Dm
&#43;CONFIG_BLK_DEV_RAM=3Dy
&#43;CONFIG_BLK_DEV_RAM_SIZE=3D8192
&#43;CONFIG_VIRTIO_BLK=3Dy
&#43;CONFIG_BLK_DEV_NVME=3Dm
&#43;CONFIG_SRAM=3Dy
&#43;CONFIG_UID_SYS_STATS=3Dy
&#43;CONFIG_EEPROM_AT25=3Dm
&#43;# CONFIG_SCSI_PROC_FS is not set
&#43;CONFIG_BLK_DEV_SD=3Dy
&#43;CONFIG_SCSI_SAS_ATA=3Dy
&#43;CONFIG_SCSI_HISI_SAS=3Dy
&#43;CONFIG_SCSI_HISI_SAS_PCI=3Dy
&#43;CONFIG_SCSI_UFSHCD=3Dm
&#43;CONFIG_SCSI_UFSHCD_PLATFORM=3Dm
&#43;CONFIG_SCSI_UFS_QCOM=3Dm
&#43;CONFIG_SCSI_UFS_HISI=3Dm
&#43;CONFIG_ATA=3Dy
&#43;CONFIG_SATA_AHCI=3Dy
&#43;CONFIG_SATA_AHCI_PLATFORM=3Dy
&#43;CONFIG_AHCI_CEVA=3Dy
&#43;CONFIG_AHCI_MVEBU=3Dy
&#43;CONFIG_AHCI_XGENE=3Dy
&#43;CONFIG_AHCI_QORIQ=3Dy
&#43;CONFIG_SATA_SIL24=3Dy
&#43;CONFIG_SATA_RCAR=3Dy
&#43;CONFIG_PATA_PLATFORM=3Dy
&#43;CONFIG_PATA_OF_PLATFORM=3Dy
&#43;CONFIG_MD=3Dy
&#43;CONFIG_BLK_DEV_DM=3Dy
&#43;CONFIG_DM_CRYPT=3Dy
&#43;CONFIG_DM_SNAPSHOT=3Dy
&#43;CONFIG_DM_UEVENT=3Dy
&#43;CONFIG_DM_VERITY=3Dy
&#43;CONFIG_DM_VERITY_FEC=3Dy
&#43;CONFIG_DM_BOW=3Dy
&#43;CONFIG_NETDEVICES=3Dy
&#43;CONFIG_MACVLAN=3Dm
&#43;CONFIG_MACVTAP=3Dm
&#43;CONFIG_TUN=3Dy
&#43;CONFIG_VETH=3Dm
&#43;CONFIG_VIRTIO_NET=3Dy
&#43;CONFIG_AMD_XGBE=3Dy
&#43;CONFIG_NET_XGENE=3Dy
&#43;CONFIG_ATL1C=3Dm
&#43;CONFIG_MACB=3Dy
&#43;CONFIG_THUNDER_NIC_PF=3Dy
&#43;CONFIG_HIX5HD2_GMAC=3Dy
&#43;CONFIG_HNS_DSAF=3Dy
&#43;CONFIG_HNS_ENET=3Dy
&#43;CONFIG_E1000E=3Dy
&#43;CONFIG_IGB=3Dy
&#43;CONFIG_IGBVF=3Dy
&#43;CONFIG_MVNETA=3Dy
&#43;CONFIG_MVPP2=3Dy
&#43;CONFIG_SKY2=3Dy
&#43;CONFIG_QCOM_EMAC=3Dm
&#43;CONFIG_RAVB=3Dy
&#43;CONFIG_SMC91X=3Dy
&#43;CONFIG_SMSC911X=3Dy
&#43;CONFIG_SNI_AVE=3Dy
&#43;CONFIG_SNI_NETSEC=3Dy
&#43;CONFIG_STMMAC_ETH=3Dm
&#43;CONFIG_MDIO_BUS_MUX_MMIOREG=3Dy
&#43;CONFIG_AT803X_PHY=3Dm
&#43;CONFIG_MARVELL_PHY=3Dm
&#43;CONFIG_MARVELL_10G_PHY=3Dm
&#43;CONFIG_MESON_GXL_PHY=3Dm
&#43;CONFIG_MICREL_PHY=3Dy
&#43;CONFIG_REALTEK_PHY=3Dm
&#43;CONFIG_ROCKCHIP_PHY=3Dy
&#43;CONFIG_PPP=3Dy
&#43;CONFIG_PPP_BSDCOMP=3Dy
&#43;CONFIG_PPP_DEFLATE=3Dy
&#43;CONFIG_PPP_MPPE=3Dy
&#43;CONFIG_PPTP=3Dy
&#43;CONFIG_PPPOL2TP=3Dy
&#43;CONFIG_USB_PEGASUS=3Dm
&#43;CONFIG_USB_RTL8150=3Dm
&#43;CONFIG_USB_RTL8152=3Dy
&#43;CONFIG_USB_LAN78XX=3Dm
&#43;CONFIG_USB_USBNET=3Dy
&#43;CONFIG_USB_NET_DM9601=3Dm
&#43;CONFIG_USB_NET_SR9800=3Dm
&#43;CONFIG_USB_NET_SMSC75XX=3Dm
&#43;CONFIG_USB_NET_SMSC95XX=3Dm
&#43;CONFIG_USB_NET_PLUSB=3Dm
&#43;CONFIG_USB_NET_MCS7830=3Dm
&#43;CONFIG_ATH10K=3Dm
&#43;CONFIG_ATH10K_PCI=3Dm
&#43;CONFIG_BRCMFMAC=3Dm
&#43;CONFIG_MWIFIEX=3Dm
&#43;CONFIG_MWIFIEX_PCIE=3Dm
&#43;CONFIG_WL18XX=3Dm
&#43;CONFIG_WLCORE_SDIO=3Dm
&#43;CONFIG_INPUT_EVDEV=3Dy
&#43;CONFIG_KEYBOARD_ADC=3Dm
&#43;CONFIG_KEYBOARD_GPIO=3Dy
&#43;CONFIG_KEYBOARD_CROS_EC=3Dy
&#43;# CONFIG_INPUT_MOUSE is not set
&#43;CONFIG_INPUT_JOYSTICK=3Dy
&#43;CONFIG_JOYSTICK_XPAD=3Dy
&#43;CONFIG_JOYSTICK_XPAD_FF=3Dy
&#43;CONFIG_JOYSTICK_XPAD_LEDS=3Dy
&#43;CONFIG_INPUT_TABLET=3Dy
&#43;CONFIG_TABLET_USB_ACECAD=3Dy
&#43;CONFIG_TABLET_USB_AIPTEK=3Dy
&#43;CONFIG_TABLET_USB_GTCO=3Dy
&#43;CONFIG_TABLET_USB_HANWANG=3Dy
&#43;CONFIG_TABLET_USB_KBTAB=3Dy
&#43;CONFIG_INPUT_TOUCHSCREEN=3Dy
&#43;CONFIG_TOUCHSCREEN_ATMEL_MXT=3Dm
&#43;CONFIG_INPUT_MISC=3Dy
&#43;CONFIG_INPUT_PM8941_PWRKEY=3Dy
&#43;CONFIG_INPUT_UINPUT=3Dy
&#43;CONFIG_INPUT_HISI_POWERKEY=3Dy
&#43;# CONFIG_SERIO_SERPORT is not set
&#43;CONFIG_SERIO_AMBAKMI=3Dy
&#43;# CONFIG_VT is not set
&#43;# CONFIG_LEGACY_PTYS is not set
&#43;# CONFIG_DEVMEM is not set
&#43;CONFIG_SERIAL_8250=3Dy
&#43;CONFIG_SERIAL_8250_CONSOLE=3Dy
&#43;CONFIG_SERIAL_8250_EXTENDED=3Dy
&#43;CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
&#43;CONFIG_SERIAL_8250_BCM2835AUX=3Dy
&#43;CONFIG_SERIAL_8250_DW=3Dy
&#43;CONFIG_SERIAL_8250_MT6577=3Dy
&#43;CONFIG_SERIAL_8250_UNIPHIER=3Dy
&#43;CONFIG_SERIAL_OF_PLATFORM=3Dy
&#43;CONFIG_SERIAL_AMBA_PL011=3Dy
&#43;CONFIG_SERIAL_AMBA_PL011_CONSOLE=3Dy
&#43;CONFIG_SERIAL_MESON=3Dy
&#43;CONFIG_SERIAL_MESON_CONSOLE=3Dy
&#43;CONFIG_SERIAL_SAMSUNG=3Dy
&#43;CONFIG_SERIAL_SAMSUNG_CONSOLE=3Dy
&#43;CONFIG_SERIAL_TEGRA=3Dy
&#43;CONFIG_SERIAL_SH_SCI=3Dy
&#43;CONFIG_SERIAL_MSM=3Dy
&#43;CONFIG_SERIAL_MSM_CONSOLE=3Dy
&#43;CONFIG_SERIAL_XILINX_PS_UART=3Dy
&#43;CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=3Dy
&#43;CONFIG_SERIAL_MVEBU_UART=3Dy
&#43;CONFIG_SERIAL_DEV_BUS=3Dy
&#43;CONFIG_VIRTIO_CONSOLE=3Dy
&#43;CONFIG_TCG_TPM=3Dy
&#43;CONFIG_TCG_TIS_I2C_INFINEON=3Dy
&#43;CONFIG_I2C_CHARDEV=3Dy
&#43;CONFIG_I2C_MUX_PCA954x=3Dy
&#43;CONFIG_I2C_BCM2835=3Dm
&#43;CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
&#43;CONFIG_I2C_IMX=3Dy
&#43;CONFIG_I2C_MESON=3Dy
&#43;CONFIG_I2C_MV64XXX=3Dy
&#43;CONFIG_I2C_PXA=3Dy
&#43;CONFIG_I2C_QUP=3Dy
&#43;CONFIG_I2C_RK3X=3Dy
&#43;CONFIG_I2C_SH_MOBILE=3Dy
&#43;CONFIG_I2C_TEGRA=3Dy
&#43;CONFIG_I2C_UNIPHIER_F=3Dy
&#43;CONFIG_I2C_VERSATILE=3Dy
&#43;CONFIG_I2C_RCAR=3Dy
&#43;CONFIG_I2C_CROS_EC_TUNNEL=3Dy
&#43;CONFIG_SPI=3Dy
&#43;CONFIG_SPI_ARMADA_3700=3Dy
&#43;CONFIG_SPI_BCM2835=3Dm
&#43;CONFIG_SPI_BCM2835AUX=3Dm
&#43;CONFIG_SPI_MESON_SPICC=3Dm
&#43;CONFIG_SPI_MESON_SPIFC=3Dm
&#43;CONFIG_SPI_ORION=3Dy
&#43;CONFIG_SPI_PL022=3Dy
&#43;CONFIG_SPI_ROCKCHIP=3Dy
&#43;CONFIG_SPI_QUP=3Dy
&#43;CONFIG_SPI_S3C64XX=3Dy
&#43;CONFIG_SPI_SPIDEV=3Dm
&#43;CONFIG_SPMI=3Dy
&#43;CONFIG_PINCTRL_SINGLE=3Dy
&#43;CONFIG_PINCTRL_MAX77620=3Dy
&#43;CONFIG_PINCTRL_IPQ8074=3Dy
&#43;CONFIG_PINCTRL_MSM8916=3Dy
&#43;CONFIG_PINCTRL_MSM8994=3Dy
&#43;CONFIG_PINCTRL_MSM8996=3Dy
&#43;CONFIG_PINCTRL_QDF2XXX=3Dy
&#43;CONFIG_PINCTRL_QCOM_SPMI_PMIC=3Dy
&#43;CONFIG_PINCTRL_MT7622=3Dy
&#43;CONFIG_GPIO_DWAPB=3Dy
&#43;CONFIG_GPIO_MB86S7X=3Dy
&#43;CONFIG_GPIO_PL061=3Dy
&#43;CONFIG_GPIO_RCAR=3Dy
&#43;CONFIG_GPIO_UNIPHIER=3Dy
&#43;CONFIG_GPIO_XGENE=3Dy
&#43;CONFIG_GPIO_XGENE_SB=3Dy
&#43;CONFIG_GPIO_PCA953X=3Dy
&#43;CONFIG_GPIO_PCA953X_IRQ=3Dy
&#43;CONFIG_GPIO_MAX77620=3Dy
&#43;CONFIG_POWER_AVS=3Dy
&#43;CONFIG_ROCKCHIP_IODOMAIN=3Dy
&#43;CONFIG_POWER_RESET_MSM=3Dy
&#43;CONFIG_POWER_RESET_XGENE=3Dy
&#43;CONFIG_POWER_RESET_SYSCON=3Dy
&#43;CONFIG_SYSCON_REBOOT_MODE=3Dy
&#43;CONFIG_BATTERY_SBS=3Dm
&#43;CONFIG_BATTERY_BQ27XXX=3Dy
&#43;CONFIG_SENSORS_ARM_SCPI=3Dy
&#43;CONFIG_SENSORS_LM90=3Dm
&#43;CONFIG_SENSORS_RASPBERRYPI_HWMON=3Dm
&#43;CONFIG_SENSORS_INA2XX=3Dm
&#43;CONFIG_THERMAL_GOV_POWER_ALLOCATOR=3Dy
&#43;CONFIG_CPU_THERMAL=3Dy
&#43;CONFIG_THERMAL_EMULATION=3Dy
&#43;CONFIG_ROCKCHIP_THERMAL=3Dm
&#43;CONFIG_RCAR_GEN3_THERMAL=3Dy
&#43;CONFIG_ARMADA_THERMAL=3Dy
&#43;CONFIG_BRCMSTB_THERMAL=3Dm
&#43;CONFIG_EXYNOS_THERMAL=3Dy
&#43;CONFIG_TEGRA_BPMP_THERMAL=3Dm
&#43;CONFIG_QCOM_TSENS=3Dy
&#43;CONFIG_UNIPHIER_THERMAL=3Dy
&#43;CONFIG_WATCHDOG=3Dy
&#43;CONFIG_ARM_SP805_WATCHDOG=3Dy
&#43;CONFIG_S3C2410_WATCHDOG=3Dy
&#43;CONFIG_MESON_GXBB_WATCHDOG=3Dm
&#43;CONFIG_MESON_WATCHDOG=3Dm
&#43;CONFIG_RENESAS_WDT=3Dy
&#43;CONFIG_UNIPHIER_WATCHDOG=3Dy
&#43;CONFIG_BCM2835_WDT=3Dy
&#43;CONFIG_MFD_BD9571MWV=3Dy
&#43;CONFIG_MFD_AXP20X_RSB=3Dy
&#43;CONFIG_MFD_CROS_EC=3Dy
&#43;CONFIG_MFD_CROS_EC_CHARDEV=3Dm
&#43;CONFIG_MFD_EXYNOS_LPASS=3Dm
&#43;CONFIG_MFD_HI6421_PMIC=3Dy
&#43;CONFIG_MFD_HI655X_PMIC=3Dy
&#43;CONFIG_MFD_MAX77620=3Dy
&#43;CONFIG_MFD_SPMI_PMIC=3Dy
&#43;CONFIG_MFD_RK808=3Dy
&#43;CONFIG_MFD_SEC_CORE=3Dy
&#43;CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
&#43;CONFIG_REGULATOR_AXP20X=3Dy
&#43;CONFIG_REGULATOR_BD9571MWV=3Dy
&#43;CONFIG_REGULATOR_FAN53555=3Dy
&#43;CONFIG_REGULATOR_GPIO=3Dy
&#43;CONFIG_REGULATOR_HI6421V530=3Dy
&#43;CONFIG_REGULATOR_HI655X=3Dy
&#43;CONFIG_REGULATOR_MAX77620=3Dy
&#43;CONFIG_REGULATOR_PWM=3Dy
&#43;CONFIG_REGULATOR_QCOM_SMD_RPM=3Dy
&#43;CONFIG_REGULATOR_QCOM_SPMI=3Dy
&#43;CONFIG_REGULATOR_RK808=3Dy
&#43;CONFIG_REGULATOR_S2MPS11=3Dy
&#43;CONFIG_REGULATOR_VCTRL=3Dm
&#43;CONFIG_RC_CORE=3Dm
&#43;CONFIG_RC_DECODERS=3Dy
&#43;CONFIG_RC_DEVICES=3Dy
&#43;CONFIG_IR_MESON=3Dm
&#43;CONFIG_MEDIA_SUPPORT=3Dy
&#43;CONFIG_MEDIA_CAMERA_SUPPORT=3Dy
&#43;CONFIG_MEDIA_ANALOG_TV_SUPPORT=3Dy
&#43;CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
&#43;CONFIG_MEDIA_CONTROLLER=3Dy
&#43;CONFIG_VIDEO_V4L2_SUBDEV_API=3Dy
&#43;# CONFIG_DVB_NET is not set
&#43;CONFIG_MEDIA_USB_SUPPORT=3Dy
&#43;CONFIG_USB_VIDEO_CLASS=3Dm
&#43;CONFIG_V4L_MEM2MEM_DRIVERS=3Dy
&#43;CONFIG_VIDEO_SAMSUNG_S5P_JPEG=3Dm
&#43;CONFIG_VIDEO_SAMSUNG_S5P_MFC=3Dm
&#43;CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=3Dm
&#43;CONFIG_VIDEO_RENESAS_FCP=3Dm
&#43;CONFIG_VIDEO_RENESAS_VSP1=3Dm
&#43;CONFIG_DRM=3Dy
&#43;CONFIG_DRM_LOAD_EDID_FIRMWARE=3Dy
&#43;CONFIG_DRM_I2C_NXP_TDA998X=3Dy
&#43;CONFIG_DRM_HDLCD=3Dy
&#43;CONFIG_DRM_NOUVEAU=3Dm
&#43;CONFIG_DRM_VIRT_ENCODER=3Dy
&#43;CONFIG_DRM_EXYNOS=3Dm
&#43;CONFIG_DRM_EXYNOS5433_DECON=3Dy
&#43;CONFIG_DRM_EXYNOS7_DECON=3Dy
&#43;CONFIG_DRM_EXYNOS_DSI=3Dy
&#43;# CONFIG_DRM_EXYNOS_DP is not set
&#43;CONFIG_DRM_EXYNOS_HDMI=3Dy
&#43;CONFIG_DRM_EXYNOS_MIC=3Dy
&#43;CONFIG_DRM_ROCKCHIP=3Dm
&#43;CONFIG_ROCKCHIP_ANALOGIX_DP=3Dy
&#43;CONFIG_ROCKCHIP_CDN_DP=3Dy
&#43;CONFIG_ROCKCHIP_DW_HDMI=3Dy
&#43;CONFIG_ROCKCHIP_DW_MIPI_DSI=3Dy
&#43;CONFIG_ROCKCHIP_INNO_HDMI=3Dy
&#43;CONFIG_DRM_RCAR_DU=3Dm
&#43;CONFIG_DRM_RCAR_LVDS=3Dm
&#43;CONFIG_DRM_TEGRA=3Dm
&#43;CONFIG_DRM_PANEL_SIMPLE=3Dm
&#43;CONFIG_DRM_I2C_ADV7511=3Dm
&#43;CONFIG_DRM_VC4=3Dm
&#43;CONFIG_DRM_HISI_HIBMC=3Dm
&#43;CONFIG_DRM_HISI_KIRIN=3Dm
&#43;CONFIG_DRM_MESON=3Dm
&#43;CONFIG_FB_ARMCLCD=3Dy
&#43;CONFIG_BACKLIGHT_GENERIC=3Dm
&#43;CONFIG_BACKLIGHT_PWM=3Dm
&#43;CONFIG_BACKLIGHT_LP855X=3Dm
&#43;CONFIG_LOGO=3Dy
&#43;# CONFIG_LOGO_LINUX_MONO is not set
&#43;# CONFIG_LOGO_LINUX_VGA16 is not set
&#43;CONFIG_SOUND=3Dy
&#43;CONFIG_SND=3Dy
&#43;CONFIG_SND_SOC=3Dy
&#43;CONFIG_SND_BCM2835_SOC_I2S=3Dm
&#43;CONFIG_SND_SOC_ROCKCHIP=3Dm
&#43;CONFIG_SND_SOC_ROCKCHIP_SPDIF=3Dm
&#43;CONFIG_SND_SOC_ROCKCHIP_RT5645=3Dm
&#43;CONFIG_SND_SOC_RK3399_GRU_SOUND=3Dm
&#43;CONFIG_SND_SOC_SAMSUNG=3Dy
&#43;CONFIG_SND_SOC_RCAR=3Dm
&#43;CONFIG_SND_SOC_AK4613=3Dm
&#43;CONFIG_SND_SIMPLE_CARD=3Dm
&#43;CONFIG_SND_AUDIO_GRAPH_CARD=3Dm
&#43;CONFIG_HIDRAW=3Dy
&#43;CONFIG_UHID=3Dy
&#43;CONFIG_HID_A4TECH=3Dy
&#43;CONFIG_HID_ACRUX=3Dy
&#43;CONFIG_HID_ACRUX_FF=3Dy
&#43;CONFIG_HID_APPLE=3Dy
&#43;CONFIG_HID_BELKIN=3Dy
&#43;CONFIG_HID_CHERRY=3Dy
&#43;CONFIG_HID_CHICONY=3Dy
&#43;CONFIG_HID_PRODIKEYS=3Dy
&#43;CONFIG_HID_CYPRESS=3Dy
&#43;CONFIG_HID_DRAGONRISE=3Dy
&#43;CONFIG_DRAGONRISE_FF=3Dy
&#43;CONFIG_HID_EMS_FF=3Dy
&#43;CONFIG_HID_ELECOM=3Dy
&#43;CONFIG_HID_EZKEY=3Dy
&#43;CONFIG_HID_HOLTEK=3Dy
&#43;CONFIG_HID_KEYTOUCH=3Dy
&#43;CONFIG_HID_KYE=3Dy
&#43;CONFIG_HID_UCLOGIC=3Dy
&#43;CONFIG_HID_WALTOP=3Dy
&#43;CONFIG_HID_GYRATION=3Dy
&#43;CONFIG_HID_TWINHAN=3Dy
&#43;CONFIG_HID_KENSINGTON=3Dy
&#43;CONFIG_HID_LCPOWER=3Dy
&#43;CONFIG_HID_LOGITECH=3Dy
&#43;CONFIG_HID_LOGITECH_DJ=3Dy
&#43;CONFIG_LOGITECH_FF=3Dy
&#43;CONFIG_LOGIRUMBLEPAD2_FF=3Dy
&#43;CONFIG_LOGIG940_FF=3Dy
&#43;CONFIG_HID_MAGICMOUSE=3Dy
&#43;CONFIG_HID_MICROSOFT=3Dy
&#43;CONFIG_HID_MONTEREY=3Dy
&#43;CONFIG_HID_MULTITOUCH=3Dy
&#43;CONFIG_HID_NTRIG=3Dy
&#43;CONFIG_HID_ORTEK=3Dy
&#43;CONFIG_HID_PANTHERLORD=3Dy
&#43;CONFIG_PANTHERLORD_FF=3Dy
&#43;CONFIG_HID_PETALYNX=3Dy
&#43;CONFIG_HID_PICOLCD=3Dy
&#43;CONFIG_HID_PRIMAX=3Dy
&#43;CONFIG_HID_ROCCAT=3Dy
&#43;CONFIG_HID_SAITEK=3Dy
&#43;CONFIG_HID_SAMSUNG=3Dy
&#43;CONFIG_HID_SONY=3Dy
&#43;CONFIG_HID_SPEEDLINK=3Dy
&#43;CONFIG_HID_SUNPLUS=3Dy
&#43;CONFIG_HID_GREENASIA=3Dy
&#43;CONFIG_GREENASIA_FF=3Dy
&#43;CONFIG_HID_SMARTJOYPLUS=3Dy
&#43;CONFIG_SMARTJOYPLUS_FF=3Dy
&#43;CONFIG_HID_TIVO=3Dy
&#43;CONFIG_HID_TOPSEED=3Dy
&#43;CONFIG_HID_THRUSTMASTER=3Dy
&#43;CONFIG_HID_WACOM=3Dy
&#43;CONFIG_HID_WIIMOTE=3Dy
&#43;CONFIG_HID_ZEROPLUS=3Dy
&#43;CONFIG_HID_ZYDACRON=3Dy
&#43;CONFIG_USB_HIDDEV=3Dy
&#43;CONFIG_I2C_HID=3Dm
&#43;CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
&#43;CONFIG_USB_OTG=3Dy
&#43;CONFIG_USB_XHCI_HCD=3Dy
&#43;CONFIG_USB_XHCI_TEGRA=3Dy
&#43;CONFIG_USB_EHCI_HCD=3Dy
&#43;CONFIG_USB_EHCI_EXYNOS=3Dy
&#43;CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
&#43;CONFIG_USB_OHCI_HCD=3Dy
&#43;CONFIG_USB_OHCI_EXYNOS=3Dy
&#43;CONFIG_USB_OHCI_HCD_PLATFORM=3Dy
&#43;CONFIG_USB_RENESAS_USBHS=3Dm
&#43;CONFIG_USB_STORAGE=3Dy
&#43;CONFIG_USB_MUSB_HDRC=3Dy
&#43;CONFIG_USB_MUSB_SUNXI=3Dy
&#43;CONFIG_USB_DWC3=3Dy
&#43;CONFIG_USB_DWC2=3Dy
&#43;CONFIG_USB_CHIPIDEA=3Dy
&#43;CONFIG_USB_CHIPIDEA_UDC=3Dy
&#43;CONFIG_USB_CHIPIDEA_HOST=3Dy
&#43;CONFIG_USB_ISP1760=3Dy
&#43;CONFIG_USB_HSIC_USB3503=3Dy
&#43;CONFIG_NOP_USB_XCEIV=3Dy
&#43;CONFIG_USB_ULPI=3Dy
&#43;CONFIG_USB_GADGET=3Dy
&#43;CONFIG_USB_RENESAS_USBHS_UDC=3Dm
&#43;CONFIG_USB_RENESAS_USB3=3Dm
&#43;CONFIG_USB_CONFIGFS=3Dy
&#43;CONFIG_USB_CONFIGFS_UEVENT=3Dy
&#43;CONFIG_USB_CONFIGFS_F_FS=3Dy
&#43;CONFIG_USB_CONFIGFS_F_ACC=3Dy
&#43;CONFIG_USB_CONFIGFS_F_AUDIO_SRC=3Dy
&#43;CONFIG_USB_CONFIGFS_F_MIDI=3Dy
&#43;CONFIG_MMC=3Dy
&#43;CONFIG_MMC_BLOCK_MINORS=3D32
&#43;CONFIG_MMC_ARMMMCI=3Dy
&#43;CONFIG_MMC_SDHCI=3Dy
&#43;CONFIG_MMC_SDHCI_ACPI=3Dy
&#43;CONFIG_MMC_SDHCI_PLTFM=3Dy
&#43;CONFIG_MMC_SDHCI_OF_ARASAN=3Dy
&#43;CONFIG_MMC_SDHCI_OF_ESDHC=3Dy
&#43;CONFIG_MMC_SDHCI_CADENCE=3Dy
&#43;CONFIG_MMC_SDHCI_TEGRA=3Dy
&#43;CONFIG_MMC_SDHCI_F_SDH30=3Dy
&#43;CONFIG_MMC_MESON_GX=3Dy
&#43;CONFIG_MMC_SDHCI_MSM=3Dy
&#43;CONFIG_MMC_SPI=3Dy
&#43;CONFIG_MMC_SDHI=3Dy
&#43;CONFIG_MMC_DW=3Dy
&#43;CONFIG_MMC_DW_EXYNOS=3Dy
&#43;CONFIG_MMC_DW_HI3798CV200=3Dy
&#43;CONFIG_MMC_DW_K3=3Dy
&#43;CONFIG_MMC_DW_ROCKCHIP=3Dy
&#43;CONFIG_MMC_SUNXI=3Dy
&#43;CONFIG_MMC_BCM2835=3Dy
&#43;CONFIG_MMC_SDHCI_XENON=3Dy
&#43;CONFIG_LEDS_GPIO=3Dy
&#43;CONFIG_LEDS_PWM=3Dy
&#43;CONFIG_LEDS_SYSCON=3Dy
&#43;CONFIG_LEDS_TRIGGER_DISK=3Dy
&#43;CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
&#43;CONFIG_LEDS_TRIGGER_CPU=3Dy
&#43;CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dy
&#43;CONFIG_LEDS_TRIGGER_PANIC=3Dy
&#43;CONFIG_EDAC=3Dy
&#43;CONFIG_EDAC_GHES=3Dy
&#43;CONFIG_RTC_CLASS=3Dy
&#43;CONFIG_RTC_DRV_MAX77686=3Dy
&#43;CONFIG_RTC_DRV_RK808=3Dm
&#43;CONFIG_RTC_DRV_S5M=3Dy
&#43;CONFIG_RTC_DRV_DS3232=3Dy
&#43;CONFIG_RTC_DRV_EFI=3Dy
&#43;CONFIG_RTC_DRV_CROS_EC=3Dy
&#43;CONFIG_RTC_DRV_S3C=3Dy
&#43;CONFIG_RTC_DRV_PL031=3Dy
&#43;CONFIG_RTC_DRV_SUN6I=3Dy
&#43;CONFIG_RTC_DRV_ARMADA38X=3Dy
&#43;CONFIG_RTC_DRV_TEGRA=3Dy
&#43;CONFIG_RTC_DRV_XGENE=3Dy
&#43;CONFIG_DMADEVICES=3Dy
&#43;CONFIG_DMA_BCM2835=3Dm
&#43;CONFIG_K3_DMA=3Dy
&#43;CONFIG_MV_XOR_V2=3Dy
&#43;CONFIG_PL330_DMA=3Dy
&#43;CONFIG_TEGRA20_APB_DMA=3Dy
&#43;CONFIG_QCOM_BAM_DMA=3Dy
&#43;CONFIG_QCOM_HIDMA_MGMT=3Dy
&#43;CONFIG_QCOM_HIDMA=3Dy
&#43;CONFIG_RCAR_DMAC=3Dy
&#43;CONFIG_RENESAS_USB_DMAC=3Dm
&#43;CONFIG_VFIO=3Dy
&#43;CONFIG_VFIO_PCI=3Dy
&#43;CONFIG_VIRTIO_PCI=3Dy
&#43;CONFIG_VIRTIO_BALLOON=3Dy
&#43;CONFIG_VIRTIO_MMIO=3Dy
&#43;CONFIG_XEN_GNTDEV=3Dy
&#43;CONFIG_XEN_GRANT_DEV_ALLOC=3Dy
&#43;CONFIG_STAGING=3Dy
&#43;CONFIG_ASHMEM=3Dy
&#43;CONFIG_ION=3Dy
&#43;CONFIG_CROS_EC_I2C=3Dy
&#43;CONFIG_CROS_EC_SPI=3Dy
&#43;CONFIG_COMMON_CLK_RK808=3Dy
&#43;CONFIG_COMMON_CLK_SCPI=3Dy
&#43;CONFIG_COMMON_CLK_CS2000_CP=3Dy
&#43;CONFIG_COMMON_CLK_S2MPS11=3Dy
&#43;CONFIG_CLK_QORIQ=3Dy
&#43;CONFIG_COMMON_CLK_PWM=3Dy
&#43;CONFIG_COMMON_CLK_QCOM=3Dy
&#43;CONFIG_QCOM_CLK_SMD_RPM=3Dy
&#43;CONFIG_IPQ_GCC_8074=3Dy
&#43;CONFIG_MSM_GCC_8916=3Dy
&#43;CONFIG_MSM_GCC_8994=3Dy
&#43;CONFIG_MSM_MMCC_8996=3Dy
&#43;CONFIG_HWSPINLOCK=3Dy
&#43;CONFIG_HWSPINLOCK_QCOM=3Dy
&#43;CONFIG_ARM_MHU=3Dy
&#43;CONFIG_PLATFORM_MHU=3Dy
&#43;CONFIG_BCM2835_MBOX=3Dy
&#43;CONFIG_QCOM_APCS_IPC=3Dy
&#43;CONFIG_ROCKCHIP_IOMMU=3Dy
&#43;CONFIG_TEGRA_IOMMU_SMMU=3Dy
&#43;CONFIG_ARM_SMMU=3Dy
&#43;CONFIG_ARM_SMMU_V3=3Dy
&#43;CONFIG_QCOM_IOMMU=3Dy
&#43;CONFIG_RPMSG_QCOM_GLINK_RPM=3Dy
&#43;CONFIG_RPMSG_QCOM_SMD=3Dy
&#43;CONFIG_RASPBERRYPI_POWER=3Dy
&#43;CONFIG_QCOM_SMEM=3Dy
&#43;CONFIG_QCOM_SMD_RPM=3Dy
&#43;CONFIG_QCOM_SMP2P=3Dy
&#43;CONFIG_QCOM_SMSM=3Dy
&#43;CONFIG_ROCKCHIP_PM_DOMAINS=3Dy
&#43;CONFIG_ARCH_TEGRA_132_SOC=3Dy
&#43;CONFIG_ARCH_TEGRA_210_SOC=3Dy
&#43;CONFIG_ARCH_TEGRA_186_SOC=3Dy
&#43;CONFIG_ARCH_TEGRA_194_SOC=3Dy
&#43;CONFIG_ARCH_K3_AM6_SOC=3Dy
&#43;CONFIG_SOC_TI=3Dy
&#43;CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dy
&#43;CONFIG_EXTCON_USB_GPIO=3Dy
&#43;CONFIG_EXTCON_USBC_CROS_EC=3Dy
&#43;CONFIG_MEMORY=3Dy
&#43;CONFIG_IIO=3Dy
&#43;CONFIG_EXYNOS_ADC=3Dy
&#43;CONFIG_ROCKCHIP_SARADC=3Dm
&#43;CONFIG_IIO_CROS_EC_SENSORS_CORE=3Dm
&#43;CONFIG_IIO_CROS_EC_SENSORS=3Dm
&#43;CONFIG_IIO_CROS_EC_LIGHT_PROX=3Dm
&#43;CONFIG_IIO_CROS_EC_BARO=3Dm
&#43;CONFIG_PWM=3Dy
&#43;CONFIG_PWM_BCM2835=3Dm
&#43;CONFIG_PWM_CROS_EC=3Dm
&#43;CONFIG_PWM_MESON=3Dm
&#43;CONFIG_PWM_RCAR=3Dm
&#43;CONFIG_PWM_ROCKCHIP=3Dy
&#43;CONFIG_PWM_SAMSUNG=3Dy
&#43;CONFIG_PWM_TEGRA=3Dm
&#43;CONFIG_PHY_XGENE=3Dy
&#43;CONFIG_PHY_SUN4I_USB=3Dy
&#43;CONFIG_PHY_HI6220_USB=3Dy
&#43;CONFIG_PHY_HISTB_COMBPHY=3Dy
&#43;CONFIG_PHY_HISI_INNO_USB2=3Dy
&#43;CONFIG_PHY_MVEBU_CP110_COMPHY=3Dy
&#43;CONFIG_PHY_QCOM_QMP=3Dm
&#43;CONFIG_PHY_QCOM_USB_HS=3Dy
&#43;CONFIG_PHY_RCAR_GEN3_USB2=3Dy
&#43;CONFIG_PHY_RCAR_GEN3_USB3=3Dm
&#43;CONFIG_PHY_ROCKCHIP_EMMC=3Dy
&#43;CONFIG_PHY_ROCKCHIP_INNO_USB2=3Dy
&#43;CONFIG_PHY_ROCKCHIP_PCIE=3Dm
&#43;CONFIG_PHY_ROCKCHIP_TYPEC=3Dy
&#43;CONFIG_PHY_TEGRA_XUSB=3Dy
&#43;CONFIG_HISI_PMU=3Dy
&#43;CONFIG_QCOM_L2_PMU=3Dy
&#43;CONFIG_QCOM_L3_PMU=3Dy
&#43;CONFIG_ANDROID=3Dy
&#43;CONFIG_ANDROID_BINDER_IPC=3Dy
&#43;CONFIG_QCOM_QFPROM=3Dy
&#43;CONFIG_ROCKCHIP_EFUSE=3Dy
&#43;CONFIG_UNIPHIER_EFUSE=3Dy
&#43;CONFIG_MESON_EFUSE=3Dm
&#43;CONFIG_TEE=3Dy
&#43;CONFIG_OPTEE=3Dy
&#43;CONFIG_EXT2_FS=3Dy
&#43;CONFIG_EXT3_FS=3Dy
&#43;CONFIG_EXT4_FS_POSIX_ACL=3Dy
&#43;CONFIG_EXT4_FS_SECURITY=3Dy
&#43;CONFIG_EXT4_ENCRYPTION=3Dy
&#43;CONFIG_BTRFS_FS=3Dm
&#43;CONFIG_BTRFS_FS_POSIX_ACL=3Dy
&#43;CONFIG_F2FS_FS=3Dy
&#43;CONFIG_F2FS_FS_SECURITY=3Dy
&#43;CONFIG_F2FS_FS_ENCRYPTION=3Dy
&#43;CONFIG_FANOTIFY=3Dy
&#43;CONFIG_FANOTIFY_ACCESS_PERMISSIONS=3Dy
&#43;CONFIG_QUOTA=3Dy
&#43;CONFIG_QFMT_V2=3Dy
&#43;CONFIG_AUTOFS4_FS=3Dy
&#43;CONFIG_FUSE_FS=3Dy
&#43;CONFIG_CUSE=3Dm
&#43;CONFIG_OVERLAY_FS=3Dy
&#43;CONFIG_MSDOS_FS=3Dy
&#43;CONFIG_VFAT_FS=3Dy
&#43;CONFIG_TMPFS_POSIX_ACL=3Dy
&#43;CONFIG_HUGETLBFS=3Dy
&#43;CONFIG_EFIVAR_FS=3Dy
&#43;CONFIG_SDCARD_FS=3Dy
&#43;CONFIG_SQUASHFS=3Dy
&#43;CONFIG_PSTORE_CONSOLE=3Dy
&#43;CONFIG_PSTORE_RAM=3Dy
&#43;CONFIG_9P_FS=3Dy
&#43;CONFIG_NLS_CODEPAGE_437=3Dy
&#43;CONFIG_NLS_ISO8859_1=3Dy
&#43;CONFIG_SECURITY_PERF_EVENTS_RESTRICT=3Dy
&#43;CONFIG_SECURITY=3Dy
&#43;CONFIG_SECURITY_NETWORK=3Dy
&#43;CONFIG_HARDENED_USERCOPY=3Dy
&#43;CONFIG_SECURITY_SELINUX=3Dy
&#43;CONFIG_CRYPTO_GCM=3Dy
&#43;CONFIG_CRYPTO_SHA512=3Dy
&#43;CONFIG_CRYPTO_ANSI_CPRNG=3Dy
&#43;CONFIG_PRINTK_TIME=3Dy
&#43;CONFIG_DEBUG_INFO=3Dy
&#43;CONFIG_MAGIC_SYSRQ=3Dy
&#43;CONFIG_PANIC_TIMEOUT=3D5
&#43;CONFIG_SCHEDSTATS=3Dy
&#43;# CONFIG_DEBUG_PREEMPT is not set
&#43;CONFIG_ENABLE_DEFAULT_TRACERS=3Dy
&#43;CONFIG_MEMTEST=3Dy
diff --git
b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0001-drm-Add-=
component-aware-simple-encoder.patch
new file mode 100644
index 0000000..96cc651
--- /dev/null
&#43;&#43;&#43;
b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0001-drm-Add-=
component-aware-simple-encoder.patch
@@ -0,0 &#43;1,368 @@
&#43;From 6fd66138c44107786879d0adebe78ca94cf6292f Mon Sep 17 00:00:00 200=
1
&#43;From: Liviu Dudau <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:L=
iviu.Dudau@arm.com">&lt;Liviu.Dudau@arm.com&gt;</a>
&#43;Date: Wed, 1 Apr 2020 12:10:14 &#43;0100
&#43;Subject: [PATCH 1/2] drm: Add component-aware simple encoder
&#43;
&#43;This is a simple DRM encoder that gets its connector timings informat=
ion
&#43;from a OF subnode in the device tree and exposes that as a &quot;disc=
overed&quot;
&#43;panel. It can be used together with component-based DRM drivers in an
&#43;emulated environment where no real encoder or connector hardware exis=
ts
&#43;and the display output is configured outside the kernel.
&#43;
&#43;Signed-off-by: Liviu Dudau <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:Liviu.Dudau@arm.com">&lt;Liviu.Dudau@arm.com&gt;</a>
&#43;[Backported to gem5's 4.3 kernel]
&#43;Signed-off-by: Andreas Sandberg <a class=3D"moz-txt-link-rfc2396E" hr=
ef=3D"mailto:andreas.sandberg@arm.com">&lt;andreas.sandberg@arm.com&gt;</a>
&#43;[Ported to gem5's 4.9 kernel. Added dep. on VIDEOMODE_HELPERS.]
&#43;Signed-off-by: Andreas Sandberg <a class=3D"moz-txt-link-rfc2396E" hr=
ef=3D"mailto:andreas.sandberg@arm.com">&lt;andreas.sandberg@arm.com&gt;</a>
&#43;[Ported to gem5's 4.14 kernel.]
&#43;Signed-off-by: Andreas Sandberg <a class=3D"moz-txt-link-rfc2396E" hr=
ef=3D"mailto:andreas.sandberg@arm.com">&lt;andreas.sandberg@arm.com&gt;</a>
&#43;Upstream-Status: Backport
&#43;Signed-off-by: Teo Couprie Diaz <a class=3D"moz-txt-link-rfc2396E" hr=
ef=3D"mailto:teo.coupriediaz@arm.com">&lt;teo.coupriediaz@arm.com&gt;</a>
&#43;---
&#43; drivers/gpu/drm/Kconfig               |  10 &#43;&#43;
&#43; drivers/gpu/drm/Makefile              |   3 &#43;
&#43; drivers/gpu/drm/drm_virtual_encoder.c | 297
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;
&#43; 3 files changed, 310 insertions(&#43;)
&#43; create mode 100644 drivers/gpu/drm/drm_virtual_encoder.c
&#43;
&#43;diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
&#43;index e44e567..6e95357 100644
&#43;--- a/drivers/gpu/drm/Kconfig
&#43;&#43;&#43;&#43; b/drivers/gpu/drm/Kconfig
&#43;@@ -255,6 &#43;255,16 @@ config DRM_VKMS
&#43;
&#43;         If M is selected the module will be called vkms.
&#43;
&#43;&#43;config DRM_VIRT_ENCODER
&#43;&#43;      tristate &quot;Virtual OF-based encoder&quot;
&#43;&#43;      depends on DRM &amp;&amp; OF
&#43;&#43;      select VIDEOMODE_HELPERS
&#43;&#43;      help
&#43;&#43;        Choose this option to get a virtual encoder and its asso=
ciated
&#43;&#43;        connector that will use the device tree to read the disp=
lay
&#43;&#43;        timings information. If M is selected the module will be=
 called
&#43;&#43;        drm_vencoder.
&#43;&#43;
&#43; source &quot;drivers/gpu/drm/exynos/Kconfig&quot;
&#43;
&#43; source &quot;drivers/gpu/drm/rockchip/Kconfig&quot;
&#43;diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
&#43;index a6771ce..733ad62 100644
&#43;--- a/drivers/gpu/drm/Makefile
&#43;&#43;&#43;&#43; b/drivers/gpu/drm/Makefile
&#43;@@ -46,6 &#43;46,9 @@ drm_kms_helper-$(CONFIG_DRM_DP_CEC) &#43;=3D dr=
m_dp_cec.o
&#43; obj-$(CONFIG_DRM_KMS_HELPER) &#43;=3D drm_kms_helper.o
&#43; obj-$(CONFIG_DRM_DEBUG_SELFTEST) &#43;=3D selftests/
&#43;
&#43;&#43;drm_vencoder-y :=3D drm_virtual_encoder.o
&#43;&#43;obj-$(CONFIG_DRM_VIRT_ENCODER) &#43;=3D drm_vencoder.o
&#43;&#43;
&#43; obj-$(CONFIG_DRM)     &#43;=3D drm.o
&#43; obj-$(CONFIG_DRM_MIPI_DSI) &#43;=3D drm_mipi_dsi.o
&#43; obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) &#43;=3D drm_panel_orient=
ation_quirks.o
&#43;diff --git a/drivers/gpu/drm/drm_virtual_encoder.c
b/drivers/gpu/drm/drm_virtual_encoder.c
&#43;new file mode 100644
&#43;index 00000000..2e2c51d
&#43;--- /dev/null
&#43;&#43;&#43;&#43; b/drivers/gpu/drm/drm_virtual_encoder.c
&#43;@@ -0,0 &#43;1,297 @@
&#43;&#43;/*
&#43;&#43; * Copyright (C) 2016 ARM Limited
&#43;&#43; * Author: Liviu Dudau <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:Liviu.Dudau@arm.com">&lt;Liviu.Dudau@arm.com&gt;</a>
&#43;&#43; *
&#43;&#43; * Dummy encoder and connector that use the OF to &quot;discover=
&quot; the attached
&#43;&#43; * display timings. Can be used in situations where the encoder =
and
connector's
&#43;&#43; * functionality are emulated and no setup steps are needed, or =
to describe
&#43;&#43; * attached panels for which no driver exists but can be used wi=
thout
&#43;&#43; * additional hardware setup.
&#43;&#43; *
&#43;&#43; * The encoder also uses the component framework so that it can =
be a quick
&#43;&#43; * replacement for existing drivers when testing in an emulated =
environment.
&#43;&#43; *
&#43;&#43; * This file is subject to the terms and conditions of the GNU G=
eneral
Public
&#43;&#43; * License.  See the file COPYING in the main directory of this =
archive
&#43;&#43; * for more details.
&#43;&#43; *
&#43;&#43; */
&#43;&#43;
&#43;&#43;#include &lt;drm/drmP.h&gt;
&#43;&#43;#include &lt;drm/drm_crtc.h&gt;
&#43;&#43;#include &lt;drm/drm_atomic_helper.h&gt;
&#43;&#43;#include &lt;drm/drm_crtc_helper.h&gt;
&#43;&#43;#include &lt;drm/drm_of.h&gt;
&#43;&#43;#include &lt;linux/component.h&gt;
&#43;&#43;#include &lt;video/display_timing.h&gt;
&#43;&#43;#include &lt;video/of_display_timing.h&gt;
&#43;&#43;#include &lt;video/videomode.h&gt;
&#43;&#43;
&#43;&#43;struct drm_virt_priv {
&#43;&#43;      struct drm_connector connector;
&#43;&#43;      struct drm_encoder encoder;
&#43;&#43;      struct display_timings *timings;
&#43;&#43;};
&#43;&#43;
&#43;&#43;#define connector_to_drm_virt_priv(x) \
&#43;&#43;      container_of(x, struct drm_virt_priv, connector)
&#43;&#43;
&#43;&#43;#define encoder_to_drm_virt_priv(x) \
&#43;&#43;      container_of(x, struct drm_virt_priv, encoder)
&#43;&#43;
&#43;&#43;static void drm_virtcon_destroy(struct drm_connector *connector)
&#43;&#43;{
&#43;&#43;      struct drm_virt_priv *conn =3D connector_to_drm_virt_priv(=
connector);
&#43;&#43;
&#43;&#43;      drm_connector_cleanup(connector);
&#43;&#43;      display_timings_release(conn-&gt;timings);
&#43;&#43;}
&#43;&#43;
&#43;&#43;static enum drm_connector_status
&#43;&#43;drm_virtcon_detect(struct drm_connector *connector, bool force)
&#43;&#43;{
&#43;&#43;      return connector_status_connected;
&#43;&#43;}
&#43;&#43;
&#43;&#43;static const struct drm_connector_funcs drm_virtcon_funcs =3D {
&#43;&#43;      .reset =3D drm_atomic_helper_connector_reset,
&#43;&#43;      .detect =3D drm_virtcon_detect,
&#43;&#43;      .fill_modes =3D drm_helper_probe_single_connector_modes,
&#43;&#43;      .destroy =3D drm_virtcon_destroy,
&#43;&#43;      .atomic_duplicate_state =3D drm_atomic_helper_connector_du=
plicate_state,
&#43;&#43;      .atomic_destroy_state =3D drm_atomic_helper_connector_dest=
roy_state,
&#43;&#43;};
&#43;&#43;
&#43;&#43;static int drm_virtcon_get_modes(struct drm_connector *connector=
)
&#43;&#43;{
&#43;&#43;      struct drm_virt_priv *conn =3D connector_to_drm_virt_priv(=
connector);
&#43;&#43;      struct display_timings *timings =3D conn-&gt;timings;
&#43;&#43;      int i;
&#43;&#43;
&#43;&#43;      for (i =3D 0; i &lt; timings-&gt;num_timings; i&#43;&#43;)=
 {
&#43;&#43;              struct drm_display_mode *mode =3D
drm_mode_create(connector-&gt;dev);
&#43;&#43;              struct videomode vm;
&#43;&#43;
&#43;&#43;              if (videomode_from_timings(timings, &amp;vm, i))
&#43;&#43;                      break;
&#43;&#43;
&#43;&#43;              drm_display_mode_from_videomode(&amp;vm, mode);
&#43;&#43;              mode-&gt;type =3D DRM_MODE_TYPE_DRIVER;
&#43;&#43;              if (timings-&gt;native_mode =3D=3D i)
&#43;&#43;                      mode-&gt;type =3D DRM_MODE_TYPE_PREFERRED;
&#43;&#43;
&#43;&#43;              drm_mode_set_name(mode);
&#43;&#43;              drm_mode_probed_add(connector, mode);
&#43;&#43;      }
&#43;&#43;
&#43;&#43;      return i;
&#43;&#43;}
&#43;&#43;
&#43;&#43;static int drm_virtcon_mode_valid(struct drm_connector *connecto=
r,
&#43;&#43;                                 struct drm_display_mode *mode)
&#43;&#43;{
&#43;&#43;      return MODE_OK;
&#43;&#43;}
&#43;&#43;
&#43;&#43;struct drm_encoder *drm_virtcon_best_encoder(struct drm_connecto=
r
*connector)
&#43;&#43;{
&#43;&#43;      struct drm_virt_priv *priv =3D connector_to_drm_virt_priv(=
connector);
&#43;&#43;
&#43;&#43;      return &amp;priv-&gt;encoder;
&#43;&#43;}
&#43;&#43;
&#43;&#43;struct drm_encoder *
&#43;&#43;drm_virtcon_atomic_best_encoder(struct drm_connector *connector,
&#43;&#43;                               struct drm_connector_state *conne=
ctor_state)
&#43;&#43;{
&#43;&#43;      struct drm_virt_priv *priv =3D connector_to_drm_virt_priv(=
connector);
&#43;&#43;
&#43;&#43;      return &amp;priv-&gt;encoder;
&#43;&#43;}
&#43;&#43;
&#43;&#43;static const struct drm_connector_helper_funcs drm_virtcon_helpe=
r_funcs =3D {
&#43;&#43;      .get_modes =3D drm_virtcon_get_modes,
&#43;&#43;      .mode_valid =3D drm_virtcon_mode_valid,
&#43;&#43;      .best_encoder =3D drm_virtcon_best_encoder,
&#43;&#43;      .atomic_best_encoder =3D drm_virtcon_atomic_best_encoder,
&#43;&#43;};
&#43;&#43;
&#43;&#43;static void drm_vencoder_destroy(struct drm_encoder *encoder)
&#43;&#43;{
&#43;&#43;      drm_encoder_cleanup(encoder);
&#43;&#43;}
&#43;&#43;
&#43;&#43;static const struct drm_encoder_funcs drm_vencoder_funcs =3D {
&#43;&#43;      .destroy =3D drm_vencoder_destroy,
&#43;&#43;};
&#43;&#43;
&#43;&#43;static void drm_vencoder_dpms(struct drm_encoder *encoder, int m=
ode)
&#43;&#43;{
&#43;&#43;      /* nothing needed */
&#43;&#43;}
&#43;&#43;
&#43;&#43;static bool drm_vencoder_mode_fixup(struct drm_encoder *encoder,
&#43;&#43;                                  const struct drm_display_mode =
*mode,
&#43;&#43;                                  struct drm_display_mode *adjus=
ted_mode)
&#43;&#43;{
&#43;&#43;      /* nothing needed */
&#43;&#43;      return true;
&#43;&#43;}
&#43;&#43;
&#43;&#43;static void drm_vencoder_prepare(struct drm_encoder *encoder)
&#43;&#43;{
&#43;&#43;      drm_vencoder_dpms(encoder, DRM_MODE_DPMS_OFF);
&#43;&#43;}
&#43;&#43;
&#43;&#43;static void drm_vencoder_commit(struct drm_encoder *encoder)
&#43;&#43;{
&#43;&#43;      drm_vencoder_dpms(encoder, DRM_MODE_DPMS_ON);
&#43;&#43;}
&#43;&#43;
&#43;&#43;static void drm_vencoder_mode_set(struct drm_encoder *encoder,
&#43;&#43;                                struct drm_display_mode *mode,
&#43;&#43;                                struct drm_display_mode *adjuste=
d_mode)
&#43;&#43;{
&#43;&#43;      /* nothing needed */
&#43;&#43;}
&#43;&#43;
&#43;&#43;static const struct drm_encoder_helper_funcs drm_vencoder_helper=
_funcs =3D {
&#43;&#43;      .dpms           =3D drm_vencoder_dpms,
&#43;&#43;      .mode_fixup     =3D drm_vencoder_mode_fixup,
&#43;&#43;      .prepare        =3D drm_vencoder_prepare,
&#43;&#43;      .commit         =3D drm_vencoder_commit,
&#43;&#43;      .mode_set       =3D drm_vencoder_mode_set,
&#43;&#43;};
&#43;&#43;
&#43;&#43;static int drm_vencoder_bind(struct device *dev, struct device *=
master,
&#43;&#43;                           void *data)
&#43;&#43;{
&#43;&#43;      struct drm_encoder *encoder;
&#43;&#43;      struct drm_virt_priv *con;
&#43;&#43;      struct drm_connector *connector;
&#43;&#43;      struct drm_device *drm =3D data;
&#43;&#43;      u32 crtcs =3D 0;
&#43;&#43;      int ret;
&#43;&#43;
&#43;&#43;      con =3D devm_kzalloc(dev, sizeof(*con), GFP_KERNEL);
&#43;&#43;      if (!con)
&#43;&#43;              return -ENOMEM;
&#43;&#43;
&#43;&#43;      dev_set_drvdata(dev, con);
&#43;&#43;      connector =3D &amp;con-&gt;connector;
&#43;&#43;      encoder =3D &amp;con-&gt;encoder;
&#43;&#43;
&#43;&#43;      if (dev-&gt;of_node) {
&#43;&#43;              struct drm_bridge *bridge;
&#43;&#43;              crtcs =3D drm_of_find_possible_crtcs(drm, dev-&gt;=
of_node);
&#43;&#43;              bridge =3D of_drm_find_bridge(dev-&gt;of_node);
&#43;&#43;              if (bridge) {
&#43;&#43;                      ret =3D drm_bridge_attach(encoder, bridge,=
 NULL);
&#43;&#43;                      if (ret) {
&#43;&#43;                              DRM_ERROR(&quot;Failed to initiali=
ze bridge\n&quot;);
&#43;&#43;                              return ret;
&#43;&#43;                      }
&#43;&#43;              }
&#43;&#43;              con-&gt;timings =3D of_get_display_timings(dev-&gt=
;of_node);
&#43;&#43;              if (!con-&gt;timings) {
&#43;&#43;                      dev_err(dev, &quot;failed to get display p=
anel timings\n&quot;);
&#43;&#43;                      return ENXIO;
&#43;&#43;              }
&#43;&#43;      }
&#43;&#43;
&#43;&#43;      /* If no CRTCs were found, fall back to the old encoder's =
behaviour */
&#43;&#43;      if (crtcs =3D=3D 0) {
&#43;&#43;              dev_warn(dev, &quot;Falling back to first CRTC\n&q=
uot;);
&#43;&#43;              crtcs =3D 1 &lt;&lt; 0;
&#43;&#43;      }
&#43;&#43;
&#43;&#43;      encoder-&gt;possible_crtcs =3D crtcs ? crtcs : 1;
&#43;&#43;      encoder-&gt;possible_clones =3D 0;
&#43;&#43;
&#43;&#43;      ret =3D drm_encoder_init(drm, encoder, &amp;drm_vencoder_f=
uncs,
&#43;&#43;                             DRM_MODE_ENCODER_VIRTUAL, NULL);
&#43;&#43;      if (ret)
&#43;&#43;              goto encoder_init_err;
&#43;&#43;
&#43;&#43;      drm_encoder_helper_add(encoder, &amp;drm_vencoder_helper_f=
uncs);
&#43;&#43;
&#43;&#43;      /* bogus values, pretend we're a 24&quot; screen for DPI c=
alculations */
&#43;&#43;      connector-&gt;display_info.width_mm =3D 519;
&#43;&#43;      connector-&gt;display_info.height_mm =3D 324;
&#43;&#43;      connector-&gt;interlace_allowed =3D false;
&#43;&#43;      connector-&gt;doublescan_allowed =3D false;
&#43;&#43;      connector-&gt;polled =3D 0;
&#43;&#43;
&#43;&#43;      ret =3D drm_connector_init(drm, connector, &amp;drm_virtco=
n_funcs,
&#43;&#43;                               DRM_MODE_CONNECTOR_VIRTUAL);
&#43;&#43;      if (ret)
&#43;&#43;              goto connector_init_err;
&#43;&#43;
&#43;&#43;      drm_connector_helper_add(connector, &amp;drm_virtcon_helpe=
r_funcs);
&#43;&#43;
&#43;&#43;      drm_connector_register(connector);
&#43;&#43;
&#43;&#43;      ret =3D drm_connector_attach_encoder(connector, encoder);
&#43;&#43;      if (ret)
&#43;&#43;              goto attach_err;
&#43;&#43;
&#43;&#43;      return ret;
&#43;&#43;
&#43;&#43;attach_err:
&#43;&#43;      drm_connector_unregister(connector);
&#43;&#43;      drm_connector_cleanup(connector);
&#43;&#43;connector_init_err:
&#43;&#43;      drm_encoder_cleanup(encoder);
&#43;&#43;encoder_init_err:
&#43;&#43;      display_timings_release(con-&gt;timings);
&#43;&#43;
&#43;&#43;      return ret;
&#43;&#43;};
&#43;&#43;
&#43;&#43;static void drm_vencoder_unbind(struct device *dev, struct devic=
e *master,
&#43;&#43;                              void *data)
&#43;&#43;{
&#43;&#43;      struct drm_virt_priv *con =3D dev_get_drvdata(dev);
&#43;&#43;
&#43;&#43;      drm_connector_unregister(&amp;con-&gt;connector);
&#43;&#43;      drm_connector_cleanup(&amp;con-&gt;connector);
&#43;&#43;      drm_encoder_cleanup(&amp;con-&gt;encoder);
&#43;&#43;      display_timings_release(con-&gt;timings);
&#43;&#43;}
&#43;&#43;
&#43;&#43;static const struct component_ops drm_vencoder_ops =3D {
&#43;&#43;      .bind =3D drm_vencoder_bind,
&#43;&#43;      .unbind =3D drm_vencoder_unbind,
&#43;&#43;};
&#43;&#43;
&#43;&#43;static int drm_vencoder_probe(struct platform_device *pdev)
&#43;&#43;{
&#43;&#43;      return component_add(&amp;pdev-&gt;dev, &amp;drm_vencoder_=
ops);
&#43;&#43;}
&#43;&#43;
&#43;&#43;static int drm_vencoder_remove(struct platform_device *pdev)
&#43;&#43;{
&#43;&#43;      component_del(&amp;pdev-&gt;dev, &amp;drm_vencoder_ops);
&#43;&#43;      return 0;
&#43;&#43;}
&#43;&#43;
&#43;&#43;static const struct of_device_id drm_vencoder_of_match[] =3D {
&#43;&#43;      { .compatible =3D &quot;drm,virtual-encoder&quot;, },
&#43;&#43;      {},
&#43;&#43;};
&#43;&#43;MODULE_DEVICE_TABLE(of, drm_vencoder_of_match);
&#43;&#43;
&#43;&#43;static struct platform_driver drm_vencoder_driver =3D {
&#43;&#43;      .probe =3D drm_vencoder_probe,
&#43;&#43;      .remove =3D drm_vencoder_remove,
&#43;&#43;      .driver =3D {
&#43;&#43;              .name =3D &quot;drm_vencoder&quot;,
&#43;&#43;              .of_match_table =3D drm_vencoder_of_match,
&#43;&#43;      },
&#43;&#43;};
&#43;&#43;
&#43;&#43;module_platform_driver(drm_vencoder_driver);
&#43;&#43;
&#43;&#43;MODULE_AUTHOR(&quot;Liviu Dudau&quot;);
&#43;&#43;MODULE_DESCRIPTION(&quot;Virtual DRM Encoder&quot;);
&#43;&#43;MODULE_LICENSE(&quot;GPL v2&quot;);
&#43;--
&#43;2.7.4
&#43;
diff --git
b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0002-swap-red=
-and-blue-colors-in-HDLCD-driver.patch
new file mode 100644
index 0000000..621209f
--- /dev/null
&#43;&#43;&#43;
b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0002-swap-red=
-and-blue-colors-in-HDLCD-driver.patch
@@ -0,0 &#43;1,43 @@
&#43;From 064807d22a0a2865a930d4cc48b61f917f4bf15f Mon Sep 17 00:00:00 200=
1
&#43;From: Anders Dellien <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:anders.dellien@arm.com">&lt;anders.dellien@arm.com&gt;</a>
&#43;Date: Fri, 17 Apr 2020 16:06:03 &#43;0100
&#43;Subject: [PATCH 2/2] swap red and blue colors in HDLCD driver
&#43;
&#43;The HDLCD drivers is configured to use BGR888 but Android needs
&#43;RGB888 - so we need to swap the red and blue components.
&#43;
&#43;Change-Id: Ib47ddff9280a53757925f6c1b1f373089d038025
&#43;Signed-off-by: Anders Dellien<a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:anders.dellien@arm.com">&lt;anders.dellien@arm.com&gt;</a>
&#43;Upstream-Status: Inappropriate [Color swap needed for TC0 only]
&#43;Signed-off-by: Teo Couprie Diaz <a class=3D"moz-txt-link-rfc2396E" hr=
ef=3D"mailto:teo.coupriediaz@arm.com">&lt;teo.coupriediaz@arm.com&gt;</a>
&#43;---
&#43; drivers/gpu/drm/arm/hdlcd_crtc.c | 8 &#43;&#43;&#43;&#43;----
&#43; 1 file changed, 4 insertions(&#43;), 4 deletions(-)
&#43;
&#43;diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c
b/drivers/gpu/drm/arm/hdlcd_crtc.c
&#43;index e69d996..a46ba4f 100644
&#43;--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
&#43;&#43;&#43;&#43; b/drivers/gpu/drm/arm/hdlcd_crtc.c
&#43;@@ -110,15 &#43;110,15 @@ static int hdlcd_set_pxl_fmt(struct drm_crt=
c *crtc)
&#43;        * pixel is outside the visible frame area or when there is a
&#43;        * buffer underrun.
&#43;        */
&#43;-      hdlcd_write(hdlcd, HDLCD_REG_RED_SELECT, format-&gt;red.offset=
 |
&#43;&#43;      hdlcd_write(hdlcd, HDLCD_REG_RED_SELECT, format-&gt;blue.o=
ffset |
&#43; #ifdef CONFIG_DRM_HDLCD_SHOW_UNDERRUN
&#43;                   0x00ff0000 |        /* show underruns in red */
&#43; #endif
&#43;-                  ((format-&gt;red.length &amp; 0xf) &lt;&lt; 8));
&#43;&#43;                  ((format-&gt;blue.length &amp; 0xf) &lt;&lt; 8=
));
&#43;       hdlcd_write(hdlcd, HDLCD_REG_GREEN_SELECT, format-&gt;green.of=
fset |
&#43;                   ((format-&gt;green.length &amp; 0xf) &lt;&lt; 8));
&#43;-      hdlcd_write(hdlcd, HDLCD_REG_BLUE_SELECT, format-&gt;blue.offs=
et |
&#43;-                  ((format-&gt;blue.length &amp; 0xf) &lt;&lt; 8));
&#43;&#43;      hdlcd_write(hdlcd, HDLCD_REG_BLUE_SELECT, format-&gt;red.o=
ffset |
&#43;&#43;                  ((format-&gt;red.length &amp; 0xf) &lt;&lt; 8)=
);
&#43;
&#43;       return 0;
&#43; }
&#43;--
&#43;2.7.4
&#43;
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-tc0.inc
b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-tc0.inc
new file mode 100644
index 0000000..a8fe6ff
--- /dev/null
&#43;&#43;&#43; b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-tc0.in=
c
@@ -0,0 &#43;1,15 @@
&#43;#
&#43;# TC0 MACHINE specific configurations
&#43;#
&#43;
&#43;FILESEXTRAPATHS_prepend :=3D
&quot;${THISDIR}/linux-arm64-ack-4.19:${THISDIR}/files:&quot;
&#43;
&#43;SRC_URI_append =3D &quot; \
&#43;    <a class=3D"moz-txt-link-freetext" href=3D"file://defconfig">file=
://defconfig</a> \
&#43;    <a class=3D"moz-txt-link-freetext" href=3D"file://0001-drm-Add-co=
mponent-aware-simple-encoder.patch">file://0001-drm-Add-component-aware-sim=
ple-encoder.patch</a> \
&#43;    <a class=3D"moz-txt-link-freetext" href=3D"file://0002-swap-red-a=
nd-blue-colors-in-HDLCD-driver.patch">file://0002-swap-red-and-blue-colors-=
in-HDLCD-driver.patch</a> \
&#43;    &quot;
&#43;
&#43;KCONFIG_MODE =3D &quot;--alldefconfig&quot;
&#43;
&#43;COMPATIBLE_MACHINE =3D &quot;tc0&quot;
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappe=
nd
b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend
new file mode 100644
index 0000000..4df4831
--- /dev/null
&#43;&#43;&#43; b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.b=
bappend
@@ -0,0 &#43;1,6 @@
&#43;# Machine specific configurations
&#43;
&#43;MACHINE_ACK_REQUIRE ?=3D &quot;&quot;
&#43;MACHINE_ACK_REQUIRE_tc0 =3D &quot;linux-arm64-ack-tc0.inc&quot;
&#43;
&#43;require ${MACHINE_ACK_REQUIRE}
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are
confidential and may also be privileged. If you are not the intended
recipient, please notify the sender immediately and do not disclose the
contents to any other person, use it for any purpose, or store or copy the
information in any medium. Thank you.

</pre>
</blockquote>
</blockquote>
<pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
<blockquote type=3D"cite">
<pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
</blockquote>
<pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
<br>
<fieldset class=3D"mimeAttachmentHeader"></fieldset>
<pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
</blockquote>
IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--------------5B10D931E9B7B3A8E7E50DBA--
