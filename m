Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.41])
 by mx.groups.io with SMTP id smtpd.web11.15233.1601647536894617210
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 02 Oct 2020 07:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=t+0GvKQk;
 spf=pass (domain: arm.com, ip: 40.107.22.41, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9O9XsCdvHFbBXbiCDTG8Q4Z3n3GhGRb9yupthtHtFEA=;
 b=t+0GvKQkhtKtQEFfkPg4XqgdBy/i/kfUwBo0YsQKMF1mJt82qZQNS/V0TWe8ra5yPOTW2YJZJd+Dra3+wIUDuNsG/qHBf7ym9ih/bI0ULrB6vqx2Y4T8tyMWKcj5+Ra6nsKTrjE/6HELj6T3xpOPduInug/cjWqQVJNX6V9pmkM=
Received: from AM5PR0402CA0015.eurprd04.prod.outlook.com
 (2603:10a6:203:90::25) by VI1PR08MB4207.eurprd08.prod.outlook.com
 (2603:10a6:803:ed::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.23; Fri, 2 Oct
 2020 14:05:26 +0000
Received: from VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::63) by AM5PR0402CA0015.outlook.office365.com
 (2603:10a6:203:90::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Fri, 2 Oct 2020 14:05:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT031.mail.protection.outlook.com (10.152.18.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 14:05:24 +0000
Received: ("Tessian outbound a0bffebca527:v64"); Fri, 02 Oct 2020 14:05:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 28de36c4c08910d4
X-CR-MTA-TID: 64aa7808
Received: from 477053c32f81.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8A78F634-9F1B-4B47-87EA-CA29A08C761B.1;
	Fri, 02 Oct 2020 14:04:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 477053c32f81.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 02 Oct 2020 14:04:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccBNCOyowiXIFgJPZ9skdFVWQdaKgS3jNy3c/XJRlEOKaVpXsiPR/wJZVkiVvc/QFiS+ykRB0UvtuMoUGoS16UsQ+HTIXBPvaJ9j4kDpKSUEyMw6W29ksTTlLI/wURzyWiLusytH76yAoy98w9Uq4iafVO7FQTKDQhOGYx/jmQp90sqPlqivfssQvByN9Qw4rKu0Cuxro5omVwwcHtRhcPttrioqpwI+1NP+eYBWDwgeW9D/xGq46AHlxdASTmxMTaq10wfvGNoNWi+8lOf6AgHfXbMcTJxj0UFbo4zXCHKqUghUrED+Jq8DQc2Eo1QNIw3bJaLNSMeKFXyVlu/VQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9O9XsCdvHFbBXbiCDTG8Q4Z3n3GhGRb9yupthtHtFEA=;
 b=S2wbWuJTg4qStWuidD5234QcxzT8kiy6OCYJj+n1OwYMwxf3H/+f4ccCF6IXW25FnRQhgUCQvcnbrS679yl46OEN/rQXqVK+xeCDiOBCDO5HRs5QAFbDDBd3N3ehAi6GHQrtmH7DqeMkdeaTbbwkG/ZgukOhf+2ij+pOneqnVKJFeztTRBMhSLnJ6kO/GgpmhCDC7KO/brYADO/l3d2HHTaJY0WuTpdnv02O59TUegJsq0RiUkcWnk93AH0RVFvybgBruAYwry+ZvEOADEmNbE0eZHY40oo6DVgKkfnqhj01TqJWRiva1OOd5eARze+EB2x0McTLrNohlevs/Mejtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9O9XsCdvHFbBXbiCDTG8Q4Z3n3GhGRb9yupthtHtFEA=;
 b=t+0GvKQkhtKtQEFfkPg4XqgdBy/i/kfUwBo0YsQKMF1mJt82qZQNS/V0TWe8ra5yPOTW2YJZJd+Dra3+wIUDuNsG/qHBf7ym9ih/bI0ULrB6vqx2Y4T8tyMWKcj5+Ra6nsKTrjE/6HELj6T3xpOPduInug/cjWqQVJNX6V9pmkM=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com (2603:10a6:3:50::23)
 by HE1PR08MB2764.eurprd08.prod.outlook.com (2603:10a6:7:2b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.28; Fri, 2 Oct
 2020 14:04:28 +0000
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::edce:70dc:41f6:a3f3]) by HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::edce:70dc:41f6:a3f3%9]) with mapi id 15.20.3433.037; Fri, 2 Oct 2020
 14:04:28 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/7] arm-bsp: Add cortexa tunes
Date: Fri,  2 Oct 2020 10:04:01 -0400
Message-Id: <20201002140405.7896-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201002140405.7896-1-jon.mason@arm.com>
References: <20201002140405.7896-1-jon.mason@arm.com>
X-Originating-IP: [136.56.1.171]
X-ClientProxiedBy: SN6PR16CA0052.namprd16.prod.outlook.com
 (2603:10b6:805:ca::29) To HE1PR0801MB2058.eurprd08.prod.outlook.com
 (2603:10a6:3:50::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (136.56.1.171) by SN6PR16CA0052.namprd16.prod.outlook.com (2603:10b6:805:ca::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 14:04:26 +0000
Received: by vm (sSMTP sendmail emulation); Fri, 02 Oct 2020 10:04:22 -0400
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2b760582-637c-48a3-e330-08d866dc353d
X-MS-TrafficTypeDiagnostic: HE1PR08MB2764:|VI1PR08MB4207:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB4207988609659E25FA92656FF0310@VI1PR08MB4207.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:191;OLM:191;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Xy5ae77QkpazZrz55J+0ZfClf6G06+PvhKbpbzTZBWzRc520V06nCzgCtHQ/+V8p+NR9irmBMVR1S8EWb17BbxsVGs4/TMKCDrDcTO78ZXvCM3+EMh1VBKjaOa5fNW8PP4shg+KUIR/BpSXdwfrP4Z4XdKGuOGvDmQ+U3lyV6518sDO2DiSH7IsMgjtpv4OZMozqos5nuTqyzQjFowwhDa++RUn3tLfeJM69tp+wvQ4bigdvKg0oRw/3sAHeD1TehGUFQBnYHtd4g9ozrJyLmxUCLQaG7+rynRkT6ZrdqMT4qu0wVtQoVA/oSAy0PpX3Ye0hQwNG8K0TdxnXHuShs7PQK2tLQm+RgplohtCxLDbuTJY+aKfwLQ7sFvOlMTwu
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0801MB2058.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(186003)(26005)(1076003)(19627235002)(2616005)(44832011)(6666004)(426003)(66476007)(86362001)(66556008)(52116002)(66946007)(36756003)(5660300002)(30864003)(8676002)(6916009)(83380400001)(478600001)(8936002)(42186006)(2906002)(316002)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 q4cSJ4LwYrEGpkpzDjqyfpqz4ddeZmlab4EWG5oC6fUxoxFmLvT99y7E95qvaowotop7uRGDJOi7prtgG44uXdyIGLgj4DPHDpc1UBUtvtkitv6RpG87OIV4fBMhdzRGkQyTBuK7IrJk349YA01Ju9r+/3VGXHIcflojiB3RSqd1VlZs8sHw7YOBLT1IIAUWQZKJK6TpyffdXuU1fnWO/ZQ+keTSA7KkkyHqlmfB7viDAGZAEjG5rfKFCQx4+1t/7OhTQnIxqYi/aVytd+M/wbI1oJGwEatcUjnkH5msHd9oZ8/niLdJp1FsnFTl6D0yeODWmBo0imVScXHRBLK1oZbLLuWSedyOtkk5R/bj78cNGj49/msAo4GA1MTcRUaXJOlEF3UC+IvAN5pfc2O/Z0heWBAy9cxQnTceBcbu0i76G2V3T/sSoEeZac8LUSjymQRRr8OQmgJ7JKt+w9DzR0W9JI7nwrzRmWBjt2e5a4XKfDHZRsGrGsgbaZdxk0ezg6sIYHaflhBaFyYlcoTeushrRuporFKpuXIHu+JmWBvKgsiINGgmr9f5m0QUeo88y9oxyHy2/DCQYSF4xmG9Y2AWRdBdMsIC3+romGRFA/goZ6p7IfBjenfJS04/iTxijZLitLPRFRGsAAQNAonE4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2764
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	13b28ef4-7c46-477f-463b-08d866dc12ba
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9ebPgCbD9vs+wQvQKYjoSL68TsPy8GU0yWg5cMf8zG2pB0UQ5K4Dslq9AYjVvIh1fW8sj+O0w9sq//1MoWNsbpQUi/fcbGVYzdT2QvDdcOhNBB2McAPOrzAipuDxiyZwMsBjZfzC+09b5N5k+0LQW0b1U1Ua7fnS4pJqEGJu4zO0H8pc5rt0ts6bOl8b3q1YDnEiLeR11h8XenikLrxKjjUDBLeqzbf9qdxL65GEk6A095bfEcTgRd3CL7zPwrD5hrRiBfUu+iSSVuFEMk5KFCz/HXY0aebTWTgz1IKsKZMiYMJ3YkkqKkLCFX5iJM5lcS+zGeLgc+0b67Ab6rqyvgRTxs10ZD+pxnPxpeF7hgFYGZvyz09rYJaZl076YI8KtsptmKSJlttjxbCCQuLPrRMZaoIeFquEba0d1Gn4bKdWJWiURm9LdZL6RHxjx2TP
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39850400004)(46966005)(30864003)(36756003)(5660300002)(356005)(44832011)(83380400001)(6666004)(336012)(186003)(8676002)(1076003)(426003)(42186006)(26005)(70206006)(36906005)(478600001)(70586007)(86362001)(19627235002)(47076004)(2906002)(6916009)(8936002)(82310400003)(82740400003)(81166007)(2616005)(316002)(559001)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 14:05:24.3454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b760582-637c-48a3-e330-08d866dc353d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4207
Content-Type: text/plain

Until accepted into oe-core, add the cortex-a tunes here so that they
can be used in meta-arm-bsp.  Also, this allows for them to be used for
dunfell support.

Change-Id: I9e0affef8d9d94f27cd68d5032b82276f51f7c1e
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../machine/include/arm/arch-armv8-2a.inc     | 19 +++++++
 .../conf/machine/include/tune-cortexa15.inc   | 51 +++++++++++++++++
 .../conf/machine/include/tune-cortexa17.inc   | 51 +++++++++++++++++
 .../conf/machine/include/tune-cortexa32.inc   | 17 ++++++
 .../conf/machine/include/tune-cortexa34.inc   | 20 +++++++
 .../conf/machine/include/tune-cortexa35.inc   | 17 ++++++
 .../conf/machine/include/tune-cortexa5.inc    | 51 +++++++++++++++++
 .../conf/machine/include/tune-cortexa53.inc   | 17 ++++++
 .../conf/machine/include/tune-cortexa55.inc   | 13 +++++
 .../include/tune-cortexa57-cortexa53.inc      | 14 +++++
 .../conf/machine/include/tune-cortexa57.inc   | 17 ++++++
 .../conf/machine/include/tune-cortexa65.inc   | 16 ++++++
 .../conf/machine/include/tune-cortexa65ae.inc | 16 ++++++
 .../conf/machine/include/tune-cortexa7.inc    | 51 +++++++++++++++++
 .../include/tune-cortexa72-cortexa53.inc      | 19 +++++++
 .../conf/machine/include/tune-cortexa72.inc   | 13 +++++
 .../include/tune-cortexa73-cortexa35.inc      | 15 ++---
 .../include/tune-cortexa73-cortexa53.inc      | 19 +++++++
 .../conf/machine/include/tune-cortexa73.inc   | 16 ++++++
 .../include/tune-cortexa75-cortexa55.inc      | 28 +++++-----
 .../conf/machine/include/tune-cortexa75.inc   | 13 +++--
 .../include/tune-cortexa76-cortexa55.inc      | 28 +++++-----
 .../conf/machine/include/tune-cortexa76.inc   | 15 +++--
 .../conf/machine/include/tune-cortexa76ae.inc | 16 ++++++
 .../conf/machine/include/tune-cortexa77.inc   | 15 +++--
 .../conf/machine/include/tune-cortexa8.inc    | 39 +++++++++++++
 .../conf/machine/include/tune-cortexa9.inc    | 55 +++++++++++++++++++
 27 files changed, 609 insertions(+), 52 deletions(-)
 create mode 100644 meta-arm-bsp/conf/machine/include/arm/arch-armv8-2a.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa15.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa17.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa32.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa34.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa35.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa5.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa53.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa55.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa57-cortexa53.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa57.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa65.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa65ae.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa7.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa72-cortexa53.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa72.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa53.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa73.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa76ae.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa8.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa9.inc

diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-2a.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-2a.inc
new file mode 100644
index 0000000..528c34e
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-2a.inc
@@ -0,0 +1,19 @@
+DEFAULTTUNE ?= "armv8-2a"
+
+TUNEVALID[armv8-2a] = "Enable instructions for ARMv8-a"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', ' -march=armv8.2-a', '', d)}"
+# TUNE crypto will be handled by arch-armv8a.inc below
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', 'armv8-2a:', '', d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+
+AVAILTUNES += "armv8-2a armv8-2a-crypto"
+ARMPKGARCH_tune-armv8-2a                    ?= "armv8-2a"
+ARMPKGARCH_tune-armv8-2a-crypto             ?= "armv8-2a"
+TUNE_FEATURES_tune-armv8-2a                  = "aarch64 armv8-2a"
+TUNE_FEATURES_tune-armv8-2a-crypto           = "${TUNE_FEATURES_tune-armv8-2a} crypto"
+PACKAGE_EXTRA_ARCHS_tune-armv8-2a            = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8-2a"
+PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a} armv8-2a-crypto"
+BASE_LIB_tune-armv8-2a                       = "lib64"
+BASE_LIB_tune-armv8-2a-crypto                = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa15.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa15.inc
new file mode 100644
index 0000000..0457c2d
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa15.inc
@@ -0,0 +1,51 @@
+DEFAULTTUNE ?= "armv7vethf-neon"
+
+require conf/machine/include/arm/arch-armv7ve.inc
+
+TUNEVALID[cortexa15] = "Enable Cortex-A15 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', ' -mcpu=cortex-a15', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', 'armv7ve:', '', d)}"
+
+# Little Endian base configs
+AVAILTUNES += "cortexa15 cortexa15t cortexa15-neon cortexa15t-neon cortexa15-neon-vfpv4 cortexa15t-neon-vfpv4"
+ARMPKGARCH_tune-cortexa15             = "cortexa15"
+ARMPKGARCH_tune-cortexa15t            = "cortexa15"
+ARMPKGARCH_tune-cortexa15-neon        = "cortexa15"
+ARMPKGARCH_tune-cortexa15t-neon       = "cortexa15"
+ARMPKGARCH_tune-cortexa15-neon-vfpv4  = "cortexa15"
+ARMPKGARCH_tune-cortexa15t-neon-vfpv4 = "cortexa15"
+# mcpu is used so don't use armv7ve as we don't want march
+TUNE_FEATURES_tune-cortexa15             = "arm vfp cortexa15"
+TUNE_FEATURES_tune-cortexa15t            = "${TUNE_FEATURES_tune-cortexa15} thumb"
+TUNE_FEATURES_tune-cortexa15-neon        = "${TUNE_FEATURES_tune-cortexa15} neon"
+TUNE_FEATURES_tune-cortexa15t-neon       = "${TUNE_FEATURES_tune-cortexa15-neon} thumb"
+TUNE_FEATURES_tune-cortexa15-neon-vfpv4  = "${TUNE_FEATURES_tune-cortexa15-neon} vfpv4"
+TUNE_FEATURES_tune-cortexa15t-neon-vfpv4 = "${TUNE_FEATURES_tune-cortexa15-neon-vfpv4} thumb"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve} cortexa15-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} cortexa15-vfp cortexa15t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon} cortexa15-vfp cortexa15-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon} cortexa15-vfp cortexa15-neon cortexa15t2-vfp cortexa15t2-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4} cortexa15-vfp cortexa15-neon cortexa15-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon-vfpv4} cortexa15-vfp cortexa15-neon cortexa15-neon-vfpv4 cortexa15t2-vfp cortexa15t2-neon cortexa15t2-neon-vfpv4"
+
+# HF Tunes
+AVAILTUNES += "cortexa15hf cortexa15thf cortexa15hf-neon cortexa15thf-neon cortexa15hf-neon-vfpv4 cortexa15thf-neon-vfpv4"
+ARMPKGARCH_tune-cortexa15hf             = "cortexa15"
+ARMPKGARCH_tune-cortexa15thf            = "cortexa15"
+ARMPKGARCH_tune-cortexa15hf-neon        = "cortexa15"
+ARMPKGARCH_tune-cortexa15thf-neon       = "cortexa15"
+ARMPKGARCH_tune-cortexa15hf-neon-vfpv4  = "cortexa15"
+ARMPKGARCH_tune-cortexa15thf-neon-vfpv4 = "cortexa15"
+# mcpu is used so don't use armv7ve as we don't want march
+TUNE_FEATURES_tune-cortexa15hf             = "${TUNE_FEATURES_tune-cortexa15} callconvention-hard"
+TUNE_FEATURES_tune-cortexa15thf            = "${TUNE_FEATURES_tune-cortexa15t} callconvention-hard"
+TUNE_FEATURES_tune-cortexa15hf-neon        = "${TUNE_FEATURES_tune-cortexa15-neon} callconvention-hard"
+TUNE_FEATURES_tune-cortexa15thf-neon       = "${TUNE_FEATURES_tune-cortexa15t-neon} callconvention-hard"
+TUNE_FEATURES_tune-cortexa15hf-neon-vfpv4  = "${TUNE_FEATURES_tune-cortexa15-neon-vfpv4} callconvention-hard"
+TUNE_FEATURES_tune-cortexa15thf-neon-vfpv4 = "${TUNE_FEATURES_tune-cortexa15t-neon-vfpv4} callconvention-hard"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf} cortexa15hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} cortexa15hf-vfp cortexa15t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon} cortexa15hf-vfp cortexa15hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon} cortexa15hf-vfp cortexa15hf-neon cortexa15t2hf-vfp cortexa15t2hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4} cortexa15hf-vfp cortexa15hf-neon cortexa15hf-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon-vfpv4} cortexa15hf-vfp cortexa15hf-neon cortexa15hf-neon-vfpv4 cortexa15t2hf-vfp cortexa15t2hf-neon cortexa15t2hf-neon-vfpv4"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa17.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa17.inc
new file mode 100644
index 0000000..6a2107f
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa17.inc
@@ -0,0 +1,51 @@
+DEFAULTTUNE ?= "armv7vethf-neon"
+
+require conf/machine/include/arm/arch-armv7ve.inc
+
+TUNEVALID[cortexa17] = "Enable Cortex-A17 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17', ' -mcpu=cortex-a17', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17', 'armv7ve:', '', d)}"
+
+# Little Endian base configs
+AVAILTUNES += "cortexa17 cortexa17t cortexa17-neon cortexa17t-neon cortexa17-neon-vfpv4 cortexa17t-neon-vfpv4"
+ARMPKGARCH_tune-cortexa17             = "cortexa17"
+ARMPKGARCH_tune-cortexa17t            = "cortexa17"
+ARMPKGARCH_tune-cortexa17-neon        = "cortexa17"
+ARMPKGARCH_tune-cortexa17t-neon       = "cortexa17"
+ARMPKGARCH_tune-cortexa17-neon-vfpv4  = "cortexa17"
+ARMPKGARCH_tune-cortexa17t-neon-vfpv4 = "cortexa17"
+# mcpu is used so don't use armv7ve as we don't want march
+TUNE_FEATURES_tune-cortexa17             = "arm vfp cortexa17"
+TUNE_FEATURES_tune-cortexa17t            = "${TUNE_FEATURES_tune-cortexa17} thumb"
+TUNE_FEATURES_tune-cortexa17-neon        = "${TUNE_FEATURES_tune-cortexa17} neon"
+TUNE_FEATURES_tune-cortexa17t-neon       = "${TUNE_FEATURES_tune-cortexa17-neon} thumb"
+TUNE_FEATURES_tune-cortexa17-neon-vfpv4  = "${TUNE_FEATURES_tune-cortexa17-neon} vfpv4"
+TUNE_FEATURES_tune-cortexa17t-neon-vfpv4 = "${TUNE_FEATURES_tune-cortexa17-neon-vfpv4} thumb"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve} cortexa17-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} cortexa17-vfp cortexa17t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon} cortexa17-vfp cortexa17-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon} cortexa17-vfp cortexa17-neon cortexa17t2-vfp cortexa17t2-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4} cortexa17-vfp cortexa17-neon cortexa17-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon-vfpv4} cortexa17-vfp cortexa17-neon cortexa17-neon-vfpv4 cortexa17t2-vfp cortexa17t2-neon cortexa17t2-neon-vfpv4"
+
+# HF Tunes
+AVAILTUNES += "cortexa17hf cortexa17thf cortexa17hf-neon cortexa17thf-neon cortexa17hf-neon-vfpv4 cortexa17thf-neon-vfpv4"
+ARMPKGARCH_tune-cortexa17hf             = "cortexa17"
+ARMPKGARCH_tune-cortexa17thf            = "cortexa17"
+ARMPKGARCH_tune-cortexa17hf-neon        = "cortexa17"
+ARMPKGARCH_tune-cortexa17thf-neon       = "cortexa17"
+ARMPKGARCH_tune-cortexa17hf-neon-vfpv4  = "cortexa17"
+ARMPKGARCH_tune-cortexa17thf-neon-vfpv4 = "cortexa17"
+# mcpu is used so don't use armv7ve as we don't want march
+TUNE_FEATURES_tune-cortexa17hf             = "${TUNE_FEATURES_tune-cortexa17} callconvention-hard"
+TUNE_FEATURES_tune-cortexa17thf            = "${TUNE_FEATURES_tune-cortexa17t} callconvention-hard"
+TUNE_FEATURES_tune-cortexa17hf-neon        = "${TUNE_FEATURES_tune-cortexa17-neon} callconvention-hard"
+TUNE_FEATURES_tune-cortexa17thf-neon       = "${TUNE_FEATURES_tune-cortexa17t-neon} callconvention-hard"
+TUNE_FEATURES_tune-cortexa17hf-neon-vfpv4  = "${TUNE_FEATURES_tune-cortexa17-neon-vfpv4} callconvention-hard"
+TUNE_FEATURES_tune-cortexa17thf-neon-vfpv4 = "${TUNE_FEATURES_tune-cortexa17t-neon-vfpv4} callconvention-hard"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf} cortexa17hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} cortexa17hf-vfp cortexa17t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon} cortexa17hf-vfp cortexa17hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon} cortexa17hf-vfp cortexa17hf-neon cortexa17t2hf-vfp cortexa17t2hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17hf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4} cortexa17hf-vfp cortexa17hf-neon cortexa17hf-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon-vfpv4} cortexa17hf-vfp cortexa17hf-neon cortexa17hf-neon-vfpv4 cortexa17t2hf-vfp cortexa17t2hf-neon cortexa17t2hf-neon-vfpv4"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa32.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa32.inc
new file mode 100644
index 0000000..a11ab7b
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa32.inc
@@ -0,0 +1,17 @@
+DEFAULTTUNE ?= "cortexa32"
+
+TUNEVALID[cortexa32] = "Enable Cortex-A32 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa32', ' -mcpu=cortex-a32', '', d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Little Endian base configs
+AVAILTUNES += "cortexa32 cortexa32-crypto"
+ARMPKGARCH_tune-cortexa32             = "cortexa32"
+ARMPKGARCH_tune-cortexa32-crypto      = "cortexa32"
+TUNE_FEATURES_tune-cortexa32          = "${TUNE_FEATURES_tune-armv8a-crc} cortexa32"
+TUNE_FEATURES_tune-cortexa32-crypto   = "${TUNE_FEATURES_tune-cortexa32} crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa32             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa32"
+PACKAGE_EXTRA_ARCHS_tune-cortexa32-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa32 cortexa32-crypto"
+BASE_LIB_tune-cortexa32               = "lib"
+BASE_LIB_tune-cortexa32-crypto        = "lib"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa34.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa34.inc
new file mode 100644
index 0000000..f7d4c87
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa34.inc
@@ -0,0 +1,20 @@
+#
+# Tune Settings for Cortex-A34
+#
+DEFAULTTUNE ?= "cortexa34"
+
+TUNEVALID[cortexa34] = "Enable Cortex-A34 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa34', ' -mcpu=cortex-a34', '', d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Little Endian base configs
+AVAILTUNES                                += "cortexa34 cortexa34-crypto"
+ARMPKGARCH_tune-cortexa34                  = "cortexa34"
+ARMPKGARCH_tune-cortexa34-crypto           = "cortexa34"
+TUNE_FEATURES_tune-cortexa34               = "${TUNE_FEATURES_tune-armv8a-crc} cortexa34"
+TUNE_FEATURES_tune-cortexa34-crypto        = "${TUNE_FEATURES_tune-cortexa34} crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa34         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa34"
+PACKAGE_EXTRA_ARCHS_tune-cortexa34-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa34 cortexa34-crypto"
+BASE_LIB_tune-cortexa34                    = "lib64"
+BASE_LIB_tune-cortexa34-crypto             = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa35.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa35.inc
new file mode 100644
index 0000000..cb3ad4c
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa35.inc
@@ -0,0 +1,17 @@
+DEFAULTTUNE ?= "cortexa35"
+
+TUNEVALID[cortexa35] = "Enable Cortex-A35 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa35', ' -mcpu=cortex-a35', '', d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Little Endian base configs
+AVAILTUNES += "cortexa35 cortexa35-crypto"
+ARMPKGARCH_tune-cortexa35             = "cortexa35"
+ARMPKGARCH_tune-cortexa35-crypto      = "cortexa35"
+TUNE_FEATURES_tune-cortexa35          = "${TUNE_FEATURES_tune-armv8a-crc} cortexa35"
+TUNE_FEATURES_tune-cortexa35-crypto   = "${TUNE_FEATURES_tune-cortexa35} crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa35             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa35"
+PACKAGE_EXTRA_ARCHS_tune-cortexa35-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa35 cortexa35-crypto"
+BASE_LIB_tune-cortexa35               = "lib64"
+BASE_LIB_tune-cortexa35-crypto        = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa5.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa5.inc
new file mode 100644
index 0000000..923b758
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa5.inc
@@ -0,0 +1,51 @@
+DEFAULTTUNE ?= "armv7athf-neon"
+
+require conf/machine/include/arm/arch-armv7a.inc
+
+TUNEVALID[cortexa5] = "Enable Cortex-A5 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa5', ' -mcpu=cortex-a5', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa5', 'armv7a:', '', d)}"
+
+# Little Endian base configs
+AVAILTUNES += "cortexa5 cortexa5t cortexa5-neon cortexa5t-neon cortexa5-neon-vfpv4 cortexa5t-neon-vfpv4"
+ARMPKGARCH_tune-cortexa5             = "cortexa5"
+ARMPKGARCH_tune-cortexa5t            = "cortexa5"
+ARMPKGARCH_tune-cortexa5-neon        = "cortexa5"
+ARMPKGARCH_tune-cortexa5t-neon       = "cortexa5"
+ARMPKGARCH_tune-cortexa5-neon-vfpv4  = "cortexa5"
+ARMPKGARCH_tune-cortexa5t-neon-vfpv4 = "cortexa5"
+# mcpu is used so don't use armv7a as we don't want march
+TUNE_FEATURES_tune-cortexa5             = "arm vfp cortexa5"
+TUNE_FEATURES_tune-cortexa5t            = "${TUNE_FEATURES_tune-cortexa5} thumb"
+TUNE_FEATURES_tune-cortexa5-neon        = "${TUNE_FEATURES_tune-cortexa5} neon"
+TUNE_FEATURES_tune-cortexa5t-neon       = "${TUNE_FEATURES_tune-cortexa5-neon} thumb"
+TUNE_FEATURES_tune-cortexa5-neon-vfpv4  = "${TUNE_FEATURES_tune-cortexa5-neon} vfpv4"
+TUNE_FEATURES_tune-cortexa5t-neon-vfpv4 = "${TUNE_FEATURES_tune-cortexa5-neon-vfpv4} thumb"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa5-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa5-vfp cortexa5t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa5-vfp cortexa5-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa5-vfp cortexa5-neon cortexa5t2-vfp cortexa5t2-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon-vfpv4} cortexa5-vfp cortexa5-neon cortexa5-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon-vfpv4} cortexa5-vfp cortexa5-neon cortexa5-neon-vfpv4 cortexa5t2-vfp cortexa5t2-neon cortexa5t2-neon-vfpv4"
+
+# HF Tunes
+AVAILTUNES += "cortexa5hf cortexa5thf cortexa5hf-neon cortexa5thf-neon cortexa5hf-neon-vfpv4 cortexa5thf-neon-vfpv4"
+ARMPKGARCH_tune-cortexa5hf             = "cortexa5"
+ARMPKGARCH_tune-cortexa5thf            = "cortexa5"
+ARMPKGARCH_tune-cortexa5hf-neon        = "cortexa5"
+ARMPKGARCH_tune-cortexa5thf-neon       = "cortexa5"
+ARMPKGARCH_tune-cortexa5hf-neon-vfpv4  = "cortexa5"
+ARMPKGARCH_tune-cortexa5thf-neon-vfpv4 = "cortexa5"
+# mcpu is used so don't use armv7a as we don't want march
+TUNE_FEATURES_tune-cortexa5hf             = "${TUNE_FEATURES_tune-cortexa5} callconvention-hard"
+TUNE_FEATURES_tune-cortexa5thf            = "${TUNE_FEATURES_tune-cortexa5t} callconvention-hard"
+TUNE_FEATURES_tune-cortexa5hf-neon        = "${TUNE_FEATURES_tune-cortexa5-neon} callconvention-hard"
+TUNE_FEATURES_tune-cortexa5thf-neon       = "${TUNE_FEATURES_tune-cortexa5t-neon} callconvention-hard"
+TUNE_FEATURES_tune-cortexa5hf-neon-vfpv4  = "${TUNE_FEATURES_tune-cortexa5-neon-vfpv4} callconvention-hard"
+TUNE_FEATURES_tune-cortexa5thf-neon-vfpv4 = "${TUNE_FEATURES_tune-cortexa5t-neon-vfpv4} callconvention-hard"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa5hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa5hf-vfp cortexa5t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa5hf-vfp cortexa5hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa5hf-vfp cortexa5hf-neon cortexa5t2hf-vfp cortexa5t2hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4} cortexa5hf-vfp cortexa5hf-neon cortexa5hf-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4} cortexa5hf-vfp cortexa5hf-neon cortexa5hf-neon-vfpv4 cortexa5t2hf-vfp cortexa5t2hf-neon cortexa5t2hf-neon-vfpv4"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa53.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa53.inc
new file mode 100644
index 0000000..7f8863a
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa53.inc
@@ -0,0 +1,17 @@
+DEFAULTTUNE ?= "cortexa53"
+
+TUNEVALID[cortexa53] = "Enable Cortex-A53 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa53', ' -mcpu=cortex-a53', '', d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Little Endian base configs
+AVAILTUNES += "cortexa53 cortexa53-crypto"
+ARMPKGARCH_tune-cortexa53             = "cortexa53"
+ARMPKGARCH_tune-cortexa53-crypto      = "cortexa53-crypto"
+TUNE_FEATURES_tune-cortexa53          = "${TUNE_FEATURES_tune-armv8a-crc} cortexa53"
+TUNE_FEATURES_tune-cortexa53-crypto   = "${TUNE_FEATURES_tune-cortexa53} crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa53             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa53"
+PACKAGE_EXTRA_ARCHS_tune-cortexa53-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa53 cortexa53-crypto"
+BASE_LIB_tune-cortexa53               = "lib64"
+BASE_LIB_tune-cortexa53-crypto        = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa55.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa55.inc
new file mode 100644
index 0000000..e962973
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa55.inc
@@ -0,0 +1,13 @@
+DEFAULTTUNE ?= "cortexa55"
+
+TUNEVALID[cortexa55] = "Enable Cortex-A55 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa55', ' -mcpu=cortex-a55', '', d)}"
+
+require conf/machine/include/arm/arch-armv8-2a.inc
+
+# Little Endian base configs
+AVAILTUNES += "cortexa55"
+ARMPKGARCH_tune-cortexa55             = "cortexa55"
+TUNE_FEATURES_tune-cortexa55          = "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa55"
+PACKAGE_EXTRA_ARCHS_tune-cortexa55    = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa55"
+BASE_LIB_tune-cortexa55               = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa57-cortexa53.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa57-cortexa53.inc
new file mode 100644
index 0000000..d329d61
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa57-cortexa53.inc
@@ -0,0 +1,14 @@
+DEFAULTTUNE ?= "cortexa57-cortexa53"
+
+TUNEVALID[cortexa57-cortexa53] = "Enable big.LITTLE Cortex-A57.Cortex-A53 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa57-cortexa53", " -mcpu=cortex-a57.cortex-a53", "", d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa57-cortexa53", "cortexa57-cortexa53:", "", d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Little Endian base configs
+AVAILTUNES += "cortexa57-cortexa53"
+ARMPKGARCH_tune-cortexa57-cortexa53 = "cortexa57-cortexa53"
+TUNE_FEATURES_tune-cortexa57-cortexa53 = "${TUNE_FEATURES_tune-armv8a-crc} cortexa57-cortexa53"
+PACKAGE_EXTRA_ARCHS_tune-cortexa57-cortexa53 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa57-cortexa53"
+BASE_LIB_tune-cortexa57-cortexa53 = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa57.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa57.inc
new file mode 100644
index 0000000..91fa668
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa57.inc
@@ -0,0 +1,17 @@
+DEFAULTTUNE ?= "cortexa57"
+
+TUNEVALID[cortexa57] = "Enable Cortex-A57 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa57', ' -mcpu=cortex-a57', '', d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Little Endian base configs
+AVAILTUNES += "cortexa57 cortexa57-crypto"
+ARMPKGARCH_tune-cortexa57             = "cortexa57"
+ARMPKGARCH_tune-cortexa57-crypto      = "cortexa57-crypto"
+TUNE_FEATURES_tune-cortexa57          = "${TUNE_FEATURES_tune-armv8a-crc} cortexa57"
+TUNE_FEATURES_tune-cortexa57-crypto   = "${TUNE_FEATURES_tune-cortexa57} crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa57             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa57"
+PACKAGE_EXTRA_ARCHS_tune-cortexa57-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa57 cortexa57-crypto"
+BASE_LIB_tune-cortexa57               = "lib64"
+BASE_LIB_tune-cortexa57-crypto        = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa65.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa65.inc
new file mode 100644
index 0000000..ecf17fb
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa65.inc
@@ -0,0 +1,16 @@
+#
+# Tune Settings for Cortex-A65
+#
+DEFAULTTUNE ?= "cortexa65"
+
+TUNEVALID[cortexa65] = "Enable Cortex-A65 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa65', ' -mcpu=cortex-a65', '', d)}"
+
+require conf/machine/include/arm/arch-armv8-2a.inc
+
+# Little Endian base configs
+AVAILTUNES                                         += "cortexa65"
+ARMPKGARCH_tune-cortexa65                           = "cortexa65"
+TUNE_FEATURES_tune-cortexa65                        = "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa55"
+PACKAGE_EXTRA_ARCHS_tune-cortexa65                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa65"
+BASE_LIB_tune-cortexa65                             = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa65ae.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa65ae.inc
new file mode 100644
index 0000000..aea47d0
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa65ae.inc
@@ -0,0 +1,16 @@
+#
+# Tune Settings for Cortex-A65AE
+#
+DEFAULTTUNE                                        ?= "cortexa65ae"
+
+TUNEVALID[cortexa65ae] = "Enable Cortex-A65AE specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa65ae', ' -mcpu=cortex-a65ae', '', d)}"
+
+require conf/machine/include/arm/arch-armv8-2a.inc
+
+# Little Endian base configs
+AVAILTUNES                                         += "cortexa65ae"
+ARMPKGARCH_tune-cortexa65ae                         = "cortexa65ae"
+TUNE_FEATURES_tune-cortexa65ae                      = "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa65ae"
+PACKAGE_EXTRA_ARCHS_tune-cortexa65ae                = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa65ae"
+BASE_LIB_tune-cortexa65ae                           = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa7.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa7.inc
new file mode 100644
index 0000000..05081dc
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa7.inc
@@ -0,0 +1,51 @@
+DEFAULTTUNE ?= "armv7vethf-neon"
+
+require conf/machine/include/arm/arch-armv7ve.inc
+
+TUNEVALID[cortexa7] = "Enable Cortex-A7 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', ' -mcpu=cortex-a7', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', 'armv7ve:', '', d)}"
+
+# Little Endian base configs
+AVAILTUNES += "cortexa7 cortexa7t cortexa7-neon cortexa7t-neon cortexa7-neon-vfpv4 cortexa7t-neon-vfpv4"
+ARMPKGARCH_tune-cortexa7             = "cortexa7"
+ARMPKGARCH_tune-cortexa7t            = "cortexa7"
+ARMPKGARCH_tune-cortexa7-neon        = "cortexa7"
+ARMPKGARCH_tune-cortexa7t-neon       = "cortexa7"
+ARMPKGARCH_tune-cortexa7-neon-vfpv4  = "cortexa7"
+ARMPKGARCH_tune-cortexa7t-neon-vfpv4 = "cortexa7"
+# mcpu is used so don't use armv7ve as we don't want march
+TUNE_FEATURES_tune-cortexa7             = "arm vfp cortexa7"
+TUNE_FEATURES_tune-cortexa7t            = "${TUNE_FEATURES_tune-cortexa7} thumb"
+TUNE_FEATURES_tune-cortexa7-neon        = "${TUNE_FEATURES_tune-cortexa7} neon"
+TUNE_FEATURES_tune-cortexa7t-neon       = "${TUNE_FEATURES_tune-cortexa7-neon} thumb"
+TUNE_FEATURES_tune-cortexa7-neon-vfpv4  = "${TUNE_FEATURES_tune-cortexa7-neon} vfpv4"
+TUNE_FEATURES_tune-cortexa7t-neon-vfpv4 = "${TUNE_FEATURES_tune-cortexa7-neon-vfpv4} thumb"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve} cortexa7-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} cortexa7-vfp cortexa7t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon} cortexa7-vfp cortexa7-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon} cortexa7-vfp cortexa7-neon cortexa7t2-vfp cortexa7t2-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4} cortexa7-vfp cortexa7-neon cortexa7-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon-vfpv4} cortexa7-vfp cortexa7-neon cortexa7-neon-vfpv4 cortexa7t2-vfp cortexa7t2-neon cortexa7t2-neon-vfpv4"
+
+# HF Tunes
+AVAILTUNES += "cortexa7hf cortexa7thf cortexa7hf-neon cortexa7thf-neon cortexa7hf-neon-vfpv4 cortexa7thf-neon-vfpv4"
+ARMPKGARCH_tune-cortexa7hf             = "cortexa7"
+ARMPKGARCH_tune-cortexa7thf            = "cortexa7"
+ARMPKGARCH_tune-cortexa7hf-neon        = "cortexa7"
+ARMPKGARCH_tune-cortexa7thf-neon       = "cortexa7"
+ARMPKGARCH_tune-cortexa7hf-neon-vfpv4  = "cortexa7"
+ARMPKGARCH_tune-cortexa7thf-neon-vfpv4 = "cortexa7"
+# mcpu is used so don't use armv7ve as we don't want march
+TUNE_FEATURES_tune-cortexa7hf             = "${TUNE_FEATURES_tune-cortexa7} callconvention-hard"
+TUNE_FEATURES_tune-cortexa7thf            = "${TUNE_FEATURES_tune-cortexa7t} callconvention-hard"
+TUNE_FEATURES_tune-cortexa7hf-neon        = "${TUNE_FEATURES_tune-cortexa7-neon} callconvention-hard"
+TUNE_FEATURES_tune-cortexa7thf-neon       = "${TUNE_FEATURES_tune-cortexa7t-neon} callconvention-hard"
+TUNE_FEATURES_tune-cortexa7hf-neon-vfpv4  = "${TUNE_FEATURES_tune-cortexa7-neon-vfpv4} callconvention-hard"
+TUNE_FEATURES_tune-cortexa7thf-neon-vfpv4 = "${TUNE_FEATURES_tune-cortexa7t-neon-vfpv4} callconvention-hard"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf} cortexa7hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} cortexa7hf-vfp cortexa7t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon} cortexa7hf-vfp cortexa7hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon} cortexa7hf-vfp cortexa7hf-neon cortexa7t2hf-vfp cortexa7t2hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4} cortexa7hf-vfp cortexa7hf-neon cortexa7hf-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon-vfpv4} cortexa7hf-vfp cortexa7hf-neon cortexa7hf-neon-vfpv4 cortexa7t2hf-vfp cortexa7t2hf-neon cortexa7t2hf-neon-vfpv4"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa72-cortexa53.inc
new file mode 100644
index 0000000..98e8eba
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa72-cortexa53.inc
@@ -0,0 +1,19 @@
+DEFAULTTUNE ?= "cortexa72-cortexa53"
+
+TUNEVALID[cortexa72-cortexa53] = "Enable big.LITTLE Cortex-A72.Cortex-A53 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", " -mcpu=cortex-a72.cortex-a53", "", d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", "cortexa72-cortexa53:", "", d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# cortexa72.cortexa53 implies crc support
+AVAILTUNES += "cortexa72-cortexa53 cortexa72-cortexa53-crypto"
+ARMPKGARCH_tune-cortexa72-cortexa53                  = "cortexa72-cortexa53"
+ARMPKGARCH_tune-cortexa72-cortexa53-crypto           = "cortexa72-cortexa53-crypto"
+TUNE_FEATURES_tune-cortexa72-cortexa53               = "${TUNE_FEATURES_tune-armv8a-crc} cortexa72-cortexa53"
+TUNE_FEATURES_tune-cortexa72-cortexa53-crypto        = "${TUNE_FEATURES_tune-cortexa72-cortexa53} crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa72-cortexa53"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72-cortexa53 cortexa72-cortexa53-crypto"
+BASE_LIB_tune-cortexa72-cortexa53                    = "lib64"
+BASE_LIB_tune-cortexa72-cortexa53-crypto             = "lib64"
+
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa72.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa72.inc
new file mode 100644
index 0000000..b3f68ab
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa72.inc
@@ -0,0 +1,13 @@
+DEFAULTTUNE ?= "cortexa72"
+
+TUNEVALID[cortexa72] = "Enable Cortex-A72 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa72', ' -mcpu=cortex-a72', '', d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Little Endian base configs
+AVAILTUNES += "cortexa72"
+ARMPKGARCH_tune-cortexa72             = "cortexa72"
+TUNE_FEATURES_tune-cortexa72          = "${TUNE_FEATURES_tune-armv8a-crc-crypto} cortexa72"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72"
+BASE_LIB_tune-cortexa72               = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc
index 9e0786c..927296c 100644
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc
@@ -1,20 +1,21 @@
+#
+# Tune Settings for big.LITTLE Cortex-A73 - Cortex-A35
+#
 DEFAULTTUNE ?= "cortexa73-cortexa35"
 
 TUNEVALID[cortexa73-cortexa35] = "Enable big.LITTLE Cortex-A73.Cortex-A35 specific processor optimizations"
-TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
-MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", "cortexa73-cortexa35:", "" ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", "cortexa73-cortexa35:", "", d)}"
 TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", " -mcpu=cortex-a73.cortex-a35", "", d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
 
 # cortexa73.cortexa35 implies crc support
-AVAILTUNES += "cortexa73-cortexa35 cortexa73-cortexa35-crypto"
+AVAILTUNES                                          += "cortexa73-cortexa35 cortexa73-cortexa35-crypto"
 ARMPKGARCH_tune-cortexa73-cortexa35                  = "cortexa73-cortexa35"
 ARMPKGARCH_tune-cortexa73-cortexa35-crypto           = "cortexa73-cortexa35-crypto"
-TUNE_FEATURES_tune-cortexa73-cortexa35               = "aarch64 crc cortexa73-cortexa35"
-TUNE_FEATURES_tune-cortexa73-cortexa35-crypto        = "aarch64 crc crypto cortexa73-cortexa35"
-PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa35         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa73-cortexa35"
+TUNE_FEATURES_tune-cortexa73-cortexa35               = "${TUNE_FEATURES_tune-armv8a-crc} cortexa73-cortexa35"
+TUNE_FEATURES_tune-cortexa73-cortexa35-crypto        = "${TUNE_FEATURES_tune-cortexa73-cortexa35} crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa35         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa73-cortexa35"
 PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa35-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa35 cortexa73-cortexa35-crypto"
 BASE_LIB_tune-cortexa73-cortexa35                    = "lib64"
 BASE_LIB_tune-cortexa73-cortexa35-crypto             = "lib64"
-
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa53.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa53.inc
new file mode 100644
index 0000000..3750f07
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa53.inc
@@ -0,0 +1,19 @@
+DEFAULTTUNE ?= "cortexa73-cortexa53"
+
+TUNEVALID[cortexa73-cortexa53] = "Enable big.LITTLE Cortex-A73.Cortex-A53 specific processor optimizations"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa53", "cortexa73-cortexa53:", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa53", " -mcpu=cortex-a73.cortex-a53", "", d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# cortexa73.cortexa53 implies crc support
+AVAILTUNES += "cortexa73-cortexa53 cortexa73-cortexa53-crypto"
+ARMPKGARCH_tune-cortexa73-cortexa53                  = "cortexa73-cortexa53"
+ARMPKGARCH_tune-cortexa73-cortexa53-crypto           = "cortexa73-cortexa53-crypto"
+TUNE_FEATURES_tune-cortexa73-cortexa53               = "${TUNE_FEATURES_tune-armv8a-crc} cortexa73-cortexa53"
+TUNE_FEATURES_tune-cortexa73-cortexa53-crypto        = "${TUNE_FEATURES_tune-cortexa73-cortexa53} crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa73-cortexa53"
+PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa53 cortexa73-cortexa53-crypto"
+BASE_LIB_tune-cortexa73-cortexa53                    = "lib64"
+BASE_LIB_tune-cortexa73-cortexa53-crypto             = "lib64"
+
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa73.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa73.inc
new file mode 100644
index 0000000..ed2deb9
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa73.inc
@@ -0,0 +1,16 @@
+#
+# Tune Settings for Cortex-A73
+#
+DEFAULTTUNE ?= "cortexa73"
+
+TUNEVALID[cortexa73] = "Enable Cortex-A73 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa73', ' -mcpu=cortex-a73', '', d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Little Endian base configs
+AVAILTUNES                                += "cortexa73"
+ARMPKGARCH_tune-cortexa73                  = "cortexa73"
+TUNE_FEATURES_tune-cortexa73               = "${TUNE_FEATURES_tune-armv8a-crc-crypto} cortexa73"
+PACKAGE_EXTRA_ARCHS_tune-cortexa73         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73"
+BASE_LIB_tune-cortexa73                    = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
index af4bfbe..9c45fe9 100644
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
@@ -1,20 +1,20 @@
-DEFAULTTUNE ?= "cortexa75-cortexa55"
+#
+# Tune Settings for big.LITTLE Cortex-A75 - Cortex-A55
+#
+DEFAULTTUNE                                        ?= "cortexa75-cortexa55"
 
 TUNEVALID[cortexa75-cortexa55] = "Enable big.LITTLE Cortex-A75.Cortex-A55 specific processor optimizations"
-TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
-MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-cortexa55", "cortexa75-cortexa55:", "" ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-cortexa55", "cortexa75-cortexa55:", "", d)}"
 TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-cortexa55", " -mcpu=cortex-a75.cortex-a55", "", d)}"
 
 require conf/machine/include/arm/arch-armv8-2a.inc
 
-# cortexa75.cortexa55 implies crc support
-AVAILTUNES += "cortexa75-cortexa55 cortexa75-cortexa55-crypto"
-ARMPKGARCH_tune-cortexa75-cortexa55                  = "cortexa75-cortexa55"
-ARMPKGARCH_tune-cortexa75-cortexa55-crypto           = "cortexa75-cortexa55-crypto"
-TUNE_FEATURES_tune-cortexa75-cortexa55               = "aarch64 crc cortexa75-cortexa55"
-TUNE_FEATURES_tune-cortexa75-cortexa55-crypto        = "aarch64 crc crypto cortexa75-cortexa55"
-PACKAGE_EXTRA_ARCHS_tune-cortexa75-cortexa55         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa75-cortexa55"
-PACKAGE_EXTRA_ARCHS_tune-cortexa75-cortexa55-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa75-cortexa55 cortexa75-cortexa55-crypto"
-BASE_LIB_tune-cortexa75-cortexa55                    = "lib64"
-BASE_LIB_tune-cortexa75-cortexa55-crypto             = "lib64"
-
+AVAILTUNES                                         += "cortexa75-cortexa55 cortexa75-cortexa55-crypto"
+ARMPKGARCH_tune-cortexa75-cortexa55                 = "cortexa75-cortexa55"
+ARMPKGARCH_tune-cortexa75-cortexa55-crypto          = "cortexa75-cortexa55-crypto"
+TUNE_FEATURES_tune-cortexa75-cortexa55              = "${TUNE_FEATURES_tune-armv8-2a} cortexa75-cortexa55"
+TUNE_FEATURES_tune-cortexa75-cortexa55-crypto       = "${TUNE_FEATURES_tune-cortexa75-cortexa55} crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa75-cortexa55        = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a} cortexa75-cortexa55"
+PACKAGE_EXTRA_ARCHS_tune-cortexa75-cortexa55-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa75-cortexa55 cortexa75-cortexa55-crypto"
+BASE_LIB_tune-cortexa75-cortexa55                   = "lib64"
+BASE_LIB_tune-cortexa75-cortexa55-crypto            = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
index 58a3019..d019450 100644
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
@@ -1,3 +1,6 @@
+#
+# Tune Settings for Cortex-A75
+#
 DEFAULTTUNE ?= "cortexa75"
 
 TUNEVALID[cortexa75] = "Enable Cortex-A75 specific processor optimizations"
@@ -6,8 +9,8 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa75', ' -mcpu=corte
 require conf/machine/include/arm/arch-armv8-2a.inc
 
 # Little Endian base configs
-AVAILTUNES += "cortexa75"
-ARMPKGARCH_tune-cortexa75             = "cortexa75"
-TUNE_FEATURES_tune-cortexa75          = "aarch64 cortexa75 crc crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa75    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa75"
-BASE_LIB_tune-cortexa75               = "lib64"
+AVAILTUNES                                         += "cortexa75"
+ARMPKGARCH_tune-cortexa75                           = "cortexa75"
+TUNE_FEATURES_tune-cortexa75                        = "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa75"
+PACKAGE_EXTRA_ARCHS_tune-cortexa75                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa75"
+BASE_LIB_tune-cortexa75                             = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
index 7c27d21..cae8ffe 100644
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
@@ -1,20 +1,20 @@
-DEFAULTTUNE ?= "cortexa76-cortexa55"
+#
+# Tune Settings for big.LITTLE Cortex-A76 - Cortex-A55
+#
+DEFAULTTUNE                                        ?= "cortexa76-cortexa55"
 
 TUNEVALID[cortexa76-cortexa55] = "Enable big.LITTLE Cortex-A76.Cortex-A55 specific processor optimizations"
-TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
-MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-cortexa55", "cortexa76-cortexa55:", "" ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-cortexa55", "cortexa76-cortexa55:", "", d)}"
 TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-cortexa55", " -mcpu=cortex-a76.cortex-a55", "", d)}"
 
 require conf/machine/include/arm/arch-armv8-2a.inc
 
-# cortexa76.cortexa55 implies crc support
-AVAILTUNES += "cortexa76-cortexa55 cortexa76-cortexa55-crypto"
-ARMPKGARCH_tune-cortexa76-cortexa55                  = "cortexa76-cortexa55"
-ARMPKGARCH_tune-cortexa76-cortexa55-crypto           = "cortexa76-cortexa55-crypto"
-TUNE_FEATURES_tune-cortexa76-cortexa55               = "aarch64 crc cortexa76-cortexa55"
-TUNE_FEATURES_tune-cortexa76-cortexa55-crypto        = "aarch64 crc crypto cortexa76-cortexa55"
-PACKAGE_EXTRA_ARCHS_tune-cortexa76-cortexa55         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa76-cortexa55"
-PACKAGE_EXTRA_ARCHS_tune-cortexa76-cortexa55-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa76-cortexa55 cortexa76-cortexa55-crypto"
-BASE_LIB_tune-cortexa76-cortexa55                    = "lib64"
-BASE_LIB_tune-cortexa76-cortexa55-crypto             = "lib64"
-
+AVAILTUNES                                         += "cortexa76-cortexa55 cortexa76-cortexa55-crypto"
+ARMPKGARCH_tune-cortexa76-cortexa55                 = "cortexa76-cortexa55"
+ARMPKGARCH_tune-cortexa76-cortexa55-crypto          = "cortexa76-cortexa55-crypto"
+TUNE_FEATURES_tune-cortexa76-cortexa55              = "${TUNE_FEATURES_tune-armv8-2a} cortexa76-cortexa55"
+TUNE_FEATURES_tune-cortexa76-cortexa55-crypto       = "${TUNE_FEATURES_tune-cortexa76-cortexa55} crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa76-cortexa55        = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a} cortexa76-cortexa55"
+PACKAGE_EXTRA_ARCHS_tune-cortexa76-cortexa55-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa76-cortexa55 cortexa76-cortexa55-crypto"
+BASE_LIB_tune-cortexa76-cortexa55                   = "lib64"
+BASE_LIB_tune-cortexa76-cortexa55-crypto            = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
index 70f9770..ae3661a 100644
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
@@ -1,4 +1,7 @@
-DEFAULTTUNE ?= "cortexa76"
+#
+# Tune Settings for Cortex-A76
+#
+DEFAULTTUNE                                        ?= "cortexa76"
 
 TUNEVALID[cortexa76] = "Enable Cortex-A76 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa76', ' -mcpu=cortex-a76', '', d)}"
@@ -6,8 +9,8 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa76', ' -mcpu=corte
 require conf/machine/include/arm/arch-armv8-2a.inc
 
 # Little Endian base configs
-AVAILTUNES += "cortexa76"
-ARMPKGARCH_tune-cortexa76             = "cortexa76"
-TUNE_FEATURES_tune-cortexa76          = "aarch64 cortexa76 crc crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa76    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa76"
-BASE_LIB_tune-cortexa76               = "lib64"
+AVAILTUNES                                         += "cortexa76"
+ARMPKGARCH_tune-cortexa76                           = "cortexa76"
+TUNE_FEATURES_tune-cortexa76                        = "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa76"
+PACKAGE_EXTRA_ARCHS_tune-cortexa76                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa76"
+BASE_LIB_tune-cortexa76                             = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa76ae.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa76ae.inc
new file mode 100644
index 0000000..d368aa1
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa76ae.inc
@@ -0,0 +1,16 @@
+#
+# Tune Settings for Cortex-A76AE
+#
+DEFAULTTUNE                                        ?= "cortexa76ae"
+
+TUNEVALID[cortexa76ae] = "Enable Cortex-A76AE specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa76ae', ' -mcpu=cortex-a76ae', '', d)}"
+
+require conf/machine/include/arm/arch-armv8-2a.inc
+
+# Little Endian base configs
+AVAILTUNES                                         += "cortexa76ae"
+ARMPKGARCH_tune-cortexa76ae                         = "cortexa76ae"
+TUNE_FEATURES_tune-cortexa65ae                      = "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa76ae"
+PACKAGE_EXTRA_ARCHS_tune-cortexa76ae                = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa76ae"
+BASE_LIB_tune-cortexa76ae                           = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
index 672c8d5..048fa31 100644
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
@@ -1,4 +1,7 @@
-DEFAULTTUNE ?= "cortexa77"
+#
+# Tune Settings for Cortex-A77
+#
+DEFAULTTUNE                                        ?= "cortexa77"
 
 TUNEVALID[cortexa77] = "Enable Cortex-A77 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa77', ' -mcpu=cortex-a77', '', d)}"
@@ -6,8 +9,8 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa77', ' -mcpu=corte
 require conf/machine/include/arm/arch-armv8-2a.inc
 
 # Little Endian base configs
-AVAILTUNES += "cortexa77"
-ARMPKGARCH_tune-cortexa77             = "cortexa77"
-TUNE_FEATURES_tune-cortexa77          = "aarch64 cortexa77 crc crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa77    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa77"
-BASE_LIB_tune-cortexa77               = "lib64"
+AVAILTUNES                                         += "cortexa77"
+ARMPKGARCH_tune-cortexa77                           = "cortexa77"
+TUNE_FEATURES_tune-cortexa77                        = "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa77"
+PACKAGE_EXTRA_ARCHS_tune-cortexa77                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa77"
+BASE_LIB_tune-cortexa77                             = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa8.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa8.inc
new file mode 100644
index 0000000..f27bfb8
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa8.inc
@@ -0,0 +1,39 @@
+DEFAULTTUNE ?= "armv7athf-neon"
+
+require conf/machine/include/arm/arch-armv7a.inc
+
+TUNEVALID[cortexa8] = "Enable Cortex-A8 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa8', ' -mcpu=cortex-a8', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa8', 'armv7a:', '', d)}"
+
+# Little Endian base configs
+AVAILTUNES += "cortexa8 cortexa8t cortexa8-neon cortexa8t-neon"
+ARMPKGARCH_tune-cortexa8             = "cortexa8"
+ARMPKGARCH_tune-cortexa8t            = "cortexa8"
+ARMPKGARCH_tune-cortexa8-neon        = "cortexa8"
+ARMPKGARCH_tune-cortexa8t-neon       = "cortexa8"
+# mcpu is used so don't use armv7a as we don't want march
+TUNE_FEATURES_tune-cortexa8             = "arm vfp cortexa8"
+TUNE_FEATURES_tune-cortexa8t            = "${TUNE_FEATURES_tune-cortexa8} thumb"
+TUNE_FEATURES_tune-cortexa8-neon        = "${TUNE_FEATURES_tune-cortexa8} neon"
+TUNE_FEATURES_tune-cortexa8t-neon       = "${TUNE_FEATURES_tune-cortexa8-neon} thumb"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa8-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa8-vfp cortexa8t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa8-vfp cortexa8-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa8-vfp cortexa8-neon cortexa8t2-vfp cortexa8t2-neon"
+
+# HF Tunes
+AVAILTUNES += "cortexa8hf cortexa8thf cortexa8hf-neon cortexa8thf-neon"
+ARMPKGARCH_tune-cortexa8hf             = "cortexa8"
+ARMPKGARCH_tune-cortexa8thf            = "cortexa8"
+ARMPKGARCH_tune-cortexa8hf-neon        = "cortexa8"
+ARMPKGARCH_tune-cortexa8thf-neon       = "cortexa8"
+# mcpu is used so don't use armv7a as we don't want march
+TUNE_FEATURES_tune-cortexa8hf             = "${TUNE_FEATURES_tune-cortexa8} callconvention-hard"
+TUNE_FEATURES_tune-cortexa8thf            = "${TUNE_FEATURES_tune-cortexa8t} callconvention-hard"
+TUNE_FEATURES_tune-cortexa8hf-neon        = "${TUNE_FEATURES_tune-cortexa8-neon} callconvention-hard"
+TUNE_FEATURES_tune-cortexa8thf-neon       = "${TUNE_FEATURES_tune-cortexa8t-neon} callconvention-hard"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa8hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa8hf-vfp cortexa8t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa8hf-vfp cortexa8hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa8hf-vfp cortexa8hf-neon cortexa8t2hf-vfp cortexa8t2hf-neon"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa9.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa9.inc
new file mode 100644
index 0000000..0eb8f3b
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa9.inc
@@ -0,0 +1,55 @@
+DEFAULTTUNE ?= "armv7athf-neon"
+
+require conf/machine/include/arm/arch-armv7a.inc
+
+TUNEVALID[cortexa9] = "Enable Cortex-A9 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', ' -mcpu=cortex-a9', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', 'armv7a:', '', d)}"
+
+# Little Endian base configs
+AVAILTUNES += "cortexa9 cortexa9t cortexa9-neon cortexa9t-neon"
+ARMPKGARCH_tune-cortexa9             = "cortexa9"
+ARMPKGARCH_tune-cortexa9t            = "cortexa9"
+ARMPKGARCH_tune-cortexa9-neon        = "cortexa9"
+ARMPKGARCH_tune-cortexa9t-neon       = "cortexa9"
+# mcpu is used so don't use armv7a as we don't want march
+TUNE_FEATURES_tune-cortexa9             = "arm vfp cortexa9"
+TUNE_FEATURES_tune-cortexa9t            = "${TUNE_FEATURES_tune-cortexa9} thumb"
+TUNE_FEATURES_tune-cortexa9-neon        = "${TUNE_FEATURES_tune-cortexa9} neon"
+TUNE_FEATURES_tune-cortexa9t-neon       = "${TUNE_FEATURES_tune-cortexa9-neon} thumb"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa9-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa9-vfp cortexa9t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa9-vfp cortexa9-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa9-vfp cortexa9-neon cortexa9t2-vfp cortexa9t2-neon"
+
+# HF Tunes
+AVAILTUNES += "cortexa9hf cortexa9thf cortexa9hf-neon cortexa9thf-neon"
+ARMPKGARCH_tune-cortexa9hf             = "cortexa9"
+ARMPKGARCH_tune-cortexa9thf            = "cortexa9"
+ARMPKGARCH_tune-cortexa9hf-neon        = "cortexa9"
+ARMPKGARCH_tune-cortexa9thf-neon       = "cortexa9"
+# mcpu is used so don't use armv7a as we don't want march
+TUNE_FEATURES_tune-cortexa9hf             = "${TUNE_FEATURES_tune-cortexa9} callconvention-hard"
+TUNE_FEATURES_tune-cortexa9thf            = "${TUNE_FEATURES_tune-cortexa9t} callconvention-hard"
+TUNE_FEATURES_tune-cortexa9hf-neon        = "${TUNE_FEATURES_tune-cortexa9-neon} callconvention-hard"
+TUNE_FEATURES_tune-cortexa9thf-neon       = "${TUNE_FEATURES_tune-cortexa9t-neon} callconvention-hard"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa9hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa9hf-vfp cortexa9t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa9hf-vfp cortexa9hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa9hf-vfp cortexa9hf-neon cortexa9t2hf-vfp cortexa9t2hf-neon"
+
+# VFPv3 Tunes
+AVAILTUNES += "cortexa9-vfpv3 cortexa9t-vfpv3 cortexa9hf-vfpv3 cortexa9thf-vfpv3"
+ARMPKGARCH_tune-cortexa9-vfpv3          = "cortexa9"
+ARMPKGARCH_tune-cortexa9t-vfpv3         = "cortexa9"
+ARMPKGARCH_tune-cortexa9hf-vfpv3        = "cortexa9"
+ARMPKGARCH_tune-cortexa9thf-vfpv3       = "cortexa9"
+# mcpu is used so don't use armv7a as we don't want march
+TUNE_FEATURES_tune-cortexa9-vfpv3           = "${TUNE_FEATURES_tune-cortexa9} vfpv3"
+TUNE_FEATURES_tune-cortexa9t-vfpv3          = "${TUNE_FEATURES_tune-cortexa9t} vfpv3"
+TUNE_FEATURES_tune-cortexa9hf-vfpv3         = "${TUNE_FEATURES_tune-cortexa9hf} vfpv3"
+TUNE_FEATURES_tune-cortexa9thf-vfpv3        = "${TUNE_FEATURES_tune-cortexa9thf} vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9-vfpv3           = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3} cortexa9-vfp cortexa9-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9t-vfpv3          = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3} cortexa9-vfp cortexa9-vfpv3 cortexa9t2-vfp cortexa9t2-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-vfpv3         = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3} cortexa9hf-vfp cortexa9hf-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9thf-vfpv3        = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3} cortexa9hf-vfp cortexa9hf-vfpv3 cortexa9t2hf-vfp cortexa9t2hf-vfpv3"
-- 
2.17.1

