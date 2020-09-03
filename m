Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.41])
 by mx.groups.io with SMTP id smtpd.web12.11960.1599133279175552185
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Sep 2020 04:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=NRPUiOos;
 spf=pass (domain: arm.com, ip: 40.107.8.41, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C84n35atwP/1seLdwIYZnCUsR32L1HB7zwkxOLiZzCE=;
 b=NRPUiOosrRt/l5Mj5LH37QsVkXI6AZpxJPGvM2O8qlH2qwuDsAe7qel/PjKzOFjdtg5YK+PxUGaMYg96uvEe7f0u20dYYEURTcvjd0i3vIh7ryy80VhT66vOAFJbxs8VN9hWXfOIINLr4tTotV8VkvD68TcQycTD5PO/LbmrzFo=
Received: from DB6PR0301CA0100.eurprd03.prod.outlook.com (2603:10a6:6:30::47)
 by VI1PR0802MB2304.eurprd08.prod.outlook.com (2603:10a6:800:9f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Thu, 3 Sep
 2020 11:41:16 +0000
Received: from DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::6e) by DB6PR0301CA0100.outlook.office365.com
 (2603:10a6:6:30::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Thu, 3 Sep 2020 11:41:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT061.mail.protection.outlook.com (10.152.21.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Thu, 3 Sep 2020 11:41:15 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64"); Thu, 03 Sep 2020 11:41:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d823c2f8e87f4eb7
X-CR-MTA-TID: 64aa7808
Received: from 4ad040111dba.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 55BAA4F2-8537-4B18-928B-D3558867BCA1.1;
	Thu, 03 Sep 2020 11:40:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4ad040111dba.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Sep 2020 11:40:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gwko5/dBC8D+QKCEJDtb/dWxend+KLqKP0AZfvDE8qCJR1sBUbVhDIZrzFQGOLPzGhjLSfliSd9ZhgO3OQdAuzVQdO0MQnd5Ibz6ojZz5MDLyXd5RCBW6EyrCzZb+Z0aSv0UkRTIcmUXKu1cqucbCLaPG8gpnwT/c4ExPaWhEO3U1wbSN/ryPNRxhKaDlM+3OL0dEmXC1u9Q8opxsRe0nIL3shfmBso7fIYVfiV+8CfpHc1l32JBiAAEJj5VwrqmhPXIxrNRdNAGUqQ19va6RLQyihttWIHKzcbQ9Z0JoQyVjyk6J/aLygJc64PQBKwhIYUD2Hxc7gfe2V/JJmIHJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C84n35atwP/1seLdwIYZnCUsR32L1HB7zwkxOLiZzCE=;
 b=XcmNxvP4H60fqYDLvmYLgzj84RfaMpXziKo29cwt2YcvDq7yhfC3rKZv/K9QfeXNSlskBYw96Ci6PO6IdV4wb4Um06DWfeT5XRH3LgUpvutmvbJ5g/s6hCy6vqG5EwaDT+El5Q3cLz1lxKaNhtV/SXsENIrSUIs5fWqlhYBfBz8k90HpIkDDuIKLE4GVUC41Q5t1sqhJLYuDYq9omOdwq+ZjKDRQjRQ+r+P9vqfx2m5Q0MtMl9Hayi9a56q1UvOuewUVU0fpcv6OD48u1GR3D8j92kFNRLCrLTFBVbsHNF+jnLH1IVbA1SsmJ3sjbVvRZZdKizoLfkTA3qANGSuQcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C84n35atwP/1seLdwIYZnCUsR32L1HB7zwkxOLiZzCE=;
 b=NRPUiOosrRt/l5Mj5LH37QsVkXI6AZpxJPGvM2O8qlH2qwuDsAe7qel/PjKzOFjdtg5YK+PxUGaMYg96uvEe7f0u20dYYEURTcvjd0i3vIh7ryy80VhT66vOAFJbxs8VN9hWXfOIINLr4tTotV8VkvD68TcQycTD5PO/LbmrzFo=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.22; Thu, 3 Sep
 2020 11:40:32 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3348.016; Thu, 3 Sep 2020
 11:40:32 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/9] arm-autonomy/xen: Update EARLY_PRINTK support and remove custom defconfigs
Date: Thu,  3 Sep 2020 12:40:22 +0100
Message-Id: <bff93f4e0c123dc3cfbaf417b7c398e392b9771e.1599133172.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO2P265CA0463.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::19) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by LO2P265CA0463.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a2::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3348.15 via Frontend Transport; Thu, 3 Sep 2020 11:40:32 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6c6755df-5a1f-46ab-390d-08d84ffe4459
X-MS-TrafficTypeDiagnostic: AM6PR08MB4934:|VI1PR0802MB2304:
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB2304A301E2889A34CB23DBE4922C0@VI1PR0802MB2304.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 svbEe/IepkcYGFhkDwoPMbNYM56RQ4LLUMd9ALYpo4mQ3sGOtAmHiAfTx+vPDok3HyVE0zhXRUXvkZbtgMzJ8w1hYPToThRk9aykofecAIBPTTWv2haL4CGxc+05RKKSOpf1G4Jy7Q7ocyKblZFosv/8/JdfKmTXd3k1ecurLoO8XeJVIJ4VI429TjrO4Lb6Ixau/LfeS46I9JpO4VnO2TYV7y1+IVebXeFRpucqHbFBC3zuSUmyN/4AZwv2DlHW7WpSkTLB8HOrlEJTK4gEDyQ0Xboh1GhzHtg+QmYGthtGWtpHZAEzTU+kJdyoBOZAQThtUs4xh4ueBlodDzGTuezDFAaw43bRg22IQoHFsfbOCgGIjVqdBRf3zDVic9KW
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(36756003)(52116002)(2906002)(26005)(478600001)(16576012)(4326008)(44832011)(2616005)(316002)(956004)(186003)(6916009)(6486002)(86362001)(6666004)(66476007)(8676002)(5660300002)(66556008)(66946007)(8936002)(83380400001)(30864003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 /i1/UKfeknM0+HECYWULeDUQL1Oot2j903yU5BZfPwFTAFgrhat1ulM8xm8Ica9gBXXCORstRNEJmLE3LkMHc72u23V06Gdea3jJidPkO7I5SLK9ucWhzZsh5X00BQzS6+0siBIz5+IXmP8n9AVBqhXtcPSVkRHVzyjEwxtquFl/gvx8crM3aKU7Eye0PAZoUIMa1HeWR0NtCxweWq0tYGmDG8Fc6Q30JHbUZ0us4+F40VfKuEP+1WuS5UnFF+s1cjhwTZ0RgVOIrDVeKRlWhKDo/p/p02WI8YpppYY66IQi6/EWCdHq0lHd8Jj8PfUuys9twSdTmLi2rHHf5wcnmFpRXQd5rvaoH2udvp7NPmLWR2Oh4XDxkTImnJUe3Zz32JLIIUk78WRTgOe8fyw5SK6RW+JV7W6qdNZLbHtc0ik6jbok/LZz+l2OL4xsxHIvCLQbOu3t6ir0V5GBvrCvpg/AvJLHm7PAKfG4coOtvGyV2QOwnYH6x3UUUqMBD44xisVAPX9EOFErvCyzEvkUp/ZZBCsCiGKFXn+qVgB7XelYIAQJmCr9EDmAClhjDvrlRupSM3BpQEvOOjUoRXm8PlOipMNRlU7j+pafR0DCKkFSF54B//oICdX8szs0eOxJuZT/fMNGc5iNKdFp7EoZ3w==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4934
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6034c708-a8bd-4d0e-90b1-08d84ffe2a5a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tmyPPoykUQ/jrd5ZxZgcuTLlYjq0QcgpvUugsiWnLZ94UoLaJHonXy2pNLQcKKKWVnGAXbEDgXwz8Fm6gxMMELQ1cakK42g+Y4/mRogpNu9dot8UZeS+xvUPAmRYVVzcOK6KpIVq9X0lLgIItnFgvX3OqOdB8q59hKQ8yihpt70d1K5FIgfQtHjiqaWalfH0K8xtaBfAQlLdHbwE5FPPqw81ET+McbrZNnZiAJNy+m+o/eTgQXB031CuY+lQ1MwCkOPWI9BjcNVuk/aU1y7fM5JQG/sVaxv+/N/evYsnD3PltbvJE7rnCGE+AVBHP3GWSE+uWecihGGS2i1s+je0TZUGcpVb7HDOVQvU6AKwdoUoQhwGAgpjCbcXIzxGsV7XbMXBAfweudpK01m+251UdErnq1n+2FnoHOoSm3CLnj4=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(346002)(39860400002)(46966005)(82310400003)(316002)(83380400001)(16576012)(356005)(30864003)(6666004)(81166007)(478600001)(36756003)(8676002)(86362001)(70586007)(82740400003)(2616005)(6916009)(336012)(6486002)(47076004)(8936002)(26005)(44832011)(5660300002)(70206006)(4326008)(956004)(2906002)(186003)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2020 11:41:15.9800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c6755df-5a1f-46ab-390d-08d84ffe4459
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2304
Content-Type: text/plain

From Xen 4.14 version, the CONFIG_EARLY_PRINTK setting was moved from the
make define setting in xen/arch/arm/Rules.mk to the Kconfig infrastructure.
Hence, we need to make usage of config fragments to add this option to the
supported machines.

Also, remove the custom machines defconfigs and rely on the Xen in tree
defconfig.

Change-Id: Ibd6058c4808eeea6ad1260ba558468a64877b231
Issue-Id: SCM-1197
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../recipes-extended/xen/files/fvp/defconfig       |  73 ---------------
 .../xen/files/fvp/early-printk.cfg                 |   2 +
 .../recipes-extended/xen/files/juno/defconfig      |  73 ---------------
 .../xen/files/juno/early-printk.cfg                |   2 +
 .../recipes-extended/xen/files/n1sdp/defconfig     | 100 ---------------------
 .../xen/files/n1sdp/early-printk.cfg               |   3 +
 .../recipes-extended/xen/files/n1sdp/n1sdp.cfg     |   5 ++
 .../recipes-extended/xen/xen_%.bbappend            |  25 ++----
 .../recipes-extended/xen/xen_%.bbappend            |   9 --
 9 files changed, 21 insertions(+), 271 deletions(-)
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp/defconfig
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp/early-printk.cfg
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/juno/defconfig
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/juno/early-printk.cfg
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/defconfig
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/early-printk.cfg
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/n1sdp.cfg

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp/defconfig b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp/defconfig
deleted file mode 100644
index f13327c..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp/defconfig
+++ /dev/null
@@ -1,73 +0,0 @@
-#
-# Automatically generated file; DO NOT EDIT.
-# Xen/arm 4.12.0 Configuration
-#
-CONFIG_64BIT=y
-CONFIG_ARM_64=y
-CONFIG_ARM=y
-CONFIG_ARCH_DEFCONFIG="arch/arm/configs/arm64_defconfig"
-
-#
-# Architecture Features
-#
-CONFIG_NR_CPUS=128
-CONFIG_GICV3=y
-CONFIG_HVM=y
-# CONFIG_NEW_VGIC is not set
-CONFIG_SBSA_VUART_CONSOLE=y
-CONFIG_ARM_SSBD=y
-CONFIG_HARDEN_BRANCH_PREDICTOR=y
-
-#
-# ARM errata workaround via the alternative framework
-#
-CONFIG_ARM64_ERRATUM_827319=y
-CONFIG_ARM64_ERRATUM_824069=y
-CONFIG_ARM64_ERRATUM_819472=y
-CONFIG_ARM64_ERRATUM_832075=y
-CONFIG_ARM64_ERRATUM_834220=y
-CONFIG_ARM64_HARDEN_BRANCH_PREDICTOR=y
-CONFIG_ALL_PLAT=y
-# CONFIG_QEMU is not set
-# CONFIG_RCAR3 is not set
-# CONFIG_MPSOC is not set
-# CONFIG_NO_PLAT is not set
-CONFIG_ALL64_PLAT=y
-# CONFIG_ALL32_PLAT is not set
-CONFIG_MPSOC_PLATFORM=y
-
-#
-# Common Features
-#
-CONFIG_HAS_ALTERNATIVE=y
-CONFIG_HAS_DEVICE_TREE=y
-CONFIG_MEM_ACCESS=y
-CONFIG_HAS_PDX=y
-# CONFIG_XSM is not set
-CONFIG_SCHED_CREDIT=y
-CONFIG_SCHED_CREDIT2=y
-CONFIG_SCHED_RTDS=y
-# CONFIG_SCHED_ARINC653 is not set
-CONFIG_SCHED_NULL=y
-CONFIG_SCHED_DEFAULT="credit2"
-# CONFIG_LIVEPATCH is not set
-CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS=y
-CONFIG_CMDLINE=""
-CONFIG_DOM0_MEM=""
-
-#
-# Device Drivers
-#
-CONFIG_HAS_NS16550=y
-CONFIG_HAS_CADENCE_UART=y
-CONFIG_HAS_MVEBU=y
-CONFIG_HAS_PL011=y
-CONFIG_HAS_SCIF=y
-CONFIG_HAS_PASSTHROUGH=y
-CONFIG_ARM_SMMU=y
-CONFIG_DEFCONFIG_LIST="arch/arm/configs/arm64_defconfig"
-
-#
-# Debugging Options
-#
-# CONFIG_DEBUG is not set
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp/early-printk.cfg b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp/early-printk.cfg
new file mode 100644
index 0000000..590ae3a
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp/early-printk.cfg
@@ -0,0 +1,2 @@
+CONFIG_DEBUG=y
+CONFIG_EARLY_PRINTK_FASTMODEL=y
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/juno/defconfig b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/juno/defconfig
deleted file mode 100644
index f13327c..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/juno/defconfig
+++ /dev/null
@@ -1,73 +0,0 @@
-#
-# Automatically generated file; DO NOT EDIT.
-# Xen/arm 4.12.0 Configuration
-#
-CONFIG_64BIT=y
-CONFIG_ARM_64=y
-CONFIG_ARM=y
-CONFIG_ARCH_DEFCONFIG="arch/arm/configs/arm64_defconfig"
-
-#
-# Architecture Features
-#
-CONFIG_NR_CPUS=128
-CONFIG_GICV3=y
-CONFIG_HVM=y
-# CONFIG_NEW_VGIC is not set
-CONFIG_SBSA_VUART_CONSOLE=y
-CONFIG_ARM_SSBD=y
-CONFIG_HARDEN_BRANCH_PREDICTOR=y
-
-#
-# ARM errata workaround via the alternative framework
-#
-CONFIG_ARM64_ERRATUM_827319=y
-CONFIG_ARM64_ERRATUM_824069=y
-CONFIG_ARM64_ERRATUM_819472=y
-CONFIG_ARM64_ERRATUM_832075=y
-CONFIG_ARM64_ERRATUM_834220=y
-CONFIG_ARM64_HARDEN_BRANCH_PREDICTOR=y
-CONFIG_ALL_PLAT=y
-# CONFIG_QEMU is not set
-# CONFIG_RCAR3 is not set
-# CONFIG_MPSOC is not set
-# CONFIG_NO_PLAT is not set
-CONFIG_ALL64_PLAT=y
-# CONFIG_ALL32_PLAT is not set
-CONFIG_MPSOC_PLATFORM=y
-
-#
-# Common Features
-#
-CONFIG_HAS_ALTERNATIVE=y
-CONFIG_HAS_DEVICE_TREE=y
-CONFIG_MEM_ACCESS=y
-CONFIG_HAS_PDX=y
-# CONFIG_XSM is not set
-CONFIG_SCHED_CREDIT=y
-CONFIG_SCHED_CREDIT2=y
-CONFIG_SCHED_RTDS=y
-# CONFIG_SCHED_ARINC653 is not set
-CONFIG_SCHED_NULL=y
-CONFIG_SCHED_DEFAULT="credit2"
-# CONFIG_LIVEPATCH is not set
-CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS=y
-CONFIG_CMDLINE=""
-CONFIG_DOM0_MEM=""
-
-#
-# Device Drivers
-#
-CONFIG_HAS_NS16550=y
-CONFIG_HAS_CADENCE_UART=y
-CONFIG_HAS_MVEBU=y
-CONFIG_HAS_PL011=y
-CONFIG_HAS_SCIF=y
-CONFIG_HAS_PASSTHROUGH=y
-CONFIG_ARM_SMMU=y
-CONFIG_DEFCONFIG_LIST="arch/arm/configs/arm64_defconfig"
-
-#
-# Debugging Options
-#
-# CONFIG_DEBUG is not set
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/juno/early-printk.cfg b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/juno/early-printk.cfg
new file mode 100644
index 0000000..35b4741
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/juno/early-printk.cfg
@@ -0,0 +1,2 @@
+CONFIG_DEBUG=y
+CONFIG_EARLY_PRINTK_JUNO=y
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/defconfig b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/defconfig
deleted file mode 100644
index e8a88c1..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/defconfig
+++ /dev/null
@@ -1,100 +0,0 @@
-#
-# Automatically generated file; DO NOT EDIT.
-# Xen/arm 4.12.2 Configuration
-#
-CONFIG_64BIT=y
-CONFIG_ARM_64=y
-CONFIG_ARM=y
-CONFIG_ARCH_DEFCONFIG="arch/arm/configs/arm64_defconfig"
-
-#
-# Architecture Features
-#
-CONFIG_NR_CPUS=128
-CONFIG_ACPI=y
-CONFIG_GICV3=y
-CONFIG_HAS_ITS=y
-CONFIG_HVM=y
-# CONFIG_NEW_VGIC is not set
-CONFIG_SBSA_VUART_CONSOLE=y
-CONFIG_ARM_SSBD=y
-CONFIG_HARDEN_BRANCH_PREDICTOR=y
-
-#
-# ARM errata workaround via the alternative framework
-#
-CONFIG_ARM64_ERRATUM_827319=y
-CONFIG_ARM64_ERRATUM_824069=y
-CONFIG_ARM64_ERRATUM_819472=y
-CONFIG_ARM64_ERRATUM_832075=y
-CONFIG_ARM64_ERRATUM_834220=y
-CONFIG_ARM64_HARDEN_BRANCH_PREDICTOR=y
-CONFIG_ALL_PLAT=y
-# CONFIG_QEMU is not set
-# CONFIG_RCAR3 is not set
-# CONFIG_MPSOC is not set
-# CONFIG_NO_PLAT is not set
-CONFIG_ALL64_PLAT=y
-# CONFIG_ALL32_PLAT is not set
-CONFIG_MPSOC_PLATFORM=y
-
-#
-# Common Features
-#
-CONFIG_HAS_ALTERNATIVE=y
-CONFIG_HAS_DEVICE_TREE=y
-# CONFIG_MEM_ACCESS is not set
-CONFIG_HAS_PDX=y
-# CONFIG_TMEM is not set
-CONFIG_XSM=y
-CONFIG_XSM_FLASK=y
-CONFIG_XSM_FLASK_AVC_STATS=y
-# CONFIG_XSM_FLASK_POLICY is not set
-CONFIG_XSM_SILO=y
-# CONFIG_XSM_DUMMY_DEFAULT is not set
-# CONFIG_XSM_FLASK_DEFAULT is not set
-CONFIG_XSM_SILO_DEFAULT=y
-# CONFIG_ARGO is not set
-
-#
-# Schedulers
-#
-CONFIG_SCHED_CREDIT=y
-CONFIG_SCHED_CREDIT2=y
-CONFIG_SCHED_RTDS=y
-# CONFIG_SCHED_ARINC653 is not set
-CONFIG_SCHED_NULL=y
-# CONFIG_SCHED_CREDIT_DEFAULT is not set
-CONFIG_SCHED_CREDIT2_DEFAULT=y
-# CONFIG_SCHED_RTDS_DEFAULT is not set
-# CONFIG_SCHED_NULL_DEFAULT is not set
-CONFIG_SCHED_DEFAULT="credit2"
-# CONFIG_LIVEPATCH is not set
-CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS=y
-CONFIG_CMDLINE=""
-CONFIG_DOM0_MEM=""
-
-#
-# Device Drivers
-#
-CONFIG_HAS_NS16550=y
-CONFIG_HAS_CADENCE_UART=y
-CONFIG_HAS_MVEBU=y
-CONFIG_HAS_PL011=y
-CONFIG_HAS_SCIF=y
-CONFIG_HAS_PASSTHROUGH=y
-CONFIG_ARM_SMMU=y
-CONFIG_DEFCONFIG_LIST="arch/arm/configs/arm64_defconfig"
-
-#
-# Debugging Options
-#
-# CONFIG_DEBUG is not set
-CONFIG_DEBUG_INFO=y
-# CONFIG_FRAME_POINTER is not set
-# CONFIG_COVERAGE is not set
-# CONFIG_LOCK_PROFILE is not set
-# CONFIG_PERF_COUNTERS is not set
-CONFIG_VERBOSE_DEBUG=y
-# CONFIG_DEVICE_TREE_DEBUG is not set
-# CONFIG_SCRUB_DEBUG is not set
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/early-printk.cfg b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/early-printk.cfg
new file mode 100644
index 0000000..56ab0e2
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/early-printk.cfg
@@ -0,0 +1,3 @@
+CONFIG_DEBUG=y
+CONFIG_EARLY_UART_CHOICE_PL011=y
+CONFIG_EARLY_UART_BASE_ADDRESS=0x2a400000
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/n1sdp.cfg b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/n1sdp.cfg
new file mode 100644
index 0000000..d4d7c60
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/n1sdp.cfg
@@ -0,0 +1,5 @@
+CONFIG_EXPERT=y
+# Enable ACPI support
+CONFIG_ACPI=y
+# Enable ARM Interrupt Translation Service (ITS) emulation
+CONFIG_HAS_ITS=y
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
index 5e58ab1..89130a6 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
@@ -1,27 +1,20 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
-
-# Machine specific settings
-XEN_CONFIG_EARLY_PRINTK_juno = "juno"
-XEN_CONFIG_EARLY_PRINTK_fvp-base = "fastmodel"
-XEN_CONFIG_EARLY_PRINTK_foundation-armv8 = "fastmodel"
-XEN_CONFIG_EARLY_PRINTK_n1sdp = "pl011,0x2a400000"
-
 # Foundation-armv8 support
 COMPATIBLE_MACHINE_foundation-armv8 = "foundation-armv8"
-
-SRC_URI_append_foundation-armv8 = " file://fvp/defconfig"
+FILESEXTRAPATHS_prepend_foundation-armv8 := "${THISDIR}/files/fvp:"
+SRC_URI_append_foundation-armv8 = " file://early-printk.cfg"
 
 # FVP Base support
 COMPATIBLE_MACHINE_fvp-base = "fvp-base"
-
-SRC_URI_append_fvp-base = " file://fvp/defconfig"
+FILESEXTRAPATHS_prepend_fvp-base := "${THISDIR}/files/fvp:"
+SRC_URI_append_fvp-base = " file://early-printk.cfg"
 
 # Juno support
 COMPATIBLE_MACHINE_juno = "juno"
-
-SRC_URI_append_juno = " file://juno/defconfig"
+FILESEXTRAPATHS_prepend_juno := "${THISDIR}/files:"
+SRC_URI_append_juno = " file://early-printk.cfg"
 
 # N1SDP support
 COMPATIBLE_MACHINE_n1sdp = "n1sdp"
-
-SRC_URI_append_n1sdp = " file://n1sdp/defconfig"
+FILESEXTRAPATHS_prepend_n1sdp := "${THISDIR}/files:"
+SRC_URI_append_n1sdp = " file://n1sdp.cfg \
+                         file://early-printk.cfg"
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
index 846d244..c7f3643 100644
--- a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
+++ b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
@@ -1,12 +1,3 @@
-#
-# Define early console based on board parameters
-#
-
-XEN_CONFIG_EARLY_PRINTK ??= "disable"
-
-EXTRA_OEMAKE += "${@bb.utils.contains('XEN_CONFIG_EARLY_PRINTK', 'disable', \
-    '', ' CONFIG_DEBUG=y CONFIG_EARLY_PRINTK=${XEN_CONFIG_EARLY_PRINTK}',d)}"
-
 # Make Xen machine specific
 # This ensures that sstate is properly handled and that each machine can have
 # its own configuration
-- 
2.7.4

