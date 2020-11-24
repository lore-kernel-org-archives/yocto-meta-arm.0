Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.48])
 by mx.groups.io with SMTP id smtpd.web12.50732.1606217829257560850
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 24 Nov 2020 03:37:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=+CWwR0+E;
 spf=pass (domain: arm.com, ip: 40.107.14.48, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhNpe2P8QYhBbMq+2HF1cLNPhAGiisFrAvkK+ZysviM=;
 b=+CWwR0+EKw8FCwFdfinGToUwtkeycZXD2q1v6A3Vxri7nukqgIeSgFcgP611Cm4qUw55ZCI+6nNWQ7jJFARjoax14WHdudu3tTCfOEsZsvWyWQn3Dx0LGz7y32NhL3EceUh0WU8PrtcqvtIAV2FTncSNAIIkwBxhB5/iSeAVosw=
Received: from AM5PR1001CA0016.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::29)
 by AS8PR08MB6213.eurprd08.prod.outlook.com (2603:10a6:20b:23d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Tue, 24 Nov
 2020 11:37:04 +0000
Received: from AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::a3) by AM5PR1001CA0016.outlook.office365.com
 (2603:10a6:206:2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Tue, 24 Nov 2020 11:37:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT059.mail.protection.outlook.com (10.152.17.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 11:37:04 +0000
Received: ("Tessian outbound d6c201accd3c:v71"); Tue, 24 Nov 2020 11:37:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a1c70b3a8fb70e7b
X-CR-MTA-TID: 64aa7808
Received: from 288887b00414.6
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F99F9719-1BEC-4DC6-BACD-44B77F8CD0F3.1;
	Tue, 24 Nov 2020 11:36:33 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 288887b00414.6
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 24 Nov 2020 11:36:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+gt6KXzeTnW60IInW2ZdjKuxKJw6TWvKyK2mUrTIz/gK1yJh23f7ui5mdHS8JVeTUx0Er67PzASjfVQqOMhEidMX2dTVVLB/egWdfx5R0JiBEi2x75ydczUu6N1VZsdzgH41J4tEbf9H92K2ElWuZZlGdl7ERj8EnrPAo8f4OE29DIK6ZSPC/64mJO6bLWGy6TYzqbqo8nhEovYB2SdXCaUc3U0CfNoaUnlqjsXZAKmgaApnwnxEEzM/rFzaRVgfq8VlrvsSogD+fCHSa/UzxzH/QjGS01/sVCyDW1NzZaOHLwuLY8L7ZXd2jS1ZnphkJ56lnFJC8IjpOFfF0EJMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhNpe2P8QYhBbMq+2HF1cLNPhAGiisFrAvkK+ZysviM=;
 b=cbxmIzP6U3SsIoH6cdkzDuH+vZGEWT/SfyqNVTU50byrRh8JdvHeQtm9UBPgrLPfBzvsteAaK0Z4d4QZGLVlPUnwPcFC/KG6NkVRbhPctN0TfCaPHuRRpFYcLUFS20HDeEvVtVQLXvbPS6CIIGNMZEi7eKs1O5DNDkUZKV0BeF/McDr0CQ98jRGwKcSWd9cGw8Nnkpve/ApkhkDTekl8xJUsG85NQ9cKrOCIJgk0+tQEwTBe0nObAsJDXcNK6Dy3Euvy7Msgmw+C0n5bkT5clkr7SGbiBliX6ggDHoLh1P7hUQ/0zURr/cO5VaUI/jBzOvj4obomOII+VmoUWRsH6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhNpe2P8QYhBbMq+2HF1cLNPhAGiisFrAvkK+ZysviM=;
 b=+CWwR0+EKw8FCwFdfinGToUwtkeycZXD2q1v6A3Vxri7nukqgIeSgFcgP611Cm4qUw55ZCI+6nNWQ7jJFARjoax14WHdudu3tTCfOEsZsvWyWQn3Dx0LGz7y32NhL3EceUh0WU8PrtcqvtIAV2FTncSNAIIkwBxhB5/iSeAVosw=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com (2603:10a6:10:49::17)
 by DB6PR0801MB1878.eurprd08.prod.outlook.com (2603:10a6:4:76::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.24; Tue, 24 Nov
 2020 11:36:32 +0000
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::f80f:8053:9756:6b21]) by DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::f80f:8053:9756:6b21%7]) with mapi id 15.20.3564.028; Tue, 24 Nov 2020
 11:36:31 +0000
From: "Abdellatif El Khlifi" <abdellatif.elkhlifi@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Lakshmi.Kailasanathan@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 2/4] arm-bsp: use forcevariable override to set Corstone-500 kernel
Date: Tue, 24 Nov 2020 11:36:19 +0000
Message-Id: <20201124113621.3663-3-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201124113621.3663-1-abdellatif.elkhlifi@arm.com>
References: <20201124113621.3663-1-abdellatif.elkhlifi@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO3P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::10) To DB7PR08MB3531.eurprd08.prod.outlook.com
 (2603:10a6:10:49::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by LO3P265CA0005.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:bb::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Tue, 24 Nov 2020 11:36:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 21d09b0c-cbb7-4b79-3a6a-08d8906d4451
X-MS-TrafficTypeDiagnostic: DB6PR0801MB1878:|AS8PR08MB6213:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AS8PR08MB62133E19C2C480338AC392F0FDFB0@AS8PR08MB6213.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 FViHay0MV1G90loSQh42yPxO3v7OwmXb8thYGilMcuuYMQ/dncHzfEl9Z77rUMRz2W8pVW2y/O1N3eyrO9Ah09tgH1D420cJVaC+B3nExthFSgglC4clhgkvwRIVjTFcL6Syw7ZW4Hf8mHMEktC7sGbAHl/6VuyHKscASYJ3fbYgRKDgr4vrTLl7JGipfYUrbOFy2INJKXJCakCo7J8rk1pfTRl9+x1j0oCnXNULB3iKi3tEZ6m4klNxaoH5t+Ieypeh6+NCWjX8vG1fMJloaPb+vk2rZdf0Y0ChsL8XThOYkyr+rVInwmZOHQWw3YEJUNv2JklEBEAGm1QeDFVDIQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3531.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(7696005)(66476007)(52116002)(9686003)(66946007)(83380400001)(8676002)(66556008)(4326008)(8936002)(2906002)(5660300002)(186003)(16526019)(316002)(86362001)(956004)(2616005)(478600001)(6666004)(1076003)(6486002)(36756003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 0R1vx4fAXew0VBRW7l6VnMOZXPbSHX7sqwcNao6LZqr+PetkIWWTBFkcXHN+4hhm8UYKTfdAJIG7X4c0RpFq9FpZ/x+R1PjbMi/834ZfrEApSWrzdWuvwU6BNxgKye8L5veobRm7aLfYI4ImUzm4K8Gw2mhsi/mhHXh+aZx3pOJrlslLUVuRZERVRKllV+AO6/U8CCtoPtn3vP+WueThlromLCS4yhoSPsZxd562kV3PGBhrTNXb1wsX78RUOV8oI/jvNnBDRYJnz4sGjrE4npU8DGgKXoyS4GOyFFinQ+ZqTvFtrrpTte9KbMylBjPri1Pamo9+pThYBNoPY2ccDtPS2zM3yIuT8XjRB5lAtKoQSH5Kk7nDl1ZBkxSq56B9DU9paQ0a/TynBNeGGP8aTsboCxLIgeCXgaPktXTS1QAGp7yBLYSbEbU/aGBWYjigSstnOfl1Rb1Sh53XW1JraZvyD5a1vkqgCQR0wG5AbXqLXyPDUoRCxFO7IHmvRzhSANh6ari8M4j4O3zij4olIuM5gPHdqVOH78IbDTzqV578+PvxHolEvZ+b6tyyDAdBVTnYEKFwuhJU5JCGnIUQfsSlRTWUzmv9mnzvmC8DhJxlVcuLRsIF2dIp9Y7DtOxJTN4+BUI2+kKA+KypdbMswankh/r3t/JHeHH83IVZlekHsFq9bXwMoOPlpod09GBTvDBXVmTmxNpqBCBBBgln33BkP3XbZ7jD9WnckcW0gKQNbaLynKFjbCw7YDqwUdCTnLYVcUpYnGQZ3JDH4TliU7+SSjMX1q/9G6yWADOmy8l1Ykf0bspcQ/fMxl3c8ZPUd27jajN6S0f1ZmTwqlR651TOlZflLFqoGLJ+gQWrlpAP7NsZV0l9o/LYaLIvQh1I6DZRgN+lhXYFEFxmaZMLZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1878
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2c148173-83f6-4845-fb0f-08d8906d30b1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kryHrngLxvIEMFluapgGxB1rCX5wG0c9ujr3VqUkaKerYSb7V/a4V09GF83QgX1nEddeHK1iBPk87LU/8cj/VZj96D/VxJdtg0rTYWFK6cHBo/DgFaVAMBSjotaYeT4rUycaSNTXneWe9zbeNI51mEutSlpiI9iVZPfygLRwWT1IkMZ+XNDrly4W3YVrAMfFkHPNETw2R1BKFM23TjRyWGwzpW+Pr33H+shc1XJ0yBdf2w0vz+e3U+NECW/XIYSJJcPQc03CsNJUj/F4mj8I7QHWZzkLAGRXf04cleVW84sNoTfX42sSld7EXwIRqpMYX5YyKigc1pMXneJTvV8eONFPGde10V3HILH8YWy/CsjsAASoDbr30evjQxJN5+HwwdqK3/h2tgpXi+QyGA0eTg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(46966005)(8676002)(478600001)(2906002)(9686003)(36756003)(86362001)(6486002)(1076003)(7696005)(5660300002)(83380400001)(70206006)(356005)(70586007)(4326008)(81166007)(186003)(82740400003)(8936002)(26005)(16526019)(316002)(6666004)(82310400003)(336012)(36906005)(2616005)(956004)(47076004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 11:37:04.4314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d09b0c-cbb7-4b79-3a6a-08d8906d4451
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6213
Content-Type: text/plain

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Corstone-500 is built against poky-tiny distro.
poky-tiny sets PREFERRED_PROVIDER_virtual/kernel to linux-yocto-tiny.
Since distro config is evaluated after the machine config, we need to
use the strongest override possible (forcevariable) so the
PREFERRED_PROVIDER_virtual/kernel specified in the machine config will
apply.

Change-Id: Iafa9209bf39cf63e83faa6eefa2a442513992290
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 meta-arm-bsp/conf/machine/corstone500.conf | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/conf/machine/corstone500.conf
index 0358f1c..ec1d9e2 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -4,7 +4,15 @@
 
 require conf/machine/include/tune-cortexa5.inc
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
+#
+# Corstone-500 is built against poky-tiny distro.
+# poky-tiny sets PREFERRED_PROVIDER_virtual/kernel to linux-yocto-tiny.
+# Since distro config is evaluated after the machine config, we need to
+# use the strongest override possible (forcevariable) so the
+# PREFERRED_PROVIDER_virtual/kernel specified in the machine config will
+# apply.
+#
+PREFERRED_PROVIDER_virtual/kernel_forcevariable = "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "5.3%"
 KBUILD_DEFCONFIG = "multi_v7_defconfig"
 KCONFIG_MODE = "--alldefconfig"
-- 
2.17.1

