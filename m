Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.66])
 by mx.groups.io with SMTP id smtpd.web10.11968.1599133279993144899
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Sep 2020 04:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=8o39Gpth;
 spf=pass (domain: arm.com, ip: 40.107.4.66, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnAtRQDk/lJlRj3q87iY4V9s3Tjn3GTCpv2sHlx8bbs=;
 b=8o39GpthcURfGgaZhH/bJXLzlDVYL5rz9FLm70KCRpRLLeWdgfTDQnXtNMr/ASZZpLkaTdypoES/pK9zTphTYhXtwxO8eHV6BMFWfMkeyZ/Zb6XFdKxA7RXGsVlJOahVTvhZ/L1RPH/92qV1i1FKnujjmbfTfPZodMddxFOTOzQ=
Received: from DB3PR08CA0014.eurprd08.prod.outlook.com (2603:10a6:8::27) by
 AM0PR08MB5252.eurprd08.prod.outlook.com (2603:10a6:208:15a::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Thu, 3 Sep
 2020 11:41:17 +0000
Received: from DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::c3) by DB3PR08CA0014.outlook.office365.com
 (2603:10a6:8::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16 via Frontend
 Transport; Thu, 3 Sep 2020 11:41:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT059.mail.protection.outlook.com (10.152.21.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Thu, 3 Sep 2020 11:41:17 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Thu, 03 Sep 2020 11:41:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9f5b19d80e8ec10e
X-CR-MTA-TID: 64aa7808
Received: from 3f92a9f9b748.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D482078C-B4E0-4D6E-9FBA-F4AC5C796428.1;
	Thu, 03 Sep 2020 11:40:39 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3f92a9f9b748.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Sep 2020 11:40:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQYyYHwlaRG9cEAM/id3aIvlLTE3qZh8YJM7o6fbQgf7vEIKGSxzbsNiHDPN7h99+ltn22z4IsOOD1iuumejmjZNLQx3RU1lUiTwLXhbVH2U+HiPCPsdltOUh/iEm50XQdcetkS7eFNIM112n/Q0DIotcaAXTQIYHFsEZqUSQv0QyCLKIVsdVcv/jdvkdEDqUs4iJW0nSlxAqzJiwlgx/hZtbxLoQTCx/e5iwuLBmqWIOWd2D7h2H8jsUfG+CZK/Fa0jiDJMKOudPxSKrT2I+ffbuAWHGzLrNC2SFwMpaUkOKj2VrXspUwi/K/NaMErZ67yocUh5+TQX5hc53CeG6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnAtRQDk/lJlRj3q87iY4V9s3Tjn3GTCpv2sHlx8bbs=;
 b=W27silQvRyyvyJFsEX+Y4LDr0qLKySoNbXpEp9V6N/UkpWf3hTJYIjXQrlwbpnsm0wyjFwpQvwc2Qwd0qC5K0S9mXQOO6CnElUkbh2Bca+zUic835t9mcDV8Gx1H6O9aEh93c8En5A8DjekpIzU9FZSgmJiYUOq0qJvFoVfkmSIlLMBn8V+Ujg1BUvKHxkpg3rFtf89H5moi4yYF8Huid5DwfPwJTgZfxmdGenfrJuekLoTgAMh9Y0Smfac3avqEDoR4Ytmqm9zxprCdINLYGS32sYCVX63PGGg2NyGfDYa+80MOXVvdm8PtBW0EqhWwsdZKXq5B746ecOJoTcPoGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnAtRQDk/lJlRj3q87iY4V9s3Tjn3GTCpv2sHlx8bbs=;
 b=8o39GpthcURfGgaZhH/bJXLzlDVYL5rz9FLm70KCRpRLLeWdgfTDQnXtNMr/ASZZpLkaTdypoES/pK9zTphTYhXtwxO8eHV6BMFWfMkeyZ/Zb6XFdKxA7RXGsVlJOahVTvhZ/L1RPH/92qV1i1FKnujjmbfTfPZodMddxFOTOzQ=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3688.eurprd08.prod.outlook.com (2603:10a6:20b:8e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Thu, 3 Sep
 2020 11:40:37 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3348.016; Thu, 3 Sep 2020
 11:40:37 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/9] arm-autonomy/xen-devicetree: Fixes and updates for N1SDP
Date: Thu,  3 Sep 2020 12:40:24 +0100
Message-Id: <8fe9774d507e2b8e732b011d34ba0b4de3fd8a88.1599133172.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <bff93f4e0c123dc3cfbaf417b7c398e392b9771e.1599133172.git.diego.sueiro@arm.com>
References: <bff93f4e0c123dc3cfbaf417b7c398e392b9771e.1599133172.git.diego.sueiro@arm.com>
X-ClientProxiedBy: LO2P265CA0463.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::19) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by LO2P265CA0463.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a2::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3348.15 via Frontend Transport; Thu, 3 Sep 2020 11:40:33 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cfb2ad02-c0ea-4a32-9447-08d84ffe4522
X-MS-TrafficTypeDiagnostic: AM6PR08MB3688:|AM0PR08MB5252:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB52523F72F78DB924E54459FE922C0@AM0PR08MB5252.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 hfPEbUDrrm3CZLT3PLD7Yef47ZJGRDrjWORtIPI1LtFi6vWJpVDO8u1fh17D/cxdbv+SH7291/4GLgG2mO7B7W7T6EAxa3hfUJyOFQFojWAjF1iAuWmmIoi+4SlNHLUL3y6i2ynEeQmQ1psUcm+aLPfYMBZqHwR5A94EYKdJvi9SItwX1wk623dc3k+UDGW94XJcLj0ULFhw0KSVew/jcLy9rmc5rWOnYoGoTPcZbEqEL3wjh3XNM+IZG57Fi4C1Obx9UeWTLkclH0B/p1CtLUUNIEOGFRvfXjkTUp4xTjy3eWaXbAaxpLB3XpTX4FbujY0PHPGDZ5OqW5BPr8qQ1nVKAtS2PbHLoVocqZ09fOg9j9tfBnasFjGiSJwChTAE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(52116002)(8936002)(44832011)(6666004)(86362001)(8676002)(478600001)(36756003)(4326008)(66556008)(66476007)(66946007)(2906002)(6486002)(5660300002)(186003)(83380400001)(26005)(16576012)(6916009)(956004)(316002)(15650500001)(2616005)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 qCMoJ1F8lNIUPsfLE5s+BtENQ2Pu9cjiJ7k+rpAKDOhMdN+ZSLlSW4sLIPyK1qiIPor6dsCq+g8yW+1n9mSpItlT2AYfr+VkpjvYVhjEPZRNuo5S3JMUlDd3pvSoUeSWueV2svGQH0eJQFNw5AklTy1rz/Y1n3Bc9QyDE15+KWI+c+gHszs+KXQFjgrFTXCYi8GGLci/PyaLmlmDf6hw24zTRi2snAvDfDq7FTRW7j+esOODEjtH2CXrxZJdr4DVFM5UOfCyjmtLIu6zVQpNakPEnxGM7+NoSeart925Xrupytw7WH0aHTxAjAy8xy2ldPhO05TSx0SUxhs5mhH08rJpfdZ65AWaLd1kxxeMTyFjez+HxM0+jho2E2EYQLS7g2zzGQMbWCHEUbxKARUmw3valQdX/5DYQ+Wsuef5P9jCq1qxBE0d3WG04XjPtA+7RR5Da11VLlpgHb+E1I1+7062dN6wX8pnIjsgXigzWLU5AwPMpO3wvUX5m6Yke3+2/0xbWkfZcS6rqbQizkWsoyDraejjrSwLsOe7Yl8pFrfZptie8tUFUIm+T9mQCnlmx4cbvY1qsgesmCtSDnjgQ4p4NBZ2z13qNQ7RpyHN6lEJIu1M8aGsTQaTrZBjomYJoNYZBiu27wxSOM9fZHKNDA==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3688
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	29b0526b-7b3e-451b-9b79-08d84ffe2af2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zaY8N8feRkwN7yJQ+eTwmyH3w5dpLvFPEBrpg/iR/owoayeJYeoP6AGBafuEKSVlVavODbI5wQG2k/oIPPAWHMzhp9rE96FlWqXuc6TIGW9ZsH03H3g0YVrXf8xv4t9be+SmsSBhuYskdRew6mEN/cLt2KdnNk66QC0ftLRCA1Xhyh2fqdWp2BA+NAiXNKMIxcroo/zQ6dIQFzZQ5Wl8c1z8jTfOb+YMPeDgK15kzyKe0lwGsKqttU5i0xcKoJhYm+As3BnOca9mN5Wq6siHHYs1GF3mE1svVmOwxk4pgqaH8XARhuXiTYa57obXeJzIXGJHaD7yytAWoyrMnbmtmmXX6E12OtXgoeNJXgMGAVdxJdIZC8GwZ0vx/ontwLVXqMRQW48tXNgjuuOt2xX68h7rYrkkBcz9QhLvwqIeQ6A=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(46966005)(81166007)(956004)(356005)(82740400003)(8936002)(36756003)(4326008)(15650500001)(336012)(6916009)(26005)(478600001)(2616005)(16576012)(8676002)(186003)(86362001)(6486002)(47076004)(70206006)(82310400003)(6666004)(70586007)(44832011)(5660300002)(2906002)(316002)(83380400001)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2020 11:41:17.3006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb2ad02-c0ea-4a32-9447-08d84ffe4522
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5252
Content-Type: text/plain

The N1SDP machine now uses the dtb generated by the tf-a recipe and for
now we are only interested in the single-chip mode.

The xen-n1sdp.dtsi needs to be updated by adding the extra
'soc' root path to have the dtc being enable to process the
nodes customizations.

Change-Id: I46eaec23d25f6c4a4b6ed86661d451ace590706d
Issue-Id: SCM-1065
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../xen-devicetree/files/xen-n1sdp.dtsi            | 46 +++++++++++-----------
 .../xen-devicetree/xen-devicetree.bbappend         |  2 +
 2 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-n1sdp.dtsi b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-n1sdp.dtsi
index 01ec14a..e3c3294 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-n1sdp.dtsi
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-n1sdp.dtsi
@@ -11,29 +11,31 @@
     /delete-node/ pmu;
     /delete-node/ spe-pmu;
 
-    /*
-     * disable IOMMU until we have a proper support in xen
-     */
-    /delete-node/ iommu@4f000000;
-    /delete-node/ iommu@4f400000;
+    soc {
+        /*
+         * disable IOMMU until we have a proper support in xen
+         */
+        /delete-node/ iommu@4f000000;
+        /delete-node/ iommu@4f400000;
 
-    /*
-     * Set extra registers required for PCI quirks to communicate with SCP
-     * and remove invalid properties due to removal
-     */
-    pcie@68000000 {
-        reg = <0 0x68000000 0 0x1200000>,
-                <0 0x06000000 0 0x80000>,
-                <0 0x62000000 0 0x80000>;
-        /delete-property/ msi-map;
-        /delete-property/ iommu-map;
-    };
+        /*
+         * Set extra registers required for PCI quirks to communicate with SCP
+         * and remove invalid properties due to removal
+        */
+        pcie@68000000 {
+            reg = <0 0x68000000 0 0x1200000>,
+                    <0 0x06000000 0 0x80000>,
+                    <0 0x62000000 0 0x80000>;
+            /delete-property/ msi-map;
+            /delete-property/ iommu-map;
+        };
 
-    pcie@70000000 {
-        reg = <0 0x70000000 0 0x1200000>,
-                <0 0x06000000 0 0x80000>,
-                <0 0x60000000 0 0x80000>;
-        /delete-property/ msi-map;
-        /delete-property/ iommu-map;
+        pcie@70000000 {
+            reg = <0 0x70000000 0 0x1200000>,
+                    <0 0x06000000 0 0x80000>,
+                    <0 0x60000000 0 0x80000>;
+            /delete-property/ msi-map;
+            /delete-property/ iommu-map;
+        };
     };
 };
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
index 006d0b7..3787488 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
@@ -9,6 +9,8 @@ XEN_DEVICETREE_DTSI_MERGE_append_juno = " xen-juno.dtsi"
 # Add a dtb snippet to remove pmu and iommu in dom0 on N1SDP
 SRC_URI_append_n1sdp = " file://xen-n1sdp.dtsi"
 XEN_DEVICETREE_DTSI_MERGE_append_n1sdp = " xen-n1sdp.dtsi"
+XEN_DEVICETREE_DEPEND_n1sdp = "virtual/trusted-firmware-a:do_deploy"
+XEN_DEVICETREE_DTBS_n1sdp = "n1sdp-single-chip.dtb"
 
 # Board specific configs
 XEN_DEVICETREE_DOM0_BOOTARGS_append_juno = " root=/dev/sda1 rootwait"
-- 
2.7.4

