Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.49])
 by mx.groups.io with SMTP id smtpd.web10.4394.1587454454218161511
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Apr 2020 00:34:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=n99zFGqc;
 spf=pass (domain: arm.com, ip: 40.107.8.49, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzULIyyODJ29HCqzSupYL7Tv+a212NyoeosbYLimXjs=;
 b=n99zFGqcg/lBHuuLXoEi/oAf0E8tHJX0CBc1UXbb/OCblDR36txYIUSfjugHrEcPVqIg2nq4ZEbg4QA04CUwwpef+vAJk6ryl3dup520L5TylH2gz4Y/kS1MWohlann6ClZDocfZE5bHHnxR9F8rEV1Qo1jMJaZYzskhU8IS9Nc=
Received: from VI1PR08CA0227.eurprd08.prod.outlook.com (2603:10a6:802:15::36)
 by AM6PR08MB3014.eurprd08.prod.outlook.com (2603:10a6:209:47::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Tue, 21 Apr
 2020 07:34:11 +0000
Received: from VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:802:15:cafe::e6) by VI1PR08CA0227.outlook.office365.com
 (2603:10a6:802:15::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Tue, 21 Apr 2020 07:34:10 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT047.mail.protection.outlook.com (10.152.19.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.18 via Frontend Transport; Tue, 21 Apr 2020 07:34:10 +0000
Received: ("Tessian outbound d63670e9da8f:v53"); Tue, 21 Apr 2020 07:34:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3648542f92969e22
X-CR-MTA-TID: 64aa7808
Received: from c91ecaa415bd.4
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0CE6E59A-BD09-43FA-9099-8E6758B0A362.1;
	Tue, 21 Apr 2020 07:34:04 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c91ecaa415bd.4
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 21 Apr 2020 07:34:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BC+OubW5AqIB9pDB9+rDGCsZe/n7UnmUd9kAfC/rQEBZUDOaKjbQCly/djZDSVl63JQqw7qz5wlL+LHFjo4bNZYWzP9o0LkPHNwh6FbRX1W5Xd+cQfn5JBvjLoBjd3OppVuaWEXhVKirDDJuWrj6NR9niQGDMgTocxhVMOO5KckKNjXRdb+e3BwHNHgeGy3nXw32/Z+TRbGywCx8ap1n/oLyb0xFRyca8+5Q1vMkw1JnfaCNu630WP+PxlERCbzee8kGl2F9eP8U9/WKFXguZ+Assau6w5zCRM341QK9wzFyHbX+8K/93rBIZGdv9vrzvs3PU3oIq9C1gskVAQE2WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzULIyyODJ29HCqzSupYL7Tv+a212NyoeosbYLimXjs=;
 b=CwztJgpwee4EJogo5YBy3DwK5afs9cWFBFVgwCE1SeLyj15A4IHCQfXBrgsDYoT4wWfpestqnSQ67g3XhqBB/Ychi0KC+hD7Y2dbb/08p2keJwQG24CxXpgIypALdJEneTGj7i4k0Tor8K6bsemNTfTdkjsR6uOFlZGMQbqz+4oEmNv2Xle8Ecoqcg0sOJZoNvmizGLcfmpzBsSFnSRxTpTcK4i49QDmYiTGM9ZbjDnEsRGasFqLBcVDHMk4NF9Qim3HT8xtwYZXKnEXB4bKe0E2Pg5nusqtMHko/nkJU1NqX3qCnQX4ZOAkfKqamkm24+FxV9R3Z+gU8ntK7boPXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzULIyyODJ29HCqzSupYL7Tv+a212NyoeosbYLimXjs=;
 b=n99zFGqcg/lBHuuLXoEi/oAf0E8tHJX0CBc1UXbb/OCblDR36txYIUSfjugHrEcPVqIg2nq4ZEbg4QA04CUwwpef+vAJk6ryl3dup520L5TylH2gz4Y/kS1MWohlann6ClZDocfZE5bHHnxR9F8rEV1Qo1jMJaZYzskhU8IS9Nc=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB5139.eurprd08.prod.outlook.com (2603:10a6:208:15d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 07:34:03 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2921.027; Tue, 21 Apr 2020
 07:34:03 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 5/5] arm-autonomy: Append firmware-image-juno recipe to collect Xen binaries
Date: Tue, 21 Apr 2020 08:33:55 +0100
Message-Id: <1587454435-46370-6-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587454435-46370-1-git-send-email-diego.sueiro@arm.com>
References: <1587454435-46370-1-git-send-email-diego.sueiro@arm.com>
X-ClientProxiedBy: LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::31) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.53) by LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2921.29 via Frontend Transport; Tue, 21 Apr 2020 07:34:02 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3a07062a-9d4d-4369-006c-08d7e5c661d6
X-MS-TrafficTypeDiagnostic: AM0PR08MB5139:|AM0PR08MB5139:|AM6PR08MB3014:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3014FC08114E46C06792084D92D50@AM6PR08MB3014.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;OLM:2331;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(316002)(81156014)(6666004)(2906002)(8936002)(5660300002)(478600001)(44832011)(2616005)(956004)(26005)(6916009)(6486002)(36756003)(8676002)(66556008)(66476007)(66946007)(52116002)(7696005)(86362001)(16526019)(186003)(4326008);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 JrINmpbuub7oSNj6yItO/hNNjHTRFUAr1AtLIbf0xvKQmWW8AQuJCQMGjZXR1c6iJQhGC6rOkTPQJzI3zUtpel/JYwNVeAfzE5ar2erHu5oyYvtJfx+8wev5hTWLIZQqU+NM0554+wZfrpAK6WKwVVti3zSH7PwBHTJrWPVRSsHAabrD43516Rfd0PbkOSUDrMu41jHga7RAq3eNaDcu8ic6YIzinfCLjnLoveplPokICTi7jauPWj86Fe5auAnLH2+PPjztncEcm+3gzvJ1dAZ7l9IM2Qgnd0LEEWElKwZzxtXArIqTW+xtMyTJg6OJ8dr0dtW2MHv4V8kw/pga+HOw4zjrkcJmqpOOxXCRBNQAo8Mf7sXhWkbsw/qz1tou/w0yrB+wOPkp+DxTY9o+2i/Szs+uNxNh+qZGs5NZFffVZUOhYS1xb+6NMvgpBHP7
X-MS-Exchange-AntiSpam-MessageData: 
 qS8R9OGtDTkfab3ync7PL8EtIHOQc9cQuBWRUIFGlKEFEqCYP4gnG36NLp4ps+SvDfhz+8+d4gJMY4gVtCHK+RbsZcUfJnfSnmeYLuAJE/jd26FssNNHX1ft7LPcUfhVQ88EjaztVBn0qVVs8c3I6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5139
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(396003)(376002)(136003)(346002)(46966005)(36756003)(36906005)(4326008)(82740400003)(316002)(26005)(2906002)(47076004)(6916009)(86362001)(5660300002)(6486002)(81166007)(356005)(7696005)(81156014)(44832011)(186003)(16526019)(6666004)(8936002)(956004)(478600001)(70586007)(70206006)(336012)(8676002)(2616005);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4cecfb3f-47d9-4ce9-e1e7-08d7e5c65d53
X-Forefront-PRVS: 038002787A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hfDrVlUTgzpQWqyPO+/CPgx6o0U3JZjvZLpChnWleCnL9EkIx8rNYHPAiXyUxpQ0c+3YOIPB4S+E1XtatJUk49mMcpJAG77aoJ8hPZsggLhIp/DnH5sOnNsfuxnkgIzncUt6hKWGmSOqMQWtszINuTLcXaptV5WsJMmw5EN/492+SM14biqbjSYYh59JOtmCXe5bmuSa4bwUeTg4wJekhzYBSEm1eEbm7r6CMr9JLZxNyij6MKzH0geTCVvaSNnTn/BoafQE4R1Mc5Xu78NTQmMylNgH6ew6Gg/8Swaisbqe4aavM6X30GddyXTLN1n0Ny920CChreltKn5SZqU7dQxPaX5uj0xbf6zKkDm357mWjU0VsRxyjIF/h6NieZ2OxeS5FGV46C8s3ukmWhFMNA15Rr4+2NyvWwUR7/rlZZ8yifHTgwplpX98e6fnP94n3TrHuKJnQd/0YrY4o5oIyvSWbwLoMiIl5jY4wnBTRX7wwO6wIyspzJWzo1aRJH9Fg8680I+1MlP6veKSN4O3eA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 07:34:10.2753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a07062a-9d4d-4369-006c-08d7e5c661d6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3014
Content-Type: text/plain

For juno, the Xen binary and dtb are now collected by the
firmware-image-juno recipe instead of the trusted-firmware-a.

Change-Id: Iaf4e4821e80c09910771c57ba3dbd481626187d5
Issue-Id: SCM-754
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../recipes-bsp/images/firmware-image-juno.bbappend        | 14 ++++++++++++++
 .../juno => images/firmware-image-juno}/images-r0.txt      |  2 +-
 .../juno => images/firmware-image-juno}/images-r1.txt      |  2 +-
 .../juno => images/firmware-image-juno}/images-r2.txt      |  2 +-
 .../files/juno => images/firmware-image-juno}/uEnv.txt     |  0
 .../trusted-firmware-a/trusted-firmware-a_2.%.bbappend     | 13 -------------
 6 files changed, 17 insertions(+), 16 deletions(-)
 create mode 100644 meta-arm-autonomy/recipes-bsp/images/firmware-image-juno.bbappend
 rename meta-arm-autonomy/recipes-bsp/{trusted-firmware-a/files/juno => images/firmware-image-juno}/images-r0.txt (98%)
 rename meta-arm-autonomy/recipes-bsp/{trusted-firmware-a/files/juno => images/firmware-image-juno}/images-r1.txt (98%)
 rename meta-arm-autonomy/recipes-bsp/{trusted-firmware-a/files/juno => images/firmware-image-juno}/images-r2.txt (98%)
 rename meta-arm-autonomy/recipes-bsp/{trusted-firmware-a/files/juno => images/firmware-image-juno}/uEnv.txt (100%)
 delete mode 100644 meta-arm-autonomy/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend

diff --git a/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno.bbappend b/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno.bbappend
new file mode 100644
index 0000000..55b83d3
--- /dev/null
+++ b/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno.bbappend
@@ -0,0 +1,14 @@
+FILESEXTRAPATHS_prepend_juno := "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '${THISDIR}/${PN}:', '', d)}"
+
+INSTALL_EXTRA_DEPS_juno = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'xen:do_deploy', '', d)}"
+
+do_install[depends] += "${INSTALL_EXTRA_DEPS}"
+
+do_install_append_juno() {
+    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'yes', 'no', d)}" = "yes" ]; then
+        cp  ${DEPLOY_DIR_IMAGE}/xen-${COMPATIBLE_MACHINE}.efi \
+            ${D}/${UNPACK_DIR}/SOFTWARE/xen
+        cp ${DEPLOY_DIR_IMAGE}/*xen.dtb \
+            ${D}/${UNPACK_DIR}/SOFTWARE/
+    fi
+}
diff --git a/meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno/images-r0.txt b/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/images-r0.txt
similarity index 98%
rename from meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno/images-r0.txt
rename to meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/images-r0.txt
index 177cf09..ec32ca2 100644
--- a/meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno/images-r0.txt
+++ b/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/images-r0.txt
@@ -24,7 +24,7 @@ NOR2ENTRY: 00000000              ;Image Entry Point
 
 NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
 NOR3ADDRESS: 0x02700000          ;Image Flash Address
-NOR3FILE: \SOFTWARE\juno.dtb     ;Image File Name
+NOR3FILE: \SOFTWARE\juno-xen.dtb ;Image File Name
 NOR3NAME: board.dtb              ;Specify target filename to preserve file extension
 NOR3LOAD: 00000000               ;Image Load Address
 NOR3ENTRY: 00000000              ;Image Entry Point
diff --git a/meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno/images-r1.txt b/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/images-r1.txt
similarity index 98%
rename from meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno/images-r1.txt
rename to meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/images-r1.txt
index ac40bf0..1372bc3 100644
--- a/meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno/images-r1.txt
+++ b/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/images-r1.txt
@@ -24,7 +24,7 @@ NOR2ENTRY: 00000000              ;Image Entry Point
 
 NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
 NOR3ADDRESS: 0x02700000          ;Image Flash Address
-NOR3FILE: \SOFTWARE\juno-r1.dtb  ;Image File Name
+NOR3FILE: \SOFTWARE\juno-r1-xen.dtb  ;Image File Name
 NOR3NAME: board.dtb              ;Specify target filename to preserve file extension
 NOR3LOAD: 00000000               ;Image Load Address
 NOR3ENTRY: 00000000              ;Image Entry Point
diff --git a/meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno/images-r2.txt b/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/images-r2.txt
similarity index 98%
rename from meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno/images-r2.txt
rename to meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/images-r2.txt
index 423a574..def465e 100644
--- a/meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno/images-r2.txt
+++ b/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/images-r2.txt
@@ -24,7 +24,7 @@ NOR2ENTRY: 00000000              ;Image Entry Point
 
 NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
 NOR3ADDRESS: 0x02700000          ;Image Flash Address
-NOR3FILE: \SOFTWARE\juno-r2.dtb  ;Image File Name
+NOR3FILE: \SOFTWARE\juno-r2-xen.dtb  ;Image File Name
 NOR3NAME: board.dtb              ;Specify target filename to preserve file extension
 NOR3LOAD: 00000000               ;Image Load Address
 NOR3ENTRY: 00000000              ;Image Entry Point
diff --git a/meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno/uEnv.txt b/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/uEnv.txt
similarity index 100%
rename from meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno/uEnv.txt
rename to meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/uEnv.txt
diff --git a/meta-arm-autonomy/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend b/meta-arm-autonomy/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend
deleted file mode 100644
index 49a8228..0000000
--- a/meta-arm-autonomy/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend
+++ /dev/null
@@ -1,13 +0,0 @@
-FILESEXTRAPATHS_prepend_juno := "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '${THISDIR}/files/juno:', '', d)}"
-
-JUNO_EXTRA_DEPS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' xen:do_deploy', '', d)}"
-
-do_deploy_append_juno() {
-
-    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'yes', 'no', d)}" = "yes" ]; then
-        cp -a \
-            ${DEPLOY_DIR_IMAGE}/xen-${COMPATIBLE_MACHINE}.efi \
-            ${WORKDIR}/juno-oe-uboot/SOFTWARE/xen
-    fi
-
-}
-- 
2.7.4

