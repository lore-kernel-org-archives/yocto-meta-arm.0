Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.42])
 by mx.groups.io with SMTP id smtpd.web11.1308.1596220557193005664
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 31 Jul 2020 11:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xpy9U40e;
 spf=pass (domain: arm.com, ip: 40.107.14.42, mailfrom: anders.dellien@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FvxUMfFizDruYgiKA99XwblJMuIF+fNfhp0cOMUm2U=;
 b=xpy9U40e/iajIFviuyNpKe6dXbf8WRLuWiU9zwib/wfnyHJlEoZeEhbyUTOes/xOfHBriKny0SsRLDgWQe4qG/7eWOTKEnuBg7Et2EvJM0aO4arUdle+wDz73GiQfEQnKwRfMfBJ09hT89fhS22BQYC+j/4eCZyAlTWSMnQLVgU=
Received: from AM5PR1001CA0069.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::46) by AM6PR08MB4898.eurprd08.prod.outlook.com
 (2603:10a6:20b:cd::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Fri, 31 Jul
 2020 18:35:54 +0000
Received: from AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::27) by AM5PR1001CA0069.outlook.office365.com
 (2603:10a6:206:15::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Fri, 31 Jul 2020 18:35:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT040.mail.protection.outlook.com (10.152.17.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.20 via Frontend Transport; Fri, 31 Jul 2020 18:35:54 +0000
Received: ("Tessian outbound 73b502bf693a:v62"); Fri, 31 Jul 2020 18:35:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8fee0d99d03db27e
X-CR-MTA-TID: 64aa7808
Received: from b82c25f193a7.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3493659A-FDF9-44F8-9799-1D1FABC2DFA4.1;
	Fri, 31 Jul 2020 18:35:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b82c25f193a7.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 31 Jul 2020 18:35:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXmMgWpjWMwwkOPBs3tCzwJykPjB7l+lSWUaLNKKNg0ZgWj0zCW/goqSoZvPQG3AL+4mHDhMCGSOrJR4jAh7UrM6fH7VgncKtJWvRwpAVMP3O5FU5LrtqH3w5ZlMb+AVNLsyvHar7qWP/H0EvNb3SntYeDImg4FoXTgotReIgHx7wIZiYQplaLphPzB7iXoBRyD1DOMx0f5Nx/W4URtYVMHOx2oDEJzORbj67Efq0PrNJw64VWhCkfv8Bk8ariod9JcYwId3u6b/MYvp6NM6bpJL7Lq3ob9Orws+NqVgimIeyrUEpMsfgOBpudLA5mGQRopk5wNy8ubqkWHvrlhYWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FvxUMfFizDruYgiKA99XwblJMuIF+fNfhp0cOMUm2U=;
 b=N0qUSqCrKIjki8FqjiFJFd6IyWkZ3wMFFXwxWDpQNaOsb6PzKJ1zZt0E8Inrwl/FPNoVNjagxTKm4ba5IYgHSigaOd5phZNCt6m8ZCOj+URrHflM8whAFvc7ETi4acn1ja/mtOvul6PLhgqqyhbn7LTWbnkI/2Z4Osaoop08V41Nl1gG1J1I0nRBHDHPYgwCWPxuQPYNaR6MOJ9m95SWrUNZtvz7ZeD8j/6NX6sefhfbUe782exGI+tS08xMVaDfOFzqsnLeTlQiti63D/KLwE3p2VPqzNj8hDrhTprIQigaCYfx5SYeVA1J8rfdaeIL3tvi0Z0AsDSW21W9gh86Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FvxUMfFizDruYgiKA99XwblJMuIF+fNfhp0cOMUm2U=;
 b=xpy9U40e/iajIFviuyNpKe6dXbf8WRLuWiU9zwib/wfnyHJlEoZeEhbyUTOes/xOfHBriKny0SsRLDgWQe4qG/7eWOTKEnuBg7Et2EvJM0aO4arUdle+wDz73GiQfEQnKwRfMfBJ09hT89fhS22BQYC+j/4eCZyAlTWSMnQLVgU=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB4334.eurprd08.prod.outlook.com (2603:10a6:803:f1::20)
 by VE1PR08MB4816.eurprd08.prod.outlook.com (2603:10a6:802:a1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Fri, 31 Jul
 2020 18:35:46 +0000
Received: from VI1PR08MB4334.eurprd08.prod.outlook.com
 ([fe80::3881:b1d4:e034:559e]) by VI1PR08MB4334.eurprd08.prod.outlook.com
 ([fe80::3881:b1d4:e034:559e%6]) with mapi id 15.20.3239.019; Fri, 31 Jul 2020
 18:35:46 +0000
From: "Anders Dellien" <anders.dellien@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH 2/3] arm-bsp/trusted-firmware-a: Add support for 32-bit FVP_BASE machine
Date: Fri, 31 Jul 2020 19:35:37 +0100
Message-Id: <20200731183538.40948-2-anders.dellien@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731183538.40948-1-anders.dellien@arm.com>
References: <20200731183538.40948-1-anders.dellien@arm.com>
X-ClientProxiedBy: LNXP123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::23) To VI1PR08MB4334.eurprd08.prod.outlook.com
 (2603:10a6:803:f1::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e123962.cambridge.arm.com (217.140.106.53) by LNXP123CA0011.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20 via Frontend Transport; Fri, 31 Jul 2020 18:35:46 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e906ee7e-d273-4e93-0dcf-08d835808ee7
X-MS-TrafficTypeDiagnostic: VE1PR08MB4816:|AM6PR08MB4898:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB48987F8897867795E0A274B3894E0@AM6PR08MB4898.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:184;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 wkovNjLIqxhN5qw6JtpldrECMVjOA/O5PVXUYO+B22O2IGGqVOyfwyP1s9hMEIxHY73aDmmwgJI6tbiKwpwHK7SgS4ZC82WJlVAX7hwfFe26lsUTBNNfxmbkyqA9m3XaaqkkCWoeYc+wxvb8akj7u6Vpp9uoFcUEg17X887RaWB8hI946kg/TCtf+d1pmZpfCqMvU8YT6ItPNwMGYUq2jCDaz/j9iviPWJXWcTrqrzM9pLQ6ryCpnh9tpepi1K8wRo3IjpJAtwz7tDyTIPpEndcmw0ZbKToYYK77wIPyhmveMlH6rDA930AkFlGCy9rg
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB4334.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(66556008)(86362001)(66946007)(2616005)(4326008)(6666004)(956004)(66476007)(5660300002)(44832011)(1076003)(8676002)(8936002)(316002)(36756003)(6916009)(83380400001)(186003)(16526019)(52116002)(7696005)(6486002)(478600001)(26005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 yLvw+agwsVG0NTbK1Mac9R8OsSaFxvFiDz11WLVetqC7Vg70lFMtD5H6erJ+UqTw4fy6HOmBL8tnnFfcUJaOTjLZM8NKi4Kaiihfz1KtfOMCqIprea7gAH428neoxPhB+Aq0FLekQIs9cBwby+ZCt6BX+/G8gHyZBKpfnVFBV+RLXtiHPpBnyqEyTRDC62w2WAnLX8r2GhBqaXmVyXxLn2WxXGWzNgbOZ2/EdA3ldW9ol52QmTXw8wx+mf8xUyvuTB2yzQN1TK+Ax0hjOwGfZr7mb19GV1OwPQQ5xe256gtnW5I8MuNzTFZXUi+fgVrt1zyVgbgxYYeroN4qXfw61NNspjLvZbVQQnDkIPUpJwZOAP0d6fLERz+xdZVglQc1QUpSX92NC5UtkswA3VdI6kMoNOaAj0i5RGkVcqJ0cBs37iNfeZNbmUkeQVpNrkATlelPjWoK9M0tvS32VneDBMh/dXzVkhQApCZQulOg7i0bVL/LUlTYDwjp9P52x8cj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4816
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Anders.Dellien@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8466b645-b7c6-4439-66cb-08d835808a39
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YYNibW2gsNI62OjZ+RY1HWgQpJthx1L3+XUH0EL4ypRe0PIokmLOd+vb+FH6GQuhC/ZeUxQ7Z7P5Xrl7IuJnB+xadaJiyT/Nj+SxbYR7owUIf84ogjeb7/wzVvMCSjR3bae+IDPNb0B0mnjJbwp4eY1gg6fx2Gxr00B0PD8D4z2NTLiUEnG2ucM54xF9wx1Zml070I+vBhLKY0CEaycV5K9f2hk5nC0UVrVAyEENDO5i0rJJQ23oNRS6c9HW3OFTPtfYRxC0bm6UQ65DlXSFryL/MmKhQSVR76AAHptNnnxxTeoAoBczW6pxBqtBhN75N3gS7wfh0y9R6fan7R2Ahw50w3aNX40Z8xnE29QrKIYRBU5Bo0/Z/a/QKWsLHL25weHRqmY3T9BAkM1QTx9bZA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(396003)(39860400002)(346002)(46966005)(6916009)(4326008)(2906002)(83380400001)(5660300002)(478600001)(1076003)(6486002)(6666004)(26005)(82310400002)(82740400003)(8676002)(70206006)(70586007)(47076004)(316002)(336012)(81166007)(186003)(36906005)(16526019)(956004)(36756003)(44832011)(86362001)(7696005)(8936002)(356005)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 18:35:54.1958
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e906ee7e-d273-4e93-0dcf-08d835808ee7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4898
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Change-Id: Ia2b51de62564ed3f1489d749c0e7d78459fda993
Signed-off-by: Anders Dellien <anders.dellien@arm.com>
---
 .../trusted-firmware-a-fvp-arm32.inc                 | 12 ++++++++++++
 .../trusted-firmware-a_2.2.bbappend                  |  1 +
 2 files changed, 13 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a-fvp-arm32.inc

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
-fvp-arm32.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwa=
re-a-fvp-arm32.inc
new file mode 100644
index 0000000..5684802
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-ar=
m32.inc
@@ -0,0 +1,12 @@
+# Armv7-A FVP specific TFA parameters
+
+COMPATIBLE_MACHINE =3D "fvp-base-arm32"
+TFA_PLATFORM =3D "fvp"
+TFA_UBOOT =3D "1"
+TFA_BUILD_TARGET =3D "dtbs bl1 bl1 bl32 fip"
+
+EXTRA_OEMAKE_append =3D " \
+    ARCH=3Daarch32 \
+    AARCH32_SP=3Dsp_min \
+    "
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
_2.2.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a_2.2.bbappend
index a87999f..81138d3 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb=
append
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb=
append
@@ -2,6 +2,7 @@

 MACHINE_TFA_REQUIRE ?=3D ""
 MACHINE_TFA_REQUIRE_n1sdp =3D "trusted-firmware-a-n1sdp.inc"
+MACHINE_TFA_REQUIRE_fvp-base-arm32 =3D "trusted-firmware-a-fvp-arm32.inc"

 require ${MACHINE_TFA_REQUIRE}

--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
