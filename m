Return-Path: <anders.dellien@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6FD8C433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 15:02:00 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.84])
 by mx.groups.io with SMTP id smtpd.web11.12327.1642431719459962510
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 07:02:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=jQja5Kxl;
 spf=pass (domain: arm.com, ip: 40.107.20.84,
 mailfrom: anders.dellien@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4YlJP+hP7kHZYY2S/3BaQ/e5TzNu0Yv6rvuzTdqay8=;
 b=jQja5KxleQvZLahyJXJKX3jEwxzZJUnE4eGcTgstagofhdhemzgER7lqIC5wTKwtWBr6deyeb/Qkhw8pGtwLTgjbfIh7vl7PB0LxnN2d5HEE4QG98/kxPM/NoT8ILIbrdGUS18T+FIzuTdZfM27eXURWlbC8pkLLPmSsa/B3Qow=
Received: from DB6PR0201CA0008.eurprd02.prod.outlook.com (2603:10a6:4:3f::18)
 by AM0PR08MB4354.eurprd08.prod.outlook.com (2603:10a6:208:13e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Mon, 17 Jan
 2022 15:01:57 +0000
Received: from DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::4a) by DB6PR0201CA0008.outlook.office365.com
 (2603:10a6:4:3f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Mon, 17 Jan 2022 15:01:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT042.mail.protection.outlook.com (10.152.21.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Mon, 17 Jan 2022 15:01:56 +0000
Received: ("Tessian outbound a33f292be81b:v110");
 Mon, 17 Jan 2022 15:01:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 33a241fc93f83ae6
X-CR-MTA-TID: 64aa7808
Received: from 79eab1841470.3
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9221BE83-53E3-45B3-8848-EE0B08F38D3D.1;
	Mon, 17 Jan 2022 15:00:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 79eab1841470.3
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 17 Jan 2022 15:00:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=REYU8UHv0LXyf9FEN/Ulk/+uzpRdpDUDFSnyAl0LeBDwgWG98GNIpd5SRpA0mxZeYuWZcIrX4lqscfQFBSkk7cxzPtbxGwUOZO0ykQ8UYE2O11l0OjhQzCoh9XRXJBZkRuPs6PQLoOo1e0NWbllZfAcmvhCgDAiqqHWa1IWHD/+fUVZOy4qmpYBx6W3FfFk837Q8VJ/y41Y8PE5tZhBF0J8OxMKbON5tJ+1n0lLEOj49hVzDjoRU563znuuNTnnaDwQuAxt5IKfQ5GdKQdZfL1fphhwNkXd7NUPmwNoUHIHazJKzhrfgJIwPigO+d6E1JIcYBJzmKHLPqCb81YjiBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4YlJP+hP7kHZYY2S/3BaQ/e5TzNu0Yv6rvuzTdqay8=;
 b=TwwzRD5ClsExK/D68Jj8/3YE3AoqBOjLZmsZS8/LZxNeQSaMDoXsSZ/zPIdTL1p/UTGgzrtubIDSmQfGDpe0dQ3UjKoii6qQnt3052QXdpvaJA28xephhc+7B53yVFoa598mrvzqwS9VoblsE8qSlEQRK7AupkakC9xzQ+frh/Q+XPZZh0qo/N+4+SMeOWj888KbhM1G4IWK4Ls3QaWcQbwGRv7SPa87SA4uWv3maWz2T2JhJ1DUO07yyQVKmfXzkJwzQo44JVvp2gDmVA7FSZmKM3I8x871JZXw1XYbSOHhpfqF+/Pk/B7p8FVH/yr75X0vm5PXrUceyRAhS4gCqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4YlJP+hP7kHZYY2S/3BaQ/e5TzNu0Yv6rvuzTdqay8=;
 b=jQja5KxleQvZLahyJXJKX3jEwxzZJUnE4eGcTgstagofhdhemzgER7lqIC5wTKwtWBr6deyeb/Qkhw8pGtwLTgjbfIh7vl7PB0LxnN2d5HEE4QG98/kxPM/NoT8ILIbrdGUS18T+FIzuTdZfM27eXURWlbC8pkLLPmSsa/B3Qow=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB5506.eurprd08.prod.outlook.com (2603:10a6:208:17e::12)
 by DB9PR08MB6844.eurprd08.prod.outlook.com (2603:10a6:10:2a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Mon, 17 Jan
 2022 15:00:14 +0000
Received: from AM0PR08MB5506.eurprd08.prod.outlook.com
 ([fe80::d1d1:2adb:bad1:bb96]) by AM0PR08MB5506.eurprd08.prod.outlook.com
 ([fe80::d1d1:2adb:bad1:bb96%6]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 15:00:14 +0000
From: Anders Dellien <anders.dellien@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Usama Arif <usama.arif@arm.com>,
	Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH 1/3] arm-toolchain: Fetch prebuilt Android Clang,
 version r416183b
Date: Mon, 17 Jan 2022 15:00:00 +0000
Message-Id: <20220117150002.16976-1-anders.dellien@arm.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0326.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::26) To AM0PR08MB5506.eurprd08.prod.outlook.com
 (2603:10a6:208:17e::12)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 773a7098-f8dc-4d7a-199c-08d9d9ca4e30
X-MS-TrafficTypeDiagnostic: 
	DB9PR08MB6844:EE_|DB5EUR03FT042:EE_|AM0PR08MB4354:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB435442A570614E63FD313FF689579@AM0PR08MB4354.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 5aOeRptbCJa+5ygKgjPNMC2cDFh4S09SqvmIXFd41iouCQwu4U1r9jUKHZ9tFV2DAC1fLXi/OelfmL69xA8oINfQlYC0o70l/jmzCgLpEGskg60ev4fYWGIDORFG+//EAZ8vgK/zQN/st1Zi6S5JoUuIaaKihikeCWx07sndjbNS2SoFghB17t4O0V/wuro0zXejxpoHeXDw29oIKRkyt7oUm+7IQoNTDhI35MkiHkdgWwbGP/qes1fpmQSBhdFzoinYJjirSQsBm/5udHPIe+lLJ9FEb6Ag6wOtLDRt7AgBZpp6xiIXEml41BDydMOX+QurND9UKrjO3xobep0WZKlue1HqNNUPZM1i7N6SJwiETCZ4Xq8aaVq7o2UjJpaxFuiXAsFz3/Uk+3QOrkRBhCGHiSiU1k29pYpEbXfFK8D6tKZi8ag299sHnJJnTX7J6caZXuH1nW/KShmNVG3crd+MzjvQpwr8zXIZfHdHuChrRayYFzZYRH53ZHcbs6KG1TtqeSBeI7oycJdeB/hiHWbQj3RUyJS6BMPoS3xytS54kPb60uY/IFNPsdvk/8brsSbRPD5tcZF9+R5ZyKI6YzAx3RRkDOBGQOSDlhj/s+nUd0odF7DEMchSReCok5+k13TA5cC/8Z+YfuPNZt5L0BbNiVb1+BA3DBMRljWwXh2362vG0YI7VewYvJUTkfc/fN3qKvD0NW4xjW2SFzqesRDuFu8uHVTvbwpZe5HYFz3j88T2nOjVYNDUF8mgvxHFaLhnZrao1mzsNUb5Wo/hTpmMgiZyv4IGI23sHFe87Ws=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB5506.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(1076003)(36756003)(44832011)(2616005)(508600001)(6512007)(6666004)(4326008)(54906003)(26005)(316002)(66946007)(6506007)(66556008)(66476007)(8936002)(52116002)(6916009)(2906002)(5660300002)(6486002)(8676002)(38100700002)(86362001)(83380400001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6844
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	decc072c-2031-4c69-b167-08d9d9ca1133
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	K6J5jbdFN8YiZHNxzS9PAwBZklBolygeJFKqwffpmFeYO/h4yRmXCpk+YgXuloqOdFBgFHYEW72ntWiKqFdMuFu/0KfLo8yCB3Z3AwBCnlox9jGBvpUcX6srqXKWdZeos3LTq9926opRLWuj8nuGNGNe5Zqpdgpj3qJCfqQQazF/XZoKjjxPSMQ7Q4p4nvCMLbqW94QJAR71E7v6MW/x6e0alHvyxbDIn2M+bvpBjWjYH6+VDs36v7lpxQeVq0UFneemXvyD4cej/VJDh9XhU0Q4K3i16+5utzFzev+bSkyy/mwONQ+lAwrU1X8Jt6punaiOtFwi7M1U0TAarkVddaLm7CbxDwYLL2osyEQ7h0wN2ZGCZ14Su2YKWdKH4Iahnld+WfSFVImRl+PnghKmnVukY7OhONo7aAiw6r0Wxe7nqMAsQImdx7vgynzFRlsTQA6FiHdVyZ05v+r3VHxPVTD0W6OGS9OTyTNUYCxTgCtJRPdKdnPotCThWS7dx3T8/IGYuJ0UBDixl+/EKkoIoRacOR8AXSmKjHyW6a4gcR5EH9bGDl6qH8MC0UB7IQtQDtQ71dKpWeYD4zMmB82GZ0Ji2o4VrPm73nv/252Jke2LLxX4ZkMIuUJ3gK3RYjcRxbvJmVBhN/+wboyTrisC++5PL7xY9M6CuPyZQJ+2eYiz2G1VNCGgpEnozhh7xZ/IOLw3ctW95tOc+su/YM0wLaSXRh6HlAPReQP48JeTQzoECih91fwiWxqwhddz7fO4lonHWbMz13i560HiXmBWMT5VXzLdGzhUr2MhH2PmJERJh6sfpFDGPc3OTFRRH9pYmlC/HXjhtA9JwdB/aWrqgVzyt52+j8tb8iWU7LTiRaA=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(40470700002)(46966006)(54906003)(83380400001)(1076003)(6916009)(8676002)(5660300002)(356005)(86362001)(316002)(6512007)(6486002)(8936002)(47076005)(2906002)(4326008)(508600001)(82310400004)(40460700001)(81166007)(36756003)(70586007)(6666004)(70206006)(36860700001)(6506007)(44832011)(2616005)(186003)(336012)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 15:01:56.8032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 773a7098-f8dc-4d7a-199c-08d9d9ca4e30
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4354
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Jan 2022 15:02:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2840

From: Usama Arif <usama.arif@arm.com>

This Clang version is present in Android master
(as of October 8, 2021)

Signed-off-by: Usama Arif <usama.arif@arm.com>
Signed-off-by: Anders Dellien <anders.dellien@arm.com>
Change-Id: I957742ee943ef68119fd7c7e2bd8ee62b717b31c
---
 .../androidclang_r416183b.bb                  | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/androidclang_r416183b.bb

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/androidclang_r416183b.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/androidclang_r416183b.bb
new file mode 100644
index 00000000..316cbb93
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/androidclang_r416183b.bb
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: MIT
+#
+# Copyright (c) 2021 Arm Limited
+#
+
+SUMMARY = "Android Clang compiler"
+DESCRIPTION = "Android Clang compiler, version r416183b. This is based on Clang 12.0.5 \
+Intended usage is to build kernel images that match the output of the Android (hermetic) \
+build system"
+
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://MODULE_LICENSE_MIT;md5=d41d8cd98f00b204e9800998ecf8427e"
+
+ANDROID_CLANG_VERSION = "clang-r416183b"
+ANDROID_CLANG_HASH = "bd96dfe349c962681f0e5388af874c771ef96670"
+
+COMPATIBLE_HOST = "x86_64.*-linux"
+
+SRC_URI = "https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/${ANDROID_CLANG_HASH}/${ANDROID_CLANG_VERSION}.tar.gz;subdir=${ANDROID_CLANG_VERSION}"
+
+# We need to set the checksum to "ignore" because the tarball is dynamically generated and has a new checksum every time
+# (the contents are the same, but the time stamp differs)
+BB_STRICT_CHECKSUM = "ignore"
+
+S = "${WORKDIR}/${ANDROID_CLANG_VERSION}"
+
+do_install() {
+    # We should really use ${libexecdir} here, but that as some files have invalid RPATH
+    # this results in lots of warning. So using ${datadir} for now
+    install -d ${D}${datadir}/${ANDROID_CLANG_VERSION}/
+
+    cp --no-preserve=ownership -r ${S}/. ${D}${datadir}/${ANDROID_CLANG_VERSION}/
+
+    install -d ${D}${bindir}
+    # Symlink all executables into bindir
+    for f in ${D}${datadir}/${ANDROID_CLANG_VERSION}/bin/*; do
+        ln -rs $f ${D}${bindir}/$(basename $f)
+    done
+}
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+INSANE_SKIP:${PN} = "already-stripped libdir staticdev file-rdeps arch dev-so"
+
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


