Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.47])
 by mx.groups.io with SMTP id smtpd.web10.10528.1602677376832890012
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Oct 2020 05:09:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=5j95NM0N;
 spf=pass (domain: arm.com, ip: 40.107.14.47, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlbvnrrgDMw4ZsK8KnMOIqmPgxQu3NXnBsVmEgdHLIQ=;
 b=5j95NM0Nhxx15PKhU7HhTC4dlwxOG9puXiE3+n/vurjBHFvPTU3xsdg6R4oOUDdQxE1Z6QTYT05+AT/s77JdT4OVHY4m4YYTFeGMoUIt+GGJGBaas4bfV54A2GFsMrGbUMQJ5K918kpogNnn7Ka0DYYQ9MN74RekOe0Mj3z1/E4=
Received: from DB6P192CA0023.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::33) by
 DB6PR0802MB2471.eurprd08.prod.outlook.com (2603:10a6:4:9f::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.20; Wed, 14 Oct 2020 12:09:33 +0000
Received: from DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::e0) by DB6P192CA0023.outlook.office365.com
 (2603:10a6:4:b8::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend
 Transport; Wed, 14 Oct 2020 12:09:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT014.mail.protection.outlook.com (10.152.20.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Wed, 14 Oct 2020 12:09:33 +0000
Received: ("Tessian outbound a64c3afb6fc9:v64"); Wed, 14 Oct 2020 12:09:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 19620f804fa55ba1
X-CR-MTA-TID: 64aa7808
Received: from 35d0e9f1b7e0.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C6E2A570-E5A5-48F2-8A45-903C73963B82.1;
	Wed, 14 Oct 2020 12:09:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 35d0e9f1b7e0.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 14 Oct 2020 12:09:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgKdmNcKZSN6YWYL2IVrtTsNk/Dq+caZHZfbbCKJpkNhBulG/oHBwVR7BMsq7dprWJts/mKwi0g/aqRceF8KtifxxuurYB17qBGH5lZX2MB6lCbVG6vdSnGks4+LSmnH+FVYotjJ0A/Xha9YiyJEQ1wLPSWc0oqublJAvOIbDo+OpqfUCjnL1puDXF3cxLw+f4QpeLWZxM02Fy2ApeWIZIkyY50aPw1HNr4cKwBF75gEnDyCEEEa45Zthsepy/A3hvVZq2OV+SLmBl2BJ7uMv4dSGebRA6koEdw68IjGVWShTjsbQOqR0BWYzyZfMIrZGxTvOa5h6511Idg+qEbB8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlbvnrrgDMw4ZsK8KnMOIqmPgxQu3NXnBsVmEgdHLIQ=;
 b=bOWVHd0Y3YMZMCPd2nyG3+lga0A4/76WBswk9UkioHcQVpk5a9GkNmxYJwtpw2/qF/Vz+/rnC3ltD4OP0Pn/TMeXazFhuO5F8qusrEBG1F0A5R0Ptr0iuzyBTDboEyXpNenx051gvsjEJMqbCcW0FcoY0ZXpH/mgGjThUEENG/sDx1pucU9PQWuztU0PInjc6mZm56JYB9WUxnik1/zSGx5ibZtJ5wAPzz4xBZ+4+wmlDXILPWl9JTDRJbwmbxWL8BvR/pUPWqhCsGx7v05ZJrEV58iGrFWFWeE7zRf1KxGwKWlK/ZU5/n75UVOfGf1CCAndmu1MOoEY1bNNLrqCmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlbvnrrgDMw4ZsK8KnMOIqmPgxQu3NXnBsVmEgdHLIQ=;
 b=5j95NM0Nhxx15PKhU7HhTC4dlwxOG9puXiE3+n/vurjBHFvPTU3xsdg6R4oOUDdQxE1Z6QTYT05+AT/s77JdT4OVHY4m4YYTFeGMoUIt+GGJGBaas4bfV54A2GFsMrGbUMQJ5K918kpogNnn7Ka0DYYQ9MN74RekOe0Mj3z1/E4=
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com (2603:10a6:208:d4::18)
 by AM4PR08MB2691.eurprd08.prod.outlook.com (2603:10a6:205:a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.26; Wed, 14 Oct
 2020 12:09:22 +0000
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::d1ba:1582:16de:1d00]) by AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::d1ba:1582:16de:1d00%2]) with mapi id 15.20.3455.030; Wed, 14 Oct 2020
 12:09:22 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Diego
 Sueiro <Diego.Sueiro@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp/n1sdp: add board firmware recipe and documentation
Thread-Topic: [meta-arm] [PATCH] arm-bsp/n1sdp: add board firmware recipe and
 documentation
Thread-Index: AQHWoiAh7YBWLp4XCUyD70tzoJ74qKmW/UsAgAAD2+E=
Date: Wed, 14 Oct 2020 12:09:22 +0000
Message-ID: 
 <AM0PR08MB3409D9F8AD42A1BD7889C01BFA050@AM0PR08MB3409.eurprd08.prod.outlook.com>
References: 
 <20201014114801.32608-1-kamil.dziezyk@arm.com>,<13419.1602676470843239886@lists.yoctoproject.org>
In-Reply-To: <13419.1602676470843239886@lists.yoctoproject.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 54fd039e-9ccb-4493-2d43-08d8703a031f
x-ms-traffictypediagnostic: AM4PR08MB2691:|DB6PR0802MB2471:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB2471DBF29074FCF13D40B401FA050@DB6PR0802MB2471.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3173;OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 RE76gJ0aP12bTh6x2vj7GHbTjBMikqjA/zRJNlL+ED2awq5R+pDYCkL1fRg4RQVHXAGvvjf/oIn7+pXKl0F7hWAi6hLXNW/D6hSywTkjzVo6x1hDP9KZQaTuCSWC05/HpC2qfiH2g4drJTY8nu9Yx1JbC/gKOfzBlq3FOG0z2W61TfOUic7hHoZJvyv6S+XhMvUZadZRP8WKA+4qPvnfLzk/YMxt8F/7U5uascgpyka+MJXUyUAilSXODkFHB7OOPbMYLHk7J48TYzAeJtH4QQsQOpqNKVAc5/zazc2AnrTRrUmQjmdtLwY4z6M0NwJc6nMpnqeBlT6iIGAm5UGSudl2o4qC5I4SSp8YFKKkP7gJwZHbpkuw/66Jq7cHPylJt1AXRhxLry3pzVaqJjIpnScEspxOCsml7lxEg5VJ74X7HbYG+evCrSPRzQj242PWmmVNh0xRvCkwH2qkuSxwVMoFrkJKAdYz0qjbLgtoTMR38MTMZV4WlDyohBMMU8y2JhkZrGnlkAhukz/S1/i0Lg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3409.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(346002)(366004)(136003)(66446008)(478600001)(66556008)(966005)(76116006)(8676002)(2906002)(186003)(52536014)(5660300002)(6506007)(83380400001)(110136005)(53546011)(9686003)(33656002)(30864003)(83080400001)(15974865002)(64756008)(55016002)(66476007)(7696005)(8936002)(86362001)(66946007)(26005)(6636002)(71200400001)(316002)(586874002)(473944003)(414714003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 TG6EHYI9jTkk2B5hSbe7/sbYDGSk0QnZxxdruK3QEjRGmXMpzISstUy8LPBcjy9IYva02tEB0sJMSatvQ779vSoVbeTU4NfOypMwy5xVZSk8rUlRDyVznF5xVRkiBR08S9IPOQ7zSBR70O1Yh3SE5ZAY3o/RLjEgGbJNwvGnWIwO9RKkKz3dZpnVdNUynPc1FlBYUESJDJFo0aru7sOlhvtgMqs8BrCHCjqVZ3Pj6zjkqUmOVKisB7XEvF25cECXT0Ij2g4c0ua+xX7f+HMPlUoDmE99suFd8rri75sYBaq8gJBw6/KsH+le/m9li89zs1eLzHukiIVZoRt2mCOOOxH6WyXtgLw6qJaoRNwJHSsSiH7oIIRNrC7X7jpRdkbloXp/SlabjQlZxO9sJKu2Y2yFBblk2FJbDOjjbwQhDWwPaMtv60vc3BXQzgB1G4y1vAyzN99ULB+7Cs7Qpu2I1hg1Nt2RybUq3iPecoUdY2NSOdmIlKpcL4DrcrlVkgPetDDvWTXgdVoyUr0HKriu2cbTRqWzij5/OIJb6wNHmgvSwB7+4Zj9GGypRJz0kqetJ9m7qgTrq+6IL7HLCmHQuMTwpjI/wm59evkVn8LbtZo+Y7dL30dLnLMTh70CD1z2pO2plBI3NLE6H3kxI+dYrw==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2691
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2c0a152b-e192-4f6e-346b-08d87039fc70
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	p9tsfOXCDKEKS98k5xUCwTKQoLMaCCh8rwvyHp7549anJYcl21LrA/efhuBNjyTB5pUhDoBChAldiPXngWmA2qhVI4/0vE5fs6iGLc3JBz8XFBYEm+9gvEIvF2xQc1cEReVRag2jfIoEO/b5eNP7hsQWJIxWcanx+ebiPPC+29Z1VQey9B/Hi7OfUrlTDxtDFR6ak+sNrt4YcTqShos5UbIkCxKGRLalIY4z7B/Jlc1tCA+TqxZY7lT+UpB1+2JimkOjUpQjQ0olfPTczs6sm6kk1XJPvjjViV89+Hnr4W/LXQIjvxaGrhWhEiTwi67IqLw2SoGMxSjLAIBKlx0KpU4lvKqeb70xE4Ks+go+zbq9j2DhKt5ImOGoTqURWSFauYMAs9vEpgoF1umFwsyGZnefcJkrXLyV90A3yOF6Fg9XcJgA5eQzoEYbOfOyxPY6UWCJeLSpQGA28YhkK643KDLMZWFOx+eeA/H2RnyLKBlzO2mWL4yjBlVqpawykuSrYchK9qELbD5BtBAnKNzcnaluQTJuztb3FRTengiC+vGm4dIULQOJMJObyQlsz8g6
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(46966005)(966005)(8676002)(30864003)(15974865002)(47076004)(8936002)(9686003)(83380400001)(81166007)(82740400003)(70586007)(83080400001)(70206006)(356005)(2906002)(52536014)(6636002)(5660300002)(478600001)(33656002)(110136005)(336012)(186003)(86362001)(26005)(53546011)(7696005)(316002)(82310400003)(55016002)(6506007)(586874002)(414714003)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2020 12:09:33.5614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54fd039e-9ccb-4493-2d43-08d8703a031f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2471
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

=0A=
=0A=
________________________________________=0A=
From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> on =
behalf of Diego Sueiro via lists.yoctoproject.org <diego.sueiro=3Darm.com@l=
ists.yoctoproject.org>=0A=
Sent: Wednesday, October 14, 2020 5:24 PM=0A=
To: meta-arm@lists.yoctoproject.org=0A=
Subject: Re: [meta-arm] [PATCH] arm-bsp/n1sdp: add board firmware recipe an=
d documentation=0A=
=0A=
On Wed, Oct 14, 2020 at 12:48 PM, Kamil Dziezyk wrote:=0A=
=0A=
>=0A=
> board-firmware:=0A=
>  * updates scp binaries=0A=
>  * Custom license - STM-SLA0044-Rev5 - added in layer.conf,=0A=
>    whitelisted in n1sdp.conf.=0A=
>=0A=
> firmware-image:=0A=
>  * Combines uefi, tf-a and scp binaries into a tarball.=0A=
>  * There are 2 flavours available:=0A=
>    - n1sdp-board-firmware_primary.tar.gz=0A=
>    - n1sdp-board-firmware_secondary.tar.gz=0A=
>=0A=
> Change-Id: I82d0c995956310a569b27431f98f7c21accf8330=0A=
> Issue-Id: SCM-1508=0A=
> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>=0A=
=0A=
> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>=0A=
=0A=
Tested-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>=0A=
=0A=
> ---=0A=
>  meta-arm-bsp/conf/layer.conf                  |  3 +=0A=
>  meta-arm-bsp/conf/machine/n1sdp.conf          |  5 ++=0A=
>  meta-arm-bsp/custom-licenses/STM-SLA0044-Rev5 | 18 +++++=0A=
>  meta-arm-bsp/documentation/n1sdp.md           | 64 +++++++++++++++=0A=
>  .../images/board-firmware-n1sdp_2020.07.27.bb | 53 ++++++++++++=0A=
>  .../images/sdcard-image-n1sdp_0.1.bb          | 80 +++++++++++++++++++=
=0A=
>  6 files changed, 223 insertions(+)=0A=
>  create mode 100644 meta-arm-bsp/custom-licenses/STM-SLA0044-Rev5=0A=
>  create mode 100644 meta-arm-bsp/documentation/n1sdp.md=0A=
>  create mode 100644=0A=
> meta-arm-bsp/recipes-bsp/images/board-firmware-n1sdp_2020.07.27.bb=0A=
>  create mode 100644 meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.=
1.bb=0A=
>=0A=
> diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf=
=0A=
> index 816ff9d..4214132 100644=0A=
> --- a/meta-arm-bsp/conf/layer.conf=0A=
> +++ b/meta-arm-bsp/conf/layer.conf=0A=
> @@ -11,3 +11,6 @@ BBFILE_PRIORITY_meta-arm-bsp =3D "6"=0A=
>=0A=
>  LAYERDEPENDS_meta-arm-bsp =3D "core meta-arm meta-kernel"=0A=
>  LAYERSERIES_COMPAT_meta-arm-bsp =3D "dunfell gatesgarth"=0A=
> +=0A=
> +# Additional license directories.=0A=
> +LICENSE_PATH +=3D "${LAYERDIR}/custom-licenses"=0A=
> diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf=0A=
> b/meta-arm-bsp/conf/machine/n1sdp.conf=0A=
> index 9df3e50..8d143fe 100644=0A=
> --- a/meta-arm-bsp/conf/machine/n1sdp.conf=0A=
> +++ b/meta-arm-bsp/conf/machine/n1sdp.conf=0A=
> @@ -38,3 +38,8 @@ EXTRA_IMAGEDEPENDS +=3D "virtual/uefi-firmware"=0A=
>  #grub-efi=0A=
>  EFI_PROVIDER ?=3D "grub-efi"=0A=
>  MACHINE_FEATURES +=3D "efi"=0A=
> +=0A=
> +# SD-Card firmware=0A=
> +# Board firmware prebuilts are shared under custom license=0A=
> +LICENSE_FLAGS_WHITELIST +=3D "stm-sla0044"=0A=
> +EXTRA_IMAGEDEPENDS +=3D "sdcard-image-n1sdp"=0A=
> diff --git a/meta-arm-bsp/custom-licenses/STM-SLA0044-Rev5=0A=
> b/meta-arm-bsp/custom-licenses/STM-SLA0044-Rev5=0A=
> new file mode 100644=0A=
> index 0000000..edb5cd5=0A=
> --- /dev/null=0A=
> +++ b/meta-arm-bsp/custom-licenses/STM-SLA0044-Rev5=0A=
> @@ -0,0 +1,18 @@=0A=
> +SLA0044 Rev5/February 2018=0A=
> +=0A=
> +BY INSTALLING COPYING, DOWNLOADING, ACCESSING OR OTHERWISE USING THIS=0A=
> SOFTWARE OR ANY PART THEREOF (AND THE RELATED DOCUMENTATION) FROM=0A=
> STMICROELECTRONICS INTERNATIONAL N.V, SWISS BRANCH AND/OR ITS AFFILIATED=
=0A=
> COMPANIES (STMICROELECTRONICS), THE RECIPIENT, ON BEHALF OF HIMSELF OR=0A=
> HERSELF, OR ON BEHALF OF ANY ENTITY BY WHICH SUCH RECIPIENT IS EMPLOYED A=
ND/OR=0A=
> ENGAGED AGREES TO BE BOUND BY THIS SOFTWARE LICENSE AGREEMENT.=0A=
> +=0A=
> +Under STMicroelectronics=92 intellectual property rights, the redistribu=
tion,=0A=
> reproduction and use in source and binary forms of the software or any pa=
rt=0A=
> thereof, with or without modification, are permitted provided that the=0A=
> following conditions are met:=0A=
> +1.   Redistribution of source code (modified or not) must retain any cop=
yright=0A=
> notice, this list of conditions and the disclaimer set forth below as ite=
ms 10=0A=
> and 11.=0A=
> +2.   Redistributions in binary form, except as embedded into microcontro=
ller or=0A=
> microprocessor device manufactured by or for STMicroelectronics or a soft=
ware=0A=
> update for such device, must reproduce any copyright notice provided with=
 the=0A=
> binary code, this list of conditions, and the disclaimer set forth below =
as=0A=
> items 10 and 11, in documentation and/or other materials provided with th=
e=0A=
> distribution.=0A=
> +3.   Neither the name of STMicroelectronics nor the names of other contr=
ibutors=0A=
> to this software may be used to endorse or promote products derived from =
this=0A=
> software or part thereof without specific written permission.=0A=
> +4.   This software or any part thereof, including modifications and/or=
=0A=
> derivative works of this software, must be used and execute solely and=0A=
> exclusively on or in combination with a microcontroller or microprocessor=
=0A=
> device manufactured by or for STMicroelectronics.=0A=
> +5.   No use, reproduction or redistribution of this software partially o=
r=0A=
> totally may be done in any manner that would subject this software to any=
 Open=0A=
> Source Terms. =93Open Source Terms=94 shall mean any open source license =
which=0A=
> requires as part of distribution of software that the source code of such=
=0A=
> software is distributed therewith or otherwise made available, or open so=
urce=0A=
> license that substantially complies with the Open Source definition speci=
fied=0A=
> at www.opensource.org and any other comparable open source license such a=
s for=0A=
> example GNU General Public License (GPL), Eclipse Public License (EPL), A=
pache=0A=
> Software License, BSD license or MIT license.=0A=
> +6.   STMicroelectronics has no obligation to provide any maintenance, su=
pport=0A=
> or updates for the software.=0A=
> +7.   The software is and will remain the exclusive property of=0A=
> STMicroelectronics and its licensors. The recipient will not take any act=
ion=0A=
> that jeopardizes STMicroelectronics and its licensors' proprietary rights=
 or=0A=
> acquire any rights in the software, except the limited rights specified=
=0A=
> hereunder.=0A=
> +8.   The recipient shall comply with all applicable laws and regulations=
=0A=
> affecting the use of the software or any part thereof including any appli=
cable=0A=
> export control law or regulation.=0A=
> +9.   Redistribution and use of this software or any part thereof other t=
han as=0A=
> permitted under this license is void and will automatically terminate you=
r=0A=
> rights under this license.=0A=
> +10.  THIS SOFTWARE IS PROVIDED BY STMICROELECTRONICS AND CONTRIBUTORS "A=
S IS"=0A=
> AND ANY EXPRESS, IMPLIED OR STATUTORY WARRANTIES, INCLUDING, BUT NOT LIMI=
TED=0A=
> TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR=
=0A=
> PURPOSE AND NON-INFRINGEMENT OF THIRD PARTY INTELLECTUAL PROPERTY RIGHTS,=
=0A=
> WHICH ARE DISCLAIMED TO THE FULLEST EXTENT PERMITTED BY LAW. IN NO EVENT =
SHALL=0A=
> STMICROELECTRONICS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,=0A=
> INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT =
NOT=0A=
> LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DAT=
A, OR=0A=
> PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF=0A=
> LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING=0A=
> NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWA=
RE,=0A=
> EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.=0A=
> +11.  EXCEPT AS EXPRESSLY PERMITTED HEREUNDER, NO LICENSE OR OTHER RIGHTS=
,=0A=
> WHETHER EXPRESS OR IMPLIED, ARE GRANTED UNDER ANY PATENT OR OTHER INTELLE=
CTUAL=0A=
> PROPERTY RIGHTS OF STMICROELECTRONICS OR ANY THIRD PARTY.=0A=
> +=0A=
> +=0A=
> diff --git a/meta-arm-bsp/documentation/n1sdp.md=0A=
> b/meta-arm-bsp/documentation/n1sdp.md=0A=
> new file mode 100644=0A=
> index 0000000..24e35f0=0A=
> --- /dev/null=0A=
> +++ b/meta-arm-bsp/documentation/n1sdp.md=0A=
> @@ -0,0 +1,64 @@=0A=
> +# N1SDP Development Platform Support in meta-arm-bsp=0A=
> +=0A=
> +## Configuration:=0A=
> +In the local.conf file, MACHINE should be set as follow:=0A=
> +MACHINE ?=3D "n1sdp"=0A=
> +=0A=
> +## Building=0A=
> +```bash$ bitbake core-image-minimal```=0A=
> +=0A=
> +## Running=0A=
> +=0A=
> +# Update Firmware on SD card:=0A=
> +=0A=
> +(*) To use n1sdp board in single chip mode, flash:=0A=
> +    n1sdp-board-firmware_primary.tar.gz firmware.=0A=
> +=0A=
> +(*) To use n1sdp board in multi chip mode, flash:=0A=
> +    n1sdp-board-firmware_primary.tar.gz firmware to primary board,=0A=
> +    n1sdp-board-firmware_secondary.tar.gz firmware to secondary board.=
=0A=
> +=0A=
> +The SD card content is generated during the build here:=0A=
> +  tmp/deploy/images/n1sdp/n1sdp-board-firmware_primary.tar.gz=0A=
> +  tmp/deploy/images/n1sdp/n1sdp-board-firmware_secondary.tar.gz=0A=
> +=0A=
> +=0A=
> +Its content must be written on the N1SDP firmware SD card.=0A=
> +To do this:=0A=
> +- insert the sdcard of the N1SDP in an SD card reader and mount it:=0A=
> +```bash$ sudo mount /dev/sdx1 /mnt```=0A=
> +(replace sdx by the device of the SD card)=0A=
> +=0A=
> +- erase its content and put the new one:=0A=
> +```bash$ sudo rm -rf /mnt/*```=0A=
> +```bash$ sudo tar --no-same-owner -xzf=0A=
> tmp/deploy/images/n1sdp/n1sdp-board-firmware_primary.tar.gz -C /mnt/```=
=0A=
> +```bash$ sudo umount /mnt```=0A=
> +=0A=
> +- reinsert the SD card in the N1SDP board=0A=
> +=0A=
> +Firmware tarball contains iofpga configuration files, scp and uefi binar=
ies.=0A=
> +=0A=
> +**NOTE**:=0A=
> +If the N1SDP board was manufactured after November 2019 (Serial Number=
=0A=
> greater=0A=
> +than 36253xxx), a different PMIC firmware image must be used to prevent=
=0A=
> +potential damage to the board. More details can be found in [1].=0A=
> +The `MB/HBI0316A/io_v123f.txt` file located in the microSD needs to be=
=0A=
> updated.=0A=
> +To update it, set the PMIC image (300k_8c2.bin) to be used in the newer=
=0A=
> models=0A=
> +by running the following commands on your host PC:=0A=
> +=0A=
> +    $ sudo umount /dev/sdx1=0A=
> +    $ sudo mount /dev/sdx1 /mnt=0A=
> +    $ sudo sed -i '/^MBPMIC: pms_0V85.bin/s/^/;/g'=0A=
> /mnt/MB/HBI0316A/io_v123f.txt=0A=
> +    $ sudo sed -i '/^;MBPMIC: 300k_8c2.bin/s/^;//g'=0A=
> /mnt/MB/HBI0316A/io_v123f.txt=0A=
> +    $ sudo umount /mnt=0A=
> +=0A=
> +# Prepare an USB hard drive:=0A=
> +=0A=
> +Grub boot partition is placed on first partition of the *.wic image,=0A=
> +Linux root file system is placed on the second partition of the *.wic im=
age:=0A=
> +  tmp/deploy/images/n1sdp/core-image-minimal-n1sdp.wic=0A=
> +=0A=
> +This *.wic image should be copied to USB stick with simple dd call.=0A=
> +=0A=
> +=0A=
> +[1]:=0A=
> https://community.arm.com/developer/tools-software/oss-platforms/w/docs/6=
04/notice-potential-damage-to-n1sdp-boards-if-using-latest-firmware-release=
=0A=
> diff --git=0A=
> a/meta-arm-bsp/recipes-bsp/images/board-firmware-n1sdp_2020.07.27.bb=0A=
> b/meta-arm-bsp/recipes-bsp/images/board-firmware-n1sdp_2020.07.27.bb=0A=
> new file mode 100644=0A=
> index 0000000..e52a019=0A=
> --- /dev/null=0A=
> +++ b/meta-arm-bsp/recipes-bsp/images/board-firmware-n1sdp_2020.07.27.bb=
=0A=
> @@ -0,0 +1,53 @@=0A=
> +DESCRIPTION =3D "Board Firmware binaries for N1SDP"=0A=
> +=0A=
> +# Board-firmware-n1sdp custom license is whitelisted in n1sdp.conf file.=
=0A=
> +# Uncomment, or copy this line to your local.conf to build board firmwar=
e,=0A=
> +# if you are using custom n1sdp.conf file.=0A=
> +# Please make sure to check the applicable license beforehand!=0A=
> +#LICENSE_FLAGS_WHITELIST =3D "stm-sla0044"=0A=
> +=0A=
> +LICENSE =3D "STM-SLA0044-Rev5"=0A=
> +LICENSE_FLAGS =3D "stm-sla0044"=0A=
> +=0A=
> +LIC_FILES_CHKSUM =3D=0A=
> "file://${S}/LICENSES/STM.TXT;md5=3D4b8dab81d0bfc0a5f63c9a983402705b"=0A=
> +=0A=
> +SECTION =3D "firmware"=0A=
> +=0A=
> +inherit deploy=0A=
> +=0A=
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"=0A=
> +=0A=
> +COMPATIBLE_MACHINE =3D "n1sdp"=0A=
> +RM_WORK_EXCLUDE +=3D "${PN}"=0A=
> +=0A=
> +PV =3D "2020.07.27"=0A=
> +TAG =3D "N1SDP-${PV}"=0A=
> +FIRMWARE_TARBALL =3D "n1sdp-board-firmware-${TAG}"=0A=
> +UNPACK_DIR =3D "n1sdp-board-firmware_source"=0A=
> +S =3D "${WORKDIR}/${UNPACK_DIR}"=0A=
> +=0A=
> +SRC_URI =3D=0A=
> "https://git.linaro.org/landing-teams/working/arm/n1sdp-board-firmware.gi=
t/snapshot/${FIRMWARE_TARBALL}.tar.gz;unpack=3D0"=0A=
> +SRC_URI[md5sum] =3D "8ba3807ff8f222201154861f11524b14"=0A=
> +SRC_URI[sha256sum] =3D=0A=
> "57feba404026f2d6d49c167d63e0e84653ad8b808b13e2244b81fea9e0d58d66"=0A=
> +=0A=
> +do_configure[noexec] =3D "1"=0A=
> +do_compile[noexec] =3D "1"=0A=
> +=0A=
> +do_install() {=0A=
> +    cd ${WORKDIR}=0A=
> +    tar -xvaf ${WORKDIR}/${FIRMWARE_TARBALL}.tar.gz=0A=
> --exclude=3D${FIRMWARE_TARBALL}/SOFTWARE/*=0A=
> +    mv -v ${WORKDIR}/${FIRMWARE_TARBALL}/* ${S}=0A=
> +=0A=
> +    cp -av ${S} ${D}=0A=
> +}=0A=
> +do_install[dirs] +=3D "${S}"=0A=
> +do_install[cleandirs] +=3D "${S}"=0A=
> +=0A=
> +FILES_${PN} =3D "/${UNPACK_DIR}/*"=0A=
> +SYSROOT_DIRS +=3D "/${UNPACK_DIR}"=0A=
> +addtask install after do_unpack before do_populate_lic=0A=
> +=0A=
> +do_deploy() {=0A=
> +    cp -av ${S} ${DEPLOYDIR}=0A=
> +}=0A=
> +addtask deploy after do_install=0A=
> diff --git a/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb=0A=
> b/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb=0A=
> new file mode 100644=0A=
> index 0000000..9749d70=0A=
> --- /dev/null=0A=
> +++ b/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb=0A=
> @@ -0,0 +1,80 @@=0A=
> +SUMMARY =3D "Firmware image recipe for generating SD-Card artifacts."=0A=
> +=0A=
> +inherit deploy nopackages=0A=
> +=0A=
> +DEPENDS =3D "virtual/uefi-firmware \=0A=
> +           virtual/control-processor-firmware \=0A=
> +           board-firmware-n1sdp"=0A=
> +=0A=
> +LICENSE =3D "MIT"=0A=
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"=0A=
> +COMPATIBLE_MACHINE =3D "n1sdp"=0A=
> +RM_WORK_EXCLUDE +=3D "${PN}"=0A=
> +do_configure[noexec] =3D "1"=0A=
> +do_compile[noexec] =3D "1"=0A=
> +do_install[noexec] =3D "1"=0A=
> +=0A=
> +FIRMWARE_DIR =3D "n1sdp-board-firmware_source"=0A=
> +PRIMARY_DIR =3D "${WORKDIR}/n1sdp-board-firmware_primary"=0A=
> +SECONDARY_DIR =3D "${WORKDIR}/n1sdp-board-firmware_secondary"=0A=
> +=0A=
> +SOC_BINARIES_PRIMARY =3D "mcp_rom.bin scp_rom.bin ${SOC_BINARIES_SECONDA=
RY}"=0A=
> +SOC_BINARIES_SECONDARY =3D "mcp_fw.bin scp_fw.bin"=0A=
> +=0A=
> +=0A=
> +prepare_package() {=0A=
> +    cd ${WORKDIR}=0A=
> +=0A=
> +    # Master/Primary=0A=
> +    cp -av ${RECIPE_SYSROOT}/${FIRMWARE_DIR}/* ${PRIMARY_DIR}=0A=
> +    mkdir -p ${PRIMARY_DIR}/SOFTWARE/=0A=
> +=0A=
> +    # Copy uefi binary=0A=
> +    cp -v ${RECIPE_SYSROOT}/firmware/uefi.bin ${PRIMARY_DIR}/SOFTWARE/=
=0A=
> +=0A=
> +    # Copy SOC binaries=0A=
> +    for f in ${SOC_BINARIES_PRIMARY}; do=0A=
> +        cp -v ${RECIPE_SYSROOT}/firmware/${f} ${PRIMARY_DIR}/SOFTWARE/=
=0A=
> +    done=0A=
> +=0A=
> +    sed -ie 's|^C2C_ENABLE.*|C2C_ENABLE: TRUE            ;C2C enable=0A=
> TRUE/FALSE|' \=0A=
> +        ${PRIMARY_DIR}/MB/HBI0316A/io_v123f.txt=0A=
> +    sed -ie 's|^C2C_SIDE.*|C2C_SIDE: MASTER            ;C2C side=0A=
> SLAVE/MASTER|' \=0A=
> +        ${PRIMARY_DIR}/MB/HBI0316A/io_v123f.txt=0A=
> +    sed -ie 's|.*SOCCON: 0x1170.*PLATFORM_CTRL.*|SOCCON: 0x1170 0x000001=
00=0A=
> ;SoC SCC PLATFORM_CTRL|' \=0A=
> +        ${PRIMARY_DIR}/MB/HBI0316A/io_v123f.txt=0A=
> +=0A=
> +    # Slave/Secondary=0A=
> +    cp -av ${RECIPE_SYSROOT}/${FIRMWARE_DIR}/* ${SECONDARY_DIR}=0A=
> +    mkdir -p ${SECONDARY_DIR}/SOFTWARE/=0A=
> +=0A=
> +    # Copy SOC binaries=0A=
> +    for f in ${SOC_BINARIES_SECONDARY}; do=0A=
> +        cp -v ${RECIPE_SYSROOT}/firmware/${f} ${SECONDARY_DIR}/SOFTWARE/=
=0A=
> +    done=0A=
> +=0A=
> +    sed -ie 's|^C2C_ENABLE.*|C2C_ENABLE: TRUE            ;C2C enable=0A=
> TRUE/FALSE|' \=0A=
> +        ${SECONDARY_DIR}/MB/HBI0316A/io_v123f.txt=0A=
> +    sed -ie 's|^C2C_SIDE.*|C2C_SIDE: SLAVE             ;C2C side=0A=
> SLAVE/MASTER|' \=0A=
> +        ${SECONDARY_DIR}/MB/HBI0316A/io_v123f.txt=0A=
> +    sed -ie 's|.*SOCCON: 0x1170.*PLATFORM_CTRL.*|SOCCON: 0x1170 0x000001=
01=0A=
> ;SoC SCC PLATFORM_CTRL|' \=0A=
> +        ${SECONDARY_DIR}/MB/HBI0316A/io_v123f.txt=0A=
> +}=0A=
> +=0A=
> +do_deploy() {=0A=
> +    # prepare Master & Slave packages=0A=
> +    prepare_package=0A=
> +=0A=
> +    for dir in ${PRIMARY_DIR} ${SECONDARY_DIR}; do=0A=
> +        dir_name=3D$(basename ${dir})=0A=
> +        mkdir -p ${D}/${dir_name}=0A=
> +        cp -av ${dir} ${D}=0A=
> +=0A=
> +        # Compress the files=0A=
> +        tar -C ${D}/${dir_name} -zcvf ${DEPLOYDIR}/${dir_name}.tar.gz ./=
=0A=
> +    done=0A=
> +}=0A=
> +do_deploy[dirs] +=3D "${PRIMARY_DIR} ${SECONDARY_DIR}"=0A=
> +do_deploy[cleandirs] +=3D "${PRIMARY_DIR} ${SECONDARY_DIR}"=0A=
> +do_deploy[umask] =3D "022"=0A=
> +addtask deploy after do_populate_sysroot=0A=
> --=0A=
> 2.17.1=0A=
>=0A=
>=0A=
