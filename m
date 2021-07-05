Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.48])
 by mx.groups.io with SMTP id smtpd.web12.11276.1625494644103868108
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 05 Jul 2021 07:17:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=gZCzTWp+;
 spf=pass (domain: arm.com, ip: 40.107.13.48, mailfrom: ben.horgan@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d58gUfS2EkOE8ePFObzlz8UX96NsE+ek8B5nU4wh3bQ=;
 b=gZCzTWp+NEe6wuqbKjzonEXpRNLWjbC+LRqGHN2wyAN3dYh7NMWaqiSt8SCpNowEb7kN/yKHRC3eJ960orSaIJlXCUvVPXs/isK6/C9ld+6ZSnybsKdPQbzMGmhTVDY5bBzZS7AtGejJzunoI+8oxZftkO/R26SDvZLF9MsvcY0=
Received: from DU2PR04CA0020.eurprd04.prod.outlook.com (2603:10a6:10:3b::25)
 by VE1PR08MB5280.eurprd08.prod.outlook.com (2603:10a6:803:10d::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 14:17:20 +0000
Received: from DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::55) by DU2PR04CA0020.outlook.office365.com
 (2603:10a6:10:3b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Mon, 5 Jul 2021 14:17:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT028.mail.protection.outlook.com (10.152.20.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 14:17:20 +0000
Received: ("Tessian outbound 71a9bd19c2b9:v97"); Mon, 05 Jul 2021 14:17:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f17166e150a7c82c
X-CR-MTA-TID: 64aa7808
Received: from a3f571a90047.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 675CBE6D-ABE9-4B7A-BEB1-79C0F1F4A1FC.1;
	Mon, 05 Jul 2021 14:17:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a3f571a90047.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 05 Jul 2021 14:17:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agG+xeUUpb0rSfPjLtnDEJ1sZ31wcrHnS4supaat89N7E6updtZBv5tVl67aiIct276q/de7zQnN+1PcAp5ZNMpskkQM6X8vAYPnB8rhHhuO3zx3hWZnBSAsQ9Wi+hyjfHdeCrS3sdikTRfFnWaXwPb6Tm5J/QHqWJikfXvh1i6+Raw0Nh/wStjfV8YpZVFVl/JiETsZW44ezZ7Iv+1xto26XtQwju4nBuRwkDXev5tZngYxt7PrqKEuTq6e5BOhjovhl7OoSNAlsBrdBu0Srup4R+sR5+W6t8vO1uPaD3y/CPuxF6YW3LEhl2ra56WhZkgyxRtZQnT5d4wcgJ5kpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d58gUfS2EkOE8ePFObzlz8UX96NsE+ek8B5nU4wh3bQ=;
 b=SAgFUEwpalIKMn4B1qAdTzasnjS+gY14CLUi4q26RKrxHFEm2TaPogWehjqo6cWYsqiCu3FqfgxKbv2jiQVfz+AQBCq/G0YGW98leC8z/j5GgIXS9sTDmGouN0tIlyOMVcabUPkcPbB259LHQzdId47jXtQRqnJTufYor0jIl4FN6XnBzrQKCMInXZYJHehBTCwcYal9YJU6xRV+Rn8MwgD5ifkltEzL+oYiKPkaFZgk2Q8bzG8I4aPGzEAOAxqP2rxEE1eRkenRoI8mLHJ53VtYALFOqBDLS7LC/0KGLujzKwVhgWUIu6vI0XSYVt7FRzBKV1mMXig0YVBb/k9+5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=arm.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=arm.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d58gUfS2EkOE8ePFObzlz8UX96NsE+ek8B5nU4wh3bQ=;
 b=gZCzTWp+NEe6wuqbKjzonEXpRNLWjbC+LRqGHN2wyAN3dYh7NMWaqiSt8SCpNowEb7kN/yKHRC3eJ960orSaIJlXCUvVPXs/isK6/C9ld+6ZSnybsKdPQbzMGmhTVDY5bBzZS7AtGejJzunoI+8oxZftkO/R26SDvZLF9MsvcY0=
Received: from AM5PR0202CA0023.eurprd02.prod.outlook.com
 (2603:10a6:203:69::33) by VI1PR08MB5343.eurprd08.prod.outlook.com
 (2603:10a6:803:12d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Mon, 5 Jul
 2021 14:17:10 +0000
Received: from VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::8e) by AM5PR0202CA0023.outlook.office365.com
 (2603:10a6:203:69::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Mon, 5 Jul 2021 14:17:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT032.mail.protection.outlook.com (10.152.18.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 14:17:10 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 5 Jul
 2021 14:16:53 +0000
Received: from e125437.arm.com (10.57.91.10) by mail.arm.com (10.251.24.32)
 with Microsoft SMTP Server id 15.1.2176.14 via Frontend Transport; Mon, 5 Jul
 2021 14:16:53 +0000
From: ben.horgan@arm.com
To: <meta-arm@lists.yoctoproject.org>
CC: Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH] arm-toolchain/gcc-aarch64-none-elf: Fix license checksum on x86_64 host
Date: Mon, 5 Jul 2021 15:16:51 +0100
Message-ID: <20210705141651.25564-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55ad651a-b827-48ca-61d6-08d93fbf9a1a
X-MS-TrafficTypeDiagnostic: VI1PR08MB5343:|VE1PR08MB5280:
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB5280F6706C932F75BC10C4A0911C9@VE1PR08MB5280.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:296;OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 tXTbnRxLk4j04UxXy2QiSNo8JCxLjjZeWKTojzyYJ0ZL7oQZZK0L2vdHqMtzD+0Wb1UIbuSOt2qy7bifXi2cAq9nVpsmjcv4B5zgsi0M6cglQIHQksAj4jAH9luAPgZfeLA9ObrW0xtW1PutzRAlr2cOAEPj3t8p2yMMwqkC+9dTkZzHN8G1gEDt0RDhK7bSOPO1iObdfbBrwadA5fVry7rfIpI4/sZGqjOFDVwCgZGq+Vw0tDNajqqiXTc1RkWeX27Hz2VzYmcnak4eHq6NsBM6QuLnk1HIqoHj/Bs4Az+H2/OYrTPlPdaTjg2kn86s2kktNAcV1ntpov1GonSsxxmxDZpWuHoGN4KsB14moA0BHF+4U5LlH41rybzWrXpmKyeN6gSD/2HlUMxYsovNUjdraWRLKAxMckQ6iG8rXnfV3VG0HLqI5RkJfsHxqwQ7Mv0N2RgtiCJ1G2JPE1ejRHOZgYQ8fViX5XTWQbLDULHP8futpANkrsl583OgyxcV3bePJiophLJgrO5kpHQGHz0C2zTczqnET5TfXI7deo8mDGJ0xwnfABW8O/es6y0Ok8ESAPCUZTuIWSRnwskTdjEjzbhQ/0oJvEbI6nS1Mw8MJJpZOO6IYLxGVGm2K+Ff+KgYyUa/UjANjtfUjCp/wchuNFw8s3mvxfFXSi57XSE9IvHWmaj+ONDENsIRPUEB5RjNAk+AzoNxAd2VtOdzquI0FhumWHzLZwT2PLKdx/c=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(36840700001)(46966006)(86362001)(426003)(336012)(81166007)(186003)(83380400001)(26005)(356005)(82740400003)(36860700001)(44832011)(7696005)(1076003)(2906002)(5660300002)(2616005)(4326008)(316002)(70206006)(36756003)(8936002)(478600001)(82310400003)(47076005)(70586007)(8676002)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5343
Return-Path: Ben.Horgan@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	85e362d0-bc84-4ce6-2f0d-08d93fbf940c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+ipX2BiRQ72l5e/ANMCm8a5GLk5sYXq5imwvNBxkJeR7VQQdlqEu8IvpvzgzfnOKjFN7oMkFfga3PjV8CMZVSJquiHW/y75nYB7tSRRmrLd7ifRHwu9e1J1RNMRflZKvVJ6XJWuXSs+W6bhfP/Q0khWC8nSih+9ucLbINjeDtT17gS/cTa25Z6RUtJoLQJftrM9Xvw/z/devSoO+8pfx6E2f5q7auiG//WDhAVXNfVsCYn5cybuHwFd3oMZYGQiSbGcyFHpYx87pfZQ1PaXap4uXQ1R30sP8Rf539M08SGrffFOQb0KYRJeEOiQ6SPVWFCfT/2JM0u09eeRY1eCvnLuThm7Me5Md4lfJZAA4PKVwfNKLtsI5YhMvE34vdmwHOt3cRVr08H5QpraRT44ULriDO1cecsNeyZO6bt2dAAskDkYvgiEc334GX5GiZxiiY0zW8XpkeQoEEIGF9ng45s5tB/7mYUJTLho8vc6+Ib6OMENSoJ5a5GwWTtC4QoyE+Ik3a5wIJyHtvqS+Josr4vrbCQyNndMu9E3nAxtD9i4pcQ02X+pS9mwXMe80KQHRQXLKwD5S8Q8dDgkItJ8/skzH2Q5J+kOJS5e0Ulnc+BWRyerda+HcEgT+fUtD8Px2aiqtwLBoiNZk8qopunjfsPc4+0hV3FYFNqmNKkBgvcZepVJ3VOBTcCPI38v0wzvriGNx9pj4CU4QO9NLgiwNgw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(396003)(346002)(46966006)(36840700001)(7696005)(82310400003)(8936002)(478600001)(83380400001)(1076003)(81166007)(6916009)(26005)(8676002)(36860700001)(36756003)(5660300002)(70206006)(82740400003)(86362001)(70586007)(47076005)(2616005)(4326008)(426003)(44832011)(2906002)(186003)(316002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 14:17:20.6269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ad651a-b827-48ca-61d6-08d93fbf9a1a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5280
Content-Type: text/plain

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 .../external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb
index 5cbab9e..4599831 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb
@@ -10,7 +10,7 @@ LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
 
 LIC_FILES_CHKSUM = "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH}"))}"
 LIC_FILES_CHKSUM_aarch64 = "file://share/doc/gcc/Copying.html;md5=1b548d9c341b3b5c82bc88551964aa60"
-LIC_FILES_CHKSUM_x86-64 = "file://share/doc/gcc/Copying.html;md5=c1df856e21b17e58b0adbe29cacf4bd4"
+LIC_FILES_CHKSUM_x86-64 = "file://share/doc/gcc/Copying.html;md5=e4bcb5bee0c4a50c06704b0b73fcbe0c"
 
 PROVIDES = "virtual/aarch64-none-elf-gcc"
 
-- 
2.17.1

