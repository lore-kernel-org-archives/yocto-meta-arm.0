Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.49])
 by mx.groups.io with SMTP id smtpd.web12.7441.1589437882826634819
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 May 2020 23:31:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=99D1Zt39;
 spf=pass (domain: arm.com, ip: 40.107.6.49, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/lpt6AoirL4oa6vbUBc+izLqOgLWn6F/sjsgx+ScLo=;
 b=99D1Zt3967oMc12lYRw3x7RIcC7wzFnzUoqiCOWqYhXhWAcczWpLUgko0PC98ZsRtKwxscq0ehfcR/4XN6mFxlJA0XFuOLiW2kYi7wmTCQhhsh04qBpFQPwGmgMNpsIDjvf4uwinphRp9l0SWz/QS5YQQaz0abGKvjGM6XRbFs4=
Received: from DB6P192CA0011.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::21) by
 VI1PR08MB5518.eurprd08.prod.outlook.com (2603:10a6:803:13a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26; Thu, 14 May
 2020 06:31:19 +0000
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8::4) by DB6P192CA0011.outlook.office365.com
 (2603:10a6:4:b8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Thu, 14 May 2020 06:31:19 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Thu, 14 May 2020 06:31:18 +0000
Received: ("Tessian outbound 11763d234d54:v54"); Thu, 14 May 2020 06:31:18 +0000
X-CR-MTA-TID: 64aa7808
Received: from 18bfc73c5fbc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E88ACF10-C4D6-461B-8BE8-3D6F1B08A2DC.1;
	Thu, 14 May 2020 06:31:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 18bfc73c5fbc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 14 May 2020 06:31:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnzOJT/O3f4ihlbQzqNWm65P8qrDI7F4i3P64bozAaMDxnafsJXd+KycpdARzaOco7dDN+wNmgk9nhJ8i+SPrEupVBGJf8PhwdaV8fxDop3c38IiVedMM+TNgua6xMOEiVollhBlrqo+PqCkYUcPeUcrXKiLCR9Ttxyy4n+aiUG0E/SBUZKYIKLJwnLXPeiSTG1phDSRUHawgJQFLKIawrH7poeh7LOlr3a/ZfQU46DDKCLdlj/tlQpcoja+RYoUXQuizi4HXFub8R4ZymoJEJ45XPe3COo3zu7dsKm3msz1K0+M6n67lWEPQeM3q2VAGlH6fbmYlwlWIlVtPNm2HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/lpt6AoirL4oa6vbUBc+izLqOgLWn6F/sjsgx+ScLo=;
 b=RDN5k1ZTs8NFPRJcWuPour+1OH1DcaNkq6YkIC+14tlxXhnJg+IpHlImvuiRRNA+ciz1522az2i9WG6eonfXdW1zJQ/V4TLKs6b5uH8a4XbhkWXSWwSjZGjd2lcLj9znCUs3aJyLqPz/hCVhcepOO0lWeOY2JvS+2solkOWgtE00B7NCZcNCX8awVmpgLJ6NthZN8TaphfgoYjJx5qvH+pJHgcTcx5fT5O8Vg1kneJAD5a0Th8y/5Pap4WYK4dnD1TREr48oU3NAY9dpk0wBTUfjAiX+jfkrhyHJ8551aDcWQ90ii6HoYNEpdSo2yhfi5VwNoi/KIqP/C50EJEBZ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/lpt6AoirL4oa6vbUBc+izLqOgLWn6F/sjsgx+ScLo=;
 b=99D1Zt3967oMc12lYRw3x7RIcC7wzFnzUoqiCOWqYhXhWAcczWpLUgko0PC98ZsRtKwxscq0ehfcR/4XN6mFxlJA0XFuOLiW2kYi7wmTCQhhsh04qBpFQPwGmgMNpsIDjvf4uwinphRp9l0SWz/QS5YQQaz0abGKvjGM6XRbFs4=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB4546.eurprd08.prod.outlook.com (2603:10a6:208:148::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Thu, 14 May
 2020 06:31:12 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.3000.022; Thu, 14 May 2020
 06:31:12 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "denis@denix.org" <denis@denix.org>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@ti.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 2/2] trusted-firmware-a: provide symlinks for canonical names
Thread-Topic: [meta-arm] [PATCH 2/2] trusted-firmware-a: provide symlinks for
 canonical names
Thread-Index: AQHWKYKy65/IOiDEk06EvZpgFn1y/ainH1MA
Date: Thu, 14 May 2020 06:31:12 +0000
Message-ID: 
 <AM0PR08MB398712FE6B488D0706753A8892BC0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <1589414400-5413-1-git-send-email-denis@denix.org>
 <1589414400-5413-2-git-send-email-denis@denix.org>
In-Reply-To: <1589414400-5413-2-git-send-email-denis@denix.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 1a3f4822-5ffc-4d0a-b91d-4a67858e29b8.0
x-checkrecipientchecked: true
Authentication-Results-Original: denix.org; dkim=none (message not signed)
 header.d=none;denix.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [94.5.236.244]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fcc6b547-4a9b-4b03-714e-08d7f7d06960
x-ms-traffictypediagnostic: AM0PR08MB4546:|VI1PR08MB5518:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB55185FCC0F1E8C2586054A0692BC0@VI1PR08MB5518.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
x-forefront-prvs: 040359335D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 hLVxZo7wvxjkyB8eEEy6YPgj4QZukclubXPQSC/oAbe7WDqrCuw5F7vUMqdqBzlOYsLjNFPxoU1tNDv4mu68Kv7OnCxJzwYSCfwNvVoPiGsFVu0NM1xX8BUPdOH1aMxQFazZd9c+21l9jJ2TvMdiHS8MZQQ8HrtymRhBDE2h/NCjsNXgN1kA3PqkQKkSM3siL37oTbysmS3hPL4vr5AJXgIZWEk2FGNLRy7zEHCMs/q0NbO4tG3lGRs0SKgA8xjsFUhPR5wZKL5ogxaAP4dUGfT9YC/sKo60BnP3XywyADgQp3JMCoUor8dMUdH/tB43IfiXK+YAVLzdGrBNpkQ9c/I6YNDt+TR/YLGdGbNGJERQDZeg+aXkMR7g4kTSkJKs1kTUSkKtHuv+M+NKOvzTj0JuVBvekZPx8KYPbesGdmaSobPw8zugKpHNG0RFc2ZE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(52536014)(4326008)(64756008)(55016002)(8676002)(316002)(5660300002)(478600001)(54906003)(33656002)(66446008)(66946007)(76116006)(9686003)(66556008)(66476007)(186003)(86362001)(110136005)(26005)(7696005)(71200400001)(6506007)(8936002)(2906002)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 5fBZzOIZws4DhxzcUfbQkywhbfKUnaY878yjkTtZh3Fjlh1BZ7QS/mWemWv4XW1FZ+dVrFmcwyTzjdeVcO7UNFkld9mE/YCWXdRlity/wEDthyUAV3U/PeiNa9vg0UkG4KqjCxfacIAW/dKqLqVlIf5KxpeaY8nD4DvyTrO4C/rUgBoxVtVAPEmaU+Wv6yINdM9tX9w/GzMykSNuhiRicsBRhX96c9A/2VztDPA9RtiA07kGT9o6FXb4zJxIACvEkPHw+r/RGVo3rrl9PT+liYKq34aEbIp0Ffn5FYgr+hdfn27PqLabQgvC82UC+myNxKlwzWAaaqxSbgJma22ifCT5tM9Qz/9DSACr9HBIFQX45ps5IJKv9AEjraOLXyuMDkN+O0EFRTsPp8Azu9yBUvMa45tRfjWf2rZhbjYbj7rR1XlI0WKRNsgQiqTOQQjol+7PlG9XMGwxCmPseJ2QhD3uzd03r2pNPyO+SAA7SpI=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4546
Original-Authentication-Results: denix.org; dkim=none (message not signed)
 header.d=none;denix.org; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966005)(70586007)(2906002)(336012)(86362001)(82310400002)(47076004)(82740400003)(81166007)(6506007)(5660300002)(8936002)(8676002)(33656002)(55016002)(52536014)(356005)(9686003)(186003)(316002)(54906003)(26005)(110136005)(53546011)(70206006)(7696005)(4326008)(478600001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8c4563b2-5c9c-415a-c33e-08d7f7d06568
X-Forefront-PRVS: 040359335D
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q8j6iIus2N/dC/eWm84b0Zv1ZD39P7LfhR7cur6s29/WGzlLNvuPcSl69cpFwLR4X3Yv/AUrxpouKUSwlriFQRd7Rtj55sBjC4FVNYnJe7HXId8OcRHA0gI3+XOrqIc/ID5QE20aWA6b8DTpMziywlogNAk5sTZ2AKPn4+p10frnQp7o+d03muxfyl8XShQFb9kXxdtuFfn2TxTG8Pof8coBwTqW2oth+KR20u64sEtWCDPHycdgiJstxRJ3a85e/Mkx9UwcUWfIFmCZ3PLlXMS6EHWh4RVFrLIdChiVYPUanU9c6e8mophjv11S9Uhis+SL4PlIUUOYQc/ZxUtMYZN1C/lhrQyWQo21qDW3Ba8od09T90oqdhBYroXg9LQGPefVhn/7eQt1+SUHq/TWBBOyItwe/ZItfHDWeeU6TIqgrUIF8Hu6iOrLL+h2hk0f45xtQloOhQQi1BphufM7K5zX1tL+W5y7ajxBXkJbguRe+qGhSiqZP1JOrKEY+y/BUMZMKgS9Tcsnhw4TYJUVbQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2020 06:31:18.9330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc6b547-4a9b-4b03-714e-08d7f7d06960
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5518
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The patch itself looks good to me but I haven't tested it (a.k.a build & ru=
n).

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Denys Dmytriyenko via lists.yoctoproject.org
> Sent: 14 May 2020 01:00
> To: meta-arm@lists.yoctoproject.org
> Cc: Denys Dmytriyenko <denys@ti.com>
> Subject: [meta-arm] [PATCH 2/2] trusted-firmware-a: provide symlinks for
> canonical names
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Some platforms expect canonical names, like bl31.bin, instead of bl31-
> <plat>.bin Provide symlinks for those as well.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc
> b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index 3ec8c2c..2b6cf0a 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -129,18 +129,21 @@ do_install() {
>              echo "Install $atfbin.bin"
>              install -m 0644 $BUILD_PLAT/$atfbin.bin \
>                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
> +            ln -sf $atfbin-${TFA_PLATFORM}.bin
> + ${D}/firmware/$atfbin.bin
>              processes=3D"1"
>          fi
>          if [ -f $BUILD_PLAT/$atfbin/$atfbin.elf ]; then
>              echo "Install $atfbin.elf"
>              install -m 0644 $BUILD_PLAT/$atfbin/$atfbin.elf \
>                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
> +            ln -sf $atfbin-${TFA_PLATFORM}.elf
> + ${D}/firmware/$atfbin.elf
>              processes=3D"1"
>          fi
>          if [ -f $BUILD_PLAT/$atfbin ]; then
>              echo "Install $atfbin"
>              install -m 0644 $BUILD_PLAT/$atfbin \
>                  ${D}/firmware/$atfbin-${TFA_PLATFORM}
> +            ln -sf $atfbin-${TFA_PLATFORM} ${D}/firmware/$atfbin
>              processes=3D"1"
>          fi
>=20
> --
> 2.7.4

