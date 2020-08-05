Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.53])
 by mx.groups.io with SMTP id smtpd.web12.4774.1596625636481867258
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Aug 2020 04:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=VT1M8jTq;
 spf=pass (domain: arm.com, ip: 40.107.20.53, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=br2ZROi7xmVIqWaYpasfd00HMjKCpTzImUaWAt7l+kY=;
 b=VT1M8jTqJc7c8/iteEIKJkJevRWbAZarobfF5KHGIFKR7i+T9e4OzTLtRW2+KhuU5auIBRLFvNsWs1zcmRZc61SkGjgpH2lFXZp3G7ghYn5prMqT67HR8Ju8/ohSX4IPEFjzK5sIEzzQau1sqmD6ogSCTT4sat/iK+p+LqGP65E=
Received: from AM5PR1001CA0042.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::19) by DBBPR08MB4773.eurprd08.prod.outlook.com
 (2603:10a6:10:d9::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.21; Wed, 5 Aug
 2020 11:07:13 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::ec) by AM5PR1001CA0042.outlook.office365.com
 (2603:10a6:206:15::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15 via Frontend
 Transport; Wed, 5 Aug 2020 11:07:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Wed, 5 Aug 2020 11:07:13 +0000
Received: ("Tessian outbound 6ad80ee94e7f:v64"); Wed, 05 Aug 2020 11:07:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e539a441e9d46f30
X-CR-MTA-TID: 64aa7808
Received: from c51f3c922eee.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2FD2262B-3438-4ACB-A1C0-5DED58965B58.1;
	Wed, 05 Aug 2020 11:06:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c51f3c922eee.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 05 Aug 2020 11:06:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UXazAmr2Q3jFVsVyeZrJWUyYBxOvNyrWXgNUobooBlrC60CliZcG3B05FwcBMDEzo6YpLGngO+3P710SRt/zzG/xfbm/N//VDdGlAhZFq4EdMOoP4ZCFJILbSDaEFBhEYDYZd2mGOo3fVMLrL0MigemhmpOJuBtqy2jCQlponlKY7XkcqWzk9J0cspvBgz77v1nceRZvaIJWt89DqErm+So0gPVC+yE4Qg5Us56O+pRsy3huPvuXninxMFHfvXiDzr165wzUC9jFR6KUiHZBV6K1qaqMX24aPB2wqo0Vm/0y9VO6Mt2vOl0qA+V88al6A28SwtXhiGnR/h+KrOJtiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=br2ZROi7xmVIqWaYpasfd00HMjKCpTzImUaWAt7l+kY=;
 b=K1h26MD1nKcs/zaGYnOhXvS/6Q96rR/gv6tJbdgl4JqJd1Kz9w4FyoyBwgYf21TCa6EboZEAlIt0r5Tb5lIxeefQE0EdEHGB6MpNE5WvyEn0sTtf+h7AMOpqeFi6DNxNC9p45IOHBudCynHRXq3ICyXp6lxVN38YcdhMutCe1WGBBb/fbQ5l0AmNnIXK1l8ZGlxypuKM9l1RVBrM49lOiQq5Jhu2LXG1gsmgtfsxy3XaBuVtpG6kXsgmLnlDGGCxYU83V+9pM4xE4XiBQs+4gmyk7itju3hMv2LTrTeyNAIJteR0muMTHoE9/XXf5a3p68g4dLzAwj76SPsMnZEEiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=br2ZROi7xmVIqWaYpasfd00HMjKCpTzImUaWAt7l+kY=;
 b=VT1M8jTqJc7c8/iteEIKJkJevRWbAZarobfF5KHGIFKR7i+T9e4OzTLtRW2+KhuU5auIBRLFvNsWs1zcmRZc61SkGjgpH2lFXZp3G7ghYn5prMqT67HR8Ju8/ohSX4IPEFjzK5sIEzzQau1sqmD6ogSCTT4sat/iK+p+LqGP65E=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB7PR08MB4217.eurprd08.prod.outlook.com (2603:10a6:10:7d::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Wed, 5 Aug
 2020 11:06:47 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5%7]) with mapi id 15.20.3239.022; Wed, 5 Aug 2020
 11:06:47 +0000
From: "Usama Arif" <usama.arif@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>
Subject: [PATCH v2 2/2] arm-bsp/trusted-firmware: remove SHA for mbedtls
Date: Wed,  5 Aug 2020 12:06:20 +0100
Message-Id: <20200805110620.20625-2-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200805110620.20625-1-usama.arif@arm.com>
References: <20200805110620.20625-1-usama.arif@arm.com>
X-ClientProxiedBy: LO2P265CA0415.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::19) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from usaari01.cambridge.arm.com (217.140.106.52) by LO2P265CA0415.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a0::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Wed, 5 Aug 2020 11:06:47 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0d75792a-0233-474c-4707-08d8392fb4f5
X-MS-TrafficTypeDiagnostic: DB7PR08MB4217:|DBBPR08MB4773:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB4773F6786DF0E473F850A45A924B0@DBBPR08MB4773.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:121;OLM:121;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 M3RNQTm3W1bk+xXOeieqzFVCsIFOAkTWDDVpAV5QpE+54xhCOXyvJ3Ys+hl/YUy+yFtHG7+4ILXXwcE10nJHs0+gbp7JvjMSkSBt0iBfCaOM9ffkwXiaXZ6uw8cS5UVwsxneCGlvlpI+v8zChXo9snmHaXG1GY2Hm5WaHqINX5Bp6sdtdO94sg+QPdr4PXYp+U5AnR+v6MfasWToj2QNHhlHFTUAlu9PtaCmx5liswN9ER60i1/dMwuBFxi0AyQ+r1TllU3c1X5P2aCdbRyzYxLaXLjdj58iZQGw95/8/UsNd42ubII0CI4lPEgnexuUnjedfK5iP13/+eAmDzi08Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(346002)(376002)(366004)(396003)(66476007)(52116002)(7696005)(6486002)(6666004)(66946007)(316002)(86362001)(66556008)(83380400001)(478600001)(8936002)(36756003)(8676002)(2906002)(186003)(16526019)(4744005)(956004)(2616005)(44832011)(4326008)(5660300002)(1076003)(26005)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 3P0DR+W8B/T7woDamR7jPiHX0Ny8uICLur9Y2C6k01dTyDHAQXSZjvJPqwxea3coW/ryiO0AktaFEqKoh8RULV2TtZJqVwzrV6bLzXaY5rSCH3LPct89Wj+zhY/E6Bp5o4ZTs6sK6dYxRP2aSCDVCTcCvlSa1o8T8EjjoFuarOF/D7c6CMGCHNQ7I7HyRYLYrvcDFhfJMKrNQzKevYbtVl/KfP/O2XHsu12PJ09MftaLxUEyt2c7gVrmOryEOmI/fchp3gz9jWj0paZ2HRcmp/CviXN433gweXR4v8+AGn6GM0Hwg+kbSFjBal3aMeY7iUZE9ezfkVQh1GSe9r6nlDYbeH59nUm2AbieamAIfVsojZ0hr0zSbdYRbzLLr8hwq0A8HnovWa/fcwCfTjkmgHnCuFHJqgmCTSxn15z4Pfr3SazdIUCzcoPZlEd6WmGgOL5BJYfAAKgao3V/ZcGpxT6rGN5Ji16kYNDwa2JedleVWc0ceNgOsLvzs8F1Y6kqrz8PZLsuQ7kpQYObGrcZ5MrCCCM4XH3sOOkIM43g5uPrzM8s7izlBvl+pFBVBLAILMl+82FV5esb45xsohVHLk1fn0X+pin/XJa+YsB/UbAn1JpXxCDQHNdcMGIyK9MuACCcz8uKUECold82XXGPfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4217
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	af77c981-6efc-439d-6185-08d8392fa55a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3unBreJ+XeSDGorXL3tz1DTgQDkmmNdEM29vr7eHZPfgh/z89FbUriP2q2L4QZtC1c2xGtgmqwzpZdjoWh5vNUP7HW9by5pUCzX+q5Fmnp192ZyG/ucxqIGvOatgVqLNdlMZb0aiYVr7Q5lhJ29/iwjUbusUaF7167Z1SfKlI3l3N09jc+0kdmLJ4EJ6piyf/bFGaVbm/fx3EKYbZCc9FbGwhy56nBWJ3MDa9jRnndsSMuJlDgab8OBe3TY1FcHOMrPyRoy0XEIl1OvkmfPMXmzP1d/moyjwOt1Wt9Hw9uzZ0TU4TFD1n33JZd/LNOX9cz65f0foHe4jE1PDHRun9HheLsrKru3qH7FQx5j5OPV2KkhLBegH/EAD3ypclAXOrGVMUctqjqupRUqBdnsnEQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(46966005)(478600001)(186003)(70206006)(70586007)(16526019)(36756003)(26005)(83380400001)(1076003)(7696005)(36906005)(86362001)(316002)(8676002)(6486002)(6666004)(82310400002)(6916009)(356005)(4326008)(336012)(81166007)(2616005)(44832011)(82740400003)(4744005)(47076004)(5660300002)(8936002)(956004)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2020 11:07:13.4015
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d75792a-0233-474c-4707-08d8392fb4f5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4773
Content-Type: text/plain

Use the default one from trusted-firmware-a_2.3

Change-Id: I496db01818b172b109e8dab04e39a66bafd35a2d
Signed-off-by: Usama Arif <usama.arif@arm.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc   | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc
index 555fb1d..d22108a 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc
@@ -2,8 +2,6 @@
 
 # Intermediate SHA with 2.3 baseline version
 SRCREV_tfa = "2fe7d18b0d99fdf4c4dbf84863bb2036dfebc537"
-# mbedtls-2.16.4 tag commit
-SRCREV_mbedtls = "39e2c0eeb6501980764793e8d54c49c0a42bde48"
 
 SRC_URI_append = " ${SRC_URI_MBEDTLS}"
 
-- 
2.17.1

