Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.78])
 by mx.groups.io with SMTP id smtpd.web12.12038.1589204111193759317
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2020 06:35:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=y8X7NmGP;
 spf=pass (domain: arm.com, ip: 40.107.8.78, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=498NAC0yfOWoomrFDO1OVwUc+Jhd5M3wV9ok2RZTXhA=;
 b=y8X7NmGP15NuKpTeSEWv6Ga2LyZkNhcYCEL2ufKb2pykFoJy8E5HuA2zk/Oinz6F+8HQoWWxl7GLHmy3NFcf8NXpqXBBBqsrT8SDLr+dqcyOxUcsA+uwD9zM1UKHSD8mTkQZ5P9DHV7X/5dUuS2Nf6vf6vYkM2HI6p1Nkkx2NRY=
Received: from DB6PR07CA0079.eurprd07.prod.outlook.com (2603:10a6:6:2b::17) by
 AM5PR0801MB2051.eurprd08.prod.outlook.com (2603:10a6:203:4c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Mon, 11 May
 2020 13:35:08 +0000
Received: from DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::f3) by DB6PR07CA0079.outlook.office365.com
 (2603:10a6:6:2b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.11 via Frontend
 Transport; Mon, 11 May 2020 13:35:08 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT007.mail.protection.outlook.com (10.152.20.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Mon, 11 May 2020 13:35:08 +0000
Received: ("Tessian outbound 11763d234d54:v54"); Mon, 11 May 2020 13:35:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1eed1c2b3c0485be
X-CR-MTA-TID: 64aa7808
Received: from 1f34d9b757e4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A051E02A-9E43-4204-83DF-E309D30B4F2D.1;
	Mon, 11 May 2020 13:35:02 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1f34d9b757e4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 11 May 2020 13:35:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWm15X1Tl7d1rEKmd5/gQYBRMKSC3d+I8zZvA2bFHQiJhJxKIbaGrRYvV5tEyzZbb03uaFphyJGOvUOoZ4/vQLulr+7PBUHD+QXmxYEIhv3IiKFmoMKhkZkGdQEJ7S3paKeMa9/MDeK8WlyAJ+8MvCsTYEf3QjjvQs+wXGQ+UP1/h4vW/jfC2GLqJkzjBQiZ5pIl4MSOY/Kt+cAtQvLltquJdeM3aAevi3AlyClDggJd6RRGhD1nCQKqNQBtHAvPHA8Qq+8CzaHmG9/TMDd6TUfTM5WvhDkGd/I3zweVX/Syxpi5MsPVgYln7zOLjWNbGwhmbYLdQ+Tj0LB5/1Gh3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=498NAC0yfOWoomrFDO1OVwUc+Jhd5M3wV9ok2RZTXhA=;
 b=bCmgUWBQYNp2Ni3ztuWQOXHjcqw29l9hHvygIqAmNv9pS7qNTD+NsX0b5uEgVqrLaOOfCR/GPMf+kfPiQKxHLEys+IKzf84bHK27l01x6jhd1mOD23RYsryEJTB2zuUxf+kWSPcWQnBZgDRwR3KzKkcGZ25G2sn1qCjwTejCi/htHP2koq4tfk/nFwWtHhJNyFUkX2rvyX6SlREI9dCzS/V5cDC1J/9/TWnF/OjgbaEOSs/eb0ZMum+QIJlC0zQmx4LQIFl+o+DJZQASNBTEDy+IABPJ+IZHzA8N12Gmv1z8cEKk4lhaCFF69Rbn/SoXBnkBzYX5a+uIQhc/XWSmbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=498NAC0yfOWoomrFDO1OVwUc+Jhd5M3wV9ok2RZTXhA=;
 b=y8X7NmGP15NuKpTeSEWv6Ga2LyZkNhcYCEL2ufKb2pykFoJy8E5HuA2zk/Oinz6F+8HQoWWxl7GLHmy3NFcf8NXpqXBBBqsrT8SDLr+dqcyOxUcsA+uwD9zM1UKHSD8mTkQZ5P9DHV7X/5dUuS2Nf6vf6vYkM2HI6p1Nkkx2NRY=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3497.eurprd08.prod.outlook.com (2603:10a6:10:48::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Mon, 11 May
 2020 13:35:00 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2979.033; Mon, 11 May 2020
 13:35:00 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-autonomy: Add CONFIG_MD and CONFIG_BLK_DEV_DM in xen-host.cfg
Thread-Topic: [meta-arm] [PATCH] arm-autonomy: Add CONFIG_MD and
 CONFIG_BLK_DEV_DM in xen-host.cfg
Thread-Index: AQHWJ5aG4GkVQo8f3k+Y7i6naTTQE6ii4sGA
Date: Mon, 11 May 2020 13:35:00 +0000
Message-ID: <51674435-1EC3-4A37-8DDB-BED8C7C109AC@arm.com>
References: <1589202898-35955-1-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1589202898-35955-1-git-send-email-diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d134a9f8-d949-44bf-b20d-08d7f5b01f1e
x-ms-traffictypediagnostic: DB7PR08MB3497:|AM5PR0801MB2051:
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB205140FFDAE68D0D976791FF9DA10@AM5PR0801MB2051.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4714;OLM:4714;
x-forefront-prvs: 04004D94E2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 8d8VT16YLPZamBN7S4dfbCLs+8KX590WLp8hQKAxCOtwrs7X9rwcuNpN2kqgqsrgP2Ymm6cLE+kV00WBBaQKvbOFdMD5bEfSgRbM21uVYRay3l+FAhoX0SccuJim8LMNOKOIE3W3MEWoF7F6SV2pP9sCWUuFbLIvl4SSPwLJjgFXbFmG9Tb6UN/+rRlpjXUIAL1dgoAtU52JAQmXp907kAeQmYiBkEkMk0J1rvjxY7cRDQKF5KGwvF/Zlq12ZrNXCC4tGN8oQAfjSz5gzOV9EKMAkg6lARBTxrlFdetKjRaa3Y3gWNNDFO0JK2fGk/R4PAQksJvg4+RGJhrMJXXBi0U9cTmmGDf4SBJ1pE7VJ+xtuY/6d3hIeM8K3IRO3pbiQ2xcdNcjjPxO7KzJ+Dv88/OOTkaYTvlNA4kfOsfR4NUVHbjM7cTFNWcpbmkVfkwHneWR7bMUS5xxpHL7ZhI8dTmeTCdNB7qMTqtBSb9pQYDGytqO03vBTp+8/AXjtgO9BAmxZ3qVIwEav11hVKVO5n9y6ErkK+00Byqds1opwzTC0Hx8Us2N2gUZbqyjZ/Qv2drCkeso+OoeKXYf9wNFcIh7cImGm/m8DgrQ+aMAo8o=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(33430700001)(186003)(478600001)(6916009)(6506007)(33440700001)(6486002)(53546011)(8676002)(86362001)(76116006)(66556008)(91956017)(66946007)(2906002)(5660300002)(66476007)(64756008)(66446008)(966005)(4326008)(316002)(6512007)(71200400001)(8936002)(2616005)(33656002)(36756003)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 CxaTnbYfpVbm51RcHqcmw1mI2IAccLDCxi1Bco2A2DU8YvXuUMVfk3njg3vNFv5h334F3qAtkANJEi0LvjdsEfuV78UZfaPrmAWhCSimQ7Ou4PVqqnYlEyUSyRHtOH6FhaU6SDs1CmOPv/TTari9rPviRplNMwW2MWXv2frwad7WrLEfj4gyuKD4tzbRyaowJyisZerbKW3wy4/OwwTBycSU8EXEfUNKHn6xG2kGEfzHMTPCXfmpFE4bjoHL4fGqpX0V4mApZyf3VVzv9szX+8xnEqtcFghVCyNkneJz/JmfxkdYTNT8HkY9vN/c59gJl9q1+nOdXj/teEY38IOp1uPt0BM+jxoaCBm5Dv8Agx8nSqBfYDCiBa3cm4N+kocKgS86ifKQRXX08vi+B8AGrUZtbC2a9jO7Nuz9+th9jcIuIp/A5g4QWYvU6qV2B+EhRfk9W3P/8UkIKg3buECplbKrQa/qzutniHgISjCia8Q=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3497
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(46966005)(33430700001)(186003)(316002)(6506007)(82310400002)(33656002)(2616005)(356005)(2906002)(33440700001)(6512007)(8936002)(26005)(4326008)(966005)(478600001)(53546011)(36756003)(336012)(5660300002)(6486002)(70206006)(8676002)(81166007)(82740400003)(6916009)(86362001)(70586007)(47076004);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b7ec0b01-0851-48e7-b7f7-08d7f5b01a96
X-Forefront-PRVS: 04004D94E2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kPeCjn+4WG4X4Ju0Km0+Toptg6b37Hn7mcr7ki6JzbQ/4LT+kiqdldfGNtgXipwp04fG6ipU+PeyDgp66KdB1+v8o8B0HVligOQxymxZ5hJga4A9cO9gML4K4bmP3iyAYtNECRq9JN/uj9cGpMeHLfk5khrbz5R8qO/1aDI1OYgOIgt+lLkFswz82iiJAOwJoH4LU2uQkDTIjLRSjFVi/6fmliRXRBq9NYf5/hZ5+2ib/wQ65Bn3idDUnD4/zPjV6/kRFeGLJcmgE28I0tpOJVQyTc4AdjPKxFXm1XfRPCxQ79y417T2PsaPSt/WXJQz876vi6ICeu9fm2yqGyGQcLQoriltSGAjq3Ao2j0q/jnj6Q3zdCgwqteFXLMOea78AdmDqXxI1T74aFJ4oTVnXILjBuvmqx2ollLmWWPPp8k3e0AVRxLgmV2i/pYa6M02IqSKgQKiH5Do2qsKD+3cCc8Xv/k5I8TdWHeD422ynK3aROap/AVIAsUzWq7IWveFaQ/2MshFj8wRkOfkb6ZrPE4Q91TgG3cYFbjI3ZUALNFt0i1vJ5J95mrIAUL/hn8h2hKsFSNYROK2koHiJdO1H4MXI3I+hcXKIRQzHZKFzJbDhvR3hyP8IgD7v1yI/Ersz1RWcGEIhEe6Te2J5c8mqQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2020 13:35:08.1019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d134a9f8-d949-44bf-b20d-08d7f5b01f1e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2051
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0437BBA9BFABB14F800EA77FF3F9F19E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 11 May 2020, at 14:14, Diego Sueiro via lists.yoctoproject.org <diego=
.sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> The CONFIG_MD (Multiple Devices) and CONFIG_BLK_DEV_DM (Device Mapper)
> kernel configs are needed for LVM2, so add them in xen-host.cfg to be
> included in the kernel configuration for DOM0.
>=20
> Change-Id: Ib5f4f4d767751615ee1239e95da7a7d56cbbc2dc
> Issue-Id: SCM-996
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> .../linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg        |=
 3 +++
> 1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/f=
eatures/arm-autonomy/xen-host.cfg b/meta-arm-autonomy/recipes-kernel/linux/=
arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg
> index 2affab9..d457cb8 100644
> --- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features=
/arm-autonomy/xen-host.cfg
> +++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features=
/arm-autonomy/xen-host.cfg
> @@ -33,3 +33,6 @@ CONFIG_SWIOTLB_XEN=3Dy
> CONFIG_XEN_EFI=3Dy
> CONFIG_XEN_AUTO_XLATE=3Dy
>=20
> +# For LVM2 we need Multiple Devices and Device Mapper support
> +CONFIG_MD=3Dy
> +CONFIG_BLK_DEV_DM=3Dy
> --=20
> 2.7.4
>=20
>=20

