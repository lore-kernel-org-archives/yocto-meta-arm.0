Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.44])
 by mx.groups.io with SMTP id smtpd.web11.11135.1596124569339775084
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 08:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=4dFbAZ0e;
 spf=pass (domain: arm.com, ip: 40.107.7.44, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zh018Hge7ccamjN+L/UJD2N9PSTaNXErp24M5bNV6cs=;
 b=4dFbAZ0eW1j1ewUmmBptTgs2jjK+dzErq5nUjjyEUr6Re+R071ghZAszQLW+EjEHTohg6Qe915WRA8OksGhnGPgC2oj0Vmx6mdkYke7BOTUEbkIsn5v53UimcRrt0mGpY2SGiGpZlXvjOfuR02n6wnnFDqm+GO7uqqjnVH5Sw7w=
Received: from AM6P194CA0074.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::15)
 by DB6PR0801MB1624.eurprd08.prod.outlook.com (2603:10a6:4:38::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 30 Jul
 2020 15:56:06 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::5b) by AM6P194CA0074.outlook.office365.com
 (2603:10a6:209:8f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Thu, 30 Jul 2020 15:56:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Thu, 30 Jul 2020 15:56:05 +0000
Received: ("Tessian outbound c4059ed8d7bf:v62"); Thu, 30 Jul 2020 15:56:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 30a667cf77e76d6b
X-CR-MTA-TID: 64aa7808
Received: from 3186ed4ce5d1.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B3FF178C-3F1C-44A5-8F43-D8E0888F1C0B.1;
	Thu, 30 Jul 2020 15:56:00 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3186ed4ce5d1.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Jul 2020 15:56:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUVVgKI6gaetMIDtDm2rJobd364zWjHvh9TSlmPcOCL0+Uhet57y2NiUUE0siXUOQXeioL86GxUrmZZ4VC0O4qYS+/xXP3WLy3FaBMoJr8tS+DKR7V5D+S8pNGy2ViI1kY1lVUslqMSGnhKBATOPAL6RkG3qJl6Obec9KXt8/ymlHXrPDizmen6jMSmHdEghv0O2SpbS+exCfUv+52XLm5daTkUSg9seXrpX6bJ9uIdDu0PgEne2jUKFG+YF1gB1BLbdN7HV9N5bEFVUiVA56TXhBOb+Niw/0jChLLqQ79HmxzSO1t6y7/7KDOW4vOjhoacXp28UmiYLeMX6Nx15xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zh018Hge7ccamjN+L/UJD2N9PSTaNXErp24M5bNV6cs=;
 b=OPy9c083qlYp9AqJgRbogSoPoGxiEUVxukC4oxLQvYcD5/uHi1OsEoYTXg5pjUb11oD2vApWBjbGsHj4ioU2UgvbhJ+C2Rk0aPaN4Mi31NI/BfR68gFaVQF30ylaWTSC1ffU+nTPbQWHQ7Sns7id+F8GBfDtQoP/7Mj3LeXdL5pzjgUmWSecd7pDMzef0Wc9dxOLyGclsLBS7EbrOxIZ1ILJSxoAMAYhDikcWAOefBRGgpAnLsUocnHAudZPj8mRzxNfmL+kW0oZCfaFxLOdfqR4jTxNQW/k4pD+hJboVz1FS0fXUj6P8x3R1JPXhEDkG/F99YPHyD9Ra6uS1cDMfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zh018Hge7ccamjN+L/UJD2N9PSTaNXErp24M5bNV6cs=;
 b=4dFbAZ0eW1j1ewUmmBptTgs2jjK+dzErq5nUjjyEUr6Re+R071ghZAszQLW+EjEHTohg6Qe915WRA8OksGhnGPgC2oj0Vmx6mdkYke7BOTUEbkIsn5v53UimcRrt0mGpY2SGiGpZlXvjOfuR02n6wnnFDqm+GO7uqqjnVH5Sw7w=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3035.eurprd08.prod.outlook.com (2603:10a6:5:1d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.19; Thu, 30 Jul
 2020 15:55:59 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3216.033; Thu, 30 Jul 2020
 15:55:59 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Diego Sueiro <Diego.Sueiro@arm.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] [PATCH 2/4] arm-autonomy/linux-arm-autonomy: Extend netfilter config for host
Thread-Topic: [meta-arm] [PATCH 2/4] arm-autonomy/linux-arm-autonomy: Extend
 netfilter config for host
Thread-Index: AQHWZomJNotpPGmk80S0FmUfUkzyAKkgRsEA
Date: Thu, 30 Jul 2020 15:55:59 +0000
Message-ID: <B89E8666-DA0A-410A-BF34-692FD21E7A42@arm.com>
References: <1596124338-106961-1-git-send-email-diego.sueiro@arm.com>
 <1596124338-106961-2-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1596124338-106961-2-git-send-email-diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c574f6d8-a445-424a-be9d-08d834a1117d
x-ms-traffictypediagnostic: DB7PR08MB3035:|DB6PR0801MB1624:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB16243198D3A9286350E381E79D710@DB6PR0801MB1624.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 EdVTTIMhPnMw267CSM+bxdV1PtqGt2i2g41dRYZ250PONC13vP/25Kc43cJLIr1BaHKYBZxt0UePiq3vk8M/xoubWeeJ4yNfaEi2CIeKgyfmTxsISYypBnF4UCIMQn26ZL4rixdvova+hf/SEFTLMc6zEEanyTGFOMR4Rs80RBxiF62FUGla2i6uHR+a5z8NdLBkeo1sFGCTOpoAxOvY/NuVttiecJ3DFna15hrQvSy2R5z9feTmSPwEZJk4do+hzXpj2R70EU5QzfhMuKohG6GPligrfevrzdImyr2tVP4lZA7nXk/bVOImiz8mEt2OYaWju+77Go9FEcz0o+baSGvcXbEJPfe4hCOPfez3PZvBkzsm/UsofQ36sMsAwAybYuz7CJdWY0I6lObCZ/9b/A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(6862004)(71200400001)(4326008)(478600001)(64756008)(66446008)(66556008)(2906002)(66476007)(83380400001)(966005)(33656002)(8936002)(66946007)(6512007)(186003)(86362001)(36756003)(26005)(76116006)(316002)(37006003)(6486002)(53546011)(5660300002)(6636002)(6506007)(8676002)(91956017)(54906003)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 Ld/yCWcoMRtIC3v2+ADN6ABJD7u+l9Uf60IzsBj8vNamxyqpcOGAmNhr5IOliFuBaDUwObaL3IvrmGzGLijXfYtjJYDauM/RFC2LbQ9G4KBw1AJUGdYIY9ccDq2LmxPKUFr7udVBVS/VZYcHPGMh2KkKjAReP69qc7q7SN8q5Y59gUnrBpsnPdq5aYyOQgnwJ1wobAg8nhLHsiGM/EJJ0lumS64Rp+x7VNLMAf1wxFWdkhmoHihjBfXIasxN+oiprWRB3PBAoHKkl7M3WfgZVsLGZ/z48YOoMZ9Bcvym5MFthqfZ++CSkf+d61aoDsuKzpOuShrBjDzayDe0y2N5b10A1hQyEqglVN1HakisX3d2fCpdT4zgOfPV+UZxcUhg5lT8t33HVqVTb7qMU9zUCQhPFfSv7HFdg5GOkgk7HlS24ghOOOmhF3pxisxRLcmUmWzMf5dDe/ni9BJvjeDdTz2t2E5y4GszGJ2jd08FOsAHUQGNTbINN+q9IyqeuJmr1OtOybIC8vyN2j7VzUFI4ni3dgSaPsmccnbZRV2Ze4I4mA+N7j0k3/po9LtZLC3T3XYvOa4EPNlEcv8Wtr/F72qEa5+e/i72Hv1NBcBFqwX37UMpejCqsSbKjl5LikcHG3VSvwuoku79JftHCeok9A==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3035
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ace0cd73-4f1e-4a3f-c9e7-08d834a10d8a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JePYHaKpF0T9tT0HFc0CE6XUrPStpp/uUikb+053yX/Hg7DHlBR/vUKwLhW2503TbbU2pJFvzvAe/uuijD50qecqOJgaBgcb81uXxKctEYDmywjN8pXF8cAGhD5wlYFpe0HAF3vG9wusvkRHkejIZbWWZhUvzqAN2WcrPHYJ+kuLDm7asXs97YHEg38jfnhYifUcrfTxVMiA/HbCl2z7qqDCEvtmxRlOJDJ2iJEhWleMBYkKOPvfoTLTO1KWzLmZ4cO2XSoZD0JW+y5xI8JVGodtH4eGOfWu8CBuNug+SzwA3TXGDN6jsh/Kzl/GUjTXS3NWcsS5Z+hochZFv/BAKgqYUEmlw8lGajWZ3wk3Yi1Vydl1nKPqyO0hKQEIiQF4JIzx/S+3LSrOqZ9u0uqoKtWp32jhTNSGcFInzuZn6HvOEofOEfYHokdcH8VMNI1Wlwx/Q/J0ST2mLxyvb1rZGs6udqxR9GxtHWW3gPtLH10=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(46966005)(6636002)(6862004)(36906005)(6486002)(336012)(82310400002)(8936002)(81166007)(316002)(6512007)(8676002)(47076004)(82740400003)(2616005)(6506007)(4326008)(966005)(26005)(83380400001)(54906003)(70586007)(70206006)(36756003)(37006003)(33656002)(53546011)(478600001)(86362001)(5660300002)(186003)(2906002)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 15:56:05.9648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c574f6d8-a445-424a-be9d-08d834a1117d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1624
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E9CC70BA96FE13489143349CD554979E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 30 Jul 2020, at 17:52, Diego Sueiro via lists.yoctoproject.org <diego=
.sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> To properly set the iptables rules to be applied when configuring the
> network between the host and guest we need to have the netfilter.scc
> kernel feature and following kernel extra kernel configs:
> CONFIG_NETFILTER_XT_MATCH_PHYSDEV=3Dm
> CONFIG_NETFILTER_XT_MATCH_COMMENT=3Dm
>=20
> Change-Id: I6f3ff9e8db5d359efba5fb3ead04703f4f2ec88b
> Issue-Id: SCM-1019
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> .../arm-autonomy-kmeta/features/arm-autonomy/netfilter-extra.cfg | 2 ++
> .../features/arm-autonomy/xen-host-iptables.scc                  | 9 +++=
++++++
> meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc    | 6 +++=
++-
> 3 files changed, 16 insertions(+), 1 deletion(-)
> create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-k=
meta/features/arm-autonomy/netfilter-extra.cfg
> create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-k=
meta/features/arm-autonomy/xen-host-iptables.scc
>=20
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/f=
eatures/arm-autonomy/netfilter-extra.cfg b/meta-arm-autonomy/recipes-kernel=
/linux/arm-autonomy-kmeta/features/arm-autonomy/netfilter-extra.cfg
> new file mode 100644
> index 0000000..1a57369
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features=
/arm-autonomy/netfilter-extra.cfg
> @@ -0,0 +1,2 @@
> +CONFIG_NETFILTER_XT_MATCH_PHYSDEV=3Dm
> +CONFIG_NETFILTER_XT_MATCH_COMMENT=3Dm
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/f=
eatures/arm-autonomy/xen-host-iptables.scc b/meta-arm-autonomy/recipes-kern=
el/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host-iptables.scc
> new file mode 100644
> index 0000000..8f8ba45
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features=
/arm-autonomy/xen-host-iptables.scc
> @@ -0,0 +1,9 @@
> +#
> +# Not directly sourced via a kernel type but via an external bb
> +#
> +
> +define KFEATURE_DESCRIPTION "Enable netfilter + conn tracking + extras"
> +define KFEATURE_COMPATIBILITY all
> +
> +include features/netfilter/netfilter.scc
> +kconf non-hardware netfilter-extra.cfg
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.i=
nc b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> index 2763444..5f55d9b 100644
> --- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> +++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> @@ -10,7 +10,11 @@ SRC_URI_append =3D " file://arm-autonomy-kmeta;type=
=3Dkmeta;name=3Darm-autonomy-kmeta;
>=20
> # Add xen host drivers to kernel if arm-autonomy-host is activated
> KERNEL_FEATURES +=3D "${@bb.utils.contains('DISTRO_FEATURES', \
> -        'arm-autonomy-host', 'features/arm-autonomy/xen-host.scc', '', =
d)}"
> +        'arm-autonomy-host', \
> +        'features/arm-autonomy/xen-host.scc \
> +         features/arm-autonomy/xen-host-iptables.scc', \
> +        '', d)}"
> +
>=20
> # Add xen guest drivers to kernel if arm-autonomy-guest is activated
> KERNEL_FEATURES +=3D "${@bb.utils.contains('DISTRO_FEATURES', \
> --=20
> 2.7.4
>=20
>=20

