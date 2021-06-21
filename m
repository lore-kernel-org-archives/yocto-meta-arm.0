Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.55])
 by mx.groups.io with SMTP id smtpd.web08.49717.1624292610358803680
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Jun 2021 09:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=AdQ1P8V+;
 spf=pass (domain: arm.com, ip: 40.107.8.55, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=civ2kjITBLubXVvLtcmrY5Ayu71EFTpj9CT5d1ZYQLs=;
 b=AdQ1P8V+yM6OSpVrIauYwcbKCQBpKFF1UZhL5FY0ivZLqXyWGRKNtGXb1OI1/ArjAEUkBc0v9mupGsQ4MLWmaWdwd9nqDqXNv5AhN/eIUDa5sK5LJfUy/Y+dZd2Um0YOpffBoPfZ8Pu99k1/frv7Ot6CmmqMISGboBwviAY3S0g=
Received: from FR3P281CA0030.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::16)
 by AM8PR08MB6450.eurprd08.prod.outlook.com (2603:10a6:20b:317::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Mon, 21 Jun
 2021 16:23:27 +0000
Received: from VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1c:cafe::8d) by FR3P281CA0030.outlook.office365.com
 (2603:10a6:d10:1c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.7 via Frontend
 Transport; Mon, 21 Jun 2021 16:23:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT053.mail.protection.outlook.com (10.152.19.198) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Mon, 21 Jun 2021 16:23:27 +0000
Received: ("Tessian outbound 92494750bf3c:v96"); Mon, 21 Jun 2021 16:23:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 10e5a24caf1ccc1b
X-CR-MTA-TID: 64aa7808
Received: from 10a0c6ec959f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 95BE8E49-C44D-42DC-8EF2-30F8E8E13E34.1;
	Mon, 21 Jun 2021 16:23:19 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 10a0c6ec959f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 21 Jun 2021 16:23:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TS+KQun9u0Pk+uFWnKuOXK9ZQlHeSfwuVjFSbCwECn67gFS4YFk/tTIFPNObB+fGAKNEwShNOvh4aDpibfsXFLnogTpQesfomJ0Lx45rc7721mi5i6mBA5n/+ij+HA0y5gZK7tSMxVZMPKpE/sSIQ4UXzytSPBX8N3YmNQhAk+POY4qPmJMGv8aRBLauRZun5zXq59irYRi0axgjIGFvYW2CAGEifILIW4q0XyoDCnoZK5J6JvXWJpFTUaJcFiQa206+E+VMIVq7rCT467n1xGHgdG5wWzP1XQpJc4c/imfuPJWdxs0A0zG2++hCVvWLCzSEuV3TDdtncMJEvhew6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=civ2kjITBLubXVvLtcmrY5Ayu71EFTpj9CT5d1ZYQLs=;
 b=dmRwdQbQVYxURZJhZ3LLfQ3VANwWB1OiUMYn+Q8lEfLJpSfUKbtmPftK+Ww7zIN1xpQWrNMoDDhp3KGZlxxa6AIBNCI4VznDV++NZ2/QWZ5+sn86nA6e84qG+47cEyYzxXXP3bPGEb3QzXItiTqoHpp2vxlDMN6ddy82/4rcbQ1mr1mM9icxWjhgpybQutwg34cj78bhwraB2xyj3KvuHitKThE8HcAbYZg7ALwMg/UOIJMysaEw53F7vdZSBPKju7f1jILToNX0wQtPNKSwKlLOnm0b93iOkLCNOL04fFoxuR1zVenwsopidFeEuDddaYH4B3ae3p9A1+GdJG2gLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=civ2kjITBLubXVvLtcmrY5Ayu71EFTpj9CT5d1ZYQLs=;
 b=AdQ1P8V+yM6OSpVrIauYwcbKCQBpKFF1UZhL5FY0ivZLqXyWGRKNtGXb1OI1/ArjAEUkBc0v9mupGsQ4MLWmaWdwd9nqDqXNv5AhN/eIUDa5sK5LJfUy/Y+dZd2Um0YOpffBoPfZ8Pu99k1/frv7Ot6CmmqMISGboBwviAY3S0g=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DBBPR08MB4299.eurprd08.prod.outlook.com (2603:10a6:10:ce::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Mon, 21 Jun
 2021 16:23:10 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::318b:e684:6888:bb60]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::318b:e684:6888:bb60%3]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 16:23:10 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [hardknott][PATCH v2 1/2] arm-bsp/fvp-base*: Introduce WIC support for fvp-base* machines
Date: Mon, 21 Jun 2021 18:22:34 +0200
Message-Id: <20210621162235.23245-1-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO4P123CA0084.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::17) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120195-lin.arm.com (217.140.99.251) by LO4P123CA0084.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:190::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15 via Frontend Transport; Mon, 21 Jun 2021 16:23:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c42f1c03-909c-4642-119e-08d934d0e653
X-MS-TrafficTypeDiagnostic: DBBPR08MB4299:|AM8PR08MB6450:
X-Microsoft-Antispam-PRVS: 
	<AM8PR08MB64507D590AFA323B1BB8D139FD0A9@AM8PR08MB6450.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 awXU1nLMd2SUrhY8RKHQmWBh9rUptpnHXPHal4dDYzSnECn4EdxvmDP+8Eg7xqteav/5Ygm7ILEHZwDJAO+Qp7qytrDgWQ8YTE2VNutXtLoYhcXv4w4WpxN52uyPNIE3tGft/PeLsaCBLtD/s72ZGG7S7HzdrTtJ3iy858WKs4TZSbZ7Jp5QNRai1UgjgHu13thIEtisMyZpIBpE/PPS2h026LS2PhEkhXocr7Sxf5MYOFrkVgRQZ082/Qxn3b+XOFFaSrqKr4XA7qWTJFY0baNYEz3icNFGt8ZKT7CjWqFY/vMzYqgCmgskRysbAGWkyisU/beKM8TIgxZSPsW+8+A7BvqNrWAittKutIBfQQuakZ6OGqvKyPH9aZ2ApGY56X5hanBM87FZaJYegZHhT+2Guh3oDYn3VQdk9TWQPl7KXosk7gRMU+lIZ3ejAVEuQYdoTAD9a0mTOz/1qzAWvR8DQI/uETaC2G4Fx7e+rSNWzzJgetMnTAvF9KxAowKFZsRq+yMUAlLyydrrJ31iyInchZQijKdIiEiYXcF+umdvclr6B/gfQR7TWgKRphh8bKogJOdQa3DtaehCQy/F46y282dFs1s5P8qSkAmkNjC9moHjW+iD5QIRxY9GN1MWJR/nRBmproPiw2xksjeyGg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(5660300002)(86362001)(52116002)(316002)(26005)(44832011)(16526019)(478600001)(7696005)(186003)(6916009)(2616005)(66556008)(66476007)(6666004)(83380400001)(6486002)(2906002)(36756003)(1076003)(66946007)(4326008)(38350700002)(8936002)(38100700002)(8676002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?BABwQa9brk6UB1njVq1yzAcSkhny1HyZBaUwn+H/GdF1OYrjA6291MJAZa+W?=
 =?us-ascii?Q?iL5VN6wIBkukRudMR2mQPWJ0HaZCzdvifBzubsmQe3vhOB4Gor/cU0uFkR8F?=
 =?us-ascii?Q?TyWcdbYPsaUXaH436dpLtj4uS54zax6TuzLhEX9fJ9VikkNjJfdikkO6rI2Y?=
 =?us-ascii?Q?ghSTc+S+Rq7AZTNCC+zd8bFB4AR2q1SLK/6hreyjDYLKrxUUoRdGAOt5pDmX?=
 =?us-ascii?Q?rOKhv53o4agtZTt1VJVj6eIvCOaRQyg+YvlATYlJ5eAbeWj/LQ/x0ezlIcBg?=
 =?us-ascii?Q?9jO3kXsPtYNIYvmKaX4MXtfHIlukll7nOMcAYeob8tOs2OTOOU1NiYOFv5DF?=
 =?us-ascii?Q?S6tz0+VC4uRhDRHudauzIaDXNIGQxwarUORog9BxC0cswyd5PHU6hZxW5g20?=
 =?us-ascii?Q?kI9Sox/Yue1JnH1lSseem9hbGb0qrF6i8Wl4r5jWf4Us8BKSWISONRH2H+o2?=
 =?us-ascii?Q?YFd3hFgPJh3i9ufCdLFykmG1sa6VMb5Ssj2n2aoHg/xKjPULI0BpnTmMtqwy?=
 =?us-ascii?Q?mFx9McKvHzq42mBV5d5sHnP2UV/520dXFX5WYFnAxCIURmSQ5ULoQwb5wUSH?=
 =?us-ascii?Q?eH6uIxo1vskxRBNqigM6g5lhTYNCD0QY/okZntBygsxv72F48BRKgIdCW45E?=
 =?us-ascii?Q?JZbfRU7KckA2O76nKzswEbMsQHVbBj21P+x7K+awoJqp9UJmgnOc1+GDFZWD?=
 =?us-ascii?Q?1ty6hBUp9MnxclV/xZUwm8HTkbmF6/RHfJ4JN2l/AmYfY1xVN7RJawB8XZT/?=
 =?us-ascii?Q?RfArlMgG7KnCIavg4EsFRjiTNu+oVlTXHR13HF/DBocjzIgaP+1fvSV9wecQ?=
 =?us-ascii?Q?6gNFrQNfZUAnlUk5/scOJ95ostC0pA9/WOslYaritjUtEN0zUFDsTeCvep+z?=
 =?us-ascii?Q?g1HdU9dfGTdLpS/2T5MlIh9e6BbQa7kgo+4AZV3l/SYxN5Muw2D6hIx3IfPp?=
 =?us-ascii?Q?4OnufxKBegtWxN3hXTFwUnZEB4ZvS64L6hHiiLkt6wV6VYyez9WL3AuwkFeu?=
 =?us-ascii?Q?DUQFZlVCI4agcvqindZWwrkhr66j5cuNF+BxwrY5hCVxQwA50ApxhDowrIOS?=
 =?us-ascii?Q?6PPjaSYKaTAvb6ZiculblOlO3f/TGq6R3bKrHBLt0i3SoLO/pRr9VwVM00JV?=
 =?us-ascii?Q?z6ZT50NjDdi83GbjLdESS4Drf1+si/Pi9zEWQR+45pjaBGDfdlZu5Po6D2L6?=
 =?us-ascii?Q?K9Oe3ArQTHLp4cStJyG8K77eHcXBZIV8W6C+a92tYQf7Ut2oxIBQbK6VidU/?=
 =?us-ascii?Q?0STMX7dbXWXcyOFv9zdX6teGUMCQ0EITPFlXt2JiB30KrRJvZWr4xvQ9nb8Z?=
 =?us-ascii?Q?d6sHKxdjZfjrEt+WJtY2+k51?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4299
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d5ded00f-8466-4d73-cc8e-08d934d0dc88
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ISvaiYbeyeDMj7/RqDfX5Iww6qpr7bNBWgpxNycrwyE7Dj5Qy5c72JNNxCGMhf0u2oRlmGZ1WN33iKa35f0TrPqngMbvYW1JF7svqXESVRR4vhUBynm/jWsE1YHKv/qDY1Jdz93ZMSPA0F6Gw3XMJbDYZed+k2j7Ikk4THaEhce4ShKpYPJZhTWwAu5gnlYbr1W6U3lcal+doE/+vjZnorxUHJedHg8ANsEYMP3y641LL+5PzUxBAHKFiofZFqMZEbYqh5IGv1aRNAdMFAg1kqPlntwwX0tC8ZUyGl2YAXgW9ABXsyvOsO3rFXnEYHlSvbJMNDJfxCL0W/6LBsMAZ6gqwvCJxMTVAidIUOcNNJkDQJtQmG3g8yqQiN40A30d3pP6IdU3G512cxTmYHnb6tePzXmRO1K9bzEdT52L6AqnuAxwNM6MjVQgmklAcV9Fzdf8Hn38jpT2R4fyNqQYy+Cqft5P7plvY6KHwuvOX2LkiOd/7ZFx24Ism8J5ikGx2SBnK2uG3Tz5gl3+5NO2iaX8i/vAGVkq0/Un+3Qj2PqGwhKBHsu09yVz3/dGV8oWDqoGnbK5cWCsLVRUBcHpjVuJh+1/f9o4NkLZR4OGDqTQyzQO7FfgEdtX1SYK4WNb/1onh3aSX548ixaKnxG2QA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(36840700001)(46966006)(82310400003)(7696005)(356005)(82740400003)(86362001)(83380400001)(1076003)(2906002)(336012)(36860700001)(70206006)(70586007)(6666004)(8676002)(36756003)(956004)(4326008)(5660300002)(6486002)(478600001)(8936002)(81166007)(316002)(26005)(186003)(16526019)(47076005)(44832011)(2616005)(6916009);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 16:23:27.0428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c42f1c03-909c-4642-119e-08d934d0e653
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6450
Content-Type: text/plain

Add wks script that contains two partitions.
Rootfs is populated to second partition, because the first one is empty,
to keep compatibility with image_types_disk_img.bbclass
and use the same root device set in u-boot bootargs parameter.

Both wic and disk.img files are built by default.

Issue-Id: SCM-2698
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
Change-Id: Ib5b5c3a7aa6e8fe9fa90a2955ae1e461caa01356
---
 meta-arm-bsp/conf/machine/fvp-common.inc | 4 +++-
 meta-arm-bsp/wic/fvp-base.wks            | 6 ++++++
 2 files changed, 9 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/wic/fvp-base.wks

diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf/machine/fvp-common.inc
index c4a5f6b..ddf6b1c 100644
--- a/meta-arm-bsp/conf/machine/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common.inc
@@ -8,7 +8,9 @@
 MACHINE_FEATURES = "optee"
 
 IMAGE_CLASSES += "image_types_disk_img"
-IMAGE_FSTYPES += "disk.img"
+IMAGE_FSTYPES += "disk.img wic"
+
+WKS_FILE ?= "fvp-base.wks"
 
 # Disk image configuration
 # We don't use the first partition
diff --git a/meta-arm-bsp/wic/fvp-base.wks b/meta-arm-bsp/wic/fvp-base.wks
new file mode 100644
index 0000000..ef08c81
--- /dev/null
+++ b/meta-arm-bsp/wic/fvp-base.wks
@@ -0,0 +1,6 @@
+# For fvp-base* machines we just need to populate the rootfs partition
+# but to keep backwards compatibility with disk.img,
+# we need to create first partition empty
+
+part --label empty --source empty --ondisk sda --size="1M" --system-id 8e --align 1024
+part / --source rootfs --ondisk sda --fstype=ext4 --label root --size="2048"
-- 
2.17.1

