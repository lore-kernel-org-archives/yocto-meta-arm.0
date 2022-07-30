Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF6AC19F2A
	for <webhook@archiver.kernel.org>; Sat, 30 Jul 2022 19:30:16 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.42])
 by mx.groups.io with SMTP id smtpd.web11.6251.1659209409985609313
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 30 Jul 2022 12:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=97akvwr3;
 spf=pass (domain: arm.com, ip: 40.107.20.42, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mfwmTH7Wa/OW/rHSRBGIafEweKn/2DjBqFVLDn0weOFCEwXlnOmPR+Rxt+KboBq6yrH5DHQZ5fTsok/pJjPISx+tdaVtWkn+iEQZZTvbeBxCleAj7UjzAKmRTpko8327MvLfRpqxV6r3Rxj09VYnwXDVTwD3dQUY31hb6W+v3UrMydG/1o5k2wrbtK55h36zTbjQ7H0As3E21mhQOwYYU7xEQ7djfU5ne2c2gzlwg5jaGRgfSQzYu0PRhAT9aET3cArss59EhJ5pMs4kIELeg0WHXMcRZUKvfuchA8GyVrNfdA3274AmEVKRdnbbibRFAvLPOEjVmnMnpgxrP7cCXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgZR+ja/7SEUrDX455TwFubpN28EhmtGr8QT1CR6UPs=;
 b=hoDe94Q0cWH3oi3WeIu3XCW6U/tsK/fNtSRpcDkW0T8j8tWO6iTQOh/gt1ad4n/Us2wVQQz7n6idKchUQBKN82kWvmpMfMgg0/buysOCVJ6AfMcKap4zspu9GkDC1y1L5LWK63/ZD5FW7SF/ugUxEWQ6oA4cTxKPhO/T8jTTSRHtdzpBp66hJh95fURqWiYIbr2txelHGm1OZCrPr/M8ACBop0rJGrXvfFUNNaQOirud/hWB9L0q+jAZ9/dqgYDX0MHSPDOjfH8B5nyke1at3kEedGaiVcP9ezGova8lwmnraa6ypVTIgR+MyFunDUfLfdDqF5MfRTyhxVwbsAEZPA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgZR+ja/7SEUrDX455TwFubpN28EhmtGr8QT1CR6UPs=;
 b=97akvwr3StOmL8xThqROaSqINJuoMsQezMb++BAip/EgS96TuAD5JFAOXroUx07xvKxGqIVcZ4lUpLvOvXxRLBryCT1aW4svygC70yIsGot4qJp/bCdqjRlUXcNKyioiYjlXSukU6PYWVFC1ENqLnxUlJHHRRm+ZFgVz16SUJnM=
Received: from AS9PR06CA0015.eurprd06.prod.outlook.com (2603:10a6:20b:462::6)
 by DBBPR08MB4645.eurprd08.prod.outlook.com (2603:10a6:10:dc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Sat, 30 Jul
 2022 19:30:06 +0000
Received: from VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:462:cafe::70) by AS9PR06CA0015.outlook.office365.com
 (2603:10a6:20b:462::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11 via Frontend
 Transport; Sat, 30 Jul 2022 19:30:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT015.mail.protection.outlook.com (10.152.18.176) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12 via Frontend Transport; Sat, 30 Jul 2022 19:30:05 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Sat, 30 Jul 2022 19:30:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 58673a63355b5a85
X-CR-MTA-TID: 64aa7808
Received: from 4187b593b88e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 113CBBE4-CD17-4724-BF62-A7A90893105C.1;
	Sat, 30 Jul 2022 19:29:58 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 4187b593b88e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sat, 30 Jul 2022 19:29:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yf6F9KtT7c6IUz5DbD3XRUbYtNEb/AUvPPZnDFjsm9dz1KA7fHwOKVRtuaGaHlw014qsRddb1o9n6mHnDRHohy9u5O6yTNK7mnJwL/LGLIODFFf2MkneVVIgXesSftOLiYDmKcSBGHH5cQFD9/HwjhrQMU2ZAgTRKOxY2N7VOQQ40hHZiWNsq22xh9y4iJICAEizAG5bTn3OB0FQU3CBZltdB3Apo0Q/nU2+Oj2zN62XVrmPocDEZ4TYw4SF+6zbwjVJlm0gIF8Y34kROUP1tjQJ6M+3xoE1h8lL12h9cgnPIX+yjz+2z77fO7fmQ17AlXzRnpHHxn5Dvx+uujTx7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgZR+ja/7SEUrDX455TwFubpN28EhmtGr8QT1CR6UPs=;
 b=ax0kF9/jnOyR/ukm8snAxY0PKCxo5NlOHYsapB5e4Loabylk1MFv6sUnh466KrQb0q9FfuJ0tyNpaL8hha6sS2uusMQoPMs+QqIWX+xn6SAW1r6kEKd1FrJ4qxVpyQVWvaR8mjN940+fOwuoW5O83N+6LSv7rRvVKEIZISGoZXc39iWjOL/zTy19R8YTIdKSfbVHHnSKAGi4kfAg8Cyv1l+gOoMLdCU2t7cdrlgqIgaZk5J1Ct93/JJEaxXiuo4l9FzhT3Jn9+zYlfNyjaMpbtKnEocnASm+ge5Cjqsupjix3RswHipm40DR/UNTAEmVRW3mDpQAcTq6rxd1fwEXUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgZR+ja/7SEUrDX455TwFubpN28EhmtGr8QT1CR6UPs=;
 b=97akvwr3StOmL8xThqROaSqINJuoMsQezMb++BAip/EgS96TuAD5JFAOXroUx07xvKxGqIVcZ4lUpLvOvXxRLBryCT1aW4svygC70yIsGot4qJp/bCdqjRlUXcNKyioiYjlXSukU6PYWVFC1ENqLnxUlJHHRRm+ZFgVz16SUJnM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB5569.eurprd08.prod.outlook.com (2603:10a6:20b:1de::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10; Sat, 30 Jul
 2022 19:29:56 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::29f3:60b1:981a:c24b]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::29f3:60b1:981a:c24b%7]) with mapi id 15.20.5482.014; Sat, 30 Jul 2022
 19:29:56 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] optee-test: Use system openssl on musl
Thread-Topic: [meta-arm] [PATCH] optee-test: Use system openssl on musl
Thread-Index: AQHYpDFnB1QDnRXgaUi3wMgl1SXwK62XTRuA
Date: Sat, 30 Jul 2022 19:29:56 +0000
Message-ID: <FD014B7F-1381-4AAE-8C7D-872CB144D96D@arm.com>
References: <20220730162741.3624780-1-raj.khem@gmail.com>
In-Reply-To: <20220730162741.3624780-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d947c564-0399-411f-b961-08da7261e7cb
x-ms-traffictypediagnostic: 
	AM8PR08MB5569:EE_|VE1EUR03FT015:EE_|DBBPR08MB4645:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 V//HG6tKGe1i6/oc8L1MK/BpGCloRwm8KKHTxJEhzEBCikmP5dcj5add1M0+tePrlBYd026BZIUhet2fBJzgGj0ntj5E+Jxgl8NZMHXBBbP8Poo5Tag62pblt/TiW4i5eR7E2CeFspZkoW0XrL4NXezuD/ln/4EBxay2FuTPRRHzmgrlHWsTk4m1b+47TZqnBAFilhQaXdvZaZt2Bd6433TL68SACPcSqSKc00KF0wN+mqgbXw7Yj/uMGqWumcUDpiVGMJFSQ29KYWlsFma9jHTJuZrh7DRq5qUvw/7XKWbGvzquwq4U/s2rso8x4dSUAWXqc4v0O7Ftcx0n0e/p48QnguAf844SAcv1flmLR8cMBv3GKv3RZ9HjLn/ke5d2TNWtc6J5xzQlzd2ukHPjOPi8MF6hc2aSg+LZTr7hvf3afMNFNc1T2dSGuO4PGbMGGg4E2SOUqXL7dgHTq4FfvTCkhsdvRZuvmSp33mWBf4vizWVlhMoZAEfVrn36uFVxdKRDRr8iIY0ftSD5pXvnBUVKwkZsu4L7zhgExgAK0Q7JIpJVVkzv+2Apgqbm3EZzR7SnOLV3D9cvxl8CrFpibGMAvS5Ik7Pg/0PyF0LQughbx3J/9UDi+pbCSJX2+8Zzp7OMfgQGM4jS57l0Skdgu422nJdEmXXir3ro5hedwcVIyasx9fuVwNW8QsuYJdVetiZzHWcKFr8p7lVQKVswk8IRHMpcT7ptXrwsbb5uOjAugxgeer3mQCCfePCpuEUCB1JK7kS2czjn+uNOhHFp9QIFJhVcRPQjU2c0zvscsdw4jgxYwomxHEDf3GQ7fWSuCK8xj0JR/0jpl3LyDjGLag==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(38100700002)(41300700001)(122000001)(8936002)(478600001)(4744005)(6486002)(38070700005)(186003)(71200400001)(2616005)(91956017)(5660300002)(66476007)(66446008)(64756008)(66556008)(76116006)(66946007)(4326008)(8676002)(6512007)(6506007)(316002)(53546011)(6916009)(2906002)(36756003)(86362001)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <22B7B2406218904188FD9F718F42AAF6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5569
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	17907071-37ad-471c-7aa5-08da7261e265
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CNQcYn8yTLGShhKxKSNVjOHntCKPlbsWYt3gDfh+u5ZKB/sMKhhUUalzNSL1YifvRB9V7x1VZbhulpcmhOHotWPLDfvrz4/v1RO+GPdL9/soQmqMv8Ut6RGZpONd8HObLFUyncQuQkaOjJXNk38DOZ9cpzeBrYmkfvdvWoOkEwmQcOX+Uic/H2yATiif/iuAFvaIeBC01mH86uxRIDCpWXOWnzzMZrgUHeiRxDtRuwpHMPBvps7fMethk8x/kchJxEaFt8oTzJohbQCcGpJDMSBL0BAA1iD49JLsWIr8yW3D/A8SxAbsxDk9rbAYu9qsZomZQaBuyPjgpostJgGq3ah6cTBwSh1vXdhiiQcxoHMEoKexGQf7Fe+kSAkWazbiOEkR6F0nHYuc0pAqoNDHJVdCOekH2SO7qYup9qrmtBPnhe6+4+79kRAvmhqrpLG20AUNNcL1aItAhGDLT2evp/MHPkrmIKWm2g/P9Qg3ieT7bsd1PTxKtTxxB5akkSwYoijq3ZAVjEN43hooTnPPlK4X0YFOOvA8gSKauBsTtO4eBe0ke1/JsttQvxMcyHj6h2ip6qyK34lmmSl5tEjrD8K4Aya481zJH3Hg4UIPMiWocdLJbkXOpM3Jb8fcuN+JCZra+0vHYS9ExMnjkxU1X6O0UDF89CKTtGLdvfReHTDJnIB8DzRj0SBdPhsgBzCkC9b1Tz487O8S+9CZhYWvW6Fv/zJW1Ae/UGjlbvg5kvz8ywWazgvjs21k8t8ilaXlqlEkEBoQpXOlQh8aiWKmLzTV0S3MFUESwN6220UUFH+4QR5nENLM02BvQBDBXwWk
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(39860400002)(136003)(396003)(40470700004)(36840700001)(46966006)(5660300002)(4744005)(2906002)(36860700001)(82740400003)(356005)(81166007)(86362001)(6512007)(82310400005)(40480700001)(40460700003)(53546011)(26005)(6506007)(186003)(2616005)(6486002)(8676002)(4326008)(478600001)(41300700001)(336012)(8936002)(70586007)(316002)(47076005)(70206006)(6862004)(36756003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2022 19:30:05.1378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d947c564-0399-411f-b961-08da7261e7cb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4645
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 30 Jul 2022 19:30:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3623



> On 30 Jul 2022, at 17:27, Khem Raj via lists.yoctoproject.org <raj.khem=
=3Dgmail.com@lists.yoctoproject.org> wrote:
>=20
> bundled libcrypto.a in optee-test sources is built using glibc based
> toolchain and expects foritied _chk version of the libc functions e.g. __=
sprintf_chk
> which wont work for musl. Therefore rely on freshly built openssl by OE
> instead

This sounds like something that should be done always, and not just on musl=
 builds.

Ross=

