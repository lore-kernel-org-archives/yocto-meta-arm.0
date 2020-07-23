Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.47])
 by mx.groups.io with SMTP id smtpd.web11.10117.1595503904320955433
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Jul 2020 04:31:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=G6AK2mbt;
 spf=pass (domain: arm.com, ip: 40.107.3.47, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SccZMZwYffzX02fz5WOQQajDWUdtJTwHkov1g2Vs2bc=;
 b=G6AK2mbtZZil/rHJnhyxGKN9Oou9ZqUZlQMTmius/qh0cl/7xIbO4FOYDXdm8yDCtih5SUhrp5oCmr922WTw/Twz8rhHufd5JnG888yygqBnJtsmpquLn+sSLfHjjnQDx9ZUZ9ZvdrsYeR9Uce1HEr4Ak4VjMv3/1LrunRR/bYs=
Received: from DB6PR0202CA0045.eurprd02.prod.outlook.com (2603:10a6:4:a5::31)
 by DB6PR0802MB2264.eurprd08.prod.outlook.com (2603:10a6:4:85::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 23 Jul
 2020 11:31:41 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a5:cafe::10) by DB6PR0202CA0045.outlook.office365.com
 (2603:10a6:4:a5::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20 via Frontend
 Transport; Thu, 23 Jul 2020 11:31:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Thu, 23 Jul 2020 11:31:41 +0000
Received: ("Tessian outbound 2ae7cfbcc26c:v62"); Thu, 23 Jul 2020 11:31:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8940df0992e7e873
X-CR-MTA-TID: 64aa7808
Received: from f7b0582e55c1.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 51490DF2-C413-4D84-B98F-4D22DED50BE4.1;
	Thu, 23 Jul 2020 11:31:35 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f7b0582e55c1.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 23 Jul 2020 11:31:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpykd4HpBPqk48k2LOg6BZ7oCYVLHz2a4OeNRyTV7FVSUt7Uzgktluirl8m4OU8mdnVULYUlhpLpNq/ds72kEqcEjsSL9i+WmB3iqDWY1fI2n8dsW3Jm6q7XNp2EL9PMWboj82b11mrDodWuU4DdAoYUUWCFjGVuvE7Wp3jWA8lvBZkOsISZNVzJjtcychf/lFiJ0/DIrLJ8oxnVtXJZMMiXWJi2vRMVXIYLwN6dbNPZ/sO5bqykTX5lCCAlNn0fEnM7zGd661DjzHVo2cOOY9Oc+UNDCT/YpneFWVSTJmBULUqNm9Wmq5Z+pSh1A0emO/f2sot0+qldp4Rk5px42Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SccZMZwYffzX02fz5WOQQajDWUdtJTwHkov1g2Vs2bc=;
 b=fCkPIvA1tTCZGZ4PiNSrNrMO67XfFlR0a6aQWmBlmKwumHEmDNQymYrszNjRvy0xkTYB5FsOoHF1ys/TqW/xhcLCCWRZIi0uG1OI8nTiMBcjUCA+y+wS6agytKexzpbSodF5LEoIMt+ghzz/I/NrfeiEMBFWaeBJdRuCWdKpotdnlDMWuVNFZT73JJ2SptMh6oC1krq18LHqZp2UQ0F9FC/8cCLnz7KyWav1lagGWaZvKa8PxCm+l+PmhZTFiAoE0akcrtAjeS5qON3GW/RlSfU0BripjwoKeLqY66oT+wCsoo7VGic3ubTQy8Z8HGtTnQ1pNvVkJYPmojWKEBTAIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SccZMZwYffzX02fz5WOQQajDWUdtJTwHkov1g2Vs2bc=;
 b=G6AK2mbtZZil/rHJnhyxGKN9Oou9ZqUZlQMTmius/qh0cl/7xIbO4FOYDXdm8yDCtih5SUhrp5oCmr922WTw/Twz8rhHufd5JnG888yygqBnJtsmpquLn+sSLfHjjnQDx9ZUZ9ZvdrsYeR9Uce1HEr4Ak4VjMv3/1LrunRR/bYs=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB6PR08MB2856.eurprd08.prod.outlook.com (2603:10a6:6:20::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Thu, 23 Jul
 2020 11:31:33 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::756a:e5c9:72e0:c023]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::756a:e5c9:72e0:c023%4]) with mapi id 15.20.3216.024; Thu, 23 Jul 2020
 11:31:33 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] arm-bsp/wic: fix WKS dependencies for N1SDP components
Date: Thu, 23 Jul 2020 17:01:15 +0530
Message-Id: <20200723113115.22309-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0181.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::25) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by LO2P265CA0181.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20 via Frontend Transport; Thu, 23 Jul 2020 11:31:32 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 58113d28-0e7a-437a-764b-08d82efbf871
X-MS-TrafficTypeDiagnostic: DB6PR08MB2856:|DB6PR0802MB2264:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB2264A09A0DD7BEB3549F7F18FA760@DB6PR0802MB2264.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 WFsTjZeGaDXU1WVLNaBuR0BnWnA0n9rrIvy6eublf4mAd7DvYjteMzMmFeI8w5QG7PnuCxHisnYRJC/kwe38hwVLHkmadlX8vsm9h78uX8TYqrJDDNtYB8BnM4uKEKUQ7Q7Hyr58djFy4Os/Ii59dPPq9yrSYMrXwSXte/iEFgi+6wzxh84GM3vTApDD181U3Nszb21Ab1iCD1QEsFAc4jmXLXoy7sfD4ZAvvk8oEc3hIh4H1q4M7hDoJL+PTuo/SvLm7jp8nM7/6lM2j9E/+hwND6QqJuD7r7t59KmW9P32IpsvLGuj+issJwAdgW4n+nKulVBHNh7/T+RRw2BhA+obribBFQbjB5caC+Woui5YN1pvd3BVgXEjCz6cYTTv
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(5660300002)(316002)(7696005)(4326008)(2616005)(86362001)(36756003)(956004)(52116002)(478600001)(186003)(26005)(16526019)(6666004)(6916009)(8676002)(8936002)(66946007)(4744005)(6486002)(2906002)(1076003)(66476007)(66556008)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 JdeUeRLposlfDnTdFe92P8Zisun8jZhY7MzItspS7Mvlmrw3ZazPhtmnLj4PPYdmFNsM89/zI6A5wabSRGbNfA0AXpvGaw8hvhRekYPfUE9VoLe6kWT3O71KTzE7W4Asy8yH98RpskKAWcd5GafdHD5NfpKzrPWdBXKFvgkOb0mOqbcl+diQuRvaBjy3AJbqY0soZDg8mQsbNTXrFT1Z0lqoWU1uLCfKsaBIjDMDJOII9kQaK5O/4N5PDCNYxmkoyREbeEiKHxx6mNPEM0GeNUrI2RxPoNoOMBTqGvOB2g9NsmyyvS0azo3bohN8dd8sENs+HRU9qeEyCu4xJO5ybrcV0IP5Y80OfP5FLAMmlM/JY/nHmGWHla7/y+DJR9iJuGHM2rveOGqFcwBHsVcXwHEyIaWodmZCicrwb6q5KC148oRtDuPmnxChcUn7keB+3JLJoCDdf2h4xzCsmwElwroRSw74NYB9CYhWa04DZq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2856
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0eb96408-2ef4-45dd-f335-08d82efbf39d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Qloms5/8ygkW+XY1FPSSt/r9NxwbrexKT8IammyikXFkxaf48WdtNN03sAbUuVDRGtd+A6m4YqcbKDqF2M34y7ZSl4Xgo8gGAmkooIGZ9ExrhdGDZZOTn4Mf7Epxc00cSbHKV4bo3Iy07ThsrkbQHp9PTzf4Vna9YzmjRerQrjipYMabpDC/uO0rQJ721m6LUDM7McnR+qvgBASsVDvSD2hh8CJbt0P5stmi6yZM8UHs+1lSlTYW6i+DjGDOMZ2O0GJa3A/H0V7wVNoJtfDuEnyz1E5OrnNOx4l1oASeSRhLCwnkZHyIv7QM20OAE/Rf6UxxX5NxZ/FdSQf+lnElmuMXfbcBfTxNBJz22iqHjv9SK3e0Z8LeFl2czjYuVly/a0dHn3eIT6o+NH/EAlLP5Uwtoui78JAKDRP1j02W/Dc=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966005)(26005)(4326008)(1076003)(86362001)(478600001)(186003)(316002)(336012)(82310400002)(6916009)(956004)(356005)(16526019)(2616005)(6666004)(6486002)(70206006)(36756003)(4744005)(8936002)(70586007)(82740400003)(2906002)(7696005)(81166007)(8676002)(5660300002)(47076004)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 11:31:41.2709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58113d28-0e7a-437a-764b-08d82efbf871
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2264
Content-Type: text/plain

Add build-time dependencies to ensure the required components
(TFA, SCP, UEFI EDK2) are built and available before
the task to create wic image gets initiated.

Change-Id: I3789c8d1a44984a26d31ddd8ddd5d16f4d58c7d3
Issue-Id: PLATFORMS-3134
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index 139f619..7925969 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -17,6 +17,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 
 # Set default WKS
 WKS_FILE ?= "${@bb.utils.contains("EFI_PROVIDER", "systemd-boot", "systemd-bootdisk.wks", "mkefidisk.wks", d)}"
+WKS_FILE_DEPENDS_append = "${EXTRA_IMAGEDEPENDS}"
 
 # Use kernel provided by linaro (Contains support for SCMi or HDMI)
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-linaro-arm"
-- 
2.17.1

