Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.41])
 by mx.groups.io with SMTP id smtpd.web12.4621.1587456632844139365
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Apr 2020 01:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=XFKJDXtY;
 spf=pass (domain: arm.com, ip: 40.107.8.41, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMOQ4PI39JZ2qoMTdqeGKanDYbYw4JHI61GMm6Srb9E=;
 b=XFKJDXtYdN0Gy4GAzgo1ipH9YcBwFVFBGD1nIKmfI4poQSrViuEaiLburnC50l1ActapUBq3nTFv+ZMQ2YpnrDHoux2FIrNb9LxmuynQbCdCmJR1Ee5O2kQsPK9/j0oCA/oFLweY0lSF5b9nGDEPCV+iyVEtmhUeYChKvCe18xI=
Received: from DB6PR07CA0193.eurprd07.prod.outlook.com (2603:10a6:6:42::23) by
 HE1PR0801MB2011.eurprd08.prod.outlook.com (2603:10a6:3:49::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.29; Tue, 21 Apr 2020 08:10:30 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::ad) by DB6PR07CA0193.outlook.office365.com
 (2603:10a6:6:42::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.6 via Frontend
 Transport; Tue, 21 Apr 2020 08:10:30 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.18 via Frontend Transport; Tue, 21 Apr 2020 08:10:30 +0000
Received: ("Tessian outbound 76e9a4cf1540:v53"); Tue, 21 Apr 2020 08:10:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 30f9c114b61832a6
X-CR-MTA-TID: 64aa7808
Received: from 7e02d0494894.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7E9E4E28-E8F8-4D70-8A93-FA30140BF768.1;
	Tue, 21 Apr 2020 08:10:24 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7e02d0494894.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 21 Apr 2020 08:10:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1zbK50m/2xl0hg5kdT8iRIzQHlfewgTkMG2Z7PnP6ma+7sS0ScmEDNlG8m7i7tMX6BvSL3xIF+2Se76nCzuoNoZeBvyapbMvi0yVrMLjQyUwEYgldU7B3IIDRSKrIoWrv+srhf+9d1ZLvBBcyfnUosnYvM3cMySoDu3odqS8cDCCoyf0V0Ou8tcl9u4DFS9P4JIGzWSiPxgB7lKU04C77OhzY5SKZKrVTkLBWSmRch3XwSkxpCIJKSrSYglq/iG5uZQiR/uaa7JTKysRGogeRfyEXYa7k66Y1Vmisv6SKLq8EyUQHu77tugZD+UwfBTx85bxKpgF5ppB5fZLpGaDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMOQ4PI39JZ2qoMTdqeGKanDYbYw4JHI61GMm6Srb9E=;
 b=L0BhuZyp1zMTie/DRUN7Boi0nqqvG3E5HwN6b1dhDvMmQw28NLPznl/n8eQl7yeo0CE4s41bfl2TVqzshMTox6bT/BWOxroziNg0OMFmsshUXLm2lE1B7N2J62eq+sR61/8C+uJCxe8if6NXuxGVHNuIWQOwA6otPdrSVHqVAmtVI7M7BYvBRtx5BICaMLSxgTCyiLh2bQ5X95zJl6lCBqM3K/o6ekLIqwG8Hbw5tUSKUEvO+5wnYSGkiLwPBN9XMyXua9dvcnbA0tOzl+1GQp8OmYQT/xWEGIryxHU5mrMWb5h7TrV+K7D/kaUxt+Y4n1OoK1GgSpGekMpglnm2ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMOQ4PI39JZ2qoMTdqeGKanDYbYw4JHI61GMm6Srb9E=;
 b=XFKJDXtYdN0Gy4GAzgo1ipH9YcBwFVFBGD1nIKmfI4poQSrViuEaiLburnC50l1ActapUBq3nTFv+ZMQ2YpnrDHoux2FIrNb9LxmuynQbCdCmJR1Ee5O2kQsPK9/j0oCA/oFLweY0lSF5b9nGDEPCV+iyVEtmhUeYChKvCe18xI=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3578.eurprd08.prod.outlook.com (2603:10a6:10:50::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 08:10:22 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2921.027; Tue, 21 Apr 2020
 08:10:21 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>, Diego Sueiro <Diego.Sueiro@arm.com>
Subject: Re: [meta-arm] [PATCH 0/5] tf-a recipe improvements and new recipes for SCP and firmware image for Juno
Thread-Topic: [meta-arm] [PATCH 0/5] tf-a recipe improvements and new recipes
 for SCP and firmware image for Juno
Thread-Index: AQHWF69Fly3F7gRpsUGu/hkm9mL876iDOToA
Date: Tue, 21 Apr 2020 08:10:21 +0000
Message-ID: <3949BFDE-975E-4461-B81D-F53954DFF91E@arm.com>
References: <1587454435-46370-1-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1587454435-46370-1-git-send-email-diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9c4d5bf5-119e-4472-acb3-08d7e5cb7502
x-ms-traffictypediagnostic: DB7PR08MB3578:|DB7PR08MB3578:|HE1PR0801MB2011:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB20110277B07CC094558285C09DD50@HE1PR0801MB2011.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:364;OLM:364;
x-forefront-prvs: 038002787A
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(71200400001)(53546011)(33656002)(6506007)(86362001)(2906002)(186003)(4326008)(5660300002)(26005)(36756003)(316002)(966005)(76116006)(66476007)(66556008)(478600001)(66946007)(2616005)(66446008)(91956017)(64756008)(6512007)(6486002)(8676002)(54906003)(8936002)(6916009)(81156014);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 QY7bd99u8eup2nx2omqval4r+P2msO6xeM0buPfMxunsG4GHoqvMZqE2lgu2wu13knUjnWFReWZggmTjeG3n4syCl7c5Ht9uK9jM1rK3I2316fiXL357HO2SS44ZPV3RSkWjIlzo6Wv6Hj9zqUg9EOQzKMclg2xlUDY0FOfMlrnjrINvx2hvziim7g1Z7wpVDe+MBO+agpyNpA0sA8A/17H8VD+ZcjJstiDu26DIA0f0pIczBG9WirQE9sIppTurmq1quS6gGSCt67vSGVRqbDJ7uB1c2nuHYgxiUqrCb7eOVKhXCLgU+OoQ15g1heUPtRvco8l6VR6JmgRMRtZJpXootghBAy5m12LDnSOh4lWFVbc71wN//w5Je9KprufGxs26vqjx6uKdkiSSwwozDWWMm6gpaFpnM7e/rdi99A4LVb8qlP237tv30TML4BwuxvyJ+pSRFmhf1HNYn+tra4RB4WJ5gXZs6Ca+sDk9xO2F2/+OwNhldFT+XjMnqZ+S9r9bzokOtTr/r17EI72NYg==
x-ms-exchange-antispam-messagedata: 
 RBZnPES41EfPOTBzNXwMV9CsbyUZrue5ODD6zHwddTHEO7dtECNSIm8X2U67BVx3MRgH7LrQr6xJwfR+AcoXShwR9JkmDqWqOQpMu3kwrI8Ac2x6xJHR7WK0FgDQmM91rbnR/ZK+2ZGLIST45TMoSQ==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3578
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(346002)(396003)(136003)(376002)(46966005)(316002)(70586007)(2616005)(70206006)(4326008)(36756003)(47076004)(5660300002)(186003)(54906003)(966005)(2906002)(81156014)(81166007)(356005)(8936002)(33656002)(8676002)(26005)(6506007)(53546011)(82740400003)(336012)(6486002)(478600001)(86362001)(6916009)(6512007);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5cc1f72d-9684-4f2c-9b7e-08d7e5cb702d
X-Forefront-PRVS: 038002787A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3S5DSe6dq+xx8/wrb8VXq0EPPfY10tRJWtldIKNKgMh6WIEi9JAOxjp89a/L+qoWDddqd7vKNyWB6e6aO8JQ3llA/3QM0wlL9fl2mF/TqTSDCrKz1oeU7DnDzK+Jo+5flQKbFpF/Ce/txKbzP2OOSfGHkaNivd5xNJZ/R51Sr1skeCg2/vRDT+/U1RQL9p+mTLsR6EUYTxWM9e4vCZgO9dQ3htShRmshuSeuA+zIiwJPdPHYatgr5JVPsKBQFr7+mZ1PEhjj5gNHT59r3LLLZ+YUBrYqM12xvI7No+TA8O/K8u3W2PweocxpzV3EzvCzBmLRU6q2BjiKkXs7TZQbsXlbpatoZoWA8MorZ77v28fY4OnEdWCTSnGqWm22+3H3Dzk4/IEnMSDppAs4NZob296jVJLNNlAwHRtLAJsxZw+KW3dr1hgPOCiQvRFgjEDhWvmykQDSSAG2HkFrncVx8BOuDIlQrVnBYMPDkrD5PkhaNZNsv7671lzDyrMtakRrSdboLVcVE9dVRlkTPTkFm5EWtg6wgAPtp/1EfYQHT/xZO1/CsX01pI3zSVp4D+OhZ4zvuAez2mt544oC/dmZlg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 08:10:30.0365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4d5bf5-119e-4472-acb3-08d7e5cb7502
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2011
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9F419FAFC8F0094998CA64F65D647956@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 21 Apr 2020, at 08:33, Diego Sueiro via lists.yoctoproject.org <diego=
.sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> This patch series includes:
>    Removal of misbehaving do_clean task from tf-a recipe
>    Change tf-a recipe to deliver compiled binaries to sysroot as well
>    Introduction of scp-firmware-juno and firmware-image-juno recipes
>=20


Reviewed-By: Bertrand Marquis <bertrand.marquis@arm.com>

>=20
> Diego Sueiro (5):
>  meta-arm-bsp:trusted-firmware-a: Remove custom do_clean task
>  trusted-firmware-a: Deliver binaries artefacts to sysroot/firmware
>  meta-arm-bsp: Introduce the scp-firmware-juno recipe
>  meta-arm-bsp: Introduce firmware-image-juno recipe
>  arm-autonomy: Append firmware-image-juno recipe to collect Xen
>    binaries
>=20
> .../images/firmware-image-juno.bbappend            | 14 ++++
> .../firmware-image-juno}/images-r0.txt             |  2 +-
> .../firmware-image-juno}/images-r1.txt             |  2 +-
> .../firmware-image-juno}/images-r2.txt             |  2 +-
> .../juno =3D> images/firmware-image-juno}/uEnv.txt   |  0
> .../trusted-firmware-a_2.%.bbappend                | 13 ----
> meta-arm-bsp/conf/machine/juno.conf                |  2 +-
> meta-arm-bsp/documentation/juno.md                 |  7 +-
> .../firmware/scp-firmware-juno_19.06.bb            | 38 ++++++++++
> .../recipes-bsp/images/firmware-image-juno.bb      | 64 ++++++++++++++++=
+
> .../firmware-image-juno}/images-r0.txt             |  0
> .../firmware-image-juno}/images-r1.txt             |  0
> .../firmware-image-juno}/images-r2.txt             |  0
> .../juno =3D> images/firmware-image-juno}/uEnv.txt   |  0
> .../trusted-firmware-a/trusted-firmware-a-fvp.inc  |  7 +-
> .../trusted-firmware-a/trusted-firmware-a-juno.inc | 82 +++-------------=
------
> .../trusted-firmware-a/trusted-firmware-a.inc      | 36 +++++-----
> 17 files changed, 152 insertions(+), 117 deletions(-)
> create mode 100644 meta-arm-autonomy/recipes-bsp/images/firmware-image-j=
uno.bbappend
> rename meta-arm-autonomy/recipes-bsp/{trusted-firmware-a/files/juno =3D>=
 images/firmware-image-juno}/images-r0.txt (98%)
> rename meta-arm-autonomy/recipes-bsp/{trusted-firmware-a/files/juno =3D>=
 images/firmware-image-juno}/images-r1.txt (98%)
> rename meta-arm-autonomy/recipes-bsp/{trusted-firmware-a/files/juno =3D>=
 images/firmware-image-juno}/images-r2.txt (98%)
> rename meta-arm-autonomy/recipes-bsp/{trusted-firmware-a/files/juno =3D>=
 images/firmware-image-juno}/uEnv.txt (100%)
> delete mode 100644 meta-arm-autonomy/recipes-bsp/trusted-firmware-a/trus=
ted-firmware-a_2.%.bbappend
> create mode 100644 meta-arm-bsp/recipes-bsp/firmware/scp-firmware-juno_1=
9.06.bb
> create mode 100644 meta-arm-bsp/recipes-bsp/images/firmware-image-juno.b=
b
> rename meta-arm-bsp/recipes-bsp/{trusted-firmware-a/files/juno =3D> imag=
es/firmware-image-juno}/images-r0.txt (100%)
> rename meta-arm-bsp/recipes-bsp/{trusted-firmware-a/files/juno =3D> imag=
es/firmware-image-juno}/images-r1.txt (100%)
> rename meta-arm-bsp/recipes-bsp/{trusted-firmware-a/files/juno =3D> imag=
es/firmware-image-juno}/images-r2.txt (100%)
> rename meta-arm-bsp/recipes-bsp/{trusted-firmware-a/files/juno =3D> imag=
es/firmware-image-juno}/uEnv.txt (100%)
>=20
> --=20
> 2.7.4
>=20
>=20

