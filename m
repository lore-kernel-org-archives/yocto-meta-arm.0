Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.55])
 by mx.groups.io with SMTP id smtpd.web12.5939.1605607706473430185
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 02:08:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=atyChBcO;
 spf=pass (domain: arm.com, ip: 40.107.21.55, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsAtg5aGKr1IlUG7IqyiM9qLFOJryIYmFkhnu7SJNjY=;
 b=atyChBcOGmgYu3Md3vQJVSuexkF29ke22zM5AxMGTDDFXqWr/RK0nzBrXUzSvddZS5mL2S0mM7DrDvyTgdHBdWn0yGFCXyKIveuQLqLbrhXvg/k0PIVyg89fs4eRjD5QeS21E//u1j06wmBX2YtH7xWMDRIKQZoION5gBuTRKgY=
Received: from AS8PR04CA0050.eurprd04.prod.outlook.com (2603:10a6:20b:312::25)
 by HE1PR0802MB2459.eurprd08.prod.outlook.com (2603:10a6:3:e1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 10:08:23 +0000
Received: from VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::99) by AS8PR04CA0050.outlook.office365.com
 (2603:10a6:20b:312::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Tue, 17 Nov 2020 10:08:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT047.mail.protection.outlook.com (10.152.19.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Tue, 17 Nov 2020 10:08:22 +0000
Received: ("Tessian outbound 797fb8e1da56:v71"); Tue, 17 Nov 2020 10:08:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 820c6a9072ede79d
X-CR-MTA-TID: 64aa7808
Received: from 921335c83135.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8EA06A8C-6A27-4750-8A18-7716E39EBE25.1;
	Tue, 17 Nov 2020 10:08:15 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 921335c83135.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 17 Nov 2020 10:08:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WycGyNSTI3SXFLpjiA6cvSfslZVI7AVUHEPrelCK3H09f8hN403jFa+ltQrkIwGhyy/7p8vz0FMpXcehHcgIA28/0X2ymG+qtO0VlLC4MoZayPUK5QuonMrmoWQBZrQUJNiwpESvgBOdH5Rv6aRORRI4YWJIDCgpmSGXnBemqhoRRB9I07Wm2CvQZZExZuxEu6oIAbvDA5GGhk3RXEMWXs8BAMQ6Ow5Rn1+vVKvmQzrNoerLrfeDRGVfmjF0DyFCd8uv3JGWn9b/cbLLLX8An1oWCijU2RFbLwOkRT07eDOitoTSlHtQo5CNLs72aMoor4mAHklvY/0DkGJqSVEsUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsAtg5aGKr1IlUG7IqyiM9qLFOJryIYmFkhnu7SJNjY=;
 b=kQyEPUClQRh+ReOsfpFBeQV5LM/RqgPEvsM58PsDuv7fQ1Gyw+jdqzMDTqJXbt4m7qS9uJV8awq+5e4SgGtS5ioJz94FUWq0gvPabizto/SuvTKcnqakAe7dyrgXQ8pRQ+9SiePH7UR8RLvvFe2YN4xCmUjbnDcK/VO0acvsdIFGpYStsvV9xksNjxFAn/uPoaqASwk6HVKJaZzIDKu+AcBUtdVOnCx0brzCwl7DDT23PIKkUD5kEum2ekxmY5nDBODyrNhog38X54swM2BgQC+HBi/NkwgOw0gQUJ/x4uJHKfFYguyRQkYGXHijp+nxwy3JaEOzX1DIJzSnjmrpHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsAtg5aGKr1IlUG7IqyiM9qLFOJryIYmFkhnu7SJNjY=;
 b=atyChBcOGmgYu3Md3vQJVSuexkF29ke22zM5AxMGTDDFXqWr/RK0nzBrXUzSvddZS5mL2S0mM7DrDvyTgdHBdWn0yGFCXyKIveuQLqLbrhXvg/k0PIVyg89fs4eRjD5QeS21E//u1j06wmBX2YtH7xWMDRIKQZoION5gBuTRKgY=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB2998.eurprd08.prod.outlook.com (2603:10a6:209:4e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Tue, 17 Nov
 2020 10:08:14 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::cdcd:fe5b:60c:2a9f]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::cdcd:fe5b:60c:2a9f%6]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 10:08:14 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 5/8] arm-autonomy/n1sdp: Add support for building/installing alternate kernel
Date: Tue, 17 Nov 2020 10:04:46 +0000
Message-Id: <20201117100449.20111-6-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201117100449.20111-1-diego.sueiro@arm.com>
References: <20201117100449.20111-1-diego.sueiro@arm.com>
X-Originating-IP: [217.140.106.50]
X-ClientProxiedBy: LNXP265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::33) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scm-wfh-server-dievar01.stack04.eu02.mi.arm.com (217.140.106.50) by LNXP265CA0021.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28 via Frontend Transport; Tue, 17 Nov 2020 10:08:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d294fba6-552b-431a-a458-08d88ae0b784
X-MS-TrafficTypeDiagnostic: AM6PR08MB2998:|HE1PR0802MB2459:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB24596ED263EB322E6584112C92E20@HE1PR0802MB2459.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 WYlkSuTWYiu8PI0WrH5Ya2cFUJrrUl8FN9Hm9iP/GcagtBZiAmm2lTSYDMx1R62UHznOEJniONTPpU330K49u7HikoSKLx1yY7GoqBXHaebVjLXwuU4PZ8TIViZNJ0YuUB5rLumhtXmqP6YvsQvg2eZbwH0TgqI4+jZElSBQDQ/9rm0XjlUmygaQr/4fYxiZDLZ6WDuLfIRujTrxNV9h20h4qlXowNgrKubAB/3f4UYiJSOYJKOzfJ/XJ8SB9Q2Mj4ESvaEiEJsbGAqisk0JOdPPrwpzC7bHSZotBv1BFdegS54J5g0col7GlgPXyKIl3NpXHt1X4JcvNzHFuFwJug==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(66556008)(5660300002)(86362001)(66476007)(66946007)(6486002)(316002)(6916009)(44832011)(36756003)(16526019)(8676002)(8936002)(2906002)(186003)(6666004)(1076003)(956004)(2616005)(26005)(52116002)(7696005)(478600001)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 XUzP/IobO+ZpbGmyZTy4Tr7T977WoWq9Y9FyR4d87kQZt8ROL6ZhbgMxmLt1ZMPH/42ixiYAlABHnrffZNaOeOtzLeinNiSylPygAuq8VL/06eJ0z2MwrXTf0sS4oUiAvmsm6QIZP1YuIIribE66TxLY5dqNn6wSbDyWmy2FTS1Pu3oBKKN7lPeIVctgyGgJ1Bk+FwcQvpD2OKqshIuf89G0iPxcceXygF93Qs1hCCNBJGkH7FnRM5dXpzjONW/eyC6mWu2sO27Yo1N0kzdqHRVzcD2pW1gZ+ahk11gqdwnS3QN2hRkMLNyGUPWup/3v60xLekMwX8n00KlJ+d79bEIPXWXwEoqVidiPxBi7yT0fZeL9r7u7F8MUd3y9uw8WLOUK/tKmj3h1HKeig9dEApj1qCeKS5r2sFd0yjuh3bOobfKnSFqDNy44G8HrMshX24TXj52bg6tpzG1fg2JOBfTxMJU5lQdVdwqmzQAIKgspU8+nZ6ol8tFfGvn1gjStggVN5Y3TR3OsffLJKf1u9cx4tynjqfaMaeTCO24Un5tz6sx7l2U6HoW43ia/lNr85FKmg3jGFoZIhtR1n1RFsQSl/DSs8DC/M+i/UsQwS62icZqHybTpYVsJC/8fmrZbdrijdL2x/hUmvRdsXyYppw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2998
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	099d6cbd-c2b9-49d1-54e5-08d88ae0b294
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a0i7dlHoIeTLnXvm39oZFIQB+4Z+lS/6173VWOQkqvjD4oN0vsNQMANxHK/Ji95vocCVuHSC+kRrK2sba0sQ+sE58k3CPUN3xQKOBH0ouxqAZTqQqtROqKoECkBssMJm16NSG7oCAEkYr4lOO1Z8cUEz2tXnmfVArUJ7uu78bTLzbLeTVJG3CByrIc9jfUwLa+mgIYly38vCs2lvfInc5MjLlsyMoeafnArJzXKJuKHgzPQxECBitl/WXNMRC817OcGFVqRV1Scijv4aDgnrc4atvCTC1Tj/ierLZ/2ry1SzTFjNmut47eXcj3Hmvbc4v5hiYRxIBa6UOPWV9GL4jvfSdrP/ACkDElsU3tkP2VXX2eKFHwQRVNhIhovwBeLstbcHZI4DI99tO/NDo+o39w==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(46966005)(2616005)(956004)(478600001)(44832011)(82310400003)(316002)(356005)(36906005)(4326008)(5660300002)(82740400003)(47076004)(8936002)(6916009)(81166007)(6486002)(2906002)(1076003)(8676002)(70206006)(70586007)(86362001)(186003)(26005)(6666004)(16526019)(336012)(36756003)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 10:08:22.7826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d294fba6-552b-431a-a458-08d88ae0b784
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2459
Content-Type: text/plain

For N1SDP as arm-autonomy-host, when alternate-kernel DISTRO_FEATURE is present
we build the linux-linaro-arm-rt (with PREEMPT_RT support) by setting it as the
PREFERRED_PROVIDER_alternate/kernel. As required, we set the
KERNEL_PACKAGE_NAME_pn-linux-linaro-arm-rt to kernel-rt.

Also, include the alternate kernel binary as Image-preempt-rt in the boot
partition of the generated wic image by setting the IMAGE_EFI_BOOT_FILES
variable.

Change-Id: I205caf5ef8b8d6b8a37ec3f4d0981fe8736cae63
Issue-Id: SCM-1654
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../conf/machine/n1sdp-extra-settings.inc     | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
index 472dd2a..7501bf5 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
@@ -38,3 +38,25 @@ do_image_wic[depends] += "xen:do_deploy"
 IMAGE_EFI_BOOT_FILES += "xen-n1sdp.efi;xen.efi"
 IMAGE_EFI_BOOT_FILES += "${XEN_MOD_DEVICETREE_DTBS}"
 
+# When alternate-kernel DISTRO_FEATURE is present we set the linux-linaro-arm-rt
+# by default
+PREFERRED_PROVIDER_alternate/kernel ?= "\
+${@bb.utils.contains('DISTRO_FEATURES', 'alternate-kernel', \
+'linux-linaro-arm-rt', '', d)}"
+
+KERNEL_PACKAGE_NAME_alternate/kernel ?= "kernel-rt"
+# When alternate-kernel DISTRO_FEATURE is present we set the kernel-rt by
+# default
+KERNEL_PACKAGE_NAME_pn-linux-linaro-arm-rt = "\
+${@ d.getVar('KERNEL_PACKAGE_NAME_alternate/kernel') \
+if bb.utils.contains('DISTRO_FEATURES', 'alternate-kernel', True, False, d) \
+else 'kernel' }"
+
+# Relative path from DEPLOY_DIR_IMAGE of the Kernel PREEMPT_RT deployed Image
+KERNEL_RT_IMAGE ?= "kernel-rt/Image-n1sdp.bin;Image-preempt-rt"
+# Only include the Kernel PREEMPT_RT Image if we are building with
+# alternate-kernel DISTRO_FEATURE
+IMAGE_EFI_BOOT_FILES += "\
+${@ d.getVar('KERNEL_RT_IMAGE',d) or '' \
+if bb.utils.contains('DISTRO_FEATURES', 'alternate-kernel', True, False, d) and \
+d.getVar('PREFERRED_PROVIDER_alternate/kernel') else ''}"
-- 
2.17.1

