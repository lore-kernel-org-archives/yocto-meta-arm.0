Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.67])
 by mx.groups.io with SMTP id smtpd.web12.49928.1597080796878088357
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Aug 2020 10:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=onVf7xv1;
 spf=pass (domain: arm.com, ip: 40.107.0.67, mailfrom: prabin.ca@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibTclF4fqAQbrbXx/co7hVqRQKzQWhUl8kzpbTZrxIg=;
 b=onVf7xv1kad1YLYTxmip+LtABh1svqSkgR2C+K1PynuX1XWGQnQu4BQTDXBwkcQ7ENu6wt00aScFCiSLUVRIEVWyIScmaHVr/ZdbnXxy1jheRyXakpxT7KNelbqO0mCN8iorQGTtI3Hr1a9gMkOuboqoRT55cJDf8cKsAcfxBM4=
Received: from AM5PR0601CA0078.eurprd06.prod.outlook.com (2603:10a6:206::43)
 by AM0PR08MB4420.eurprd08.prod.outlook.com (2603:10a6:208:142::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Mon, 10 Aug
 2020 17:33:11 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::5c) by AM5PR0601CA0078.outlook.office365.com
 (2603:10a6:206::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17 via Frontend
 Transport; Mon, 10 Aug 2020 17:33:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Mon, 10 Aug 2020 17:33:10 +0000
Received: ("Tessian outbound 195a290eb161:v64"); Mon, 10 Aug 2020 17:33:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dbe803122bab80b7
X-CR-MTA-TID: 64aa7808
Received: from 4e350925649a.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 54975516-6A3B-4627-A633-67A63D3FAAD1.1;
	Mon, 10 Aug 2020 17:33:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4e350925649a.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 10 Aug 2020 17:33:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FM1i9vjNgXl25Yws+ScSncXCeOBqH2TBaXTCKg5WWPxHv+PzAyi4U+5tS/CjkqkTkd0x6E0AcfJPyXYBXwWVdsav5Vc46GdhmeNOpeEfx+Ll8t2gQdVfCfiMk0UJBTI4OP6EqgeQ19CWEelAjKVFepnLY59wonJJbT9jGWJkms2N56JGvM7/zYViXgE3EwX4gsze79h49iC336AJLpNTumApQ3AC+9ErFwlyPwRmYU5gz7LsGVPJqbs+R5EMOK1Jkb411PqLoKAcvjgnDO4Ml1EQFRLeL9mvB1QZQM4oSOmE5DbcbN96cNsSFNpdWhhdfyPjxgZ0Db82E8CKV8uM2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibTclF4fqAQbrbXx/co7hVqRQKzQWhUl8kzpbTZrxIg=;
 b=DS1HyuvyazAM6D599KoqcY0lantayTWLw635YtmH+Wc0ZHmNKQonxp/bb0kehpxhJxhb8q7HJlyCzxSHVUUcfADXJCvEvseRPmCGTGXeAabtL+vCFKaul4kJMg5siBrfmVMPU5dKz13z/1+c6NsyL4uFrWVsJX1uTs2PcLFBhPWqZ4lrCpGgDC4/xWiD00YRNpinGTOea/6/Hy0Nj1E3gpDqmJ1PYqIzLTxPmM8SfBFG6pEHu9G3rkcbTZaJK45t/0rkSCraw+7/7kqvn0kVQnmG2cdDJJG0/eATFoV9uKlt8nPJfWqqozJHj7O2zlGjVbUBihzZleSVRFRgdhcDVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibTclF4fqAQbrbXx/co7hVqRQKzQWhUl8kzpbTZrxIg=;
 b=onVf7xv1kad1YLYTxmip+LtABh1svqSkgR2C+K1PynuX1XWGQnQu4BQTDXBwkcQ7ENu6wt00aScFCiSLUVRIEVWyIScmaHVr/ZdbnXxy1jheRyXakpxT7KNelbqO0mCN8iorQGTtI3Hr1a9gMkOuboqoRT55cJDf8cKsAcfxBM4=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM4PR08MB2756.eurprd08.prod.outlook.com (2603:10a6:205:c::33)
 by AM0PR08MB5409.eurprd08.prod.outlook.com (2603:10a6:208:183::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Mon, 10 Aug
 2020 17:33:05 +0000
Received: from AM4PR08MB2756.eurprd08.prod.outlook.com
 ([fe80::6cc3:86b5:f5b3:89d5]) by AM4PR08MB2756.eurprd08.prod.outlook.com
 ([fe80::6cc3:86b5:f5b3:89d5%7]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 17:33:05 +0000
From: "Prabin CA" <prabin.ca@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Prabin CA <prabin.ca@arm.com>
Subject: [PATCH 7/7] arm/trusted-firmware-a: add branch name for mbedtls
Date: Mon, 10 Aug 2020 23:02:16 +0530
Message-ID: <20200810173216.10411-7-prabin.ca@arm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200810173216.10411-1-prabin.ca@arm.com>
References: <20200810173216.10411-1-prabin.ca@arm.com>
X-ClientProxiedBy: BMXPR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::25) To AM4PR08MB2756.eurprd08.prod.outlook.com
 (2603:10a6:205:c::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from a076760.blr.arm.com (217.140.105.53) by BMXPR01CA0015.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Mon, 10 Aug 2020 17:33:04 +0000
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [217.140.105.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 18683da5-2dea-4977-d89e-08d83d5373f8
X-MS-TrafficTypeDiagnostic: AM0PR08MB5409:|AM0PR08MB4420:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB44205D55A9B7089B0DFBDC7FE1440@AM0PR08MB4420.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: mlOiWzixHsKKTCIJsFOdxfPp3c7qC8t39eqBds7Xqwu2zeFtqCd0KOnRy9UUJWqrE4l5xT9tC2w3vBDA1FK0msi8zeK70EAllQVBcXjBM7ZHG4mFUJBVinJ5CdCrhfpvjIW/ffm6UpT4sHIKtRF9NWWe+LAh/RucqoeZwIzHyPvjRD+gtzY6JvlYkSQQzv98C6m5a6aBu1zm38iubJ9eJc9ZzhW5Xmiax/uvIQ6ObgktlokO5vt5n6BcEqtCdNiHxusmrxwZ2QZ2F35B8rdIb89qDfyygbGQCY2lEbHwq4D+UW+kyAd9LqQH5IJMmTwGh/0Wm1YUdzZaKF1FZATf7w==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR08MB2756.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(8936002)(66476007)(66556008)(66946007)(6666004)(26005)(6916009)(36756003)(52116002)(7696005)(2906002)(86362001)(1076003)(316002)(956004)(2616005)(5660300002)(4326008)(8676002)(16526019)(186003)(83380400001)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 1+18oUvBlcDKSYd+1jlTUPHgQQnRmFbxx068pqsHPhsoiB/erwS8g7GrKa/DW16pumvVztcWNxMvxw0OxSL9jGXxGPwVynozjd3jyz2w8ZlsAI2bgTx6+bf7ltp4KkkC43abWteybZdWZvFNYn1CDM+gaIFSVNXSO2ZhFKMHFs1dkSbXnnXL7nkU3AvayxFQVLQK9UlK5IT0N5o0XcY9769l/KCZLeBRq/LUKJcbDJC7O1FeYiZIIZmAhA1v2eA34eAmEZQCKzymjhcU0fKEusDheOrf4VT3UVrjZcuNMEbVszthbsp3WK5Z3QcpBJN0HXmJx12KyumI7MeNQIWK2awmKXCfdRKC7b9mTl9BLdFlIxU8Y7YarjPXe8tOPv2J+golanjW2ldiqQyBPEB9C8bBLwBzhkJoMaaPBh6f5px07LpQWDgvbgkqDv6QP0pYDC4o9G2+aT8SdrQPPTIql3z1Kuxn32iQLS8EPmm6UeNbjPUoMczxayoiLRHKs8qoh8pwzpEMoTqGkgyB+mJ1dfo3Y1W3nESrmoF0mMRoozHAML5dmC91OGKGegLZoY/KJJe14KUmkgLa/HGV7ACRCeKccIAfsv1FKqCyK7mqE1FbdVGVXIxVTqVeOUMQcrPOBTqXF+Pb7KJJeJO+69n5NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5409
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Prabin.CA@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f3048623-e654-40d9-c5e9-08d83d537041
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Mi1dXOPae4Q+mCX8lkt11oTKj189UotfxThBQjrQw0Vn+BuGhBXp84TSZlHWHR0N3lUfKyl8nT//VQN5wXRccWYHiOdxUusEeJpIzWv2NQfXZzgmpPN9Y8gljE2T7Rm3Ew44PEY5upEKl+RAnwdQUtfzECsVgk/lssebX7zrGqKOFTFOcyedHeEGvB7AciuGhNRuToc/475c1oYuRk4jT9AYAcytkjeiCpL/hHo76w+7PCpWMHSh+QcP3trVkWpMgiBP2O2jYHTingr7nXo2emI+4Pkzoo/d5dH1n86f90lSWlNNJjF+IqD9jY7w5Y57vIM9WvHUPgxLZMSELDaZ4ev5kZX2mDcE1mRMSvRD7bQOli1PxF8s21yDzcNofhjIyqtflEI2kFxHQbpYOJmBtw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(46966005)(7696005)(16526019)(2616005)(8676002)(336012)(186003)(6916009)(956004)(36906005)(86362001)(8936002)(36756003)(26005)(4326008)(2906002)(478600001)(1076003)(5660300002)(316002)(6666004)(70206006)(70586007)(356005)(82310400002)(6486002)(81166007)(83380400001)(47076004)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 17:33:10.9633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18683da5-2dea-4977-d89e-08d83d5373f8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4420
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

It appears that the mbedtls team have moved the SHA which
meta-arm was using from master branch. It is still present
in mbedtls-2.16 branch so this is now used.

Change-Id: If24915b1a1dc889d55b359863943439c76f6ca85
Signed-off-by: Prabin CA <prabin.ca@arm.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2=
.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
index baa16bf..cd57539 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
@@ -21,7 +21,7 @@ LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D18950=
5435dbcdcc8caa63c46fe93fa89
 # Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
 #
=20
-SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls;p=
rotocol=3Dhttps;destsuffix=3Dgit/mbedtls"
+SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls;p=
rotocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmbedtls-2.16"
=20
 # mbed TLS v2.16.2
 SRCREV_mbedtls =3D "d81c11b8ab61fd5b2da8133aa73c5fe33a0633eb"
--=20
2.28.0

