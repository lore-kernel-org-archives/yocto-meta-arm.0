Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.66])
 by mx.groups.io with SMTP id smtpd.web11.14060.1585322551309999742
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 08:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=A3FbgcLc;
 spf=pass (domain: arm.com, ip: 40.107.20.66, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQZnU5c6atRR3cGgNezA2KYFC/91m2SosyoDbh3nIPg=;
 b=A3FbgcLc9jlvsaM8TTAEDVhYEEqNYi+dAbu7VIr26c/5VaXcKsj+HwZn9rE8P4P3mXfgrMSuHLrV2N32jMfiW4B8RCCeaWDPUZpp0gf4VWjHbORPDL/vxpXipVNVk96L+4KteJx//C4xlQ+RWJQC3dxSr6f0nKPKt79FGSfLH5I=
Received: from AM7PR02CA0008.eurprd02.prod.outlook.com (2603:10a6:20b:100::18)
 by HE1PR0802MB2505.eurprd08.prod.outlook.com (2603:10a6:3:df::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18; Fri, 27 Mar
 2020 15:22:28 +0000
Received: from VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::41) by AM7PR02CA0008.outlook.office365.com
 (2603:10a6:20b:100::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend
 Transport; Fri, 27 Mar 2020 15:22:28 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT029.mail.protection.outlook.com (10.152.18.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 15:22:28 +0000
Received: ("Tessian outbound 66307db0259d:v48"); Fri, 27 Mar 2020 15:22:28 +0000
X-CR-MTA-TID: 64aa7808
Received: from 2d433979ba9f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4D506876-6F60-4C39-AE4B-49F5D949356D.1;
	Fri, 27 Mar 2020 15:22:23 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2d433979ba9f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 15:22:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6YqGQWzt5KfUESrHvk4FAPTkngsJyZM1eEB4/TYRpIExiMIeBbd3QVHgN6nSxmYwYCX/wWT5YTGLpfJh4XtlwddDVBo77B6wAG47E7sl8sI3Jqmki5dhe8/1oaReFF4a7Fs4ZVxw5Ey/oK2lzzsu6ZF5uJqnWqGGKYZ+tEiHjlnNfla90IpUxR+RA/4yABf1ux3teCpr9mWy73ZhwAN16kG3nJTepmYZJCRNXtCbogSuJvIjSnzpJqNokYN/A6SFxLOB2Oc4vTUwYqp2tcf92FrKsdGsIzzBRU8aghtcdfnfg5gWS1NMOmr57+S/ChJLw43VfBwJAGcrXFD9YwoLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQZnU5c6atRR3cGgNezA2KYFC/91m2SosyoDbh3nIPg=;
 b=hfGPfN4I3W8pDB/KBQy3RJQs+o2yRVsvf5isETCdRKyYY/7ZlroYssIYRw/SxWCps1w5nf3XSJfR66ZNqWiuYipoM+nPZ5WyZpOq5xQgxn/DkXs0LB/gyYRzqrUgTrjl7UGS3DlScgGZCWuCv6xGmuJciNh40H2gFP1KwxMxg+fR0K6llOHUQihIg1qf3olCOIaRzDJibjg158jGUfurHmyiXrhVDwrbEF9WHnjkdUkhOWgvDoTrY7CJOU73QVLX+4BM4URl99syjR/BVUAxF5cIgK9YQCKep1OoprNdmLO2X6ROPaLLDwxRjJpIcsw8p6hAhrzsuPxZJpwiVvYdZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQZnU5c6atRR3cGgNezA2KYFC/91m2SosyoDbh3nIPg=;
 b=A3FbgcLc9jlvsaM8TTAEDVhYEEqNYi+dAbu7VIr26c/5VaXcKsj+HwZn9rE8P4P3mXfgrMSuHLrV2N32jMfiW4B8RCCeaWDPUZpp0gf4VWjHbORPDL/vxpXipVNVk96L+4KteJx//C4xlQ+RWJQC3dxSr6f0nKPKt79FGSfLH5I=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB3650.eurprd08.prod.outlook.com (20.177.108.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Fri, 27 Mar 2020 15:22:22 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 15:22:22 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 4/7] arm-autonomy: Create arm-autonomy-guest feature
Thread-Topic: [meta-arm] [PATCH 4/7] arm-autonomy: Create arm-autonomy-guest
 feature
Thread-Index: AQHWBCWdGofgjfna70iCDoOhtEjxxqhcjpfA
Date: Fri, 27 Mar 2020 15:22:22 +0000
Message-ID: 
 <AM0PR08MB3987E6128A1F060007C73FD692CC0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200327105010.400-1-bertrand.marquis@arm.com>
 <20200327105010.400-5-bertrand.marquis@arm.com>
In-Reply-To: <20200327105010.400-5-bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 97758899-8926-4af5-af04-9371cb0dc4a3.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [5.68.4.242]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 61b7980f-ba5e-4af1-5ebc-08d7d262a94e
x-ms-traffictypediagnostic: AM0PR08MB3650:|HE1PR0802MB2505:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB25056A285518EB7032900ABA92CC0@HE1PR0802MB2505.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(9686003)(6916009)(478600001)(55236004)(6506007)(53546011)(81166006)(186003)(55016002)(86362001)(8936002)(5660300002)(7696005)(26005)(81156014)(76116006)(33656002)(66476007)(66556008)(52536014)(66946007)(64756008)(8676002)(71200400001)(4326008)(316002)(2906002)(66446008);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 TeyT86bfBS12nO3cpM2yV6LnIXIIFuUwEMjuvqV1lUdWYdeYJcASwWuy8Ih2+ZlDbuRItuDc7MKHNDcyptv5DD1AxSiDMD+9qhDOYdO/2og9yi9MYeXwK/7Uh9rBu4ri4/8ak1n9ZE4zBmsj5gWeEk/UGAGhIx1sZgvaRMFuC+Z4p7WfwXT9h/X2zyJXqnuZ1lssmSNVxcJyI101h4vTt44GuE70mMTQUU2TWaO7sDLOw7r+DocfR73eorhtOsw+XreKRA5IV32KuzAxkBmX/TcX+ymvaZPaX0q+TRqwxr2EPSaml3EiSmeaAWZw5nBJ56LckqTmjKdVbPMGpCxlk02fmLF5mgG9dM4YZixdsGXzIh2wsKizQIpGudiT3YJCqKnygXZ/uVKv6ACm5WRPEaVChWLw81AOorgDKPCt5yMVihNBWXFJwRjmNrkqMGqFHQuC1KfEnU8Z9MbD6PuDWh6K8BD3w1W7kCfzE1Q+w3fCxKdmJI8K9vUJMNJZYCRzTwUtRDx9ML+ttrN2c95miiBHHaOJ9HR9xnZ/hZ6IsQ2kh5SsotMJs2UycBh9PelyEpSDlVQNgeN19FA766IeMOVBFN3yCeo1ibOU9Qeuq6X1ScbuCjAnzCa69WYG+o6a
x-ms-exchange-antispam-messagedata: 
 vkcS7qyG4IFqtRaovOpMwbooCd0NzUF+9W/c70xET6hS5ee3aGhc2T64WAiyek5X1ehNWUkBIVsu9psj1yfNXpoYQPp6vNq3uMrIdBMS/dYqg13wL+eORb12JCn5fwHZobI5I4HvfJYShUIbUCItzw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3650
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(376002)(346002)(39860400002)(136003)(396003)(46966005)(356004)(36906005)(81156014)(81166006)(9686003)(8676002)(55016002)(26005)(70586007)(33656002)(186003)(52536014)(26826003)(47076004)(336012)(5660300002)(6916009)(478600001)(53546011)(8936002)(86362001)(70206006)(6506007)(82740400003)(316002)(7696005)(2906002)(4326008);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a29a07c3-667d-4618-bdb6-08d7d262a5ae
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fU+K7eaDPVlkfxKuYVxyhKCA3YBM44F8F+VAZxiNDMjE4f0yTKoriSxgLeTuPtqsinI85vuCcrWt1F9KghAfLDnR89iQ0tTNEpbT62ahfsubgG5ZOehB0+KRQm13F2HwWLwMur+BBzwjQKK6TsJ3321rCTeLRAXvN9J/yM6QlYHN4UwxMXWOjR2BBC51cxHqv2NGg9EjFQfBj+03SlZRqyzzVwOhYctvMR9QKYwKjPVxRnODdZdDmQzkIVO2AmDJbBI5LrtvGg9eJOdTNpbj4ukYEq3rO2/UEemOxU5H48fX/VNs5XXq8iyJtYyUmhen458P51j5Mvn1bA2P19PsFr/EL8h52O2bZJUKBSMEQvy5RDTOiZMoSIIGUuErqhn4/dVqSNvLDFW2aT3dtin0DnCLhQ469oo53g6mFVuFMcMNnvDmY83p2V8eb7aONWC8Lrf+NmcsyTonvssKpjcIyqeqvw8K2dPF5Voq1iYs+EYjsdVDIcx33BEyrIpZ9Jz8gI8XN+CQrxfLF2hM9M2wcyHKkIAh8H/wrH+wjMWOqaOLi/Ivs8bFJlC27FeQzJf01vA+clmEFrwhNSKi9cUJu0YyRVQ2aM+GY2cEQVvQfKKHJ8yNAEVmttAakqRIruwHmglhnHX7qMXix5rUU7eZ63A7+Msc8Y0hUyzhEB88X/00aOy6r9XjgYdZ6A9zvFwtnFz+YzwOXauktf7i2GN0Lw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 15:22:28.4257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b7980f-ba5e-4af1-5ebc-08d7d262a94e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2505
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Bertrand Marquis via Lists.Yoctoproject.Org
> Sent: 27 March 2020 10:50
> To: meta-arm@lists.yoctoproject.org
> Cc: nd <nd@arm.com>
> Subject: [meta-arm] [PATCH 4/7] arm-autonomy: Create arm-autonomy-guest
> feature
>=20
> Introduce DISTRO_FEATURE arm-autonomy-guest which is:
> - enabling ipv4 in distro features
> - enabling xen frontend driver in the linux kernel using a kernel feature
> - enabling console over hvc0
>=20
> Change-Id: Idd9a708799b35e483dbba22279ce677d9674ef09
> Issue-Id: SCM-767
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  meta-arm-autonomy/README.md                   |  6 +++
>  .../classes/arm-autonomy-features.bbclass     |  1 +
>  .../distro/include/arm-autonomy-guest.inc     |  5 ++
>  .../sysvinit/sysvinit-inittab_2.%.bbappend    | 16 ++++++
>  .../features/arm-autonomy/xen-guest.cfg       | 54 +++++++++++++++++++
>  .../features/arm-autonomy/xen-guest.scc       |  4 ++
>  .../linux/linux-arm-autonomy.inc              |  3 ++
>  7 files changed, 89 insertions(+)
>  create mode 100644 meta-arm-autonomy/conf/distro/include/arm-
> autonomy-guest.inc
>  create mode 100644 meta-arm-autonomy/recipes-core/sysvinit/sysvinit-
> inittab_2.%.bbappend
>  create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-
> autonomy-kmeta/features/arm-autonomy/xen-guest.cfg
>  create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-
> autonomy-kmeta/features/arm-autonomy/xen-guest.scc
>=20
> diff --git a/meta-arm-autonomy/README.md b/meta-arm-
> autonomy/README.md index d0c6181..e5ad6ed 100644
> --- a/meta-arm-autonomy/README.md
> +++ b/meta-arm-autonomy/README.md
> @@ -23,6 +23,12 @@ This layer is adding the following Yocto
> DISTRO_FEATURES:
>    - add 'xen' and 'ipv4' to DISTRO_FEATURES.
>    - add xen backend drivers to linux kernel configuration.
>=20
> +* arm-autonomy-guest: this feature activates functionalities to run as
> +guest
> +  of an autonomy system. It is doing the following:
> +  - add 'ipv4' to DISTRO_FEATURES.
> +  - add xen frontend drivers to linux kernel configuration.
> +  - add console on hvc0 during init.
> +
>  Bitbake variables
>  -----------------
>  Some recipes and classes in this layer are introducing variables which c=
an be
> diff --git a/meta-arm-autonomy/classes/arm-autonomy-features.bbclass
> b/meta-arm-autonomy/classes/arm-autonomy-features.bbclass
> index 38441e4..15549d8 100644
> --- a/meta-arm-autonomy/classes/arm-autonomy-features.bbclass
> +++ b/meta-arm-autonomy/classes/arm-autonomy-features.bbclass
> @@ -1,4 +1,5 @@
>  # Include arm-autonomy distro config files if the distro features are se=
t
>=20
>  require ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host',
> '${ARM_AUTONOMY_DISTRO_CFGDIR}/arm-autonomy-host.inc', '', d)}
> +require ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-guest',
> +'${ARM_AUTONOMY_DISTRO_CFGDIR}/arm-autonomy-guest.inc', '', d)}
>=20
> diff --git a/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
> b/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
> new file mode 100644
> index 0000000..d961b40
> --- /dev/null
> +++ b/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
> @@ -0,0 +1,5 @@
> +# This files is added when DISTRO_FEATURES contains arm-autonomy-guest
> +
> +# We need to have ipv4 activated
> +DISTRO_FEATURES_append =3D " ipv4"
> +
> diff --git a/meta-arm-autonomy/recipes-core/sysvinit/sysvinit-
> inittab_2.%.bbappend b/meta-arm-autonomy/recipes-core/sysvinit/sysvinit-
> inittab_2.%.bbappend
> new file mode 100644
> index 0000000..7b0c647
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-core/sysvinit/sysvinit-inittab_2.%.bbapp
> +++ end
> @@ -0,0 +1,16 @@
> +# if arm-autonomy-guest is activated, we are running as a xen guest so
> +we must # have a console on hvc0 # This is normally done in
> +meta-virtualization if xen is activated but here # we don't have xen
> +activated.
> +#
> +
> +SYSVINIT_ADDHVC0 =3D "${@bb.utils.contains('DISTRO_FEATURES', \
> +    'arm-autonomy-guest', 'true', 'false', d)}"
> +
> +do_install_append() {
> +    if ${SYSVINIT_ADDHVC0}; then
> +        echo "" >> ${D}${sysconfdir}/inittab
> +        echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >> \
> +            ${D}${sysconfdir}/inittab
> +    fi
> +}
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-
> kmeta/features/arm-autonomy/xen-guest.cfg b/meta-arm-autonomy/recipes-
> kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.cfg
> new file mode 100644
> index 0000000..e4e44a9
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-
> kmeta/features
> +++ /arm-autonomy/xen-guest.cfg
> @@ -0,0 +1,54 @@
> +CONFIG_PARAVIRT=3Dy
> +CONFIG_XEN=3Dy
> +
> +CONFIG_BLOCK=3Dy
> +CONFIG_XEN_BLKDEV_FRONTEND=3Dy
> +
> +CONFIG_SCSI=3Dy
> +CONFIG_XEN_SCSI_FRONTEND=3Dy
> +
> +CONFIG_NET=3Dy
> +CONFIG_XEN_NETDEV_FRONTEND=3Dy
> +
> +CONFIG_INPUT=3Dy
> +CONFIG_INPUT_MISC=3Dy
> +CONFIG_INPUT_XEN_KBDDEV_FRONTEND=3Dy
> +
> +CONFIG_HVC_IRQ=3Dy
> +
> +CONFIG_HVC_XEN=3Dy
> +CONFIG_HVC_XEN_FRONTEND=3Dy
> +
> +CONFIG_WATCHDOG=3Dy
> +CONFIG_XEN_WDT=3Dy
> +
> +CONFIG_FB_SYS_FILLRECT=3Dy
> +CONFIG_FB_SYS_COPYAREA=3Dy
> +CONFIG_FB_SYS_IMAGEBLIT=3Dy
> +CONFIG_FB_SYS_FOPS=3Dy
> +CONFIG_FB_DEFERRED_IO=3Dy
> +CONFIG_XEN_FBDEV_FRONTEND=3Dy
> +
> +CONFIG_XEN_BALLOON=3Dy
> +
> +CONFIG_XEN_DEV_EVTCHN=3Dy
> +
> +CONFIG_XENFS=3Dy
> +CONFIG_XEN_COMPAT_XENFS=3Dy
> +
> +CONFIG_XEN_SYS_HYPERVISOR=3Dy
> +CONFIG_XEN_XENBUS_FRONTEND=3Dy
> +CONFIG_XEN_GNTDEV=3Dy
> +CONFIG_XEN_GRANT_DEV_ALLOC=3Dy
> +CONFIG_SWIOTLB_XEN=3Dy
> +
> +CONFIG_XEN_EFI=3Dy
> +CONFIG_XEN_AUTO_XLATE=3Dy
> +
> +CONFIG_DRM=3Dy
> +CONFIG_DRM_XEN=3Dy
> +CONFIG_DRM_XEN_FRONTEND=3Dy
> +
> +CONFIG_SOUND=3Dy
> +CONFIG_SND=3Dy
> +CONFIG_SND_XEN_FRONTEND=3Dy
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-
> kmeta/features/arm-autonomy/xen-guest.scc b/meta-arm-autonomy/recipes-
> kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.scc
> new file mode 100644
> index 0000000..935e78f
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-
> kmeta/features
> +++ /arm-autonomy/xen-guest.scc
> @@ -0,0 +1,4 @@
> +define KFEATURE_DESCRIPTION "Enable XEN Guest Frontend Drivers"
> +
> +kconf non-hardware xen-guest.cfg
> +
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.in=
c
> b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> index 0332387..b2245a5 100644
> --- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> +++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> @@ -11,3 +11,6 @@ SRC_URI_append =3D " file://arm-autonomy-
> kmeta;type=3Dkmeta;name=3Darm-autonomy-kmeta;
>  KERNEL_FEATURES +=3D "${@bb.utils.contains('DISTRO_FEATURES', \
>          'arm-autonomy-host', 'features/arm-autonomy/xen-host.scc', '', d=
)}"
>=20
> +# Add xen guest drivers to kernel if arm-autonomy-guest is activated
> +KERNEL_FEATURES +=3D "${@bb.utils.contains('DISTRO_FEATURES', \
> +        'arm-autonomy-guest', 'features/arm-autonomy/xen-guest.scc', '',=
 d)}"
> --
> 2.17.1

