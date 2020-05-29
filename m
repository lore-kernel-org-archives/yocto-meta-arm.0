Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.79])
 by mx.groups.io with SMTP id smtpd.web12.36988.1590765735179783247
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 May 2020 08:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=HbbgK/WO;
 spf=pass (domain: arm.com, ip: 40.107.15.79, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPDKe0CJj1fjY0IPTeXXc/j4gC8xMKsMESzALfumPBM=;
 b=HbbgK/WOr4lDSzdeHNHrMM3srZqBLpkuzJ7j/MUWPGR0fP0MlOvH5H2mBO5+Uedt/nhaKNo+lCl5iyx261veOgjgC6kPW2jjo5EwBL0M6YWnfPmduah6FQdEd+0igwCpG5dJvsmZO6vlh3XgmFmCRBbNx2M9pzGnMrxK7WHfX/k=
Received: from AM7PR03CA0015.eurprd03.prod.outlook.com (2603:10a6:20b:130::25)
 by VI1PR08MB4190.eurprd08.prod.outlook.com (2603:10a6:803:eb::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Fri, 29 May
 2020 15:22:12 +0000
Received: from AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::b9) by AM7PR03CA0015.outlook.office365.com
 (2603:10a6:20b:130::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend
 Transport; Fri, 29 May 2020 15:22:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT026.mail.protection.outlook.com (10.152.16.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Fri, 29 May 2020 15:22:12 +0000
Received: ("Tessian outbound 444e8e881ac1:v57"); Fri, 29 May 2020 15:22:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 913c028df65982f9
X-CR-MTA-TID: 64aa7808
Received: from 87dfce887305.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A554F6C1-9504-4ACC-83FA-F36FAB0F1391.1;
	Fri, 29 May 2020 15:22:07 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 87dfce887305.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 29 May 2020 15:22:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9xbKir+XFMnSNaU04cx5fAErY6sWUCarki07Pe5CWxOhHoG0hFgNfCOYEg6blUk/yu4AjqV/+CMZUXZMnWZbulqfPaAwdGY4u9Oc9fOTiwH/hDz7PQke7UBwWPoKanK+OkQ10EeZYAiJCi6M8b0n485yFxHUOWHxuoHKdAbnkKYnLuwW4PP94+6XjVJFKw4RtzeRkZWlFlUDeNf1W+QENLCkLByKjZgbnv3bPpNE/VBK+MK1EBFrtmd+ajk/xrdxes1xrrWvGmDU3mIPfRDuP415pjcdI3PRkjt0ivBoE204OEkm3RS3wQdKI8dwsV68ITm75gACKA9p+/50ZaNnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPDKe0CJj1fjY0IPTeXXc/j4gC8xMKsMESzALfumPBM=;
 b=fftbLdfN8Pur8OCSH1FJL6fA/V6AYm3qFOUnJuL0l+JjroAxwC2JUV+EorRPhBf43wu0TiSgDuFPW7VpSX1qAokuL6Y/CInXo2KGh71BkIjCGKPXcU2DFh2xN/b2CqqQVN3wRDh4NCksG+VeWYg2jsvHWzRZD/dkeqXeAprb4a3OYMVq9TGrecrD32hO7a3fe50aiwUXoyKBTaqxFAZYMDnCr3YtWa/X3pBd6vm9vH8zZVYr0d3yHdbs6HQMZEL938ENueuHoHSHeAeypzmmoj2TxKFwrUOOJrkTkEfFcLfglGI8+kjoYg+q0QvqylFZ+82+w+muszFglbWy5fyUaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPDKe0CJj1fjY0IPTeXXc/j4gC8xMKsMESzALfumPBM=;
 b=HbbgK/WOr4lDSzdeHNHrMM3srZqBLpkuzJ7j/MUWPGR0fP0MlOvH5H2mBO5+Uedt/nhaKNo+lCl5iyx261veOgjgC6kPW2jjo5EwBL0M6YWnfPmduah6FQdEd+0igwCpG5dJvsmZO6vlh3XgmFmCRBbNx2M9pzGnMrxK7WHfX/k=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3177.eurprd08.prod.outlook.com (2603:10a6:5:26::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.21; Fri, 29 May
 2020 15:22:06 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 15:22:06 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Joshua Watt <JPEWhacker@gmail.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm][PATCH] meta-arm: Remove meta-python dependency
Thread-Topic: [meta-arm][PATCH] meta-arm: Remove meta-python dependency
Thread-Index: AQHWNcyKpppP6Yl/H0qUdVnpJEOygqi/LjiA
Date: Fri, 29 May 2020 15:22:06 +0000
Message-ID: <70C8CF45-C96B-459D-9CCE-BF5F0DB009D8@arm.com>
References: <20200529151841.36120-1-JPEWhacker@gmail.com>
In-Reply-To: <20200529151841.36120-1-JPEWhacker@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9b6b443e-6c71-4375-3925-08d803e40fd6
x-ms-traffictypediagnostic: DB7PR08MB3177:|VI1PR08MB4190:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB41908D32E1BA027D7E7715FC9D8F0@VI1PR08MB4190.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:419;OLM:419;
x-forefront-prvs: 04180B6720
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 mhhtmQgSrxX7aJjZ0hgFcsFpL/sEVIk3X00w95+91GnfF1U1o3wr9+BQ3EFPnO1fhgY/VptRm4SgKzcjVaI8EMa7x+Mhv9B6x9jZN4aYde4m/oFSiCCdha6Vu217HCPk6nD6YQhXqGifxhK5Xzq2PtWRV32Ry8JAAIEW9vzY64Oqdi/OAUUDkhmKhGJFFugj0b+pQlU5Jm3x1qIdMbgPRHp7Fx5GKISdJbXfSrAby4EQKahzizVyCE/pTT+33097glmeRGecmvX3rno6t+QyVc/6wlcAKiGjU4W42GQOSdArO5rLDO3JvoHUpsw9axyK/Ebu71I25A3UndU9AGai8eGjvHf5iHV09IiB3sRQA8miDwbWC94K2AUKCbtupv7Q0Ftqx00p4wJ3+v2E5hnrBg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(6916009)(478600001)(8936002)(8676002)(53546011)(6506007)(86362001)(2616005)(966005)(186003)(2906002)(4326008)(316002)(5660300002)(54906003)(26005)(33656002)(66476007)(66446008)(83380400001)(66556008)(71200400001)(66946007)(6512007)(6486002)(64756008)(76116006)(36756003)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 V/uL7EUD5gK98WRHH4ZCIcGrDj+CyJPySvNHt4rzoj0xsgEHMN4ZBuulvc73aWq3dvuycxF3603Brwfdk47ZWxcPsNOuDYmHl1ujLHeXhcMC8x2FDwkgZXwnyDZQ7/3Z+k/qgT66Z8nzs28EgG+Ny83A/Ngf6rYet4F4yA/8fNouHDyJC1q7qKG60s091PlctTyJCKTv4wvjaFm8T+FSc1XXnIr8UNCU+/dHtvauJR8Hztcx3I/23PHdYXOdZVvhJD9iifYNzZbLt3hILsm4i/0dxytABr1+9NtPPeUHHpf87L4nLHZrj7qvg0EdOB4XZ9BhdaHzZDuqml+OsecJXmxKbtD/oHmAqYhGavlLF2sWOT4QejheO3Wqr1C8KN2esaZ7XQhPDAe21j7ILMb0vlKwFoCHYtFebA5xBhJ1Mz9eAilhq+SyetZ4cYht0zCR6PCLfzncZ7kVeUlt8U6s3A7+a8EXYqc0qvYulvvj/m/PJy6O87lNu+PRPzoMX17W
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3177
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(46966005)(8936002)(82740400003)(86362001)(8676002)(316002)(36906005)(478600001)(966005)(47076004)(33656002)(54906003)(2906002)(82310400002)(70206006)(81166007)(186003)(26005)(70586007)(356005)(6486002)(6506007)(6862004)(83380400001)(36756003)(2616005)(336012)(6512007)(4326008)(53546011)(5660300002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	de56bf9b-2b2e-411f-26a5-08d803e40c0c
X-Forefront-PRVS: 04180B6720
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qd//CxWDwbzMGGwoKMtHuMVSkidhY5yVHwatKkz4LRvr/l+DVOqAPzzJmePlh3T+HtS02QEJobX0L07YTD43oczvm67U3wO1gwYW6xWo3v3lKUECJmGtAF1yc7Bbbd9vTolHG+DKpSUEA5oV9KFYSrqit50wUeYIhE1DaXWF8bPQ8yoI24/JWqNk5tpIY1bhgchev1Msd4EwRj8fVzm3Loj+hziouzQ8BQSEAFTCrvO2fVIhFeATV80FDeiF86y+NH9q/jf+3cOitgkIlyKfIsBazVr8xhxReD132oWDZICYG6m3l9iC/QO80cgyfCAulfNAaX3hdYd8YShrYjpjNmU+M3wOuL6td65RK23wqlT8LVSk7e/Cht1fzxg3SS1vid0BuWKrIXjKzxWeSKpYyKgNZm91gn8EJXjHnUky8TfMH8W2AvAK++m+8sHe7S1qmMLHT4lUC6csz9T/DBe9RaADRSQ3YcJuCasi2ktHmOk=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2020 15:22:12.5429
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b6b443e-6c71-4375-3925-08d803e40fd6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4190
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1E2883629F475D4D8F316A7CA165F733@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 29 May 2020, at 16:18, Joshua Watt via lists.yoctoproject.org <JPEWha=
cker=3Dgmail.com@lists.yoctoproject.org> wrote:
>=20
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
> meta-arm/conf/layer.conf | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> index d96e9f1..1c241d4 100644
> --- a/meta-arm/conf/layer.conf
> +++ b/meta-arm/conf/layer.conf
> @@ -11,6 +11,5 @@ BBFILE_PRIORITY_meta-arm =3D "6"
>=20
> LAYERDEPENDS_meta-arm =3D " \
>     core \
> -    meta-python \
> "
> -LAYERSERIES_COMPAT_meta-arm =3D "warrior zeus dunfell"
> +LAYERSERIES_COMPAT_meta-arm =3D "gatesgarth"

Same here, why removing dunfell ?

Bertrand

> --=20
> 2.17.1
>=20
>=20

