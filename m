Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.62])
 by mx.groups.io with SMTP id smtpd.web09.6512.1626953648057711908
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Jul 2021 04:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=GyWXnONP;
 spf=pass (domain: arm.com, ip: 40.107.4.62, mailfrom: arunachalam.ganapathy@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zB9hB7QNY5Cvd3DDXI7ZqUjVYWtwOCl0KBN4UyCJTa0=;
 b=GyWXnONPvEFpjiOHuLdNhR+mQA9OkW7jG1gWCabcQ0ZxmmRXtVFvi50XH7ISDAHu1vX+OWnFqBcL6hLFbnR0d8d+fI2E/XfAvb6YOmXa6C3b3P4XIrLQ1ibZpE1ImFJqI5SpZYrsfuLB1f+woyOhzRCXPqc5rsJa/2JyY9MOH4U=
Received: from DU2PR04CA0358.eurprd04.prod.outlook.com (2603:10a6:10:2b4::31)
 by AM6PR08MB4769.eurprd08.prod.outlook.com (2603:10a6:20b:d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Thu, 22 Jul
 2021 11:34:05 +0000
Received: from DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::fb) by DU2PR04CA0358.outlook.office365.com
 (2603:10a6:10:2b4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend
 Transport; Thu, 22 Jul 2021 11:34:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT009.mail.protection.outlook.com (10.152.20.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Thu, 22 Jul 2021 11:34:05 +0000
Received: ("Tessian outbound 57330d0f8f60:v99"); Thu, 22 Jul 2021 11:34:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 565eebbf38e20972
X-CR-MTA-TID: 64aa7808
Received: from 47b628be3908.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7A691CD4-4942-4D1A-817F-BD1D39FC9DF0.1;
	Thu, 22 Jul 2021 11:33:40 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 47b628be3908.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 22 Jul 2021 11:33:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SK0JFi45XqdJinOP46t99Cc/YitaWYap3I5m1nJv73Y12WulfprGev9y5RNoOpmIKcHEFLaObe7B6r7zmmOrVML4B92bQ1MHColWOIYx6gZKCfzDUz4MDAMjhQs8wsc7XR4J21v7xK4kZauHkQ5ngcWYjCegV4leOJ78XOlG+eOn3u0XX1wDHzA0kDw8aM1I6SLjwQzAXzsPDTYO/+wpTRJLlTEK/An9a6sinfrwo0esxnWj2BGOL6PWFnnFHotygP3Jt/puNCSHIcJAHXep7rR1i8HOE6TS6jeyReXcWaWzuxatxQeGQD8TAQnm5YGh+++tVgHw8YUeBrfSk2uQYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zB9hB7QNY5Cvd3DDXI7ZqUjVYWtwOCl0KBN4UyCJTa0=;
 b=In/U2102p6Cm47SMN4H0R35ONlZqJ6Ak+Ms1YvOMDAq7i1Nuxe8Dkm0uqhfAe0oQ5ozHcWsOrBkCeffxopXbPp3lpc6pNWg897JR3eqBbFCTsW2jWWLXsqmbmST1s4gOIMd+/l57JMnkGGtqtM5/URW+pfZg2wqxvEOl/tmSchc4jr/6Xt0fL3oPI4JgQmD5rqX3x+rH48YO1SSvrVK3jD4QNqxSB4ejQOyrxUeX6xcXpoKAmwKb9dFMA8CoP/auVMq/pcN3axn37a/eW9X+P1EupE4ECCOYttquA8m0pYJg8yCD/uSoQoYHbmpYh+SQ8tgULmjxrSB88qjalII4Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zB9hB7QNY5Cvd3DDXI7ZqUjVYWtwOCl0KBN4UyCJTa0=;
 b=GyWXnONPvEFpjiOHuLdNhR+mQA9OkW7jG1gWCabcQ0ZxmmRXtVFvi50XH7ISDAHu1vX+OWnFqBcL6hLFbnR0d8d+fI2E/XfAvb6YOmXa6C3b3P4XIrLQ1ibZpE1ImFJqI5SpZYrsfuLB1f+woyOhzRCXPqc5rsJa/2JyY9MOH4U=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com (2603:10a6:102:136::18)
 by PA4PR08MB5950.eurprd08.prod.outlook.com (2603:10a6:102:e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Thu, 22 Jul
 2021 11:33:39 +0000
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::b4c4:746b:9a5e:2a34]) by PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::b4c4:746b:9a5e:2a34%7]) with mapi id 15.20.4331.034; Thu, 22 Jul 2021
 11:33:39 +0000
From: "Arunachalam Ganapathy" <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 6/6] arm-bsp/scp-firmware: update SHA for tc0
Date: Thu, 22 Jul 2021 12:32:50 +0100
Message-ID: <20210722113250.3394087-6-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210722113250.3394087-1-arunachalam.ganapathy@arm.com>
References: <20210722113250.3394087-1-arunachalam.ganapathy@arm.com>
X-ClientProxiedBy: LO2P265CA0241.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::13) To PAXPR08MB6766.eurprd08.prod.outlook.com
 (2603:10a6:102:136::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ts710.cambridge.arm.com (217.140.106.53) by LO2P265CA0241.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8a::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend Transport; Thu, 22 Jul 2021 11:33:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d65e9d2c-5d2f-485d-1cc2-08d94d049ca2
X-MS-TrafficTypeDiagnostic: PA4PR08MB5950:|AM6PR08MB4769:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB47692B427F8FE7E606222F18FBE49@AM6PR08MB4769.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: wEqJbhhn6DIwDdoa/j/wnunUu+ShFFSoGdaP7NNy4hds3fvjSjJbSeLD6UWapa/Nyt/QPxGL0f6GCdwCvtqMK1KjOL2BBvCLfgc52v3ZSQIak7Yg7PnEiXWRCxelT2r1tHpMcvL8wIt22btf1dXv37iikCv8XiyJlvvpVQ/yYv9ySr4zaDAmewKUz5u11nzxNa/m31fkBJwUmarJTYWZ7T0K71iV3702f7GDEkGUfw0EAAMvVJwSd6PNanH3ewpll7uffhylb4yP24mKMruKxvdfSPPLpV7sUIlqfKb27ADF06zQvsLWCmdASv1+d+lzsS5Acw0iUNfR9sE8G3TVcfRvKzUlk/mWqnLdog7bvCNXH9ydpnpMQTCq663/uCptc4ft8pJSGEHQGQFJo2r+q0N51mzWoYwTHlNCFUwQF4FPO/5t4LdX+qGLQiPt0INZLLiSJXWsAufr4pHmCLYaCc5GNlg2v8B6HW6aYew64aEy4vAE8r5jle1YierUrE5knmgY+NKKrPNIr70wjyu/engKIpr+och75zZswZlooj9GzTJxS3xU3sRm73ZsFij01sTvGQ0Wvq0nBcGTlOidojHsbAFiG4W/QX3UyDQWSrWO1VfT8OKb77TOO8eGGhMF4Kta60JF97TKhm2fOsCJZzAvzfCxKKtntFQC9im7uGdMT04wWHBKQHcrZ8+MtdaVs+Wm9Ryv/lFaV9Ox901dlQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6766.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(6486002)(8936002)(38100700002)(5660300002)(44832011)(186003)(36756003)(26005)(52116002)(4744005)(6666004)(66946007)(66476007)(86362001)(508600001)(4326008)(66556008)(8676002)(2906002)(2616005)(1076003)(38350700002)(956004)(7696005)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rqb0gryQvmdcuCux5DrD5bs4UKUXHkPQg3MnwV1sgTcZ8Vk0EjNT6wAChBU9?=
 =?us-ascii?Q?sgFfDGbW0G/gQmXIzY4fEuHSQBzB60FeswO0EjGia+EMt8OJgPvxG+MN2Np5?=
 =?us-ascii?Q?Y0ubzeWJtEXSEEORqi9mAsIWZr9DYZ6+SRLKo+GE7u6Yn0zI3lnzCuURdTg0?=
 =?us-ascii?Q?0iThDBRWEjPh59A0laI8xeyXkn5xJMkll7DxNcXf1VNxm9JcBnUiH1wRbY+Z?=
 =?us-ascii?Q?PyvoQz5+Dezk7THQkr6omP+bNblDdyeRbK9QBbrdgUbNUoU4ULFFQlQeTUPF?=
 =?us-ascii?Q?gK289nIiMy28GskUedeI4OQcwVgQo6kN11Gk59iD70IxPi6UGkBxclwPB6zl?=
 =?us-ascii?Q?FnjBjhUw1XBiwb/Xfz/ExL8iFmScxAljOf9oXQIC4QbKP9Yk1mwYlmISPTcG?=
 =?us-ascii?Q?XFMfMRB/ajPT3a5DFpcfEaYnpK+2ikT7M6e8/CNPhKsRFHpf1xmHSgJpKgR+?=
 =?us-ascii?Q?Qd/QkGiGjou/XxuPgGovhBB1XGqAjH9kcuawsP3AX92JiYHH0MzrtUOMKTGW?=
 =?us-ascii?Q?3a81VPrx/Oo94aIfw83/xkBlVu/xz9AUrdTjoRJsrHceKyhUNFilWR2IISkY?=
 =?us-ascii?Q?hzrEjsyZbHni+nFkwTt8PrBNNL5P2GnKy911mmeE5wHz3hM/XhMAXNpvNjKj?=
 =?us-ascii?Q?1XCxODCm006IfnxXI2Wkt4kD8zX/i+S1ViSAk1SJFftcq7CFijPIGLQKAsS1?=
 =?us-ascii?Q?mDSy6GBhaofnZdWEwsGlfG7ohPtZKp1lSaWe1yiVKMoDzLae9oq7AKcDth01?=
 =?us-ascii?Q?vgjwAuGXFIZKfnOS12PiEZquELz5e604+4N808FzlozgTZenGWg03e400LpL?=
 =?us-ascii?Q?T9Zxh9305jybpUbqSAVtruE9ioDqdK+Wc/ciMN92BUtb6etbhU58xb7l9QkA?=
 =?us-ascii?Q?57eDwUG6M2x+L5rYJjpgsjqsqil1hQ6mqcwXf/mbAlL+RT97LrbnVZEv1GqF?=
 =?us-ascii?Q?wpWYLhbmqW0EpKL0JfiFXEhIo2V9rDrjmg62JJZuJGCR8zd6+oDW4L3IAOb5?=
 =?us-ascii?Q?bZzuRjkKOtzbBr5Jxd0SUR0n4UBjbvCCBCq+e+pHZnqXy24TSeAedLKEAeWS?=
 =?us-ascii?Q?hljreaKsJ60ShTHF+UkPZQjgN5/cpzjr57Ov3zPs9RQrWYALkdV9Vzp/4ev5?=
 =?us-ascii?Q?pfiEhea5QHBWBC3jlg4WXU3hHOdlBxQKLMhnDbVw7/IiolsMbXKtGVK765E3?=
 =?us-ascii?Q?oA1XPNjcCOJwz8rFkNr+ZoyHN2MINCBpgPiXaiy34oZc4Y3nE9ZEIbZK+BZ9?=
 =?us-ascii?Q?lE/8A5dTdfnHWWtcp2s9Q57F+rVrWr30NMUGSYSfUWtbeSSCyE5yYN+g1C30?=
 =?us-ascii?Q?di3Db/dqEY4gnFCtu09DSQoD?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5950
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Arunachalam.Ganapathy@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8135b53b-bfc9-4865-1a7d-08d94d048ce3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CF7za+sNqEo1vVEjIUJiIN3UpsiM8tqtsLzPkf2gcxIXqdx7RzWYjCd4yR4hm00ygh9pWj9/7pYynQKk9i4wOWU/xuqAXkpmNLUAVYvVxqsN0hnvnEZuhU7K6L938V4h9eMMM9SN3SH7yDFQ47I/IHL0Qc62Jc/HWH70J4eAzsYT1e/kRfTeLmGqWKiXZcHF0EDQyTS/3qDyGW0qQNlddsqObQz/N1GiHtT3AO3h1qpxG/z80gkH4Leht+/2t9BeceslVQsAPRdERwBEFgrUogsSxi6fBPXK5TnYkYaGq7CoR8AWYKooSr2gsI2XY4SLhRDxlpBpdbgWUoG7WVAfa/Fhojmr7+yoY0orlUoJmBh3Ft5T08PzGLoT+VfAZ6J8asoI6O64sFj/egYIq4ds82NqKH/lZa/vS55I6fOklD4V7yqwXhU4F5t1VJOV56fqZt3QtscCCtcvtGb82y4+Y7Lc47yUMRIHzHohREKeeYZ1qCgVOafN+PDgkTBf727QlVG7s574a6t8jpwDfyWaOljHzsYu8HICpQcMpi4EFthty5XUvE6pnvfDfDc3NHYBa1+Y0pP2zPZUvUQrJFnyRsWoxIhHlc9SRt+UPpVmWFIxs0Lpb4YSBB62I6RY5zdDbVK0NMsmr9J+CQBpavdpZHqShuzHs0FKqdEP2AYkfZNIBVnuNgyPIXgA4XJt2571ThW3uMO8ceQgHpGzJeQcig==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39850400004)(136003)(46966006)(36840700001)(82740400003)(36860700001)(7696005)(1076003)(8936002)(186003)(8676002)(36756003)(70206006)(6486002)(956004)(26005)(2616005)(70586007)(6916009)(4744005)(6666004)(356005)(5660300002)(44832011)(81166007)(47076005)(4326008)(316002)(478600001)(2906002)(86362001)(336012)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 11:34:05.2613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d65e9d2c-5d2f-485d-1cc2-08d94d049ca2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4769
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This SHA contains fix for IRQn type conversion issues

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: I10cc4729df3e12c549413f40d390c24f318c4577
---
 .../recipes-bsp/scp-firmware/scp-firmware-tc0.inc        | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc b/m=
eta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
index cacdca8..62a0e25 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
@@ -1,5 +1,14 @@
 # TC0 specific SCP configuration
=20
+# Intermediate SHA with 2.8 baseline version
+SRCREV =3D "67a3612716ad3b839da4209a173404692607c5a1"
+PV =3D "2.8+git${SRCPV}"
+
+# This is incorporated into the SRCREV above
+SRC_URI_remove =3D " \
+    file://0001-smt-Make-status-and-length-volatile-for-mod_smt_memo.patch=
 \
+    "
+
 COMPATIBLE_MACHINE =3D "tc0"
=20
 SCP_PLATFORM =3D "tc0"
--=20
2.29.2

