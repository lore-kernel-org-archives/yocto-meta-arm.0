Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CF4C433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 16:50:34 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.52])
 by mx.groups.io with SMTP id smtpd.web10.9802.1652806231259449045
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 May 2022 09:50:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=oP7SY12K;
 spf=pass (domain: arm.com, ip: 40.107.22.52, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dN7mA8DlOeKCkr6QfgtYx6PW3joH+1hgum1BqCnrwPjqAsCDQVvbS7s109pR/rzXOyEu5be82nu5aHmbnM1bGQYhXof6UO45eYfUoAwN2M6E1lXtKssiVD5X8KRbxo3cJGebCU8/CnzmGpTZNXrCcRj3Ize1J8r4WSbAp8KvNdONg2BhE8xdOYQTN0aJ/4fJNdC8gqkndLz82M8tv3MFISmpXG46F0eBbtcO5cKJhgItau1457rvLdCQOZGDcX9ISjVvrBlNqe0l0cdh/t/CSU55nsLrBfkRupAEXNmSfT3vSjY+0cow/lEBxArnCpEEwZljFI+MHeuT4gjUO/xzZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvoN8OS3qn28my+1UMY6LlG+kM9Mu4BucFk8z7lfWQk=;
 b=mZTYU30nuZ/qwW8vvYjXcl7jr+mFkq0OeKn+9q9mChpR3GLndkbvMwSzmYQ8QiMIMmTQBklS1kP7BbMCMsHoK0pmOSIbXgnVM26GcyWapktHAToc5kiOAxhlCZlGji6UPkEZI01KT1GyGvX23y5/nwog6hYEM2VNO4qrtDgyjDen5RNMlO7k1cp5v5m1kge38Vs4q91KUs6swlmacZpY2tOHh/Ci+Gw3tC5t/qvGvIMFPH1h2X7AHl1bi7GAs59Ek9U32695gWt5jEzO82VhNXC9Okz2G0g1QzALzRyrgJ1RMprDOkwIRbBkeuFg9L7DYexcbkEv7rySz/VCKo03UA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvoN8OS3qn28my+1UMY6LlG+kM9Mu4BucFk8z7lfWQk=;
 b=oP7SY12KwHHsqeMG6Y01VQCDC7QfgNpkq6STxO1BZ3rF5xq+Az/s1HxVV5xXnUno23tCxb+ghLL0vIPIcatftyRpCtvPKd0mZUAsN0TVK7kjtHlQ7Ogq4i1rxDbPzwyH/v2QnJjHg7Ile+tVFvSeYhKZHFrCYDFxH22caJ4lS7A=
Received: from AM5P194CA0008.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::18)
 by GV1PR08MB7803.eurprd08.prod.outlook.com (2603:10a6:150:5a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 16:50:27 +0000
Received: from VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::6d) by AM5P194CA0008.outlook.office365.com
 (2603:10a6:203:8f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Tue, 17 May 2022 16:50:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT026.mail.protection.outlook.com (10.152.18.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Tue, 17 May 2022 16:50:27 +0000
Received: ("Tessian outbound 3314dea8c23c:v119");
 Tue, 17 May 2022 16:50:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 99d892360281d749
X-CR-MTA-TID: 64aa7808
Received: from cb979208971c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AEA04E36-F1D5-455F-A160-B4BA31591084.1;
	Tue, 17 May 2022 16:50:19 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 cb979208971c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 17 May 2022 16:50:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O4CjLdEDW12bcYzreIBg5YktOy2jRMyTxq9FP0+tSkFlK5A0w2Ub5/hsOJ3wXeUj6/uT8PlZFh121qXBzTVFsRrmQ1/DdxAZaRhhV5PNFxajAQw0gEJan6LlOvHHKhsSQdAYb6q4Xhgzn6SasR+J0PUJYq/rRMT9dFVUIaqJHIO17s5ujjPUrtr/GCiUCJSgac5b+DLe62aQiCuy0xDagw7KyPxcZjzaMeLahCeEJ+m62B6Q8vV7EkwjbTK+LtnCdG6pt+81h6TYAerfa+ruXAFifLJ9Tmvvd7k5p89O26hd80jN70QMIh8764L9pOjwkxeS1FT3lC9KSXbaZZFQIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvoN8OS3qn28my+1UMY6LlG+kM9Mu4BucFk8z7lfWQk=;
 b=J4NB5gGWchWbLuVQfmR9dl9rdnzxv/nTd7jSAZP7cVuGFDvUaLOGZpVHZvos4EgOfnonYc5LSxStjipGPoshc2THzly5zutCb0sFA0SjjXbXAZFbRORKhxrYduZ3Fz9r5b7Gqj8+Ejw80ghYH1GHLsfMMwXYgzy1I2+naT7EpzRXVzvjXWbySDnZaQUE2qkLVs9oa1auRbLY2cWXIoSNdUkBrRwuhPQ180OEGa1bouPbwKpHLdMzce65Q+XuaSLgo1+qI/kc6dvCKy2zT4BqklJih5e0yxpZSH7jYbIN0RBpV1JjKccjvhDHMtgGrAl/P8jt3kgQLeXHAHE7nWB7ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvoN8OS3qn28my+1UMY6LlG+kM9Mu4BucFk8z7lfWQk=;
 b=oP7SY12KwHHsqeMG6Y01VQCDC7QfgNpkq6STxO1BZ3rF5xq+Az/s1HxVV5xXnUno23tCxb+ghLL0vIPIcatftyRpCtvPKd0mZUAsN0TVK7kjtHlQ7Ogq4i1rxDbPzwyH/v2QnJjHg7Ile+tVFvSeYhKZHFrCYDFxH22caJ4lS7A=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM6PR08MB4054.eurprd08.prod.outlook.com (2603:10a6:20b:a0::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Tue, 17 May
 2022 16:50:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d%8]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 16:50:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Sumit Garg <sumit.garg@linaro.org>, Jon Mason <jdmason@kudzu.us>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>, Denys Dmytriyenko <denis@denix.org>
Subject: Re: [meta-arm] [PATCH 1/3] arm-toolchain/external-arm-toolchain: set
 the version in the recipe
Thread-Topic: [meta-arm] [PATCH 1/3] arm-toolchain/external-arm-toolchain: set
 the version in the recipe
Thread-Index: AQHYagIo5U3lWfSFlkiQ5Uv7G+eQs60jPGGAgAAL4vA=
Date: Tue, 17 May 2022 16:50:17 +0000
Message-ID: 
 <PA4PR08MB741197DA81809A62A5CEB7AAE8CE9@PA4PR08MB7411.eurprd08.prod.outlook.com>
References: <20220517122818.3324458-1-ross.burton@arm.com>
 <165280103077.3622764.12744147075443410723.b4-ty@arm.com>
 <CAFA6WYOmbkbs4SUzKSMAtONPXxnKmPuP9KdrhomedkWRaoXZug@mail.gmail.com>
In-Reply-To: 
 <CAFA6WYOmbkbs4SUzKSMAtONPXxnKmPuP9KdrhomedkWRaoXZug@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ca751401-d973-4fe9-866a-08da38255840
x-ms-traffictypediagnostic: 
	AM6PR08MB4054:EE_|VE1EUR03FT026:EE_|GV1PR08MB7803:EE_
X-Microsoft-Antispam-PRVS: 
	<GV1PR08MB780316CB6C8D7CCC9FE5ECFDE8CE9@GV1PR08MB7803.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /qH6EdTs6N9nL1cj0sByoj+n6B9XrQP+Wx7awev7mwHSEJMWtIQeJ92BjBbz80654UirHhEDom62kntjMW10vrKBkcmgyfWtWziSKSAQB+fH+n9EL84zsXQEk89vYPOxbSlvMo629lj7+Zmg4MiLTkb+lBwPpHyItSDeZXDov5+PQ6i6BxDyWnlLZANzOn8kdzBBc4FcqwSruiF1R9+S3GIhlfjouj+/462x7slPz3fAbAtCpLkDCvTow5EzUjv+v+Bx2IcvO303AD1N0TV1hgTbrQwqeFZP3KbjRPBWG68r+X4+4Shvr06OahES0jjBa+B6nxwBAEiCNi5+rz/uiaxgETJeVuUK1kMwiZoiZJobAVOXPzHuHFw+Pkh8l7T64gGweLQPKzhCLw0d3icEDIi2tsNysrLrZlBMnHaNaLCdeP5ibCzYz31O1dYJ1DiU+Mz4q+i8Y1DRfeUS27q5RkFx0UKQ9OI56U1uUvHTDDC0ms6s1/Fl8MUqmBJ7HU2OQr/Fy/AFm8Z/WgfC2bgmZbbqemOLMAkPmGFzXdCDOHPWn6EsZheR6MIbW0R6BZm7v8qdT1Cxqdh1pBoZ7Q8swrCBN2wn3rBdKphbV9iAjt80IqIOyVr046u264Uf9/pBXEwbTk+liVlZfTQ0zZFA+22Fs7ZuVQL+14MuoY+Zohk7BQ8N2xf/3uSKxV/CqXGZIzDW74kRMCA98pQDyn5qCDT9xtgUYOEbmr0tqdXGcHPPxr1iT6d23IbZD0GM4QilYIo+Z/BUnK9I3el8mhPwuYfaFBiGEoA3kb85ZqFE8Eiw4dLIb5NC1n34a/bEzymoxYLT94f/eXa8PrW+emDt+A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(9686003)(966005)(38100700002)(110136005)(54906003)(122000001)(55016003)(86362001)(64756008)(186003)(66556008)(66476007)(83380400001)(53546011)(52536014)(26005)(8676002)(5660300002)(66946007)(66446008)(76116006)(91956017)(4326008)(8936002)(6506007)(71200400001)(38070700005)(166002)(2906002)(33656002)(508600001)(7696005);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_PA4PR08MB741197DA81809A62A5CEB7AAE8CE9PA4PR08MB7411eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4054
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5afe81fd-7427-4cda-cdfc-08da38255253
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SnuCxBcLk5eF8jCZ1QV1a/g8uHdQ9zGL7N/6EUbM3JW4a7uHK6fu2xMC0y2/lUCg2Kwmh99kE2bgSlYy+o3pOujWZbbEHVKiYvKw0l0xqx7JfI67pd8sxf1O/QDXjvNazrvP9sFq+3HPVtMQEmwutNvAu5PpFMlFwaE388JgzGCedmh66oaiL66xQYMhWojN0dQI9IycMzSzZhBS3kLPsLw8pNw804vb7yIrCOiAa0TghP+2ve8XZg7pLJ7BKKD5oDiC0lXbYUoPqnKPWAT1bS+UKfRbCCEBplVbVujwK1stZaT51TulhCYMjDMf+F/8J/WqWX8qyZrOA86K4V2Al8xebTgLv+RQR2ufz7PWrfSpfSUClTmW9xSqlbC2HmeON1x6TM6bzO1vPDjFbfWg8p7iTLSv2iafIHwIETnouPWuPa4tz8uOzpH95wEOMkUjNlxa8lZxbmlI20u8u1TkA+610ymewbyh4p/5Tw/cYNX9NKvfuCYbKj4VdFupaI1depi3UpSSSed9Yq9zJgIovyzVWcrcbnp8Jc8yfgzkRC+uVgZecFQ9nQKDEXtMsMNXH17i364uSovSUnVJTjqkEB+X75oLY0Lrfsg+YKS6M21R4SPF+WIvEzbGvmOFFMG/6pIyjsydwIVd7wQxAKqgRPvPOOJnOMpIDYJUC5CZLQ/UTZWfKUVyEejpqfZ0hHZuQ3PNkdSpxqVaThZLZyRIqcldviYH3jPowgRYsMw144tafA95HJRC3Qh5csMEgnhxbZeN/I0N1dXMaVHpVqb+jopeKiVJw7QsF24+764TgDs=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(81166007)(166002)(2906002)(9686003)(356005)(336012)(47076005)(186003)(82310400005)(316002)(54906003)(110136005)(36860700001)(83380400001)(7696005)(33656002)(966005)(40460700003)(508600001)(52536014)(5660300002)(70206006)(70586007)(4326008)(8676002)(8936002)(26005)(55016003)(6506007)(53546011)(107886003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 16:50:27.0523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ca751401-d973-4fe9-866a-08da38255840
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7803
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 May 2022 16:50:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3424

--_000_PA4PR08MB741197DA81809A62A5CEB7AAE8CE9PA4PR08MB7411eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

:facepalm:

Testing now, thanks.

Ross

From: Sumit Garg <sumit.garg@linaro.org>
Date: Tuesday, 17 May 2022 at 17:07
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>, Ross=
 Burton <Ross.Burton@arm.com>, nd <nd@arm.com>, Denys Dmytriyenko <denis@de=
nix.org>
Subject: Re: [meta-arm] [PATCH 1/3] arm-toolchain/external-arm-toolchain: s=
et the version in the recipe
+ Denys

Hi Jon,

On Tue, 17 May 2022 at 20:54, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Tue, 17 May 2022 13:28:16 +0100, Ross Burton wrote:
> > We need to support multiple versions of external-arm-toolchain, partly =
as
> > different versions have different layouts on disk, and partly because
> > 11.2 doesn't work on pre-Broadwell hardware.
> >
> > Rename this recipe so the version is in the filename, and dynamically
> > set PKGV instead of PV so PREFERRED_VERSION is easier to use.
>
> Applied, thanks!
>
> [1/3] arm-toolchain/external-arm-toolchain: set the version in the recipe
>       commit: ac83feb7cd16265d4e8ee0ed50dba903306867e5
> [2/3] arm-toolchain/external-arm-toolchain: add back 10.3
>       commit: 5fec85b41d7263dcc8aa15351beb7c19e2017849

Can you please revert these two patches? We don't need duplicates for
external-arm-toolchain recipe. The latest version supports both 11.2
and 10.3. So the only thing that's required is patch #3.

-Sumit

> [3/3] CI: use external-arm-toolchain 10.3
>       commit: 4c6ccb833c1ac379df3efa02136e03067d89ef3e
>
> Best regards,
> --
> Jon Mason <jon.mason@arm.com>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3420): https://lists.yoctoproject.org/g/meta-arm/mess=
age/3420
> Mute This Topic: https://lists.yoctoproject.org/mt/91162100/1777089
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.garg@=
linaro.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--_000_PA4PR08MB741197DA81809A62A5CEB7AAE8CE9PA4PR08MB7411eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">:facepalm:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Testing now, thanks.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Ross<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">Sumit Garg &lt;sumi=
t.garg@linaro.org&gt;<br>
<b>Date: </b>Tuesday, 17 May 2022 at 17:07<br>
<b>To: </b>Jon Mason &lt;jdmason@kudzu.us&gt;<br>
<b>Cc: </b>meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.=
org&gt;, Ross Burton &lt;Ross.Burton@arm.com&gt;, nd &lt;nd@arm.com&gt;, De=
nys Dmytriyenko &lt;denis@denix.org&gt;<br>
<b>Subject: </b>Re: [meta-arm] [PATCH 1/3] arm-toolchain/external-arm-toolc=
hain: set the version in the recipe<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">+ Denys<br>
<br>
Hi Jon,<br>
<br>
On Tue, 17 May 2022 at 20:54, Jon Mason &lt;jdmason@kudzu.us&gt; wrote:<br>
&gt;<br>
&gt; On Tue, 17 May 2022 13:28:16 +0100, Ross Burton wrote:<br>
&gt; &gt; We need to support multiple versions of external-arm-toolchain, p=
artly as<br>
&gt; &gt; different versions have different layouts on disk, and partly bec=
ause<br>
&gt; &gt; 11.2 doesn't work on pre-Broadwell hardware.<br>
&gt; &gt;<br>
&gt; &gt; Rename this recipe so the version is in the filename, and dynamic=
ally<br>
&gt; &gt; set PKGV instead of PV so PREFERRED_VERSION is easier to use.<br>
&gt;<br>
&gt; Applied, thanks!<br>
&gt;<br>
&gt; [1/3] arm-toolchain/external-arm-toolchain: set the version in the rec=
ipe<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; commit: ac83feb7cd16265d4e8ee0ed50=
dba903306867e5<br>
&gt; [2/3] arm-toolchain/external-arm-toolchain: add back 10.3<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; commit: 5fec85b41d7263dcc8aa15351b=
eb7c19e2017849<br>
<br>
Can you please revert these two patches? We don't need duplicates for<br>
external-arm-toolchain recipe. The latest version supports both 11.2<br>
and 10.3. So the only thing that's required is patch #3.<br>
<br>
-Sumit<br>
<br>
&gt; [3/3] CI: use external-arm-toolchain 10.3<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; commit: 4c6ccb833c1ac379df3efa0213=
6e03067d89ef3e<br>
&gt;<br>
&gt; Best regards,<br>
&gt; --<br>
&gt; Jon Mason &lt;jon.mason@arm.com&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#3420): <a href=3D"https://lists.yoctoproject.org/g=
/meta-arm/message/3420">
https://lists.yoctoproject.org/g/meta-arm/message/3420</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/91162100=
/1777089">https://lists.yoctoproject.org/mt/91162100/1777089</a><br>
&gt; Group Owner: meta-arm+owner@lists.yoctoproject.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arm/unsu=
b">https://lists.yoctoproject.org/g/meta-arm/unsub</a> [sumit.garg@linaro.o=
rg]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<o:p></o:p></span></p>
</div>
</div>
</body>
</html>

--_000_PA4PR08MB741197DA81809A62A5CEB7AAE8CE9PA4PR08MB7411eurp_--

