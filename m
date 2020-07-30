Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.70])
 by mx.groups.io with SMTP id smtpd.web12.11472.1596124562920548766
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 08:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=LTcYHv6Y;
 spf=pass (domain: arm.com, ip: 40.107.3.70, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZAvddYAXlLZenQELRM5cGq6GeYMNSPWfvnmTySP7ow=;
 b=LTcYHv6YDhF/Sqs7473m7hyh6YkoDQfpB90S37pdwha6q6mvos6326vKJIA4bKbZwMsIroFGbL9ZJPjbGZtsTLhN3WptClTyIjw2i5hAdaMuK5EZHzi1HL3zMIraVlKc9HWBUa5ibgvTWu+5jME8a0xr0P47lUl/o9e7NZrqNdw=
Received: from AM5PR0201CA0001.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::11) by AM4PR0802MB2178.eurprd08.prod.outlook.com
 (2603:10a6:200:5a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22; Thu, 30 Jul
 2020 15:56:00 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::1) by AM5PR0201CA0001.outlook.office365.com
 (2603:10a6:203:3d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Thu, 30 Jul 2020 15:56:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.20 via Frontend Transport; Thu, 30 Jul 2020 15:55:59 +0000
Received: ("Tessian outbound c83312565ef4:v62"); Thu, 30 Jul 2020 15:55:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4fb31f189b691b27
X-CR-MTA-TID: 64aa7808
Received: from 7cf21683430b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B2FB0AC0-29E8-4EDE-B7A1-2837677E4485.1;
	Thu, 30 Jul 2020 15:55:49 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7cf21683430b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Jul 2020 15:55:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ot+OUPWF96swAqwakMsoUGGbvODJIB94tLnNL6gTSTGa93QYoCS4//fP4FORO8lR8Mz3CyvZ1jzvjQS2jRY2BDnfNEWAdj+8jaoC8MdlIzChc+BUeyTtPs/hMgqoNjXj32Yef6U7U4jFCAaQmffcjBlyTh1ZRzstqFQLMABD2TYm3tWkiZ5VCtBfi1cm6ilZttO35+ZusXxz3SRKiq4D7RkI9krrIuSyrzv1u+BMEMFPwS5w7iFCNgbAHGl+aNral0JOkr+odx74x+rMD35xJoh7H6xVkfKQK3lGVOsJd2hetUMhL+xAdc1oAT3GwlFLKrEn+AYZEs0qSLYUiS2bXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZAvddYAXlLZenQELRM5cGq6GeYMNSPWfvnmTySP7ow=;
 b=QtRGy1cFKyPDjY0nnNfczxblEmE+1MkGO8DRcSqHEe9OO5HY/9PcVcy38byfPOxhnYwQ426k33iecx9aU3JHEBMDfU9PkTINpN9xqjLa+mr+MHS0WjGRMMKGqmMtcg0ttgAt9yNbBiY+kuTdCX3RTMx15mtw6ajhy1bvQeOU5P6aWpoMMMy1ONq7xqBmHJWVO2eOQR4pa85O253Un0CSHOgBdLyrBiF1RFAbFbRSgr2LpzDhY3CGF4lI41F31zMSlmw92eN9Y2qzxYIpue0wwD4ea8nMkIfpP7PIg940PQ5hOJj+O4b1F5MPY694XHnb8FYRt3L3fI2BA0gMT43rYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZAvddYAXlLZenQELRM5cGq6GeYMNSPWfvnmTySP7ow=;
 b=LTcYHv6YDhF/Sqs7473m7hyh6YkoDQfpB90S37pdwha6q6mvos6326vKJIA4bKbZwMsIroFGbL9ZJPjbGZtsTLhN3WptClTyIjw2i5hAdaMuK5EZHzi1HL3zMIraVlKc9HWBUa5ibgvTWu+5jME8a0xr0P47lUl/o9e7NZrqNdw=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3035.eurprd08.prod.outlook.com (2603:10a6:5:1d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.19; Thu, 30 Jul
 2020 15:55:48 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3216.033; Thu, 30 Jul 2020
 15:55:48 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Diego Sueiro <Diego.Sueiro@arm.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] [PATCH 3/4] arm-autonomy/xenguest-network: Add private network support for xenguest
Thread-Topic: [meta-arm] [PATCH 3/4] arm-autonomy/xenguest-network: Add
 private network support for xenguest
Thread-Index: AQHWZomcpz9ZWI8x9EaZkFBi4/Gc0qkgRrIA
Date: Thu, 30 Jul 2020 15:55:48 +0000
Message-ID: <810A64EA-E0FC-4393-AFBF-C012C1FB631C@arm.com>
References: <1596124338-106961-1-git-send-email-diego.sueiro@arm.com>
 <1596124338-106961-3-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1596124338-106961-3-git-send-email-diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3c63074a-2417-47c3-45ad-08d834a10dbc
x-ms-traffictypediagnostic: DB7PR08MB3035:|AM4PR0802MB2178:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<AM4PR0802MB217811D92DD5B8342E97B5C09D710@AM4PR0802MB2178.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3383;OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 xaOCFv8XfwqWV8u1oz15ODWi5v+mdEmY3GvWan2lY/4lPbTF+bw8OdxXAEvDGFwD6Hv2Tix4OPzEJgivaxnHbkKWJRrnAWuA4oSbTbtAT/0kU3uzBI4VZH6apniX1t+wv5xSlU46NpADaNfQ0tAE5Toni21SE0RSOqLwkzg6e24st9TE10raSlO0TcOTMnlwJ77YYIXXDXPaIHHZJAU9wpx/tG0aMF903ey6HscDtgo1N6tdll4F3OiZ3URkDbmQTSboV16lr7Ix4zARHzFrPYmU2Sravqr9Pz9g6cvtWKqCbsuIaMzTZXStbn3TtSbMnldc3NXBADwZiA6UPvd4yyQ8374N6z1dN6re6YHlaRV40DYDYQI1uBtS4mlyoE+968l78ghpvfdPVnZmYSTScQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(6862004)(71200400001)(4326008)(478600001)(64756008)(66446008)(66556008)(2906002)(66476007)(66574015)(83380400001)(966005)(33656002)(8936002)(66946007)(6512007)(186003)(86362001)(36756003)(26005)(76116006)(316002)(37006003)(30864003)(6486002)(53546011)(5660300002)(6636002)(6506007)(8676002)(91956017)(54906003)(2616005)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 bCV62E4sqtKYwdtn51yzZE5b8ahQA7l3AlhKWZj6HSZjDserqlLBt1Af2LZEVJWHO0EecjxF+0CrvMhWZruc76GLoGEmnfEMb4UM8iWZza/75RHjcXrg22tA//j84oTthBTNS45pFl/A8S2HPbK/S9EVGA/GeKUN7/h43E2+sdtZCPBxai4gn50NCKAbqc28MryRq9WKaBSV5FbK3j9jBsztip+7hKW4BAqwK4HpXMvMo674DBFPxUaczfY7r9amRPdcW+A5MYejDL4Lvkj0iGIcFGp5eitkYcOBi08y+9OHr3z6TJUEX33LEm3Dzym//AzWopmJA6mB4P63K2TxzQxlYzG2mojfhytheogSVq1GP4OXW6tpvkf99amlGIA1qjC1lQYVVHghTag8RgHW0ePrgdz/sgzPsPxQAojkHgcRPC82qX4oZs33B6sQSH0QsOb9CQf1CeMnfLr9z0OAhmmm9cxZafb2zCs0y67nqW9bbyJu9kgXgkSzD9sXt5tB5U6cZjjcQxyFLa8x2X0U6TVtDRvB/h6pZ3FmdYZTMT4yKbnP/v8SkiT+/OiZVBkA7ROkFGJqjnfvMK35qcsjxbv6pB/pQluc3pS1ZNJD6WvotvDyfzogz4kHWA9GgwZV9u6Iz61Bwfag7WJ2Ja8bUg==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3035
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d0c8f0f7-1f10-41e3-4cad-08d834a10702
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QG4NIOOoJ0lgRGuw2sOmzWgOEaejsjvX8NbjY8fTAdYRk6vNJPWzwGebGxrHpGy3ko7kX9GWm0BySE3IxKTtkFeFzi2W6N5y0Fj2w6Yb9O7GF+MBMgTVDWCLbfTlZbKDIIg3ZbGdXJ5Fo8C4f7nuEYc1ofvBhHX64zmMcGqpETFfwSKOinelH+IJoH5eRaZhJsRij029DdwKAUFAFxj/7xrgaua88AJ+VC2hkhrfCrQs8Sr4OhHdY4ok4n33hqEtXfFMyzEtw63Y5BXgCDN+JMfQxe+qOpk9JQ1+eXCeKCyXge4gGnsIdipUrwCMTmkwA0jzNaWJqQ4hFcTp48RPtgvfXVn/zkJ5M6uiOwPcVLYPmUJ4oi9161WYREhLmejdsa9C6Y2M0InhORd+9/cOFMuQEeBGvuelpx8tNguchBKqlfmSpocFjyBqWksSW8Ixa5NefjrlrzbBziUy27PXbx8kcV0mFQ7IWk4brPNKS2o=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(346002)(39860400002)(376002)(46966005)(6486002)(66574015)(47076004)(82740400003)(8936002)(6862004)(6636002)(83380400001)(186003)(36756003)(478600001)(82310400002)(356005)(33656002)(53546011)(8676002)(6506007)(336012)(6512007)(4326008)(5660300002)(86362001)(70586007)(81166007)(2906002)(70206006)(966005)(36906005)(316002)(37006003)(54906003)(26005)(30864003)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 15:55:59.6307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c63074a-2417-47c3-45ad-08d834a10dbc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2178
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <818EEB6D46FD5B419D6268DEF382BC34@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 30 Jul 2020, at 17:52, Diego Sueiro via lists.yoctoproject.org <diego=
.sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> Introduce the private/internal network support for xenguest by using NAT
> and applying the proper iptables rules to allow the guest to have access
> to the external network.
>=20
> The XENGUEST_NETWORK_TYPE variable was introduced to allow the user to
> setup the xenguest network type between "bridge" (default), "nat" and
> "none".
>=20
> Change-Id: I919e5b0fd0809093698b9dec3a9503b598b54828
> Issue-Id: SCM-1019
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> meta-arm-autonomy/classes/xenguest-image.bbclass   |  18 +--
> .../documentation/xenguest-network-bridge.md       |  49 --------
> .../documentation/xenguest-network.md              |  70 +++++++++++
> ...k-bridge.bbappend =3D> xenguest-network.bbappend} |   0
> .../images/arm-autonomy-host-image-minimal.bb      |   2 +-
> .../xenguest/files/00-vif-xenguest.hook            | 130 +++++++++++++++=
++++++
> .../xenguest/files/dhcpd-params.cfg                |  30 +++++
> .../xenguest/files/network-bridge.sh.in            |  25 +++-
> .../xenguest/xenguest-base-image.bb                |   7 +-
> ...guest-network-bridge.bb =3D> xenguest-network.bb} |  16 ++-
> 10 files changed, 283 insertions(+), 64 deletions(-)
> delete mode 100644 meta-arm-autonomy/documentation/xenguest-network-brid=
ge.md
> create mode 100644 meta-arm-autonomy/documentation/xenguest-network.md
> rename meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xe=
nguest/{xenguest-network-bridge.bbappend =3D> xenguest-network.bbappend} (1=
00%)
> create mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/00-=
vif-xenguest.hook
> create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/files/dhc=
pd-params.cfg
> rename meta-arm-autonomy/recipes-extended/xenguest/{xenguest-network-bri=
dge.bb =3D> xenguest-network.bb} (79%)
>=20
> diff --git a/meta-arm-autonomy/classes/xenguest-image.bbclass b/meta-arm=
-autonomy/classes/xenguest-image.bbclass
> index e8880f3..be1dde5 100644
> --- a/meta-arm-autonomy/classes/xenguest-image.bbclass
> +++ b/meta-arm-autonomy/classes/xenguest-image.bbclass
> @@ -58,10 +58,14 @@ XENGUEST_IMAGE_DISK_SIZE ??=3D "${@ '4' if not d.get=
Var('INITRAMFS_IMAGE') else '0
> # and containing the root filesystem produced by Yocto
> XENGUEST_IMAGE_DISK_PARTITIONS ??=3D "1:${XENGUEST_IMAGE_DISK_SIZE}:ext4=
:rootfs.tar.gz"
>=20
> -# XENGUEST_IMAGE_NETWORK_BRIDGE can be set to 1 to have a network inter=
face
> -# on the guest connected to host bridged network. This will provide the=
 guest
> -# with a network interface connected directly to the external network
> -XENGUEST_IMAGE_NETWORK_BRIDGE ??=3D "1"
> +# XENGUEST_IMAGE_NETWORK_TYPE can be set to "bridge", "nat" or "none".
> +# The "bridge" type will share the physical eth interface from dom0 wit=
h the
> +# domU. This will allow the domU to have access to the external network=
.
> +# The "nat" type will setup a virtual network between dom0 and domU and=
 also
> +# configure and run the dhcpd on dom0 to serve the domU.
> +# The "none" type will not affect any networking setting between on dom=
0 and
> +# domU.
> +XENGUEST_IMAGE_NETWORK_TYPE ??=3D "bridge"
>=20
> # Sub-directory in wich the guest is created. This is create in deploy a=
s a
> # subdirectory and must be coherent between all components using this cl=
ass so
> @@ -147,10 +151,10 @@ xenguest_image_create() {
>         call_xenguest_mkimage update --set-param=3DGUEST_AUTOBOOT=3D0
>     fi
>=20
> -    if [ "${XENGUEST_IMAGE_NETWORK_BRIDGE}" =3D "1" ]; then
> -        call_xenguest_mkimage update --set-param=3DNETWORK_BRIDGE=3D1
> +    if [ -n "${XENGUEST_IMAGE_NETWORK_TYPE}" ]; then
> +        call_xenguest_mkimage update --set-param=3DXENGUEST_NETWORK_TYP=
E=3D"${XENGUEST_IMAGE_NETWORK_TYPE}"
>     else
> -        call_xenguest_mkimage update --set-param=3DNETWORK_BRIDGE=3D0
> +        call_xenguest_mkimage update --set-param=3DXENGUEST_NETWORK_TYP=
E=3D"none"
>     fi
> }
>=20
> diff --git a/meta-arm-autonomy/documentation/xenguest-network-bridge.md =
b/meta-arm-autonomy/documentation/xenguest-network-bridge.md
> deleted file mode 100644
> index 6653fe8..0000000
> --- a/meta-arm-autonomy/documentation/xenguest-network-bridge.md
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -xenguest network bridge
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -Introduction
> -------------
> -
> -xenguest-network-bridge is creating a network bridge to allow some gues=
ts to
> -have a direct connection to the external network.
> -To do this, a bridge is created on the host using brctl with the networ=
k
> -interfaces added to it so that the bridge is connected to the external =
network.
> -It is also adding a guest init script which will, for guests configured=
 to use
> -it, create a virtual network interface for the guest and connect it to =
the
> -network bridge on the host.
> -
> -Usage
> ------
> -
> -On the host the package xenguest-network-bridge must be included in you=
r image.
> -
> -On the xenguest image of your guest, the parameter NETWORK_BRIDGE must =
be set
> -to 1 (using xenguest-mkimage --set-param=3DNETWORK_BRIDGE=3D1).
> -
> -Bitbake parameters
> -------------------
> -Several parameters are available to configure the xenguest network brid=
ge
> -during Yocto project compilation (those can be set in your project loca=
l.conf,
> -for example).
> -
> -The following parameters are available:
> -
> -- XENGUEST_NETWORK_BRIDGE_NAME: This variable defines the name of the n=
etwork
> -  bridge that is created on the host during init.
> -  This is set by default to "xenbr0".
> -
> -- XENGUEST_NETWORK_BRIDGE_MEMBERS: This variable defines the list of ne=
twork
> -  interfaces that are added to the bridge when it is created on the hos=
t during
> -  init.
> -  This is set by default to "eth0".
> -
> -- XENGUEST_NETWORK_BRIDGE_CONFIG: This variable defines the configurati=
on file
> -  to use to configure the bridge network. By default it points to have =
file
> -  configuring the network using dhcp.
> -  You can provide a different file using a bbappend and make this varia=
ble
> -  point to it if you want to customize your network configuration.
> -
> -- XENGUEST_IMAGE_NETWORK_BRIDGE: This variable can be set to 0 or 1 on =
guest
> -  projects to enable or not the connection of the guest to the host bri=
dge.
> -  This is set by default to "1".
> -
> diff --git a/meta-arm-autonomy/documentation/xenguest-network.md b/meta-=
arm-autonomy/documentation/xenguest-network.md
> new file mode 100644
> index 0000000..c61a11a
> --- /dev/null
> +++ b/meta-arm-autonomy/documentation/xenguest-network.md
> @@ -0,0 +1,70 @@
> +Xenguest Network
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Introduction
> +------------
> +
> +The xenguest-network package is primarly creating a network bridge to s=
hare
> +the host eth physical interfaces with the guests virtual interfaces (vi=
f).
> +This way the guests can have access to the external network.
> +
> +At the moment 3 types of network arrangements are provided:
> +
> +- Bridge: where the guest vif is added to the created bridge interface;
> +
> +- NAT: where a private subnet is created for the guest, a dhcpd is star=
ted on
> +  the host to serve the guest and the proper iptables rules are created=
 to
> +  allow the guest to access the external network;
> +
> +- None: the guest vif is not connected to the bridge.
> +
> +Usage
> +-----
> +
> +On the host project the package xenguest-network must be included in yo=
ur
> +image, and on the guest project the XENGUEST_NETWORK_TYPE needs to be s=
et to
> +"bridge", "nat" or "none".
> +
> +Bitbake parameters
> +------------------
> +
> +Several parameters are available to configure the xenguest network brid=
ge
> +during Yocto project compilation (those can be set in your project loca=
l.conf
> +or xenguest-network.bbappend, for example).
> +
> +The following parameters are available:
> +
> +- XENGUEST_NETWORK_BRIDGE_NAME: This variable defines the name of the n=
etwork
> +  bridge that is created on the host during init.
> +  This is set by default to "xenbr0".
> +
> +- XENGUEST_NETWORK_BRIDGE_MEMBERS: This variable defines the list of th=
e
> +  physical network interfaces that are added to the bridge when it is c=
reated
> +  on the host during init.
> +  By default no physical interfaces are added.
> +
> +- XENGUEST_NETWORK_BRIDGE_CONFIG: This variable defines the configurati=
on file
> +  to use to configure the bridge network. By default it points to have =
file
> +  configuring the network using dhcp.
> +  You can provide a different file using a bbappend and make this varia=
ble
> +  point to it if you want to customize your network configuration.
> +
> +- XENGUEST_IMAGE_NETWORK_TYPE: This variable can be set to "bridge" (de=
fault),
> +  "nat" or "none".
> +  The **bridge** type will add the domU vif interface to a bridge which=
 also
> +  contains the dom0 physical interface giving the guest direct access t=
o the
> +  external network.
> +  The **nat** type will setup a private network between dom0 and domU, =
setup
> +  the appropriate routing table, configure and run the dhcpd on dom0 to=
 serve
> +  the domU and apply the iptables rules to allow the guest to acess the
> +  external network. The dhcpd configuration for the guest can be custom=
ised by
> +  replacing the
> +  "meta-arm-autonomy/recipes-extended/xenguest/files/dhcpd-params.cfg" =
file
> +  in a xenguest-network.bbappend. The dhcpd-params.cfg file is installe=
d in
> +  the xenguest image and copied to
> +  "/etc/xenguest/guests/${guestname}/files/dhcpd-params.cfg" when the g=
uest
> +  image is created. It will be consumed by the
> +  "/etc/xen/scripts/vif-post.d/00-vif-xenguest.hook" script which is ca=
lled by
> +  "/etc/xen/scripts/vif-nat" script when starting/stopping the xenguest=
.
> +  The **none** type will not affect any networking setting between on d=
om0 and
> +  domU.
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-exten=
ded/xenguest/xenguest-network-bridge.bbappend b/meta-arm-autonomy/dynamic-l=
ayers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network.bbappend
> similarity index 100%
> rename from meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extend=
ed/xenguest/xenguest-network-bridge.bbappend
> rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended=
/xenguest/xenguest-network.bbappend
> diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-ima=
ge-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-ima=
ge-minimal.bb
> index 9731c7c..188e31d 100644
> --- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-mini=
mal.bb
> +++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-mini=
mal.bb
> @@ -41,7 +41,7 @@ IMAGE_INSTALL +=3D " \
>     packagegroup-core-ssh-openssh \
>     qemu-system-i386 \
>     xenguest-manager \
> -    xenguest-network-bridge \
> +    xenguest-network \
>     "
>=20
> # Build xen binary
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xe=
nguest.hook b/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xeng=
uest.hook
> new file mode 100755
> index 0000000..32d5976
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xenguest.=
hook
> @@ -0,0 +1,130 @@
> +#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +# ${XEN_SCRIPT_DIR}/vif-post.d/00-vif-xenguest.hook
> +#
> +# Script for performing local configuration of a vif.
> +# This script will be sourced by, e.g., vif-bridge after the hotpluggin=
g
> +# system calls vif-bridge. The script is here and not simply executed a=
s
> +# a udev rule because this allows simple access to several environment
> +# variables set by the calling vif-* script.
> +#
> +# Environment vars:
> +# command     (add|remove|online|offline)
> +# dev         vif interface name (required).
> +# main_ip     IP address of Dom0
> +# ip          list of IP networks for the vif, space-separated
> +# XENBUS_PATH path to this device's details in the XenStore (required).
> +#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +
> +domid=3D$(xenstore_read "${XENBUS_PATH}/frontend-id")
> +guestname=3D$(xenstore_read "/local/domain/${domid}/name")
> +bridge=3D$(xenstore_read "${XENBUS_PATH}/bridge")
> +
> +if [ ! -f /etc/xenguest/guests/${guestname}/params.cfg ]; then
> +    log debug "No /etc/xenguest/guests/${guestname}/params.cfg. Exiting=
."
> +    return
> +fi
> +
> +# Source the params file to get the choosen XENGUEST_NETWORK_TYPE
> +. /etc/xenguest/guests/${guestname}/params.cfg
> +
> +# We need to get the xenguest subnet prefix to set the subnet and
> +# the fixed ip to assing to the guest.
> +get_subnet_prefix() {
> +    # ${vif_ip} is set in the vif-nat script
> +    echo ${vif_ip} | awk -F. '{print $1"."$2"."$3}'
> +}
> +
> +subnetprefix=3D$(get_subnet_prefix)
> +
> +dhcpd_remove_conf_entry()
> +{
> +    local tmpfile=3D$(mktemp)
> +
> +    # Remove the the xenguest dhcpd config file inclusion in the dhcpd
> +    # main config
> +    grep -v "include \"${XENGUEST_DHCPD_CONF_FILE}\";" \
> +            "${dhcpd_conf_file}" >"${tmpfile}"
> +    if ! diff "${tmpfile}" "${dhcpd_conf_file}" >/dev/null
> +    then
> +        cp "${tmpfile}" "${dhcpd_conf_file}"
> +    fi
> +    rm ${tmpfile}
> +
> +    # Remove the generated the xenguest dhcpd file
> +    rm ${XENGUEST_DHCPD_CONF_FILE}
> +}
> +
> +# This function removes the dhcpd options added by the vif-nat script a=
nd
> +# adds the user provided options under the ${XENGUEST_DHCPD_HOST_OPTION=
S}
> +# variable set in "/etc/xenguest/guests/${guestname}/files/dhcpd-params=
.cfg"
> +# file.
> +dhcpd_add_conf_entries()
> +{
> +    # We need to remove the previous added entry from vif-nat script
> +    dhcp_remove_entry
> +
> +    # Include the xenguest dhcpd config file in the dhcpd main config
> +    echo >>"${dhcpd_conf_file}" "include \"${XENGUEST_DHCPD_CONF_FILE}\=
";"
> +
> +    # Generate the xenguest dhcpd file
> +    echo -e "$(eval "echo -e \"$(cat ${XENGUEST_DHCPD_PARAMS_FILE})\"")=
" \
> +            >> "${XENGUEST_DHCPD_CONF_FILE}"
> +
> +    # Re-add the dhcpargs entries removed by dhcp_remove_entry call
> +    dhcparg_add_entry
> +}
> +
> +dhcpd_online(){
> +    log debug "dhcpd_online"
> +    claim_lock "vif-nat-dhcp"
> +    dhcpd_add_conf_entries
> +    release_lock "vif-nat-dhcp"
> +   "$dhcpd_init_file" restart || true
> +}
> +
> +dhcpd_offline(){
> +    log debug "dhcpd_offline"
> +    claim_lock "vif-nat-dhcp"
> +    dhcpd_remove_conf_entry
> +    release_lock "vif-nat-dhcp"
> +    "$dhcpd_init_file" restart || true # We need to ignore failure beca=
use
> +                                       # ISC dhcpd 3 borks if there is =
nothing
> +                                       # for it to do, which is the cas=
e if
> +                                       # the outgoing interface is not
> +                                       # configured to offer leases and=
 there
> +                                       # are no vifs.
> +}
> +
> +case "${XENGUEST_NETWORK_TYPE}" in
> +    nat)
> +        XENGUEST_DHCPD_PARAMS_FILE=3D${XENGUEST_DHCPD_PARAMS_FILE:-"/et=
c/xenguest/guests/${guestname}/files/dhcpd-params.cfg"}
> +        if [ ! -f ${XENGUEST_DHCPD_PARAMS_FILE} ]; then
> +            log debug "No ${XENGUEST_DHCPD_PARAMS_FILE} file. Aborting"
> +            return
> +        fi
> +
> +        XENGUEST_DHCPD_CONF_FILE=3D"/etc/dhcp/dhcpd.dom$domid.conf"
> +
> +        case "$command" in
> +            online)
> +                dhcpd_online
> +
> +                # Enable ip forwarding and NAT for the ${bridge} interf=
ace
> +                sysctl -w net.ipv4.ip_forward=3D1
> +                iptables_w -t nat -A POSTROUTING -o ${bridge} -j MASQUE=
RADE -m comment --comment "dom${domid}"
> +                ;;
> +            offline)
> +                dhcpd_offline
> +
> +                # Remove the NAT iptables rules created for the dom${do=
mid}
> +                guest_ipt_rule=3D$(iptables_w -t nat -vL POSTROUTING -n=
 --line-number | grep -w dom${domid} | awk '{print $1}' | tac)
> +                for rule in ${guest_ipt_rule}; do iptables_w -t nat --d=
elete POSTROUTING ${rule}; done
> +
> +                # If there is no more NAT iptables rules we disable ip =
forwarding
> +                ipt_nat_rules=3D$(iptables_w -t nat -vL POSTROUTING -n =
--line-number | grep MASQUERADE | awk '{print $1}')
> +                [ -z "${ipt_nat_rules##*[!0-9]*}" ] && sysctl -w net.ip=
v4.ip_forward=3D0
> +               ;;
> +        esac
> +
> +        ;;
> +esac
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/dhcpd-par=
ams.cfg b/meta-arm-autonomy/recipes-extended/xenguest/files/dhcpd-params.cf=
g
> new file mode 100644
> index 0000000..0495fbd
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/dhcpd-params.cfg
> @@ -0,0 +1,30 @@
> +# This file holds the guest dhcpd options running on Dom0.
> +# The "/etc/xen/scripts/vif-post.d/00-vif-xenguest.hook" called in the =
end of
> +# the vif-nat script will use this file to generate the final dhcpd
> +# configuration.
> +
> +# This file is added in the xenguest image and installed in dom0 under
> +# /etc/xenguest/guests/${guestname}/files/dhcpd-params.cfg when the gue=
st
> +# image is created.
> +# Any customizations to it should be performed by replacing it via a bb=
append.
> +
> +# The \${hostname}, \${mac}, \${vif_ip} and \${router_ip} variables are=
 set in
> +# the vif-nat script context. The \${subnetprefix} variable is set in t=
he
> +# 00-vif-xenguest.hook script context.
> +
> +# The "subnet" configuration node is mandatory in order to have the dhc=
pd
> +# properly running.
> +
> +host ${hostname} {
> +    hardware ethernet ${mac};
> +    fixed-address ${vif_ip};
> +    option routers ${router_ip};
> +    option subnet-mask 255.255.255.0;
> +    option broadcast-address ${subnetprefix}.255;
> +    option domain-name-servers 8.8.8.8;
> +    option host-name \"${hostname}\";
> +    option domain-name \"example.com\";
> +}
> +
> +subnet ${subnetprefix}.0 netmask 255.255.255.0 {
> +}
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/network-b=
ridge.sh.in b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bri=
dge.sh.in
> index 2a36096..752f498 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.s=
h.in
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.s=
h.in
> @@ -9,7 +9,24 @@ BRIDGE_NAME=3D"###BRIDGE_NAME###"
> # get guest parameters
> . ./params.cfg
>=20
> -if [ "${NETWORK_BRIDGE:-}" =3D "1" ]; then
> -    echo "vif =3D ['${BRIDGE_NAME}']" >> ${guestname}.cfg
> -fi
> -
> +case "${XENGUEST_NETWORK_TYPE:-}" in
> +    nat)
> +        # Create the symlinks for the files that vif-nat script expects
> +        if [ ! -f /etc/dhcpd.conf ]; then
> +            ln -s dhcp/dhcpd.conf /etc/dhcpd.conf
> +        fi
> +        if [ ! -f /etc/init.d/dhcp3-server ]; then
> +            ln -s dhcp-server /etc/init.d/dhcp3-server
> +        fi
> +        if [ ! -f /etc/default/dhcp3-server ]; then
> +            ln -s dhcp-server /etc/default/dhcp3-server
> +        fi
> +        echo "vif =3D ['script=3Dvif-nat']" >> ${guestname}.cfg
> +        ;;
> +    bridge)
> +        echo "vif =3D ['script=3Dvif-bridge,bridge=3D${BRIDGE_NAME}']" =
>> ${guestname}.cfg
> +        ;;
> +    *)
> +        echo "${@}: XENGUEST_NETWORK_TYPE=3D$XENGUEST_NETWORK_TYPE inva=
lid"
> +        ;;
> +esac
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-i=
mage.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.b=
b
> index fb66566..8516fe8 100644
> --- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
> @@ -35,7 +35,12 @@ LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MI=
T;md5=3D0835ade698e0bcf8506ecda
> XENGUEST_IMAGE_SRC_URI_DISK_FILES ??=3D ""
>=20
> # Add xen files
> -XENGUEST_IMAGE_SRC_URI_XEN_FILES ??=3D ""
> +# Any extrafiles files to be added to XENGUEST_IMAGE_SRC_URI_XEN_FILES =
should
> +# be performed via XENGUEST_IMAGE_SRC_URI_XEN_FILES_append.
> +# The dhcpd-params.cfg holds the dhcpd configuration for Dom0. And it i=
s used
> +# when XENGUEST_IMAGE_NETWORK_TYPE=3D"nat". Any customizations to it sh=
ould be
> +# performed by replacing it via a xenguest-network.bbappend.
> +XENGUEST_IMAGE_SRC_URI_XEN_FILES =3D "file://dhcpd-params.cfg"
>=20
> # Add xen configuration elements
> XENGUEST_IMAGE_SRC_URI_XEN_CONFIG ??=3D ""
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-networ=
k-bridge.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.=
bb
> similarity index 79%
> rename from meta-arm-autonomy/recipes-extended/xenguest/xenguest-network=
-bridge.bb
> rename to meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.b=
b
> index c6c2242..fa4f93f 100644
> --- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridg=
e.bb
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
> @@ -1,5 +1,5 @@
> # Recipe to handle xenguest network configuration
> -DESCRIPTION =3D "XenGuest Network Bridge"
> +DESCRIPTION =3D "Xenguest Network"
>=20
> LICENSE =3D "MIT"
> LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
> @@ -20,6 +20,7 @@ SRC_URI =3D " \
>     file://xenguest-network-bridge.in \
>     file://xenguest-network-bridge-dhcp.cfg.in \
>     file://network-bridge.sh.in \
> +    file://00-vif-xenguest.hook \
>     "
>=20
> # Bridge configurator needs to run before S01networking init script
> @@ -49,8 +50,19 @@ do_install() {
>     install -d -m 755 ${D}${sysconfdir}/xenguest/init.pre
>     install -m 755 ${WORKDIR}/network-bridge.sh \
>         ${D}${sysconfdir}/xenguest/init.pre/.
> +
> +    install -d ${D}${sysconfdir}/xen/scripts/vif-post.d
> +    install -m 755 ${WORKDIR}/00-vif-xenguest.hook \
> +        ${D}${sysconfdir}/xen/scripts/vif-post.d/.
> }
>=20
> -RDEPENDS_${PN} +=3D "bridge-utils"
> +RDEPENDS_${PN} +=3D "bridge-utils \
> +                   iptables \
> +                   dhcp-server \
> +                   kernel-module-xt-tcpudp \
> +                   kernel-module-xt-physdev \
> +                   kernel-module-xt-comment \
> +                  "
> FILES_${PN} +=3D "${sysconfdir}/network/interfaces.d/xenguest-network-br=
idge.cfg"
> FILES_${PN} +=3D "${sysconfdir}/xenguest/init.pre/network-bridge.sh"
> +FILES_${PN} +=3D "${sysconfdir}/xen/scripts/vif-post.d/00-vif-xenguest.=
hook"
> --=20
> 2.7.4
>=20
>=20

