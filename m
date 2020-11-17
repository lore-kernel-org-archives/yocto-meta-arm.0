Received: from FRA01-PR2-obe.outbound.protection.outlook.com (FRA01-PR2-obe.outbound.protection.outlook.com [40.107.12.58])
 by mx.groups.io with SMTP id smtpd.web10.6051.1605608061145880926
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 02:14:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xEoXfIsl;
 spf=pass (domain: arm.com, ip: 40.107.12.58, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FGypxCUfAr1tQj+hXlP/c3l9q8giI0m9/nezO5dmlA=;
 b=xEoXfIslsNIxR1cxZobs4Wz++GgxxR5Whuzxxkolr8miElknSsbpntnBj5SF7BZeCAXlfd04l9BLuVumYncjfl2tdXKgDQa6St82WSZdRKvBpRZorElY0CPPP/PU6MmKcrIoYMyoqfb3oIv22XqpwYjVaX5GdqL/+j1WlDVIU10=
Received: from AM6PR04CA0029.eurprd04.prod.outlook.com (2603:10a6:20b:92::42)
 by PR2PR08MB4794.eurprd08.prod.outlook.com (2603:10a6:101:24::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 10:14:18 +0000
Received: from AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::82) by AM6PR04CA0029.outlook.office365.com
 (2603:10a6:20b:92::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28 via Frontend
 Transport; Tue, 17 Nov 2020 10:14:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT010.mail.protection.outlook.com (10.152.16.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Tue, 17 Nov 2020 10:14:18 +0000
Received: ("Tessian outbound 797fb8e1da56:v71"); Tue, 17 Nov 2020 10:14:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4d299b99275ea17d
X-CR-MTA-TID: 64aa7808
Received: from 39e26e561277.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 03F7548A-0AD4-4B68-A400-9086978E0EBE.1;
	Tue, 17 Nov 2020 10:14:11 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 39e26e561277.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 17 Nov 2020 10:14:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xa8R8hYOIUDsS20NFO/PQevEuw2B+8qIMlO6bv2bTb55K14as7aarEOwSuCn4U8xVidhx/S/SL1ad/QXAFLPrqJiZbZ/1TWPnSnirqV0EOknaQ9KL2iq2gKh4c58T8tb1eB2ZDwnlNmHwWYB6xN6cSpkJw+elDO/VK/6dJOUayhS6KWn9GFeiIhiN6yvOqi/grUr6U7HSkDTEDCKEamgjTpnOZx/6qsFhqqSLrZB0/k/dLS7qF3B2LmyyWmU1s9D4Vzf7Flpv735xSHGXRGUaTVb0vRvBj4fZoZO6d4YIzrX6Z9EXjsw9o/Ms+ATGwaKI0KbM3ZeJkNc4cq7isLV+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FGypxCUfAr1tQj+hXlP/c3l9q8giI0m9/nezO5dmlA=;
 b=j+u7JLBvZgs7gAXOHux0qeXwFLXWJflEoz7kQV9gOieRBAElUQa9WKMeh9EzW5DKxx89FxNyViFUCpwxqycidCKGDWQyIE+oMbX/U+SPQZ/79sSDcGycBLaS2yUekbwIOkGmMfNzg4/jtuGg4iY3nhc5UWuUgulQEvUQAtwqLdbnaw2u7yCcOxlzgRJ38cKLPJdsf1DaOrcU0bt9SFHqZY5WetutG//p7zQjfxEIpGXWx3Tl6u8lj71rsq35cNWBykrmaM4h7zJXzdFhxvRsIVHcNgavS4vxyQSwR88mYM4Fq+x7VkSIE6ZUW/vhvQUCuG6OOwI3N5UoKqSFj8tg6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FGypxCUfAr1tQj+hXlP/c3l9q8giI0m9/nezO5dmlA=;
 b=xEoXfIslsNIxR1cxZobs4Wz++GgxxR5Whuzxxkolr8miElknSsbpntnBj5SF7BZeCAXlfd04l9BLuVumYncjfl2tdXKgDQa6St82WSZdRKvBpRZorElY0CPPP/PU6MmKcrIoYMyoqfb3oIv22XqpwYjVaX5GdqL/+j1WlDVIU10=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6213.eurprd08.prod.outlook.com (2603:10a6:20b:23d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 10:14:08 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::cdcd:fe5b:60c:2a9f]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::cdcd:fe5b:60c:2a9f%6]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 10:14:08 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 8/8] arm-autonomy/modutils-initscripts: Fix modules.dep update
Date: Tue, 17 Nov 2020 10:04:49 +0000
Message-Id: <20201117100449.20111-9-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201117100449.20111-1-diego.sueiro@arm.com>
References: <20201117100449.20111-1-diego.sueiro@arm.com>
X-Originating-IP: [217.140.106.50]
X-ClientProxiedBy: LNXP265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::33) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scm-wfh-server-dievar01.stack04.eu02.mi.arm.com (217.140.106.50) by LNXP265CA0021.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28 via Frontend Transport; Tue, 17 Nov 2020 10:14:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 56c9eff4-e89c-40e6-6455-08d88ae18b54
X-MS-TrafficTypeDiagnostic: AS8PR08MB6213:|PR2PR08MB4794:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB47941D5A0F807F4317EB3DD392E20@PR2PR08MB4794.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 As9Cp9HZ1e1Kj9EBxjgeoWb7Flv9ORpb34d8j9dOwFnqrwckbr+7fhrha3T6slDbDN812jKbfi8OmstyhBnnDe14yrMDjyuiUh6lF6ufEus8uciFf3L9PYpT6VQiIp62kTIMQT5WpnFpJVMVplgcV7ageGxNwPseKhOT2ySpEzW7JlG05MVmXMaLBqfgfPAPSi99Mi+f9ba+w0QCy4oET+a/6in7bsn3eMpoG0AgHeuAaeuRHhoI4YMCd+DLpZ34HoVhl9ap4qjNREd1JxbFgf9vSndxaP6P49js+Bbx4bEl9Jf5mrwtC0LJKu/lhAvsKEdGb1fuqcAf6AAail0Vlg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(478600001)(956004)(36756003)(2906002)(1076003)(8936002)(44832011)(6666004)(2616005)(8676002)(86362001)(186003)(16526019)(4326008)(7696005)(26005)(316002)(52116002)(6486002)(5660300002)(66476007)(66556008)(66946007)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 j9nTWYTEPdOGONKMlBNgcy/QVJTxbB52Zh96Xk0yYokLzhZjcpTi2+TAfQ/dyfAuxYX/cJQjhKZAk6mFaQa7f/54Nas8amQJMtDV/ir2DXfpFmdjhSjAid/ad31QrKd7z/oteqvGBghi7OGEZA4Tgb4b9bl72XpAReIUOTlhgKfSIwUrG1tbahrEKx13bUIYuJnbgtyrHhH4jlqLpyHODZrG2itZnCKOIoQvoInhksH+ot6KUBgwi9fEJ9oZk9k59/uql0W3PhjKH+FIalpxNQoqsRrhPLhgJLZUZNJ63PfaU7c9GZ+mTj5oN2TfedZocm7ybYlodIZPCIAq3HeI7T2M9qp7WNeVlUQGyRJD4pd6pHPwOD0Km9On/KYHb2Pj4pDdekb2EzWf+MhGu1HZ7Y+IWUywGVICiJ/rpt8rU0OJBtKdcgaByA9Ga9o+70I9DCMOMAa7DdEYhEM9TQQ+muDXgVMQrahZ74xuNyhc7cxsj7FHOFz9reJGCM+L8GDbrPD56IC2LpirXRLDgaBUJ6iEt4OaKS3Uvb86AvKoRTWhNZPk9zBkURKpIcu7TczYYlk1HJMzMiNZd1rvX0KCVJNeGRfeYUt/rB7tuQN5MZjZvAnu5+CxLv6ihNYfZzerET+Yt2nSl+ZIKliTuaYxBwKk0imwDkU5csq+o4Kz/kCtINYTO3gWGsMgPVtr/KNS4blVvhYTi6ROlrBjZUz2eWrjWwhNEfy3fvDXu/a8GzI40ybmtDaCwpbbdO/ajvHdrtaIA0abTpzrwNemSXJ9KgXLNmWWaZ7D+TRVXWEbQAVmiubBgfXr9DsO08tX04/3yEq9X0C/fNs18ukUBfX2SBrVqK3CZxsAbPTQNr8OuX8fxE26GK2IuJLyYe49W4IKSLfYDXNUSHIAHwoVluJlCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6213
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8b60f0c1-0245-4cd2-ec9c-08d88ae18526
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Jnyf6hQ4Gv/Z7AvisFFgnIBFRIR19pZoQuEYZlUuwAEoKDr+dGejmtVniwlPbe94R1OwaQDOASWBQ28N1+KAbRnH7GDSHve6sRoyZVkzDvTvvftkHRpbvWy7o6J9hXPJh0Gx7WZ1GiFVoEbAHOYfYYIM/1BApNy0Wh9bsLqdD7rE8MdznGDgj6vuPZPU172UVvgUJGol5D9hvEvcd1PRnLPC6C77q45G7z7cpHdr4WnzY74Fv3fqtALWdffR5+sCow0fxummKGegE8ES8s0rRjEfMRJs2QjkpAgTRsbIa6hrFzryxnKjRYS/p+ONsqpfsPCL9vuX2D8qUNKsIIrdoSWcbIU+v2Rupqd6LLssFr9VPd7XO0xopbIV5TRQga/m3+HwBwvlLXVmdOZv2TwFww==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(46966005)(6666004)(86362001)(44832011)(478600001)(82310400003)(6486002)(316002)(356005)(81166007)(82740400003)(47076004)(36756003)(6916009)(956004)(26005)(2906002)(336012)(2616005)(8936002)(186003)(8676002)(70586007)(7696005)(70206006)(16526019)(1076003)(36906005)(5660300002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 10:14:18.2153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c9eff4-e89c-40e6-6455-08d88ae18b54
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4794
Content-Type: text/plain

When building an image with USE_DEPMOD="0" we expect that on the first boot the
modutils.sh initscript will create the modules.dep file if it is empty or not
present.

Change-Id: I0048dc47f807587e723c068b0a4ba24718d66f49
Issue-Id: SCM-1654
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../modutils-initscripts.bbappend             |  4 +++
 .../fix-modules-dep-creation.patch            | 33 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts/fix-modules-dep-creation.patch

diff --git a/meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts.bbappend b/meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts.bbappend
index 2a2fd20..6cd3e17 100644
--- a/meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts.bbappend
+++ b/meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts.bbappend
@@ -1,2 +1,6 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI_append = " file://fix-modules-dep-creation.patch"
+
 # We want to have modutils.sh running after checkroot.sh (05)
 INITSCRIPT_PARAMS = "start 06 S ."
diff --git a/meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts/fix-modules-dep-creation.patch b/meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts/fix-modules-dep-creation.patch
new file mode 100644
index 0000000..c9a7c1f
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts/fix-modules-dep-creation.patch
@@ -0,0 +1,33 @@
+When building an image with USE_DEPMOD="0" we expect that on the first boot the
+modutils.sh initscript to create the modules.dep file if it is empty or not
+present.
+
+Upstream-Status: Pending
+Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
+
+diff --git a/modutils.sh b/modutils.sh
+index a78adf5729..4afd12a9fe 100755
+--- a/modutils.sh
++++ b/modutils.sh
+@@ -13,14 +13,17 @@
+ 
+ LOAD_MODULE=modprobe
+ [ -f /proc/modules ] || exit 0
+-[ -f /etc/modules ] || [ -d /etc/modules-load.d ] || exit 0
+-[ -e /sbin/modprobe ] || LOAD_MODULE=insmod
+ 
+-if [ ! -f /lib/modules/`uname -r`/modules.dep ]; then
++# Test if modules.dep exists and has a size greater than zero
++if [ ! -s /lib/modules/`uname -r`/modules.dep ]; then
+ 	[ "$VERBOSE" != no ] && echo "Calculating module dependencies ..."
+-	depmod -Ae
++	depmod -ae
+ fi
+ 
++[ -f /etc/modules ] || [ -d /etc/modules-load.d ] || exit 0
++[ -e /sbin/modprobe ] || LOAD_MODULE=insmod
++
++
+ loaded_modules=" "
+ 
+ process_file() {
-- 
2.17.1

