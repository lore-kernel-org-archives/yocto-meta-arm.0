Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.56])
 by mx.groups.io with SMTP id smtpd.web12.6251.1594299721745150083
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Jul 2020 06:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=FZxJTfNZ;
 spf=pass (domain: arm.com, ip: 40.107.5.56, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6eTul21ZuVHbBsOdz154giQNiCtzkeHQuAq0KeANPw=;
 b=FZxJTfNZF4DAUKZ7V8/GoymUiF5ycLLovTtbxU6FdAlgtaQ7xnTx065d0Dnkt92IzecqH4hQ45HQdOI5CoSUFbgD4fREISllZpMBBokbV+HtZELEOj18HQvuYQR63Zdgd+Nh8j9rEqalUMD+fO5CXcqygGEFk5vNDTJUWhXCL2I=
Received: from MR2P264CA0154.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1::17) by
 DBBPR08MB4647.eurprd08.prod.outlook.com (2603:10a6:10:f1::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.28; Thu, 9 Jul 2020 13:01:59 +0000
Received: from VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:501:1:cafe::22) by MR2P264CA0154.outlook.office365.com
 (2603:10a6:501:1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Thu, 9 Jul 2020 13:01:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT038.mail.protection.outlook.com (10.152.19.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Thu, 9 Jul 2020 13:01:58 +0000
Received: ("Tessian outbound 1dc58800d5dd:v62"); Thu, 09 Jul 2020 13:01:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1e84a96700cf522f
X-CR-MTA-TID: 64aa7808
Received: from ecc7bf5fc3f4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9C7AF9AC-F751-4B46-B296-D01C2A1809F5.1;
	Thu, 09 Jul 2020 13:01:53 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ecc7bf5fc3f4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 09 Jul 2020 13:01:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dp9ysjcznjF+45pMX3NlnOkNMgCJLBBdOlfcClccANvIUUadFhmgwkFkrwwJexd1CRQqujJm24rxGJFFLf5GzJ6ke6HZklvNUt4UgvuwugsHv3jLYxcP4dc5Eo/tbQN2GilzYNQWcj7pBxbAPG81a9DK1qNBqpPvoJDxiREoR2f8aQeAOf/4b3HCtFOLdkcvYSDqGcwjLvDxUtArgRfPSM4VbY1IwpZlb9R9fneyEBEtttvZYx5X8AXsN6zST+pV/lebrXCyp0+iP46HAPghvJg9jpyAfwEsPYrVDt6r0ihZKkLe0KE6+mI0gC5Sip6AjBF0l8AF8MkRz83WScepuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6eTul21ZuVHbBsOdz154giQNiCtzkeHQuAq0KeANPw=;
 b=Yu/6+yd/V0WoYOWVOrDqYJPhIky+tdeFc6US9sy6aMqN2CZ/7/8qJPEFVCItlGrVWHC1AVHIG8dCS60cc4XJxu5HKbK36w4MnSM2Zv4g9gWgy0Vce0Hkn0j8S5ksqMjRY8Ry5x72WoxbD3lShfU3y/DAxHG2hCvYAy0Kygb4K/mDOTqi2iN66KB2iXRQgmpS+Sl2o5s4Rcc4/B1n6KZiDZ8FRhF4jKgr1MBKn+52vYfPlVVY/RLwI6hIKp7kJYYz8yc025XooJYl26T0v/iiGljWNCI8TBWK89RQu400xApKmWj2tQLPnrYcfC5UM5eoIWV9aJ43eeJY/xVSD3tkSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6eTul21ZuVHbBsOdz154giQNiCtzkeHQuAq0KeANPw=;
 b=FZxJTfNZF4DAUKZ7V8/GoymUiF5ycLLovTtbxU6FdAlgtaQ7xnTx065d0Dnkt92IzecqH4hQ45HQdOI5CoSUFbgD4fREISllZpMBBokbV+HtZELEOj18HQvuYQR63Zdgd+Nh8j9rEqalUMD+fO5CXcqygGEFk5vNDTJUWhXCL2I=
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB4124.eurprd08.prod.outlook.com (2603:10a6:10:b0::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Thu, 9 Jul
 2020 13:01:52 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643%7]) with mapi id 15.20.3153.030; Thu, 9 Jul 2020
 13:01:52 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: Jon Mason <jdmason@kudzu.us>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] arm-bsp/wic: add default wks file to create EFI disk image
Thread-Topic: [meta-arm] [PATCH] arm-bsp/wic: add default wks file to create
 EFI disk image
Thread-Index: AQHWT7ssZfdCY+WT20WbwszhgeOemaj/QNsAgAABwgY=
Date: Thu, 9 Jul 2020 13:01:52 +0000
Message-ID: 
 <DB8PR08MB4969EAB169E4B1A72F0EC3BEFA640@DB8PR08MB4969.eurprd08.prod.outlook.com>
References: 
 <20200701152024.16320-1-khasim.mohammed@arm.com>,<20200709125502.GC9023@kudzu.us>
In-Reply-To: <20200709125502.GC9023@kudzu.us>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cec4166d-44b1-47c4-423c-08d8240843c1
x-ms-traffictypediagnostic: DB8PR08MB4124:|DBBPR08MB4647:
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB4647A105E3AB53D84935C649FA640@DBBPR08MB4647.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 2dTGl+kOXRsiHLFqlW2qontGgkiRN8zVJ8lwzzAq0ZP93twFXSelr4nDu8Zpfr9wYh3grYtcMJkwnas4+b/ZavS4wvw7AhGPNdUXKKdDgBDQ3RrXG3VS2+xpUCjCCM2cqFKyQLmu499YK1nmY2tqb4LRZMbzghccaTjq2SF3VMLGxT5dO12lL/CG2V2z/fEFZ8OWeLIY/1WMQeSbr44ov1wVhozJRQ3c8/xO9eEB9lSAAefAzWtd2Pm6QgGoOCENzVdYZLN4XYzQH3+rA0Al6U2Y6gni2CqtajgNKEdaafjeUEU9S6mqAVCIdbQpSyqRtaDJ+eA7TsP/uV/nus4sW4kj31nT6lq9nNFmgSDVa238svbh1/7sAJATipUhGF5T7FtsnhgGCwo5Vrvc0EsKTg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(71200400001)(86362001)(66556008)(83380400001)(76116006)(52536014)(66476007)(64756008)(66446008)(66946007)(6916009)(33656002)(5660300002)(2906002)(8676002)(4326008)(478600001)(55016002)(9686003)(26005)(186003)(966005)(53546011)(6506007)(7696005)(8936002)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 5gcJLtxZjfmg7/VV7ttTDecI88/7TNYiZTEC37pV3OeizdMhNxf9hCDDJsmI+4CzIi6CIZFdsgz3P7KaKc/CLnuSNdBgqMng8vWE4EQLF2gl5MK1ldYYnwDy4m21+OFFIepKUSgQo6d+7rBpMKa0CoI8DYu98Nhas4SD2tf/7/rb5uPTuUniHBe+fcL9BTVupVYZ4tdSsw1r/aXmZvUzhvqjZA9efe5pBJpFYk9BUIModrzBfTeSU1Bfoe96I05x9HzXN8BtgcyPwaaRMThdmxBEL5WuW5Oss5UYwmvs+gVSRq+1XYalQh9m/CjMVjpKJEjyGVWBa+jnOy3K5kplRe+DCk0KAZwh/zsimJAwDm6VDRbCReArZv+vXw6NrAJYVp2RBDwAxk8VW2r+E/g6vBy+49b6cBebuut3mgKwW8+JJNV2+0/jJvQ9AFEiEVcMLlgZZX5J6kLouCysDajlWAiL4X/5PX9cnDcTvnbIcA6cVYA7oaNIMv6jLWd0+43+
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4124
Original-Authentication-Results: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966005)(8936002)(52536014)(2906002)(5660300002)(966005)(83380400001)(478600001)(86362001)(316002)(36906005)(53546011)(33656002)(7696005)(6506007)(55016002)(9686003)(26005)(8676002)(186003)(82310400002)(70206006)(47076004)(4326008)(70586007)(6862004)(82740400003)(81166007)(336012)(356005);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	36cf24ac-9d9d-4c04-631f-08d824084026
X-Forefront-PRVS: 04599F3534
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8XkXQR/9ISpsaG5Isg1Ix0nw+cjwMJhVFXBejCP5XxRtEaFeRkwKiNF4mH0UL84S4dMJEpBlLKi4OmgNobQxWRcsrgjE4ISqgPi+DfHGvZgI3RGqlX+Zo6UCdx+7BcW9okO1V/A5h11MtL7Tmz54ZrLSjAgRocQV2umjMnJ+9e+sOApwXO01VRZ97Mwl/fWX3kXBi/bG0rcRvpbLm72zBpD8Ck/gBI1KPbioK2ycrXcj2jI1eGpI8l0qi2Q8vFDaPOoY65DyNtMNud3HqJlySv3ajKsGmxsxP2mNMknGB7k8HPBJ45P5kzGFWiRPWCGGCv6wm8Mj7WheNBxINKmJ8Xsxnd5xv65zo/uvLX8QrFrRwY74op7YXFMr1sDFsFpfn1k3P8paNvuH0FBnnyhAxZ5uM0PAkSkXgdY284V2yNnr5igbcDhsS/96JJ0VlnblF2EjX2Wv5Cl0kRBG+3C8z7dujK48cH6Rad630GG54js=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 13:01:58.6722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cec4166d-44b1-47c4-423c-08d8240843c1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4647
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Jon,


________________________________________
From: Jon Mason <jdmason@kudzu.us>
Sent: Thursday, July 9, 2020 6:25 PM
To: Khasim Mohammed
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp/wic: add default wks file to creat=
e EFI disk image

On Wed, Jul 01, 2020 at 08:50:24PM +0530, Khasim Mohammed wrote:
> Creates a partitioned EFI disk image that the user
> can directly dd to boot media. The selected bootloader is grub-efi.
>
> Change-Id: I1a5e8bc953274cdcc1840b27351d8e6444b2c5ab
> Issue-Id: PLATFORMS-3134
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>

> Applied to master.

Thanks, can you please consider applying this patch to Dunfell branch as w=
ell ?

Regards,
Khasim

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/machine/n1sdp.conf | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/ma=
chine/n1sdp.conf
> index 755bb09..318b2d0 100644
> --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> @@ -15,6 +15,9 @@ IMAGE_FSTYPES +=3D "tar.bz2 ext4"
>
>  SERIAL_CONSOLES =3D "115200;ttyAMA0"
>
> +# Set default WKS
> +WKS_FILE ?=3D "${@bb.utils.contains("EFI_PROVIDER", "systemd-boot", "sy=
stemd-bootdisk.wks", "mkefidisk.wks", d)}"
> +
>  # Use kernel provided by linaro (Contains support for SCMi or HDMI)
>  PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-linaro-arm"
>  PREFERRED_VERSION_linux-linaro-arm ?=3D "5.4%"
> --
> 2.17.1
>

>=20

IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose, or store or copy the information in=
 any medium. Thank you.
