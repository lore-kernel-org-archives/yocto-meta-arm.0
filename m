Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.42])
 by mx.groups.io with SMTP id smtpd.web09.5901.1605607650665976045
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 02:07:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=H8GMviSo;
 spf=pass (domain: arm.com, ip: 40.107.7.42, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOBkhkOqxYiTdLCgM+vfilQlzcveNpxeZzgy8frUvdQ=;
 b=H8GMviSo6x5qEDBSJdnklKXbaHW97cBYGM1Je+m3gVGex8JhSkQHD21ewb9JdzxYEx3G0Vvrcv8Zm/Ee2tYdQayjRlxR+VsaT2Xp7Rs9tAuVC4UMac5qK/771Me90iVqjBWfPF0KKEj5t64JLLvRolR4X8VXi9HW0GlsqZ2IRW0=
Received: from AM0PR10CA0026.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::36)
 by DBBPR08MB6284.eurprd08.prod.outlook.com (2603:10a6:10:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Tue, 17 Nov
 2020 10:07:27 +0000
Received: from AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:17c:cafe::2a) by AM0PR10CA0026.outlook.office365.com
 (2603:10a6:208:17c::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28 via Frontend
 Transport; Tue, 17 Nov 2020 10:07:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT028.mail.protection.outlook.com (10.152.16.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Tue, 17 Nov 2020 10:07:26 +0000
Received: ("Tessian outbound 13ed5f5344c0:v71"); Tue, 17 Nov 2020 10:07:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9cdacaea367a5fed
X-CR-MTA-TID: 64aa7808
Received: from b4a743ebd8fd.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 426922E9-831A-459D-B73C-109469448FAE.1;
	Tue, 17 Nov 2020 10:07:12 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b4a743ebd8fd.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 17 Nov 2020 10:07:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XndFVL4K5zNYH9qH7VdPshna59kMx7X66XmgB6fZ8vR4gKOae9aYa/VOuwz7zJccVdzwseA4q5r+BDPL0VOJSiTWZg3lEwULdDWm/q4+Ip4Nh9Ukkah8lhK8t2Z3Knq4lQtKYpmK7ZLpJhnOWm/RBAw1lyX9+V0vfWOf7vA3FZj5Ny2sBrycDiewvf4xkZInmiv/liKuGpfOpD+pum1veWR67mAkiIZWcLcXX/XHjgp9cwAt+EU+NPigWXeVC3LQAJtOFiz59o5WsX99UIjmV427HhdxMYn7M9mGXydLqL7GoIIwbOrDNlE21eadKj2kCbuD76Nxgr9m955kDtm4Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOBkhkOqxYiTdLCgM+vfilQlzcveNpxeZzgy8frUvdQ=;
 b=Krm6KSf9F+ygj/DX8OfR11a+hEvRPvwur2b4fVqQGRQ3GhELOK5eQbDHNxuCaS4EQEoqEhZyMgzlojT1YG2U75lsINZg8SNAlNGDQ4RorFrMAlCob43+OWeyCA2LVjt4VGwJlSxjcYvM8eH8tQKt5yfGuytasYpVb9s1IiyfxL6GdJPsBloEjeGF9TMIApUoNrbmKlNsbYY3EXe+RZKNA5RGRk+dBSuW3HjnTxFpb3eFA8xBTLpTFXyY4CPP5P0G7RrUGrkxi4og5u6m5gOiPv7KzifWaPhVc+AZZ9mwQV2DWf3ph7m6uY5hhH/RYPi4GLZWhfOyq1nogTkT1ZdrUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOBkhkOqxYiTdLCgM+vfilQlzcveNpxeZzgy8frUvdQ=;
 b=H8GMviSo6x5qEDBSJdnklKXbaHW97cBYGM1Je+m3gVGex8JhSkQHD21ewb9JdzxYEx3G0Vvrcv8Zm/Ee2tYdQayjRlxR+VsaT2Xp7Rs9tAuVC4UMac5qK/771Me90iVqjBWfPF0KKEj5t64JLLvRolR4X8VXi9HW0GlsqZ2IRW0=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3110.eurprd08.prod.outlook.com (2603:10a6:209:45::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 10:07:10 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::cdcd:fe5b:60c:2a9f]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::cdcd:fe5b:60c:2a9f%6]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 10:07:10 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 3/8] arm-autonomy/classes: Introduce alternate-kernel.bbclass
Date: Tue, 17 Nov 2020 10:04:44 +0000
Message-Id: <20201117100449.20111-4-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201117100449.20111-1-diego.sueiro@arm.com>
References: <20201117100449.20111-1-diego.sueiro@arm.com>
X-Originating-IP: [217.140.106.50]
X-ClientProxiedBy: LNXP265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::33) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scm-wfh-server-dievar01.stack04.eu02.mi.arm.com (217.140.106.50) by LNXP265CA0021.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28 via Frontend Transport; Tue, 17 Nov 2020 10:07:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e7eb29ce-121d-41c8-d673-08d88ae09637
X-MS-TrafficTypeDiagnostic: AM6PR08MB3110:|DBBPR08MB6284:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB62840772CDD4804AD597E82992E20@DBBPR08MB6284.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 lArkA3a7Kulr5WDgxYPrxHijzsPKdXS54JnJzaCGpZ0KC/7uKiNjvGOJawt735ZGY3/g1TWcDWP14gZEs9G2Q6sQHRjTz90u+JFZyqHjvaALIwn+n7LultopvWNr89MUIfuTqzF44n/X0wmw5Eavvj25XBJCf94ctEMnKl3+3ATTWUhY7Z8qFf0CUuKOFUyTd5gyKNzpOhQo/XkvvlSJGS0kh5zf/nK7Ox1Rzwko8wmNwQaPN7SGUJULwXyv2Gqa98jIH0S1Kuzpm18MxiwiH83rYB+sGfeujJ1+bgAJ3wsjNs5SWux4gKLahKhoR1IPx4Fpe15W6io7ZOc0xCqrxQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(6916009)(8676002)(8936002)(7696005)(52116002)(26005)(86362001)(66556008)(66476007)(1076003)(36756003)(66946007)(2906002)(44832011)(5660300002)(6486002)(956004)(16526019)(186003)(4326008)(316002)(6666004)(478600001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 IJCtHfNnmqToLbhKxz+bLSDe1DBJKML5ExW4cDsOFG5qQmZChaNe/1w38ZBfCRjVjhgytLa/S4HXoXqpG/vFH6xNdNEjax4k+vfut9G3zbNYESQ7BQObpO5+Rt9mu0MH0+b3b9jXK3c2jJCwbSu0Kz5nwtGqdG0wVH0wFmFO02hrmJbsS4sGvWJN3sZRAyAgyU1g5coJ4yZyEfpsLiXiQXkgneaS0xzgwWfsSCV4mnTAi+laQOiDVmQD/W++lf2NgBwGAL+3Z6N9CSogz+yhcmo0pCIIKZ5FoemQNKU979NMKCJoOb9yKO9XM10/dQWrVYw1JtTnKptGVSiNvsbGxVCGUIJAVfR/4zlGyOkIo4NfvVB74Kq3a5Ii+ogBcKSId1XOM6ZzoE9FNEOAbJq1DlLV9LgHTE3yJOlIiI5vPCgb0cn4LliOz0fe89LWnsGSHmFtdB9jfD/VOW0gtQBdO5+VUdJyWSsCJr2ZvE0noUadiaflzoR3W7vJImzCm0XAzz9EQecza2YYU3Rn7zXpNVsrnVolSmyGKDTIDEgPbnWgPPHiIRWWYRqn1NpvphwPefA7Tj9myClf8eeOcaG+gheU2EUHQcCLgDNm5tY0EvY9XW5WO8llhsvuddWd5DjXDbZ7eoU8QPzReOqYgwPJJQBnVcvqM31vJaElTZ8iP+oOd8BNI79A04Rnp+M/9GYWxHRQc3t7Coti/K/c6GJqMDoSFxZNnptaF7HYpbyqQ/qGD3or7OWDPnwNMsSOVb6U89c0NPe1F+8NruNa/WvErP4XetwhNQbuHQM08AH9BWZTapAPSpbdbHhBdrfGiFhDVbsUY35VYc1tm4L8CviyhB3KRbTREfrp32a2VHULMerSn2YupeSMlgJlgPl3SP+reQS0zRMYZr+hRs5XQjqiQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3110
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	35e4cb03-1a2e-4d94-8a5e-08d88ae08c29
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HhMUj0CqAvuic55gSfiDVqfSW3O4gEWHhVO1dwhnmOskch0044eF56bO4gGqoBKZqbUANfm2S1oS+i/dyIYoIIbhL/2CMctJ4dvangRUgWrCjvUVm19H3P9vIO8h8anS+BJ0Pl8px46vJKtf+WKe/hDCME7udoyvN39auqFSJo5SAMM0yOBYGrgJiyDiDIQKIIyxqTrk2VONxop9rd8LKC6Zjzw7MsoBMO9WHfEMAo9CJondztBNHIzJWQB0Ru/kOvKFaz9niNkUMJEn74gy58LQuaZADeTLXA3WBsIQqIlZBVbYfAorpWtnFzlnBjPJg2DHtpiU+fvov82dRWokEBunUEYOyZcqdtl+EL7YWIpoTf7oGs2x7qYI3tWT4powFoU/qBtyxq0fGo+/jAl2xQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966005)(44832011)(7696005)(6486002)(5660300002)(36906005)(70206006)(6666004)(82310400003)(70586007)(2616005)(956004)(8676002)(316002)(8936002)(47076004)(4326008)(2906002)(26005)(81166007)(82740400003)(478600001)(6916009)(16526019)(186003)(336012)(86362001)(36756003)(1076003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 10:07:26.9834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7eb29ce-121d-41c8-d673-08d88ae09637
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6284
Content-Type: text/plain

The alternate-kernel.bbclass is to be inherited by image recipes that want to
build and install an alternate kernel (set via
PREFERRED_PROVIDER_alternate/kernel).

It is mandatory to also set the KERNEL_PACKAGE_NAME for the alternate kernel
recipe via KERNEL_PACKAGE_NAME_pn-${PREFERRED_PROVIDER_alternate/kernel} and
its value needs to be different from "kernel" since this is the default set
for PREFERRED_PROVIDER_virtual/kernel.

When building and installing an alternate kernel, the kernel-modules packages
for both virtual/kernel and alternate/kernel will be installed.

Change-Id: I1cd0c425c39206fe449fb5f8761ed6de95cfb442
Issue-Id: SCM-1654
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../classes/alternate-kernel.bbclass          | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-arm-autonomy/classes/alternate-kernel.bbclass

diff --git a/meta-arm-autonomy/classes/alternate-kernel.bbclass b/meta-arm-autonomy/classes/alternate-kernel.bbclass
new file mode 100644
index 0000000..9ca59e2
--- /dev/null
+++ b/meta-arm-autonomy/classes/alternate-kernel.bbclass
@@ -0,0 +1,26 @@
+# This class is to be inherited by image recipes that want to build and install
+# an alternate kernel (set via PREFERRED_PROVIDER_alternate/kernel).
+#
+# It is mandatory to also set the KERNEL_PACKAGE_NAME for the alternate kernel
+# recipe via KERNEL_PACKAGE_NAME_pn-${PREFERRED_PROVIDER_alternate/kernel} and
+# its value needs to be different from "kernel" since this is the default set
+# for PREFERRED_PROVIDER_virtual/kernel.
+#
+# An example of these settings can be found at meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
+#
+# When building and installing an alternate kernel, the kernel-modules packages
+# for both virtual/kernel and alternate/kernel will be installed.
+
+PREFERRED_PROVIDER_alternate/kernel ??= ""
+
+python () {
+    alternate_kernel = d.getVar('PREFERRED_PROVIDER_alternate/kernel')
+    if alternate_kernel:
+        alternate_kernel_pkg_name = d.getVar('KERNEL_PACKAGE_NAME_pn-%s' % alternate_kernel)
+        if alternate_kernel_pkg_name:
+            d.appendVar('EXTRA_IMAGEDEPENDS', ' ' + alternate_kernel)
+            d.appendVar('IMAGE_INSTALL', ' kernel-modules')
+            d.appendVar('IMAGE_INSTALL', ' ' + alternate_kernel_pkg_name + '-modules')
+        else:
+            raise bb.parse.SkipRecipe("No KERNEL_PACKAGE_NAME_pn-%s set" % alternate_kernel )
+}
-- 
2.17.1

