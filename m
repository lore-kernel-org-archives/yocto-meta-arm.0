Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.45])
 by mx.groups.io with SMTP id smtpd.web11.14030.1585322484668456456
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 08:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=8CfLL1Zy;
 spf=pass (domain: arm.com, ip: 40.107.21.45, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pO24dnLLkSmISLRz8UMsARI1Hp5rIBHMfWyBDh3eSCI=;
 b=8CfLL1ZyesWuieFBXBAzQRbYSeMzJL28Gc0WHkDM4bkAkSOt8t5HGzU0EBGg/NquPOYWulVErsb5wFC7DsqZbqRKgdM3PR6Tz6sxS+R3bOdB+Mifkxm5ZUNWLpmIsxyNjCrpB3X+LS75JFc+eBKbYrU8Z7ppv8kMyDdfYQF3Mfk=
Received: from AM6P192CA0103.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::44)
 by DB8PR08MB5177.eurprd08.prod.outlook.com (2603:10a6:10:e3::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Fri, 27 Mar
 2020 15:21:20 +0000
Received: from AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::2d) by AM6P192CA0103.outlook.office365.com
 (2603:10a6:209:8d::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend
 Transport; Fri, 27 Mar 2020 15:21:20 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT005.mail.protection.outlook.com (10.152.16.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 15:21:20 +0000
Received: ("Tessian outbound 66307db0259d:v48"); Fri, 27 Mar 2020 15:21:20 +0000
X-CR-MTA-TID: 64aa7808
Received: from a03bd53158f3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 23F873C9-9A03-4FBC-822C-9B0E16B5CEEB.1;
	Fri, 27 Mar 2020 15:21:15 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a03bd53158f3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 15:21:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNHtW/AKN4yToKZdpxsJzvafHUR1+NXwy6YGWiofWBuPWq1HaBNkda75iz4K6zZWY/Ux2E2Z4GnYgyAG5r5sE2A+4haIENKnMrKjTN4DyVZOSj/U7aaNvJwrEAX10F23DZWaA97uXvGSqT8+NdVUrTlhuBHmpyRfysy377hMrV39djfSajXM1MVNfEowvGZHE2ykgVhijsWorITo1vann3u/uUgGGlUbgYmUprZwMOMRaQeLhQWFV8I8dNTHRVa+kdGchGVNP3AnoTXvRmx332bLxgaiCNKqMwLA+Gt5Wz9tsGIZYzDwl+H8B0dLyZqy5qWk5CRucqagRm9fDx54qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pO24dnLLkSmISLRz8UMsARI1Hp5rIBHMfWyBDh3eSCI=;
 b=j5GJwW1bG00yEKqUhDsrrYr6k735QSMWtbh7dBOCBp1bUIEnxvxptHtbwj+kXKJeLEo5LEKMOzbNUXwt+5pMNXrMrcS95SWUxyu344dz8Bg+8Cn0sOvXTEpXrpM5SZsqRaJcvHkPmXxRRgUFrgtCKKSDX6Wn65tjQb/Pi5/JG/UIiz2wRxew87YPKCRkH4nrB0H2n8ETfoKyPs232nqh3UchI1rGBJtuJqiTf6DSJ0cGEthcMXFK2p5hK+4JNKx8BbUSeIK2Kz44eC2j2xM3K3aw0ELuSUyPo+b2UyYhbaE/d74Hy0owDsg1xJaWqlz8s4kZuASyWn4BS07Xw6EU5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pO24dnLLkSmISLRz8UMsARI1Hp5rIBHMfWyBDh3eSCI=;
 b=8CfLL1ZyesWuieFBXBAzQRbYSeMzJL28Gc0WHkDM4bkAkSOt8t5HGzU0EBGg/NquPOYWulVErsb5wFC7DsqZbqRKgdM3PR6Tz6sxS+R3bOdB+Mifkxm5ZUNWLpmIsxyNjCrpB3X+LS75JFc+eBKbYrU8Z7ppv8kMyDdfYQF3Mfk=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB3650.eurprd08.prod.outlook.com (20.177.108.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Fri, 27 Mar 2020 15:21:13 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 15:21:13 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 2/7] arm-autonomy: Create arm-autonomy-host feature
Thread-Topic: [meta-arm] [PATCH 2/7] arm-autonomy: Create arm-autonomy-host
 feature
Thread-Index: AQHWBCWbh1AuK09nuEyPCkSbIZOlw6hcjlAQ
Date: Fri, 27 Mar 2020 15:21:13 +0000
Message-ID: 
 <AM0PR08MB398786CB9F6C55692B754C6E92CC0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200327105010.400-1-bertrand.marquis@arm.com>
 <20200327105010.400-3-bertrand.marquis@arm.com>
In-Reply-To: <20200327105010.400-3-bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: da6a56cf-5868-4a4c-bf10-d55de0daaaeb.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [5.68.4.242]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 511efe4f-9983-476b-2e05-08d7d26280a8
x-ms-traffictypediagnostic: AM0PR08MB3650:|DB8PR08MB5177:
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB517745C95D73D6950AFD057792CC0@DB8PR08MB5177.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(9686003)(6916009)(478600001)(55236004)(6506007)(53546011)(81166006)(186003)(55016002)(86362001)(8936002)(5660300002)(7696005)(26005)(81156014)(76116006)(33656002)(66476007)(66556008)(52536014)(66946007)(64756008)(8676002)(71200400001)(4326008)(316002)(2906002)(66446008);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 iiV4e9iSwggPkonw4y+9gY048gF8mL9mv7bAA119I70xrn2Bp3H7oHXfhEUEjUbiACCAtAb05wg5WfgOr0qZaWWxHpk3qG32a1vxTy+vQHnVLLaf4m5C9zHsoS0KYm/ruG/sPxdU8Y+jlH8oXtffWuaKKK7ehH1FFtw0zaQctmTZ7Ris9lSC13HkBBHfckuUQMJ5U6IvrsJZnfbkHIua23kU6R0OMl4868ARgQadS4njWyisMw8wnKsT218Fv/ctti5yCVbVDumiof/es1wOuYEMksHnULnrt/0i4eQJ9CQtjPLmsFGKV7U/pg6FE7YpEx4k9PeMLc7AMBrcsX76ngpqy5jU85Je54YpwgkCsdzwcm04g/gIIrJNYVS2wMvVTKGxsAExk9IaqiI/znOk/E3yyjf3cIR5r8aryzQhXTPwb2eDOruftd8p9n1Wiqoii17iRWq/LJiDDBNNgE3CewXQkY4Nr185Ns/rF8gAkcrd5CanE7CQJ/OCQzP+OfU3txU/ExBlh0Y+/9RWUq9VWB175sG0sdHXjeHY2620d40WkbViG7uApzmpzUReiPQYctaHItJ06xysgh1AXXpXcEMZoFpS87W8YQxLYUVRCiiwKhPMBnAbgJnXdSJYwvSfvVIN2kf86AJ2pOuqrWyQ8A==
x-ms-exchange-antispam-messagedata: 
 nBEjNezv1gb+nGtOnfFZDlzSCE+vuBc+KsjxIdNwdPPLMSEaCMO/iMiNL5dskCg3bpXN6kxQbJ9NGCyxVmIWx2f8BvGsfJE02lwpPPKQvJSyyVjN+Pvz5x/kKecLPvXHg4DEc+4rmg4r7WZHxCGEcA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3650
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(39860400002)(346002)(396003)(136003)(376002)(46966005)(4326008)(33656002)(26005)(6916009)(8936002)(356004)(336012)(53546011)(316002)(47076004)(186003)(6506007)(86362001)(82740400003)(52536014)(36906005)(70206006)(81156014)(2906002)(8676002)(81166006)(7696005)(9686003)(478600001)(55016002)(26826003)(70586007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1dab94d5-d6a2-435d-1612-08d7d2627cad
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3WwtXC0FFh1Dga85E4W4URlbu2zFih6zD7EHaUgByHrzAVAodJOD+eHvLzlGwFkZrCSgR5OEDf5kTl5yP1y+xobygZqJLD3K51AUDtMwfLk5dPj4c44l03w/cZYZvAVc0UiK8KWLLRI4NHGMZGEEnnVOwRkvqiOXramEj16v2JqjeFl4CM/PAM2jre/4qAj3gykTt2j2OSkmUc9JSDJDzXUPUZBlumE4ALbN6itSjWIK18WIM1JrvNp2EjzNLlCTWbMJK3Z99MDWnfIAdzUD1DTlRBuqxHXyYPWW0cKt4WDn69tNFkfrKZHWhBpnEiXy97Q1bfmW3kCmSVxLR/Dz6tAiJUha8C77BzVMpFBdzwl8x5IICAycnFjAVPdnXuxg9tojBDzztV+0cFLTNPL4euXqzBPGbylRcBzK5lDw43/vlpWm3yR9PKhE1Wr9ysWc0iTtBinacWnH0qOp/aG3WLMltyEOX5ln8KMYr2xuR2qiAMqFKt7NNl6UNAExjfr9TfFc0g9Z88ok0sXnxDPp+ZlsLd6o7DFFzHrrGl7MAeJhze9ikhsaPAWqrcGVQXHVHCsuqu1DUYd63f7ahmDx5I5WCwMPJJL5qjWr9XvDaZeR/y7jgAOJ7JSkuO8lqa4BB8cqvaQGdu6T5vbh3XwVGgSg8ID2nGvpnuF9VSPGJjMl1j7FfbMQUMslG8o61ifxOTCfHd5hp9xecozGMUKyUw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 15:21:20.2777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 511efe4f-9983-476b-2e05-08d7d26280a8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5177
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Bertrand Marquis via Lists.Yoctoproject.Org
> Sent: 27 March 2020 10:50
> To: meta-arm@lists.yoctoproject.org
> Cc: nd <nd@arm.com>
> Subject: [meta-arm] [PATCH 2/7] arm-autonomy: Create arm-autonomy-host
> feature
>=20
> Create a new distribution feature to enable functionalities for autonomy =
host
> systems:
> - enable xen and ipv4 in distribution features
> - enable xen backend drivers in Linux kernel using a kmeta feature
>=20
> For the feature to work properly, create a class inherited when the layer=
 is
> included to enable required parameters
>=20
> Change-Id: Ia0cdaa2b69bc030515ea16d67c47fec6b1ea0897
> Issue-Id: SCM-767
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  meta-arm-autonomy/README.md                   |  5 +++
>  .../classes/arm-autonomy-features.bbclass     |  4 +++
>  .../conf/distro/include/arm-autonomy-host.inc |  5 +++
>  meta-arm-autonomy/conf/layer.conf             |  6 ++++
>  .../features/arm-autonomy/xen-host.cfg        | 35 +++++++++++++++++++
>  .../features/arm-autonomy/xen-host.scc        |  4 +++
>  .../recipes-kernel/linux/linux-%.bbappend     |  3 ++
>  .../linux/linux-arm-autonomy.inc              | 13 +++++++
>  8 files changed, 75 insertions(+)
>  create mode 100644 meta-arm-autonomy/classes/arm-autonomy-
> features.bbclass
>  create mode 100644 meta-arm-autonomy/conf/distro/include/arm-
> autonomy-host.inc
>  create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-
> autonomy-kmeta/features/arm-autonomy/xen-host.cfg
>  create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-
> autonomy-kmeta/features/arm-autonomy/xen-host.scc
>  create mode 100644 meta-arm-autonomy/recipes-kernel/linux/linux-
> %.bbappend
>  create mode 100644 meta-arm-autonomy/recipes-kernel/linux/linux-arm-
> autonomy.inc
>=20
> diff --git a/meta-arm-autonomy/README.md b/meta-arm-
> autonomy/README.md index f8a1404..1f80a05 100644
> --- a/meta-arm-autonomy/README.md
> +++ b/meta-arm-autonomy/README.md
> @@ -18,6 +18,11 @@ Distribution Features
>  ---------------------
>  This layer is adding the following Yocto DISTRO_FEATURES:
>=20
> +* arm-autonomy-host: this feature activates functionalities required to
> +build
> +  an autonomy host system. It is doing the following:
> +  - add 'xen' and 'ipv4' to DISTRO_FEATURES.
> +  - add xen backend drivers to linux kernel configuration.
> +
>  Bitbake variables
>  -----------------
>  Some recipes and classes in this layer are introducing variables which c=
an be
> diff --git a/meta-arm-autonomy/classes/arm-autonomy-features.bbclass
> b/meta-arm-autonomy/classes/arm-autonomy-features.bbclass
> new file mode 100644
> index 0000000..38441e4
> --- /dev/null
> +++ b/meta-arm-autonomy/classes/arm-autonomy-features.bbclass
> @@ -0,0 +1,4 @@
> +# Include arm-autonomy distro config files if the distro features are
> +set
> +
> +require ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host',
> +'${ARM_AUTONOMY_DISTRO_CFGDIR}/arm-autonomy-host.inc', '', d)}
> +
> diff --git a/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
> b/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
> new file mode 100644
> index 0000000..236fbe9
> --- /dev/null
> +++ b/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
> @@ -0,0 +1,5 @@
> +# This files is added when DISTRO_FEATURES contains arm-autonomy-host
> +
> +# We need to have xen and ipv4 activated DISTRO_FEATURES_append =3D " xe=
n
> +ipv4"
> +
> diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-
> autonomy/conf/layer.conf
> index 2dc24a2..19f24ad 100644
> --- a/meta-arm-autonomy/conf/layer.conf
> +++ b/meta-arm-autonomy/conf/layer.conf
> @@ -23,3 +23,9 @@ LAYERSERIES_COMPAT_meta-arm-autonomy =3D "zeus"
>  # otherwise the user will see a warning on each build.
>  SKIP_META_VIRT_SANITY_CHECK =3D "1"
>=20
> +# Directory of our distro config files
> +ARM_AUTONOMY_DISTRO_CFGDIR =3D "${LAYERDIR}/conf/distro/include/"
> +
> +# Add class to handle arm-autonomy distro extensions
> +USER_CLASSES_append =3D " arm-autonomy-features"
> +
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-
> kmeta/features/arm-autonomy/xen-host.cfg b/meta-arm-autonomy/recipes-
> kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg
> new file mode 100644
> index 0000000..2affab9
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-
> kmeta/features
> +++ /arm-autonomy/xen-host.cfg
> @@ -0,0 +1,35 @@
> +CONFIG_PARAVIRT=3Dy
> +CONFIG_XEN=3Dy
> +
> +CONFIG_BLOCK=3Dy
> +CONFIG_XEN_BLKDEV_BACKEND=3Dy
> +
> +CONFIG_SCSI=3Dy
> +CONFIG_TARGET_CORE=3Dy
> +CONFIG_XEN_SCSI_BACKEND=3Dy
> +
> +CONFIG_NET=3Dy
> +CONFIG_XEN_NETDEV_BACKEND=3Dy
> +
> +CONFIG_HVC_IRQ=3Dy
> +
> +CONFIG_HVC_XEN=3Dy
> +
> +CONFIG_WATCHDOG=3Dy
> +CONFIG_XEN_WDT=3Dy
> +
> +CONFIG_XEN_BALLOON=3Dy
> +
> +CONFIG_XEN_DEV_EVTCHN=3Dy
> +
> +CONFIG_XENFS=3Dy
> +CONFIG_XEN_COMPAT_XENFS=3Dy
> +
> +CONFIG_XEN_SYS_HYPERVISOR=3Dy
> +CONFIG_XEN_GNTDEV=3Dy
> +CONFIG_XEN_GRANT_DEV_ALLOC=3Dy
> +CONFIG_SWIOTLB_XEN=3Dy
> +
> +CONFIG_XEN_EFI=3Dy
> +CONFIG_XEN_AUTO_XLATE=3Dy
> +
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-
> kmeta/features/arm-autonomy/xen-host.scc b/meta-arm-autonomy/recipes-
> kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.scc
> new file mode 100644
> index 0000000..6fdbabc
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-
> kmeta/features
> +++ /arm-autonomy/xen-host.scc
> @@ -0,0 +1,4 @@
> +define KFEATURE_DESCRIPTION "Enable XEN Host Drivers on autonomy
> systems"
> +
> +kconf non-hardware xen-host.cfg
> +
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-%.bbappend
> b/meta-arm-autonomy/recipes-kernel/linux/linux-%.bbappend
> new file mode 100644
> index 0000000..add7042
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-kernel/linux/linux-%.bbappend
> @@ -0,0 +1,3 @@
> +# Add arm-autonomy kernel support
> +require linux-arm-autonomy.inc
> +
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.in=
c
> b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> new file mode 100644
> index 0000000..0332387
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> @@ -0,0 +1,13 @@
> +# Add arm-autonomy specific features to the kernel
> +
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}:"
> +
> +#
> +# arm-autonomy kmeta
> +#
> +SRC_URI_append =3D " file://arm-autonomy-kmeta;type=3Dkmeta;name=3Darm-
> autonomy-kmeta;destsuffix=3Darm-autonomy-kmeta"
> +
> +# Add xen host drivers to kernel if arm-autonomy-host is activated
> +KERNEL_FEATURES +=3D "${@bb.utils.contains('DISTRO_FEATURES', \
> +        'arm-autonomy-host', 'features/arm-autonomy/xen-host.scc', '', d=
)}"
> +
> --
> 2.17.1

