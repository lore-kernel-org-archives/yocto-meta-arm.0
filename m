Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.72])
 by mx.groups.io with SMTP id smtpd.web10.21527.1593609615681552887
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 06:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=RXXgTowy;
 spf=pass (domain: arm.com, ip: 40.107.13.72, mailfrom: gabor.abonyi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29WVnzxyShQkyL0BTCLw/1RU9EthEZ0cDQv9HAYD3Ug=;
 b=RXXgTowyR0L+sYbF2E3GYia1GosEvnxxWrvYbeyQHqE19ipf9W/bwvL7izH2rmFSt/9txGIM94X1a3qoSk0r+sG/wFYO0/4Zbu8Uw8KcWWgqViKy1PIgEYAWMTuNCmgjqFALfpNwDQQbcFFpbC+AoRgRU0i45afCaL4oJszjnBc=
Received: from DBBPR09CA0046.eurprd09.prod.outlook.com (2603:10a6:10:d4::34)
 by DB7PR08MB3465.eurprd08.prod.outlook.com (2603:10a6:10:50::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Wed, 1 Jul
 2020 13:20:12 +0000
Received: from DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::89) by DBBPR09CA0046.outlook.office365.com
 (2603:10a6:10:d4::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend
 Transport; Wed, 1 Jul 2020 13:20:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT040.mail.protection.outlook.com (10.152.20.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Wed, 1 Jul 2020 13:20:11 +0000
Received: ("Tessian outbound e44de778b77e:v62"); Wed, 01 Jul 2020 13:20:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a8362544517a9a9b
X-CR-MTA-TID: 64aa7808
Received: from 7a850967f99d.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 456D0704-70C8-4C67-BE9A-F29B32E71214.1;
	Wed, 01 Jul 2020 13:20:06 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7a850967f99d.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 01 Jul 2020 13:20:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juLFrP3IHV/WVjbIH9lLnIyxf6VL8P5Gj33qJnDh364lmtdqXUDQmhvfuAYMDhGOw2svE4PChwEEEO+tRHhNIC8uYNUtpguPctT8q3XOEKT1UwsPV6zGajg3j8wr8bXHy+zVWvTQuv6bHg1qLk7XwK+oNaA63rHducBulA75NSBZHqcG6P8SACtfI3SGi3oKTt+La+GP2L+OBkGcqR/WOKi+MnKX1jJzAP+mKs7n2Pl1rjGkCGlR8YnUAgieOOsZmc2Tq76J58KqPS4983AXTeKH8GKTplY/pcu89ZJLGQsWw40DKy3+e8uFKYpHGzrrnVOvqZ4mkWNohM6h5ozCNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29WVnzxyShQkyL0BTCLw/1RU9EthEZ0cDQv9HAYD3Ug=;
 b=l9XvFck9ydmJ7y6MXanM3v2ywtX3GCsEfayZ83hmVky5RbKfLb5bag+wriab6bYwgnxQQ17tTEgJTGNMgkptiNGyJLruipy0urqtVv0omI8CtZlduDLQTYmpUZi5ds639d7zBOc7hf79HG/UZEz+/f1GoMeuFHukn1xouYLEaLcMLifJzw7ueGkqRv3Ea9oL6L5oDMyL3KW4Da7ZKWQhCWeymboPWoAKbNxSclJu/MH4f2WST0DygjMIVxbC6rIztawpln/yRYHdtm91V2yLLLIaqww5ydoSWxfbEHwU499x+wkoVJjyExeC30GkykrGIr7KWbSAAFYZoO2RGkmwcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29WVnzxyShQkyL0BTCLw/1RU9EthEZ0cDQv9HAYD3Ug=;
 b=RXXgTowyR0L+sYbF2E3GYia1GosEvnxxWrvYbeyQHqE19ipf9W/bwvL7izH2rmFSt/9txGIM94X1a3qoSk0r+sG/wFYO0/4Zbu8Uw8KcWWgqViKy1PIgEYAWMTuNCmgjqFALfpNwDQQbcFFpbC+AoRgRU0i45afCaL4oJszjnBc=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 (2603:10a6:800:b2::22) by VI1PR08MB3838.eurprd08.prod.outlook.com
 (2603:10a6:803:b8::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Wed, 1 Jul
 2020 13:20:05 +0000
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::4d1f:13c7:837c:2b74]) by VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::4d1f:13c7:837c:2b74%6]) with mapi id 15.20.3153.022; Wed, 1 Jul 2020
 13:20:05 +0000
From: "Gabor Abonyi" <gabor.abonyi@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Gabor Abonyi <gabor.abonyi@arm.com>
Subject: [PATCH v2 3/6] arm: python3-cbor: Add recipe
Date: Wed,  1 Jul 2020 15:19:37 +0200
Message-Id: <20200701131940.3084-4-gabor.abonyi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200701131940.3084-1-gabor.abonyi@arm.com>
References: <20200701131940.3084-1-gabor.abonyi@arm.com>
X-ClientProxiedBy: LO2P265CA0019.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::31) To VI1PR0802MB2414.eurprd08.prod.outlook.com
 (2603:10a6:800:b2::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from gabor-VirtualBox.arm.com (178.48.104.185) by LO2P265CA0019.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:62::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Wed, 1 Jul 2020 13:20:04 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [178.48.104.185]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 05d88625-bf8f-435e-046e-08d81dc17c0b
X-MS-TrafficTypeDiagnostic: VI1PR08MB3838:|DB7PR08MB3465:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB3465D89143A9A09F39F933D18E6C0@DB7PR08MB3465.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;OLM:2089;
X-Forefront-PRVS: 04519BA941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 dDnEwEj+S1+ptFoq7bm/TY2dH+YpYWUZe+AR7kVE3fxYghF+aGmBHabGJDyshbWk1nl4Qjz5D1Z8bU9PFFcTKO/RvsMuXAcTQJU3BwOx+mzi9501ioK/uVDitl0i+A1bU2dy6sQpsyhTONz172/kqkJ/DhqWGAxegnsbthi4nX1pM0cbSJLbPPFM5dDLRxIvpvOF3d+I7z2oNLmC+RTOFZ3sfbmUGpSpBbYBDKm6/CfdNhjHzpU8P2vEqbpH3ixxkCPcCzOtEY6yIGLz6chBvkeT1jjk54/2oEwiCEG/NDq3qlHXGA/9PuqvAigsXERJ9nq1NfKkFTDPzmLcbAJCVyO1b4hr93HTH6nmlPbVHhxfqF2EPCw9tmSyypmJ3rS/5kGM9CxPfi/K4xG3x+0b9A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0802MB2414.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(956004)(66476007)(8676002)(66946007)(2616005)(478600001)(2906002)(186003)(6486002)(4326008)(8936002)(16526019)(6666004)(1076003)(26005)(6916009)(36756003)(44832011)(316002)(86362001)(66556008)(52116002)(5660300002)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 8zZ7tHdOy9jE3NmYy191wpUVotduqJlN3EZFlTDlaWCwjgTvK5V+3yWmWHlec0togszsyA8eY0IgArRbainFUxDgemrIm92Rhcqz+t5ShaM1PgTvTaPc7BC8fa4cG8CSxRw350C3yCDyTf5EljbMY0l6XG1RCL91gOUFn/K+FKV/43dWMWKwV5mW0c+cy6IGW4oet6HhKRsEJPgP5tV7AQVmN/rtJVsVczJk6sHP4AuDRVlAm5A7EBKnhuZ6qTuuZqU3nvtUsgIcR9Pu6D0dr5YAXYS/Q4lpzrxFYtuyVjqRVkeh5hknzirnoN+iUHxJbfq9ZAtJxiJyoSSux4o1ZTH233mQwpNRbOyY9H3/dJYBJ3Jpibus0pZiQ0VrgWMk0P0c6MR8p8vFLcoUyKnrraLVy5SZwJDvsHCRXzHKJ9MpUSWPlSB7Y2nOrtWBduiowAfVKwIG0F/nUVwFdM9IHOf5z1sfS3H4ZM4xsp7q3/rTpvJtGsm5BIiIM1nbiV1s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3838
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Gabor.Abonyi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(46966005)(316002)(8676002)(6486002)(1076003)(2906002)(81166007)(70206006)(6666004)(82310400002)(5660300002)(70586007)(356005)(36756003)(26005)(44832011)(2616005)(86362001)(16526019)(956004)(336012)(186003)(7696005)(6916009)(478600001)(47076004)(82740400003)(8936002)(4326008);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	796a9cc5-59ef-422c-13e2-08d81dc177cc
X-Forefront-PRVS: 04519BA941
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bVUYYixqw8yL3Ca4SY8iWqSmOzSRgmCbv+rl7AWYwwHe6Gj7CMKUAheDig46qiPpDqP1wtY/MBV6nUpvHd7J9bkKD1jXePPMSv+Nys/LE6YSPsta1ZryecL6URwMBnilVeJudrpDzXvetXms1Xyc3svSYptsU4/Q44x5gJFKJEK9qkzhPqXUp/MoQuAkeSiibor+RVxrngZ/M8u2mm4TL28eSni/FN7QPZhgzhJ4I+hyM6P4lllBLmQFHrutUWNlgAvgbrqxCBnjCOrnVsmhXOZMniL53FFWg3vphNHhSw+neChNTsdVubTQCIhC1MGWhTvFxlfqpQftuMM+/TgOU+BfemsW5MRjIyI2U81FR8bu/9FKJxz9ZuXhGaq2NmxwS4RDqlKwgtXPrFkgc76vo9PgM9cFvRhcK+T7qn2Km0onlLSvIeYvCFl+rF4/94uL5JfmoojwcmocnupOry+HOFnroSQgCzFyNp0sMg4gpSQ=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2020 13:20:11.9835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d88625-bf8f-435e-046e-08d81dc17c0b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3465
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Adds a recipe to pull cbor pypi package for python3.
This package is required to compile Trusted Firmware M.

Change-Id: I86ef64a573e3daafb1b798800c4a0c05b292078f
Signed-off-by: Gabor Abonyi <gabor.abonyi@arm.com>
---
 .../recipes-devtools/python/python3-cbor_1.0.0.bb  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/python/python3-cbor_1.0.0.bb

diff --git a/meta-arm/recipes-devtools/python/python3-cbor_1.0.0.bb b/meta-=
arm/recipes-devtools/python/python3-cbor_1.0.0.bb
new file mode 100644
index 0000000..7c529f3
--- /dev/null
+++ b/meta-arm/recipes-devtools/python/python3-cbor_1.0.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION =3D "An implementation of RFC 7049 - Concise Binary Object Rep=
resentation (CBOR)."
+HOMEPAGE =3D "https://github.com/brianolson/cbor_py"
+
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4=
e17d99a7cacdbeed46a0096b10"
+
+SRC_URI[md5sum] =3D "22b03b59784fd78cb6c27aa498af0db6"
+SRC_URI[sha256sum] =3D "13225a262ddf5615cbd9fd55a76a0d53069d18b07d2e9f19c3=
9e6acb8609bbb6"
+
+PYPI_PACKAGE =3D "cbor"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND =3D "native"
--=20
2.17.1

