Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.62])
 by mx.groups.io with SMTP id smtpd.web11.12804.1584532216128079156
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Mar 2020 04:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=cV1NlgX2;
 spf=pass (domain: arm.com, ip: 40.107.3.62, mailfrom: rahul.singh@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eH9Q6grja5wcGyaLXs6d9g0x4jUPUEel7Qx4cfZfhws=;
 b=cV1NlgX2UwzWs1ovmJ30KoxCTopoeo4jKr+SoIwWrQ+cRxdUKsLZg3MD97pRlqqg+DSWT3BxhNPm+Io94XinGbrxi76TFODRl1FrC8scSuNAt2UzXnDxTnJZFSrLmrvhK2o9H1Yot3tlfinG1h3POv9e044b667zOts5U2Kz0ZE=
Received: from DB8P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::23)
 by AM6PR08MB3989.eurprd08.prod.outlook.com (2603:10a6:20b:b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.18; Wed, 18 Mar
 2020 11:50:13 +0000
Received: from DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::b9) by DB8P191CA0013.outlook.office365.com
 (2603:10a6:10:130::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.21 via Frontend
 Transport; Wed, 18 Mar 2020 11:50:13 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT042.mail.protection.outlook.com (10.152.21.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13 via Frontend Transport; Wed, 18 Mar 2020 11:50:13 +0000
Received: ("Tessian outbound 1f9bda537fdc:v42"); Wed, 18 Mar 2020 11:50:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cb0b8d3128bcfec0
X-CR-MTA-TID: 64aa7808
Received: from e8eb6c3906ae.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 541F462F-407B-4FD7-B905-6DA9C93F3847.1;
	Wed, 18 Mar 2020 11:50:08 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e8eb6c3906ae.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 18 Mar 2020 11:50:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KqkR2dMHOfG2kcyG5/n1n9BDXUY6r32pf2RI43Fe2fJy+5Wrbg+okpCGWrc/PH1WCqPVrmS0DOsmwZr4neACJHsfHUoJwSi4bk5kSQLKHfL4Zlb4psAZ5lK6dkzajzpniPMFGkirISo/5/sKS/NDPIYL6RifIq0RGFFUyYXkTKkImnX9m+RE05IJvw3cEmPbyrsr1SguFPerc2ZtM+yQZD55gPaXQyCWKbE8P6cqp2TcNOvrbZYD/kjsaGCKWEb7H+Hu62FhCenONI+juBqVb4T3J4oJKRloTnjd5lQ+Ka04hYUVGBBypDbr7Pm2CGDM3tKeYTynrq5Mu1gilC7p9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eH9Q6grja5wcGyaLXs6d9g0x4jUPUEel7Qx4cfZfhws=;
 b=kgYOlGPWx+d7QptMLr5BsXgiiS39sCnCr04uAPDUURjX1CEDql1Lvk65mgXDOc2N1Ws9+nnBUX/J1TDw1y6g0JklUpAWHpDwGf/boxH1+o+qzW5rZm4Ri4+HrhG5oQZsRhhhRWRJuFCQKN5V8KB0WMhwMWvh7IVJOZqSneAOTG3GJ0VN27QJsVGfFapEk2jx4LXD5xnHJE3JzJVpIDr7/VQprJrO02XVNaNa8q+S24vG0mg7H7WTXbGpAtfZhEH/HGcO9XbdlJIY1i7olMDBPSoF2IwrkdVVSQ1i4tynp4SMhZcdGDZnye8Ih2s4NmX+L65XXYmaT8Lx63xlmyRwzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eH9Q6grja5wcGyaLXs6d9g0x4jUPUEel7Qx4cfZfhws=;
 b=cV1NlgX2UwzWs1ovmJ30KoxCTopoeo4jKr+SoIwWrQ+cRxdUKsLZg3MD97pRlqqg+DSWT3BxhNPm+Io94XinGbrxi76TFODRl1FrC8scSuNAt2UzXnDxTnJZFSrLmrvhK2o9H1Yot3tlfinG1h3POv9e044b667zOts5U2Kz0ZE=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Rahul.Singh@arm.com; 
Received: from DBBPR08MB5547.eurprd08.prod.outlook.com (20.179.44.150) by
 DBBPR08MB4853.eurprd08.prod.outlook.com (20.179.45.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Wed, 18 Mar 2020 11:50:06 +0000
Received: from DBBPR08MB5547.eurprd08.prod.outlook.com
 ([fe80::1490:577c:4c1d:b5fa]) by DBBPR08MB5547.eurprd08.prod.outlook.com
 ([fe80::1490:577c:4c1d:b5fa%3]) with mapi id 15.20.2814.021; Wed, 18 Mar 2020
 11:50:06 +0000
From: rahul.singh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] Use xen dtb if xen image is present
Date: Wed, 18 Mar 2020 11:49:34 +0000
Message-Id: <20200318114934.9841-1-rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: PN1PR01CA0107.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00::23)
 To DBBPR08MB5547.eurprd08.prod.outlook.com (2603:10a6:10:d2::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.49) by PN1PR01CA0107.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.19 via Frontend Transport; Wed, 18 Mar 2020 11:50:05 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.49]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: da2f5796-2e99-49ea-28b1-08d7cb32851a
X-MS-TrafficTypeDiagnostic: DBBPR08MB4853:|AM6PR08MB3989:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB398954888E7F83D5E8EFC506FCF70@AM6PR08MB3989.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:288;OLM:288;
X-Forefront-PRVS: 03468CBA43
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(199004)(7696005)(66476007)(66946007)(66556008)(52116002)(316002)(1076003)(86362001)(36756003)(8676002)(8936002)(81166006)(81156014)(6916009)(2906002)(478600001)(5660300002)(6486002)(4326008)(186003)(44832011)(16526019)(26005)(6666004)(956004)(2616005);DIR:OUT;SFP:1101;SCL:1;SRVR:DBBPR08MB4853;H:DBBPR08MB5547.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 TNRH2FTCHYQpcfFAiZYaHGm5ZGF+GOLPAJuOiSZvVkxMhI7/oAi1kAVcNQyb+QNxXSGM/3Ffg06k+AyLvjE1TSm6EQfjN7d7OtPcDqC+jqpMLzmcrqgG91viLUGrqfEEXJ5dMSACdTGNv+BAM2aevtQCc0FGszNECQtlTXaRL7Gy44m4WXdr3oXH7i5pyYe+vbisvbMTFr9LXYhegxuEusX4Hw0F0CLWfbG5s62ATm6C616wVKKk7+XM3AUJJK0YD5Fs66HbMyO2F/CiJI44datCKFl5yAyVcGv6XdvabFJIov17s12f18d+VQ6EPjPPD5NyPymB1sJZj1LzQ7Dg36SljNv2tHZcCTyyOIDdKAPQ0ZvIhSD9p0fziinr6HU4DhrHfkCHwXWceK2Oaw9T3vsJhKjxbOjr9F3Plj/kjYRSVG1TAazO9tXah/9ndBKF
X-MS-Exchange-AntiSpam-MessageData: 
 +O7lF57cEYlv2F2hU9nv4hTEdX/Diw74v63N33rDysZRpaBJVXctmiNDoFUhZsu+jSjpKlMcz1DZAlyRDDpRKpSrieFFDP3FScY+ZmW3rPMy60IbkswBJ0GV18cfSKIxhMgiuoFwd3mGzfNZbPpY1Q==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4853
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Rahul.Singh@arm.com; 
Return-Path: Rahul.Singh@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(199004)(46966005)(316002)(44832011)(7696005)(8936002)(47076004)(6486002)(86362001)(26826003)(81166006)(8676002)(81156014)(1076003)(478600001)(4326008)(6666004)(356004)(956004)(336012)(70586007)(36756003)(16526019)(70206006)(26005)(6916009)(5660300002)(2906002)(186003)(2616005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR08MB3989;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8839c550-038b-496c-d5aa-08d7cb3280a7
X-Forefront-PRVS: 03468CBA43
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fI/5IjIp+P3uvZB30quSQkVsaSkzUfo9zxoJ20yQCspxC16HfQfSHIneCi0+iYhL+3W2BoQeTuU8L+suSsE2d+D0lvWT0ah1xQ5MKUqBDF2wLA9eFH0sLk4xOSjMqMj55yQUiatT7JnqvMiBMmXvFN1aWRuCRqjJ/tCOuxGUGuqFE/1eRenQmuOCVqBfHR9kYH8UqShgwf6X2ARjOxOjJyhSJMn1HQwREVEF9imYSIqBW15FKdsK/ldgCpEY8FmQMcbBluvsciXlMRWGiOfhBq2JD0/2NqH3lrPhPorxoHUdn9X7nbWSvLr2MmI7cnU2nt+QGQaz5/+GUzONhCvWuJ+mB4JUpXshiXUXQdttHWfPej4iO9znVqaDkkqSny+FkHZYRE+RKZaPEKQzyt6/ddzJvJ1VCbPBF0wb7uC3hy+4d4TNbCDvVzBNAtpCso5CX7OzPOOt7dXKQ4WCL/cKpZzn4lDuhkdrmB144BiYzSkKkSUu5FuMHw1rMYmBbVEY7hvqE7dFwrn3mL7OHe8jDQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2020 11:50:13.8021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da2f5796-2e99-49ea-28b1-08d7cb32851a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3989
Content-Type: text/plain

Use xen dtb if xen image is present for foundation
and fvp pltaform.

Change-Id: I8ee0c5f59ea731202ca97c2cdef315cc5e6665e6
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 .../fvp-common/files/start-foundation-armv8.sh | 18 +++++++++++-------
 .../fvp-common/files/start-fvp-base.sh         | 18 +++++++++++-------
 2 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh
index 1df4fd8..a113998 100755
--- a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh
+++ b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh
@@ -12,7 +12,7 @@ source <(MACHINE=foundation-armv8 bitbake -e foundation-armv8-native | grep \
 
 # Bitbake image to run
 IMAGE_NAME="$(cd $DEPLOY_DIR_IMAGE; ls *-foundation-armv8.manifest | \
-    sed -e "s/-foundation-armv8\.manifest//")"
+    sed -e "s/-foundation-armv8\.manifest//" | head -1)"
 
 # BL1 and FIP files
 BL1_FILE="bl1-fvp.bin"
@@ -210,6 +210,16 @@ if [ -n "$KERNEL_FILE" ]; then
         --data=$DEPLOY_DIR_IMAGE/$KERNEL_FILE@$KERNEL_ADDR"
 fi
 
+# Add xen if present
+if [ -n "$XEN_FILE" -a -f $DEPLOY_DIR_IMAGE/$XEN_FILE ]; then
+   FOUNDATION_PLAT_ARGS="$FOUNDATION_PLAT_ARGS \
+       --data=$DEPLOY_DIR_IMAGE/$XEN_FILE@$XEN_ADDR"
+   #switch dtb if there
+   if [ -f $DEPLOY_DIR_IMAGE/$(basename ${DTB_FILE} .dtb)-xen.dtb ]; then
+      DTB_FILE=$(basename ${DTB_FILE} .dtb)-xen.dtb
+   fi
+fi
+
 # Add DTB
 if [ -n "$DTB_FILE" ]; then
     if [ ! -f $DEPLOY_DIR_IMAGE/$DTB_FILE ]; then
@@ -220,12 +230,6 @@ if [ -n "$DTB_FILE" ]; then
         --data=$DEPLOY_DIR_IMAGE/$DTB_FILE@$DTB_ADDR"
 fi
 
-# Add xen if present
-if [ -n "$XEN_FILE" -a -f $DEPLOY_DIR_IMAGE/$XEN_FILE ]; then
-   FOUNDATION_PLAT_ARGS="$FOUNDATION_PLAT_ARGS \
-       --data=$DEPLOY_DIR_IMAGE/$XEN_FILE@$XEN_ADDR"
-fi
-
 # Add disk if present
 if [ -n "$DISK_FILE" -a -f $DEPLOY_DIR_IMAGE/$DISK_FILE ]; then
     FOUNDATION_PLAT_ARGS="$FOUNDATION_PLAT_ARGS \
diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
index ab60cea..f391c23 100755
--- a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
+++ b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
@@ -12,7 +12,7 @@ source <(MACHINE=fvp-base bitbake -e fvp-base-native | grep \
 
 # Bitbake image to run
 IMAGE_NAME="$(cd $DEPLOY_DIR_IMAGE; ls *-fvp-base.manifest | \
-    sed -e "s/-fvp-base\.manifest//")"
+    sed -e "s/-fvp-base\.manifest//" | head -1)"
 
 # BL1 and FIP files
 BL1_FILE="bl1-fvp.bin"
@@ -202,6 +202,16 @@ if [ -n "$KERNEL_FILE" ]; then
         --data cluster0.cpu0=$DEPLOY_DIR_IMAGE/$KERNEL_FILE@$KERNEL_ADDR"
 fi
 
+# Add xen if present
+if [ -n "$XEN_FILE" -a -f $DEPLOY_DIR_IMAGE/$XEN_FILE ]; then
+    FVPARGS="$FVPARGS \
+        --data cluster0.cpu0=$DEPLOY_DIR_IMAGE/$XEN_FILE@$XEN_ADDR"
+   #switch dtb if there
+   if [ -f $DEPLOY_DIR_IMAGE/$(basename ${DTB_FILE} .dtb)-xen.dtb ]; then
+      DTB_FILE=$(basename ${DTB_FILE} .dtb)-xen.dtb
+   fi
+fi
+
 # Add DTB
 if [ -n "$DTB_FILE" ]; then
     if [ ! -f $DEPLOY_DIR_IMAGE/$DTB_FILE ]; then
@@ -212,12 +222,6 @@ if [ -n "$DTB_FILE" ]; then
         --data cluster0.cpu0=$DEPLOY_DIR_IMAGE/$DTB_FILE@$DTB_ADDR"
 fi
 
-# Add xen if present
-if [ -n "$XEN_FILE" -a -f $DEPLOY_DIR_IMAGE/$XEN_FILE ]; then
-    FVPARGS="$FVPARGS \
-        --data cluster0.cpu0=$DEPLOY_DIR_IMAGE/$XEN_FILE@$XEN_ADDR"
-fi
-
 # Add disk if present
 if [ -n "$DISK_FILE" -a -f $DEPLOY_DIR_IMAGE/$DISK_FILE ]; then
     FVPARGS="$FVPARGS \
-- 
2.17.1

