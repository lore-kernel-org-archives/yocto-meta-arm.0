Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.72])
 by mx.groups.io with SMTP id smtpd.web11.13054.1603291888896012872
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 07:51:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=qopHrk9E;
 spf=pass (domain: arm.com, ip: 40.107.8.72, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzKNb8DHuCqcmtcSKdEHXlO/xfjilIBiJcurIl6OjZs=;
 b=qopHrk9Ekjey4k8O+O0m6WoaR+Hb6cAWt7t9mUYfbYm7XOQZsh7mpgxfVb4q3HQzzCLDNYQubXRkRKTOYBXzzBw28bAFPY6EqG1H4YZMaGG+JJ0tdJf2g3/9/bU1h64L4s8vBHWbhOc0RKcpXsUwQmuYpAgO29X+JYNpEOWTf8A=
Received: from AM5PR0201CA0002.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::12) by AM6PR08MB4039.eurprd08.prod.outlook.com
 (2603:10a6:20b:a1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 21 Oct
 2020 14:51:26 +0000
Received: from AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::21) by AM5PR0201CA0002.outlook.office365.com
 (2603:10a6:203:3d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 21 Oct 2020 14:51:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT050.mail.protection.outlook.com (10.152.17.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 14:51:25 +0000
Received: ("Tessian outbound ba2270a55485:v64"); Wed, 21 Oct 2020 14:51:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 06ede0e87ebc08fb
X-CR-MTA-TID: 64aa7808
Received: from de9e0f069e96.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 72645A3A-DF73-480D-8588-5035C284D9DA.1;
	Wed, 21 Oct 2020 14:51:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id de9e0f069e96.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 21 Oct 2020 14:51:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DR9+lbP1mhn/muLydeftWt9mGJs1tRu0d+NYfh+XJ6sNDH8P8796otUZCkioP8FXfcvQH28aKZ+T+vnuLGhPxuvi2iTOxPTsMJhVf+/fiaaWLuJx2+M+pJB3SWRQ1d00YjBlqOsoWtZw2qQp2q6jyh51AErRvZ5KtxQjrMI/sdzHc3sSncvQ2xjBLcBapqZkOKhbicEsoJbMpRJCxuwMFe36JUvnfQsmWDTipTkwEi4DkEZsqfHlEoYYRdUbxPArU4et+gWwpNNx1EwMwZp5hlGbxrLbCOPpblxtXP6QqmHKOXtmTNmB1bnyXWaEFv1H6SWBCx7LAGYImuEHU17R1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzKNb8DHuCqcmtcSKdEHXlO/xfjilIBiJcurIl6OjZs=;
 b=X9xJaDexzomOR10zG35xlSV+VrVHOc9aZAdUAPWhW6cXb6UnPevG7252ehgUhdefO3uhMOWnp1vDeeeAtRBrAMRs/SHpTf7NX6lcs29nhiJ54a4RtAwe4zqc5wbkzwo0U5QkJT+hIahODdaxhwLiZrZ9sc5zdEG7f2+bAqBnfozkXGXzCTsRgEJpd/yMUfE4AUG+ww91apovxzGWbuIjyPfdtI0hp8WWDHdvSTD0Lx4qhquQLD+LhAlKCZBUl6L4kIVDb8/zvnJjSwYQxD5X2horuLK1FCqZ6bkKYt4kvXkhvTrneKKgt8H+MWadi/G7p4b3XNmwknFv/o2wCRlh5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzKNb8DHuCqcmtcSKdEHXlO/xfjilIBiJcurIl6OjZs=;
 b=qopHrk9Ekjey4k8O+O0m6WoaR+Hb6cAWt7t9mUYfbYm7XOQZsh7mpgxfVb4q3HQzzCLDNYQubXRkRKTOYBXzzBw28bAFPY6EqG1H4YZMaGG+JJ0tdJf2g3/9/bU1h64L4s8vBHWbhOc0RKcpXsUwQmuYpAgO29X+JYNpEOWTf8A=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6182.eurprd08.prod.outlook.com (2603:10a6:20b:291::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 21 Oct
 2020 14:51:18 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf%6]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 14:51:18 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 2/2] arm-autonomy/linux-arm-autonomy: Fix runstate info page if kpti is enabled
Date: Wed, 21 Oct 2020 15:51:09 +0100
Message-Id: <4404e60a8bd6b0f76a05301dfe2bb3f7f9d5e198.1603291792.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <a151eaf39d450b9461ea9d259206956bd5a9fd49.1603291792.git.diego.sueiro@arm.com>
References: <a151eaf39d450b9461ea9d259206956bd5a9fd49.1603291792.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.106.52]
X-ClientProxiedBy: LO2P265CA0275.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::23) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.52) by LO2P265CA0275.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a1::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 14:51:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0b543e61-5309-4bd1-e02c-08d875d0c909
X-MS-TrafficTypeDiagnostic: AS8PR08MB6182:|AM6PR08MB4039:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB40396E73DAB246F02A7E4AC8921C0@AM6PR08MB4039.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 puyJPIcvIkeAZF3kMlXXS0BC9AWKXZEemLeGAtv9hs8tN1kw0Fq+zzpEaUyxZqIlFgLwddA42Ma9nFere1pLGpzq/ug6J+ZqFNr0dQf9WcKPDvxMCVfrF5IiDi88+IZ2na4nVQcWo2JnRr7YEK0+Z16ig5TeIWikk6heoAAdCduD0iEaXZs5ce6L1Fx1oT9bvEhD34bhIg48V+rq0Qbb/C16E5CEZZBY9wl5zeXwWMqU+rXfnRaWqRulcwkA1g+mGWNDM6siaK2MquSdwfWt+X2zUp+evltZQLXGQSp+iSw+VeGgdEmGBZilNdwyRTZYXMcbszFNuBpJcJPFBqJoix/mzwCkqsR91XBPwQ+HPjHdqf9T2rP3culwxUSqb9K8gXw84OgaYxEW/ehX9vZfmw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(8936002)(6486002)(2906002)(4326008)(478600001)(186003)(86362001)(83380400001)(16526019)(966005)(36756003)(316002)(26005)(8676002)(6916009)(956004)(44832011)(6666004)(66556008)(66946007)(66476007)(5660300002)(52116002)(2616005)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 kuNW9pIiiOOhqI3uXDN30HRHFiG991TrzADaC6abGvuTmSyNv2EyyhoYI+vi+U4fWvQ5mMfsuDCAB1UCASuGVvgaRrhMyhexZWh+EpKucC7gpALE6YrQKvB2cxfgzgAool2Hc0m7ZtVmBofef4nrTSxGZfmflBaI8lUBxRiqBPEx70KA22rbuB0rC68d9Q9psU8Z3n2O+x9uGG7ysyPGP25FDvAnyIUcfZz4Sljam9Yjwt5eAbzLYve6NRxYtTateBV6KsxWoLGZUSaCkAG+3dc7fY3cYT2o25tj1lDPJE/qVPIqNU57iwMaS56S95vEcqymHtrfNs0AvcU84kUXHJmDrxDOMDk8UHwC0sQHUKD9T5PtUsvw4E+rCvMbAZlzmTKrRUGWl/OmX1wYbvDBx0kr0s+kfkbyc09bwEXjUzfh5mIbkey0o/0uZiLSV/sRM59duL8jAi+VVT96xGogsnk4C2+ZRNPQhWCk4u3Lv5+BNNjaizgl+z7m4tyc9vtWpdNqfBwfy0Wobqdwh9kJBQM3G/qhzQz5AsePiaRZLTukxvOPC4peA795G6nnkzSCabU6dKITLH2T5nCPYIo41PNaMUX7eLY+YyRgEe3Crp1HBYB5PAcsvJHFL3ile7rMxukvLYjwEM2wqkmEono69g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6182
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d8e7fe31-1af3-4c82-2d71-08d875d0c43e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	paVq8qP3K768Yf8f7qa/7tUNIaZLsFsKYxLpXAE3YPiRnKvpJnTP6C7OXYJHOg2Dko/pJzAxIumOQpCJwyUHC+RunqbWrbHQ7A9w3QhoZ/frNftgFtBDFc1ne4OdiyebaG6JkvyDa1e+93EiYzpCyof3BINmAk3OKSFzMYEWxeZWXfBaaHMzMhZeaRWj59qpGhQEiaBD6yC+aI2IxrCyOsIIeJlLBuFcpynECTi6DW4UuBMf09U82xloqucMWbiGpK6RiBn4Qi5e+uIcFF0Q1wolorFPiZR7U/age/DHYHQS1L852LgVw5BZ91VlaAb4aCLEBsxkn/uSS4XeoLL0eUhVrlPwr73zrfOA26JxTHDsiM1zH3J7BglueEf21leXVl0iqRNSuGOX15NLgoJ2Y1xjpSfxpo7FUu9q7rTipJEYBLVrb8lqrG0cmaUMcYKylx5x1VKSJkZ/qhjx9Gjp6O9BiUoWIAV+scaba/j4N1Q=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(376002)(136003)(46966005)(16526019)(7696005)(26005)(186003)(70586007)(8936002)(81166007)(956004)(82310400003)(83380400001)(70206006)(8676002)(478600001)(6666004)(82740400003)(2906002)(2616005)(356005)(6916009)(5660300002)(44832011)(86362001)(6486002)(47076004)(336012)(4326008)(36906005)(316002)(36756003)(966005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2020 14:51:25.8810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b543e61-5309-4bd1-e02c-08d875d0c909
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4039
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
index 0000000..d27a6e6
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
+Upstream-Status: backport
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

