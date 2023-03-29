Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2649EC88C95
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 15:53:56 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.79])
 by mx.groups.io with SMTP id smtpd.web10.72.1680105228820041619
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Mar 2023 08:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=E+h34qjp;
 spf=pass (domain: arm.com, ip: 40.107.7.79, mailfrom: adam.johnston@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQpy9IE95qmWJkRb8JjF0PV7mB4q9NAdvjAwXi/JQbc=;
 b=E+h34qjphY6qjzun68S8RyMVtmsPxJZIBzkl/gkldHNw8N6e/aMZFnTWp1b8IEwMHJZNMvf7Yv/8IGsjcaK2YJ8KbzxbbVvH8ILy1QKGujQPN+ZUkfsKs4SPz63pxfhdA61qLIZMXU9tWsa5RSP0KRrrdJdFEZiH10uBU1LPhlU=
Received: from FR2P281CA0053.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:93::6) by
 DBAPR08MB5576.eurprd08.prod.outlook.com (2603:10a6:10:1ae::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.34; Wed, 29 Mar 2023 15:53:43 +0000
Received: from VI1EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:93:cafe::96) by FR2P281CA0053.outlook.office365.com
 (2603:10a6:d10:93::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.20 via Frontend
 Transport; Wed, 29 Mar 2023 15:53:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT024.mail.protection.outlook.com (100.127.145.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.9 via Frontend Transport; Wed, 29 Mar 2023 15:53:42 +0000
Received: ("Tessian outbound e13c2446394c:v136"); Wed, 29 Mar 2023 15:53:42 +0000
X-CR-MTA-TID: 64aa7808
Received: from e5f8cc9fa5b8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9BBA8FE9-FAA7-4314-885C-22AF12D57E46.1;
	Wed, 29 Mar 2023 15:53:31 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e5f8cc9fa5b8.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 29 Mar 2023 15:53:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tii4s6UVAp1cuRXrMKzKzfYQrJuhQB+bNPkyCYfzqiYyXnLVhNiFGBkp8rmi8T/zxnnhsVJd0+WyZtwkOavGq5IDZpXHxfR94YrzFTAR27AwjJSjdehphEiJdLrsPgRbGw3Ge3XDglSTjFckZw2tQ3jMAnE057i+J/az6+K7gcIyVDFicZxlYuU8EwV6ITelyF2TTPEV/i8n1wfTaSP7m1ZhgM35nZT1oIaw1UDWaDtcuXkrpb6z7HYs/OAwG0CzCm+hA9QkvvqF9MpOHGCaWoQ+sAZCiMveM0/8X80m+dXbm8BHQN3OYKX6pTDPurIP4REMExVkv3gGEbkgY4m4jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQpy9IE95qmWJkRb8JjF0PV7mB4q9NAdvjAwXi/JQbc=;
 b=VDobSwQ3uz3/f6xT3gYQKYlYp/tDn+VydU4kGvt0xtVyGnTwmuN/l+IMqogXXwpM0nnT9grHVNQ70xnjPJRXufV0aLxcmgW6fnWgxGSyx9Z1IjIHBJGL9ka93aVLm0yIW4qB5wb4FnJO8wv0ehScfOg0qUCFlPJQIxYzKny3fqVHmo+kdRUUqbLk+LKcWBXJySyEKXxht2yIg4A24occNPFW/isD4ZJFXGoiCGyB9YXleXXMVf3QMA1ygEpDO1GJZwURmGxRrzG6pXz23HYX702IXKWG8MMsaRvh3+z36MMlRHcsv6Vt6KeJrcbumwBmLxLlalFxcGd8T1oJFhSfSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQpy9IE95qmWJkRb8JjF0PV7mB4q9NAdvjAwXi/JQbc=;
 b=E+h34qjphY6qjzun68S8RyMVtmsPxJZIBzkl/gkldHNw8N6e/aMZFnTWp1b8IEwMHJZNMvf7Yv/8IGsjcaK2YJ8KbzxbbVvH8ILy1QKGujQPN+ZUkfsKs4SPz63pxfhdA61qLIZMXU9tWsa5RSP0KRrrdJdFEZiH10uBU1LPhlU=
Received: from PAXPR08MB6432.eurprd08.prod.outlook.com (2603:10a6:102:154::12)
 by PAWPR08MB10057.eurprd08.prod.outlook.com (2603:10a6:102:359::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.31; Wed, 29 Mar
 2023 15:53:29 +0000
Received: from PAXPR08MB6432.eurprd08.prod.outlook.com
 ([fe80::ee8f:d071:c766:9288]) by PAXPR08MB6432.eurprd08.prod.outlook.com
 ([fe80::ee8f:d071:c766:9288%7]) with mapi id 15.20.6222.035; Wed, 29 Mar 2023
 15:53:29 +0000
From: Adam Johnston <Adam.Johnston@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Ross
 Burton <Ross.Burton@arm.com>
Subject: RE: [meta-arm] [PATCH 1/1] arm/trusted-services: Fix 'no such file'
 when building libts
Thread-Topic: [meta-arm] [PATCH 1/1] arm/trusted-services: Fix 'no such file'
 when building libts
Thread-Index: AQHZYlY3Nuhu578MkESlxw7stWdlk68R6ARQ
Date: Wed, 29 Mar 2023 15:53:29 +0000
Message-ID: 
 <PAXPR08MB64324E4F324EE94A816448D7E9899@PAXPR08MB6432.eurprd08.prod.outlook.com>
References: <20230329154840.1827565-1-adam.johnston@arm.com>
 <1750EE88BBCBA010.11091@lists.yoctoproject.org>
In-Reply-To: <1750EE88BBCBA010.11091@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 389708F4EC910147863208A71317E951.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PAXPR08MB6432:EE_|PAWPR08MB10057:EE_|VI1EUR03FT024:EE_|DBAPR08MB5576:EE_
X-MS-Office365-Filtering-Correlation-Id: 3462b846-4853-410c-4d84-08db306dc596
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 npmSMi3zUeT9ysPlxgmj67gl2YUtRUWf+y5OyJEp8/A+9azQrBEfrwk7cc4v8eGxye361m9ikMB8PlSqqBSBt1+Uxh6AKD+sdf7+w8ynDGkX7fA5qftyRPyot/e5bHS/7ZFviq8dF0HvmcY/xezAY5Hylsg5JA4yPg3i5roT+bDENtQ4rzZBEVX6t+zVo3bchVssHbMhKu34M56ZOS92Njk3BAbDE4hZBx+SMTYcZ6oLYXMejVuWll67VcPd4+ODp+dnMzWN0szP/R8f6GHGZ0OzZ0DddO6cZOpTOeftjHROvlgD3US+lB6xcL80G90wxHn1k9BjJcGHuBwMOCIIR4e9NesDL4VUUNE2wL3eKsaBwAQqaKhEjM/YLuaPjJwWlucmB4Zyt74E8tBEKgnbJBSgd5dUsZUu+XsfNiFQP+oz7mNFdAd7T3EYLneQ57zBcq6AiMhPiPkIKRM6WDd2qA0YHoTL1aeZRTDIOy6lpY/KXagsdnR28l77EdiEB8n94NRpS9sLDvdeng/wrbp7/CULozB2PmyWgaSTJT9TNgslQzlcWRX8fe8Sb5XzG/mqBd60QjOvQLAwnqXQf0/GIK7QFMv7rMOOhABZ5KAqpzq7/isF47TDe8g+INnuHYXA
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6432.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(451199021)(478600001)(5660300002)(66476007)(64756008)(66946007)(76116006)(66556008)(66446008)(186003)(316002)(26005)(52536014)(122000001)(41300700001)(8936002)(83380400001)(7696005)(8676002)(53546011)(6636002)(9686003)(110136005)(71200400001)(6506007)(55016003)(38070700005)(33656002)(38100700002)(86362001)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10057
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fead47e9-70a4-4e19-662b-08db306dbd8a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bwC+H3Q9CDZn1RSkIbAD6/ylpcqUgMlpXLoKk2GqoCLmql+ieoaco9YyPll23Vc71+Oo5GmCVdPdTwUE4EhyQHuo43eKvc70oriEs9fXx9+k5gHHB3jkBBMhDbzTSpZibKc3yyjj8hiXOOYhm21duBLb7zQ3wyBXVU0pdiisIlMRZvog5pzJU+m3uGdMEnIKN+XYeyOOQFH/umWcVoaoNwhY3+HOoVzkK7fp8gn9+ZCdhK3feIIKmrrg3a/3PIwWYbbyw+VjWgnX9NpJkI/enEk2zEF9hBdxXwdLdjDaydlLU1PPhZ/cxN1Din1PD7nhvYWul6uB6QGomubQoAl1fSNAjTwz0JAsnJ/BGpce2yVzNCdEPMioZGGSSRanrs4+9nxa3wyS8oHR74cYWF4wyGo2m3dkC9Y5y0J0W6xgC9agXL8Nlke3Bm9Xgtf91Iuih5+Z9Xgh1d6wR0GnU3VagEmuLhrf3vB+IqrifXwXAEd/coKNBBxTvneIGrz0/e2o3j+oEphx/zUnCwQr3tGZ4IXSdkz5nBENjaJVJ+xFjV8e8w8rWtLUjarb6jtyfj9YINO//KTKJ3kLe/HfDimNDDehERLFeSk0kHJNiOqZEfT+kLNAFkcTeNouAx48OKbIqKW08pz7HOqqeSaG+Yu0jnuCLeOoPGQ1fsvnn+KxC4Jtyv/26V6vSsDWWh5RUqs5/Acf/InaFjmYydmq9iOLTQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(39850400004)(376002)(451199021)(36840700001)(46966006)(40470700004)(41300700001)(40460700003)(55016003)(40480700001)(83380400001)(356005)(86362001)(5660300002)(6636002)(478600001)(7696005)(336012)(2906002)(82740400003)(47076005)(36860700001)(8676002)(186003)(70206006)(70586007)(52536014)(110136005)(81166007)(33656002)(82310400005)(8936002)(53546011)(9686003)(6506007)(316002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 15:53:42.6493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3462b846-4853-410c-4d84-08db306dc596
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5576
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 29 Mar 2023 15:53:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4504

Please ignore this specific email (should have purged my outgoing folder).

Regards

Adam

-----Original Message-----
From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> On =
Behalf Of Adam Johnston via lists.yoctoproject.org
Sent: Wednesday, March 29, 2023 4:49 PM
To: meta-arm@lists.yoctoproject.org; Ross Burton <Ross.Burton@arm.com>
Cc: nd <nd@arm.com>; Adam Johnston <Adam.Johnston@arm.com>
Subject: [meta-arm] [PATCH 1/1] arm/trusted-services: Fix 'no such file' wh=
en building libts

From: Adam Johnston <adam.johnston@arm.com>

The libts recipe assumes generated cmake file will be suffixed with '-nocon=
fig'. This is only true when building with the default type i.e. "".

Check which target cmake file has been generated before trying to patch it.=
 This fixes 'no such file' error when building with an explicit type (Debug=
, Release, etc).

Signed-off-by: Adam Johnston <adam.johnston@arm.com>
---
 meta-arm/recipes-security/trusted-services/libts_git.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-security/trusted-services/libts_git.bb b/meta=
-arm/recipes-security/trusted-services/libts_git.bb
index 598b281b..aafe8516 100644
--- a/meta-arm/recipes-security/trusted-services/libts_git.bb
+++ b/meta-arm/recipes-security/trusted-services/libts_git.bb
@@ -24,11 +24,14 @@ do_install:append () {
     fi
=20
     # Move the dynamic libraries into the standard place.
-    # Update a cmake file to use correct paths.
     install -d ${D}${libdir}
     mv ${D}${TS_INSTALL}/lib/libts* ${D}${libdir}
=20
-    sed -i -e "s#/${TS_ENV}##g" ${D}${TS_INSTALL}/lib/cmake/libts/libtsTar=
gets-noconfig.cmake
+    # Update generated cmake file to use correct paths.
+    target_cmake=3D$(find ${D}${TS_INSTALL}/lib/cmake/libts -type f -iname=
 "libtsTargets-*.cmake")
+    if [ ! -z "$target_cmake" ]; then
+        sed -i -e "s#/${TS_ENV}##g" $target_cmake
+    fi
 }
=20
 inherit ${@oe.utils.conditional('VIRTUAL-RUNTIME_dev_manager', 'busybox-md=
ev', '', 'useradd', d)}
--
2.38.1


