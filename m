Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.58])
 by mx.groups.io with SMTP id smtpd.web10.5989.1605607616714428210
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 02:06:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=7k3oxUJA;
 spf=pass (domain: arm.com, ip: 40.107.8.58, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBpKrPZ4lLD0Op8Yc1NmGQAQgMVDvqqCnGt4heT82Rk=;
 b=7k3oxUJAIy5p1rS9leptA6OxD+OFZtQDe8RtJykOdGdrWbvgyZK0HKViwVhGn6Z/TGrdIU+TnxG838BnTKMZlORi8ra6DIWU8HJJpJwPd7JGEt4M9QyS6P1ZdIKyvboTYGV+7NfZhGJhkHJiPJ+EOi68GOL0wgtp2WWD7TReumc=
Received: from DU2PR04CA0138.eurprd04.prod.outlook.com (2603:10a6:10:231::23)
 by PR3PR08MB5676.eurprd08.prod.outlook.com (2603:10a6:102:82::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Tue, 17 Nov
 2020 10:06:54 +0000
Received: from DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::53) by DU2PR04CA0138.outlook.office365.com
 (2603:10a6:10:231::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28 via Frontend
 Transport; Tue, 17 Nov 2020 10:06:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT063.mail.protection.outlook.com (10.152.20.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Tue, 17 Nov 2020 10:06:54 +0000
Received: ("Tessian outbound e0cdfd2b0406:v71"); Tue, 17 Nov 2020 10:06:54 +0000
X-CR-MTA-TID: 64aa7808
Received: from a48cec40006a.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4937209F-33F1-45F7-A797-BC5418A638AA.1;
	Tue, 17 Nov 2020 10:06:29 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a48cec40006a.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 17 Nov 2020 10:06:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2hV0dB6Gug9rU8hTLiVY+GPxlF7c4o3lHyz1P/G2VS2HYMW8PGjC5SUqffa0xzvEu1PFWuHk0AU4NfqdUTzB1KMAb+qGVCD3oISpbeYyhsaH48O0PHBnBnhg39iwrwKCN81QKb2buYtuKPWVEBa2iwU2LWvgcmrwmvFA6uVrpcd/JOtZ+Eudbx4mDpL95iczcPFvGsbaj0Aor/Fvc4XyX+gI0vif54KkG7kS+EHr6NtYJIBU3G175si1qVR8WdyhUmchIKChg1nvEJWpa2AAL/To3PLhISnCzDb/Jt8Gwx0HGslGgIJ7FB/23fqHR1S4cRAMFNoiV0vGk+0b3O8ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBpKrPZ4lLD0Op8Yc1NmGQAQgMVDvqqCnGt4heT82Rk=;
 b=inGwAr5LCaClnMRIvuSOuNJlZFttm0mNfGTGBEair0j5RkSCMJklOpGMHDAjzdRApdeFVCZzjIuJedk96bmRhexSF0sqyaHbwa8C7AhNAWspbhcCLTXiRxa/svh7C7GIyMzFl/gZD/hXfYFd8gevdJwT0iPhGGpBy9fvF1MnYhk6ffFEnCaTplTh9cxOKA/jQTdvoCcTXg/muyEXLVAOxdZoScrs4SIhLOn3KqsfGX71BqyT4gckN9RUAUcSJsZa76VrtbNv8VjUZxUWRvq6qzS7nA7+xPnwuS/y80kqgdK+DMkkPsabre6TlaIU2umLQXPB0jfzDwyIHKBgbTiN1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBpKrPZ4lLD0Op8Yc1NmGQAQgMVDvqqCnGt4heT82Rk=;
 b=7k3oxUJAIy5p1rS9leptA6OxD+OFZtQDe8RtJykOdGdrWbvgyZK0HKViwVhGn6Z/TGrdIU+TnxG838BnTKMZlORi8ra6DIWU8HJJpJwPd7JGEt4M9QyS6P1ZdIKyvboTYGV+7NfZhGJhkHJiPJ+EOi68GOL0wgtp2WWD7TReumc=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3110.eurprd08.prod.outlook.com (2603:10a6:209:45::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 10:06:27 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::cdcd:fe5b:60c:2a9f]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::cdcd:fe5b:60c:2a9f%6]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 10:06:27 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 2/8] arm-autonomy/linux-linaro-arm-rt: Add preempt-rt-extras.scc KERNEL_FEATURE
Date: Tue, 17 Nov 2020 10:04:43 +0000
Message-Id: <20201117100449.20111-3-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201117100449.20111-1-diego.sueiro@arm.com>
References: <20201117100449.20111-1-diego.sueiro@arm.com>
X-Originating-IP: [217.140.106.50]
X-ClientProxiedBy: LNXP265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::33) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scm-wfh-server-dievar01.stack04.eu02.mi.arm.com (217.140.106.50) by LNXP265CA0021.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28 via Frontend Transport; Tue, 17 Nov 2020 10:06:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 50b17981-5c35-422c-b27c-08d88ae08296
X-MS-TrafficTypeDiagnostic: AM6PR08MB3110:|PR3PR08MB5676:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB56763077A26C7E73EFB33C0492E20@PR3PR08MB5676.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 IkgYEJnql2ej2VI/w3UQbuYDsLd372jTWM42I+2CBBwyTqBQ3Xj9Cfovw3mZs8Fu4l4fzZ1eOWNBS0iS4R/h5/+pVJ2T98mgKuffCadqHkJTkoEoxgZNNF0UaDgBWaXJaQxVuVnd/KcEVw7emK1mggP+ASZNA0n+Eg7VZkfnNUucUq1nrGyG2mD+Rbru3/+Lz6i676IQesdmUxTgcLatyrYCyYWXBVhjlaJrdS/inE9KJclKRwO6ondygrSkLUx+Qg9Ta0Mxxl5eUw5YB3uY0H1pxhUpGa3kmIg3jegL9Vl0Z8eRNZ55I0eLeeg7yN6hL4zt6IKFwT6c+dKRG6MaFw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(6916009)(8676002)(8936002)(7696005)(52116002)(26005)(86362001)(66556008)(66476007)(1076003)(36756003)(66946007)(2906002)(44832011)(5660300002)(6486002)(956004)(16526019)(186003)(4326008)(316002)(6666004)(478600001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 SK7NrhyESZcBseSOQkMPqCnfVvILFpCfe8NQFjtbCKW6er9r9HJjdBZGs0T4COJSbEHflb+Qs/ADgUXTgwPWw3tTKCYcSeT0eo+k3NsbnsNxiEcr+CFcxsOVU2tpYSAUD/Rcdc5CjcjmXBbjfH8TKTMRy03MjTGDdGQUTUD7yHk4cWK7hDGtDhoUeWvFcd76j290id1TfaiCDMnEJ4JCwoZA9Rzo2ALUQdcLqXa3YW0lJP2B8zHJ+U0hquEvgYQD4LZPO0JfyRgS7fbbYiu6hl3SBAGSIFO2qE7lkTJJKrZEe7coyAnekSTn9C9YK2WrPP+2VOkUEtIB/acxmoSVhOcqzGczpW4L7XYtudJGBYWxOH+Xb/BX2Au7u45AIar6vCG5MexLJrwNTYUy6897zW/Fnb/sJeZPMwnA/QAiusqSlvYAVSbHmrtMXEvWLwt7EDiNZONwU+OpJOjHsDSUgKOKUrUpblDpDgbwk5U+EakK5KgyzorFy4wNAnZCJPWUv5oEdKu0DX0TNslqTRlD+xbJjQXO7uGSKF3thfx6z7IXMlj6i3IqnlUaCmjVeBbXPCarLnSmJT9H+iyLdSRnoAeRkMmtdBD4QQScMiQ2U/fMAX3Sht5E9dHLS2/WVUjqtkHXg2StEJmmMxuqZfa8JCBnTVzVZDTxXK1+3TmzZB+7NSK2QJVwavKA3xWOGvQ6FlycmsuSTKLQz5FCc5ETkHHKKeovYOgOEEI6mtSJVmP9CIl/ZCajYdwETMu0wGEDQ0MI4wYfim2UShjgjC9A/AhS5UGUlcTZjb3eUPoRXlxPesKfvUBtI2yMvg411NfhJdQbsSujC7TDoAvVCoWyTe5mNGiNggRX7GnhCENhgfd84nSJui9NpsOUyUsqqSH26q3FDKpq1Xqze8hUPBxZ4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3110
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f96f3959-9acc-4aba-f628-08d88ae0729f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BXWMQV6f9x3wXV535oxLghe7BDpi1qc8MeeKmiGiBAWlSucxUmv9FWtsfexPPiZUptQ2ye6WDYbFJgmF7/OfKqU4U0GKTpsMPL6lbHbHvP0cT7ANbIxhM5j/7/9WqEqLzXa2z9xivgN2/TbZh91AWr1SSKicETicpS3XxzQaMTkAIxHKrV4dk7f34SQ2N8GpTlJVyu7vhLWi6cyqq1vZsy9cyoIjiyxBkvuo62T+A4dabMGSdgwpaOFxcE9LSxRbfmF4Em3k5pCMJ9VogJTQ/5JjtXYEVru0cVvq8EWrHHcZTQSi71VYFlK3OfHqHK7VRuo1pFnrdOa3UyX06rgkXxJ5ZAyW1ISzp3s3VSsJGSpM5rbQA8Sp8jWJ9E2l3Ip5RSD91ItUwWXvsXGWn9fxXg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(46966005)(478600001)(6916009)(26005)(81166007)(356005)(82740400003)(36756003)(86362001)(47076004)(82310400003)(70206006)(70586007)(44832011)(316002)(5660300002)(1076003)(2616005)(6486002)(8676002)(16526019)(186003)(7696005)(8936002)(4326008)(6666004)(956004)(2906002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 10:06:54.1076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b17981-5c35-422c-b27c-08d88ae08296
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5676
Content-Type: text/plain

For now, when building the linux-linaro-arm-rt recipe we want these extra
settings:
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_ISO8859_1=y
CONFIG_HZ_1000=y

Change-Id: I23573a2b5be512b7a84c71bc50a1a63b2d95dffb
Issue-Id: SCM-1654
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../features/arm-autonomy/preempt-rt-extras.cfg            | 7 +++++++
 .../features/arm-autonomy/preempt-rt-extras.scc            | 3 +++
 .../recipes-kernel/linux/linux-linaro-arm-rt_5.4.bbappend  | 2 ++
 3 files changed, 12 insertions(+)
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/preempt-rt-extras.cfg
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/preempt-rt-extras.scc

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/preempt-rt-extras.cfg b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/preempt-rt-extras.cfg
new file mode 100644
index 0000000..bf9e14b
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/preempt-rt-extras.cfg
@@ -0,0 +1,7 @@
+# Yocto kernel-cache sets CONFIG_NLS_CODEPAGE_437=m for LINUX_KERNEL_TYPR=preempt-rt
+CONFIG_NLS_CODEPAGE_437=y
+# Yocto kernel-cache sets CONFIG_NLS_ISO8859_1=m for LINUX_KERNEL_TYPR=preempt-rt
+CONFIG_NLS_ISO8859_1=y
+
+# Set the timer interrupt run at 1000 Hz to have a fast response
+CONFIG_HZ_1000=y
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/preempt-rt-extras.scc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/preempt-rt-extras.scc
new file mode 100644
index 0000000..676291b
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/preempt-rt-extras.scc
@@ -0,0 +1,3 @@
+define KFEATURE_DESCRIPTION "Extra kernel configs when building with PREEMPT_RT"
+
+kconf non-hardware preempt-rt-extras.cfg
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-rt_5.4.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-rt_5.4.bbappend
index 1c05495..b0a1ecf 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-rt_5.4.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-rt_5.4.bbappend
@@ -3,3 +3,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
 SRC_URI_append = " \
     file://0001-xen-use-handle_fasteoi_irq-to-handle-xen-dynamic-eve.patch \
     "
+
+KERNEL_FEATURES += "features/arm-autonomy/preempt-rt-extras.scc"
-- 
2.17.1

