Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.41])
 by mx.groups.io with SMTP id smtpd.web10.395.1588955676525903926
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 May 2020 09:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=rRd221cd;
 spf=pass (domain: arm.com, ip: 40.107.6.41, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jy87ii0o/IpobRHZmSUuTbI6503JgXjxQE7EDw0FcTo=;
 b=rRd221cd8pev/bxXiZMlM9soPKNIlW4WB6GPCrDBblFpzfeHAUSWA8qp7BEyRy5vaS/+vuhG8Ca74+SMpiebl00z2yLP3Z0AJIZMb4pGU+c3QiFuakc+tr1EUVkxfT95KjLTOGg5rjrnNdoyKpgdZ5DzttwWtjWcTwD0exowvJ8=
Received: from AM3PR05CA0143.eurprd05.prod.outlook.com (2603:10a6:207:3::21)
 by HE1PR0801MB1881.eurprd08.prod.outlook.com (2603:10a6:3:55::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Fri, 8 May
 2020 16:34:33 +0000
Received: from AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:207:3:cafe::79) by AM3PR05CA0143.outlook.office365.com
 (2603:10a6:207:3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Fri, 8 May 2020 16:34:33 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT025.mail.protection.outlook.com (10.152.16.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Fri, 8 May 2020 16:34:32 +0000
Received: ("Tessian outbound e88319d7ccd0:v54"); Fri, 08 May 2020 16:34:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0775ce2b4db12658
X-CR-MTA-TID: 64aa7808
Received: from 21fbc336ee7d.5
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4955C840-7429-492E-8C22-9848E4EEAE65.1;
	Fri, 08 May 2020 16:34:27 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 21fbc336ee7d.5
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 08 May 2020 16:34:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcQyKrLzinBm8Ab4SPsTjjF+47Mldz3Xsaf+HX9GhvWIM3GfvjN4z1b8JNbPhkDxUrD43LamrZiJY4Y5qNYxm1te5vNOrj9utgwVD4hbujfrugnlUn/snXFFA9QGxZ2QsaUzNFariHuu72d9lCHk5LBNfgxxnWC32tS+x7pcPy5MuMBxmd+3lmtj8SR+F/TNJ8x5xya8eykicJCHBJD1n8KRcLSWYdpCsNHR0OYxEoqZkx26sSK4k/8/sFQALlQ5HGZbqweJ1Dnz9ro3bobtEJF5qrf+9LHmC8fJ8kpiCEbid87u/HPnEyXXn3cUqoR1f+Ahc7tGQsvZQhkMGTssEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jy87ii0o/IpobRHZmSUuTbI6503JgXjxQE7EDw0FcTo=;
 b=I8X3j0Xljo3tdUxPNmyl06muB7JN/UXNBfEavQCsfsnELfeHHfBOj62IUyBLnRUHGZs5yq/3tJ7HGkrxOoOkJ3X71gnTsC7KO/xSPiSqAES7twxG0ueutThcykiiOZVM73z0DLFYx+0UPjnvncZJbdeXpluVGEP5b1NWd6R6jUpB6yCT4pLJaFqSTngtJD7tKAYSv+CV0yQdqIxgXQmLy+7uyk5WYG7X+JkChw35nW+qotw7qPn4MtYerwyc2zj7JHzaF1MZQ8p5LT0IJDIkT9XFjs4/+nrdmQ3/q3z7o8TWPf0/4JhZ/mm5i9EQI4fKb6buxKS5l4Q74VNieAmkvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jy87ii0o/IpobRHZmSUuTbI6503JgXjxQE7EDw0FcTo=;
 b=rRd221cd8pev/bxXiZMlM9soPKNIlW4WB6GPCrDBblFpzfeHAUSWA8qp7BEyRy5vaS/+vuhG8Ca74+SMpiebl00z2yLP3Z0AJIZMb4pGU+c3QiFuakc+tr1EUVkxfT95KjLTOGg5rjrnNdoyKpgdZ5DzttwWtjWcTwD0exowvJ8=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3484.eurprd08.prod.outlook.com (2603:10a6:10:45::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.30; Fri, 8 May
 2020 16:34:23 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2958.034; Fri, 8 May 2020
 16:34:23 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/4] arm-bsp: Add linaro-arm-linux 5.4 kernel support
Date: Fri,  8 May 2020 17:34:00 +0100
Message-Id: <20200508163403.5987-2-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508163403.5987-1-bertrand.marquis@arm.com>
References: <20200508163403.5987-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::31) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.52) by LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.30 via Frontend Transport; Fri, 8 May 2020 16:34:23 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 391aa69d-fc5c-43da-d398-08d7f36daffe
X-MS-TrafficTypeDiagnostic: DB7PR08MB3484:|HE1PR0801MB1881:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB1881751EE99C8484A99DFB419DA20@HE1PR0801MB1881.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;OLM:3631;
X-Forefront-PRVS: 039735BC4E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 7n9yeCPBHlKFtm811y+1LbDyWptGpq8NDFao9OnsZdyRhSAMQVC2O86NsULcyq/8nVBllIUfiGIayowY+wwIoQglVjDd5LXhRlPBIuomn102GodSOwETE9lLdcbZjVxVVkHSIrpkb1I1XyiTND6vLh7V0EfgtUOt5eOZblqGn9r3VX78TB0CKikp9Q7wDDciV75tM+0R3EnEy2zUjgwR/zoXTUgaSQyydLdxKyfyNH5QGGHniIWawPtPKmAnjeF1pEgrryZy7V9uohrC9HATHKMGdGm1oCVj3fzrowcWizIHNjM8jFCb25kB3VH4wZmfzvYopP6UK5pUlWJNKHHXN92C3Pe7XXBBuf918GiNlzWhZAEOm56zlNKPbnWeV6w3Tzo7U8tMRIOH0iadiuwICiwafj8oCgBy3QskUqneyr3bi3SaQQhBxrZgsgHIvVxQG3JpP/NzlGfZbnmc3sXGyztOitLpTZCp4+G17YOg223xslOTLeL8H429eQXMLv9T4YVh+OVQz5gnnHjr2VmCkw/l8OZJckBiOr6euGyzlX49ZxOgHplr7Ab73Xo7rgmT6xr/+1c/FymV/h8PftBMfPTAvsOb6GMgFP31C0Jj7QitGJQyto6ukqc+a4WTc2fHhLqlQB9Idou+04dJ9nq5v358NYV8zboeUU9DwObleyc=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(33430700001)(7696005)(52116002)(5660300002)(2616005)(19627235002)(6916009)(26005)(4326008)(66946007)(16526019)(44832011)(316002)(1076003)(36756003)(6486002)(186003)(956004)(83320400001)(8936002)(83280400001)(478600001)(83310400001)(8676002)(2906002)(6666004)(66476007)(33440700001)(86362001)(66556008)(30864003)(83290400001)(83300400001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 g3vqGsBJ7srx4Vo1ScOfzP+cu0Qkg91CvRM6JnI0FKQLhspD8i4O/V9zLdKqZ616+XBIWC6sXpfJ1doE8KGrAAGlYoiV5n33STcBKtzDyqt//3TB8zqSN2aBsuJDjn/QHsaJC9JqA6COdQosG3X0JrhQRDE3k2pWPMG1yuBbOM4yb033r5sL/VcFfLprr/kBTltIzsHDAd7ScB0EeX09oiJeTJjy1Vv8LE4Oyi7fDUZuXIZ+ERWuOUIUan2UkqDj3N5J7GUHFgLNhQ5RPTUzrWt/yffOJn2ZhAswbhr1eb7aSc3mdMX2tl/MoW7nqlXTnGGre0TABwemFCJVfJMGw5MvFUMxzttPRWvDWRdj9udtpkVwcN92e4u23mq0VxCDSELvZma9mCd2K8JlukogcL8mXgJ0wG0Zn961nrr7DN1kruKZAOsCrcyL5YNK2L1dn9k3PIc79IGKla6rvcd5q96EVtEfp3EWfKC+uR7OOmNNqyuPsHPMTrWdEvxRZq5k
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3484
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(46966005)(33430700001)(316002)(81166007)(6666004)(33440700001)(82310400002)(26005)(36906005)(356005)(86362001)(2616005)(4326008)(44832011)(70206006)(1076003)(70586007)(8936002)(956004)(8676002)(7696005)(5660300002)(47076004)(6486002)(2906002)(30864003)(36756003)(186003)(16526019)(19627235002)(478600001)(6916009)(82740400003)(336012)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b9bd6d6e-16a6-4491-629e-08d7f36daa7f
X-Forefront-PRVS: 039735BC4E
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qHRLHHh40kqngSX5m46evFTHGPZKMF/Tk3G22w+4S6Tne58aa39TRMlFKRC6QEzluQSkn0E+KrluIH+uT1RadQCvhNWym2QFHdU5wE+rJUXro79RohGPqLpYbc83Gg7k5a4abcbD5yAfFEsx9POTsBQgV/nNkrxy0G4cuABgRpACDBZY5rF523acWCZjEcnBLd/1ZSdXx6bfX3Hgcb+WQVUszWQW+gjlwxNoWcXqAel2d0PPS+0OGLdIJacoPIcIHplVAKfHPM3m1sBBnoX/B8a4AD7l3fiBeMS9aiQGXGGbEzjsQXFewVVY8hwYhWxKHknw2u/XB45E+5uTVkAL5GKC7aD/2JGi4amWEpC1aA/WqJj1hgJO16oHjrknzvMNI5bHFoeMzqM0+Z415kbgKPLFJzpd8whIMj4xsrpKo9UZ8gTsKAHXX3KCriz5gZgEc7gEdEZlQeTVlc/r0ZySVyU2RESyu05Q0+tWw70jjROTQhKK9HlcXATjhjNEerylo+0KYMAsVlOBk0cnlFFgUo3tB5jxAgSmtwelrapfLgfZkhau6Q4D2xBWfR1vgh7iGi9/vDf7P/sJ23kYBUItuk90UA+tDWMULGlX/6+Gnj88t4u8IeY5iHLThyEv8OpWBPCr/CK7Kcf3RP/x96Ru0Zn9trg8vz1lQJ5YRr1zbeWUulcWXXCnlwYzdpeEx3h6QWYlvUVzDzAovgIVL95+cg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2020 16:34:32.5212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 391aa69d-fc5c-43da-d398-08d7f36daffe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1881
Content-Type: text/plain

From: Khasim Syed Mohammed <khasim.mohammed@arm.com>

- Add support to fetch and build linaro-arm linux version 5.4 for N1SDP platform
- Add addtional N1SDP specific changes as patches
- Include intree default config

Issue-Id: PLATFORMS-3134

Change-Id: I3b4cf4b1de509beaa3862e1cad37ec2d88b7054d
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 ...arm-smmu-v3-Ignore-IOPF-capabilities.patch |  46 +++
 ...irk-add-acs-override-for-PCI-devices.patch | 156 +++++++++
 ...-for-the-Arm-Neoverse-N1SDP-platform.patch | 318 ++++++++++++++++++
 ...e-n1sdp-pci-quirk-for-SR-IOV-support.patch |  51 +++
 .../linux/linux-linaro-arm_5.4.bb             |  18 +
 .../linux/linux-linaro-arm_5.4.bbappend       |  25 ++
 6 files changed, 614 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0001-TMP-iommu-arm-smmu-v3-Ignore-IOPF-capabilities.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0002-pci_quirk-add-acs-override-for-PCI-devices.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0004-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0001-TMP-iommu-arm-smmu-v3-Ignore-IOPF-capabilities.patch b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0001-TMP-iommu-arm-smmu-v3-Ignore-IOPF-capabilities.patch
new file mode 100644
index 0000000..e1ff4a5
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0001-TMP-iommu-arm-smmu-v3-Ignore-IOPF-capabilities.patch
@@ -0,0 +1,46 @@
+From 4ebcbe09471d6b6b18fce42993489bed3801f10c Mon Sep 17 00:00:00 2001
+From: Jean-Philippe Brucker <jean-philippe@linaro.org>
+Date: Fri, 24 Jan 2020 10:17:14 +0100
+Subject: [PATCH 1/4] TMP: iommu/arm-smmu-v3: Ignore IOPF capabilities
+
+Don't mandate PRI or stall to enable SVA. Some devices have their own
+method for managing I/O page faults when they notice a translation
+request that fails.
+
+Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
+---
+ drivers/iommu/arm-smmu-v3.c | 18 +++++++++++++++++-
+ 1 file changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
+index fed6a9d5867e..a8d7d6ccbb21 100644
+--- a/drivers/iommu/arm-smmu-v3.c
++++ b/drivers/iommu/arm-smmu-v3.c
+@@ -3276,7 +3276,23 @@ static bool arm_smmu_ats_supported(struct arm_smmu_master *master)
+ 
+ static bool arm_smmu_iopf_supported(struct arm_smmu_master *master)
+ {
+-	return master->stall_enabled || master->pri_supported;
++	/* return master->stall_enabled || master->pri_supported; */
++
++	/*
++	 * FIXME: this temporary hack allows enabling SVA for any endpoint even
++	 * when they don't have PRI/stall.
++	 *
++	 * To implement this more cleanly, we need a third method, complementing
++	 * stall_enabled and pri_supported, to enable IOPF. A bit that says
++	 * "this device's page faults are handled out of band", called for
++	 * example master->oob_iopf. How to set it?  It can easily be a firmware
++	 * quirk, but that does not suffice in my opinion. We need to know that
++	 * there is software ready to handle these page faults. The device
++	 * driver owning this endpoint could for example call
++	 * iommu_dev_enable_feature(dev, IOMMU_DEV_FEAT_OOB_IOPF), before
++	 * enabling IOMMU_DEV_FEAT_SVA.
++	 */
++	return true;
+ }
+ 
+ static void arm_smmu_enable_ats(struct arm_smmu_master *master)
+-- 
+2.25.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0002-pci_quirk-add-acs-override-for-PCI-devices.patch b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0002-pci_quirk-add-acs-override-for-PCI-devices.patch
new file mode 100644
index 0000000..a66083a
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0002-pci_quirk-add-acs-override-for-PCI-devices.patch
@@ -0,0 +1,156 @@
+From 224e4adc6bc6a23f5deb3e1ebea03a85e3cad606 Mon Sep 17 00:00:00 2001
+From: Manoj Kumar <manoj.kumar3@arm.com>
+Date: Mon, 3 Feb 2020 10:11:19 +0000
+Subject: [PATCH 2/4] pci_quirk: add acs override for PCI devices
+
+Patch taken from:
+https://gitlab.com/Queuecumber/linux-acs-override/raw/master/workspaces/5.4/acso.patch
+
+Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
+---
+ .../admin-guide/kernel-parameters.txt         |   9 ++
+ drivers/pci/quirks.c                          | 101 ++++++++++++++++++
+ 2 files changed, 110 insertions(+)
+
+diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
+index 8d7932502edc..f2be8337e98c 100644
+--- a/Documentation/admin-guide/kernel-parameters.txt
++++ b/Documentation/admin-guide/kernel-parameters.txt
+@@ -3423,6 +3423,15 @@
+ 		nomsi		[MSI] If the PCI_MSI kernel config parameter is
+ 				enabled, this kernel boot option can be used to
+ 				disable the use of MSI interrupts system-wide.
++		pcie_acs_override =
++					[PCIE] Override missing PCIe ACS support for:
++				downstream
++					All downstream ports - full ACS capabilities
++				multfunction
++					All multifunction devices - multifunction ACS subset
++				id:nnnn:nnnn
++					Specfic device - full ACS capabilities
++					Specified as vid:did (vendor/device ID) in hex
+ 		noioapicquirk	[APIC] Disable all boot interrupt quirks.
+ 				Safety option to keep boot IRQs enabled. This
+ 				should never be necessary.
+diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
+index d134e12aab9d..9067bc7833be 100644
+--- a/drivers/pci/quirks.c
++++ b/drivers/pci/quirks.c
+@@ -3494,6 +3494,106 @@ static void quirk_no_bus_reset(struct pci_dev *dev)
+ 	dev->dev_flags |= PCI_DEV_FLAGS_NO_BUS_RESET;
+ }
+ 
++static bool acs_on_downstream;
++static bool acs_on_multifunction;
++
++#define NUM_ACS_IDS 16
++struct acs_on_id {
++	unsigned short vendor;
++	unsigned short device;
++};
++static struct acs_on_id acs_on_ids[NUM_ACS_IDS];
++static u8 max_acs_id;
++
++static __init int pcie_acs_override_setup(char *p)
++{
++	if (!p)
++		return -EINVAL;
++
++	while (*p) {
++		if (!strncmp(p, "downstream", 10))
++			acs_on_downstream = true;
++		if (!strncmp(p, "multifunction", 13))
++			acs_on_multifunction = true;
++		if (!strncmp(p, "id:", 3)) {
++			char opt[5];
++			int ret;
++			long val;
++
++			if (max_acs_id >= NUM_ACS_IDS - 1) {
++				pr_warn("Out of PCIe ACS override slots (%d)\n",
++						NUM_ACS_IDS);
++				goto next;
++			}
++
++			p += 3;
++			snprintf(opt, 5, "%s", p);
++			ret = kstrtol(opt, 16, &val);
++			if (ret) {
++				pr_warn("PCIe ACS ID parse error %d\n", ret);
++				goto next;
++			}
++			acs_on_ids[max_acs_id].vendor = val;
++
++			p += strcspn(p, ":");
++			if (*p != ':') {
++				pr_warn("PCIe ACS invalid ID\n");
++				goto next;
++			}
++
++			p++;
++			snprintf(opt, 5, "%s", p);
++			ret = kstrtol(opt, 16, &val);
++			if (ret) {
++				pr_warn("PCIe ACS ID parse error %d\n", ret);
++				goto next;
++			}
++			acs_on_ids[max_acs_id].device = val;
++			max_acs_id++;
++		}
++next:
++		p += strcspn(p, ",");
++		if (*p == ',')
++			p++;
++	}
++
++	if (acs_on_downstream || acs_on_multifunction || max_acs_id)
++		pr_warn("Warning: PCIe ACS overrides enabled; This may allow non-IOMMU protected peer-to-peer DMA\n");
++
++	return 0;
++}
++early_param("pcie_acs_override", pcie_acs_override_setup);
++
++static int pcie_acs_overrides(struct pci_dev *dev, u16 acs_flags)
++{
++	int i;
++
++	/* Never override ACS for legacy devices or devices with ACS caps */
++	if (!pci_is_pcie(dev) ||
++		pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ACS))
++			return -ENOTTY;
++
++	for (i = 0; i < max_acs_id; i++)
++		if (acs_on_ids[i].vendor == dev->vendor &&
++			acs_on_ids[i].device == dev->device)
++				return 1;
++
++	switch (pci_pcie_type(dev)) {
++	case PCI_EXP_TYPE_DOWNSTREAM:
++	case PCI_EXP_TYPE_ROOT_PORT:
++		if (acs_on_downstream)
++			return 1;
++		break;
++	case PCI_EXP_TYPE_ENDPOINT:
++	case PCI_EXP_TYPE_UPSTREAM:
++	case PCI_EXP_TYPE_LEG_END:
++	case PCI_EXP_TYPE_RC_END:
++		if (acs_on_multifunction && dev->multifunction)
++			return 1;
++	}
++
++	return -ENOTTY;
++}
+ /*
+  * Some Atheros AR9xxx and QCA988x chips do not behave after a bus reset.
+  * The device will throw a Link Down error on AER-capable systems and
+@@ -4674,6 +4774,7 @@ static const struct pci_dev_acs_enabled {
+ 	{ PCI_VENDOR_ID_BROADCOM, 0xD714, pci_quirk_brcm_acs },
+ 	/* Amazon Annapurna Labs */
+ 	{ PCI_VENDOR_ID_AMAZON_ANNAPURNA_LABS, 0x0031, pci_quirk_al_acs },
++   { PCI_ANY_ID, PCI_ANY_ID, pcie_acs_overrides },
+ 	{ 0 }
+ };
+ 
+-- 
+2.25.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
new file mode 100644
index 0000000..d827e9d
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
@@ -0,0 +1,318 @@
+From 813f6c6015c75caf25553cd2e36361bac9151145 Mon Sep 17 00:00:00 2001
+From: Deepak Pandey <Deepak.Pandey@arm.com>
+Date: Mon, 9 Dec 2019 16:06:38 +0000
+Subject: [PATCH 3/4] pcie: Add quirk for the Arm Neoverse N1SDP platform
+
+The Arm N1SDP SoC suffers from some PCIe integration issues, most
+prominently config space accesses to not existing BDFs being answered
+with a bus abort, resulting in an SError.
+To mitigate this, the firmware scans the bus before boot (catching the
+SErrors) and creates a table with valid BDFs, which acts as a filter for
+Linux' config space accesses.
+
+Add code consulting the table as an ACPI PCIe quirk, also register the
+corresponding device tree based description of the host controller.
+Also fix the other two minor issues on the way, namely not being fully
+ECAM compliant and config space accesses being restricted to 32-bit
+accesses only.
+
+This allows the Arm Neoverse N1SDP board to boot Linux without crashing
+and to access *any* devices (there are no platform devices except UART).
+
+Signed-off-by: Deepak Pandey <Deepak.Pandey@arm.com>
+[Sudipto: extend to cover the CCIX root port as well]
+Signed-off-by: Sudipto Paul <sudipto.paul@arm.com>
+[Andre: fix coding style issues, rewrite some parts, add DT support]
+Signed-off-by: Andre Przywara <andre.przywara@arm.com>
+---
+ arch/arm64/configs/defconfig        |   1 +
+ drivers/acpi/pci_mcfg.c             |   7 +
+ drivers/pci/controller/Kconfig      |  11 ++
+ drivers/pci/controller/Makefile     |   1 +
+ drivers/pci/controller/pcie-n1sdp.c | 196 ++++++++++++++++++++++++++++
+ include/linux/pci-ecam.h            |   2 +
+ 6 files changed, 218 insertions(+)
+ create mode 100644 drivers/pci/controller/pcie-n1sdp.c
+
+diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
+index 619a892148fb..56f00e82a4c4 100644
+--- a/arch/arm64/configs/defconfig
++++ b/arch/arm64/configs/defconfig
+@@ -177,6 +177,7 @@ CONFIG_NET_9P=y
+ CONFIG_NET_9P_VIRTIO=y
+ CONFIG_PCI=y
+ CONFIG_PCIEPORTBUS=y
++CONFIG_PCI_QUIRKS=y
+ CONFIG_PCI_IOV=y
+ CONFIG_HOTPLUG_PCI=y
+ CONFIG_HOTPLUG_PCI_ACPI=y
+diff --git a/drivers/acpi/pci_mcfg.c b/drivers/acpi/pci_mcfg.c
+index 6b347d9920cc..7a2b41b9ab57 100644
+--- a/drivers/acpi/pci_mcfg.c
++++ b/drivers/acpi/pci_mcfg.c
+@@ -142,6 +142,13 @@ static struct mcfg_fixup mcfg_quirks[] = {
+ 	XGENE_V2_ECAM_MCFG(4, 0),
+ 	XGENE_V2_ECAM_MCFG(4, 1),
+ 	XGENE_V2_ECAM_MCFG(4, 2),
++
++#define N1SDP_ECAM_MCFG(rev, seg, ops) \
++	{"ARMLTD", "ARMN1SDP", rev, seg, MCFG_BUS_ANY, ops }
++
++	/* N1SDP SoC with v1 PCIe controller */
++	N1SDP_ECAM_MCFG(0x20181101, 0, &pci_n1sdp_pcie_ecam_ops),
++	N1SDP_ECAM_MCFG(0x20181101, 1, &pci_n1sdp_ccix_ecam_ops),
+ };
+ 
+ static char mcfg_oem_id[ACPI_OEM_ID_SIZE];
+diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
+index 70e078238899..03860176e339 100644
+--- a/drivers/pci/controller/Kconfig
++++ b/drivers/pci/controller/Kconfig
+@@ -65,6 +65,17 @@ config PCI_FTPCI100
+ 	depends on OF
+ 	default ARCH_GEMINI
+ 
++config PCIE_HOST_N1SDP_ECAM
++	bool "ARM N1SDP PCIe Controller"
++	depends on ARM64
++	depends on OF || (ACPI && PCI_QUIRKS)
++	select PCI_HOST_COMMON
++	default y if ARCH_VEXPRESS
++	help
++	  Say Y here if you want PCIe support for the Arm N1SDP platform.
++	  The controller is ECAM compliant, but needs a quirk to workaround
++	  an integration issue.
++
+ config PCI_TEGRA
+ 	bool "NVIDIA Tegra PCIe controller"
+ 	depends on ARCH_TEGRA || COMPILE_TEST
+diff --git a/drivers/pci/controller/Makefile b/drivers/pci/controller/Makefile
+index a2a22c9d91af..7ea98c5a04ec 100644
+--- a/drivers/pci/controller/Makefile
++++ b/drivers/pci/controller/Makefile
+@@ -30,6 +30,7 @@ obj-$(CONFIG_PCIE_MEDIATEK) += pcie-mediatek.o
+ obj-$(CONFIG_PCIE_MOBIVEIL) += pcie-mobiveil.o
+ obj-$(CONFIG_PCIE_TANGO_SMP8759) += pcie-tango.o
+ obj-$(CONFIG_VMD) += vmd.o
++obj-$(CONFIG_PCIE_HOST_N1SDP_ECAM) += pcie-n1sdp.o
+ # pcie-hisi.o quirks are needed even without CONFIG_PCIE_DW
+ obj-y				+= dwc/
+ 
+diff --git a/drivers/pci/controller/pcie-n1sdp.c b/drivers/pci/controller/pcie-n1sdp.c
+new file mode 100644
+index 000000000000..620ab221466c
+--- /dev/null
++++ b/drivers/pci/controller/pcie-n1sdp.c
+@@ -0,0 +1,196 @@
++// SPDX-License-Identifier: GPL-2.0
++/*
++ * Copyright (C) 2018/2019 ARM Ltd.
++ *
++ * This quirk is to mask the following issues:
++ * - PCIE SLVERR: config space accesses to invalid PCIe BDFs cause a bus
++ *		  error (signalled as an asynchronous SError)
++ * - MCFG BDF mapping: the root complex is mapped separately from the device
++ *		       config space
++ * - Non 32-bit accesses to config space are not supported.
++ *
++ * At boot time the SCP board firmware creates a discovery table with
++ * the root complex' base address and the valid BDF values, discovered while
++ * scanning the config space and catching the SErrors.
++ * Linux responds only to the EPs listed in this table, returning NULL
++ * for the rest.
++ */
++
++#include <linux/kernel.h>
++#include <linux/init.h>
++#include <linux/ioport.h>
++#include <linux/sizes.h>
++#include <linux/of_pci.h>
++#include <linux/of.h>
++#include <linux/pci-ecam.h>
++#include <linux/platform_device.h>
++#include <linux/module.h>
++
++/* Platform specific values as hardcoded in the firmware. */
++#define AP_NS_SHARED_MEM_BASE	0x06000000
++#define MAX_SEGMENTS		2		/* Two PCIe root complexes. */
++#define BDF_TABLE_SIZE		SZ_16K
++
++/*
++ * Shared memory layout as written by the SCP upon boot time:
++ *  ----
++ *  Discover data header --> RC base address
++ *                       \-> BDF Count
++ *  Discover data        --> BDF 0...n
++ *  ----
++ */
++struct pcie_discovery_data {
++	u32 rc_base_addr;
++	u32 nr_bdfs;
++	u32 valid_bdfs[0];
++} *pcie_discovery_data[MAX_SEGMENTS];
++
++void __iomem *rc_remapped_addr[MAX_SEGMENTS];
++
++/*
++ * map_bus() is called before we do a config space access for a certain
++ * device. We use this to check whether this device is valid, avoiding
++ * config space accesses which would result in an SError otherwise.
++ */
++static void __iomem *pci_n1sdp_map_bus(struct pci_bus *bus, unsigned int devfn,
++				       int where)
++{
++	struct pci_config_window *cfg = bus->sysdata;
++	unsigned int devfn_shift = cfg->ops->bus_shift - 8;
++	unsigned int busn = bus->number;
++	unsigned int segment = bus->domain_nr;
++	unsigned int bdf_addr;
++	unsigned int table_count, i;
++
++	if (segment >= MAX_SEGMENTS ||
++	    busn < cfg->busr.start || busn > cfg->busr.end)
++		return NULL;
++
++	/* The PCIe root complex has a separate config space mapping. */
++	if (busn == 0 && devfn == 0)
++		return rc_remapped_addr[segment] + where;
++
++	busn -= cfg->busr.start;
++	bdf_addr = (busn << cfg->ops->bus_shift) + (devfn << devfn_shift);
++	table_count = pcie_discovery_data[segment]->nr_bdfs;
++	for (i = 0; i < table_count; i++) {
++		if (bdf_addr == pcie_discovery_data[segment]->valid_bdfs[i])
++			return pci_ecam_map_bus(bus, devfn, where);
++	}
++
++	return NULL;
++}
++
++static int pci_n1sdp_init(struct pci_config_window *cfg, unsigned int segment)
++{
++	phys_addr_t table_base;
++	struct device *dev = cfg->parent;
++	struct pcie_discovery_data *shared_data;
++	size_t bdfs_size;
++
++	if (segment >= MAX_SEGMENTS)
++		return -ENODEV;
++
++	table_base = AP_NS_SHARED_MEM_BASE + segment * BDF_TABLE_SIZE;
++
++	if (!request_mem_region(table_base, BDF_TABLE_SIZE,
++				"PCIe valid BDFs")) {
++		dev_err(dev, "PCIe BDF shared region request failed\n");
++		return -ENOMEM;
++	}
++
++	shared_data = devm_ioremap(dev,
++				   table_base, BDF_TABLE_SIZE);
++	if (!shared_data)
++		return -ENOMEM;
++
++	/* Copy the valid BDFs structure to allocated normal memory. */
++	bdfs_size = sizeof(struct pcie_discovery_data) +
++		    sizeof(u32) * shared_data->nr_bdfs;
++	pcie_discovery_data[segment] = devm_kmalloc(dev, bdfs_size, GFP_KERNEL);
++	if (!pcie_discovery_data[segment])
++		return -ENOMEM;
++
++	memcpy_fromio(pcie_discovery_data[segment], shared_data, bdfs_size);
++
++	rc_remapped_addr[segment] = devm_ioremap_nocache(dev,
++						shared_data->rc_base_addr,
++						PCI_CFG_SPACE_EXP_SIZE);
++	if (!rc_remapped_addr[segment]) {
++		dev_err(dev, "Cannot remap root port base\n");
++		return -ENOMEM;
++	}
++
++	devm_iounmap(dev, shared_data);
++
++	return 0;
++}
++
++static int pci_n1sdp_pcie_init(struct pci_config_window *cfg)
++{
++	return pci_n1sdp_init(cfg, 0);
++}
++
++static int pci_n1sdp_ccix_init(struct pci_config_window *cfg)
++{
++	return pci_n1sdp_init(cfg, 1);
++}
++
++struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops = {
++	.bus_shift	= 20,
++	.init		= pci_n1sdp_pcie_init,
++	.pci_ops	= {
++		.map_bus        = pci_n1sdp_map_bus,
++		.read           = pci_generic_config_read32,
++		.write          = pci_generic_config_write32,
++	}
++};
++
++struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops = {
++	.bus_shift	= 20,
++	.init		= pci_n1sdp_ccix_init,
++	.pci_ops	= {
++		.map_bus        = pci_n1sdp_map_bus,
++		.read           = pci_generic_config_read32,
++		.write          = pci_generic_config_write32,
++	}
++};
++
++static const struct of_device_id n1sdp_pcie_of_match[] = {
++	{ .compatible = "arm,n1sdp-pcie" },
++	{ },
++};
++MODULE_DEVICE_TABLE(of, n1sdp_pcie_of_match);
++
++static int n1sdp_pcie_probe(struct platform_device *pdev)
++{
++	const struct device_node *of_node = pdev->dev.of_node;
++	u32 segment;
++
++	if (of_property_read_u32(of_node, "linux,pci-domain", &segment)) {
++		dev_err(&pdev->dev, "N1SDP PCI controllers require linux,pci-domain property\n");
++		return -EINVAL;
++	}
++
++	switch (segment) {
++	case 0:
++		return pci_host_common_probe(pdev, &pci_n1sdp_pcie_ecam_ops);
++	case 1:
++		return pci_host_common_probe(pdev, &pci_n1sdp_ccix_ecam_ops);
++	}
++
++	dev_err(&pdev->dev, "Invalid segment number, must be smaller than %d\n",
++		MAX_SEGMENTS);
++
++	return -EINVAL;
++}
++
++static struct platform_driver n1sdp_pcie_driver = {
++	.driver = {
++		.name = KBUILD_MODNAME,
++		.of_match_table = n1sdp_pcie_of_match,
++		.suppress_bind_attrs = true,
++	},
++	.probe = n1sdp_pcie_probe,
++};
++builtin_platform_driver(n1sdp_pcie_driver);
+diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
+index a73164c85e78..03cdea69f4e8 100644
+--- a/include/linux/pci-ecam.h
++++ b/include/linux/pci-ecam.h
+@@ -57,6 +57,8 @@ extern struct pci_ecam_ops pci_thunder_ecam_ops; /* Cavium ThunderX 1.x */
+ extern struct pci_ecam_ops xgene_v1_pcie_ecam_ops; /* APM X-Gene PCIe v1 */
+ extern struct pci_ecam_ops xgene_v2_pcie_ecam_ops; /* APM X-Gene PCIe v2.x */
+ extern struct pci_ecam_ops al_pcie_ops; /* Amazon Annapurna Labs PCIe */
++extern struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops; /* Arm N1SDP PCIe */
++extern struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops; /* Arm N1SDP PCIe */
+ #endif
+ 
+ #ifdef CONFIG_PCI_HOST_COMMON
+-- 
+2.25.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0004-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0004-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch
new file mode 100644
index 0000000..6fb2dac
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0004-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch
@@ -0,0 +1,51 @@
+From 7bcc0412428050b0ab1fd70cbb4aaead5ac3c0e5 Mon Sep 17 00:00:00 2001
+From: Manoj Kumar <manoj.kumar3@arm.com>
+Date: Wed, 29 Jan 2020 17:21:39 +0000
+Subject: [PATCH 4/4] n1sdp: update n1sdp pci quirk for SR-IOV support
+
+VFs are not probing the vendor ID first, which is otherwise
+the gate keeper for undiscovered devices. So any accesses using
+a config space offset greater than 0 must be coming for an
+already discovered device or from a VF that has just been created.
+
+Also if Linux already has a struct pci_dev* for a given BDF,
+this device is safe to access.
+
+Skip the firmware table in these cases and allow accesses to
+those devices. That enables SR-IOV support on the N1SDP board.
+
+Signed-off-by: Andre Przywara <andre.przywara@arm.com>
+---
+ drivers/pci/controller/pcie-n1sdp.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/drivers/pci/controller/pcie-n1sdp.c b/drivers/pci/controller/pcie-n1sdp.c
+index 620ab221466c..04c0de043817 100644
+--- a/drivers/pci/controller/pcie-n1sdp.c
++++ b/drivers/pci/controller/pcie-n1sdp.c
+@@ -61,6 +61,7 @@ static void __iomem *pci_n1sdp_map_bus(struct pci_bus *bus, unsigned int devfn,
+ 	unsigned int segment = bus->domain_nr;
+ 	unsigned int bdf_addr;
+ 	unsigned int table_count, i;
++	struct pci_dev *dev;
+ 
+ 	if (segment >= MAX_SEGMENTS ||
+ 	    busn < cfg->busr.start || busn > cfg->busr.end)
+@@ -70,6 +71,14 @@ static void __iomem *pci_n1sdp_map_bus(struct pci_bus *bus, unsigned int devfn,
+ 	if (busn == 0 && devfn == 0)
+ 		return rc_remapped_addr[segment] + where;
+ 
++	dev = pci_get_domain_bus_and_slot(segment, busn, devfn);
++	if (dev && dev->is_virtfn)
++		return pci_ecam_map_bus(bus, devfn, where);
++
++	/* Accesses beyond the vendor ID always go to existing devices. */
++	if (where > 0)
++		return pci_ecam_map_bus(bus, devfn, where);
++
+ 	busn -= cfg->busr.start;
+ 	bdf_addr = (busn << cfg->ops->bus_shift) + (devfn << devfn_shift);
+ 	table_count = pcie_discovery_data[segment]->nr_bdfs;
+-- 
+2.25.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
new file mode 100644
index 0000000..56e0f15
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
@@ -0,0 +1,18 @@
+# Add support for Arm Linaro Kernel 5.4 for Arm Platforms (boards or simulators)
+
+SUMMARY = "Linux Kernel Upstream, supported by Arm/Linaro"
+LICENSE = "GPLv2"
+SECTION = "kernel"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+COMPATIBLE_MACHINE ?= ""
+
+# KBRANCH is set to n1sdp by default as there is no master branch on the repository
+KBRANCH = "n1sdp"
+
+SRC_URI = "git://git.linaro.org/landing-teams/working/arm/kernel-release.git;branch=${KBRANCH};"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
+
+SRCREV = "${AUTOREV}"
+LINUX_VERSION ?= "${PV}"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
new file mode 100644
index 0000000..e2ba6ae
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
@@ -0,0 +1,25 @@
+#
+# N1SDP MACHINE specific configurations
+#
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
+
+# Apply N1SDP specific patches
+SRC_URI_append_n1sdp = " \
+    file://0001-TMP-iommu-arm-smmu-v3-Ignore-IOPF-capabilities.patch \
+    file://0002-pci_quirk-add-acs-override-for-PCI-devices.patch \
+    file://0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch \
+    file://0004-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch \
+    "
+
+# Referring to commit TAG N1SDP-2020.03.26
+SRCREV_n1sdp  = "137cccb0843e63b031acf67d1ca4f6447b8c417c"
+
+# Use intree defconfig
+KBUILD_DEFCONFIG_n1sdp = "defconfig"
+
+# Since the intree defconfig in n1sdp kernel repository is not setting all the configs,
+# KCONFIG_MODE is set to "alldefconfig" to properly expand the defconfig.
+KCONFIG_MODE_n1sdp = "--alldefconfig"
+
+COMPATIBLE_MACHINE_n1sdp = "n1sdp"
-- 
2.17.1

