Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.48])
 by mx.groups.io with SMTP id smtpd.web10.6394.1582713706541605662
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Feb 2020 02:41:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=RaQjVozM;
 spf=pass (domain: arm.com, ip: 40.107.8.48, mailfrom: patrik.berglund@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1tZ7RRAARN9xqbddSCzLcOLSA6hcNl8qCUn7hm5Lj8=;
 b=RaQjVozMb/f1C6gOnBYJGvJXXqKPYO2WXPMNenumWJZwCV88njBLJUEh6Rn7WZOokgrJwUxUAz+ogyMGf5JaaFYS/82UB/QdU0GBWx8B3hKkPtQllXbV9lo1ZOEe8vKTlMsJbO7Aghr7neYPbcNWzUXq84hHKgg4INPz2QKiWVQ=
Received: from VI1PR0802CA0033.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::19) by VI1PR08MB4272.eurprd08.prod.outlook.com
 (2603:10a6:803:101::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Wed, 26 Feb
 2020 10:41:43 +0000
Received: from DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::200) by VI1PR0802CA0033.outlook.office365.com
 (2603:10a6:800:a9::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend
 Transport; Wed, 26 Feb 2020 10:41:43 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT055.mail.protection.outlook.com (10.152.21.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.17 via Frontend Transport; Wed, 26 Feb 2020 10:41:43 +0000
Received: ("Tessian outbound efdea641ed36:v42"); Wed, 26 Feb 2020 10:41:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cccbc1e1d108fc2e
X-CR-MTA-TID: 64aa7808
Received: from cd46e8524725.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3D02EB7B-8FBD-4CC0-AB07-A5488085CE75.1;
	Wed, 26 Feb 2020 10:41:37 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cd46e8524725.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 26 Feb 2020 10:41:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfsR0bpNXWlt/COxSWDCAzJIldKUxRENDIlPCOo+0tpISJfPq7GCiW1NIx35OyO7oXoihYfkRPa5FUTj2TuzO4BJ/hzQymEEmRf2LXU7X298gjjeSAYarlcdA5VjMNSTIo4USXAEJum2KTNVpebAfLw3BJWI4oP9t4e2qNgWnNw95zuwuwS6BxeTiDhU31IuGsvABaBdu9cFYtxi6SPD4gELPgVJqsJupWVKuViIsvi/NWp2q0h/qKFTrMC7CRy67Km4P+H+CvIrNePMzxV5ZsxyPbfTsc9JXza0WwTqlsa1K9s0EQCUZDiUb36usTvjkXOB04pbtNg2YsFNmuYUSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1tZ7RRAARN9xqbddSCzLcOLSA6hcNl8qCUn7hm5Lj8=;
 b=j+w9MiIGf9B+Rz3Vov2AqvUJl2kbPJEGBrBVfg1mgS1f4acRuts4dvEeTl4k/4IWGbW4cBGZjJWzjK/uwXulc/3umMMzpS41DTE6IKvBV1G6cj5R7ohcjnmCQA+99wi3zxN1f7KzkYoZcfiAbWq517uuhKBme3T+isQn3WL7Mg8bYFQs8woRvQGxhYKzfkU8qOB1JF8gfwBXxFg+K/Dci0zC02RHLVzYQHwc5Yy9BT5ojHju5ptU/jNK1h2fj78FLsmOXZzWkM89EZlviN5b+MxA5Ej5VNBfNa2nzUZrbtGLbcWmGJo0P7Zb3NhlHzyRL8T38bGhKq6Bgbd9YysDWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1tZ7RRAARN9xqbddSCzLcOLSA6hcNl8qCUn7hm5Lj8=;
 b=RaQjVozMb/f1C6gOnBYJGvJXXqKPYO2WXPMNenumWJZwCV88njBLJUEh6Rn7WZOokgrJwUxUAz+ogyMGf5JaaFYS/82UB/QdU0GBWx8B3hKkPtQllXbV9lo1ZOEe8vKTlMsJbO7Aghr7neYPbcNWzUXq84hHKgg4INPz2QKiWVQ=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Patrik.Berglund@arm.com; 
Received: from DB7PR08MB3609.eurprd08.prod.outlook.com (20.176.238.153) by
 DB7PR08MB3738.eurprd08.prod.outlook.com (20.178.46.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18; Wed, 26 Feb 2020 10:41:36 +0000
Received: from DB7PR08MB3609.eurprd08.prod.outlook.com
 ([fe80::a965:db59:f30d:2d3d]) by DB7PR08MB3609.eurprd08.prod.outlook.com
 ([fe80::a965:db59:f30d:2d3d%3]) with mapi id 15.20.2750.021; Wed, 26 Feb 2020
 10:41:36 +0000
From: patrik.berglund@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] TF-A: Add git development version
Date: Wed, 26 Feb 2020 10:41:16 +0000
Message-Id: <20200226104116.31475-1-patrik.berglund@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LNXP265CA0089.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::29) To DB7PR08MB3609.eurprd08.prod.outlook.com
 (2603:10a6:10:42::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e123756.cambridge.arm.com (217.140.106.53) by LNXP265CA0089.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:76::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend Transport; Wed, 26 Feb 2020 10:41:35 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: edafe061-90c2-4da9-4efc-08d7baa87838
X-MS-TrafficTypeDiagnostic: DB7PR08MB3738:|VI1PR08MB4272:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB4272ACA27525BB43342B43F1F1EA0@VI1PR08MB4272.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;OLM:1360;
X-Forefront-PRVS: 0325F6C77B
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(346002)(39860400002)(366004)(376002)(136003)(396003)(199004)(189003)(66556008)(6486002)(6916009)(4326008)(2616005)(2906002)(16526019)(956004)(26005)(66476007)(478600001)(186003)(66946007)(5660300002)(86362001)(44832011)(52116002)(7696005)(6666004)(36756003)(316002)(8676002)(81156014)(1076003)(8936002)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR08MB3738;H:DB7PR08MB3609.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 yVpnS7cUKSzHNiXt8R8KTtkpbumrNesx2dH5UHA3+atNyUmT15UG8/QsGQWbIWhoQrR7iQmgpBi+0eWyA+mmflNpvGxJOsYg+vXNjQP9e+gkoCtCBF2n0rNzwC4D1NhvDQF1WASYGh2dy35Hwz8UI2JVZmXigQEuWWSlwQcUjR3YMVN6/gotMCzO+9wRo2Xt+Z1kH0PpevEegodKsK3Yt8rzTdqt6N1jBTgRRVXm+h9/xclFGLSn9WkWOrnAbDE/Lm5u9O6Cmxy1waob/2WJHwS6DvfTKzOS8nJ0152Oq60SRt0W9JExiKO9hcng8g7VYZCwIDE1DCeydGwNZbIGEQevKYQTRkxkygiO/vKFRpVkg1/6kOTeSxuUdIPYf1OF/M2DH6wtqjnB99JD4ApTKiWhevnxDpxLjj80kN/OwdaW6a7S614IV/6ASmnzhvrv
X-MS-Exchange-AntiSpam-MessageData: 
 TeoH9tj7LJhwfuuOf+GB40uvldnCBcm6FwQLQL1qGiyKiHdlg1VfAg+8t1nYFyid/g7NP/UR3s2BxD35xTVS32sYQpcZ8uW+sR8GejuDnKiRBhA2iSgy6q1sJJSDm5f19Fs20S7RE8ZtpyWGVyvncQ==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3738
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Patrik.Berglund@arm.com; 
Return-Path: Patrik.Berglund@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(346002)(136003)(396003)(376002)(39860400002)(199004)(189003)(36756003)(16526019)(186003)(6666004)(70586007)(44832011)(956004)(70206006)(356004)(8936002)(1076003)(8676002)(81166006)(4326008)(6486002)(2616005)(336012)(81156014)(26005)(478600001)(316002)(5660300002)(7696005)(2906002)(86362001)(26826003)(6916009);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR08MB4272;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;MX:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c3bb2fea-191a-4d02-58e7-08d7baa87406
X-Forefront-PRVS: 0325F6C77B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A2f4jpwVnNGesynwUfwtKjJmWJ12q2S4yRscW0aEMeYlclgimdGkmczbpe6qaCfilj206LOwNNTejvKPYkHVKusOhpblaN72smuFBhtOJutXjXkZM/5yQzZgH2PZVmXI7XLJEuq49R21anPjYwYJ0J3UAM0tivOcOMFu9qXPxD20641y4nivI2/ecUfWerm9dVTQCUfzHBeeCact0Wapx4y6zAELuoq24ZKMBwMaY9+bbj8kSAvXz3OZEG9Clp7FsOJWcVrdCxJAvdDjFNmuQyu0AeOn+JzWWiZUcvW2f1TFWiWXORNoOSP/GdVKnjY/Ve+oln3lF1zwd5Tv3GkVFi8dn0+yd92CX57P1uwkob25/4CxqE3W6MeHKOITtsYOwsI82v6u1i598WlnpIb/XA13DcvYp/dbTuzt3cDwbUyp9igH61qQV+yVvl8VjLqu
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2020 10:41:43.0072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edafe061-90c2-4da9-4efc-08d7baa87838
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4272
Content-Type: text/plain

Change-Id: I7f734d2f89ad8da6eae55403691806b9d9106f15
Signed-off-by: Patrik Berglund <patrik.berglund@arm.com>
---
 .../trusted-firmware-a_git.bb                 | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
new file mode 100644
index 000000000000..4bf3ae5e4892
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
@@ -0,0 +1,38 @@
+# Trusted firmware-A points a commit rather a tag
+#
+# This is only a base receipt and should be bbextended with suitable SRCREV_tfa
+# and SRCREV_MBEDTLS and target TFA_* variables
+
+# Never select this if another version is available
+DEFAULT_PREFERENCE = "-1"
+
+require trusted-firmware-a.inc
+
+SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa"
+SRCREV_FORMAT = "tfa"
+LIC_FILES_CHKSUM ?= "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
+
+# mbed TLS source
+# Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
+SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls"
+LIC_FILES_CHKSUM_MBEDTLS ?= " \
+    file://mbedtls/apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+    file://mbedtls/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
+    "
+
+S = "${WORKDIR}/git"
+
+# The following hack is needed to fit properly in yocto build environment
+# TFA is forcing the host compiler and its flags in the Makefile using :=
+# assignment for GCC and CFLAGS.
+# To properly use the native toolchain of yocto and the right libraries we need
+# to pass the proper flags to gcc. This is achieved here by creating a gcc
+# script to force passing to gcc the right CFLAGS and LDFLAGS
+do_compile_prepend() {
+    # Create an host gcc build parser to ensure the proper include path is used
+    mkdir -p bin
+    echo "#!/usr/bin/env bash" > bin/gcc
+    echo "$(which ${BUILD_CC}) ${BUILD_CFLAGS} ${BUILD_LDFLAGS} \$@" >> bin/gcc
+    chmod a+x bin/gcc
+    export PATH="$PWD/bin:$PATH"
+}
-- 
2.17.1

