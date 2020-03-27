Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.62])
 by mx.groups.io with SMTP id smtpd.web12.14413.1585323035026309298
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 08:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=nS2Ls4no;
 spf=pass (domain: arm.com, ip: 40.107.20.62, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzT7drOge5/lssWmbxlqdflAcOa5jciYQvkqScMCkQc=;
 b=nS2Ls4no60qOLkXlXSHVJEMwUpiDpRaTAp2T2x58yr8sHGUnQUevn721XpzvY/DPFFTrKsO7L9/vMSIyvF4ci/1vaQdkiLOpN8oXOjs/kDFSwg/ZrFEjzq+Q4CfHbd0DS6O92ANt5o4aJvPfIEQ39BQkEcHIsGfAbJtqib+vJ7o=
Received: from AM6P193CA0128.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::33)
 by AM6PR08MB3078.eurprd08.prod.outlook.com (2603:10a6:209:46::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20; Fri, 27 Mar
 2020 15:30:32 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::fc) by AM6P193CA0128.outlook.office365.com
 (2603:10a6:209:85::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20 via Frontend
 Transport; Fri, 27 Mar 2020 15:30:32 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 15:30:32 +0000
Received: ("Tessian outbound 66307db0259d:v48"); Fri, 27 Mar 2020 15:30:32 +0000
X-CR-MTA-TID: 64aa7808
Received: from 81b7dd0288b9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F48D5815-967C-4DB8-8343-35995DE7F87B.1;
	Fri, 27 Mar 2020 15:30:27 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 81b7dd0288b9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 15:30:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brfAq9zddyx+/PiZrnqW/Ex5oYvwQCthDes6RcTfKBVOp0wbfGOB68EzLIdxV0X4+LUBYeHcQJa+2oa0VNFV7/PZICfZqd5JUw7wjfGdZn/vkcrZSJWzVetukREuF4CVyBNjBlvJ9TsTo8qyoAkkKf3GC/1elpFiIXYhnqbq40jpTSmj84nvHt0FbD10uMCRqWO4g7EJZq6giAUsvnF5teaAkN4Sk89IukJpv1inmQy788mb4S5Z3VrEFx25XBIv2vm1M04Urr6BcVaokPGAfKrOeuQrfFIaQ+EkI53c1U+fXp6Q5oUsOFtkxhXQ9kYGeya4d4YGaOrGdbBIjctxnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzT7drOge5/lssWmbxlqdflAcOa5jciYQvkqScMCkQc=;
 b=BSONwfDvW3kNLD+WIXgHY613EGiltF27LsjQcpgnDwEhqoZQZ/PwNkBm/WejblXhkM3sKiIQ/SNWnbCNwkG8+YY4/Ddfa7tRXR5BhECUgqP5WIC7krKuHd8UuZrMLqN7pfOyO/CGFGDcD2+/gLGFuuoDM2dzrze62jRLBFTOa5EZmmulQLDXFr0EimauWEV8Eb8v3b5LfZBkI9XwDW25pSF3u7GxrkfUiaD5pjTOFS7/lunNVGBblrMoj5yqch8yoIzsuty161SrLbaF463B2hiaD4/QhYbfulkBYN4DQ2IPvxN6EM04iUfaUbGnha7mBX5UoC/JXPLGK5sRGMaXhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzT7drOge5/lssWmbxlqdflAcOa5jciYQvkqScMCkQc=;
 b=nS2Ls4no60qOLkXlXSHVJEMwUpiDpRaTAp2T2x58yr8sHGUnQUevn721XpzvY/DPFFTrKsO7L9/vMSIyvF4ci/1vaQdkiLOpN8oXOjs/kDFSwg/ZrFEjzq+Q4CfHbd0DS6O92ANt5o4aJvPfIEQ39BQkEcHIsGfAbJtqib+vJ7o=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB5393.eurprd08.prod.outlook.com (52.132.215.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 27 Mar 2020 15:30:26 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 15:30:26 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 2/2] arm-autonomy: Create xenguest network bridge
Thread-Topic: [meta-arm] [PATCH 2/2] arm-autonomy: Create xenguest network
 bridge
Thread-Index: AQHWBCYbxHUYoNhm/Eu+yxdtWnP5XahckOCQ
Date: Fri, 27 Mar 2020 15:30:26 +0000
Message-ID: 
 <AM0PR08MB3987A7DB5027ADDCCAA4E22292CC0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200327105358.507-1-bertrand.marquis@arm.com>
 <20200327105358.507-3-bertrand.marquis@arm.com>
In-Reply-To: <20200327105358.507-3-bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: b7bc97dc-7713-4a68-ae98-d91e327f6411.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [5.68.4.242]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b480077e-afec-4b82-0120-08d7d263c99f
x-ms-traffictypediagnostic: AM0PR08MB5393:|AM6PR08MB3078:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB30784A97158F20FDD801E5CA92CC0@AM6PR08MB3078.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2089;OLM:2089;
x-forefront-prvs: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(66946007)(66476007)(55016002)(81166006)(52536014)(64756008)(9686003)(5660300002)(8676002)(2906002)(7696005)(66556008)(478600001)(81156014)(76116006)(26005)(30864003)(55236004)(6916009)(66446008)(8936002)(4326008)(86362001)(186003)(71200400001)(316002)(33656002)(6506007)(53546011);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 G7Zo3/v7wvkRXkMKPJZIC+EtyNpx7O3telA69FMtmzqveNmE9G068fo5zzdj+ig1Je75IDNYufaBo64XDgYq4YPFlaTODOHwYh2T8H/5evUG6e00rp5wfuqO0HmgX8AxpddsN1kI1FbDucoAY/PsRZH27ZtwpVzJBhwUrfYgoSwAZQbbYN41VRxTH9FQBIkGmoBaUGQzYGSf/HKfqO7WvrCA8opCKeebqyJz5ZVmMvHoGKtpiP2vosXL7w3/q1BljIQMyeN7lJYaB0hqMQlClP95v46ir+TvwdXgsuSAmCqk6EspGtrBmeNgLH+l2P1oYPifMirSKr8VedpjzW5a+4UpHA+Ohq2+K4zvkVo0KKlmowhFXoDQ/UIe+iPgM7nWsVLjEUQpk4/tPz5rgBLDJYKthuasG3oKqnDX6OYVTf4bFEyOETZSfX4xGw5FwthQNgDxRBTNlB5okzpiLFtXu93w4ZCyaD4N3ju0F89A7egUF9Q7uKJWb9XtoQvBOeHWqsEmMT3YJqv7fA4GSY7sidVkuonDw4EslRM2WX5KH1CAP7bkYlF+Qyr10GDZAZzT1S5ZbyeTDQAqeKZoKMAN7qCCEVqNkO6T+rc0UZQC/XdIwOw09nPK31qQgXzvhVu+gxH//PpKXvIJD7AOgdOhWw==
x-ms-exchange-antispam-messagedata: 
 7rOsnvBAzPG31YLPIShX5xZpF322KYtqFoCeRjd5OxY/uzfHebGa0XOhCWmU3eJKkTD3nc0GfutwvGouSFWlN/HJIecz1sQBJAMn/6lWh7UAgPgLNCRf7hZM5LVp9PVEg7ejtWwkWU3QAypBZjHVdw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5393
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(346002)(396003)(136003)(376002)(39860400002)(46966005)(33656002)(53546011)(316002)(70586007)(86362001)(356004)(6506007)(8676002)(81166006)(26826003)(8936002)(81156014)(5660300002)(70206006)(186003)(30864003)(336012)(478600001)(6916009)(7696005)(55016002)(52536014)(36906005)(9686003)(2906002)(82740400003)(26005)(47076004)(4326008);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	42820a31-9c6e-4c7b-ce6c-08d7d263c618
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QnXKItDuzwGeXJhYZtKYClMgdqP1FEme8aZQlGCPYLUpsuV9B48LK3ZPgkOkv54IIuvQiMOiVEpLWZfLbJyE5JGEiXIY/CrwpsvlV5W/dCDuxojI3bNfR+8bymniKFNeBqOKyTWQ8MsfWShoEZWS4HjH9nwuU20PxyfgQRB+yjnTBKjMTvnT9HLuCPQHe5Y2fuI+UZW7fD2cORcXdQBkvNfEzvNb5Il8r61qj900DDGoSKnSzxMBQGHrNUh7VLwN4XA506U9xYlgqydyxwLxh9XJQ/uyb/PPrkRE694U/kzuS+9yUgzZL65vjYdywpsDCmCNCld1drXyERrCUcjGuyv7FThoKe+vIjb4hIbLgy+AgapMA7E4vjXGQ8nylWrmpExTbxz+Vhry9Z707yXuV0FavDXpFG7Cykxak2HsF1QAIZOBHJU0YtuatQ4EogMnz1im/1uoUv0wuVntsavtzvc8mJqTqqhLEC2SL0CWFuwGNN4+wvTwBMdgLggsiOGTLMxYZmh8gWEUCBfDmUlOrJA9DSz/2F5P4znOMTcp1IHe0r+BpQpsqUwFIzLVL0MDOrYJi9YfwKOualKuCJ5tHqnJj0Za116WZi8q9UZ0yoLILirOReQAdxAcJNdsKjrctj9vc9cqTcvUrat0kGT1qP5Rc5u2/ihVU90ihycEz5qE+n2hg8ucBFz2l7VBsE+3ZSSwtlQw6/OLZvhN6r9mDA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 15:30:32.1640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b480077e-afec-4b82-0120-08d7d263c99f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3078
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Bertrand Marquis via Lists.Yoctoproject.Org
> Sent: 27 March 2020 10:54
> To: meta-arm@lists.yoctoproject.org
> Cc: nd <nd@arm.com>
> Subject: [meta-arm] [PATCH 2/2] arm-autonomy: Create xenguest network
> bridge
>=20
> Add a xenguest-network-bridge script to create a network bridge with the =
host
> interfaces.
> Add a xenguest init script to create a xen network interface connected to=
 the
> bridge Add a network interfaces configuration file to have dhcp configura=
tion
> on the network bridge Add xenguest-network-bridge to the default host ima=
ge
> Add XENGUEST_IMAGE_NETWORK_BRIDGE parameter to xenguest-image to
> let user setup if a guest should be or not connected to the bridge
>=20
> Change-Id: Id15fde234386376e89c2562e1ffa935c51affa5b
> Issue-Id: SCM-767
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  meta-arm-autonomy/README.md                   |  5 ++
>  .../classes/xenguest-image.bbclass            | 11 ++++
>  .../documentation/xenguest-network-bridge.md  | 49
> +++++++++++++++++  .../images/arm-autonomy-host-image-minimal.bb |  1 +
>  .../xenguest/files/network-bridge.sh.in       | 15 ++++++
>  .../files/xenguest-network-bridge-dhcp.cfg.in |  3
> ++  .../xenguest/files/xenguest-network-bridge.in | 44 ++++++++++++++++
>  .../xenguest/xenguest-network-bridge.bb       | 52 +++++++++++++++++++
>  .../xenguest/xenguest-network-bridge.bbappend |  2 +
>  9 files changed, 182 insertions(+)
>  create mode 100644 meta-arm-autonomy/documentation/xenguest-
> network-bridge.md
>  create mode 100755 meta-arm-autonomy/recipes-
> extended/xenguest/files/network-bridge.sh.in
>  create mode 100644 meta-arm-autonomy/recipes-
> extended/xenguest/files/xenguest-network-bridge-dhcp.cfg.in
>  create mode 100755 meta-arm-autonomy/recipes-
> extended/xenguest/files/xenguest-network-bridge.in
>  create mode 100644 meta-arm-autonomy/recipes-
> extended/xenguest/xenguest-network-bridge.bb
>  create mode 100644 meta-arm-autonomy/recipes-
> extended/xenguest/xenguest-network-bridge.bbappend
>=20
> diff --git a/meta-arm-autonomy/README.md b/meta-arm-
> autonomy/README.md index 93b5723..836d459 100644
> --- a/meta-arm-autonomy/README.md
> +++ b/meta-arm-autonomy/README.md
> @@ -42,6 +42,7 @@ its documentation.
>  Those documentation files should be checked for variables:
>  - [xen-devicetree](documentation/xen-devicetree.md)
>  - [xenguest-manager](documentation/xenguest-manager.md)
> +- [xenguest-network-bridge](documentation/xenguest-network-bridge.md)
>=20
>  BSPs
>  ----
> @@ -74,6 +75,10 @@ This layer is adding the following recipes and classes=
:
>  * [xenguest-manager](documentation/xenguest-manager.md): this is a tool =
to
>    create/remove/start/stop xen guest generated using xenguest-mkimage.
>=20
> +* [xenguest-network-bridge](documentation/xenguest-network-bridge.md):
> +this
> +  recipe add tools and init scripts to create a bridge connected to the
> +  external network on the host and allow guests to be connected to it.
> +
>  Contributing
>  ------------
>  This project has not put in place a process for contributions currently.=
 If you
> diff --git a/meta-arm-autonomy/classes/xenguest-image.bbclass b/meta-arm-
> autonomy/classes/xenguest-image.bbclass
> index fecf1ae..b4d4122 100644
> --- a/meta-arm-autonomy/classes/xenguest-image.bbclass
> +++ b/meta-arm-autonomy/classes/xenguest-image.bbclass
> @@ -61,6 +61,11 @@ XENGUEST_IMAGE_DISK_SIZE ??=3D "${@ '4' if not
> d.getVar('INITRAMFS_IMAGE') else '0  # and containing the root filesystem
> produced by Yocto  XENGUEST_IMAGE_DISK_PARTITIONS ??=3D
> "1:${XENGUEST_IMAGE_DISK_SIZE}:ext4:rootfs.tar.gz"
>=20
> +# XENGUEST_IMAGE_NETWORK_BRIDGE can be set to 1 to have a network
> +interface # on the guest connected to host bridged network. This will
> +provide the guest # with a network interface connected directly to the
> +external network XENGUEST_IMAGE_NETWORK_BRIDGE ??=3D "1"
> +
>  # Sub-directory in wich the guest is created. This is create in deploy a=
s a  #
> subdirectory and must be coherent between all components using this class=
 so
> # it must only be modified from local.conf if needed @@ -144,6 +149,12 @@
> xenguest_image_create() {
>      else
>          call_xenguest_mkimage update --set-param=3DGUEST_AUTOBOOT=3D0
>      fi
> +
> +    if [ "${XENGUEST_IMAGE_NETWORK_BRIDGE}" =3D "1" ]; then
> +        call_xenguest_mkimage update --set-param=3DNETWORK_BRIDGE=3D1
> +    else
> +        call_xenguest_mkimage update --set-param=3DNETWORK_BRIDGE=3D0
> +    fi
>  }
>=20
>  #
> diff --git a/meta-arm-autonomy/documentation/xenguest-network-bridge.md
> b/meta-arm-autonomy/documentation/xenguest-network-bridge.md
> new file mode 100644
> index 0000000..6653fe8
> --- /dev/null
> +++ b/meta-arm-autonomy/documentation/xenguest-network-bridge.md
> @@ -0,0 +1,49 @@
> +xenguest network bridge
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Introduction
> +------------
> +
> +xenguest-network-bridge is creating a network bridge to allow some
> +guests to have a direct connection to the external network.
> +To do this, a bridge is created on the host using brctl with the
> +network interfaces added to it so that the bridge is connected to the ex=
ternal
> network.
> +It is also adding a guest init script which will, for guests configured
> +to use it, create a virtual network interface for the guest and connect
> +it to the network bridge on the host.
> +
> +Usage
> +-----
> +
> +On the host the package xenguest-network-bridge must be included in your
> image.
> +
> +On the xenguest image of your guest, the parameter NETWORK_BRIDGE
> must
> +be set to 1 (using xenguest-mkimage --set-param=3DNETWORK_BRIDGE=3D1).
> +
> +Bitbake parameters
> +------------------
> +Several parameters are available to configure the xenguest network
> +bridge during Yocto project compilation (those can be set in your
> +project local.conf, for example).
> +
> +The following parameters are available:
> +
> +- XENGUEST_NETWORK_BRIDGE_NAME: This variable defines the name of
> the
> +network
> +  bridge that is created on the host during init.
> +  This is set by default to "xenbr0".
> +
> +- XENGUEST_NETWORK_BRIDGE_MEMBERS: This variable defines the list of
> +network
> +  interfaces that are added to the bridge when it is created on the
> +host during
> +  init.
> +  This is set by default to "eth0".
> +
> +- XENGUEST_NETWORK_BRIDGE_CONFIG: This variable defines the
> +configuration file
> +  to use to configure the bridge network. By default it points to have
> +file
> +  configuring the network using dhcp.
> +  You can provide a different file using a bbappend and make this
> +variable
> +  point to it if you want to customize your network configuration.
> +
> +- XENGUEST_IMAGE_NETWORK_BRIDGE: This variable can be set to 0 or 1 on
> +guest
> +  projects to enable or not the connection of the guest to the host brid=
ge.
> +  This is set by default to "1".
> +
> diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-
> image-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-
> autonomy-host-image-minimal.bb
> index ffe5bce..10c6e4b 100644
> --- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-
> minimal.bb
> +++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-
> mini
> +++ mal.bb
> @@ -17,6 +17,7 @@ IMAGE_INSTALL +=3D " \
>      xen-base \
>      qemu \
>      xenguest-manager \
> +    xenguest-network-bridge \
>      "
>=20
>  # Build xen-devicetree to produce a xen ready devicetree diff --git a/me=
ta-
> arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in b/meta-
> arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
> new file mode 100755
> index 0000000..2a36096
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.s
> +++ h.in
> @@ -0,0 +1,15 @@
> +#!/bin/sh
> +# This script is setting up a virtual network interface connected to
> +the # xenguest-network-bridge if NETWORK_BRIDGE is set to 1 in the
> +guest params
> +
> +guestname=3D"${1}"
> +
> +BRIDGE_NAME=3D"###BRIDGE_NAME###"
> +
> +# get guest parameters
> +. ./params.cfg
> +
> +if [ "${NETWORK_BRIDGE:-}" =3D "1" ]; then
> +    echo "vif =3D ['${BRIDGE_NAME}']" >> ${guestname}.cfg fi
> +
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-
> network-bridge-dhcp.cfg.in b/meta-arm-autonomy/recipes-
> extended/xenguest/files/xenguest-network-bridge-dhcp.cfg.in
> new file mode 100644
> index 0000000..6e06379
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-
> network
> +++ -bridge-dhcp.cfg.in
> @@ -0,0 +1,3 @@
> +# Xenguest Network Bridge interface configuration auto
> +###BRIDGE_NAME### iface ###BRIDGE_NAME### inet dhcp
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-
> network-bridge.in b/meta-arm-autonomy/recipes-
> extended/xenguest/files/xenguest-network-bridge.in
> new file mode 100755
> index 0000000..2278b80
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-
> network
> +++ -bridge.in
> @@ -0,0 +1,44 @@
> +#!/bin/sh
> +#
> +# Xenguest Network Bridge init
> +# This script creates a network bridge and add host interfaces to it #
> +It will then be used by xen guests to connect to the external nework #
> +
> +INTFS=3D"###BRIDGE_MEMBERS###"
> +BR_INTF=3D"###BRIDGE_NAME###"
> +
> +case "$1" in
> +  start)
> +        echo "Starting $BR_INTF"
> +        brctl addbr $BR_INTF
> +        for intf in $INTFS; do
> +            echo "Adding $intf to $BR_INTF"
> +            brctl addif $BR_INTF $intf
> +        done
> +        ;;
> +  status)
> +        true
> +        ;;
> +  stop)
> +        echo "Stopping $BR_INTF"
> +        ifdown $BR_INTF
> +        brctl delbr $BR_INTF
> +        ;;
> +  reload)
> +        echo >&2 'Reload not available; use force-reload'; exit 1
> +        ;;
> +  force-reload|restart)
> +        echo "Restarting host-bridge"
> +        $0 stop
> +        $0 start
> +        ;;
> +  *)
> +        # do not advertise unreasonable commands that there is no reason
> +        # to use with this device
> +        echo $"Usage: $0 {start|stop|status|restart|force-reload}"
> +        exit 1
> +esac
> +
> +exit $?
> +
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-
> network-bridge.bb b/meta-arm-autonomy/recipes-
> extended/xenguest/xenguest-network-bridge.bb
> new file mode 100644
> index 0000000..babd694
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-
> bridg
> +++ e.bb
> @@ -0,0 +1,52 @@
> +# Recipe to handle xenguest network configuration DESCRIPTION =3D
> +"XenGuest Network Bridge"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D
> "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b
> 4f302"
> +
> +S =3D "${WORKDIR}"
> +
> +# Please refer to documentation/xenguest-network-bridge.md for
> +documentation on # those parameters
> XENGUEST_NETWORK_BRIDGE_NAME ?=3D
> +"xenbr0"
> +XENGUEST_NETWORK_BRIDGE_MEMBERS ?=3D "eth0"
> +XENGUEST_NETWORK_BRIDGE_CONFIG ?=3D "xenguest-network-bridge-
> dhcp.cfg.in"
> +
> +SRC_URI =3D " \
> +    file://xenguest-network-bridge.in \
> +    file://xenguest-network-bridge-dhcp.cfg.in \
> +    file://network-bridge.sh.in \
> +    "
> +
> +# Bridge configurator needs to run before S01networking init script #
> +Prefix with a_ to make sure it is executed in runlevel 01 before others
> +INITSCRIPT_NAME =3D "a_xenguest-network-bridge"
> +INITSCRIPT_PARAMS =3D "defaults 01"
> +
> +inherit update-rc.d
> +
> +do_install() {
> +    cat ${WORKDIR}/xenguest-network-bridge.in \
> +       | sed -e
> "s,###BRIDGE_MEMBERS###,${XENGUEST_NETWORK_BRIDGE_MEMBERS}," \
> +       | sed -e
> "s,###BRIDGE_NAME###,${XENGUEST_NETWORK_BRIDGE_NAME}," \
> +       > ${WORKDIR}/xenguest-network-bridge
> +    cat ${WORKDIR}/${XENGUEST_NETWORK_BRIDGE_CONFIG} \
> +       | sed -e
> "s,###BRIDGE_NAME###,${XENGUEST_NETWORK_BRIDGE_NAME}," \
> +       > ${WORKDIR}/xenguest-network-bridge.cfg
> +    cat ${WORKDIR}/network-bridge.sh.in \
> +       | sed -e
> "s,###BRIDGE_NAME###,${XENGUEST_NETWORK_BRIDGE_NAME}," \
> +       > ${WORKDIR}/network-bridge.sh
> +    install -d -m 755 ${D}${sysconfdir}/init.d
> +    install -m 755 ${WORKDIR}/xenguest-network-bridge \
> +        ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
> +    install -d -m 755 ${D}${sysconfdir}/network/interfaces.d
> +    install -m 755 ${WORKDIR}/xenguest-network-bridge.cfg \
> +        ${D}${sysconfdir}/network/interfaces.d/.
> +    install -d -m 755 ${D}${sysconfdir}/xenguest/init.pre
> +    install -m 755 ${WORKDIR}/network-bridge.sh \
> +        ${D}${sysconfdir}/xenguest/init.pre/.
> +}
> +
> +RDEPENDS_${PN} +=3D "bridge-utils"
> +FILES_${PN} +=3D "${sysconfdir}/network/interfaces.d/xenguest-network-
> bridge.cfg"
> +FILES_${PN} +=3D "${sysconfdir}/xenguest/init.pre/network-bridge.sh"
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-
> network-bridge.bbappend b/meta-arm-autonomy/recipes-
> extended/xenguest/xenguest-network-bridge.bbappend
> new file mode 100644
> index 0000000..dc84921
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-
> bridg
> +++ e.bbappend
> @@ -0,0 +1,2 @@
> +# Juno board has 2 network interfaces, add both of them to the bridge
> +XENGUEST_NETWORK_BRIDGE_MEMBERS_juno ?=3D "eth0 eth1"
> --
> 2.17.1

