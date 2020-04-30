Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.44])
 by mx.groups.io with SMTP id smtpd.web12.7928.1588256751279847888
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 07:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=gaR68iDQ;
 spf=pass (domain: arm.com, ip: 40.107.21.44, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ANGHtbZHM9PFzX0KsypDcBcRZy5PU/wjHTvX8bENww=;
 b=gaR68iDQYEmUXZMJme8UV7HizlYZA2nZQQ+tQ50OYimIaqvVIdYa2iz9Hpy4FWja/TWDCcmhkJgj01jXsaVONJrdQFynjfyTLMj/eIv2NxIPxQRbaY6vjn1Ewi/jhGS3BzJ79ZqYp7ON/v1mQjr/E9nSYqCYfs2k7BvSwcHNmi0=
Received: from DB8P191CA0026.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::36)
 by AM5SPR00MB239.eurprd08.prod.outlook.com (2603:10a6:203:7a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 30 Apr
 2020 14:25:48 +0000
Received: from DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::e3) by DB8P191CA0026.outlook.office365.com
 (2603:10a6:10:130::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Thu, 30 Apr 2020 14:25:48 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT053.mail.protection.outlook.com (10.152.21.119) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Thu, 30 Apr 2020 14:25:48 +0000
Received: ("Tessian outbound 11763d234d54:v54"); Thu, 30 Apr 2020 14:25:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8dbc7c99a936c8d9
X-CR-MTA-TID: 64aa7808
Received: from e293c7421d1b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7DB7630A-9195-4D64-8D18-79099810A61C.1;
	Thu, 30 Apr 2020 14:25:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e293c7421d1b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Apr 2020 14:25:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFJ/mscWiaBOsosmJHPIwmrPECpsJYcYdIeG1ZaG1c/DEe5ZDFA2nxNl3PiydA4qWuViBQ+uT2seRCyia1nzhpHmFzl5GcZrae3SGAjRtveyfr3s245WsOAHu2uqslPKhoxoSWSItPQ3hnzjXtLBox2zU63J7WOkNMPoPIZkUMPDfEpskfKJ+BjkJkzlH3kPx6VnFTQfCfJHCwlMluzjYjjd1KNPkR5gCmlcyGCZ/XceOzjG6KKbWiZFv1N0KGZwYO1RP3SeKGiVDjnz8G4K9gV8dMpvTiDZ3e0Tvxghd0F/liRJ4DXqdJCWoQSkbj8SkmokkiFIcuIaUb54gNyqhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ANGHtbZHM9PFzX0KsypDcBcRZy5PU/wjHTvX8bENww=;
 b=hs9Oj09HKjB4YS8HnXPd0qjhBxTM1yNevrli8v9ewlN1SW4ILr02NvbfsXeYtGt3gxr/AmlWrFoaDD27yK0nBNWC6LmLzrbFKwIyKy4IswBHPsXmT780feRin31rWBx1oJMSEX5wFoJX+uDFCYhbWBYJyjRaEq0k8FVT7ybau6ddT1RPYgSXqOPr8GYGYsI8hPEDLHrlFCZXyeOPYXD/yoa3GY+i319mpszvc+lSPrb/ZpAjMZ/YpmN26lgBzXHZQ7amgAMS3iO3fCI0ev48rvHZNHJn1CDDibq0Dg+8eOkbbq+e0AqZxFzE1cSLDPmbUNE9LSiCDdl12TCXFeUOuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ANGHtbZHM9PFzX0KsypDcBcRZy5PU/wjHTvX8bENww=;
 b=gaR68iDQYEmUXZMJme8UV7HizlYZA2nZQQ+tQ50OYimIaqvVIdYa2iz9Hpy4FWja/TWDCcmhkJgj01jXsaVONJrdQFynjfyTLMj/eIv2NxIPxQRbaY6vjn1Ewi/jhGS3BzJ79ZqYp7ON/v1mQjr/E9nSYqCYfs2k7BvSwcHNmi0=
Received: from VI1PR08MB3693.eurprd08.prod.outlook.com (2603:10a6:803:ba::25)
 by VI1PR08MB3551.eurprd08.prod.outlook.com (2603:10a6:803:79::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 30 Apr
 2020 14:25:42 +0000
Received: from VI1PR08MB3693.eurprd08.prod.outlook.com
 ([fe80::c892:51a9:6c7f:3926]) by VI1PR08MB3693.eurprd08.prod.outlook.com
 ([fe80::c892:51a9:6c7f:3926%7]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 14:25:42 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] [arm-autonomy] documentation: Update arm-autonomy-quickstart.md
Thread-Topic: [meta-arm] [PATCH] [arm-autonomy] documentation: Update
 arm-autonomy-quickstart.md
Thread-Index: AQHWHvKqQDgkPDlc302edYDx2NEMrqiRuI6A
Date: Thu, 30 Apr 2020 14:25:41 +0000
Message-ID: <1310D4EA-CBD8-477D-B66D-DF34B0A89CA1@arm.com>
References: <1588253029-52944-1-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1588253029-52944-1-git-send-email-diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a29a8165-4bda-447b-d2f1-08d7ed1260cf
x-ms-traffictypediagnostic: VI1PR08MB3551:|AM5SPR00MB239:
X-Microsoft-Antispam-PRVS: 
	<AM5SPR00MB23967706CE79242FE2341959DAA0@AM5SPR00MB239.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3631;OLM:3631;
x-forefront-prvs: 0389EDA07F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 fSMFHs5PaeeEbhgiFwarfOU3qQNIzV2VRtPbXL5Kf1xUEJ8F7dgsgUvFqD4goS+7t7CP25aovGHkybBACrEPfVadpQhXqASvF6HXcdZ0gujVrESomYD66PcVfg1F4JFCIf6rOrODUKpzY5WWyoqVNliCkLG4V9/qN2k48zJT/PXQOwMVbueM5pCQtNYE9kGoGzPPNOhcE9SsLFwJS7rN4Dbv8NrQrKR/SYEA/fbmz7fWjV/KXL0xhyT+clUGLwVDOrgIsUfBMD7EvVh6SjAOaY1hFiKAMr+ef3KVK7TMs4ICGbKBt20i/ml7WDhJ4NlWow9i7jCAIXV87h0H24uLhDXjwfIU7LX8uwutsL0eOST5o+c1pkyrZKim2n2HfKd4A07dpSbxFGBwnmZi7tuP0mqN5KTr2Fpga0ZTqatW6+5s43xdw9cp/DJWr4cflKdKZJeezK4ZKLqCO281Mz4OUoikS4lKDaHrhGzf28wcMlqTe9uu/cqy1Q+21pKIvXoyGb1j4tEzmLz61tl7vL+Aaw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3693.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(66446008)(64756008)(66946007)(966005)(6512007)(2616005)(6486002)(8676002)(6916009)(15650500001)(478600001)(2906002)(5660300002)(71200400001)(76116006)(26005)(33656002)(316002)(186003)(66556008)(66476007)(8936002)(53546011)(6506007)(91956017)(4326008)(86362001)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 kXD/vYtqp6nblM6Lk1JVWUj4Xq01elaNQPbCpsriHIuHanVWLpYOoCMdhrmSUig211jxE9m64jxcGsmazf2hDdLWsKxuemvigE5CHSPjixVJNo0AWIJgLNRt3rnQSMq+dXE0VIyVUOytLT/XLCRqLZknOcmyylC6RUoudyBSNuIS1nS+r03ifNkjmuVIy0PTqHj8vBUZeurCm38gyrU1J1KH/Y3DqH/TF5wCcbjVzDAleek1ta3P18a+spGASWqtpondOmSUDVlu4PNI5XPuMSLvVDdMQxtRm4efmwUM6HCv1xj/hqJJtvMp2v6CWKNSfy2RfRfqE2eCz2CZF7vxYtFygGOqICJ1wcHds17Wka5aMZ39TK3CWuoizlO0kVnND0N+wIKbINmzsKk520rwTnHN/kEVoJr1BrgeNw4p5W7UZYcX1WGhrJP25/J69rb0s8wd5vOC/Yj+9PFpUJPnl4xuTwsGfRUZB7nzXZ/w5Q2E57cycPZKNEBxFUWAe9dFhx8WHhcVbJFjjPN9sic7q8zhh+XKfe92RnTG40Oe1y8xHJd4qHzVWd37E7+9PRlsZGfjqZ51U1nBJ2fvSr9BZ/WtJIgBodifWMkyF3iXW7au9GAXFJ6I70qYE1OKFYRmpA1LCtIMAJkATqRcWUmBXoe6tSf/+vRqlmwYMm4tt82NunllWnglmucsMzAoHKOvTsgUWoz3xoqqIzJEXjKv6jsir7JKgYEU24Ej785zJ36upydox763dXJ8fcuzmMxq0ERh2q0SZoDGCMeaTbn8luOKqUtz8reoml8TVU/hNmA=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3551
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(46966005)(70206006)(53546011)(36756003)(966005)(6916009)(6486002)(70586007)(478600001)(316002)(5660300002)(6512007)(6506007)(2906002)(86362001)(356005)(2616005)(186003)(47076004)(26005)(82740400003)(15650500001)(8936002)(8676002)(336012)(82310400002)(81166007)(4326008)(33656002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ce427ac5-92e4-4b7e-5465-08d7ed125cef
X-Forefront-PRVS: 0389EDA07F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	34ZgrY4IvUupQN4EWnF3f2yoDhNAQbnyXty1RqQm5dTUyYHTWNFVeMaDIzzKW86HPrHiuM4Z/bJr5VTk4apQt9rVgSdxozzHYsJKhuXNw9Jd3l8in1dGsCoGSgLCHoe+iBTr6ciEkRcL3enIiWHfpB9H+q9CV803lRq0nncDpZMLqyr7qBvXYCY6eIK+gpEEsl2kacozLj8jvDTQm1u1f4gIkvdxThYS5GlexYZfWP6JiWo0oyS8rkntccfiIXbobkuyKjwA5V39ZtgvWOz0bvMWORPasso16fry+7baiZqGuLiAK55jmEFjJXufwVWGwLe1fs9IikJe8y4lNgSFuZLeijAG8tSd4+Sh/LUjXs9MdLI+y0fbyzRfTJB4L6Day8N0ndr/fBU1uuGFrF52Nj8zs0NiKMQu1mXpWKxzybWIMUPCYloX3XdOHf6ljbFJSqgzcnGc2faiXMeA4HUKsWzeYjTZfNsmMRm1cDXDDhao3fIa5cmBjQCpO0RTIcABYoawhqbjfO5XXxj2XTGMN0JFSOc/qx+aE+mv6NM7ei9KhG+3nkVv2eEMy5bVheEs34ROf3Y0gR0f3i7mf6FdzA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2020 14:25:48.5571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a29a8165-4bda-447b-d2f1-08d7ed1260cf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5SPR00MB239
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <89495566FB4AE54D82EC48473AA6A464@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 30 Apr 2020, at 14:23, Diego Sueiro via lists.yoctoproject.org <diego=
.sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> Suggest the usage of `bitbake-layers add-layer` command to add all
> dependant layers.
>=20
> Change-Id: I1f40f6218b2edc5267e04723c592c16a434f2e82
> Issue-Id: SCM-986
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> .../documentation/arm-autonomy-quickstart.md        | 21 +++++++++++++++=
+-----
> 1 file changed, 16 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md =
b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> index c688600..2a457c1 100644
> --- a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> +++ b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> @@ -45,12 +45,23 @@ Here are the main steps to create an arm-autonomy pr=
oject:
>   oe-init-build-env my-project
>   ```
>=20
> -2. edit the file `conf/bblayers.conf` and add `meta-arm/meta-arm-autono=
my`
> -  layer to the list of layers of your project. Also add any other layer=
s you
> +2. Add `meta-arm/meta-arm-autonomy` layer to the list of layers of your
> +  project in the `conf/bblayers.conf`. Also add any other layers you
>   might need (for example `meta-arm/meta-arm-bsp` and `meta-arm/meta-arm=
` to
> -  use Arm boards like Juno or FVP emulator).
> +  use Arm boards like Juno or FVP emulator). You can achieve this by us=
ing
> +  the `bitbake-layers add-layer layerdir [layerdir ...]` command.
>   For example:
>   ```
> +  export LAYERDIR_BASE=3D"/home/user/arm-autonomy/"
> +  bitbake-layers add-layer $LAYERDIR_BASE/meta-poky $LAYERDIR_BASE/meta=
-yocto-bsp \
> +   $LAYERDIR_BASE/meta-openembedded/meta-oe $LAYERDIR_BASE/meta-openemb=
edded/meta-python \
> +   $LAYERDIR_BASE/meta-openembedded/meta-filesystems $LAYERDIR_BASE/met=
a-openembedded/meta-networking \
> +   $LAYERDIR_BASE/meta-virtualization $LAYERDIR_BASE/meta-arm/meta-arm-=
autonomy \
> +   $LAYERDIR_BASE/meta-arm/meta-arm $LAYERDIR_BASE/meta-arm/meta-arm-bs=
p
> +  ```
> +
> +  Example of a `conf/bblayers.conf`:
> +  ```
>   BBLAYERS ?=3D " \
>     /home/user/arm-autonomy/poky/meta \
>     /home/user/arm-autonomy/poky/meta-poky \
> @@ -59,10 +70,10 @@ Here are the main steps to create an arm-autonomy pr=
oject:
>     /home/user/arm-autonomy/meta-openembedded/meta-python \
>     /home/user/arm-autonomy/meta-openembedded/meta-filesystems \
>     /home/user/arm-autonomy/meta-openembedded/meta-networking \
> -    /home/user/arm-autonomy/meta-arm/meta-arm \
> -    /home/user/arm-autonomy/meta-arm/meta-arm-bsp \
>     /home/user/arm-autonomy/meta-virtualization \
>     /home/user/arm-autonomy/meta-arm/meta-arm-autonomy \
> +    /home/user/arm-autonomy/meta-arm/meta-arm \
> +    /home/user/arm-autonomy/meta-arm/meta-arm-bsp \
>     "
>   ```
>=20
> --=20
> 2.7.4
>=20
>=20

