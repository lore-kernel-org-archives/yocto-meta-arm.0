Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.81])
 by mx.groups.io with SMTP id smtpd.web12.21163.1603030696072565414
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 18 Oct 2020 07:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=hfmZnLd2;
 spf=pass (domain: arm.com, ip: 40.107.8.81, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkZQicftlXBhyEiz/ngaUfXlyX+Yxd9byGJ0kK81Fz4=;
 b=hfmZnLd2e5i0KBoGiRIOcvrdYtABhEjQqNqxrnyaTiwfgp08tB5KWrJ/uMXGZQVsK/Kj0siudy9BUWA1D08rtD98Wb5uJEh4J3kbtO69heQwQMT4uq50YPjdELZ09AwG0fmZnC9TTcv+nTkHdXfV2QSbi3nXtJaWiov1DHwpvcQ=
Received: from MR2P264CA0108.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:33::24)
 by DBBPR08MB4379.eurprd08.prod.outlook.com (2603:10a6:10:cd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Sun, 18 Oct
 2020 14:18:12 +0000
Received: from VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:33:cafe::c2) by MR2P264CA0108.outlook.office365.com
 (2603:10a6:500:33::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend
 Transport; Sun, 18 Oct 2020 14:18:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT033.mail.protection.outlook.com (10.152.18.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Sun, 18 Oct 2020 14:18:12 +0000
Received: ("Tessian outbound 68da730eaaba:v64"); Sun, 18 Oct 2020 14:18:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ed6d7bad6b53910e
X-CR-MTA-TID: 64aa7808
Received: from 410239ce20b4.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6A689D5A-E99D-4C4B-8EB6-CAE3171B3C80.1;
	Sun, 18 Oct 2020 14:18:06 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 410239ce20b4.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sun, 18 Oct 2020 14:18:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ioGUGwJ1/ZiAQSMG/d5oznC2Ol9OcVFWOw8H/RZE+CaDCnQAaoLlU8QLRtWTGFNosmja33Rp9Npkn9Ez6HSvUXWWRmtjQy0xSQKECLU4vpt7NX/a8O9b4Qmalaq07QTjksJc/eUU5rMDQQCvhaYxzjNPU4aL0V8GM2aafKIt1A89mTQZ7pkUzAS7Rg1rhGqMv3g5zisG7JXPWABfzklqA1nPw81U0iQdnlFyY0NPTfJjmsM5izTWRkZ2gx7hGNglYPyX//j0W8HMLxsMJOQkgYR9hcTQrUl3v8gUWQMtQtCYwvbAzqaKDSedU7r2npgBHMCbVL84/3B4jpkxV2eVGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkZQicftlXBhyEiz/ngaUfXlyX+Yxd9byGJ0kK81Fz4=;
 b=A0d6hVMvi3q2v1JZV7ga/rdYNoslmakwOpSrCf66EcYyYqn6iYS0N1a2ZM1zmAu5rY4r6oxJsGvbwF1HND0EP7lFzcUrekIWPr6EIHZqWM96W8IknpFcpuxkHz1pGfcSx7km9vVKodqErTF46fcVs2UMAV4aIvESgR8G0jhnWLCpp+v9EEB+nrFcfp1mZMyGz0cvTw51IT92HsIGQlzje0jxFJC8QmcFJEENH6GYkVAMKZcGtZMWDh9SmxUkyCyx0EsiqbM0kIRmerAJHyuAf1c5XAQ/JuY3M8gDGRuyvgYE5D3XVgsnWlaK0mr9G7ZzFXDfTCmCYPlyfE8tY/oT1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkZQicftlXBhyEiz/ngaUfXlyX+Yxd9byGJ0kK81Fz4=;
 b=hfmZnLd2e5i0KBoGiRIOcvrdYtABhEjQqNqxrnyaTiwfgp08tB5KWrJ/uMXGZQVsK/Kj0siudy9BUWA1D08rtD98Wb5uJEh4J3kbtO69heQwQMT4uq50YPjdELZ09AwG0fmZnC9TTcv+nTkHdXfV2QSbi3nXtJaWiov1DHwpvcQ=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com (2603:10a6:208:d4::18)
 by AM8PR08MB5732.eurprd08.prod.outlook.com (2603:10a6:20b:1d4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.25; Sun, 18 Oct
 2020 14:18:04 +0000
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::d1ba:1582:16de:1d00]) by AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::d1ba:1582:16de:1d00%2]) with mapi id 15.20.3477.027; Sun, 18 Oct 2020
 14:18:04 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] arm-bsp/linux-linaro-arm-5.4: remove linux kernel dtb and use one from TFA
Date: Sun, 18 Oct 2020 19:47:47 +0530
Message-Id: <20201018141747.14330-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-ClientProxiedBy: SN1PR12CA0113.namprd12.prod.outlook.com
 (2603:10b6:802:21::48) To AM0PR08MB3409.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by SN1PR12CA0113.namprd12.prod.outlook.com (2603:10b6:802:21::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.23 via Frontend Transport; Sun, 18 Oct 2020 14:18:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9df3aee4-d1e3-4d3d-799e-08d87370a57e
X-MS-TrafficTypeDiagnostic: AM8PR08MB5732:|DBBPR08MB4379:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB4379EC4AB93049EF33B651FCFA010@DBBPR08MB4379.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 7aaWrqIJFzvLUKIJQM88titFnKCoS5q5kLHpOfjNa6La6BsegqZiO1mkzHgftHUv4m2/IdQHaqPxzVQVOz4B4TvV+SmMQfZ+Kngij6oAEf6shEqocMMwWZI22fsJ1QtMZ+CYcjweCrSOE9AWN2fJZWDP7t9eNCvNHYhSd1HQ3B+9+ieu2PR+3h13x14EcTZWYxINEKeJBd7FPmmEHJdKSq5GHrG2ewQdhtpBUAEJldQu7Xg4WgctpO8eGzJ94/aNcjwQa35UVdp/qunF36O66aK6Uu0YWtAuDeAOQLiYOaJ/zq+JPBsk7xhVgrnqJ/OvbQI7WcBX/8VUg0Y3Yrl4PQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3409.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39850400004)(366004)(956004)(66476007)(66556008)(2616005)(66946007)(16526019)(6666004)(2906002)(26005)(478600001)(8936002)(186003)(316002)(6916009)(7696005)(36756003)(4326008)(6486002)(52116002)(1076003)(86362001)(83380400001)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 urigoVNzbQzYErK16VIbvm6vihuIwbIIpZFU3aHiEjsYfQNauDODIn+VtClCwLbKTVTWFG0fqRyh6mR6Mzi9uE4on1lOe9nlPgYYVRcCo6agUv/g+gYjCgmE7k6yl+OiYGK9t/pwszfH/K81WMPk5Jz6YdZLDJvwHC648lHlVTLhJwiOEnr+ZNGEEMMlPI/CySyP77TtkE48Y6/rtqD0xjdeR6c0URrlkce7qOyFociBn1J8pvCZjnPN3o+nLg9HWL8NjUPakP5gNDiY+ZsdSRSmDil6P/L39HIj7TKMgvAb+WfqY4sVOCVfKmkygyqWx8cKeZqSYI7n5svjR16UQDOap3qAeTsIqPWRYMuzLTcavoW3C4Xr3SMZYgRmWar4rqFRRixkiNQaAsJdo7p1VxAwA3qg1A3gAW/64J6EXovkBURvd2xtvN3ofXrzk13W9hczt5+oZcCr7c3Uail2HXHhrgSTSEpGC1+GpAQ8ZNJubENPjlHVNjBLq0GVx8YkFIy1G0TAsUETcovzHSarJlOJCT6DYLF8n4s6yDcB3eqEEbUIv4ibtH5YigsKZoLp9ppd2VbeLT+OafKPkL1Ru0CtLS/9VYn0unJWabVaB9huUrIRzPUTGUb7djLk6neFaeKuW+Mgi0YCXyhXeEdObQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5732
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2f330b1a-96df-4848-f86f-08d87370a0aa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G5jWmrxjAlxeIbkjkzvlXjkimCAXd9R9O5cFufvv9weq45tVxr7CGZD9umhoTK5xLqHn6sTOY5eCEhfTzGLOJbrHlGrxtlgyKvT18jK9ST/2mHSm/nmbRdh3lhmcmA5Bh0oeThkgIgBkzwrokz6nX6wuTez51FULmopK30jWSAaZmipt0BF+x6kqHUtutZd+0YLG0VjscsJHH6UCdmWXJi3nDF34qkR7h+FWesqLtJpRV8+cOqkPeSOg7S4dwrHLhkZYkNzHZZ+2IEuLV2lNiUeXeurkogd3sP1HnAN3wDVsXdiWYFjAca9RdOMFLtPRu4DSEKNvUL3J3n0WUP5zi4fuby02ly7NSZQUGC2WMJInz7d0ZDytde/YQuP4J3NqbqGmkXulesAMRTWXfy6ZIQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(136003)(396003)(46966005)(6916009)(26005)(82740400003)(70586007)(478600001)(70206006)(7696005)(4326008)(86362001)(6486002)(356005)(82310400003)(1076003)(81166007)(83380400001)(8676002)(186003)(5660300002)(2616005)(956004)(2906002)(8936002)(47076004)(316002)(36906005)(6666004)(336012)(36756003)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2020 14:18:12.1892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df3aee4-d1e3-4d3d-799e-08d87370a57e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4379
Content-Type: text/plain

DTB is generated from TFA therefore remove using the one from linux kernel.

Change-Id: I4647482b41b76db803fdd6a417580d99d2e79215
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf                            | 1 -
 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend | 1 -
 2 files changed, 2 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index 9df3e50..4649826 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -7,7 +7,6 @@
 require conf/machine/include/tune-neoversen1.inc
 
 KERNEL_IMAGETYPE = "Image"
-KERNEL_DEVICETREE = "n1sdp/n1sdp.dtb"
 
 IMAGE_FSTYPES += "wic tar.bz2 ext4"
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
index 2904bab..6b13f9a 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
@@ -6,7 +6,6 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
 
 # Apply N1SDP specific patches
 SRC_URI_append_n1sdp = " \
-    git://git.linaro.org/landing-teams/working/arm/device-tree.git;name=dts;nobranch=1;destsuffix=git/arch/arm64/boot/dts \
     file://0001-TMP-iommu-arm-smmu-v3-Ignore-IOPF-capabilities.patch \
     file://0002-pci_quirk-add-acs-override-for-PCI-devices.patch \
     file://0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch \
-- 
2.17.1

