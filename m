Return-Path: <arunachalam.ganapathy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B212EC433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 11:58:32 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.43])
 by mx.groups.io with SMTP id smtpd.web08.10777.1642766310627587749
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Jan 2022 03:58:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=zzGTyM4E;
 spf=pass (domain: arm.com, ip: 40.107.14.43,
 mailfrom: arunachalam.ganapathy@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAiFMrzydfyjs7BAP630peoEf1+5QDaZE2mteaE1wl8=;
 b=zzGTyM4Edap6XQsRSyetEj1SKbVOPtHzsjDjpf5bw/RE0dB5goenr8jHJUqbpAPmH9xxZKfLASOvLp9OxNejsVE2hidONgKbGugYc0pvLLW2Ag5vNzqjKRfgUxNWSEBjwrUjO7MUSFdH9llglCRz38Y6WtCtx9NVmjcSkdNBxrY=
Received: from AM6PR05CA0036.eurprd05.prod.outlook.com (2603:10a6:20b:2e::49)
 by AM8PR08MB5700.eurprd08.prod.outlook.com (2603:10a6:20b:1d5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 21 Jan
 2022 11:58:25 +0000
Received: from AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::22) by AM6PR05CA0036.outlook.office365.com
 (2603:10a6:20b:2e::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.11 via Frontend
 Transport; Fri, 21 Jan 2022 11:58:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT010.mail.protection.outlook.com (10.152.16.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.7 via Frontend Transport; Fri, 21 Jan 2022 11:58:23 +0000
Received: ("Tessian outbound 826a6d8e58c3:v113");
 Fri, 21 Jan 2022 11:58:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9d660f01a34cd0d2
X-CR-MTA-TID: 64aa7808
Received: from 9b6cb6a96d7d.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A6401FB9-4C32-433D-BB54-7A3D16976D53.1;
	Fri, 21 Jan 2022 11:57:06 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 9b6cb6a96d7d.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 21 Jan 2022 11:57:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqTGHA3msj8L9L9B/z4oTWd5ANGznm0UeHfsJrPfL1GskGYtv2TnIxXsAJ4C7gnFNqLhPKBvjpqJocnFXZzz7PlrucpGqY+KlzY3WJiYjIddR/Z/oFU1PojTmjIQQ9kApYjZoCgnW3tCT9p/dxjDCaYAb/jXSTZm+X+7ftimc5LV5wibMWBN7PRZ9Lr7rNYH1JHJ7D0Bgev+1YiCcJnvn5EEG7HCQVR0sbg7TVs7kERfZmk0+LZbbRHN3MiNmG6IUKm26XdXHDkwKU2n4ICiTW8237Nxf0FDyiR9KebxwafRWrxvthtwFDTAcXccnjxlA6i16LKGcTN31BzYBU6iFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAiFMrzydfyjs7BAP630peoEf1+5QDaZE2mteaE1wl8=;
 b=IRORu60tbe/HkAWGuIywBl2QPF//ecLp9Xsv8OZgcSHqy0C1pz+ysZ+nwEUG2foaC5m3S7il72thQ/ISamvTfKj1PjKRFT18eCcG395TAE98TSZVy7OYUYavGMqqfdIxQjMifkoU0YBEQeNBXDHR8eH8nQbNpnNHCeO2SeA4KNXlA9QWFW7S/eJQsO2NkOAWm/GzfmbLZGf7Cfm26j7i8csKnxUQXTwp2GASb4pT7eoNn/wfLcjuWdZCx0wP21L0N8KmRI7gXgkOsE5djzl2ii5IN8BloUnNOhd2hK1Z2ZSYXD3LDGIpyLg1zCCeBkaETSev0OU1aLd31WM0jgxLPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAiFMrzydfyjs7BAP630peoEf1+5QDaZE2mteaE1wl8=;
 b=zzGTyM4Edap6XQsRSyetEj1SKbVOPtHzsjDjpf5bw/RE0dB5goenr8jHJUqbpAPmH9xxZKfLASOvLp9OxNejsVE2hidONgKbGugYc0pvLLW2Ag5vNzqjKRfgUxNWSEBjwrUjO7MUSFdH9llglCRz38Y6WtCtx9NVmjcSkdNBxrY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com (2603:10a6:102:136::18)
 by AM0PR08MB3075.eurprd08.prod.outlook.com (2603:10a6:208:5a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Fri, 21 Jan
 2022 11:57:05 +0000
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::4416:49a8:fb0c:6bf3]) by PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::4416:49a8:fb0c:6bf3%5]) with mapi id 15.20.4909.010; Fri, 21 Jan 2022
 11:57:05 +0000
From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 3/3] arm/u-boot: add patch to support higher DRAM on TC
Date: Fri, 21 Jan 2022 11:56:43 +0000
Message-ID: <20220121115643.485616-3-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220121115643.485616-1-arunachalam.ganapathy@arm.com>
References: <20220121115643.485616-1-arunachalam.ganapathy@arm.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::16) To PAXPR08MB6766.eurprd08.prod.outlook.com
 (2603:10a6:102:136::18)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 0e0658a0-4acc-4626-9030-08d9dcd553ae
X-MS-TrafficTypeDiagnostic: 
	AM0PR08MB3075:EE_|AM5EUR03FT010:EE_|AM8PR08MB5700:EE_
X-Microsoft-Antispam-PRVS: 
	<AM8PR08MB570045D7B8B77F56FA38E76BFB5B9@AM8PR08MB5700.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:37;OLM:37;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 J+HYNkAHSMzKv7UYvnn2DWNGbpPB98uroBEpOxcmdvCJHenescDi0lf6D+pTApTJ4h7O7a/WLl3SjJH/k0yywLIj6A5ulnmDW2dpoMQS7/2Prte6WlSE0M0u3F8DK2IyQB+wqH/qHupvPqDkFSGT1ckCFzrmWb2S31Uf3rU/iYqa/h7GXXfSsJ7aIYYpHuROPEJN7uBWsSI1OKcNQU9Z9BlDbGzhq3RDQ0GMxU1M3r7ee3fxb83+w5gHAPdjLlgRlQBkxbTxslwXHZMn3VPghpMGWjZO+52PuleDFvr/FuWUbv8zjWl6lNd71MTFpb6TErRJyze6pE0LPydzCBfuZ/tIfh/Na1arZL+VUgt4HyOJeZM5i9XOKMipeYoGPFebQcPADW6aatXECUjGnoZudGwq5i9w8FxvAUuG2Vh0V0t5IakIt5DGFOOCYfsTRmQ098k2TPzKvPzFHYxS/a29XyGmq3DOJSjWJinIWFdYW5Lfoh3JDF+KjvuoS1VlnT+PZqom9cwQANYKXdEWT1KVi0/pdps7C3M2UKy0AgRToCEf9RNI+XUSXki3njiovP0ZovvcXIUguuLOq37IEsxA6IY34/tTlmv0LUHA7dsXjuV8SQeMW2kDxRcuBkQZuRVjp9xCZGGc7rk3Sn0XNeHsyerdXKzl8RFb3b+MRMpfIgFahSwDPE7cLY/HHabulva1qcVaBPjqwvK9w4Rr1dtQn7FcxT5pJYQNK38UfClzmAqKWoy5AqyzB22QLyPA2VFZsZ4hH/1B8tADS2tzEAfci5qR01twk8YXCgBZxJkPLzIqDL/hdqwnP9lDBQZkLt+0
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6766.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(44832011)(86362001)(186003)(26005)(6506007)(6916009)(1076003)(36756003)(8676002)(508600001)(19627235002)(52116002)(83380400001)(8936002)(6666004)(2906002)(5660300002)(316002)(6486002)(6512007)(66556008)(66476007)(66946007)(4326008)(38350700002)(38100700002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3075
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4e8b5249-d324-44e2-64ec-08d9dcd524a5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xwzCWlL7cKnTHMtv7qb/cCY4DAmDg30bzSRidEe6Hjaxp5+awwtpMV8q2v8/30ewDLUkTOg6wg77NfiLgJZF1Ab3vfUCP/MZVY/VoL/JZ6wvBN/Xl7dfqaBr3CoMJ7AaA1gPS5VPXe7blUoRFP/UR7Nm7No5IhFDcOtyDMPLSQurI4TsHkeVd9yKhTnk6Zn7/ClSx9lWSVYks1TJBSEBq6ZMsU1ZI1uKBNeP3dLNSK4eMlbV/gDhDd9ohhBUw0c98OakY5wB6m745rVYYOZII3sQhCSi4Sm10RbhtkgvxMrmc/wfTeWeGLip0Apg0tQIDbGZkIr4ulow5qTqviK/zfBk+TzuYiGCDQa6FXW9mPYU7lgvR/53zvw/0h42ISRXvW8yyuF3El0ThMlcZZ392h0U35BjTZpLidhLyvHtWYhHSzG25WTyatgP8VXNKOK6p+tk8ApinRP1//09ShsmNHJvMsoky63RingSfl2uYs9lu7lBFuK+OKfwQOG/DJXKjNuJuYs54Sn0urT3leQsCcx636YNDk94hTXs15UmRPuxh20SsypBsKW3HE9qBamLjacyPZo6ZWG2d2isImZOIwzjAmF0KqhOQ8es7OWrEpTSwui4SOMldtHOR6SaikhIc92Mf3B3casRZDIJGk99kp9rjVYuIxZ1/zBYpr/u3bsxRvUY4hTuynUU1KvAdCfJRJ1DtFAwenmZvhr3AKhH+EB/HIyDI2Wo/2Bbz6hPt9DOMC4QaLkM2c3xjSNWBDqk+ynZQdMJPa33oTh9CQ4lnkvZ36k7urKP9+122XcYtvl+K1EWl9ybAT/mmTvBn3tl
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(1076003)(356005)(6666004)(508600001)(5660300002)(70206006)(70586007)(6486002)(83380400001)(2906002)(6916009)(26005)(186003)(8676002)(8936002)(336012)(47076005)(4326008)(6512007)(6506007)(36756003)(81166007)(19627235002)(2616005)(86362001)(82310400004)(44832011)(316002)(36860700001)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 11:58:23.9104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0e0658a0-4acc-4626-9030-08d9dcd553ae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5700
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Jan 2022 11:58:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2889

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: Ifbf9e73a0e1134d1a0ecce036c9ba53fe7d5b1bf
---
 ...m-total_compute-increase-DRAM-to-8GB.patch | 47 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  5 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0001-arm-tota=
l_compute-increase-DRAM-to-8GB.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0001-arm-total_compu=
te-increase-DRAM-to-8GB.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0=
001-arm-total_compute-increase-DRAM-to-8GB.patch
new file mode 100644
index 0000000..d1cfcdb
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0001-arm-total_compute-incr=
ease-DRAM-to-8GB.patch
@@ -0,0 +1,47 @@
+From bdb7de7cdef6ece51dfcee927d3ce0c97fc431f0 Mon Sep 17 00:00:00 2001
+From: Usama Arif <usama.arif@arm.com>
+Date: Tue, 12 Oct 2021 13:43:16 +0100
+Subject: [PATCH] arm: total_compute: increase DRAM to 8GB
+
+The extra 6GB start at 0x8080000000.
+
+Signed-off-by: Usama Arif <usama.arif@arm.com>
+
+Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/b20b16a=
794b073807ef8d6840772a92788b3e226]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+---
+ board/armltd/total_compute/total_compute.c | 3 +++
+ include/configs/total_compute.h            | 3 +++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/board/armltd/total_compute/total_compute.c b/board/armltd/tot=
al_compute/total_compute.c
+index b7eaab0851..b7772f79a3 100644
+--- a/board/armltd/total_compute/total_compute.c
++++ b/board/armltd/total_compute/total_compute.c
+@@ -59,6 +59,9 @@ int dram_init_banksize(void)
+ 	gd->bd->bi_dram[0].start =3D PHYS_SDRAM_1;
+ 	gd->bd->bi_dram[0].size =3D PHYS_SDRAM_1_SIZE;
+=20
++	gd->bd->bi_dram[1].start =3D PHYS_SDRAM_2;
++	gd->bd->bi_dram[1].size =3D PHYS_SDRAM_2_SIZE;
++
+ 	return 0;
+ }
+=20
+diff --git a/include/configs/total_compute.h b/include/configs/total_compu=
te.h
+index cc93f1930a..283268607a 100644
+--- a/include/configs/total_compute.h
++++ b/include/configs/total_compute.h
+@@ -34,6 +34,9 @@
+ #define PHYS_SDRAM_1_SIZE	0x80000000 - DRAM_SEC_SIZE
+ #define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM_1
+=20
++#define PHYS_SDRAM_2		0x8080000000
++#define PHYS_SDRAM_2_SIZE	0x180000000
++
+ #define CONFIG_ARM_PL180_MMCI_BASE		0x001c050000
+ #define CONFIG_SYS_MMC_MAX_BLK_COUNT		127
+ #define CONFIG_ARM_PL180_MMCI_CLOCK_FREQ	12000000
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-b=
sp/recipes-bsp/u-boot/u-boot_%.bbappend
index 5a927ba..a0709dd 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -77,4 +77,7 @@ SRC_URI:append:fvp-base-arm32 =3D " file://0001-Add-vexpr=
ess_aemv8a_aarch32-varian
 #
 # TC0 and TC1 MACHINES
 #
-SRC_URI:append:tc =3D " file://bootargs.cfg"
+SRC_URI:append:tc =3D " \
+        file://bootargs.cfg \
+        file://0001-arm-total_compute-increase-DRAM-to-8GB.patch \
+        "
--=20
2.30.2


