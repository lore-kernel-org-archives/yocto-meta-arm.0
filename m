Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.61])
 by mx.groups.io with SMTP id smtpd.web11.384.1588955676443667634
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 May 2020 09:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=TOJQrFsY;
 spf=pass (domain: arm.com, ip: 40.107.20.61, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lt8GvdMgwy1afIhQYtj/HJDlxKwXMQEQR6zaStAsnXE=;
 b=TOJQrFsYHJnD6vbBJUMa9cfXff6mx4ok5Aq8rURyF3WvjS6ebZ53Q64tgiEEuxehNSSNy6kkrcpd08PAt27W/vObenNWS452z7ha5qiNmGLHwRnO1JlXXOUQTEZLLji+aFMey13rJQFikIAElzCUZHv6rg/IIhRNRSuLUezMhgU=
Received: from AM5PR0201CA0009.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::19) by HE1PR0802MB2521.eurprd08.prod.outlook.com
 (2603:10a6:3:df::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.29; Fri, 8 May
 2020 16:34:32 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::8a) by AM5PR0201CA0009.outlook.office365.com
 (2603:10a6:203:3d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.29 via Frontend
 Transport; Fri, 8 May 2020 16:34:32 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Fri, 8 May 2020 16:34:31 +0000
Received: ("Tessian outbound 5abcb386707e:v54"); Fri, 08 May 2020 16:34:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 202c43ffd465fb3a
X-CR-MTA-TID: 64aa7808
Received: from 21fbc336ee7d.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EDCDFF2E-1D5C-4C02-9CFF-67DC56F31E4E.1;
	Fri, 08 May 2020 16:34:26 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 21fbc336ee7d.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 08 May 2020 16:34:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJbqQ9DbsQqKmSSEWERkt3L4J58fJ46xqFmvRTOU03sdM2OgERkRhbQ0ONh1772K0EAr9fJEKcFgrXdpTx/ogY40pDHLbuG6M0YcIBw8u5H1uIbmH9XaLkx7xfUm41T24qY6WxmBH/TFwdBBZFHHrX/44jOwltBQwKLXibMnLVlai3xhpy0xcQBRIhv50xXsjLSMVpgbXCuIuOtObCJcA0Ov5dnFv+PSkubnMVtUu5SfMwCtGmXUqrUA6xkqKQYkgs/OVPw+7FiOmzlhmp7fQQqM3ZD3lZm/gJ8ibQxB/XrTFOG1PzZzDyJPOxaTMAtm2roujOQaqstuO9LX1LmUeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lt8GvdMgwy1afIhQYtj/HJDlxKwXMQEQR6zaStAsnXE=;
 b=TKO4+4lC6zoWObeeqgbvN0nISv/yA2tYj1LIr02OeW8vxz81ju9VctS5WXKWefvHjt6fRx3s88NoTQhQeN/Q32BpM4l1OoCYOngQll3v7asS9Y6s2sSco//85wYekIDzvq/b6I7ULxA2Kdhri75u3SF4hyVbgMf4DHEou+r9hrJ/4WIVzBv2rqg242j9m8ZvUsoyGjrtvEv4Qxp+Xj/eHzmoQTTBzTvcLxssUmsXRoa00O6b3jV6DFzZWEkZtq8na5dOTAhD1979ciCip9YmbB8ErlprO307qncH5sZ0suNMXyU1AbS5JU4Da6KfnT6HmcZVIhkLHxMA2HwDl8+uug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lt8GvdMgwy1afIhQYtj/HJDlxKwXMQEQR6zaStAsnXE=;
 b=TOJQrFsYHJnD6vbBJUMa9cfXff6mx4ok5Aq8rURyF3WvjS6ebZ53Q64tgiEEuxehNSSNy6kkrcpd08PAt27W/vObenNWS452z7ha5qiNmGLHwRnO1JlXXOUQTEZLLji+aFMey13rJQFikIAElzCUZHv6rg/IIhRNRSuLUezMhgU=
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
Subject: [PATCH 0/4] arm-bsp: Add Initial Support for N1SDP
Date: Fri,  8 May 2020 17:33:59 +0100
Message-Id: <20200508163403.5987-1-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::31) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.52) by LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.30 via Frontend Transport; Fri, 8 May 2020 16:34:22 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b0e26e54-0ce6-4d99-3e5d-08d7f36dafad
X-MS-TrafficTypeDiagnostic: DB7PR08MB3484:|HE1PR0802MB2521:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB2521BDF4AA77511408C09F689DA20@HE1PR0802MB2521.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:6108;
X-Forefront-PRVS: 039735BC4E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 t+gOaoOVGA2toJcjcyNlW9VJXpyqozIftkNsgzXMtoRwh2XhRKCknQbV3Gm50L1BJVviEi5L9apfR909ivIjExqBW8XuatZrBRIkJO1LcPL5sopqcLIrV417QUappf1o15BZx2t7wZhOHdA+WqebG3StqxS2DqJnkkeNDK8aynLyiQV90eZip3Uld7NelV1CZmP1DDiCVLSFsYH76pm1nr+igMaWWMLpJyFqSaXaEJfGM8+RZ02/Tb6VsAXVLCXTy/6uZCFiItlOlKaImY5r4/lXVNW2Raph92/X57cjVIMTCKukmusIqHx8/shzaArGUz+fHNGEa/IslqMh+aEaY9NgMwb5pD2YEh1PVkB+X/bJUZK/c6jhXKUaR1ydH66gPLOAXrJe3rF/zB1MrIOeox8wGLfKgADW2GYI5cYvFXBp4NB5H3v17RHHYBu0gy0u5XHuct9NhKA3t14Z2nt0Oy8gZysgcq+n1pOynfDQD9tP/Z9VHoNZ7hP8zJ4KHWx53cz5wVYoBnvwXuYbKWThx1PqkoFvPUfzo1U5/dlzZfyeJRae3wedqxEbszfguxRMGtsXIIApLIMf2xNktJqqlZK1/kulMPCUh2F+PxmILUBOu1M4Ph+C2/aGbmkXqHIaMqTFQ4+N7lIwormIPqpCbhGz9/4qnhjCPP6MqGuFro4yhk91Uk6FghY/r848FfQg
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(33430700001)(7696005)(52116002)(5660300002)(2616005)(19627235002)(6916009)(26005)(4326008)(66946007)(16526019)(44832011)(316002)(966005)(1076003)(36756003)(6486002)(186003)(956004)(83320400001)(8936002)(83280400001)(478600001)(83310400001)(8676002)(2906002)(6666004)(66476007)(33440700001)(86362001)(66556008)(83290400001)(83300400001)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 EYdk4Rjj2cgoBMFh4uGwUbJ4e78IVV5XNxmU9pbkNBcSY4q9LPtW3roDn+LXOhgCSxQcGJy6k0xa9TkSETiNheWS7Vz50dnfCWiN6YvyqxmmKsjaJN0AmAjuc9jAAwFWu+cBu2HysTsENQu7XNz2n8IPDsnGG1+vdv3KXRn2ABB7fo4cva7FiG7FTOMAcx9z+ZDYhaZZF9YHvLfdhvvmvGZJkxWTg8Mf5gh7V6woVz2JDp1N131Pls4YG4aZ21LvEKP0/IcIcDOZmgccNBtegoGIe1S1htM8BLAt33k3ksGH+s6M0pv5yPQ+jLg1Msq6dp2GuXBigf9JXZHO/TzAcAHLBL5x55zSa0J4zG6/0EcENsus2Jo+01dKJTYWYLvOrsWWidJEOzWLen3gcaulH5AVlIoAmjQk9OcLGx4ZnuXJbMe2gnm0/3U8i2wbN2RHlTUUP3Ob+UpPo85czQ1X8WFNmsesrNKWvLZvqu9Gb4o=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3484
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966005)(33430700001)(186003)(16526019)(6666004)(316002)(36906005)(36756003)(47076004)(86362001)(81166007)(8676002)(8936002)(356005)(82740400003)(336012)(82310400002)(33440700001)(70206006)(70586007)(1076003)(19627235002)(44832011)(2906002)(4326008)(478600001)(7696005)(26005)(966005)(6486002)(2616005)(5660300002)(6916009)(956004)(32563001)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0e2ce5a4-74c2-4dff-e8e6-08d7f36daa43
X-Forefront-PRVS: 039735BC4E
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Owxi8PA3UgMnNYT0dMXfX5bUIZQMfDcLEvQeKRY4We9XTJEdk7q1wE/vQL8bv8xd6xxVB+RGo++RmtK6UgufhHRYitzn9PxCJgIhNC3SBpqNY3Ul74VSleP6D6VXAnasyOWnX5VIpc9raMA9WHKPSLk1g2HeMsdiFJHWJ6olDhCATgyuEgTAyNcS5wJ6gUeXWVHXZUWquzKtUwLDIyS2NjGFTC6kJowQLH77jzSnv2l+mPMaTyWXXgqPQdaWLUS9PFjO3ck7SIM7bTYtdnD8w11DakJJZTKuZRMgFiY+Htd6Te0iFt0sBWKF7gBgo+YxawBm22XSHbb22vUScdp7vYRM2UokEu4IY/d5Inn38bJO3HQYE8HCnxA4pC07P9cjgKQXjk1Pt0JF7QJup54s9dv2aRPu48nLvPq8+K0GYnjF4oKG9fVt03YTxz4AuBK28U9BgAJpj0g7fqix48yJZDa9hcsp3Xdimtb2hrRnKZO7BUxFA8XFY/GGFN5loe447VJf0maOjSUY29+i+8S4MJxFb4rXa53lV1M8KwODZYhAlEueDigyDJVslM2dyAOMTGeaGwYlrCPEWQXyH0EuK3YBxJzeAACU6KpxOysr7j5fJvGQXy1X5ZZS7RM1zyAmYul+RfQown1SRcZbYgDOWOa4uGiy3zLpR5eICd20b6I+r65tySn6oTufAyuM1+/JGzs2YdjXvSnnJV260rth+V+jnueATYRPsErhfDzllQ0=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2020 16:34:31.9516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e26e54-0ce6-4d99-3e5d-08d7f36dafad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2521
Content-Type: text/plain

This serie is adding initial support for ARM N1SDP platform to
meta-arm-bsp.
The current support includes kernel 5.4 with PCI patches and DTB.
Firmware support (TF-A, EDK2, grub) will be added in a future patch
serie.
To use this BSP, a firmware must first be compiled and installed
following procedure describe here:
https://community.arm.com/developer/tools-software/oss-platforms/w/docs/457/n1sdp-getting-started-guide

Diego Sueiro (2):
  arm-bsp: linux-linaro-arm-5.4: Fix kernel menuconfig task
  arm-bsp: n1sdp: Add Linux kernel device-tree support

Khasim Syed Mohammed (2):
  arm-bsp: Add linaro-arm-linux 5.4 kernel support
  arm-bsp: Introduce ARM N1SDP platform

 meta-arm-bsp/conf/machine/n1sdp.conf          |  20 ++
 ...arm-smmu-v3-Ignore-IOPF-capabilities.patch |  46 +++
 ...irk-add-acs-override-for-PCI-devices.patch | 156 +++++++++
 ...-for-the-Arm-Neoverse-N1SDP-platform.patch | 318 ++++++++++++++++++
 ...e-n1sdp-pci-quirk-for-SR-IOV-support.patch |  51 +++
 .../linux/linux-linaro-arm_5.4.bb             |  20 ++
 .../linux/linux-linaro-arm_5.4.bbappend       |  27 ++
 7 files changed, 638 insertions(+)
 create mode 100644 meta-arm-bsp/conf/machine/n1sdp.conf
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0001-TMP-iommu-arm-smmu-v3-Ignore-IOPF-capabilities.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0002-pci_quirk-add-acs-override-for-PCI-devices.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0004-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend

-- 
2.17.1

