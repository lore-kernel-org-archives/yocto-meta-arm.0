Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.43])
 by mx.groups.io with SMTP id smtpd.web12.14358.1585322943419147464
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 08:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Gc8NmTkI;
 spf=pass (domain: arm.com, ip: 40.107.5.43, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEMgsLSMoaULpexcardK6NCayqnZuW0dt01r382A20Q=;
 b=Gc8NmTkIGPnYqffBDvEhPVf/RRIQCrRnKcPvl3x52zkrjr/zNgkBZM9RT/+Hy3Lu59dgOxyZklg4sn+HtR6EWWANOfgLyV9bJCp3qzJA2n9TpE4kIomuJUIUu6B9pHF4hxylE6SYqz3mIJltzaxHTKuUZnej6XKb1otzaAZwytE=
Received: from DB6PR0301CA0027.eurprd03.prod.outlook.com (2603:10a6:4:3e::37)
 by DB6PR08MB2662.eurprd08.prod.outlook.com (2603:10a6:6:24::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Fri, 27 Mar
 2020 15:28:59 +0000
Received: from DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::11) by DB6PR0301CA0027.outlook.office365.com
 (2603:10a6:4:3e::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19 via Frontend
 Transport; Fri, 27 Mar 2020 15:28:59 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT010.mail.protection.outlook.com (10.152.20.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 15:28:59 +0000
Received: ("Tessian outbound e13acb17570e:v48"); Fri, 27 Mar 2020 15:28:59 +0000
X-CR-MTA-TID: 64aa7808
Received: from 2f37c98b8011.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FF1EFD3C-E944-4EF1-A1D7-9C00F786BA34.1;
	Fri, 27 Mar 2020 15:28:54 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2f37c98b8011.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 15:28:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VuaMmnOJidWBeSv2vcUnAqVNzhdgHIM0GfqbeCw3PytPhCnjUof6ImX62IXhj//oAvIpsGsYEDS6f/8TqilTZOfepJxc4CJhYLmCRfaU44w8+PTECXS5bUaoJgOoicdD983A8GEG8KACMixjreNGv4rwwrutO5EMTmdRyo3eEDWxw7rBQfuD7lvHqDKAvaWAtowC1pO4IudW80R418+j2oy0+Fnlkpcm0P0DyCmevP+SVPGHqQcgEdfVpXkVPFPvDYMS96KsMTDTluxVp615FggT10JFNd1J5ddlNbBt1FDhBoLq19Tb54IghRcYFWR2/ij2OtUq2XHwQlzDC+Pj+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEMgsLSMoaULpexcardK6NCayqnZuW0dt01r382A20Q=;
 b=cGG2zFKm3csNRH8hgxkxmXTZ8kWrUsCwbi/T0D+dN4gbCynfQQV97rSm3zK2U9u0mGfxPSPo6MWEerDuWppR9PBrFbjzizNheNrWYWLzb5H6KR23vnGAOHqsIrX2EFEpwaL31WjKubMYSPPSoC0AaIRIv4YwewNfAh8DC7jRtijok9d2oZcuIg8B+70myGjdpTkxWon4RiALaJ32CF6kE6B7jEkb+E2N7D6ltU2crgPsQ477YxpPM4nBBCUMVvgaqUWw6P/U/fMPo+omwdidfeqHMj5uz2LBjht8M49IXNuzyos2xj8Iv+eHXaRXIE2Cp1DgzrOiu8rMdZoCn2w8QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEMgsLSMoaULpexcardK6NCayqnZuW0dt01r382A20Q=;
 b=Gc8NmTkIGPnYqffBDvEhPVf/RRIQCrRnKcPvl3x52zkrjr/zNgkBZM9RT/+Hy3Lu59dgOxyZklg4sn+HtR6EWWANOfgLyV9bJCp3qzJA2n9TpE4kIomuJUIUu6B9pHF4hxylE6SYqz3mIJltzaxHTKuUZnej6XKb1otzaAZwytE=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB5393.eurprd08.prod.outlook.com (52.132.215.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 27 Mar 2020 15:28:54 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 15:28:54 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 6/7] arm-autonomy: Create xenguest-image-extra class
Thread-Topic: [meta-arm] [PATCH 6/7] arm-autonomy: Create xenguest-image-extra
 class
Thread-Index: AQHWBCX8+TLFSSzkxEChNbXzspdcmqhckHVg
Date: Fri, 27 Mar 2020 15:28:53 +0000
Message-ID: 
 <AM0PR08MB3987D4BF5D214C29F91811C692CC0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200327105223.460-1-bertrand.marquis@arm.com>
 <20200327105223.460-7-bertrand.marquis@arm.com>
In-Reply-To: <20200327105223.460-7-bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 8c03b5a9-7520-44e6-92e4-df42f343ceaa.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [5.68.4.242]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 42894804-7516-4845-618c-08d7d263928a
x-ms-traffictypediagnostic: AM0PR08MB5393:|DB6PR08MB2662:
X-Microsoft-Antispam-PRVS: 
	<DB6PR08MB26620432F0337DD4D192CA9392CC0@DB6PR08MB2662.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(66946007)(66476007)(55016002)(81166006)(52536014)(64756008)(9686003)(5660300002)(8676002)(2906002)(7696005)(66556008)(478600001)(81156014)(76116006)(26005)(55236004)(6916009)(66446008)(8936002)(4326008)(86362001)(186003)(71200400001)(316002)(33656002)(6506007)(53546011);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 biBcOW2KzZWBNNJwfSYMTtF1xKlA6C5c4K/mMqlvtlkM1fTtO3mUbTusYv6UpEvcAqEG8B6MyyDu5XJxsbMO4e1dE7FaNvlHgl28mGLyl+3Jm9NuJdSUaPEPxXgoDN0QvFz65CksOJthooOPpVT3Yhx4uAPaauWOPj641O8TcAqJEee40dkFYaaI8+verQYUvX4Ri8MdBSie7KL3cETJ55YGZ1/7rYug6QUjESlfOcksTTkjGg8XZDpiX6npi+FgYQN3jTRQbIPVJnJroSORA2Gqyb2ANKHf88zaKZ/vCvdo/l+STuGl9nXcGXzzMtlb81yNKmTVHFbvj08g2hQTHoc5n9yG0sEU2ti+EcyIMqdqR67ClI6BNySdyajEegz6m/yaHtVat3xzFYK68YdSWa5t5HhokKuYeqRI9ZJKKSTm76gOg8ZoTioylF0Mv5u1
x-ms-exchange-antispam-messagedata: 
 ehCOCY93ZtESBjQtuD9lgiMDpe0tW3Oi1tSW4lR7ULMF1aMXPVvaRl60r/qBcwQUDXcto9xncwcLtKojg2SGrD1lKrlhvxANWmh+fn94lMyMIC2o+9Yg8zTMog2ZjVQxV+1xdvmRRANCyc/HDFGCPg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5393
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(346002)(136003)(396003)(39860400002)(376002)(46966005)(86362001)(186003)(316002)(336012)(8936002)(70586007)(70206006)(81156014)(81166006)(8676002)(82740400003)(26005)(9686003)(52536014)(53546011)(6506007)(47076004)(6916009)(5660300002)(7696005)(26826003)(4326008)(478600001)(33656002)(2906002)(55016002)(356004);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1a1a1b4c-a1f7-4b94-15d0-08d7d2638f16
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rBX0tCmJIULBNdixczc9gf5TWws9ziJ3dbRk8ptKpo3EtoIHV6giD6Dj5buqud9KeDrmpb88KXqMk8Gj2Yhdunfjw+x68z/p38C0zFbQiDvu6CF9rvmRM8Nrt3ggqSainVX1teGXYegWyIwMrxoa017eo2VjzhflSosSeFZj6Ek+Ug6ymwZBAQC5+ZRDg+yG3gBh54Ev7Lu8ODb469W1f7CZHgXmiHKmUeTgzc96jVmNNzVbEjaZw4+9Oj7Q+XUJc+uCHKX5TN76mmgOoM7K9v5HWanaQclGYat7JXuU22gZRSHJyT7UZFN7WH8iQt6cbJZB76HAC/hrtmu/4qFvVaAFUClqOCM6PzM5ChsT+0OGGAHJ8lCbCl514ZRyd+/RVD8QX/aO93mr8H1K+W5yi4s5MYPK/fg1QrrzEMh9X7iYlr+REGS9VY0qph6VfxI4gBHqyW3ZMjR2pkdaGlQ4yzuFu7odQiSZGZad3+kmGAK/aLGdr2FF4QrTlFAJihAN0BWADHruYtScG33DXlOSgw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 15:28:59.8292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42894804-7516-4845-618c-08d7d263928a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2662
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Bertrand Marquis via Lists.Yoctoproject.Org
> Sent: 27 March 2020 10:52
> To: meta-arm@lists.yoctoproject.org
> Cc: nd <nd@arm.com>
> Subject: [meta-arm] [PATCH 6/7] arm-autonomy: Create xenguest-image-extra
> class
>=20
> Add class xenguest-image-extra to be used by recipes which wants to add
> elements to the generated xenguest image.
> The recipes using this call must inherit the deploy class and declare a d=
eploy
> task that will be extended by the class. The variables
> XENGUEST_EXTRA_* documented in the class can be used to define what
> should be used to extend the xenguest image.
>=20
> Change-Id: I8a7682a7a7ca57b424ea815145408ccb8e4348ca
> Issue-Id: SCM-767
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  .../classes/xenguest-image-extra.bbclass      | 102 ++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 meta-arm-autonomy/classes/xenguest-image-
> extra.bbclass
>=20
> diff --git a/meta-arm-autonomy/classes/xenguest-image-extra.bbclass
> b/meta-arm-autonomy/classes/xenguest-image-extra.bbclass
> new file mode 100644
> index 0000000..a5697e5
> --- /dev/null
> +++ b/meta-arm-autonomy/classes/xenguest-image-extra.bbclass
> @@ -0,0 +1,102 @@
> +# This class must be used to extend the xenguest image # It provides
> +variables to add init scripts, a dtb, xen files or disk files.
> +#
> +# The class is extending deploy function so you recipe must inherit
> +deploy and # have a do_deploy function (even if it is empty)
> +
> +# Use standard xenguest-image
> +inherit xenguest-image
> +
> +# Add a DTB file for the guest
> +# Only one file should be added, if this is set multiple times or in
> +several # recipes, the last recipe setting it will prevail.
> +XENGUEST_EXTRA_DTB ??=3D ""
> +
> +# Append something to the guest xen configuration # All files here will
> +be merged together in the final xen configuration # This can contain
> +several files or be used in several recipes XENGUEST_EXTRA_XENCONFIG
> +??=3D ""
> +
> +# Add a xenguest init, init-pre or init-post script
> +XENGUEST_EXTRA_INIT_PRE ??=3D ""
> +XENGUEST_EXTRA_INIT ??=3D ""
> +XENGUEST_EXTRA_INIT_POST ??=3D ""
> +
> +# Add xenguest files, (to be used in extra xen config for example) #
> +several files may be added, space separated, the path will be kept on
> +the # generated xenguest image (if dir1/file1 is added, it can be used
> +as # dir1/file1 file in the xen configuration).
> +XENGUEST_EXTRA_FILES ??=3D ""
> +
> +# Add xenguest disk files (to be used as disk partition content) #
> +several files may be added, space separated, the path will be kept on
> +the # generated xenguest image (if dir1/file1 is added, it can be used
> +as # dir1/file1 file in the disk content parameters).
> +XENGUEST_EXTRA_DISK_FILES ??=3D ""
> +
> +do_deploy_append() {
> +    if [ -z "${XENGUEST_IMAGE_DEPLOY_DIR}" -o \
> +        -z "${XENGUEST_IMAGE_DEPLOY_SUBDIR}" ]; then
> +        die "Configuration error: XENGUEST_IMAGE_DEPLOY_DIR or
> XENGUEST_IMAGE_DEPLOY_SUBDIR is empty"
> +    fi
> +    rm -rf
> ${XENGUEST_IMAGE_DEPLOY_DIR}/${XENGUEST_IMAGE_DEPLOY_SUBDIR}
> +    mkdir -p
> +${XENGUEST_IMAGE_DEPLOY_DIR}/${XENGUEST_IMAGE_DEPLOY_SUBDIR}
> +
> +    if [ -n "${XENGUEST_EXTRA_DTB}" ]; then
> +        if [ ! -f ${XENGUEST_EXTRA_DTB} ]; then
> +            die "xenguest-image: DTB file ${XENGUEST_EXTRA_DTB} does not
> exist"
> +        fi
> +        call_xenguest_mkimage partial --xen-device-
> tree=3D${XENGUEST_EXTRA_DTB}
> +    fi
> +
> +    if [ -n "${XENGUEST_EXTRA_XENCONFIG}" ]; then
> +        for f in ${XENGUEST_EXTRA_XENCONFIG}; do
> +            if [ ! -f $f ]; then
> +                die "xenguest-image: Xen config $f does not exist"
> +            fi
> +            call_xenguest_mkimage partial --xen-append=3D$f
> +        done
> +    fi
> +
> +    if [ -n "${XENGUEST_EXTRA_INIT_PRE}" ]; then
> +        if [ ! -f ${XENGUEST_EXTRA_INIT_PRE} ]; then
> +            die "xenguest-image: Init script ${XENGUEST_EXTRA_INIT_PRE} =
does
> not exist"
> +        fi
> +        call_xenguest_mkimage partial --init-pre=3D${XENGUEST_EXTRA_INIT=
_PRE}
> +    fi
> +
> +    if [ -n "${XENGUEST_EXTRA_INIT}" ]; then
> +        if [ ! -f ${XENGUEST_EXTRA_INIT} ]; then
> +            die "xenguest-image: Init script ${XENGUEST_EXTRA_INIT} does=
 not
> exist"
> +        fi
> +        call_xenguest_mkimage partial --init-script=3D${XENGUEST_EXTRA_I=
NIT}
> +    fi
> +
> +    if [ -n "${XENGUEST_EXTRA_INIT_POST}" ]; then
> +        if [ ! -f ${XENGUEST_EXTRA_INIT_POST} ]; then
> +            die "xenguest-image: Init script ${XENGUEST_EXTRA_INIT_POST}=
 does
> not exist"
> +        fi
> +        call_xenguest_mkimage partial --init-
> post=3D${XENGUEST_EXTRA_INIT_POST}
> +    fi
> +
> +    if [ -n "${XENGUEST_EXTRA_FILES}" ]; then
> +        for f in ${XENGUEST_EXTRA_FILES}; do
> +            if [ ! -f $f ]; then
> +                die "xenguest-image: Xen file $file does not exist"
> +            fi
> +            call_xenguest_mkimage partial --disk-add-file=3D$file
> +        done
> +    fi
> +
> +    if [ -n "${XENGUEST_EXTRA_DISK_FILES}" ]; then
> +        for f in ${XENGUEST_EXTRA_DISK_FILES}; do
> +            if [ ! -f $f ]; then
> +                die "xenguest-image: Disk file $f does not exist"
> +            fi
> +            call_xenguest_mkimage partial --disk-add-file=3D$f
> +        done
> +    fi
> +}
> +# Need to have xenguest-image tool
> +do_deploy[depends] +=3D "xenguest-base-image:do_deploy"
> +
> --
> 2.17.1

