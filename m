Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.79])
 by mx.groups.io with SMTP id smtpd.web12.8888.1585306469904756136
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 03:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=F7BeZxlF;
 spf=pass (domain: arm.com, ip: 40.107.21.79, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lw29ZPx/JBTw7H6m1/VeY9QTg6wTII0jyJ27esRl4g=;
 b=F7BeZxlFaQosFAwLyNFTS+1aCQIWaJCJ4iTQmM0t5pfQ/6/ORlIVzrWHHAAbcQuBtTrDhSgM6Yt6nqwvOHqa/QRK4kBHdnQWh1Jx3DRx95MBX4d4Qap+n+PBUAoFGMsQuM8yBjU/Y5rBozy1VBt0LBIFKtt4yxTnLInximUu2n4=
Received: from DB6PR07CA0004.eurprd07.prod.outlook.com (2603:10a6:6:2d::14) by
 DB6PR0801MB1880.eurprd08.prod.outlook.com (2603:10a6:4:74::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.20; Fri, 27 Mar 2020 10:54:27 +0000
Received: from DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::56) by DB6PR07CA0004.outlook.office365.com
 (2603:10a6:6:2d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.9 via Frontend
 Transport; Fri, 27 Mar 2020 10:54:27 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT025.mail.protection.outlook.com (10.152.20.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 10:54:27 +0000
Received: ("Tessian outbound 6835489d965f:v48"); Fri, 27 Mar 2020 10:54:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a628f85a0f271d86
X-CR-MTA-TID: 64aa7808
Received: from 1c933c63fa57.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 264B909E-4014-4E05-9662-E865553293B6.1;
	Fri, 27 Mar 2020 10:54:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1c933c63fa57.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 10:54:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HB2HDkGEe9REOfMQGu0uaHgdqcelk6MCXte23NOfrHlNZKQIjz/LFwFvob1+LcOExcMAIRexeJMPCbblsSpnSVaWj2xGTjhsLdxjPawwkFyHyUOkE9ala+M+eusfL2oMI5mjqU/P3hNWxmBzhiwJEd1ePpDU/jOXBRWqZ6paKjtxnMyarFtirX+1eJsG0NTDhorjjuzMA4VkAWikgHNN4pOn7ekqi4fAp97yGf20HBr0q95/u4rD47oUnmB6PRK5Bqq1gtdCcMyThsykHfB1xjtSOBXSbchdNcDAsmoBDu/5ywfyRUCPpuaB9f8T7NlBwD+JEe3A7klAKpXtykoAAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lw29ZPx/JBTw7H6m1/VeY9QTg6wTII0jyJ27esRl4g=;
 b=G03m2YH4K4jvuOA2/moaV75cl3h0ks6HxQ/M1K6I/Qep3d9gBCq+lsDnHuJ9KZI3FEbqaQhxKSoZJVI6JG8YxSSfo1ZKUj+BIibTzUtJnGNFNXxWy680o83DqKE348hx1WVNfPkWxw6OmvqEgyvE+ObyBwb6UwD8Lsrj4YFib+O05KNk5eaLzXj1YpR43AKYJR92IVoo6CSW/Muu6NttO7hK3GjHLN50CmfX+AAus5HkjCP+VbJMMSCePbP4dbIRovI2y4yDDCxGt4XOy/vnC1ULdrqu9JRJXUDtvgCkTI7kDbx6rOCr/keW8/HejSc8NAnAjtBDFS/7VfMlZf2YbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lw29ZPx/JBTw7H6m1/VeY9QTg6wTII0jyJ27esRl4g=;
 b=F7BeZxlFaQosFAwLyNFTS+1aCQIWaJCJ4iTQmM0t5pfQ/6/ORlIVzrWHHAAbcQuBtTrDhSgM6Yt6nqwvOHqa/QRK4kBHdnQWh1Jx3DRx95MBX4d4Qap+n+PBUAoFGMsQuM8yBjU/Y5rBozy1VBt0LBIFKtt4yxTnLInximUu2n4=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3450.eurprd08.prod.outlook.com (20.176.238.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 27 Mar 2020 10:54:21 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2835.025; Fri, 27 Mar 2020
 10:54:21 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] arm-autonomy: Add subdirectory config to ifupdown
Date: Fri, 27 Mar 2020 10:53:57 +0000
Message-Id: <20200327105358.507-2-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327105358.507-1-bertrand.marquis@arm.com>
References: <20200327105358.507-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: SN4PR0501CA0057.namprd05.prod.outlook.com
 (2603:10b6:803:41::34) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.49) by SN4PR0501CA0057.namprd05.prod.outlook.com (2603:10b6:803:41::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.11 via Frontend Transport; Fri, 27 Mar 2020 10:54:20 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.49]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f69cf5f9-9105-403c-e47c-08d7d23d3830
X-MS-TrafficTypeDiagnostic: DB7PR08MB3450:|DB6PR0801MB1880:
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB1880FC12D3B73056768B46939DCC0@DB6PR0801MB1880.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-Forefront-PRVS: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(86362001)(6666004)(5660300002)(6486002)(4326008)(44832011)(956004)(2616005)(16526019)(478600001)(7696005)(81156014)(8676002)(66946007)(36756003)(26005)(1076003)(316002)(2906002)(186003)(6916009)(66556008)(66476007)(52116002)(81166006)(8936002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 2jeTCRovY7/A7nIiroHajLhiWmdL6su5EuPd0JiwJiwOY+517fZRQFMd/kz0k65UOW0Gsc7MtIXTBlKbTjwZ3vHfzTZNch0bsFVCGFYUoJpKiXvpm9gj8aEWB+9RDTR8XhEGHAgqAnqCgwL3mBTjfQH2szfUYYbGHkUqNni7/db5qXdf2W9F/cPQ3L5VPw43c44AMwrCvgUBfE8RYjItH/Q6w8eS1IECBnfFntZ3NrJc/3ZiiDruXyvQaEtzSa9mG/kbcgyyN+D9b/G3rhrf2+yO1qujnH+G7x8O9C5X8o++c56/I56Bmr1gU5rpSXFwWOIFBQThhST+fi2YYXKQs9+ygdbrt1j8ADB+2xSLRxZkahcPCIe3DtUM/Vs8y5SXmCMB5+vdjrIqYVxKnJ7UstDbsuOY3RShzWWGoqTqyR3OggVrQC7T0IgXvGKb4Pg0
X-MS-Exchange-AntiSpam-MessageData: 
 HCT6+sivS3+5h/8JVjneWrAb5XAks2rtczR/tKtbiVkK6gskitNpuQSglg0Yxq0aIY3PyOC8Quf3+38zwuXX3hSWGf/8nCSub5tOSi4hQgzNoG3ZADtLoOR061BIOoRotoQU2Q9PvmGvg7SR2uKINw==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3450
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(46966005)(6666004)(336012)(5660300002)(81166006)(6916009)(7696005)(2906002)(86362001)(8676002)(81156014)(82740400003)(8936002)(478600001)(1076003)(2616005)(956004)(70206006)(316002)(16526019)(36756003)(4326008)(70586007)(356004)(26005)(186003)(6486002)(26826003)(47076004)(44832011);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	920f28fb-f67e-4967-9dc0-08d7d23d3469
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2KiLOW/awSDFg/arqMSgFcSUdn6sGLBKgzdrnE2FBw2K2uUbFH0XmtedvOfNvOzQzn/3czvjid65eGul7idrPNn0RkvMLeGOOVEMqP275m02scsKzs7jfN+InJOVio1erSkPeb2LkpZqgH4OogD6TLQkpL89G+T6oRCn9dK/5V4WoVq//Nr2ZDJX/eJzWjz3pYgWlECZrZ5jglklCInOUoDlhSMzjkJDBt4ByvZBA5Q8akwlkORb85+DnDqMPE8CjbvsRtNoH3O8lLjZ15CJ+O1hI9LLzOYIQFYRDp0dKiVdeicXIGT2wP1pqDrb4jnZOwLUITj1sT5zgpV5Hi/HXXFIUhR+FgnBhS+uWylnbUvH3Zx0uVNyi+OldBubh0AldXpxkPMC1gpHu6Tn0H2FezP7nmIucnpowRzgbPnDgyWa2IO0acyXEynUCUMm4cBEsq6tIMdOoB0Q08YNeiHIi9otv/2Jvvx77+LQU/DLDXfa8FNy7JkGGVPG0fkqZLqugt7FYcY22Pys5PnjXmE+yw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 10:54:27.3720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f69cf5f9-9105-403c-e47c-08d7d23d3830
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1880
Content-Type: text/plain

Modify default interfaces file for network to scan sub-directory
interfaces.d to let other recipes contribute to the network
configuration file

Change-Id: I72cf7fd8ccb51e3cdfdafc368adb4574393fdc08
Issue-Id: SCM-767
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 .../init-ifupdown/init-ifupdown_1.0.bbappend   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend

diff --git a/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend b/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
new file mode 100644
index 0000000..2181210
--- /dev/null
+++ b/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
@@ -0,0 +1,18 @@
+# Add support for interface configuration via interfaces.d directory. This
+# feature can be used by other packages to add network interface
+# configuration by adding network network interface configuration file under
+# interfaces.d directory.
+
+do_install_append() {
+    # Add scan of interfaces.d to interfaces file
+    cp -f ${WORKDIR}/interfaces ${WORKDIR}/interfaces.subdir
+    echo "source-directory ${sysconfdir}/network/interfaces.d/"
+        >> ${WORKDIR}/interfaces.subdir
+
+    # Create interfaces.d script in case nobody is adding a script
+    # so that there is no error about non existing directory
+    install -d -m 755 ${D}${sysconfdir}/network/interfaces.d
+
+    # Install our file instead of the original one
+    install -m 644 interfaces.subdir ${D}${sysconfdir}/network/interfaces
+}
-- 
2.17.1

