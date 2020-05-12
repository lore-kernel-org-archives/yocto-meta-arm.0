Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.46])
 by mx.groups.io with SMTP id smtpd.web12.9748.1589301447365659526
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 May 2020 09:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=K7o0FPvu;
 spf=pass (domain: arm.com, ip: 40.107.6.46, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFAbuvQhpGTyzh3WRogaqjjJuvCo2B+6du3MAlcuEWI=;
 b=K7o0FPvujVFoW8QNboTqVdhlR9tOV5VvjoRVvd9NFRx9HN0ISKFXI/7tLqZdrDKp34UUQVDlRzNI9cPiqyArrO4ANrR7CWF3zq/nUgBs1jOs5LOA/0HVc+nIVmT+XsO70CfeacQJChPWVFLp9mxMkOiZYTZ7T/0m0E4QB1Gcdxg=
Received: from AM5PR1001CA0001.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::14)
 by DB6PR0802MB2423.eurprd08.prod.outlook.com (2603:10a6:4:99::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Tue, 12 May
 2020 16:37:24 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::81) by AM5PR1001CA0001.outlook.office365.com
 (2603:10a6:206:2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Tue, 12 May 2020 16:37:24 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Tue, 12 May 2020 16:37:23 +0000
Received: ("Tessian outbound 4cdf5642225a:v54"); Tue, 12 May 2020 16:37:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 67c7b0b35b90f85c
X-CR-MTA-TID: 64aa7808
Received: from d39395ab39a3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2FA647EE-3759-4968-B709-3FB9DF3CD1DC.1;
	Tue, 12 May 2020 16:37:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d39395ab39a3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 May 2020 16:37:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ll1MUDJ//qszYU3wBdELfyXNPPp2Jn7bB2mDTArAEtQ2V7Vi0cPi5zVlXjMSykASfZuzU0h+SzC9Fq5cMAGgvCzoMlqxhoGPqsPjOhduwmJanpYl5r9DkoGIDTS0MH8YsAolq0PpkONKvVgTwYN94W6RJCv0NLLF6Ro+xI2lQTciFY8Huwr8fgPJ5VemkVU5rwavUfQ26UYTeIDMgwH4E9gI97mC0qyEJnpddVraN8NGcxsNAqhyR1QDAbG/n85SH4w6Ug6bqqrd5gJ+OPoZbXseg+7EPwOr1ccXQ3rq/zunFzhqefog+2B+wUBsUx+xPYKsaPRyZkYG2Qr91kVHIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFAbuvQhpGTyzh3WRogaqjjJuvCo2B+6du3MAlcuEWI=;
 b=DzxobL/iq0EwBSkA9sxrS/uG85NErMxj9rXXLK6tMykoMg2vislkVDyWzJ60HSEmqQPG9f8wzvfWefrC5aomFH5g5cQCjfRHctPohB2pX7iP3q4f7UM5jnKtcA87HA1FrDB7Oi1D5+24js03jXsyJOO01ezLbQYX1m6UUDJMak9KxRJeIdM36pUNkz3fShTdz2DFeF2+etOFoTsCOU5/7pqv3pSUbD6+c8IHl6Ed2x6YMCMiaZZ88no3hhwDh/xFCe6H/IH/KcHJiKpSIn7qvPZnQ4+qpgC88KQNV8D0Cftf185L3MPUh6QVeNCOinmTBG0/9mwugQVfjypMNiie8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFAbuvQhpGTyzh3WRogaqjjJuvCo2B+6du3MAlcuEWI=;
 b=K7o0FPvujVFoW8QNboTqVdhlR9tOV5VvjoRVvd9NFRx9HN0ISKFXI/7tLqZdrDKp34UUQVDlRzNI9cPiqyArrO4ANrR7CWF3zq/nUgBs1jOs5LOA/0HVc+nIVmT+XsO70CfeacQJChPWVFLp9mxMkOiZYTZ7T/0m0E4QB1Gcdxg=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3788.eurprd08.prod.outlook.com (2603:10a6:10:31::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.33; Tue, 12 May
 2020 16:37:15 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2979.033; Tue, 12 May 2020
 16:37:15 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp: n1sdp: linux-linaro-arm: Disable CONFIG_EXTRA_FIRMWARE
Thread-Topic: [meta-arm] [PATCH] arm-bsp: n1sdp: linux-linaro-arm: Disable
 CONFIG_EXTRA_FIRMWARE
Thread-Index: AQHWKHX4FSQLboPYR0aJm6uPqkV9tKikpkSA
Date: Tue, 12 May 2020 16:37:15 +0000
Message-ID: <FC013D47-F00F-40ED-854F-545C503E9BC1@arm.com>
References: <1589298995-67540-1-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1589298995-67540-1-git-send-email-diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b6ee07d8-e341-4fea-dccc-08d7f692bfe2
x-ms-traffictypediagnostic: DB7PR08MB3788:|DB6PR0802MB2423:
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB24230806E5219CED414BC6119DBE0@DB6PR0802MB2423.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:792;OLM:792;
x-forefront-prvs: 0401647B7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 h78hR/KaxdWrlxhxj7zfnULAPLONYTy8PuBF3KTDGQGhwUNUVKpt2YcpaL5cOK7y69E4eBdhJE25vkJKPE4zaomuHAp3ibQTTg/BR57+idf/miTVlgKlt0hJjfZqi3y1ZYTI3YN4Pr45HeZJ34H+T7W6LWXG1eFYevIg1mNjaMDV/r5btU1ATusuLHuNB4bRfhoU5Rn+IAXHkOdbZvnRYepJjGqQusP9BO0kUdQogYt1INh10T7YlB9CKibBYd2GrNKWDotDKxNcVLHYZdnB2QRGNmJZRus1/vZSSihFku13+98beeWghrAAsZhUokeZZee75+KTXaDpUGrGKM9d6Wez7/i6dQsQJBz/sh0fL4uCyK4+cFm5/IwH4CiHvWlsRNUncLglpml31NOQBjqeREQZk2Qc1PLPwwsPVQFVwaU2pTFG7H7vPD1AVValYDs7FIuWnl8LalpwOjd5/bj1iKC3W8eI04vpDCy4LCw9Nse+pkbqvRkcn+oqiPpU88d8YLnYQUGeNoknmHDLkv63AD7JqmjxinDiSW0wx790Gg59amsjuXx+0IFa5SOgvVgvzWqEstajNKiryu+6AS+4QnYGe+3I8bRLS1KGd8WmLRy32gYeaIT/uf66FR0hp7qV
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(33430700001)(91956017)(76116006)(64756008)(6916009)(2616005)(4326008)(2906002)(66476007)(66946007)(66556008)(66446008)(86362001)(478600001)(6486002)(966005)(71200400001)(33656002)(6506007)(8676002)(8936002)(6512007)(36756003)(53546011)(316002)(5660300002)(186003)(33440700001)(26005)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 X1D7Pf1kZBtigIHNZh2UVfYGPutv1md9BKBDwqHcS67NDuRyWM8eTXSKoRsK6It83td151qGC1I5jAU8kvlG2CAJRPty5UL6/zanZrl2g8Gwnw+BatKz/QZ/fTueun21hmbGRNNzyJscOdyw4E1piu8Gn/o1NKtdEI/V3s7wOtkUFUDHSB9ZiEppHoe14apTtxHJxVuDLzJFsPYaL3qrbiIZJ9aIkh3tg7jDrSkZdSAjLHGB1uZEQ9FW49YIK36pChisJhsQMyVNbEDhPagq+7WKfW1hy2WHkXFxbRlblBxRFz+Ydu4xLvD6H/zRGc8jukTzdLl+PNfxG1YiebKENJzE1TJfh0nPvTyINaD1PoGcuH5PMzm/TVaLXk3JLaJzM2WY2EuCmBlmhMMtmZrk99GH6dt83sGuUEsWhPygjaEBGdSE/eC5tESkTH6ezofS2+2UVRmiT/HDZQ9bmpPDnJB7r4soSrUxH3DLvKbZ80F9/oPj0Oih86KnP3XdZPeG
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3788
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(46966005)(33430700001)(36906005)(6506007)(2906002)(5660300002)(316002)(8936002)(53546011)(6486002)(33656002)(81166007)(70206006)(70586007)(47076004)(8676002)(82740400003)(36756003)(478600001)(33440700001)(186003)(6916009)(966005)(4326008)(356005)(86362001)(336012)(6512007)(82310400002)(2616005)(26005)(32563001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	206919b0-18a5-48f5-0f22-08d7f692bad6
X-Forefront-PRVS: 0401647B7F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gJEc4wFqOwva3yl8UNanJFcEaTPXoYJ03iy6OE4NwVhczghlwKtAVTTP9d7nMEKLCLkoDk9BWepe8rwbiBP2Qrf8OIcoQk+Lb5zC2eWrIWx55T1BldJ8Ecsw5IBN6zav0/6FyGnXzwYOVPhwh5iEO2gm+fwY0jueSaCkX3VZ4jcxhWu7Q1bU7OLGAV+4yaPWnJ59JJgoImK03bco0/ddhowYLf+JsjHDIJKmRWdK61oQLmHpv/0SnU8WZ0dM1aCxiq2Zj4Zkl28hXKza21DgMgOlwN/l44ng600KO2qaNmNfhdSCmxMEcGd7CVwtjAgPwoIl2B1GLWMNPFY+bd2LXRfuaYF2zVAcS0Mnfx0HJHbDsZLeXJLhyVm/r7Q5K90uIhtllVXvveQK0CJFjWBHdCFGkNI0qLt3DrnRse+t9ez1OEtLwWTCj0RMZ+LJ5Zr85M2f1Te7YVdYreKpkaypqGbdpw/a0jNWhOgInyw7V6xKx2YI9iC8rkqy9bsaAb5z+LOHyt9ojzQZ6wGfn5oHx9+8f3zlq0DS1z/vmeEMf3ZaKhXdCJ0LSwUiZAHLXmjL8if/Cdc0zqTBugjjdIs1rcrUUDH5IeOPnjFs7arqHbIe8evFoJr3Ldkb6C9ir+oJV+/4BKh84fL+szL2lzh+xM3XumfYMvt6xQWxH5aGa8c=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2020 16:37:23.9969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ee07d8-e341-4fea-dccc-08d7f692bfe2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2423
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4FBEC6044B401F48886AE6331ABC6ACA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 12 May 2020, at 16:56, Diego Sueiro via lists.yoctoproject.org <diego=
.sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> We don't want to build firmware blobs into the kernel binary. Also,
> add linux-firmware-rtl8168 package to MACHINE_ESSENTIAL_EXTRA_RDEPENDS
> to have it installed in any image by default.
>=20
> Change-Id: If8a88a4ccbc6d474438a2555498989695a4b19dc
> Issue-Id: SCM-954
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> meta-arm-bsp/conf/machine/n1sdp.conf                                   |=
 3 +++
> .../linux/linux-linaro-arm-5.4/n1sdp/disable-extra-fw.cfg              |=
 2 ++
> meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend        |=
 1 +
> 3 files changed, 6 insertions(+)
> create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.=
4/n1sdp/disable-extra-fw.cfg
>=20
> diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/ma=
chine/n1sdp.conf
> index b19fb86..5fddcad 100644
> --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> @@ -18,3 +18,6 @@ SERIAL_CONSOLES =3D "115200;ttyAMA0"
> # Use kernel provided by linaro (Contains support for SCMi or HDMI)
> PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-linaro-arm"
> PREFERRED_VERSION_linux-linaro-arm ?=3D "5.4%"
> +
> +# RTL8168E Gigabit Ethernet Controller is attached to the PCIe interfac=
e
> +MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "linux-firmware-rtl8168"
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sd=
p/disable-extra-fw.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm=
-5.4/n1sdp/disable-extra-fw.cfg
> new file mode 100644
> index 0000000..35afddd
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/disab=
le-extra-fw.cfg
> @@ -0,0 +1,2 @@
> +# We don't want to build firmware blobs into the kernel binary
> +CONFIG_EXTRA_FIRMWARE=3D""
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbap=
pend b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
> index 9634d43..0f516c7 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
> @@ -11,6 +11,7 @@ SRC_URI_append_n1sdp =3D " \
>     file://0002-pci_quirk-add-acs-override-for-PCI-devices.patch \
>     file://0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch=
 \
>     file://0004-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch \
> +    file://disable-extra-fw.cfg \
>     "
>=20
> # Referring to commit TAG N1SDP-2020.03.26
> --=20
> 2.7.4
>=20
>=20

