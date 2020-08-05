Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.50])
 by mx.groups.io with SMTP id smtpd.web12.4771.1596625614786247439
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Aug 2020 04:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=JjoSavSO;
 spf=pass (domain: arm.com, ip: 40.107.0.50, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjIyUctv67LbmqfY/D1F9DsIPt8FjM7kGIYLmavWhp8=;
 b=JjoSavSOZkL2cOt0cbP+bQzmaAw3CCU5rP+eSPZSlaUaYziolY/1aVNkXQPJ416l8sdjY3RMI+qR4/XCyTkv4Ljv3yyenD8U4CQ7eODcjeIY6Z3/uffhGDdBbS6oIr1pqKXDIGs7gdxDe2Gik6RiQ8bKoWX7bpH6oyW9Sa/eEoc=
Received: from DB8PR09CA0029.eurprd09.prod.outlook.com (2603:10a6:10:a0::42)
 by AM0PR08MB3906.eurprd08.prod.outlook.com (2603:10a6:208:100::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Wed, 5 Aug
 2020 11:06:51 +0000
Received: from DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::69) by DB8PR09CA0029.outlook.office365.com
 (2603:10a6:10:a0::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Wed, 5 Aug 2020 11:06:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT042.mail.protection.outlook.com (10.152.21.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Wed, 5 Aug 2020 11:06:51 +0000
Received: ("Tessian outbound cadacd461517:v64"); Wed, 05 Aug 2020 11:06:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b64a41c0b8409bbe
X-CR-MTA-TID: 64aa7808
Received: from bcd65c91eb7f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 052E55DF-4B56-4790-BE7A-F35195F1B0B0.1;
	Wed, 05 Aug 2020 11:06:46 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bcd65c91eb7f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 05 Aug 2020 11:06:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZqaMApIo5wlo3LtgrGMi/OTl9Gd4ZccajMrxHopqF/3jou6uyMxnBgYSn41BxUi91CVzTMR4X7hhMcVpveq97UZ9OBkacI3/RmHJUpHAb7c/oShGRvbzS7iQ/Qe/+lfHGRQnNQhkJ73hr92oMdyB7da3MMDQdNYAqxDND07ug99C/dzDEeat4z936Y3UB0a+0O/TOpvOkflwI36XPnCHVL3lP1YeGnUfV3KD41jTRytbJSSCqRH8tpQCo7TqOi0apKTSf1v7KMipkYvihgDo5zaPO2SUg54K0d13KSfoPskJv9sxWPRc1m1p/Z/O9rAdle24kKzgUIM79YQfvxknDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjIyUctv67LbmqfY/D1F9DsIPt8FjM7kGIYLmavWhp8=;
 b=GEpJ85HUvL5RnB5cTBvbvfAt+B7vVuYNiV7c4L42uJ+CczES5bPybTfTJab02RBn+byVjmggamSvqOFCbrP9nnd3vT0FG6Mro3ooi4CYCMwyLpD1fyCHWkPij9Im+uVY9WlstIEibz1qnBnQjNMJy8RqoagTEKY+LeRYt5YeU/cXSsNK/IkpbV8GeGnS2xilkqhiSQoEfAc6CwiaZE6xfXJ7aP8OLLyJlHJjzpZAY+x1/Jyd1NeP3e9q3RxzuYWPg4YR74FrKWE5JsGCyD9WvLICoAh6bLssMOYtG4vO7MIdq39VOMat9ZOxNrY1k4WqapyNpg6tVZOls1bLRz1+iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjIyUctv67LbmqfY/D1F9DsIPt8FjM7kGIYLmavWhp8=;
 b=JjoSavSOZkL2cOt0cbP+bQzmaAw3CCU5rP+eSPZSlaUaYziolY/1aVNkXQPJ416l8sdjY3RMI+qR4/XCyTkv4Ljv3yyenD8U4CQ7eODcjeIY6Z3/uffhGDdBbS6oIr1pqKXDIGs7gdxDe2Gik6RiQ8bKoWX7bpH6oyW9Sa/eEoc=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB7PR08MB4217.eurprd08.prod.outlook.com (2603:10a6:10:7d::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Wed, 5 Aug
 2020 11:06:44 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5%7]) with mapi id 15.20.3239.022; Wed, 5 Aug 2020
 11:06:44 +0000
From: "Usama Arif" <usama.arif@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>,
	Prabin CA <prabin.ca@rm.com>
Subject: [PATCH v2 1/2] arm/trusted-firmware-a: add branch name for mbedtls
Date: Wed,  5 Aug 2020 12:06:19 +0100
Message-Id: <20200805110620.20625-1-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0415.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::19) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from usaari01.cambridge.arm.com (217.140.106.52) by LO2P265CA0415.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a0::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Wed, 5 Aug 2020 11:06:44 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ede959be-c87a-472c-3226-08d8392fa7d4
X-MS-TrafficTypeDiagnostic: DB7PR08MB4217:|AM0PR08MB3906:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3906044FAE96BDC2ECDF1985924B0@AM0PR08MB3906.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 NdJjern94C+9MWB5RDO1JF9zW2H5GlmoRPBjnD+qNktiGxS2FGucwyLd9b5JhfYu70nf9cJWkgInNDCXyFkRpHttkL+5gSXzf5BlhkjvRjCjiRUNsqXQbqSMQXXAIPg+lCCUUeib5jNlA4ensvrz6ONwkWlYIE4HZ6eIlNg/btu+9nHqarHC0s2bOGeLJ+0JRq+M/hCti9w2gc4at2UBGL87+xj3cmx7h2bt8DfWMtwbPJjd5nKTnE/reJpc+GCOER+v4cph+rkR2IK21NsiG0uVe939frAc69UYeM88lKE7rJO/MH2TbubqGMIiX0qK2KZ0ztBvCy7U6gZ7NWeBbA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(346002)(376002)(366004)(396003)(66476007)(52116002)(7696005)(6486002)(6666004)(66946007)(316002)(86362001)(66556008)(83380400001)(54906003)(478600001)(8936002)(36756003)(8676002)(2906002)(186003)(16526019)(956004)(2616005)(44832011)(4326008)(5660300002)(1076003)(26005)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 INSguBFbKYliDOALCbnXXgck73JeUkpHQ/bHKUQi7XbvbzUcA2VGofekNFM7pCJY7kwduQOX5tk+wHMMltgu+Al9Eeo9z86HYOCrBgGtoYaw8ZMfeEzcKPkTOfU1ZBUTSv0OwiG6+tZm+OTEumULnrARdymwwqn8DKe9KUi5+zlQOiW1U9/GqGp3xCA1VsrfPzeDb8O7QGaLILvKdnyZa1aUllguf8W+VHkBG7yP5yZ+i+rPiriY3vEW41DYPtLupksIPgZGYDHj5Sn9SQ8B8eDxTZt0b4NfDTJemBJRrOsO4a3bLXY+NazUypQ+alIXOf/MjFk/8D/IiFWBGumX9n2dXYRrHDFJ8/zq39DjiYuf9Y+1CR8tYHxlMhMf6ZAfWpd1p2/9pdPCB2NTWrts2wwnV9a2M993mcIN/rqeAGuf5KdNyXbdirwRaOQ40nPt6bQT8rDhLKLfWcj49eEbuD8L5c10MEf4mHRKqoV0MzG9/YNuiPBMlC1TqAtm7bLMKPAfHE+uVeOm/JloA+WP183T+4VmiKxdxy4DWX/Iny6AD4eS8aLcR/tYhgYBPe5jNuZr8887DOuaifk47zWgc/h2aXOTD/wdLvpaEMTl8PN1Iy4J4oJDjQ5kZWpgQRry0d1dmedj91XJN4QqxACWZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4217
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	737cfbd8-4b35-4d32-71cd-08d8392fa3ac
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t4Lpz/wgvbtjyoH+1018IAdaJglbGC4WzttBPYlNMHpALbnxx2imG9+Y7oF2X9+HZu8QgyDzG8E4pWFYLYzkIx7PkRTSvKHL5RzVyc5UMMU0fxgPM7Gpayx+w8SNSIgwzKOQDmM58j6JJ9BV/MykzrBqcLuH8bKkMq4rx/p5Pkz1N8xaLSHJzxMt75rWknzi/Q1pL3QnM8U3vuBtadJkCP1yIVXYDW+qiA4urmTF2a+WMAWXgi4K3u5zfzNedJwzdyxiOKp8fdUkGl3VtDDnF40qOf0rWek7eWpaRAAdIv/e9UXse1FQd0FwzkOTO4EmMVPFniO7hTx9kBWlDRsmz8F2wTPJnzg8x9QqknWLX5MT0L37sxzEoFa+ajL8VQJd1LrY4MUbXt6Wcu2LfZMmaA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(46966005)(82740400003)(82310400002)(2906002)(83380400001)(16526019)(316002)(4326008)(47076004)(5660300002)(1076003)(478600001)(54906003)(336012)(186003)(81166007)(6486002)(26005)(44832011)(7696005)(86362001)(36756003)(8936002)(70586007)(70206006)(8676002)(356005)(6666004)(956004)(6916009)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2020 11:06:51.4802
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ede959be-c87a-472c-3226-08d8392fa7d4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3906
Content-Type: text/plain

It appears that the mbedtls team have moved the SHA which
meta-arm was using from master branch. It is still present
in mbedtls-2.18 branch so this is now used.

Change-Id: Ie932f446067767e85a25583b1bdc02b4739e323f
Signed-off-by: Usama Arif <usama.arif@arm.com>
Signed-off-by: Prabin CA <prabin.ca@rm.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
index 8286b64..7279173 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
@@ -21,7 +21,7 @@ LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89
 # Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
 #
 
-SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls"
+SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls;branch=mbedtls-2.18"
 
 # mbed TLS v2.18.1
 SRCREV_mbedtls = "ca933c7e0c9e84738b168b6b0feb89af4183a60a"
-- 
2.17.1

