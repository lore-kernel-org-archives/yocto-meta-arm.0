Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.40])
 by mx.groups.io with SMTP id smtpd.web11.6229.1603349422001528636
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 23:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=eUhwAkQE;
 spf=pass (domain: arm.com, ip: 40.107.7.40, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tDBT3tjr9HaRUQp7js+TCz9JTMCF2xP70ZpPmuzVFQ=;
 b=eUhwAkQEiKOjl3E+OyZEOpUOuIRSToxLZEWaHXNfW07iZq4ikxRoGmTqkzrX0pVcMmXzwiWAcsMoF/aUKJu0WT5OE12FG8GP6mAdBcQTBPFBpWW0AaioBod6lOeXvscqZnneKWA0HysF7aDT2SttlC3vWFAJGnX5lMTRWYo/Ego=
Received: from AM5PR0202CA0004.eurprd02.prod.outlook.com
 (2603:10a6:203:69::14) by VI1PR08MB3101.eurprd08.prod.outlook.com
 (2603:10a6:803:45::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 22 Oct
 2020 06:50:18 +0000
Received: from VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::1) by AM5PR0202CA0004.outlook.office365.com
 (2603:10a6:203:69::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Thu, 22 Oct 2020 06:50:17 +0000
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
 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 06:50:17 +0000
Received: ("Tessian outbound e6c55a0b9ba9:v64"); Thu, 22 Oct 2020 06:50:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 67c3de25fafab3d3
X-CR-MTA-TID: 64aa7808
Received: from 353399a4101e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5B9D5C19-020C-4F39-BC60-0D7D5E9CF1F3.1;
	Thu, 22 Oct 2020 06:50:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 353399a4101e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 22 Oct 2020 06:50:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djYNwAig8TUQ29arjKhoK8C6Mr/OTIUipc5lPxkcEZmsiH1XqeaNu2YKkiXANP8XNjIYBFUQlxDt36AZQX4/Ed2gttMr83LPQh7sgMNq6BayFWeiFqoiaoRsjT2UxD/IU42zhX4hxTUStHLUcv3Iq4tTXgCzJYT9vT6GVcW6rcEdYayZcrZ03LuBZvwIc8re1GiDOcH7z0hOhsE5pTuKkH5P2ota9MFCO+73I+vOk6ewVCuAKyj0puSKd9v1fuHfy45VITiUOEFEpFqF9QBLUklMIig7xemsEuoGYz883CpjONVb8sfSR/ed7d6rfm8FZXIpuTH53rfmi/gRVHmbfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tDBT3tjr9HaRUQp7js+TCz9JTMCF2xP70ZpPmuzVFQ=;
 b=e08px8G3jp+WCxETtIdHhuJQkbU8YQ27IyU1xPN3dr2QST+ucOmZ6zWGyv3VHXizCJySrxPfhtqh6+CZF//j29bAAL9hO39XSPzJ8xel9QeHHH9qPvcz3492695rbn5y+C+APTTCjDGPJB3NkNFOJW6OJtQZDzRUCrPD7bQ3xMrNXrNEh49wnAWvllEfsN+ny/w2NeWm8s5OujEr2adm9+3GzE8YObGD5CgafD5k3wwRcb1VZfr1lxz9Y5ikvgvdQKthqTOrxQQtpi2plXUK4jnx0zU0BWPupDFbAvvNDh4JoIxXfpWuDYd0ktNeTzwcVuNgwrqIpXpQvp/vCq8d1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tDBT3tjr9HaRUQp7js+TCz9JTMCF2xP70ZpPmuzVFQ=;
 b=eUhwAkQEiKOjl3E+OyZEOpUOuIRSToxLZEWaHXNfW07iZq4ikxRoGmTqkzrX0pVcMmXzwiWAcsMoF/aUKJu0WT5OE12FG8GP6mAdBcQTBPFBpWW0AaioBod6lOeXvscqZnneKWA0HysF7aDT2SttlC3vWFAJGnX5lMTRWYo/Ego=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM5PR0802MB2500.eurprd08.prod.outlook.com (2603:10a6:203:a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Thu, 22 Oct
 2020 06:50:10 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf%6]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 06:50:10 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH v2 2/2] arm-autonomy/linux-arm-autonomy: Fix runstate info page if kpti is enabled
Date: Thu, 22 Oct 2020 07:49:50 +0100
Message-Id: <026f63465f322ccbb31679baf95e604f32dc64f6.1603349281.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <273cf71a35491c97c19ac7bc32ec7ebbb8c7acc6.1603349281.git.diego.sueiro@arm.com>
References: <273cf71a35491c97c19ac7bc32ec7ebbb8c7acc6.1603349281.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.106.52]
X-ClientProxiedBy: LO3P123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::22) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.52) by LO3P123CA0017.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:ba::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3477.22 via Frontend Transport; Thu, 22 Oct 2020 06:50:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 28331fa8-9611-4092-8a34-08d87656bca3
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2500:|VI1PR08MB3101:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB31018A20E78FB1FE9FA0C3D2921D0@VI1PR08MB3101.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 +U1xvMiqMMjMcGQtOtESk90PoTcKhCmn5fg6jPXcgmbh2HA+j5ZYGSTWBPXfoIDvtRI3cWhMjQadxqAPAlCAzUTtWVJFDrPqMeAZPi2GeNtumhhuRKNyNsR4jMmR3mxd2XlFE3Bsf3Zu3/PqIBlpykknUaSEUGWIdhffKZTEqitrKv4U81FzGo78FFQKUIRp5vEaVpnPf82KxEIWhNPUf2Ibvv4Qwt5LfehqDcmmn4B+FO5I4gAKif/pkMY1RFpbU48SoAcGhC3clLf+Ubl2I2+NMi4SVUBxa6F4mIHEYH4rZGcFtgvfT5nnM3x/K/YtUyXS672e8zG2OkN+1zOiplCLzDYoBOAc4Gxr6pURWFDeK6CHhbn9y5Ayms4MzP5R5t8YCsEyVmHyA2V9cLn1GA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(26005)(6486002)(8936002)(4326008)(66476007)(5660300002)(86362001)(6666004)(83380400001)(8676002)(66946007)(36756003)(316002)(66556008)(966005)(6916009)(2616005)(7696005)(52116002)(956004)(44832011)(2906002)(16526019)(186003)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 S/MlPgvclNSxjhZdfcy0D0/lHwwLpxCwqzxImKM1TKP5LtLNdILyxs7dSfOeYMEQVXy0anVE4GytcNxDAFKdobmmqroNWPxmAGrd0+zrOA/2pGhH1X8gSHXMn/xU/fQa3xPvT5mCAv2ZWHOHHjFGr1y81URr1pJchzY+sMozCCwmRnV5WpVROLu+Ah/93oR0MjY8eQUYEdG8TN2IVG1dLmWMXlyNDzMH22NgUYSdfsfD5TsflTzBEJrB+VyWGrM2CK/fNkmDyvDMzlRvq92WPNztF+YvOPDSPADTrGYpZU5bstwJH+Z+F5J4xpofv8OLkl1iT7Dkc6zzJ1145H+nlGzyzehqk2wLZTkR0h2PNg3s2xYKuzxybNUB7uxQQpoYr2hlpHzDBRA5q+wWGfA/BYzyp05xHCHB/qB97Dj0PC22ncyl3p2GgtEMH1mqMKSM/BOJCAddFrW4d+CG7HPQ5KLchpCgCvkA14pn4d55EVoIhZrjsI60gfkmZc1fZI27EDY6nScR3n+WcfJa0Pc0pleuXyOxM5dJEIyDhSEPoQurrsebSmeFGwO4cBzc8BARQYtt99f4pwgg9gsuwR/dyWX7P2uQli+LAuBNFN7kakyUXsezfuheGZBaXv/rAMJOxzZcNxHeMxGORTiCjilBzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2500
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	805330c3-df3d-4a5b-3c88-08d87656b800
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5j6ew/xUUzkD1O7KOFvaGiD1prcLo5Ro1nFqcoImSWTCDmRebr2qP+suLrFf/gM3gl+kqZZ5FT+TuoPdgdadLwNOGdzK71aUa3bYcJQmR7JVWguDdHVERDpvrePokiGtwjFF0QIsfPFsNLZCiXcO2Q8n2hOGyFSdUDw0t+xD0mBNUV3jWwB8kHz0XotiV6wuBfxM+bU2G0RRSMRALwKl8oPygd0iX2c1euaxN0S1TG2qu1Ho5rDThAGQQba4ec0eASfq+aZhsVzFjs4xsz28HyDRaem55vWOqkzXbBQpbLyPQmbJpiFE2apvxder/1cXvFMwrqTmCJXf5ZnhKpofJP4AEgPdbxUKkJrPDpjRE1ap5ZSEAQ48BuZE44IcHid5kpQaDzkvjZGhLJeyF0Bmzm66X7d5g8C681RB7PlDG85tpuss9xkAvykGnd7fP2yqV1ADyWPCQgAkkz2mEkKLVrpuDXkMTSLOnprc+IlC1Ew=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(396003)(346002)(46966005)(6916009)(956004)(8676002)(2616005)(2906002)(36756003)(47076004)(82740400003)(83380400001)(81166007)(6486002)(356005)(70586007)(70206006)(6666004)(5660300002)(82310400003)(186003)(16526019)(36906005)(966005)(26005)(478600001)(336012)(86362001)(4326008)(8936002)(44832011)(7696005)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 06:50:17.5555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28331fa8-9611-4092-8a34-08d87656bca3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3101
Content-Type: text/plain

This patch surpress Dom0/DomU kernel messages like these:
(XEN) p2m.c:1888: d0v1: Failed to walk page-table va 0xffff00005ddb6238
(XEN) p2m.c:1888: d0v1: Failed to walk page-table va 0xffff00005ddb6247

Change-Id: I10364516a9992da4a7b52a2cb02baa5c12ff8585
Issue-Id: SCM-1520
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 ...not-setup-the-runstate-info-page-if-kpti-.patch | 83 ++++++++++++++++++++++
 .../features/arm-autonomy/xen-guest.scc            |  1 +
 .../features/arm-autonomy/xen-host.scc             |  1 +
 3 files changed, 85 insertions(+)
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch

diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch
new file mode 100644
index 0000000..eeade92
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch
@@ -0,0 +1,83 @@
+From f88af7229f6f22ce7313c11a0bbb9c88317b7c5e Mon Sep 17 00:00:00 2001
+Message-Id: <f88af7229f6f22ce7313c11a0bbb9c88317b7c5e.1602759709.git.diego.sueiro@arm.com>
+From: Stefano Stabellini <stefano.stabellini@xilinx.com>
+Date: Thu, 24 Sep 2020 16:49:55 -0700
+Subject: [PATCH] xen/arm: do not setup the runstate info page if kpti is
+ enabled
+
+The VCPUOP_register_runstate_memory_area hypercall takes a virtual
+address of a buffer as a parameter. The semantics of the hypercall are
+such that the virtual address should always be valid.
+
+When KPTI is enabled and we are running userspace code, the virtual
+address is not valid, thus, Linux is violating the semantics of
+VCPUOP_register_runstate_memory_area.
+
+Do not call VCPUOP_register_runstate_memory_area when KPTI is enabled.
+
+Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
+CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
+CC: boris.ostrovsky@oracle.com
+CC: jgross@suse.com
+Link: https://lore.kernel.org/r/20200924234955.15455-1-sstabellini@kernel.org
+Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
+Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
+
+Upstream-Status: Backport
+Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
+---
+ arch/arm/include/asm/xen/page.h   | 5 +++++
+ arch/arm/xen/enlighten.c          | 6 ++++--
+ arch/arm64/include/asm/xen/page.h | 6 ++++++
+ 3 files changed, 15 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/include/asm/xen/page.h b/arch/arm/include/asm/xen/page.h
+index 31bbc80..dc7f6e9 100644
+--- a/arch/arm/include/asm/xen/page.h
++++ b/arch/arm/include/asm/xen/page.h
+@@ -1 +1,6 @@
+ #include <xen/arm/page.h>
++
++static inline bool xen_kernel_unmapped_at_usr(void)
++{
++	return false;
++}
+diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
+index e93145d..ea76562 100644
+--- a/arch/arm/xen/enlighten.c
++++ b/arch/arm/xen/enlighten.c
+@@ -158,7 +158,8 @@ static int xen_starting_cpu(unsigned int cpu)
+ 	BUG_ON(err);
+ 	per_cpu(xen_vcpu, cpu) = vcpup;
+ 
+-	xen_setup_runstate_info(cpu);
++	if (!xen_kernel_unmapped_at_usr())
++		xen_setup_runstate_info(cpu);
+ 
+ after_register_vcpu_info:
+ 	enable_percpu_irq(xen_events_irq, 0);
+@@ -387,7 +388,8 @@ static int __init xen_guest_init(void)
+ 		return -EINVAL;
+ 	}
+ 
+-	xen_time_setup_guest();
++	if (!xen_kernel_unmapped_at_usr())
++		xen_time_setup_guest();
+ 
+ 	if (xen_initial_domain())
+ 		pvclock_gtod_register_notifier(&xen_pvclock_gtod_notifier);
+diff --git a/arch/arm64/include/asm/xen/page.h b/arch/arm64/include/asm/xen/page.h
+index 31bbc80..dffdc77 100644
+--- a/arch/arm64/include/asm/xen/page.h
++++ b/arch/arm64/include/asm/xen/page.h
+@@ -1 +1,7 @@
+ #include <xen/arm/page.h>
++#include <asm/mmu.h>
++
++static inline bool xen_kernel_unmapped_at_usr(void)
++{
++	return arm64_kernel_unmapped_at_el0();
++}
+-- 
+2.7.4
+
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.scc b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.scc
index 935e78f..b681177 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.scc
+++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.scc
@@ -2,3 +2,4 @@ define KFEATURE_DESCRIPTION "Enable XEN Guest Frontend Drivers"
 
 kconf non-hardware xen-guest.cfg
 
+patch 0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.scc b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.scc
index 6fdbabc..61b96a2 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.scc
+++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.scc
@@ -2,3 +2,4 @@ define KFEATURE_DESCRIPTION "Enable XEN Host Drivers on autonomy systems"
 
 kconf non-hardware xen-host.cfg
 
+patch 0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch
-- 
2.7.4

