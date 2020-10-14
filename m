Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.63])
 by mx.groups.io with SMTP id smtpd.web12.2268.1602692876439316563
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Oct 2020 09:27:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=2NB2XHwr;
 spf=pass (domain: arm.com, ip: 40.107.22.63, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnoMd4XgFCQx4Ay9j8OborEXWzfQ26rVIbD02QLiHGw=;
 b=2NB2XHwrF0di7yn21E7VUbp4k2uWyNedVwv5XgHj6NlPVZRmCI75sBvorHL8hqqMgoJBngC7c3PpPTOfDzLHHUcCWY/iurN2qSuE07ZEL71ZG5nDTRx5fvrC7P3qML9L2HaZmzuZmF43dlrmbeEwikVueXx66fECI7MovjanFuI=
Received: from AM5PR0701CA0072.eurprd07.prod.outlook.com (2603:10a6:203:2::34)
 by AM6PR08MB5096.eurprd08.prod.outlook.com (2603:10a6:20b:ee::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 14 Oct
 2020 16:27:53 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::58) by AM5PR0701CA0072.outlook.office365.com
 (2603:10a6:203:2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.12 via Frontend
 Transport; Wed, 14 Oct 2020 16:27:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Wed, 14 Oct 2020 16:27:53 +0000
Received: ("Tessian outbound e6c55a0b9ba9:v64"); Wed, 14 Oct 2020 16:27:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9b49da044f75cdce
X-CR-MTA-TID: 64aa7808
Received: from 1b37dd8a2a45.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C7784684-DD7B-4AC4-9F88-D4539B9F486A.1;
	Wed, 14 Oct 2020 16:27:15 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1b37dd8a2a45.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 14 Oct 2020 16:27:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hgCkbbdzJ9p4tk02nIn0QzVOK/KIteu9JO9G2AdMWSdwhrcn9XDgLTX7sSTQyuuI5cH5Pp/yynLpT8osyuy72COVtmUMa0KSBdmyENwjRCvhkA1WZ+/GALJtwVa6Ki5pLfDsij1nWSPjrEE5Rjd8Cu6fZh8yLxFaYTCXHNj3frFOpkmZI9U1BFJCj9nWeD2JWqkNI9GYDClMw0UG1K4ca71g3bZkPiD/Rt9g4sR/jKQXM8IY3sKw3Hpiz2bXlCzppXGfUcK+W9xzjEM8VvhDSc6mQvGmUa1lZe5zxIkPoJCvQFxstuXRzmREHPCHuKFfgBfKxL7ooQVJTBL/qgbCAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnoMd4XgFCQx4Ay9j8OborEXWzfQ26rVIbD02QLiHGw=;
 b=Y2prZcA/22TnhS2mKCZdsx0KVnZ1a8REW446yxIM1AtiFIfHmmEvbGhUH6of4zQMrqtRx9gBIv9BYsZitDIZOgmq11tntrlsBpfeefE2O0ieuxoJDU8efYkAYiHzJ8oK0nEtQsc6CgHvvMEBeyNGMyIjhssZJn8g33pEysm0JZ4SZyjgrCuhHF83kYM+i6rt2OjvSat2Yo8rr1Bg19tXyhzSVZiVbWVAnArBR3GFM9CrxUc5STQyyz9Ich7TAAtcPzfmnUuWjdQ1nuLE5t677BumrpvW9rkACB23fUqiBhRzU2sImduoQSTY+h1IRbik4hDcbtNgTUJsi/iW2B9XXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnoMd4XgFCQx4Ay9j8OborEXWzfQ26rVIbD02QLiHGw=;
 b=2NB2XHwrF0di7yn21E7VUbp4k2uWyNedVwv5XgHj6NlPVZRmCI75sBvorHL8hqqMgoJBngC7c3PpPTOfDzLHHUcCWY/iurN2qSuE07ZEL71ZG5nDTRx5fvrC7P3qML9L2HaZmzuZmF43dlrmbeEwikVueXx66fECI7MovjanFuI=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4123.eurprd08.prod.outlook.com (2603:10a6:10:b2::16)
 by DBBPR08MB6268.eurprd08.prod.outlook.com (2603:10a6:10:202::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 14 Oct
 2020 16:27:12 +0000
Received: from DB8PR08MB4123.eurprd08.prod.outlook.com
 ([fe80::5416:ae85:c3b9:1c99]) by DB8PR08MB4123.eurprd08.prod.outlook.com
 ([fe80::5416:ae85:c3b9:1c99%7]) with mapi id 15.20.3455.032; Wed, 14 Oct 2020
 16:27:12 +0000
From: "Usama Arif" <usama.arif@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>
Subject: [PATCH] arm-bsp/docmumentation: Add information about tc0
Date: Wed, 14 Oct 2020 17:26:58 +0100
Message-Id: <20201014162658.33762-1-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-ClientProxiedBy: LO2P265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::26) To DB8PR08MB4123.eurprd08.prod.outlook.com
 (2603:10a6:10:b2::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from usaari01.cambridge.arm.com (217.140.106.53) by LO2P265CA0014.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:62::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend Transport; Wed, 14 Oct 2020 16:27:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c8585c6f-83f9-49af-254a-08d8705e19af
X-MS-TrafficTypeDiagnostic: DBBPR08MB6268:|AM6PR08MB5096:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB5096C18D4A8E0F26397FF98E92050@AM6PR08MB5096.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 mXrW2pG7MPE56AITn9JTb0fN5dct21URx2CYdQhq9/pkfonT1/bEoLK6RMTNknee2GAe9f4jwpA3yv6ZIXzRE8uyMGPV7tSKpzSulzqiJyfPDzfC/DE6jHj3JnGHkIc/WT8kad0LlxE/IJGcx7kVqi9XIf008ouRE8UB5FUWsnoKd/zxDgApRFicrtD5s2bHtwZJiAPF/RDMSE0QPb3t9aLhQK3QtH+HfRumJ6D+Jq7PQC1S/FXUQkMqNvY/pmKBFEZWDeQ2tkOeSZ4BbOrZrXQVbkO3+fCuLJ8ChxJblk7CxwKoTSA6GxSZcFmh1Li5Qb7D98MW163K7yUCsassGTXZnJY7coeYHYekeih4Qtr82ccKxk/je7+6WOKZoktNgZteDtyjn7hIaop9vkW0SQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4123.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(478600001)(36756003)(6916009)(5660300002)(66946007)(6666004)(316002)(956004)(2616005)(66556008)(66476007)(86362001)(83080400001)(2906002)(8676002)(4326008)(26005)(6486002)(16526019)(1076003)(8936002)(44832011)(52116002)(7696005)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 T0wxSHNgxCu2Lb3KIGMabCUVlNaYNEzeMy49uY1rGl3DBaBxov7WCgJC7JsjrsV1Zrzg4KNJUD8wW4M35Kp0cNk6mcx4grLgO33E5B5bLVNjQ5zjeN4aF5tLv4eJeJMnGNpba5WLjJUZm/drcSB8R2qEqzL5Xu477wUKggZmKLCenFldkuRnweY/nDvXayz41Abkq2K3s2ez9bc6WQIMFiRhRgv3FV/9im4BJ9VJqNP+FOJ0EHNzpv6DvspXvIBarc3IxjMSEyacCzM9bwYhRIh0zw6n+HSlm85Eei3p6GiGbRtWV+SM7WdzhHj0dqSSkgxKsqWCAK50XmHiTCxG1lv6DCN/AX8J8qHEJ3j8HxZ7j0lBbwpY1S+sxFw+ewTasdb9oYYuaiRJT6stJXytOEVT5O2LAMB8Z8YUfhA3mQtqvkY0ZBrAm+VMzNwrxr/zvlLYHlre2bDH5fa2FMCAa16Qlq9DsEZIPaCWg0qhmrmP4acNU2Cn67jXTBSArekjw1085DbT5OvAyuKi7TVX3v8jdX02E4ys5WOMeXhjManHEEHHOyESrjkqMRNqih9KhqCHC90QFR4M7rRJAvel4D+dCCeK6yFqpUDouW+4KR2QHiKpA54St3WaJwRAvSso04c4WO9eIKrZoHBXZC7t0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6268
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2716aa34-a225-4413-7518-08d8705e010e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DJB4YAf/XdJooC0nlQ7j2Wsyrrew6HxMmnVRfyh8yJns/bgoXLbspD7GlIH9cwHG2wC6c6qOEUlzE3z9p85igc1EUNKhp6lyCCCUKL0ORzX84N6IkloiwCZNbp0m9ra5BUz5k4eVpeOgn5/o9fbnC6uDQ7BdBYIOpU9dsjEZiRczu+GuuljHVfRgtRTP6vRC/eLUR7FYbUilUnaqsbW9T8b5j5RwmUiuGwAMqQb9B6Z8ooJlNcGSnoH9aD3zdkN+mT7ZKYOPYHLhNBjV+4GUv3IU8qqItQfUUY58LFaKVE+zFDa6Xl1xtvpmL8l12TOcnhIwTJ5xZdTHh6mi+7Dp4KdrA8I/ASSIzAwGnSEvfh043phY0N6Moa3ducLLYSCAfQVGT2JzcbHPIhEnUz+ZQi7PeoWvgVP+s6zwnJJnZfTxcgqFtBfPJ/38eqJr4Od5eEsvHyNHo/zTbPa7oYavZ/234STRMVshWKeJkokfBu4=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(46966005)(47076004)(2906002)(4326008)(6486002)(36756003)(82740400003)(7696005)(1076003)(5660300002)(2616005)(956004)(336012)(86362001)(36906005)(83080400001)(316002)(26005)(44832011)(70206006)(6666004)(356005)(8936002)(8676002)(81166007)(6916009)(186003)(70586007)(478600001)(82310400003)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2020 16:27:53.2456
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8585c6f-83f9-49af-254a-08d8705e19af
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5096
Content-Type: text/plain

This includes an overview as well as build and run instructions
for the tc0 software stack.

Change-Id: I9abfc7d6dffc68da2a2cd4ceda82bec6bc5fcb10
Signed-off-by: Usama Arif <usama.arif@arm.com>
---
 meta-arm-bsp/documentation/tc0.md | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-arm-bsp/documentation/tc0.md

diff --git a/meta-arm-bsp/documentation/tc0.md b/meta-arm-bsp/documentation/tc0.md
new file mode 100644
index 0000000..694e067
--- /dev/null
+++ b/meta-arm-bsp/documentation/tc0.md
@@ -0,0 +1,29 @@
+# TC0 Platform Support in meta-arm-bsp
+
+## Overview
+The Total Compute platform provides an envelope for all of Arm's latest IP and
+software solutions, optimised to work together. Further information can be
+found on the Total Compute community page:
+https://community.arm.com/developer/tools-software/oss-platforms/w/docs/606/total-compute
+
+The user guide for TC0 platform with detailed instructions for
+syncing and building the source code and running on TC0 Fixed Virtual Platform
+for poky and android distributions is available at:
+https://git.linaro.org/landing-teams/working/arm/arm-reference-platforms.git/tree/docs/tc0/user-guide.rst
+
+## Building
+In the local.conf file, MACHINE should be set as follows:
+MACHINE = "tc0"
+
+To build the required binaries for tc0, run the commmand for the required image,
+for e.g for core-image-minimal:
+```bash$ bitbake core-image-minimal```
+
+## Running
+To run the produced binaries in a TC0 Fixed Virtual Platform please get
+the run scripts at:
+https://git.linaro.org/landing-teams/working/arm/model-scripts.git/
+
+and follow the instructions in the user-guide.rst available in:
+https://git.linaro.org/landing-teams/working/arm/arm-reference-platforms.git/tree/docs/tc0/user-guide.rst
+
-- 
2.17.1

