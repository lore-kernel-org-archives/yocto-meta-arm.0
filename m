Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.88])
 by mx.groups.io with SMTP id smtpd.web11.8273.1586338902611790402
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Apr 2020 02:41:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=t+WlVKha;
 spf=pass (domain: arm.com, ip: 40.107.22.88, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iachs/5jMY8i+UvgxWfAksvGUt9a26FTLZ9LQZAbKQk=;
 b=t+WlVKhasyoaKZlCm+NWEVlOTSWHHf+Amw/DoejJ8YBflsqpg/7Q8N5eMDrfDbB44/xozQynZP3wpFa7B10uQjwpviOv/zpoSAjNYeG+v4rn1LIctE5nmEy0REIN3dx49FQ4aipLbMD45aKEnWG13TXz3VM2B/seu943i4Sw348=
Received: from AM6P193CA0038.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::15)
 by DBBPR08MB4411.eurprd08.prod.outlook.com (2603:10a6:10:cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Wed, 8 Apr
 2020 09:41:40 +0000
Received: from VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::6a) by AM6P193CA0038.outlook.office365.com
 (2603:10a6:209:8e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend
 Transport; Wed, 8 Apr 2020 09:41:40 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT009.mail.protection.outlook.com (10.152.18.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Wed, 8 Apr 2020 09:41:39 +0000
Received: ("Tessian outbound 55454527ea3b:v50"); Wed, 08 Apr 2020 09:41:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e047a0a5e08d4df7
X-CR-MTA-TID: 64aa7808
Received: from 9520e68a985a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7B82425F-09C5-4B56-80E5-D9B1815841A7.1;
	Wed, 08 Apr 2020 09:41:34 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9520e68a985a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 08 Apr 2020 09:41:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SdejFcksi7+ZRT/lLZXIBSWd5t42C8uq5JgRiAybDtTndBjAdSuPwSo+thMeyPui4++R/uDfper9g3WYbEADKu3VoDheUbKw+i+gbAkcNORruUjZXFxxoAHDOZaoNbCCtqlNdBpSPEAvZA0du455MQNztYA6R1/s6fClnBLP4iPdjenKBCUWD0CmI3wluF63xyKaxN5hINmvsgri1SDeBkr3uyA4ISeB0vMCwWrBFC6kKQcKl60ZaIDRc3Ckfmh1OhlySdzuuumKmE9nU5bHmfiTZFCbwX4WlCZklE5FAQuNo6pXMJuMqYoHo08zCR+8EvijqIR2FSpV6xuFoFJdCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iachs/5jMY8i+UvgxWfAksvGUt9a26FTLZ9LQZAbKQk=;
 b=Xi0wAyo7hDPaviQZDgFSV/LcjPl8cx3XgqEXDXloe036AU6mrLBMpbRoSrxyjA8h9u3LhLYgvdBiOVuzaxXBMupabWUR5qPlTHFZFwahrbfP0OUhNTxSclNjkVDSPB9OU4MiETyinjBWHAPCpHW7Dt0mdJ9Jw1RVYFGIqo5aUYWaNGD3Ma/gd66CTb27xsX7/+tWbV3oKI7QYHnMKK85O94nwauV2mMFB7DSKZLyqfhMxumDhbvl4EMLquxCi270bjcS1f8OploiMuifVhpjhVXSAxcNsu2apqV7nR5toRBQmQmTLjRGMgYD3uJlDQJ3WjS1UvC1/Z1P9G9fX/6r4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iachs/5jMY8i+UvgxWfAksvGUt9a26FTLZ9LQZAbKQk=;
 b=t+WlVKhasyoaKZlCm+NWEVlOTSWHHf+Amw/DoejJ8YBflsqpg/7Q8N5eMDrfDbB44/xozQynZP3wpFa7B10uQjwpviOv/zpoSAjNYeG+v4rn1LIctE5nmEy0REIN3dx49FQ4aipLbMD45aKEnWG13TXz3VM2B/seu943i4Sw348=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3162.eurprd08.prod.outlook.com (52.135.129.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.16; Wed, 8 Apr 2020 09:41:32 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2878.021; Wed, 8 Apr 2020
 09:41:32 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>, Diego Sueiro <Diego.Sueiro@arm.com>
Subject: Re: [meta-arm] [PATCH 0/2] Move Xen specifics from meta-arm-bsp to meta-arm-autonomy
Thread-Topic: [meta-arm] [PATCH 0/2] Move Xen specifics from meta-arm-bsp to
 meta-arm-autonomy
Thread-Index: AQHWDYkxRoe+g/e0lUWYyovrV3iqJ6hu+LMA
Date: Wed, 8 Apr 2020 09:41:32 +0000
Message-ID: <05ED4A10-C525-4349-9334-CDC4C2A14517@arm.com>
References: <1586338573-27238-1-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1586338573-27238-1-git-send-email-diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1607a771-fc05-4196-a7cf-08d7dba109c6
x-ms-traffictypediagnostic: DB7PR08MB3162:|DB7PR08MB3162:|DBBPR08MB4411:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB4411BF046F11FCA4D1A3C6EB9DC00@DBBPR08MB4411.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:530;OLM:530;
x-forefront-prvs: 0367A50BB1
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(66446008)(76116006)(66476007)(26005)(2906002)(66556008)(86362001)(64756008)(6486002)(6916009)(81166007)(316002)(6506007)(53546011)(2616005)(36756003)(966005)(66946007)(4326008)(8676002)(71200400001)(81156014)(186003)(91956017)(478600001)(8936002)(54906003)(6512007)(5660300002)(33656002);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 D0tVDFAExyK6cWsIou7Y2L5L3onINrQdkkmUsg2yKAkcjAJ2hlzbbtlk3nmOxPh8HLKM+HwYntBVowKWRK0Ew30p5n88+xXKUP92dLfvvLxIsHaJU5IDNaPbqbrMVI/XTLdKOEMpMhbCUB4rswSP4/KbcbbWO75SFbxiQBNdgfQX0HkPZ1UnvhlLV1+Qgvq9xps5AXPt2qZYrgWTH1VS5LChx6xTW191MyPOhUwnabLeFD7DOBmmeMZuDbHgdFdp3z2tD5lnwOkENlbKI4/U/8gVG32Bl0WB+w9+5QdQ8DmNkZ5kcmHejMkprxkch04W1T5fIMADBUi6KUKLyLklLIJ0s9YIRm4YWIT+Jr/mG5k6g1nS2D3A82jf982m2vHfmTNpfy6V41LDO2oLolwqX9NsfFoaPFjIkeifMVhNjkxEwbZU7LVBkOibgkHcq/GawyTh+9o18q3tn5uo8EVrK3corrE4RLD8i9Fn0ENplENcaALtglP5nkensua09sFoQdON812lYbdBts/ZO3/sWQ==
x-ms-exchange-antispam-messagedata: 
 FiAFF84d468+gw4m29DkqpeDGr/HbY1upc8BGQ1JrGThgd7o+R/06qXqOHWK9pUEzfgvGYX2PNGwDJLE4KkRpPLCslzd8/RhXRd+hOxxNUQ1F4YyK3DvaUvY7Q4mFPYlCaU0aWUlTtJKaLmwFn+fXg==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3162
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966005)(4326008)(82740400003)(26005)(26826003)(966005)(36756003)(8936002)(54906003)(478600001)(6486002)(47076004)(6512007)(81156014)(81166007)(53546011)(6506007)(356004)(316002)(36906005)(2906002)(86362001)(6916009)(70586007)(5660300002)(2616005)(33656002)(8676002)(336012)(186003)(70206006);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	240caf83-7b2b-41e1-8098-08d7dba105b5
X-Forefront-PRVS: 0367A50BB1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	h1c/YSbetmCYma2sYScqMCrZ/TAEl9ui9I3fEDsRme2YXOVomSNMgVap+mgDWfvwpzh1phcTASqNQU52Jj5m3nN7ZkXvUs6tgNuPsKGc/mwcB49cEVtDcjbECTqiJ2riwbny7H3P7vvT0PrT77Oe217p8OP4diP1KLZSfMt43qLiFlqerO26qlGstK20NCmXWBPLXS7PAlw4eDrdbmu3dX6Z7X79oOhUMmElmcwul6lOEVvp1SFhnInDpCI/3rAev6E8Owihf51Pe3pi9iHAFtQjzE0gDDLlcBHT8Y7Ne3a7m5B/ynwMGa9VyZic1OULhiZDvQHMGwkZVyZdrMb53XPy1hnE/x0FkmhbKAHvAXDfh7CJ5JXBR7B7g18ks+Dv/PF+jF29FVTr3YlDMyn9WAeTUS8dc3pd6BIzN3zOUYvav9x1hi/aZEj6JPH2RXS+7SVLdmsVUMumUvdjsmehts2U0mL+GGeB3B77XiKgmigvek3QcxG51jmAOIUsuyaLkONwZNo1WKQG0NghZOjZ44Ze7TlS2+gC6sjvGNb2YgH8kJUt2mE1D4bfjN9bdoPb8unIFPGElMVhrcHiDG0X3w==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2020 09:41:39.5305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1607a771-fc05-4196-a7cf-08d7dba109c6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4411
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <11D3278848C9194A80D1509F949B55BE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 8 Apr 2020, at 10:36, Diego Sueiro via lists.yoctoproject.org <diego.=
sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> This patch series is to remove Xen specifics from meta-arm-bsp and add t=
o
> meta-arm-autonomy.

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

>=20
> Diego Sueiro (2):
>  meta-arm-bsp: Remove Xen specifics
>  arm-autonomy: Add Xen specifics from meta-arm-bsp
>=20
> .../boot-wrapper-aarch64_%.bbappend                | 32 ++++++++++++++++=
++++++
> .../trusted-firmware-a/files/juno}/images-r0.txt   |  0
> .../trusted-firmware-a/files/juno}/images-r1.txt   |  0
> .../trusted-firmware-a/files/juno}/images-r2.txt   |  0
> .../trusted-firmware-a/files/juno}/uEnv.txt        |  0
> .../trusted-firmware-a_2.%.bbappend                | 13 +++++++++
> .../4.12.0/0001-trace-fix-build-with-gcc9.patch    |  0
> ...ap-the-number-of-interrupt-lines-for-dom0.patch |  0
> .../recipes-extended/xen/files/fvp}/defconfig      |  0
> .../recipes-extended/xen/files/juno}/defconfig     |  0
> .../recipes-extended/xen/xen_4.%.bbappend          |  7 ++++-
> .../recipes-extended/xen/xen_4.12.0.bbappend       |  0
> .../features/arm-autonomy/disable-arm64-sve.cfg    |  4 +++
> .../features/arm-autonomy/disable-arm64-sve.scc    |  3 ++
> .../recipes-kernel/linux/linux-arm-autonomy.inc    | 14 +++++++++-
> meta-arm-bsp/conf/layer.conf                       |  5 ----
> meta-arm-bsp/conf/machine/fvp-common/fvp.inc       |  3 --
> meta-arm-bsp/conf/machine/gem5-arm64.conf          | 15 ++--------
> meta-arm-bsp/conf/machine/juno.conf                |  3 --
> .../boot-wrapper-aaarch64/boot-wrapper-aarch64.inc | 21 +-------------
> .../trusted-firmware-a/trusted-firmware-a-juno.inc |  9 +-----
> .../bsp/arm-platforms/fvp/fvp-board.cfg            |  5 ----
> .../arm-platforms/gem5-arm64/gem5-arm64-board.cfg  |  5 ----
> 23 files changed, 76 insertions(+), 63 deletions(-)
> create mode 100644 meta-arm-autonomy/recipes-bsp/boot-wrapper-aaarch64/b=
oot-wrapper-aarch64_%.bbappend
> rename {meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen =3D> =
meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno}/images-r0.txt =
(100%)
> rename {meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen =3D> =
meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno}/images-r1.txt =
(100%)
> rename {meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen =3D> =
meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno}/images-r2.txt =
(100%)
> rename {meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen =3D> =
meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno}/uEnv.txt (100%=
)
> create mode 100644 meta-arm-autonomy/recipes-bsp/trusted-firmware-a/trus=
ted-firmware-a_2.%.bbappend
> rename {meta-arm-bsp =3D> meta-arm-autonomy}/recipes-extended/xen/files/=
4.12.0/0001-trace-fix-build-with-gcc9.patch (100%)
> rename {meta-arm-bsp =3D> meta-arm-autonomy}/recipes-extended/xen/files/=
4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch (100%)
> rename {meta-arm-bsp/recipes-extended/xen/files/juno =3D> meta-arm-auton=
omy/recipes-extended/xen/files/fvp}/defconfig (100%)
> rename {meta-arm-bsp/recipes-extended/xen/files/fvp =3D> meta-arm-autono=
my/recipes-extended/xen/files/juno}/defconfig (100%)
> rename {meta-arm-bsp =3D> meta-arm-autonomy}/recipes-extended/xen/xen_4.=
%.bbappend (75%)
> rename {meta-arm-bsp =3D> meta-arm-autonomy}/recipes-extended/xen/xen_4.=
12.0.bbappend (100%)
> create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-k=
meta/features/arm-autonomy/disable-arm64-sve.cfg
> create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-k=
meta/features/arm-autonomy/disable-arm64-sve.scc
>=20
> --=20
> 2.7.4
>=20
>=20

