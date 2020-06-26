Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.54])
 by mx.groups.io with SMTP id smtpd.web10.4328.1593164933478669663
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Jun 2020 02:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=qkq5bYii;
 spf=pass (domain: arm.com, ip: 40.107.20.54, mailfrom: teo.coupriediaz@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTy7mL+IhSyqP78Ls3xMx2uFhNbxAqiDODKnFacvHyI=;
 b=qkq5bYiiLTmwQ/6KNC7/ytNenRqLIXJJeTHLy25a8FyQGHTu0+iMxzV3tUdeWgLCe20Mt/Idl0WhPotDqpTl2B+dsSxmxeloXChuybDXgxK6E8PwZM55FTULqwsTYskMCZiL1QoHD36A3fxiyKIxiLwjeFylGXkI4KlBTgcZlHE=
Received: from AM6P195CA0056.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::33)
 by AM5PR0802MB2418.eurprd08.prod.outlook.com (2603:10a6:203:9f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Fri, 26 Jun
 2020 09:48:51 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::c7) by AM6P195CA0056.outlook.office365.com
 (2603:10a6:209:87::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend
 Transport; Fri, 26 Jun 2020 09:48:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Fri, 26 Jun 2020 09:48:51 +0000
Received: ("Tessian outbound 2ba684f51d22:v59"); Fri, 26 Jun 2020 09:48:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 864fb6e8053529c5
X-CR-MTA-TID: 64aa7808
Received: from 90cfb0485318.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5BDD6D7B-FE41-4D70-BDC1-59BC7E4EBF3E.1;
	Fri, 26 Jun 2020 09:48:45 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 90cfb0485318.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 26 Jun 2020 09:48:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9vKz715HobqZ/Jl0/npkD9ZsauT5aiMbH6awDVBPhrze1S+FReZDbdvFl6AmSm4V5vd1TMbJ5vdUIwS2EqPprAuafDFeYqUFbbynB0oexIlsCY35jHtClrAu+yVilYrFzKQtysLP0BfRmkLELWlIFPViNeNjtx6Oir0pf/v++OUZJK0shhbtmPivwHcQB2V4hbXXLrz/W/owIsgiSECq4BbweT/YrIUQloRal7pinNBn/g5zT6VrKTbsXVAYeHXshf73rKfVE82pyqsdoJTlPOC1WcMw94AKn+1G8yifofnGJszXfDM99QsH1/RnGn2gWxsugk6lW/iPMY9pMnDbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTy7mL+IhSyqP78Ls3xMx2uFhNbxAqiDODKnFacvHyI=;
 b=nJZZ9bg/iD/f0SvmmL5O9OkIO6BF5d0P/vPVkf0eKDWfkJkNuzfu+Boo5o6b8YeouUqwCksxRTaiRA7Ebk8Ag27x0GjhU60vjhBvCJkGidNx45uK9BNnFebBtvKL2sqn88n+lRIP0kgTzVP7FylQGEnXbqhrH0MQVircFAHD8ml5jtlTBI7lrKtvQykrOehQA63F3d5uMZqRMTFdufPnaEheCYb6Ej8e93SoPyTOVyI+9UdqaFQ4DtvABBEdT07LCYYVf23wDAWa9ECrVbuAbyHkkKoZIHYj1pgqDaOShCkLE1EFj9dbjdTGPj6rFeFuBXAfF46O3dPqGtXYUIq69w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTy7mL+IhSyqP78Ls3xMx2uFhNbxAqiDODKnFacvHyI=;
 b=qkq5bYiiLTmwQ/6KNC7/ytNenRqLIXJJeTHLy25a8FyQGHTu0+iMxzV3tUdeWgLCe20Mt/Idl0WhPotDqpTl2B+dsSxmxeloXChuybDXgxK6E8PwZM55FTULqwsTYskMCZiL1QoHD36A3fxiyKIxiLwjeFylGXkI4KlBTgcZlHE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3208.eurprd08.prod.outlook.com (2603:10a6:209:4b::10)
 by AM5PR0801MB1700.eurprd08.prod.outlook.com (2603:10a6:203:36::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Fri, 26 Jun
 2020 09:48:45 +0000
Received: from AM6PR08MB3208.eurprd08.prod.outlook.com
 ([fe80::a4fd:b8df:a939:965e]) by AM6PR08MB3208.eurprd08.prod.outlook.com
 ([fe80::a4fd:b8df:a939:965e%4]) with mapi id 15.20.3131.021; Fri, 26 Jun 2020
 09:48:45 +0000
Subject: [PATCH 1/2] arm: Introduce 4.19 Android Common Kernel
References: <1593102479-27307-1-git-send-email-teo.coupriediaz@arm.com>
To: meta-arm@lists.yoctoproject.org
From: teo.coupriediaz@arm.com
X-Forwarded-Message-Id: <1593102479-27307-1-git-send-email-teo.coupriediaz@arm.com>
Message-ID: <4fc39386-999c-b508-abc7-ba009c4ede3e@arm.com>
Date: Fri, 26 Jun 2020 10:48:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <1593102479-27307-1-git-send-email-teo.coupriediaz@arm.com>
X-ClientProxiedBy: LO2P265CA0226.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::22) To AM6PR08MB3208.eurprd08.prod.outlook.com
 (2603:10a6:209:4b::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.57.54.93] (217.140.99.251) by LO2P265CA0226.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:b::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Fri, 26 Jun 2020 09:48:44 +0000
X-Forwarded-Message-Id: 
 <1593102479-27307-1-git-send-email-teo.coupriediaz@arm.com>
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a8a30ac8-5157-43c6-4549-08d819b621ab
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1700:|AM5PR0802MB2418:
X-Microsoft-Antispam-PRVS: 
	<AM5PR0802MB241874670EFAD334B22A4980FA930@AM5PR0802MB2418.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:64;OLM:8882;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 mg4/eaTYOxE9Tn6+MzORPk5yRSG61gWFiqrZIWSHdfoLFUvGyFVBijzGMrt+KEjcR8X9w1HZWFO9Y4mrhGZH+ZtGDO/D9ftK5u3uMUX+jXeyOZi/AJN9ysBgzJDihJgsjB4pEG3/QktKnNfYeH3NE7IncGC7sN1eBwS/sqdCVv7UYgM1RG3E4NjfS5CRN8wRN+okhbGLChHfx2ky/z1jGIXRX7+gCeMR8etQoUrLOEpaRrq9YzX/MtQR6YpqElVVHb1AcmAaim9SqHpaAEM5rGvqKghz202e0KWNbhnNX/m9NF9jXPNfmI8mKVmylkcrBGwc45XiVXp6S3DWbhWZgeksihkR+TXgVUzntQAm105OwX+fpagxT76KvEuCxNyT
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3208.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(16526019)(16576012)(31696002)(36756003)(2616005)(52116002)(956004)(31686004)(316002)(86362001)(2906002)(478600001)(186003)(26005)(66946007)(66556008)(66476007)(6486002)(5660300002)(8936002)(6916009)(8676002)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 gzWtUorsa6VGfyd5s+WPGr+mays78C6JmrO79QfpDMK0w7gej+tl6C5fckY6mpzJMBmFadyQyoVBbdMW5ptMHX9zYJR1ZnreTSa+9vJtwcul3XbXoz8Ngy4OT7el7uNd5byq3d8Va5jJVreVDK6IauN+Pjcd2E62ZDN/71IijHVrbynJ6P+N6EAMMqVLhPf/gkaiY4Ch3by0jGE+J5O1mEx6qQWXSc1pQK3/bsYmxGHzpvYFHOJn7AkAvPPKR6xtZASfTkn9v7MMyitlyR56GGS9Kc7qEMxnHE5FkDzx1PRpjWjrJ5/EhYIiwWAq1oweQndK2Kgr6Xd7gP+cjhaoYm76rKHsFxNfHPqsVSLQv3J39nEA52jOCMZt2S4iVVX69e80oviyb2pfyIeyX2VxDIlBtcVT2MnKPDWQT0M53QYa3kHQongF0mHoK+tCTp8H66Jb4NRk7NbGreYRKa4QrIqMzBuf9S+I8Ob69O7mplo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1700
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Teo.CouprieDiaz@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966005)(86362001)(16526019)(70586007)(8676002)(186003)(8936002)(356005)(6916009)(16576012)(83380400001)(2616005)(81166007)(5660300002)(36906005)(26005)(316002)(70206006)(956004)(31696002)(478600001)(36756003)(336012)(6486002)(47076004)(82310400002)(2906002)(82740400003)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e7e08bc8-e5e7-4185-7cb2-08d819b61de4
X-Forefront-PRVS: 0446F0FCE1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	teOebctcDeEJzkP3weETkTTqX6MXf4U25GRw3Tbd/ETl8pTO24Bqm3HbQrfysJQbiW2Oo4HSnCqmPki9b0jVUTOzXxhZrhpQah101RfzC9lhjHLBA7HtCq9yl0zekqENZsWqcTq9P1K6ngTZ1j+zHgP1X0HUKjDrQsNj93myXhiCYTUE5vqGBKedevW0coava4rCNfhjMRE2M0LLXbmoNuPKuaJVDbWbLP1B1T2wPBdeWeUdpPwZw7ClEeIkQyuf0pn/2mlqZ7jJ+T/c2qk8HtQ1lKJQ1d2pFBBQTugWZbd9pxjVFK5t+qYKWvkfHsCfWrL6Hem/Fkcv7sYxtpScDpKm9i8hS/WdnRu2lrWIbMGbbJ4iiyaYcXUyFzeyy9XF+91UMl/mPEIx7Xo0p3YxMGFEySzZLY6FXhab9S3oVDQ=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 09:48:51.2000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8a30ac8-5157-43c6-4549-08d819b621ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2418
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

This recipe targets machines based on arm64.
Change-Id: I9f9556c3ce3636a31fb3a6faf38494335be6b997
Signed-off-by: Teo Couprie Diaz <teo.coupriediaz@arm.com>
---
.../recipes-kernel/linux/linux-arm64-ack_4.19.bb | 29 +++++++++++++++++++++=
+
1 file changed, 29 insertions(+)
create mode 100644 meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb

diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb
b/meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb
new file mode 100644
index 0000000..99db960
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: Apache-2.0
+#
+# Copyright (c) 2020 Arm Limited
+#
+
+
+DESCRIPTION =3D "Linux Android Common Kernel"
+SECTION =3D "kernel"
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D
"file://${S}/COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8814"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+COMPATIBLE_MACHINE ?=3D "invalid"
+
+ARCH =3D "arm64"
+
+SRC_URI =3D " \
+
git://android.googlesource.com/kernel/common.git;protocol=3Dhttps;branch=3D=
android-4.19-q-release
\
+ "
+
+# ASB-2020-06-05_4.19-q-release tag commit
+SRCREV =3D "ebd43352dd92e56f14a4985a3c99de767fc8f9cf"
+
+S =3D "${WORKDIR}/git"
+
+LINUX_VERSION ?=3D "${PV}"
+KERNEL_VERSION_SANITY_SKIP =3D "1"
+KBRANCH =3D ""

--
2.7.4

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
