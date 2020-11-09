Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.70])
 by mx.groups.io with SMTP id smtpd.web10.9258.1604915359383578414
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 01:49:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=PUDpKt4u;
 spf=pass (domain: arm.com, ip: 40.107.7.70, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZyMKwHGpr4VjWP7CAj3gbVdkCj7mJ4hFmIjYEdsVPg=;
 b=PUDpKt4uyo9L3s2W8SndGf9QI7hw4IujFe2flpHOEFpoWKNGZSrwy5JeLrqxV0o8v62Uq9dsP8xOBFFWOaxvuc0Khb7/xTfkwrCue/iF0yLbRinxQ/BUxEulE4HqSibvfv0qAubfRAilTzh4GbeiSWT9Yj4uLnShP0gZHXRkwP8=
Received: from DB6PR0802CA0038.eurprd08.prod.outlook.com (2603:10a6:4:a3::24)
 by PR3PR08MB5786.eurprd08.prod.outlook.com (2603:10a6:102:85::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Mon, 9 Nov
 2020 09:49:16 +0000
Received: from DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::a1) by DB6PR0802CA0038.outlook.office365.com
 (2603:10a6:4:a3::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Mon, 9 Nov 2020 09:49:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT053.mail.protection.outlook.com (10.152.21.119) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Mon, 9 Nov 2020 09:49:15 +0000
Received: ("Tessian outbound 39167997cde8:v71"); Mon, 09 Nov 2020 09:49:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 985c16460383da19
X-CR-MTA-TID: 64aa7808
Received: from 3ef35cca8a44.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 57523EEE-24F7-41CC-BAF8-D3FDA9D2C443.1;
	Mon, 09 Nov 2020 09:49:09 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3ef35cca8a44.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 09 Nov 2020 09:49:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGCEmcXGq9M6L3fWvOpfN/GL6rz4p25DLi4Z8EYo0rQt8jmj8gQQUpMO3QMG3c9Wm13xqMcWx2RmvSzcUkA6IYaYh8nMVaDZCWO8uSZYdWal/IVxIxD8nmKgXgyMSGD0jzAApVAD3kQjT1oj9UtfS6P+EI6aOBmHANYLBWCl+5qpHx/FOQOm9vI6Ng5JKXZcoC1vtvV8vISGSLk9POTc1rV//XDK8Kdy8Aoru79gANFkYQQLKfGFLsFaYz4i3+80OKzqADxfnD4Dd/0jOmwAeOl43wPXHt/6DU2ctV9hBJcd97/1q8bVkIgRW5UpjiPo+KIb0D6BvuMLkmBH7pjS3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZyMKwHGpr4VjWP7CAj3gbVdkCj7mJ4hFmIjYEdsVPg=;
 b=HMOG2q+3DlTgmo4/KLUdZ/Jq5lO1BFprT568PtjR81GRyGc6tW2IKZR1TvG7vNunVcrCSxBrEoNH6TBNmxcDM/IIdm+p2Zfxu/2whvxKXg2KfQtqYb6AWEBok7aXKMRI0BEYcPPQ8I07IFnosR0ZmHG11XFzNSQn8OPSIMK1XH4OS2fwArGBcY+KyuvMv+SS68HhooEB126ddX1dWICZ5U3VfMSCCDhHcTpooZpOj1aqYFiHWq3yqHolTpxEGie2H8xTTzkR1rKrIY0svtHtUGx/miEoP1lQj56tIUk84IjX/NvJQwZ66bM68qNGr+v1hdVvNOM+HNr2oT5sdFJ4UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZyMKwHGpr4VjWP7CAj3gbVdkCj7mJ4hFmIjYEdsVPg=;
 b=PUDpKt4uyo9L3s2W8SndGf9QI7hw4IujFe2flpHOEFpoWKNGZSrwy5JeLrqxV0o8v62Uq9dsP8xOBFFWOaxvuc0Khb7/xTfkwrCue/iF0yLbRinxQ/BUxEulE4HqSibvfv0qAubfRAilTzh4GbeiSWT9Yj4uLnShP0gZHXRkwP8=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4232.eurprd08.prod.outlook.com (2603:10a6:20b:b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Mon, 9 Nov
 2020 09:49:07 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf%6]) with mapi id 15.20.3499.032; Mon, 9 Nov 2020
 09:49:07 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] arm-autonomy/linux-arm-autonomy: Introduce xen-common.scc KERNEL_FEATURES
Date: Mon,  9 Nov 2020 09:47:34 +0000
Message-Id: <de4c26d7c083cda26d9280ce7ec17f7013821244.1604915177.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.51]
X-ClientProxiedBy: LO2P265CA0294.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::18) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.51) by LO2P265CA0294.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a5::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3541.21 via Frontend Transport; Mon, 9 Nov 2020 09:49:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8cd3098d-0e15-4a24-cdec-08d88494b883
X-MS-TrafficTypeDiagnostic: AM6PR08MB4232:|PR3PR08MB5786:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB5786196D8A7667DB2182DF2792EA0@PR3PR08MB5786.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 VifWh0HZcKocyU0HI44+oHdqDOXaiwdPZMs8A4XIBy5ckIXilvqoo55cEu2ePAphb06FVGZP6ML5gGVRyMSRapdowX61ZglPfhiCKSNNllIRVdQJF/37+JGKOg0DeOY0aIVe9fOSOLzS7xFQz90tD7SWNqom50EPW9KR62bX3vAN+G+ABhSqPUXhSWpgbuXCgdAaDAVvblbuGSjJ4aEFuVlmVNBBQfCd/yr6xXA2M0zh3fyy3UwHQvRtwf3uW54/JoPTbUKk3/CYkLX0bWl7nwlp4ZrzdJxXVX9IpWRd9lMN2Meom/3EY9jsLsKPHXamM3WvJUyhOWdLlGA5ww8Gvw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(66556008)(26005)(52116002)(6666004)(36756003)(2906002)(956004)(7696005)(86362001)(16526019)(66476007)(66946007)(83380400001)(6916009)(316002)(478600001)(186003)(8936002)(8676002)(2616005)(5660300002)(44832011)(6486002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 aOKaL7+Pwot8JEHzKo0usxid0V/Vi1tMKPBqEtnj9Btgf28VsqQ/r7UKJi1Vthoe5fKkFOEeMZrGjjj34EuDpVrPjxHR87ogv8kizfszj5hvECN5tT6YAEmvx82512w3BBZsPqx6NGY+4fp+9drtFCd8C54jX1akgXEjAbHX9TrTvC8i2HTnEunwIlX2jHVpisgqEK90z/RsZrSdcM1ykgPolq/mEY4D/kTi5L+LFnp3xu8h0pSWQmEQVnoFyrHXo1XktQfd9uACac5lkJdos7xpk5LdJ+DNxSnMYPGVcTsMwzA6YjfZr0TdHk9L0UYhU4XAEQZ5CHWWhCLo6ppL9TghyFD+fWPi1GElvR56OQl25/0Dal5MmY/y8PVPFVDJvuIKGNyiuZgWfHM/o3ckZg0UQMuuucCIq1ux1jGptDRsY/MSh2Nzw+i8drKD/AE0SHop6pJJ9WR00KIsnrtt1LNinLKNoikvElnQIQSoSq7alIkPMct4iji7e+WBoWo05T48LgelfNd8APmI1g8iEgq0FE5d1sA8QgjkdjmyVjPQKN+3iLZc/mvth+Z+PeyayZXSSITMdFIHr3hjz3XA3k2lRYeuAoCX57O9t9ZCUbCm+Srz7jUZ9X5oz3M03nRMtIok1vP9XQec+zUEYnU43A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4232
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	135cc225-6b51-474a-5b34-08d88494b384
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9IpwVHpJXqfeX4M7XeG2ZVtzWtoJKq2aS9smOMGWfdNAN1LjDh1bqvJzUmpgqYvD1bp++gvwTOaNuyng2u5NPkHC//S+R7Vriu70v2oR22KL/Fd3jwhAThYbFs6oeKODH3/iDTgtZIctzcIS1W4JewiiotTBGk3diT9br7z15YZZurxic0S1UIj8BcAWtGC3HFc+07vr9CSJ/3Nj2NTZ5yliiN83lOmWfRexappptygTYnVoT9erP91sK0icuJAEcvxQDpft74ZUwpB/0IBwSEe9FXU0n0mx4DFFwePCltNbuFh9ABv0soyVzd9xPlkCB89IGeKCVOAivG1fNEi9CLHRqlv7nsaZ4fWuI8t7shRmtDCjW/h82801afodT66/bIG1T+pSU7jGVUqtv3hhWQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(46966005)(44832011)(2616005)(36756003)(7696005)(82310400003)(6666004)(2906002)(26005)(8676002)(956004)(336012)(16526019)(8936002)(186003)(81166007)(478600001)(83380400001)(47076004)(356005)(70206006)(70586007)(5660300002)(6486002)(82740400003)(4326008)(316002)(86362001)(6916009);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 09:49:15.8512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd3098d-0e15-4a24-cdec-08d88494b883
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5786
Content-Type: text/plain

Add xen-common.scc KERNEL_FEATURES to group common kernel configs and patches
for both Xen Host and Guest.

Change-Id: I3a14386e387b9778c962dd9fdbe9a60ce2e97e77
Issue-Id: SCM-1520
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../features/arm-autonomy/xen-common.cfg           | 31 ++++++++++++++++++++++
 .../features/arm-autonomy/xen-common.scc           |  5 ++++
 .../features/arm-autonomy/xen-guest.cfg            | 26 ------------------
 .../features/arm-autonomy/xen-guest.scc            |  2 --
 .../features/arm-autonomy/xen-host.cfg             | 28 -------------------
 .../features/arm-autonomy/xen-host.scc             |  2 --
 .../recipes-kernel/linux/linux-arm-autonomy.inc    |  6 +++++
 7 files changed, 42 insertions(+), 58 deletions(-)
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.cfg
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.scc

diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.cfg b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.cfg
new file mode 100644
index 0000000..1e61403
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.cfg
@@ -0,0 +1,31 @@
+CONFIG_PARAVIRT=y
+CONFIG_XEN=y
+
+CONFIG_BLOCK=y
+
+CONFIG_SCSI=y
+
+CONFIG_NET=y
+
+CONFIG_HVC_IRQ=y
+
+CONFIG_HVC_XEN=y
+
+CONFIG_WATCHDOG=y
+CONFIG_XEN_WDT=y
+
+CONFIG_XEN_BALLOON=y
+
+CONFIG_XEN_DEV_EVTCHN=y
+
+CONFIG_XENFS=y
+CONFIG_XEN_COMPAT_XENFS=y
+
+CONFIG_XEN_SYS_HYPERVISOR=y
+
+CONFIG_XEN_GNTDEV=y
+CONFIG_XEN_GRANT_DEV_ALLOC=y
+CONFIG_SWIOTLB_XEN=y
+
+CONFIG_XEN_EFI=y
+CONFIG_XEN_AUTO_XLATE=y
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.scc b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.scc
new file mode 100644
index 0000000..beee091
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.scc
@@ -0,0 +1,5 @@
+define KFEATURE_DESCRIPTION "Common XEN (Host and Guest) configs and patches on autonomy systems"
+
+kconf non-hardware xen-common.cfg
+
+patch 0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.cfg b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.cfg
index e4e44a9..bb2cbd5 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.cfg
+++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.cfg
@@ -1,27 +1,15 @@
-CONFIG_PARAVIRT=y
-CONFIG_XEN=y
-
-CONFIG_BLOCK=y
 CONFIG_XEN_BLKDEV_FRONTEND=y
 
-CONFIG_SCSI=y
 CONFIG_XEN_SCSI_FRONTEND=y
 
-CONFIG_NET=y
 CONFIG_XEN_NETDEV_FRONTEND=y
 
 CONFIG_INPUT=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_XEN_KBDDEV_FRONTEND=y
 
-CONFIG_HVC_IRQ=y
-
-CONFIG_HVC_XEN=y
 CONFIG_HVC_XEN_FRONTEND=y
 
-CONFIG_WATCHDOG=y
-CONFIG_XEN_WDT=y
-
 CONFIG_FB_SYS_FILLRECT=y
 CONFIG_FB_SYS_COPYAREA=y
 CONFIG_FB_SYS_IMAGEBLIT=y
@@ -29,21 +17,7 @@ CONFIG_FB_SYS_FOPS=y
 CONFIG_FB_DEFERRED_IO=y
 CONFIG_XEN_FBDEV_FRONTEND=y
 
-CONFIG_XEN_BALLOON=y
-
-CONFIG_XEN_DEV_EVTCHN=y
-
-CONFIG_XENFS=y
-CONFIG_XEN_COMPAT_XENFS=y
-
-CONFIG_XEN_SYS_HYPERVISOR=y
 CONFIG_XEN_XENBUS_FRONTEND=y
-CONFIG_XEN_GNTDEV=y
-CONFIG_XEN_GRANT_DEV_ALLOC=y
-CONFIG_SWIOTLB_XEN=y
-
-CONFIG_XEN_EFI=y
-CONFIG_XEN_AUTO_XLATE=y
 
 CONFIG_DRM=y
 CONFIG_DRM_XEN=y
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.scc b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.scc
index b681177..17ded00 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.scc
+++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.scc
@@ -1,5 +1,3 @@
 define KFEATURE_DESCRIPTION "Enable XEN Guest Frontend Drivers"
 
 kconf non-hardware xen-guest.cfg
-
-patch 0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg
index d457cb8..54bd605 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg
+++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg
@@ -1,38 +1,10 @@
-CONFIG_PARAVIRT=y
-CONFIG_XEN=y
-
-CONFIG_BLOCK=y
 CONFIG_XEN_BLKDEV_BACKEND=y
 
-CONFIG_SCSI=y
 CONFIG_TARGET_CORE=y
 CONFIG_XEN_SCSI_BACKEND=y
 
-CONFIG_NET=y
 CONFIG_XEN_NETDEV_BACKEND=y
 
-CONFIG_HVC_IRQ=y
-
-CONFIG_HVC_XEN=y
-
-CONFIG_WATCHDOG=y
-CONFIG_XEN_WDT=y
-
-CONFIG_XEN_BALLOON=y
-
-CONFIG_XEN_DEV_EVTCHN=y
-
-CONFIG_XENFS=y
-CONFIG_XEN_COMPAT_XENFS=y
-
-CONFIG_XEN_SYS_HYPERVISOR=y
-CONFIG_XEN_GNTDEV=y
-CONFIG_XEN_GRANT_DEV_ALLOC=y
-CONFIG_SWIOTLB_XEN=y
-
-CONFIG_XEN_EFI=y
-CONFIG_XEN_AUTO_XLATE=y
-
 # For LVM2 we need Multiple Devices and Device Mapper support
 CONFIG_MD=y
 CONFIG_BLK_DEV_DM=y
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.scc b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.scc
index 61b96a2..7185775 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.scc
+++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.scc
@@ -1,5 +1,3 @@
 define KFEATURE_DESCRIPTION "Enable XEN Host Drivers on autonomy systems"
 
 kconf non-hardware xen-host.cfg
-
-patch 0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch
diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
index d59ca8f..c5cb66d 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
+++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
@@ -7,6 +7,11 @@ FILESEXTRAPATHS_prepend := "${THISDIR}:"
 #
 SRC_URI_append = " file://arm-autonomy-kmeta;type=kmeta;name=arm-autonomy-kmeta;destsuffix=arm-autonomy-kmeta"
 
+# Add common Xen (host and guest) configs and patches
+KERNEL_FEATURES += "${@bb.utils.contains_any('DISTRO_FEATURES', \
+        'arm-autonomy-host arm-autonomy-guest', \
+        'features/arm-autonomy/xen-common.scc', '', d)}"
+
 
 # Add xen host drivers to kernel if arm-autonomy-host is activated
 KERNEL_FEATURES += "${@bb.utils.contains('DISTRO_FEATURES', \
@@ -20,6 +25,7 @@ KERNEL_FEATURES += "${@bb.utils.contains('DISTRO_FEATURES', \
 KERNEL_FEATURES += "${@bb.utils.contains('DISTRO_FEATURES', \
         'arm-autonomy-guest', 'features/arm-autonomy/xen-guest.scc', '', d)}"
 
+
 # Add support for arm64-autonomy-guest machine
 COMPATIBLE_MACHINE_arm64-autonomy-guest = "arm64-autonomy-guest"
 KMACHINE_arm64-autonomy-guest = "arm64-autonomy-guest"
-- 
2.7.4

