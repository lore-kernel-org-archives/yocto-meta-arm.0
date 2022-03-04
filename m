Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B08B0C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 11:35:59 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.86])
 by mx.groups.io with SMTP id smtpd.web10.5874.1646393757692693384
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Mar 2022 03:35:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=DWJYvsXy;
 spf=pass (domain: arm.com, ip: 40.107.22.86,
 mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LZyvUn35oCLDNJVJshAkb2MtFia/MGIvcpAL2WWeTs=;
 b=DWJYvsXyW4SPmGUwycV0pD4/rUDY0XC3lFGfeuWQcCG50Tz48SAvRQ0DjQsLcyp9kIE9pqvTsZMScgBxIU70zaaX1w+12rXZoLONBo35NxGUzCarGzVBpuRIm4rIC3ESMO4SgTr0akQQk9wmZAnhj2g/UOnK9YgS19MljXtNgnk=
Received: from AM6PR05CA0006.eurprd05.prod.outlook.com (2603:10a6:20b:2e::19)
 by PA4PR08MB5887.eurprd08.prod.outlook.com (2603:10a6:102:f2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Fri, 4 Mar
 2022 11:35:49 +0000
Received: from VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::2b) by AM6PR05CA0006.outlook.office365.com
 (2603:10a6:20b:2e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13 via Frontend
 Transport; Fri, 4 Mar 2022 11:35:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT021.mail.protection.outlook.com (10.152.18.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Fri, 4 Mar 2022 11:35:48 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Fri, 04 Mar 2022 11:35:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 32772f242573f449
X-CR-MTA-TID: 64aa7808
Received: from 2264be4cb2d8.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1D6A4FB9-4863-4B95-952E-BF7244D2D81B.1;
	Fri, 04 Mar 2022 11:35:41 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 2264be4cb2d8.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 04 Mar 2022 11:35:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUkt0zHEgED2hWFN1L6TeTjzSicykoOD0mjILOMrqJUwBdEhTtIT0uq5oc4LgBiEvJU2fBMrOMBoTK2to/Ax7I5L151HiUcDmdquCVyIUnGvdYMHLUtRlNioRSk7N6pP2SizTrpp61Fe+WViS1eHzCngcCkG4PjEXrNv+kI4dKlELWiyz2FlX69mKMJAXL9nfRJ2bGIEi7aj5rmFLO2EYNK5IsmjSre6zNCJyiQNvlAdyLh/j1cZOvijli3W+hxVmpbwEmq/JMhiE7OiS5LM9DxXjqMc4HQ3ts+QtUuM1h4Ja8CKXeGE+Lg+ej6DEhKtu7AmlVxoZ5RgyUaD1cEvvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LZyvUn35oCLDNJVJshAkb2MtFia/MGIvcpAL2WWeTs=;
 b=e4WhRIbVUI7JxTixc2ksYSBmFKG2L8A23/1E38r5dM/I5va4cCqGcWfoDDqA6pyj8WVHEqWSb4nmjh1DEmD9hwTbNHUJbxEnDoQzgXxBsYj1HlsD6kpo2xGr8cA9IursPARQILk6XYOsOqdppKgtP40QLjrIJj5koLK5S17+CcLwatxhXxwNX4dCDhHv121B9scpyVveX0C4vdSAj0/eqyDjIf5jAAmjWRgf5YFP6hinoKPk3ul1pohNlXE7gI7RGoWSvu4vE7L1DAuNG73MKvzTGc1aHF2VLvwayhNBg6Awv32uSHHF2ijyjzR06B0KeoBLEucSykmsT2CVhtBk/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LZyvUn35oCLDNJVJshAkb2MtFia/MGIvcpAL2WWeTs=;
 b=DWJYvsXyW4SPmGUwycV0pD4/rUDY0XC3lFGfeuWQcCG50Tz48SAvRQ0DjQsLcyp9kIE9pqvTsZMScgBxIU70zaaX1w+12rXZoLONBo35NxGUzCarGzVBpuRIm4rIC3ESMO4SgTr0akQQk9wmZAnhj2g/UOnK9YgS19MljXtNgnk=
Received: from AM5PR0801MB1716.eurprd08.prod.outlook.com
 (2603:10a6:203:39::18) by PA4PR08MB7387.eurprd08.prod.outlook.com
 (2603:10a6:102:2a2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Fri, 4 Mar
 2022 11:35:39 +0000
Received: from AM5PR0801MB1716.eurprd08.prod.outlook.com
 ([fe80::a43f:bc38:e76e:2b34]) by AM5PR0801MB1716.eurprd08.prod.outlook.com
 ([fe80::a43f:bc38:e76e:2b34%12]) with mapi id 15.20.5038.016; Fri, 4 Mar 2022
 11:35:39 +0000
From: Abdellatif El Khlifi <Abdellatif.ElKhlifi@arm.com>
To: Tim Orling <ticotimo@gmail.com>, Alejandro Hernandez Samaniego
	<alhe@linux.microsoft.com>
CC: Denys Dmytriyenko <denis@denix.org>, Drew Reed <Drew.Reed@arm.com>, Jon
 Mason <jdmason@kudzu.us>, Maxim Uvarov <maxim.uvarov@linaro.org>, Peter
 Griffin <peter.griffin@linaro.org>, Sumit Garg <sumit.garg@linaro.org>,
	Vishnu Banavath <Vishnu.Banavath@arm.com>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>, Ross Burton <Ross.Burton@arm.com>
Subject: Re: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16
Thread-Topic: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16
Thread-Index: 
 AQHYLkR2cO31jWkCZkuCqK1e0SZv1qytIzOAgABXUG2AAK9yAIAAKOSAgAA9G4CAAAuygIAAf1fu
Date: Fri, 4 Mar 2022 11:35:39 +0000
Message-ID: 
 <AM5PR0801MB1716D50B772242967A3A3DD5FD059@AM5PR0801MB1716.eurprd08.prod.outlook.com>
References: <20220226030441.2301940-1-alhe@linux.microsoft.com>
 <Yh5JYWMmAd6SnmOS@kudzu.us>
 <73a2bdd2-c8d1-9d96-df50-044d76bd4ff7@linux.microsoft.com>
 <Yh+DX8uaoS1VPpQ8@kudzu.us>
 <CAFA6WYMC1m18G_PaN07KTuavD3=8RYS4RoTUxGSiOsyePfZH1g@mail.gmail.com>
 <AM5PR0801MB17164CCA6910A06008AF914AFD049@AM5PR0801MB1716.eurprd08.prod.outlook.com>
 <5d1418bf-6879-237d-7bc7-e7a1ff0024b0@linux.microsoft.com>
 <20220303233749.GP1766@denix.org>
 <07bd54fb-e4b4-6c95-5c8e-78074a3cc92e@linux.microsoft.com>
 <CANx9H-B4N8_a6Vz3zn=zPw5Yc=QWvG0rhfLGL7iwa6fQYgS0Gw@mail.gmail.com>
In-Reply-To: 
 <CANx9H-B4N8_a6Vz3zn=zPw5Yc=QWvG0rhfLGL7iwa6fQYgS0Gw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: d1a4b8c1-e55e-d114-14e7-67ff3531e8be
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7b474c70-40e6-461d-7934-08d9fdd32103
x-ms-traffictypediagnostic: 
	PA4PR08MB7387:EE_|VE1EUR03FT021:EE_|PA4PR08MB5887:EE_
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB58874CD91F23B41C8722C808FD059@PA4PR08MB5887.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 fA0IbqnFCV7qSrv7YBOEdBTCfTWK4/XPFwON/GoZMMqz/8yMfIVC/3AEtUbEID6F8OfL0CL6+f+97XJxaPV9CMhe/ycdoUxBlpoiJeDBzS8Hcd8Q19sZVBa8G+XqqQDg320neVHc/WmMJ7HW9IIphoGIT9a0cwktr/JV8/Wsnc4GV4j7lkAaBifbVpHDdHd0gWXsSOlknJOdiq3+AyOU0LwMbORUI4q4p77xbq/rXsc+eFXnW/W4UiBAxXkCEeLPWPsdfB+GRi5ogBtWUfoHM59wpgXSnEXUKyv6BuInUL+yk6nIKiEuBWc1hlZsr0dbizIIGBDHewgLZeVck3LxBBIzHxPRbq5hd79tSOyfi8etx7SOhZupWhW6Xs9E7p5WX6Pq8Ziee2gAJT4izxErpkzLRd41KXODdu014ZnL0q4NJT58DT5igyGdgU0LenIr9n6jvxK7yRaJn2Rvk8+a7f8B6uf3XA9ooZ4/OEHQZ+GoFORiPI4oz/buDAEncLR5jcMaVYHGxn7ym+pwgmN3S7IwRebs32vc/i4VqVDHCryhCx9MWOCBqiiTtQnLy7rnCa/AkwXmwh0X7CzitE7zgLizJ0GwLX8ttBy1g/kx0oZ9AluzUt1SPDZuBRJKOP9vLUyVmNERAuhXz9Iet+oXcLOCv4rI1tUe0wSiYF2e0R82TZ9abpKyqe+HszCX0lfweBYf2XAZyVEPdLKTum8TFmcd3+xLMuAYiyBaY/+ee9qV637euaiqJmhIGmjCtrL69+FukJc/XPMl9fMfBQENZWbDkuTeFR7OOEmOAOgQvdCRTiOGmZJobHltXP8bkK4uZF0kRPJkUNJfSHo7OmmVWg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB1716.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(66556008)(64756008)(8676002)(66476007)(66946007)(7696005)(91956017)(83380400001)(110136005)(53546011)(76116006)(6506007)(5660300002)(26005)(2906002)(186003)(9686003)(19627405001)(86362001)(54906003)(66446008)(33656002)(8936002)(52536014)(38070700005)(316002)(966005)(166002)(508600001)(38100700002)(122000001)(55016003)(71200400001);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AM5PR0801MB1716D50B772242967A3A3DD5FD059AM5PR0801MB1716_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7387
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	99e04708-942f-4dc3-4edb-08d9fdd31bd7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	++zE+lLhGbs++cs81O+hwUSRM1bssz4WKUJ7NR4GMB6N5VxsV5kes0OxmyJ3vfXXkLFJuLPjUtuGPpD/Oqra8Qt8XQezU1jjuK401SdRu5ZGx8EzqLt9NgDNJ9SA9pNzVPL4GvyJl9XfyfrMvG6/YUxhBjSyi2VBREJK/XLrAXAUCVPD35bDe0SieWYckk+sTkG+oM0oNWcmHaBx/GT7cHtJioH+MteRnmWCrp8kLqMppaH/UQmCkZkJDwBK1hI+5rG6DUyFfCOWSy8hi7tgE/TxHfQmBnAwIHiqu0BI7bewBmr756ENKHdYpn1cPoVKr/7NUoFcq8pvc8Fu8YmXcE9EFZDaGZcG+LZVeSXHdQH5BdlfQ9Ui4JeUZu9r2NADqnUWBQ32Pkv0iwOngmTyDKEyiQKi/SPvhMno9v7C0Ip+u4UQ6dpMnvZiNIRb7VPTqkbvQb3RT0cOFFUJrocazZgDyAMVUNIvM7BrL1Hn+7HkbNqWqhsp81g5O3C2R1VHHq6hsFDjO4CI1xra86bZwEMhZxzTfyqGqYQLOQWvMNQfzfSM/9a0HtQpCVhvSV5QujKPo0BDYe38AjaaMk96V81uElDeXGoyk5se3uX/jWIV5EczSW0aW89LfVHJh4wJWj1Nhpapq3Fis8GU0syITE9THTLciwv4GyUNraE/ygIzXHfKtvcHCP+1h3gpTPJMLejpZ0ExTP3iK5DjVpZjjuoHwxTRjh409iaXvMRdSF4V1UJEOiHyB3bXRJmr4A11JdouaR9uC19hN7I0PuOyuR0kZTsKIX8+Efb5S6cib7I=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(47076005)(70206006)(966005)(508600001)(82310400004)(70586007)(4326008)(54906003)(110136005)(316002)(86362001)(40460700003)(336012)(26005)(186003)(36860700001)(8676002)(83380400001)(7696005)(6506007)(53546011)(81166007)(356005)(9686003)(166002)(5660300002)(2906002)(30864003)(19627405001)(52536014)(33656002)(8936002)(55016003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 11:35:48.2032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7b474c70-40e6-461d-7934-08d9fdd32103
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5887
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Mar 2022 11:35:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3112

--_000_AM5PR0801MB1716D50B772242967A3A3DD5FD059AM5PR0801MB1716_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi guys,

Thanks for the feedback.

Since the machine is in meta-arm (meta-arm/conf/machine/qemuarm64-secureboo=
t.conf), it makes sense to add the meta-python layer dependency as detailed=
 below.

It works, meta-python  and python3-cryptography are detected. Please have a=
 look at the logs below.

So, technically it works. But let's see what Jon and Ross think.

Suggested changes:

In ci/qemuarm64-secureboot.yml add:

    - ci/meta-openembedded.yml

In meta-arm/conf/layer.conf add:

LAYERDEPENDS_meta-arm-bsp:append:qemuarm64-secureboot =3D " meta-python ope=
nembedded-layer"

Before the changes:

bitbake-layers show-layers

NOTE: Starting bitbake server...
layer                 path                                      priority
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
meta-arm              /home/abdelk01/Work/qemu/meta-arm/meta-arm  5
meta-arm-bsp          /home/abdelk01/Work/qemu/meta-arm/meta-arm-bsp  5
meta-arm-toolchain    /home/abdelk01/Work/qemu/meta-arm/meta-arm-toolchain =
 5
meta                  /home/abdelk01/Work/qemu/poky/meta        5
meta-poky             /home/abdelk01/Work/qemu/poky/meta-poky   5


After the changes:

bitbake-layers show-layers

NOTE: Starting bitbake server...
layer                 path                                      priority
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
meta-arm              /home/abdelk01/Work/qemu/meta-arm/meta-arm  5
meta-arm-bsp          /home/abdelk01/Work/qemu/meta-arm/meta-arm-bsp  5
meta-arm-toolchain    /home/abdelk01/Work/qemu/meta-arm/meta-arm-toolchain =
 5
meta-filesystems      /home/abdelk01/Work/qemu/meta-openembedded/meta-files=
ystems  5
meta-networking       /home/abdelk01/Work/qemu/meta-openembedded/meta-netwo=
rking  5
meta-oe               /home/abdelk01/Work/qemu/meta-openembedded/meta-oe  5
meta-python           /home/abdelk01/Work/qemu/meta-openembedded/meta-pytho=
n  5
meta                  /home/abdelk01/Work/qemu/poky/meta        5
meta-poky             /home/abdelk01/Work/qemu/poky/meta-poky   5

bitbake-layers show-recipes | grep -A 1 python3-cryptography

python3-cryptography:
  meta-python          36.0.1
python3-cryptography-vectors:
  meta-python          36.0.1

Kind regards
________________________________
From: Tim Orling <ticotimo@gmail.com>
Sent: 04 March 2022 03:58
To: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
Cc: Abdellatif El Khlifi <Abdellatif.ElKhlifi@arm.com>; Denys Dmytriyenko <=
denis@denix.org>; Drew Reed <Drew.Reed@arm.com>; Jon Mason <jdmason@kudzu.u=
s>; Maxim Uvarov <maxim.uvarov@linaro.org>; Peter Griffin <peter.griffin@li=
naro.org>; Sumit Garg <sumit.garg@linaro.org>; Vishnu Banavath <Vishnu.Bana=
vath@arm.com>; meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject=
.org>
Subject: Re: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16



On Thu, Mar 3, 2022 at 7:16 PM Alejandro Hernandez Samaniego <alhe@linux.mi=
crosoft.com<mailto:alhe@linux.microsoft.com>> wrote:


On 3/3/22 23:37, Denys Dmytriyenko wrote:

On Thu, Mar 03, 2022 at 09:11:28PM +0000, Alejandro Hernandez Samaniego wro=
te:


On 3/3/22 10:55, Abdellatif El Khlifi wrote:


Hello,

I suggest the following:

In meta-arm-bsp/conf/layer.conf add :

LAYERDEPENDS_meta-arm-bsp:append:qemuarm64-secureboot =3D "
meta-python openembedded-layer"



This statement is a little confusing (to me), please correct me if
I'm wrong, but you're saying

we should set a dependency from meta-arm-bsp layer, only for
qemuarm64-secureboot,

however, the qemuarm64-secureboot is part of meta-arm and not meta-arm-bsp,

AFAIC meta-arm-bsp has now knowledge of its existence, in fact
there's no other mention of

qemuarm64-secureboot in meta-arm-bsp.


Moreover, optee is used by other BSP layers (e.g. meta-ti) by depending on
meta-arm, not meta-arm-bsp.

Depending on python3-cryptography which is only available in meta-python (p=
art
of meta-openembedded) should be avoided. Back in the day we pushed for movi=
ng
other python3 dependencies like pycryptodome and pyelftools into OE-Core:

https://git.openembedded.org/meta-openembedded/commit/?id=3Da8f3c00d8d113b4=
6a49584682e10435157d516ca
https://git.yoctoproject.org/meta-arm/commit/?id=3Df2069723f27d9229e8ec7426=
3a41160c8df32571

We could try doing the same with this new python3-cryptography dependecy an=
d
propose moving it to OE-Core. Alternatively, consider adding it to meta-arm=
?
Not ideal, but meta-arm-bsp briefly carried alternative/older version recen=
tly:

https://git.yoctoproject.org/meta-arm/commit/?id=3Da15c16068ab011e2ba91a6c4=
ca6e1251de0d8058

I agree with Denys's point here, I think its likely there's other cases jus=
t like
meta-ti, and we would be forcing a meta-oe and meta-python dependency on th=
em, IMO
it would make sense to add a copy of python3-cryptography to meta-arm (espe=
cially since
there's been similar situations in the past) and in parallel try to make a =
case for
python3-cryptography to be moved from meta-python to OE-core.

Once (and if) we're successful we can delete the python3-cyrptography copy =
from meta-arm.


I have suggested moving python3-cryptography (also python3-cryptography-vec=
tors) to oe-core previously. It is heavily used for cryptography and needs =
to be kept up to date which is much more likely in oe-core.

This also means python3-pyo3, pyo3.bbclass, python3-setuptools-rust-native =
and the setuptools_rust.bbclass would also move to oe-core.

And then some tests. And documentation.



Alejandro


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#3107): https://lists.yoctoproject.org/g/meta-arm/messag=
e/3107
Mute This Topic: https://lists.yoctoproject.org/mt/89404067/924729
Group Owner: meta-arm+owner@lists.yoctoproject.org<mailto:meta-arm%2Bowner@=
lists.yoctoproject.org>
Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ticotimo@gmai=
l.com<mailto:ticotimo@gmail.com>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


--_000_AM5PR0801MB1716D50B772242967A3A3DD5FD059AM5PR0801MB1716_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi guys,
<div><br>
</div>
<div>Thanks for the feedback.</div>
<div><br>
</div>
<div>Since the machine is in meta-arm (meta-arm/conf/machine/qemuarm64-secu=
reboot.conf), it makes sense to add the meta-python layer dependency as det=
ailed below.</div>
<div><br>
</div>
<div>It works, meta-python &nbsp;and python3-cryptography are detected. Ple=
ase have a look at the logs below.</div>
<div><br>
</div>
<div>So, technically it works. But let's see what Jon and Ross think.</div>
<div><br>
</div>
<div>Suggested changes:</div>
<div><br>
</div>
<div>In ci/qemuarm64-secureboot.yml add:</div>
<div><br>
</div>
<div>&nbsp; &nbsp; - ci/meta-openembedded.yml</div>
<div><br>
</div>
<div>In meta-arm/conf/layer.conf add:</div>
<div><br>
</div>
<div>LAYERDEPENDS_meta-arm-bsp:append:qemuarm64-secureboot =3D &quot; meta-=
python openembedded-layer&quot;</div>
<div><br>
</div>
<div>Before the changes:</div>
<div><br>
</div>
<div>bitbake-layers show-layers</div>
<div><br>
</div>
<div>NOTE: Starting bitbake server...</div>
<div>layer &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; path &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;priority</div>
<div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D</div>
<div>meta-arm &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/home/abdelk0=
1/Work/qemu/meta-arm/meta-arm &nbsp;5</div>
<div>meta-arm-bsp &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/home/abdelk01/Work/qem=
u/meta-arm/meta-arm-bsp &nbsp;5</div>
<div>meta-arm-toolchain &nbsp; &nbsp;/home/abdelk01/Work/qemu/meta-arm/meta=
-arm-toolchain &nbsp;5</div>
<div>meta &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/ho=
me/abdelk01/Work/qemu/poky/meta &nbsp; &nbsp; &nbsp; &nbsp;5</div>
<div>meta-poky &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /home/abdelk01/Wor=
k/qemu/poky/meta-poky &nbsp; 5</div>
<div><br>
</div>
<div><br>
</div>
<div>After the changes:</div>
<div><br>
</div>
<div>bitbake-layers show-layers</div>
<div><br>
</div>
<div>NOTE: Starting bitbake server...</div>
<div>layer &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; path &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;priority</div>
<div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D</div>
<div>meta-arm &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/home/abdelk0=
1/Work/qemu/meta-arm/meta-arm &nbsp;5</div>
<div>meta-arm-bsp &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/home/abdelk01/Work/qem=
u/meta-arm/meta-arm-bsp &nbsp;5</div>
<div>meta-arm-toolchain &nbsp; &nbsp;/home/abdelk01/Work/qemu/meta-arm/meta=
-arm-toolchain &nbsp;5</div>
<div>meta-filesystems &nbsp; &nbsp; &nbsp;/home/abdelk01/Work/qemu/meta-ope=
nembedded/meta-filesystems &nbsp;5</div>
<div>meta-networking &nbsp; &nbsp; &nbsp; /home/abdelk01/Work/qemu/meta-ope=
nembedded/meta-networking &nbsp;5</div>
<div>meta-oe &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /home/abdelk0=
1/Work/qemu/meta-openembedded/meta-oe &nbsp;5</div>
<div>meta-python &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /home/abdelk01/Work/qem=
u/meta-openembedded/meta-python &nbsp;5</div>
<div>meta &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/ho=
me/abdelk01/Work/qemu/poky/meta &nbsp; &nbsp; &nbsp; &nbsp;5</div>
<div>meta-poky &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /home/abdelk01/Wor=
k/qemu/poky/meta-poky &nbsp; 5</div>
<div><br>
</div>
<div>bitbake-layers show-recipes | grep -A 1 python3-cryptography</div>
<div><br>
</div>
<div>python3-cryptography:</div>
<div>&nbsp; meta-python &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;36.0.1</div>
<div>python3-cryptography-vectors:</div>
<div>&nbsp; meta-python &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;36.0.1</div>
<span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Kind regards<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Tim Orling &lt;ticoti=
mo@gmail.com&gt;<br>
<b>Sent:</b> 04 March 2022 03:58<br>
<b>To:</b> Alejandro Hernandez Samaniego &lt;alhe@linux.microsoft.com&gt;<b=
r>
<b>Cc:</b> Abdellatif El Khlifi &lt;Abdellatif.ElKhlifi@arm.com&gt;; Denys =
Dmytriyenko &lt;denis@denix.org&gt;; Drew Reed &lt;Drew.Reed@arm.com&gt;; J=
on Mason &lt;jdmason@kudzu.us&gt;; Maxim Uvarov &lt;maxim.uvarov@linaro.org=
&gt;; Peter Griffin &lt;peter.griffin@linaro.org&gt;; Sumit Garg &lt;sumit.=
garg@linaro.org&gt;;
 Vishnu Banavath &lt;Vishnu.Banavath@arm.com&gt;; meta-arm@lists.yoctoproje=
ct.org &lt;meta-arm@lists.yoctoproject.org&gt;<br>
<b>Subject:</b> Re: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16=
</font>
<div>&nbsp;</div>
</div>
<div>
<div><br>
</div>
<div><br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Thu, Mar 3, 2022 at 7:16 PM Alej=
andro Hernandez Samaniego &lt;<a href=3D"mailto:alhe@linux.microsoft.com">a=
lhe@linux.microsoft.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left-width:1px; border-left-style:solid; padding-left:1ex; border-left-c=
olor:rgb(204,204,204)">
<div></div>
<div>
<p><br>
</p>
<div>On 3/3/22 23:37, Denys Dmytriyenko wrote:<br>
</div>
<blockquote type=3D"cite">
<pre style=3D"font-family:monospace">On Thu, Mar 03, 2022 at 09:11:28PM +00=
00, Alejandro Hernandez Samaniego wrote:
</pre>
<blockquote type=3D"cite">
<pre style=3D"font-family:monospace">On 3/3/22 10:55, Abdellatif El Khlifi =
wrote:
</pre>
<blockquote type=3D"cite">
<pre style=3D"font-family:monospace">Hello,

I suggest the following:

In meta-arm-bsp/conf/layer.conf add :

LAYERDEPENDS_meta-arm-bsp:append:qemuarm64-secureboot =3D &quot;
meta-python openembedded-layer&quot;
</pre>
</blockquote>
<pre style=3D"font-family:monospace">
This statement is a little confusing (to me), please correct me if
I'm wrong, but you're saying

we should set a dependency from meta-arm-bsp layer, only for
qemuarm64-secureboot,

however, the qemuarm64-secureboot is part of meta-arm and not meta-arm-bsp,

AFAIC meta-arm-bsp has now knowledge of its existence, in fact
there's no other mention of

qemuarm64-secureboot in meta-arm-bsp.
</pre>
</blockquote>
<pre style=3D"font-family:monospace">Moreover, optee is used by other BSP l=
ayers (e.g. meta-ti) by depending on=20
meta-arm, not meta-arm-bsp.

Depending on python3-cryptography which is only available in meta-python (p=
art=20
of meta-openembedded) should be avoided. Back in the day we pushed for movi=
ng=20
other python3 dependencies like pycryptodome and pyelftools into OE-Core:

<a href=3D"https://git.openembedded.org/meta-openembedded/commit/?id=3Da8f3=
c00d8d113b46a49584682e10435157d516ca" target=3D"_blank" style=3D"font-famil=
y:monospace">https://git.openembedded.org/meta-openembedded/commit/?id=3Da8=
f3c00d8d113b46a49584682e10435157d516ca</a>
<a href=3D"https://git.yoctoproject.org/meta-arm/commit/?id=3Df2069723f27d9=
229e8ec74263a41160c8df32571" target=3D"_blank" style=3D"font-family:monospa=
ce">https://git.yoctoproject.org/meta-arm/commit/?id=3Df2069723f27d9229e8ec=
74263a41160c8df32571</a>

We could try doing the same with this new python3-cryptography dependecy an=
d=20
propose moving it to OE-Core. Alternatively, consider adding it to meta-arm=
?=20
Not ideal, but meta-arm-bsp briefly carried alternative/older version recen=
tly:

<a href=3D"https://git.yoctoproject.org/meta-arm/commit/?id=3Da15c16068ab01=
1e2ba91a6c4ca6e1251de0d8058" target=3D"_blank" style=3D"font-family:monospa=
ce">https://git.yoctoproject.org/meta-arm/commit/?id=3Da15c16068ab011e2ba91=
a6c4ca6e1251de0d8058</a></pre>
</blockquote>
</div>
<div>
<pre style=3D"font-family:monospace">I agree with Denys's point here, I thi=
nk its likely there's other cases just like
meta-ti, and we would be forcing a meta-oe and meta-python dependency on th=
em, IMO
it would make sense to add a copy of python3-cryptography to meta-arm (espe=
cially since
there's been similar situations in the past) and in parallel try to make a =
case for
python3-cryptography to be moved from meta-python to OE-core.

Once (and if) we're successful we can delete the python3-cyrptography copy =
from meta-arm.
</pre>
</div>
</blockquote>
<div dir=3D"auto">I have suggested moving python3-cryptography (also python=
3-cryptography-vectors) to oe-core previously. It is heavily used for crypt=
ography and needs to be kept up to date which is much more likely in oe-cor=
e.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">This also means python3-pyo3, pyo3.bbclass, python3-setup=
tools-rust-native and the setuptools_rust.bbclass would also move to oe-cor=
e.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">And then some tests. And documentation.</div>
<div dir=3D"auto"><br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left-width:1px; border-left-style:solid; padding-left:1ex; border-left-c=
olor:rgb(204,204,204)">
<div>
<pre dir=3D"auto" style=3D"font-family:monospace">
Alejandro
</pre>
<p></p>
<blockquote type=3D"cite">
<pre style=3D"font-family:monospace"></pre>
</blockquote>
</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#3107): <a href=3D"https://lists.yoctoproject.org/g/meta=
-arm/message/3107" rel=3D"noreferrer" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-arm/message/3107</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/89404067/9247=
29" rel=3D"noreferrer" target=3D"_blank">
https://lists.yoctoproject.org/mt/89404067/924729</a><br>
Group Owner: <a href=3D"mailto:meta-arm%2Bowner@lists.yoctoproject.org" tar=
get=3D"_blank">
meta-arm+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arm/unsub" re=
l=3D"noreferrer" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-arm/unsub</a> [<a href=3D"mailto:tico=
timo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote>
</div>
</div>
</div>
</body>
</html>

--_000_AM5PR0801MB1716D50B772242967A3A3DD5FD059AM5PR0801MB1716_--

