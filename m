Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.80])
 by mx.groups.io with SMTP id smtpd.web11.5489.1583924229860158194
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Mar 2020 03:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=EZ+HdykK;
 spf=pass (domain: arm.com, ip: 40.107.8.80, mailfrom: rui.silva@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AR7wUxMf9OUnbD//y34cDp7TKq6CMJcXBsU8/BTkzbU=;
 b=EZ+HdykKDC07ZUZ7TtUOdsxMlRoRmCZ+xGML7YVRtT+Byn1LOgukx1xC7NQSbZPyMCTfODMlooYrckgYzhtYO+It6OZye1lq5DsGAjZmX6f5lSiu5saydhOIoUd6563cxqY4wE/cy/6TBOpLaegSeUg0s7/QRMCSHVd7jJYp3JE=
Received: from VI1PR07CA0210.eurprd07.prod.outlook.com (2603:10a6:802:3f::34)
 by AM0PR08MB3955.eurprd08.prod.outlook.com (2603:10a6:208:12d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Wed, 11 Mar
 2020 10:57:07 +0000
Received: from VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:802:3f:cafe::fc) by VI1PR07CA0210.outlook.office365.com
 (2603:10a6:802:3f::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.9 via Frontend
 Transport; Wed, 11 Mar 2020 10:57:06 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT053.mail.protection.outlook.com (10.152.19.198) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13 via Frontend Transport; Wed, 11 Mar 2020 10:57:06 +0000
Received: ("Tessian outbound da94dc68d1bb:v42"); Wed, 11 Mar 2020 10:57:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 80807433ff629ae6
X-CR-MTA-TID: 64aa7808
Received: from 667bb7993ee3.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C3B87618-895D-4F33-88DE-7FA670D4D51B.1;
	Wed, 11 Mar 2020 10:57:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 667bb7993ee3.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 11 Mar 2020 10:57:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=muF0Ga+xuTQTaMwqIrGkK073yryi6nfHDkI5D/nlvoj4VntE06cTV4mqThW18drWUDbvWQ0TgpA/sjqAIviF5xurqM67hUu5BKRrFXkuVg47APXy8jpYxpZgI0EXHML+Krvs35W+CcREYFLvngUsF/o8/7rehgDabhFoPSJAsb3vB9vQ46Ui6cIwFCadgAeJK6j0VfrA7qVVvWKnGaJeAz8tfwkD4DrVbc7Bc0b0h093/xrUpDMzI+EM0YTVXWbAr/GmS/VwQjrYZjEMSs99ArjN2xN6A74GLDNe7cHyfB0gye6mNIgxKQdwgLfmVXmw7IHYK8cKREd1cwGRZ+bybA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AR7wUxMf9OUnbD//y34cDp7TKq6CMJcXBsU8/BTkzbU=;
 b=V+Rq3b/6tBqMnLyQGkMau8sKszX3FbnDiwcllSAJh5O+H6VlMo2EOz24xPbnmC9CL5gDpS/TvpZjTVJkRFu/RhzwXfT2jH1mjDKUo8VlaR7jurYBeNsAqkunYVpKWvTVT7Wz6winC5XHmSJDqq6Xd8UtD3eG4inxTyYBBpD0cSnE+LIgpCEeAJqWr0lSFACAy/GafvqbphTn3DOojDxEaKHzjQ7PB9LRpbYhWmS1HyOCgllj3YTbpE7EMEnnZTyHpXcG2rxXH7Qfpo2C0jzZVVH7Ifvc0qKRjcDPEc7pEHhOSHXr/7SIlnPjcDo0Wrk0VlLFRuVuH8CKSRq4ziXpFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AR7wUxMf9OUnbD//y34cDp7TKq6CMJcXBsU8/BTkzbU=;
 b=EZ+HdykKDC07ZUZ7TtUOdsxMlRoRmCZ+xGML7YVRtT+Byn1LOgukx1xC7NQSbZPyMCTfODMlooYrckgYzhtYO+It6OZye1lq5DsGAjZmX6f5lSiu5saydhOIoUd6563cxqY4wE/cy/6TBOpLaegSeUg0s7/QRMCSHVd7jJYp3JE=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Rui.Silva@arm.com; 
Received: from HE1PR0801MB2044.eurprd08.prod.outlook.com (10.168.95.21) by
 HE1PR0801MB2028.eurprd08.prod.outlook.com (10.168.98.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.16; Wed, 11 Mar 2020 10:57:00 +0000
Received: from HE1PR0801MB2044.eurprd08.prod.outlook.com
 ([fe80::42b:e060:9180:6be]) by HE1PR0801MB2044.eurprd08.prod.outlook.com
 ([fe80::42b:e060:9180:6be%8]) with mapi id 15.20.2814.007; Wed, 11 Mar 2020
 10:57:00 +0000
From: "Rui Miguel Silva" <rui.silva@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Rui Silva <rui.silva@arm.com>
Subject: [PATCH 2/3] arm-bsp: u-boot: move machine patches
Date: Wed, 11 Mar 2020 10:56:42 +0000
Message-Id: <20200311105643.159467-3-rui.silva@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311105643.159467-1-rui.silva@arm.com>
References: <20200311105643.159467-1-rui.silva@arm.com>
X-ClientProxiedBy: MRXP264CA0020.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::32) To HE1PR0801MB2044.eurprd08.prod.outlook.com
 (2603:10a6:3:50::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from arch-thunder.local (109.49.46.234) by MRXP264CA0020.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.14 via Frontend Transport; Wed, 11 Mar 2020 10:56:59 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [109.49.46.234]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: aeed4188-70ff-4dfd-5411-08d7c5aaf099
X-MS-TrafficTypeDiagnostic: HE1PR0801MB2028:|HE1PR0801MB2028:|AM0PR08MB3955:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3955ABA5A0B31C4987492091EAFC0@AM0PR08MB3955.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:159;OLM:8273;
X-Forefront-PRVS: 0339F89554
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(199004)(4326008)(6512007)(26005)(66476007)(36756003)(52116002)(66946007)(186003)(66556008)(2906002)(478600001)(1076003)(6506007)(316002)(8676002)(81156014)(6486002)(16526019)(6666004)(86362001)(2616005)(81166006)(6916009)(956004)(8936002)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:HE1PR0801MB2028;H:HE1PR0801MB2044.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 UpTTUW3galYqkgWy4dMLTZ1eOt7JReHd3E3f3FCFKhIdiI8VRJGgHTQhCWYJIVJoeDDG9fJ5T8BFCy5zAs8X8NdSm5kTurOj/0oSEh/SdWLQxs/Q0sTpKB3QT5PY339kyCD+8v0/wzAyNQ0iDMu8sejcGSL45J75y8plJ2aEyv2yxggXl4cve/b09HuLYmU/4CvydTMFCzejyKfF/5LS09v+6nNTAFrL5gtJXO8zSxhjxT1YZI93+PxDi8aAVbWGNAwUNgo8mJKzVjlBq4nyhZVKgOHSMIAD7xPUJt0zqXnUJlqHchsvkn9zBAEIZhxR15Kx0jbWGTOb5Bbwo+g37s1V0IyS3Ul+bxap3XzeKx7U3N74MPDFsa162PdgvuAQ2rwpLNVqsREAGFqZADWSzjGQg7M2I7Kj1xyBUK9Kev2u2AvHuu3zRbOQFqWWu50u
X-MS-Exchange-AntiSpam-MessageData: 
 XcrMDxjuUwYUQwMPUfhm0GuDuVeSaZrz3tEa7LKBhU+v5AHkAEDAFz02Ad/gYD3G/LAJRoi5WiHkMwp3UVlKIRXVKixdZK99y/fPSylFiBTUMY+uXmhyjJLvqdqV04BF+GZ1myzaWFSsTDgGXV6SBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2028
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Rui.Silva@arm.com; 
Return-Path: Rui.Silva@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(346002)(136003)(396003)(376002)(199004)(70586007)(36756003)(70206006)(1076003)(6916009)(8676002)(2906002)(81156014)(956004)(81166006)(2616005)(316002)(6486002)(36906005)(6512007)(478600001)(186003)(336012)(5660300002)(4326008)(26005)(16526019)(6506007)(356004)(86362001)(8936002)(6666004)(26826003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR08MB3955;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dd271147-fa27-41e5-bf51-08d7c5aaec61
X-Forefront-PRVS: 0339F89554
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tmy0RhWZLPMCy1c1g11o4B1WvwoeTFvi+xtTW9AxzfjHO4+Yxn4ddusn0txxmudBe3O3PKA9hH4F8BoES3doF55el1FvAfZ+obxrlfF/EgMtMHJ4WZE21cACtKe/wkkVENHQk5nSlD9G56ScRnHUHnQi9u5xVx380oCo35e7Rw4j16Y9aEj7yFbB2ig3BCte/rU0besXTrfEs0WAIKL9+/KB2NdovMqX38AvGAUvJigZBfk4ldDyNJi+C72Vusc0ApdJspbT1nt69mNEygtkq3vFjHDQT8Xfseua6CQsJ3P1YdpbhEi092wU/kpwdhbY2CF4+f1NhBhRl6o01hU9G7qQsHIW0XpJcdPMTqRo00Hqp+DIPYL98kqD+8HCg68xdXf5CPIUfrbgaa5SVWBtw2ogdmG0Wj0MJdU3udJxmmBxF8ESxNz9K97VwWFShrSC
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2020 10:57:06.6806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aeed4188-70ff-4dfd-5411-08d7c5aaf099
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3955
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Rui Silva <rui.silva@arm.com>

Move Juno patches to machine specific directory. This will allow to
add others machines related patches later on.

Change-Id: I71c327ca4866fdb0205eeac0f40475e691caf4cc
Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
---
 .../u-boot/files/{ =3D> juno}/u-boot_vexpress_uenv.patch          | 0
 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2019.%.bbappend          | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm-bsp/recipes-bsp/u-boot/files/{ =3D> juno}/u-boot_vexpress_=
uenv.patch (100%)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/u-boot_vexpress_uenv.pat=
ch b/meta-arm-bsp/recipes-bsp/u-boot/files/juno/u-boot_vexpress_uenv.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/files/u-boot_vexpress_uenv.patc=
h
rename to meta-arm-bsp/recipes-bsp/u-boot/files/juno/u-boot_vexpress_uenv.p=
atch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2019.%.bbappend b/meta-=
arm-bsp/recipes-bsp/u-boot/u-boot_2019.%.bbappend
index bc96163d9e0c..1dd7d8973bc3 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2019.%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2019.%.bbappend
@@ -4,6 +4,6 @@
 # Patch u-boot to add environment variables from Flash
 #

-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files/${MACHINE}:"

 SRC_URI_append_juno =3D " file://u-boot_vexpress_uenv.patch"
--
2.25.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
