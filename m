Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.62])
 by mx.groups.io with SMTP id smtpd.web10.137768.1598026269913986393
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Aug 2020 09:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=DDN/y6lI;
 spf=pass (domain: arm.com, ip: 40.107.20.62, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2Bi6A2J1KT5LNSGAAOiBK6rNZ9B8byAG67smF1eQO0=;
 b=DDN/y6lIDluAJZ8PWtV28yPJWhM/dB/b665E97gXxgzUCh2u7RB0WvQUE5D01vxyri8S84Xnt08gxCZ5HArQ//85e0xXVKOr2mNzCy3ZjbBIzSjEFd2rvrwhpQ3AstC81WKoGfE9yndej98flSW8il3174CuCFiVqOJb8ELxL9A=
Received: from MR2P264CA0136.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:30::28)
 by DB7PR08MB3450.eurprd08.prod.outlook.com (2603:10a6:10:41::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.24; Fri, 21 Aug
 2020 16:11:04 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:30:cafe::e3) by MR2P264CA0136.outlook.office365.com
 (2603:10a6:500:30::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend
 Transport; Fri, 21 Aug 2020 16:11:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 16:11:03 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64"); Fri, 21 Aug 2020 16:11:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d5d3c2ad1020e7ff
X-CR-MTA-TID: 64aa7808
Received: from 5effebdc61bf.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BF7FC0A9-F97C-4AE4-925B-717A41490EC2.1;
	Fri, 21 Aug 2020 16:10:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5effebdc61bf.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 21 Aug 2020 16:10:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGe8/lMUfeSsSZ2Mci30983S32vqK1Re40HMNcwOiI1VT9tYXSeJrg2sgiSAP1vVCMIkiktHr/PG860XNEXtXnGmath50KDr1vhoAw79iURnHPqLyQ2RqfGaoj/MPRopua9UUaVY79NITLIqzJl3yr9wJz3FNv6mWw1uba/HTGgmXt4LyF+TRJz57NjfNxJVRZ92LHW99XGjsZIIRTQKenXxNBFLlXPeYrT7aqa1H2mSdGqJiJtL/JNRRvsm304dS5BYtVREHsdnLwhgiGtTT2gQzVTgjIz+xr3zsshNaS28PsVvHDGrMiQ2lAFKm3IW+xguUjfwtEPZq0EtjZ7qhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2Bi6A2J1KT5LNSGAAOiBK6rNZ9B8byAG67smF1eQO0=;
 b=c8M6pgoxUWCgM8UVVE3ekPOf50zrnFJBQ0Pi9H9VYUzoADQavU5Gk2C85otDc6NMh2njT8YnfKn15OxvfkdKOh1NFjjMAm44r8I3TcTSG+85Tb5FO8trjcKQjuCMg6Hc1hBVrTlonhLqjfhGzObvb58RX2zOxnPnYlBVO3sxrITR6V+bcgeH7cuZmUccKnzsA5x39xsPojZBSuRL/+EyOO5vAZXjjM/TigPMlgXG62Z2ZrA6f4v4yoD0SmGDp5YOM378+9oi7r5uLPTgjKWHGYu7JtDxjAmLbQjy1DvHu4ZUCXRcxqp0Q3cwHbayJy7GsGttHRYPdtB2goqsB00qgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2Bi6A2J1KT5LNSGAAOiBK6rNZ9B8byAG67smF1eQO0=;
 b=DDN/y6lIDluAJZ8PWtV28yPJWhM/dB/b665E97gXxgzUCh2u7RB0WvQUE5D01vxyri8S84Xnt08gxCZ5HArQ//85e0xXVKOr2mNzCy3ZjbBIzSjEFd2rvrwhpQ3AstC81WKoGfE9yndej98flSW8il3174CuCFiVqOJb8ELxL9A=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com (2603:10a6:208:d4::18)
 by AM8PR08MB5732.eurprd08.prod.outlook.com (2603:10a6:20b:1d4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Fri, 21 Aug
 2020 16:10:50 +0000
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef]) by AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef%4]) with mapi id 15.20.3283.027; Fri, 21 Aug 2020
 16:10:50 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH v2 2/3] arm/trusted-firmware-a: add support to install dtb built as part of TFA
Date: Fri, 21 Aug 2020 21:39:26 +0530
Message-Id: <20200821160927.10598-2-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200821160927.10598-1-khasim.mohammed@arm.com>
References: <20200821160927.10598-1-khasim.mohammed@arm.com>
X-ClientProxiedBy: DM5PR15CA0056.namprd15.prod.outlook.com
 (2603:10b6:3:ae::18) To AM0PR08MB3409.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by DM5PR15CA0056.namprd15.prod.outlook.com (2603:10b6:3:ae::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend Transport; Fri, 21 Aug 2020 16:10:48 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a0e1b50d-f847-4cce-22dd-08d845eccd80
X-MS-TrafficTypeDiagnostic: AM8PR08MB5732:|DB7PR08MB3450:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB3450FF87F72DD1CB14F75EACFA5B0@DB7PR08MB3450.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 3WNO5PRSjmDBis31jYw82FAQb62s80y5T/1C0lVZZFmMoiejfJLCepn6ZPj5/gcuLxwfssrb84X5RD/YUhRxYu1crlPiQbPTXYGmkEnYiYguE0IcNdrAK3oU6Ny6FzQ7mBthojZUBGb0VHrSZiJZn+j3+KReHSdoA4IV69heqe1denSISJAbvc52fz9TC0N7/FyHKx2AMzExIsa8ntiS7WybyBYGO7ha0WL4ENDGRK3ASdSj8fKGWdHy+g6oHG+CM/oITE2uiWGuaPJChI1tbgV6FbOBJNdjSKhlth1FO/8TxiKeGMgv5Zk7F04C7vgH0sY0FWxykBOg3enis//8iw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3409.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(1076003)(6666004)(5660300002)(86362001)(8936002)(316002)(66556008)(66476007)(478600001)(66946007)(8676002)(2906002)(26005)(83380400001)(6916009)(16526019)(186003)(36756003)(52116002)(4326008)(6486002)(2616005)(956004)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 EUwN0GNUtQRtLWakyVvMcVA6Q1Vfe9EU7Iw1McczNDxkYB0hcevQKRlGC8UrfBL0HqtSiC7N3MmA5RpAOSycRRG+blLHXxLeLNUh9CvR8EdKWwp0sQxwPVgUMY2RNQiNZZTxH6KXIq2BRWe5l7PcEnXfZ4t5wvbyvOO5Cw02yfM3PiyZdxSNcXAniFfJHS6S+GolN3+MDQ6obmfRJDGicpyxE5EpC6IAtqBp43nvECsMFhZ/29DStUDXaXwUDjYxDLFXDaCFn87L7L9NqmGaZbFuX2x5eGEB679g6z3YEt5QDZLd7Bp2QuxmxIqoCiMctEmWpfgsgv/Jyt5N0hGi2Kw75eLsYEKx8a10sCl0/kUSh444BeUlH3aXWLErAknEUPmJzJMAzZJy8PF1fswcnKqUXQhfG8KJ1NQAGgPAFAuVOZxwNLQZonv6vro0A84yVcxBygVLUzdF/ftVxOhhCmUP2eDmVBB5jElZ6sMq5shJ5fpDWk8ofwF2kmVx0dVGYYb0f1bbHPvgZ7FtJo8zaKR/Gr+FhtU3SPIvMOE8dO/24Yqe4R/HDh0fvNJDPdxQAQaNpxZMyifv+jwhrLgGQXx8cqcnJPympniLUY3TDjVJ6KMdX4sIvEPycwq6H/HGvjcKcLsh04AhITfXAqYfng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5732
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	92a097b3-a3b0-474f-c652-08d845ecc589
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NP6ILOexzKZa1c97wdSRZ32kzSz764if+3pO6seu8yC8PRnTiRgSEeyeHwuMltNNdbPIWzl+iqyzKTWYW9oEwyTN8xpWoyTLpYOfBDusYUbPDsJPDqrBeQ5bxhYL1u2yr4DmPCPfoXg6j70JChdnxLQz8iXK2H3jx1yx13nG+ZXbPZ2DzGNnJmc0fadUjpVgPII0SCXf9gLS0JQUbgz8EuPKW9FrCdixoLd2Jrh1h5Z7pSa8cKNFjQyPvjchAs5setPCAS8e61q3gKIGbAyP055Ao9qAWYHN4U8SEnpaeXxelKynBU9+fy1aSdyypXzOclPoAozF27+MqbJKjWX3UAWVP2Sy0V7Tup6cWu4slyLOZ02Vm5YmEawG2sJCBT42PkW45T5gKSQeWJFhbTG7Aw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(46966005)(1076003)(16526019)(186003)(478600001)(7696005)(4326008)(316002)(36906005)(2616005)(956004)(6916009)(47076004)(2906002)(5660300002)(70206006)(336012)(356005)(6666004)(70586007)(82740400003)(81166007)(86362001)(36756003)(8936002)(26005)(8676002)(82310400002)(83380400001)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 16:11:03.3791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e1b50d-f847-4cce-22dd-08d845eccd80
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3450
Content-Type: text/plain

Device tree blobs (DTBs) generated as part of TFA were installed separately
in the platform specific TFA recipes, its redundant as each platform was
executing similar installation steps.

The patch avoids skipping dtb installation and adds support to check for
DTB entries in TFA_INSTALL_TARGET and install the same to respective deploy folder.

Change-Id: I0f8f5c39dc4b4931d202696990fa915ea7ed60eb
Issue-Id: PLATFORMS-3971
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a.inc          | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index e4847b5..4956c4f 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -166,9 +166,13 @@ do_install() {
             ln -sf $atfbin-${TFA_PLATFORM} ${D}/firmware/$atfbin
             processes="1"
         fi
-
-        if [ "$atfbin" = "dtbs" ]; then
-            echo "dtbs install, skipped"
+        if [ -f ${BUILD_DIR}/fdts/$atfbin.dtb ]; then
+            echo "Install $atfbin.dtb"
+            install -m 0644 "${BUILD_DIR}/fdts/$atfbin.dtb" \
+                "${D}/firmware/$atfbin.dtb"
+            processes="1"
+        elif [ "$atfbin" = "dtbs" ]; then
+            echo "dtbs install, skipped: set dtbs in TFA_INSTALL_TARGET"
         elif [ -f ${B}/tools/$atfbin/$atfbin ]; then
             echo "Tools $atfbin install, skipped"
         elif [ "$processes" = "0" ]; then
-- 
2.17.1

