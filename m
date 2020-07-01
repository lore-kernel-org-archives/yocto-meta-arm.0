Received: from FRA01-MR2-obe.outbound.protection.outlook.com (FRA01-MR2-obe.outbound.protection.outlook.com [40.107.9.54])
 by mx.groups.io with SMTP id smtpd.web12.24059.1593617054430163629
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 08:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=mD6wsf+w;
 spf=pass (domain: arm.com, ip: 40.107.9.54, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kU0GUlu5U86dAYbOGgdUt3F3sSUrgJSYhU4pTeS0dnE=;
 b=mD6wsf+wWcTyHSs0virRHzsqc3wLDUc4korblhuGnN4zKABiRzykvyps0CwwPsJHml24/e1fHtlhziuMLABE0BP4q20JN0zdbE+EP+2e2DXKT/CpK4bQQx8LXWDaAhA8wU20+xKaAbH2xhjdsxo9F2SDIm+SEvB+HmS+hhEhun8=
Received: from AM5PR0201CA0015.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::25) by PR2PR08MB4906.eurprd08.prod.outlook.com
 (2603:10a6:101:26::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23; Wed, 1 Jul
 2020 15:24:10 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::e7) by AM5PR0201CA0015.outlook.office365.com
 (2603:10a6:203:3d::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend
 Transport; Wed, 1 Jul 2020 15:24:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Wed, 1 Jul 2020 15:24:10 +0000
Received: ("Tessian outbound b8ad5ab47c8c:v62"); Wed, 01 Jul 2020 15:24:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 62e98dbb9732cbda
X-CR-MTA-TID: 64aa7808
Received: from cc3ed28f9d97.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 414A6F99-D607-4155-A7BD-864BA7F7EB5E.1;
	Wed, 01 Jul 2020 15:24:04 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cc3ed28f9d97.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 01 Jul 2020 15:24:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOykfQXePnOQPxtewoP/g6AgVxNQD4ULGqUg5W02JsTbLvBTO6Zvqfh8NUln1yRmoa6RqvL9nk1u94H78/wJs+WxIU8xOnxZtjy+XD3nJ35BybN5zF3bB7ecUsIb4L+7WXsmLyJe0fSl6tlMAJoiBTgoZQfd94O5R/y4JSFFWIZ2W/NE+M2zTOJG3XGey1Rbf3jHaODIrVg+B6G6atKHNNf5UFvPKJio7DJIZSSvVU72fw8IXBJysNN+17jRcIO4ChxrbO4//xLSk/ckD2fWD0aEhQDIMTCDDKENcnS7qISdFrlk2r6vPbtXjLRvIAd/0XnhujE3XZpESFURQEKIuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kU0GUlu5U86dAYbOGgdUt3F3sSUrgJSYhU4pTeS0dnE=;
 b=DdwQ/Nv6yRQhJFopmQWOMEU905FHQKnvAWWAGncB4jiTyarV+z9TiTqiUdY9vJQcd46LzepparXnqwOhsoeYFfTu1EzWlbhtwZC78WwwDZqo5f/tEQJ5z/mmlcyMF+UKskiBQ/FRC1OgPRRqOmx5QBveWAHOmPi7/mhAJ6UdlWbDQADG7vcvWrR8X3yBkJkDVZSXY/4mhIfgbWJe+FoAg+1bdyhRLGS3fdy9kB/G8g4MzGdFKWrlNnOF2fZl554iRrxrX9XtICR432BCRQaWr/LbVDaCYX6dQ1pcmANg0i3errchaooI3K6XC06UEfzzUdNQMwNbyGtjVxF8r5/CrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kU0GUlu5U86dAYbOGgdUt3F3sSUrgJSYhU4pTeS0dnE=;
 b=mD6wsf+wWcTyHSs0virRHzsqc3wLDUc4korblhuGnN4zKABiRzykvyps0CwwPsJHml24/e1fHtlhziuMLABE0BP4q20JN0zdbE+EP+2e2DXKT/CpK4bQQx8LXWDaAhA8wU20+xKaAbH2xhjdsxo9F2SDIm+SEvB+HmS+hhEhun8=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB6PR0802MB2407.eurprd08.prod.outlook.com (2603:10a6:4:a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Wed, 1 Jul
 2020 15:24:03 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643%7]) with mapi id 15.20.3131.028; Wed, 1 Jul 2020
 15:24:03 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] arm-bsp/grub: Add grub-efi support for N1SDP
Date: Wed,  1 Jul 2020 20:53:49 +0530
Message-Id: <20200701152349.16478-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: BMXPR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::32) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.105.53) by BMXPR01CA0068.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:2c::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21 via Frontend Transport; Wed, 1 Jul 2020 15:24:02 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.105.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 389e63f3-390a-4d32-60f9-08d81dd2cd9d
X-MS-TrafficTypeDiagnostic: DB6PR0802MB2407:|PR2PR08MB4906:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB4906715542A6F9C2CC974F11FA6C0@PR2PR08MB4906.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;OLM:1227;
X-Forefront-PRVS: 04519BA941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 y794hBpdplMBRg1WPdSyhJMzjFBJuuJ61MsjJpBbzkjF8eqLjbGUXfo2EIVNMOPmjvTmWdjkJrMfm+7ShFlulz2vu5eBSbWwMaVUVi4B9xziZmXJjm5KBXozMoHtUSBrRD9QGTYag8EIXu9nfJ6izUVytoEq8IVrdO9X/W/EXs6tMrrf0XSH5fmjUooAndXijjxvYv/9yqPaF2su8wa205RkNc28F8TcAc3jET8tOsPQh2bIBBmcjQEJ/7Z3kld7hOre+x1Uj20IL3F34/lRA0Fnc0xSgIMrmVFoKgpjz203ZnBguaDrmGh9TilLajYCO8mBTXEsxT2RF6+I/vR5Ugg981CqzcFwo7zIVAJs4YAz+8uaCOd84grVsxINVfRc
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(4744005)(8936002)(5660300002)(36756003)(52116002)(956004)(2616005)(6486002)(2906002)(86362001)(7696005)(16526019)(6916009)(26005)(186003)(8676002)(1076003)(6666004)(66476007)(66946007)(66556008)(478600001)(4326008)(316002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 miMCi0d6MynaAfjEEUBi1DRJdOiy6oTp7HG65r8ePbmPoLRn4wvRerRDYlx3MNr6UFdiC53ZzRhTfVxzLv6zKSlB1cTKuFda7/jsJ4zrRQBD36++N5mq5vH84HWL1Uo6C2F8NdzuusVV4CPfTQojX1dMzcsUfqXQphzrirMkZ7hxwT/ovGeiNar0os+ZbFW4ecWqBI4Zk6cw+gdhpd1SdRCukCeiuJ7BNkBYd4JcDQukuAlda6mS7rHn0y4Y4TuNf3qTTA0FxoHevU0w1AV9Dp6tALSqlJfq/2jo4a/VllKGq75lki3aYPxxHEjeplJv1W1fk6LglNdi1fxqS/OzvFcJR2uV0nHcT0vb0BjKFV8QBT9oDeffAs9hrATiQDF2eMwAoOr4cwXwavHy7N3GeUyLPjiHgVtpcFuB5ftWXJu8IBu4CvPKuJNeCEhqgiR4KyIh8ZuUzlIlFjdLCs0PCz/1IbrhZ8QDP7xm3ND8ebBfH8e3XuNOV6WnxJFD20UB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2407
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(46966005)(186003)(8936002)(36906005)(6666004)(356005)(336012)(316002)(6916009)(47076004)(7696005)(4326008)(70586007)(2616005)(956004)(478600001)(82740400003)(36756003)(16526019)(2906002)(6486002)(1076003)(8676002)(4744005)(70206006)(81166007)(86362001)(26005)(82310400002)(5660300002)(32563001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	aff5a273-9cea-4d11-567a-08d81dd2c987
X-Forefront-PRVS: 04519BA941
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G7EDqTIVF9TTV3ndY+1ZnUzD68RvakkrwKcC9OokThbW6Fpi+aNiWEZ6DN8ojXiJfVXErhd/CHKTjGZ2YOUA+BGpAgigIcvCCbRZ9i1q86IgmElhWGEa++e75uUTq4bRyHS+SnBTNitBlVzObghEDqJcXrRYEu/U1eZtvXhOd1V/+ayUMrny1ZEZ9Frg6zIqo+gEjrQ7/woAExidl6wtWn+rck9YjzFdvy2AJoERLJ8JF2rLwY/W8K0NYl1wfRYJ+NUVO3YWtUKHrEDgOwEaRRbK3mampVkHGRtmnu6P0wne4dPGRlLasZZLqLDDXg9LXRNoqC+Tw2iKOit2bDa0KVgFwJqYLgjyGc9SM4SRIeUVsrRz0HLL4L59X+T01eZ1DIKzTKE0oIiLYWk2ye00jSvyOrwjF2UiwW3IWQkttek=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2020 15:24:10.2186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 389e63f3-390a-4d32-60f9-08d81dd2cd9d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4906
Content-Type: text/plain

grub-mkimage is used make a bootable image of GRUB,
grub-efi dependency in added to conf file.

Change-Id: Iaf08ed8b5e221003f10fceef9edffbe22b752534
Issue-Id: PLATFORMS-3134
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index 755bb09..92adb42 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -31,3 +31,6 @@ EXTRA_IMAGEDEPENDS += "virtual/control-processor-firmware"
 
 #UEFI EDK2 firmware
 EXTRA_IMAGEDEPENDS += "virtual/uefi-firmware"
+
+#grub-efi
+EFI_PROVIDER ?= "grub-efi"
-- 
2.17.1

