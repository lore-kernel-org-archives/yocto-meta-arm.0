Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.46])
 by mx.groups.io with SMTP id smtpd.web10.19364.1594732212297644575
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jul 2020 06:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=GwinSQeZ;
 spf=pass (domain: arm.com, ip: 40.107.3.46, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oL+ZmMtOnZ2kAnWFdMLveP8ooZhGcsdvgJaJWvp3kZ4=;
 b=GwinSQeZunEoHJY6pxHe0QA+4cJqwX6cJThowS22tgUbEf+xyyfDK0DxfX7njYEp05mMwjRMUj7b7XBUf1d+BkGGISbt4nl096iaYbrWJ21ES5CW3Vmv4WJCZH5WhzcGR+yto5/po5GoTJFkpEqBNPmTcX16r6Ksxw7Tf4Vt1Go=
Received: from DB6PR0601CA0046.eurprd06.prod.outlook.com (2603:10a6:4:17::32)
 by VI1PR08MB5454.eurprd08.prod.outlook.com (2603:10a6:803:13d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Tue, 14 Jul
 2020 13:10:09 +0000
Received: from DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::44) by DB6PR0601CA0046.outlook.office365.com
 (2603:10a6:4:17::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Tue, 14 Jul 2020 13:10:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT010.mail.protection.outlook.com (10.152.20.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Tue, 14 Jul 2020 13:10:09 +0000
Received: ("Tessian outbound 7de93d801f24:v62"); Tue, 14 Jul 2020 13:10:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1e394e1d18a181ce
X-CR-MTA-TID: 64aa7808
Received: from d4249e41ac20.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C7620C88-C620-436E-8870-3557EE2E60F8.1;
	Tue, 14 Jul 2020 12:58:42 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d4249e41ac20.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 14 Jul 2020 12:58:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emZKEBXzKFM2CgHtDZjnIlrSaexQHHMhyVU+VPPIyZ9OQ1e0k36yQsea1CQjLbVY5zRxo5SX2P46srjLOu+1J4+dnyWgJq0L+uRtda8SnaUtarfjd4LGkcEFNiFouoCjr7B2HScNXkJsV4PnWr1bxEUhM0h7bGcXUOiGgzsrx4xrAbFzlWrkQzLsV8PHqsZnWsgAB+vZwDNxL7mDIgnX+57j3sfUyFL0klMGtS0tivMYt0RsbGWpmVSTogvXOhtPkKEc3j4Zh+DxzC0gv1bcLus0gauV6Pg3ncBHdcQ/pJv1J4mEiKUR9gFDvE0RWQHuCZE6BE9WXMc9T0nYqX2NOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oL+ZmMtOnZ2kAnWFdMLveP8ooZhGcsdvgJaJWvp3kZ4=;
 b=HSeP8hOdJAIdfI6auVXnLcF7zkUpMyeO1NdtoPeFqOsq2DSJGjzqh0FbbRyA19NMG9xwydSSUbvJ9UOk7xd/UlA1U11zRCPXDDdkF63NSRWoG5vzpGzWbky7YFFjPer7jvaS9SPSe2LHTl0FlOCvXqCz1BeugRylnxFZ6gXKqpJFMdlZcLzXZ64oBMqMRnLnArGzlGoxk5lnm9YO4rR+/JSgbbgqmRDBDbhl60s8AsDbXKCAAW/syCAz4U/lAEuqqGC7UA/dkUdfSpuD+f196XczPrUMviDmU0D/Lz2C2lAgLNF+zxwXx34xUqFBTzuE5HV5fDKrGVF9VAxeq+MNtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oL+ZmMtOnZ2kAnWFdMLveP8ooZhGcsdvgJaJWvp3kZ4=;
 b=GwinSQeZunEoHJY6pxHe0QA+4cJqwX6cJThowS22tgUbEf+xyyfDK0DxfX7njYEp05mMwjRMUj7b7XBUf1d+BkGGISbt4nl096iaYbrWJ21ES5CW3Vmv4WJCZH5WhzcGR+yto5/po5GoTJFkpEqBNPmTcX16r6Ksxw7Tf4Vt1Go=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3974.eurprd08.prod.outlook.com (2603:10a6:20b:a3::11)
 by AM6PR08MB3557.eurprd08.prod.outlook.com (2603:10a6:20b:4f::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Tue, 14 Jul
 2020 12:58:40 +0000
Received: from AM6PR08MB3974.eurprd08.prod.outlook.com
 ([fe80::851d:b6da:540e:de44]) by AM6PR08MB3974.eurprd08.prod.outlook.com
 ([fe80::851d:b6da:540e:de44%6]) with mapi id 15.20.3174.026; Tue, 14 Jul 2020
 12:58:40 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/4] arm-bsp: Migrate a5ds to meta-kernel for stable kernels
Date: Tue, 14 Jul 2020 08:58:31 -0400
Message-Id: <20200714125834.31338-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: DM5PR21CA0011.namprd21.prod.outlook.com
 (2603:10b6:3:ac::21) To AM6PR08MB3974.eurprd08.prod.outlook.com
 (2603:10a6:20b:a3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (136.56.1.171) by DM5PR21CA0011.namprd21.prod.outlook.com (2603:10b6:3:ac::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.7 via Frontend Transport; Tue, 14 Jul 2020 12:58:38 +0000
Received: by vm (sSMTP sendmail emulation); Tue, 14 Jul 2020 08:58:34 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [136.56.1.171]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ab03bdab-6f91-48b7-c2f8-08d827f73c59
X-MS-TrafficTypeDiagnostic: AM6PR08MB3557:|VI1PR08MB5454:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB545465507351586EF2E00698F0610@VI1PR08MB5454.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 IF57BH1b2PydEJ3IpnzSC+EHamVM3V43tsKkRYWcstFN+83aUTXVZqnTMFwWIXahvQ9PJOXcP6PiZCvzYshKi0WGkhYmZSn+iDH7edQgVJfx3FkTqOSTo2MFrfdGEemvIhp7qM8IV9v7oUANQ4N15YFz3c9lArfB4AcEJMt8xfuwYu5Vs6jA+aF6OY4xq4SH2EOZyoSibB6WxeqzMvyCFjzblD8eDiyHyKdmradrM9x92PaLyrivLEIset/HnpBHx0nC4pUzoAlEsvJJ2ZfmeBVoXlR54QsmjW2PiCsq0F2hYMjTKfazLC/sUTcdOOuQTH6YToeSJKxHmmiV1lvMZAyoCVx6y3LiamKb65XYo7z3PyKwZxuIufXKwZYsE79IqLM5BisGPYvqCch7mpFn4nMJSZuOlJPwI5bIvTJmQOS8oe66ls1J4gvjJV5VzLACgt5PYosG62IXeHarRVgyE/adpqADPwOG9oqGf3IfTFA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3974.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(966005)(26005)(5660300002)(426003)(2616005)(66946007)(186003)(66556008)(8936002)(44832011)(8676002)(86362001)(66476007)(478600001)(52116002)(316002)(1076003)(36756003)(42186006)(83380400001)(6916009)(4326008)(2906002)(6666004)(42413003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 k28lv8BX6HWShioRwZljQ8Vlmuv3QNWSb8OOHlJZ8mTMrKIbPcjdRh9I8BItna7XsVDzu1qQQWKGPeGww/VYyQvqewzI8Fc4X1bD/wNc1l6V5jMyGvfshAspYNPRWBMBSZBmwp4iuaNnDUIjePMZMJhrFNsiTse31CkNytnF428EciqaMMpooAb8MLjK00CBzWhVFGqYXKItAFp9X6ygPNsmQ59Cv2iyIBW+NMmE87bZEE7KJzBRpLEumkZhwL/pXOe9LsEw3iUHfvVeqga/S/D34yowV7bXDaT9qocW0tCK4h4pF1kKDMU4y9h3K1G2zMrcRvfYdCa9rmJnOdyS8OSY8MA3jUwGsfInBB9i8bRqlz5i6LbQJwfvJ1tCZtIP4nFswq5St0Y8ZPv0XZfDKSh069J6RwsbjqsuXjuxlKE8V5WhvtxBFAub8TxlrvoSiFRuyaaTZR4TFLULdygOf/ilS9x/5J1AbK1KOQ9mGTY=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3557
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(39860400002)(346002)(396003)(46966005)(42186006)(356005)(82740400003)(478600001)(70586007)(8676002)(2616005)(316002)(966005)(186003)(83380400001)(26005)(5660300002)(8936002)(47076004)(2906002)(336012)(1076003)(86362001)(426003)(36756003)(6666004)(82310400002)(4326008)(44832011)(81166007)(6916009)(70206006)(42413003)(32563001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	73359a13-b98d-4846-b0f7-08d827f5a09e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KsQSiTcqeEmJ6CuF8Op9+D/XT506OHMJT1xza6yKixXzrN+eDfWqJMJGnzglkZp9MGLG8XaI7onwrl34wVi6oAHtu95VK5adcCzvcGgpWeSxgVnD1TYjaLvYu+NBfA5MKleaJj0D45aD4b9+SWiW+uZv/tNRrZRhZfT1rerIThrY9edd90+iykZKmbL8Jx+bH60Xe875ibct2cK2yDDGCriVpo6enjWMkuDdoyK+g4+D7ZuTDxHYWyjihSw1GvE/rXGtb0FyLi2oDopgBPYIMZNp+5ny96KswisvB+37VL2ZTm8W6jIVIW+bf6zDvYxu5+3nu6dwhyjLQz40bSOU/AWtoWFHQHkDBThaF+qU9HWu/ilvUqvrizoAtF1oZyvUbfnXU+u1aAmtx07BGyjbFZO5l5EcNsTip2k2lF5w2m1iSbPiBQTekbBYnZugc2Hj8zAJqpMyM/k6NCxMmzisrQwfQ5WTEyt7w8a8jry+TZfPboFZyaxph9XMfspg160H13706SFFlR2vNS9bMtzDbg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2020 13:10:09.5776
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab03bdab-6f91-48b7-c2f8-08d827f73c59
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5454
Content-Type: text/plain

a5ds is having issues building its stable kernel on master.  Migrate to
meta-kernel to fix the build break.  This has the benefit of meta-arm
not having a unique stable kernel recipe to maintain and support.

Also, change the name of linux-yocto-arm-platforms to be more
generic, as it doesn't accurately reflect where it is currently being
used and can be used by different kernels going forward.

Change-Id: I4e76c7f1ee4b84641279a389820940fac7130df1
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/layer.conf                  |  2 +-
 meta-arm-bsp/conf/machine/a5ds.conf           |  4 ++--
 ...-platforms.inc => linux-arm-platforms.inc} |  6 +++++
 .../linux/linux-stable_%.bbappend             |  3 +++
 .../linux/linux-upstream-arm-platforms.inc    | 24 -------------------
 .../linux/linux-upstream-arm_5.3.bb           |  8 -------
 6 files changed, 12 insertions(+), 35 deletions(-)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-arm-platforms.inc => linux-arm-platforms.inc} (91%)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm_5.3.bb

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 7fe0e63..bcf08ad 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -9,5 +9,5 @@ BBFILE_COLLECTIONS += "meta-arm-bsp"
 BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arm-bsp = "6"
 
-LAYERDEPENDS_meta-arm-bsp = "core meta-arm"
+LAYERDEPENDS_meta-arm-bsp = "core meta-arm meta-kernel"
 LAYERSERIES_COMPAT_meta-arm-bsp = "warrior zeus dunfell"
diff --git a/meta-arm-bsp/conf/machine/a5ds.conf b/meta-arm-bsp/conf/machine/a5ds.conf
index fa7d88e..e7180e9 100644
--- a/meta-arm-bsp/conf/machine/a5ds.conf
+++ b/meta-arm-bsp/conf/machine/a5ds.conf
@@ -6,8 +6,8 @@
 
 require conf/machine/include/tune-cortexa5.inc
 
-PREFERRED_PROVIDER_virtual/kernel ?= "linux-upstream-arm"
-PREFERRED_VERSION_linux-upstream-arm ?= "5.3%"
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-stable"
+PREFERRED_VERSION_linux-stable ?= "5.3%"
 KBUILD_DEFCONFIG = "multi_v7_defconfig"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
similarity index 91%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 3ddebb9..fb37610 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -15,6 +15,12 @@ SRC_URI_append_juno = " ${SRC_URI_KMETA}"
 SRC_URI_append_gem5-arm64 = " ${SRC_URI_KMETA}"
 SRCREV_arm-platforms-kmeta = "6147e82375aa9df8f2a162d42ea6406c79c854c5"
 
+#
+# Cortex-A5 DesignStart KMACHINE
+#
+COMPATIBLE_MACHINE_a5ds = "a5ds"
+KMACHINE_a5ds = "a5ds"
+
 #
 # FVP FOUNDATION KMACHINE
 #
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend
new file mode 100644
index 0000000..db850ea
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend
@@ -0,0 +1,3 @@
+# Add support for Arm Platforms (boards or simulators)
+
+require linux-arm-platforms.inc
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
deleted file mode 100644
index 472cea8..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "Linux Kernel based on upstream tree"
-SECTION = "kernel"
-LICENSE = "GPLv2"
-SRCREV_FORMAT = "kernel"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-KERNEL_VERSION_SANITY_SKIP = "1"
-
-S = "${WORKDIR}/git"
-
-# Override do_kernel_configme to avoid kernel being assembled into a linux-yocto
-# style kernel
-# https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#ref-tasks-kernel_configme
-do_kernel_configme[noexec] = "1"
-
-# Make sure no branch is defined since here we track a specific version
-KBRANCH = ""
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-
-SRC_URI = "\
-        git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux;protocol=git;nobranch=1 \
-        "
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm_5.3.bb b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm_5.3.bb
deleted file mode 100644
index 88a06c4..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm_5.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-# Add support for Upstream Kernel for Arm Platforms (boards or simulators)
-
-SUMMARY = "Linux Kernel Upstream, supported by Arm/Linaro"
-
-require recipes-kernel/linux/linux-upstream-arm-platforms.inc
-
-SRCREV = "v${PV}"
-LINUX_VERSION ?= "${PV}"
-- 
2.17.1

