Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76557C77B60
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 21:29:11 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.73])
 by mx.groups.io with SMTP id smtpd.web10.33978.1682717350051172374
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Apr 2023 14:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=sSKYEZTY;
 spf=pass (domain: arm.com, ip: 40.107.22.73, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ohWQCFncfwvLhYwHp18AwYioqgNIx5rU0UggNPzb08=;
 b=sSKYEZTYenziSQSHQgDWCHFge+J9MNr53loyf72w+l0+i7RchLH8wZmP69K6XKFswNCF1panEkhHVlmNRqJKVMc91PilthP1eukkBein/whN9f39og56HoZU8/req+AMoHMQlKNxoi6VN+XlObdw54ezsOsetJeOdN8iebbYpHY=
Received: from DB9PR02CA0004.eurprd02.prod.outlook.com (2603:10a6:10:1d9::9)
 by DB9PR08MB9540.eurprd08.prod.outlook.com (2603:10a6:10:451::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Fri, 28 Apr
 2023 21:29:05 +0000
Received: from DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::66) by DB9PR02CA0004.outlook.office365.com
 (2603:10a6:10:1d9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.24 via Frontend
 Transport; Fri, 28 Apr 2023 21:29:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT018.mail.protection.outlook.com (100.127.142.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.22 via Frontend Transport; Fri, 28 Apr 2023 21:29:05 +0000
Received: ("Tessian outbound 8b05220b4215:v136"); Fri, 28 Apr 2023 21:29:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7a11f2940b830696
X-CR-MTA-TID: 64aa7808
Received: from 1725713cbd6b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 457B332D-7F90-49E0-9AA9-1919787B6F93.1;
	Fri, 28 Apr 2023 21:28:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1725713cbd6b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 28 Apr 2023 21:28:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=efdqClKfvznOtx8MULVzLL48K8HDcII4io579PjpItDS8S7ImkFEPn+HJu5mmvRdazvjjW+tS6zixFWdaiIHYGYdXc9mdhY/9Wrx878FW1ZZDFLzJEhAFQM0GP+8i/FDm30PoVBLNNE+VCskHtOCqkn7ZF3+j+/TUcJ+X6Pdxpi/bTsBTD8ZCf+lvkbEYTLUO6H90jH9et3rqpkF7I+BdzRLHfIO97xFI0LfqQInWxt0aj0QVoL0yQxBu6Kw2xfAZCgktDigxoEs766rB3OY9GqF8jw6Ap+i2zhJUmoLuanY0gUdftfN3nc3Rs2fuMQo9uiECRBpnd4FJo4xNeHOYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ohWQCFncfwvLhYwHp18AwYioqgNIx5rU0UggNPzb08=;
 b=cXtf8tc5nNNKXFHsM0Suqj50AXBPTUTMqotEn30d+xQn839bmEwffGiQvqIap/WfcVwzMdvhtyYPUJI96Kf+IViThmb4arudoAa3fPbfp/XBL6iOEU+V26uo9Hnws8J099vBM+AeDi94I/fx0BaCG+Ql0SiEe+GzXWl29VJlx8111DZABu0sqFOh+kzxD7GQhC8+4vVGkb8rAr7ysFVDRsClJi09gfX+U2JYrjhSx5ClC4QZ4lEwjJQsnuC5zuDV81M2kM/cD1GYme6FEpw8oXr5ddHJ7KrURghORp8ji6EFKww1Kzf34CSUujnhozn1qF7YrtKrPZUmwczeXKV6vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ohWQCFncfwvLhYwHp18AwYioqgNIx5rU0UggNPzb08=;
 b=sSKYEZTYenziSQSHQgDWCHFge+J9MNr53loyf72w+l0+i7RchLH8wZmP69K6XKFswNCF1panEkhHVlmNRqJKVMc91PilthP1eukkBein/whN9f39og56HoZU8/req+AMoHMQlKNxoi6VN+XlObdw54ezsOsetJeOdN8iebbYpHY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8098.eurprd08.prod.outlook.com (2603:10a6:150:76::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Fri, 28 Apr
 2023 21:28:54 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%6]) with mapi id 15.20.6340.022; Fri, 28 Apr 2023
 21:28:52 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "vvavrychuk@gmail.com" <vvavrychuk@gmail.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] external-arm-toolchain is not compatible with CMake
Thread-Topic: [meta-arm] external-arm-toolchain is not compatible with CMake
Thread-Index: AQHZef9zWuARbiWxnE65dngkOneRz69BPM+A
Date: Fri, 28 Apr 2023 21:28:52 +0000
Message-ID: <CDCFE884-083F-4762-B56E-46B25D3EB948@arm.com>
References: <FV09.1682689650700057399.dcye@lists.yoctoproject.org>
In-Reply-To: <FV09.1682689650700057399.dcye@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8098:EE_|DBAEUR03FT018:EE_|DB9PR08MB9540:EE_
X-MS-Office365-Filtering-Correlation-Id: e66aace0-6e6f-4dba-98a2-08db482f9802
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 SsFs/j9jpSJlwar+ZU0j682Xc4xST6nNh9tMq4jYcXwAfNsLnb6PFdAT9WWCFFrKGB2YXS7/dHaU8YEmRs69og3lZs9bci7AtPMILPGlOm8RtiWJJYz9wHAgBzK2d4sOZvMpUF3MISWQtmkbJMPyV9RXWh1FoHBhxaz+g+mnWiPq10b3E4kuvGdMTmhhG65iBrwuX2XCB8cAmOH5ifOnVhoOjT8uXmYj1wgh5bMslN8Iq+sfBjJZQJy8rNCzteCh/lIuXHRn98pPxHyzQ+B6JKr8ecuFToIs0AhqDfJqZ6+Rg9XS2WwtbuVqhKdBNVDSdRQ1pxYlTr4SUM8NepJ8/OF7P6bEWaBazLEUtN+C0SCn55vNPKgb0SbMZg7OVquur/O5K8wMSRDzHRY3cmw+oqW60lq1KAtLvr4tqG/jsWEfjUnzM0ZI3qm0JSBKZVCKSZYySdG6irv1wPk2Na+/Ip7z3FEiz3weSplZCJ3XZGqjhGkSAeyVr3DliW9vwGUlV+4xe3M6KUb8RuxYrCCepQama1sWDfyNVCCuAy4dmTFAMvP10UfT+qTUakQSMG77nDHQgsfxGma+LOxEy7Qw2N0B1jj1Sz2BBg7Q9bFpArpvK+BoLpzeuadDcLfI4BIG8XpMXtP8eE5gpb6r+DJI9Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(451199021)(2616005)(26005)(53546011)(36756003)(6506007)(6512007)(186003)(2906002)(8676002)(4744005)(38070700005)(38100700002)(478600001)(41300700001)(316002)(122000001)(33656002)(5660300002)(76116006)(66946007)(91956017)(64756008)(66476007)(66446008)(66556008)(8936002)(6916009)(4326008)(6486002)(71200400001)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A1D5CDB05B4FC546B12AD1D744829E71@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8098
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0282aedf-da33-48b0-4aef-08db482f907e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jzGZrjIt41iT9dTLdPvd2QSBimPI2thak7ODSkrr30xwMEBOwB119Rollg0gbiSiDjIvTc/VHVbx5tYZ1yTnDlatYrYBRVtTsqRgAcG7cpGMG/d9jXIwYTp249uQbQQOAz+WKSfWh28Qin4aMA6rvCfknFVSTK9g3YZlEeiOCw33mSGYMU4Fmf2j9+g0DKuawoJ8Y9QyWQQ3PzzjTH/SnA6hTkIZxfwyFZvXIUijuqIFwveqdbC8OQzvyUuP1CWt8DqkVPZMINAbd8Lwlnc9fCpviHlH01TAG8O3cgdbSV8yPi3bGnzzM2/l2i4JoG2amErfUAq9j31Xx/9KzwezMsjADb9prwpjv/MXiuInUIftQWW+XkHsyOiweg8YX9gKA7L8/RYprVYM2r6q6Jt27WEhrQpayyJYN1VGPFt5SnmyfJibch/Br8jhWnU5czJ9h/RLsIjSqFImx1CAA4de3RicmXeMPDu/gIzMAJdK1auRIF85SzEIKrmU0N4nkD6T4m+DVIy+gnylgSJw0vj947/U/+25Q4K3c3K50WVujwRytx89KhNa0ycZEcxr68P2nEXAOqt+exD36P81zZ50wdEiJUK/9lWKXySiFjRT8Vfi71O4UAhY5+JJrXyisUBYCI19GfzflpFr7Ks6EuvSVtOMJlhuBj+Co4Yv+6hqEyWRF654SgThBPBZPTHE+1bLqIX7O26G59yhd8vUPb9rzPvpieAlgF1FzCcgdoaOeIg=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199021)(36840700001)(40470700004)(46966006)(2616005)(5660300002)(36860700001)(47076005)(336012)(4744005)(2906002)(40460700003)(186003)(6512007)(6506007)(26005)(53546011)(41300700001)(478600001)(81166007)(82310400005)(316002)(4326008)(34020700004)(33656002)(356005)(40480700001)(86362001)(36756003)(6486002)(6862004)(8676002)(82740400003)(70586007)(70206006)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 21:29:05.4026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e66aace0-6e6f-4dba-98a2-08db482f9802
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9540
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 28 Apr 2023 21:29:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4627

On 28 Apr 2023, at 14:47, Vasyl Vavrychuk via lists.yoctoproject.org <vvavr=
ychuk=3Dgmail.com@lists.yoctoproject.org> wrote:
>=20
> 1. Get poky & meta-arm langdale branch.
> 2. Enable meta-arm-toolchain
> 3. In local.conf configure
>=20
> MACHINE ?=3D "qemuarm"
> TCMODE =3D "external-arm"
> EXTERNAL_TOOLCHAIN =3D "${TOPDIR}/../arm-gnu-toolchain-11.3.rel1-x86_64-a=
rm-none-linux-gnueabihf"
>   and get and extract toolchain from ARM website.
>=20
> Building recipe which uses CMake build system fails with
>=20
>    The CMAKE_C_COMPILER:
>        arm-none-linux-gnueabihf-gcc
>      is not a full path and was not found in the PATH.

Is this *every* recipe that uses cmake, or just a specific one?  We exercis=
e this path in the CI and it works fine.

For example, try libcomps, librepo, or libical.

Ross=

