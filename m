Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.74])
 by mx.groups.io with SMTP id smtpd.web11.6879.1588928455382437767
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 May 2020 02:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=2Axhibcu;
 spf=pass (domain: arm.com, ip: 40.107.5.74, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umgHIy4QHdYrQSkMpDp773q5dAuHe3Gfsbok8y3Z12s=;
 b=2AxhibcutL43drk5YR5bexPNXqTDjYT+syVq+nxx73gxpvtG5sR0+/+dQ++qSzLuW9M/ldJKwYIuo4U8dgsgs0XMk1/EqM8UybB6GBWNMVbeONhRsEW0xrUGYYjdXo0JmMwSt7UQ6MLh0ASMb0jV+vc5kT7CWqYMc+62OfKUM0U=
Received: from MR2P264CA0070.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:31::34)
 by AM5PR0802MB2546.eurprd08.prod.outlook.com (2603:10a6:203:9f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Fri, 8 May
 2020 09:00:52 +0000
Received: from VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:31:cafe::c0) by MR2P264CA0070.outlook.office365.com
 (2603:10a6:500:31::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend
 Transport; Fri, 8 May 2020 09:00:52 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT005.mail.protection.outlook.com (10.152.18.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Fri, 8 May 2020 09:00:51 +0000
Received: ("Tessian outbound fb9de21a7e90:v54"); Fri, 08 May 2020 09:00:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4ead8b89ad55fb0c
X-CR-MTA-TID: 64aa7808
Received: from 6db65a4bc08d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5ECE17BA-3F1B-4A09-B6BC-4FD42FA1DCF6.1;
	Fri, 08 May 2020 09:00:45 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6db65a4bc08d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 08 May 2020 09:00:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZEpIf6vp1f2IY3p+gEU9kRDVwa4A9U9DPZ14w2Sls1IhFZth7sowFTPDTs1RMXNrDp/EFvFWcWd52bEIjatZJGkSbHFl8qua+LErCRTbhuzXqwZzQ3xTXidq6JhVB5iFkmYYinXngohFhxYqkMuzd+kveCxFGw1grRmGOBbatlRtMXkuP6VLzw+kiHYONj1P55Fsk+TfINiZUrAYJmiNtsp3oF/OvaDc7/hVBpKYozzbHmLFgz/1+vzJAYeiupEkHDnx8+2PKOvsIw8DZ86nelLaHwjP9aj2XPNNcXQ7t3iLndEasp2QZ13qqEFIPLVvgdkRR7GfqL8fnhLvgzwSyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umgHIy4QHdYrQSkMpDp773q5dAuHe3Gfsbok8y3Z12s=;
 b=DgTdog/juBXi+Vl9UrHbkmUEP8YZLj//OIZo1ZwWgL7Sw53q+B2anar4ZefUOXQPW+I7jnvQWVxgOnJa0C4d1n76hMS2ycEGbpumYa+lqj1rqmRIkK4IGVmM2WhkqR1cTzkvIzQubNi3WP9N2KlT9Knl2V3/ldF0mTFVG3byGE/jF7YWZigp83OGO9bt9CQHIHfLY96fKEByZokYXtjMhjiyaVEZEp6KICd1Jpf/XFolnJn74oKX87e26U3O3Eu3UGDIRiFl/QKup/RUAxi841kBSyPOi7gOhmJ8EHwGCqMcC1Jd7HdUE/RsGzZTyBY4frb7ZDUOz77lmPnyQlD/WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umgHIy4QHdYrQSkMpDp773q5dAuHe3Gfsbok8y3Z12s=;
 b=2AxhibcutL43drk5YR5bexPNXqTDjYT+syVq+nxx73gxpvtG5sR0+/+dQ++qSzLuW9M/ldJKwYIuo4U8dgsgs0XMk1/EqM8UybB6GBWNMVbeONhRsEW0xrUGYYjdXo0JmMwSt7UQ6MLh0ASMb0jV+vc5kT7CWqYMc+62OfKUM0U=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB4617.eurprd08.prod.outlook.com (2603:10a6:10:75::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Fri, 8 May
 2020 09:00:43 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2958.034; Fri, 8 May 2020
 09:00:43 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] [arm-autonomy] Move meta-arm-bsp machines settings to BBFILES_DYNAMIC
Thread-Topic: [meta-arm] [PATCH] [arm-autonomy] Move meta-arm-bsp machines
 settings to BBFILES_DYNAMIC
Thread-Index: AQHWJF+RHVCbZQNstEuKSCxtQ+JTf6id5Y+A
Date: Fri, 8 May 2020 09:00:43 +0000
Message-ID: <EE6E3974-859B-45A1-B6CD-D34179AF59F1@arm.com>
References: <160CBA41ADD6F47B.2169@lists.yoctoproject.org>
In-Reply-To: <160CBA41ADD6F47B.2169@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ab02e774-56ba-4a86-9284-08d7f32e4f0e
x-ms-traffictypediagnostic: DB7PR08MB4617:|AM5PR0802MB2546:
X-Microsoft-Antispam-PRVS: 
	<AM5PR0802MB2546EE52CD6ACC6EEB6347439DA20@AM5PR0802MB2546.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 039735BC4E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 fO6N6HmYhzWo9+9adtsF5tfYGslXNeKwKn2fNcO4H+J6W7LhTPBn49qgsbE1nhq9pic1zqSyBzdmc6dLQzrntcbjT0tvuDGHp8X9hrzAmslz/wsa72rTUsR+b0/nlwe2uyDFhN3DZG9e07GgZhExLaBK1e1XVOhybS1OlosH3JfQ3XdOxAXnXfGnETPPy6/Ergd7BwF6v7Bs4oaBED28FS3UPPeqtqz9k4HEOzyOUQHbNObltGBoMiXkegQ/qiiGBZqtiWxPkewZmjwjwRsN0AZhxiYSpBLriY9mtftGvatvv+QkuhsurWQK7Io1/NHw9R29UFCRj10d8QgIQrZDOEDuynUYcdrtTZbJgwfdPcHRHnOb1f5a/RkaP3m+WFIKmJiHObFyB5duD8qjSFicbUq55Kpwbz4pnWkka+l4dzAxkVlHFS1XtLYBnZQOCwM5mRzkkLmOm4KqpogIM5p6RT7YAk9h9XmdMZObHAPrkbbtDGOXvkGhseutXsLfzNQzMrRBTtu5YiFDP9txW5Zh6kXFUO8kQtMLuLyLJWHJZB1019vdXiV0TKhW+rZvNQBS4s7bHTplj4nio/loEjEOjTGFOKY/Gcom7JjChlZFDX0=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(33430700001)(91956017)(186003)(26005)(6506007)(53546011)(2616005)(2906002)(71200400001)(36756003)(83300400001)(316002)(30864003)(6512007)(83310400001)(83320400001)(83290400001)(83280400001)(6486002)(966005)(33440700001)(8936002)(5660300002)(66446008)(6916009)(66946007)(86362001)(478600001)(4326008)(33656002)(66476007)(8676002)(64756008)(66556008)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 6BrxKID/waGGY2WfyGRfRHdqUe58W2l8BPXYZw8DHVhRLv+WkUK8Dl7Vrx2Zw4rc/O/WjKlPtN61kYetZcOMHymAwECHFlHMiANHjFsnB9L9HnIur9OW9ELiERYHTscLe61wMHebUjUenEJ76MCpLTYaTnB1K0qOqvkqQitzWorquAU4M6nMdOl2XwJhpoJKLJVNLcpjM062fdHp5J98yOiBOMF25jmi/ZjkgnsqlK/TmxfiIn36drceZZ0yo6SlJhIq1KTppqVbrTFOIsxv5+xyINoEjxOCtGQZQL4VnTbde/cbNJECG36JBooFSKbTa2RYr8iD7Pil1xradXe4wgpzpNNL/vqNIOM1eM3j7X0CHGGpuVv+CDCw2pP1LPYk60EYJXLgbTGIpkg8zqJ6RjsDm/J3esn+ETz+zYYnqwA7tB2h2swevNWlbbNPFpWeILvfMd54KpWmKDPlPsPW2II67DiKH9NiRaWvy2HZjw6M7doLe7EqPIIJZeCh6kGC
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4617
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(46966005)(33430700001)(336012)(5660300002)(2616005)(30864003)(33656002)(8936002)(8676002)(966005)(81166007)(356005)(82310400002)(2906002)(82740400003)(47076004)(36756003)(6512007)(4326008)(478600001)(26005)(316002)(70206006)(186003)(33440700001)(6916009)(6486002)(53546011)(86362001)(36906005)(70586007)(6506007);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6a0122ef-962b-4098-ff51-08d7f32e4a5c
X-Forefront-PRVS: 039735BC4E
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TDNFgekuAi8Ypv8z7KE/jY6fFSX4ycHVln6ePMLegv5M+Wv9i6ab23z1UvaF9ry5DJvENoTgD+hbiIOtEX0hsEf2Rkf05c+CmQIJNrHUFG3GwJLCgoJFC2iIpLZ+ImnXzrUJMHvTk/78D+zrn+s2l2r9DAhZ6DCroIW7w5bsSuMVAPuOLg0yP+B1eOHIgly9Cq27pDTMz9+JL6HyQ0CXmDtRDtmdchM4zLhWxR5twYJSIDEQZ9spK7sMsvcawVQjmOtSVrXeBc3ZqKGXkkz/R4lhSj9KS5L5g+GwYrvNjU3QXQ4djfQPh7JCaJ+MlFX4h/PFexgNI6eVwmbSZ5e3kq42DB5y2lEedquzltjFk531wurwvscMVdw/jNL+pjD6gqfRI9/FwLh6Q/Kzb12ScvmQLoeEJ+fzFGCQb4Pmtx+qDU66VmuXxRZ1HSQjOLNwA+uEe+ash2grs0CJGiJBOZ/iLGtdbXFGEXR1rnnf1l4dTQ9OcVgvajPlvbHxMO9BGQwP+rrSNsyMEVUOjGailToknexnyydTwGkdl5iQjub07imqBabQBvBlQCKls+FmyiRijIulJLYtQAzNkJF1g4McEPeHsEfSQtpiTWZBUM8TV/FIS1CwYr7nSCeuaSTmHrMMfCg1kmMU0lG7eRMsmQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2020 09:00:51.5155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab02e774-56ba-4a86-9284-08d7f32e4f0e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2546
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D01BE6E1CB18C2439E88D71469C6DF06@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 7 May 2020, at 12:03, Bertrand Marquis via lists.yoctoproject.org <be=
rtrand.marquis=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> From: Diego Sueiro <diego.sueiro@arm.com>
>=20
> All meta-arm-bsp machines specific settings should live at
> meta-arm-autonomy/dynamic-layers/meta-arm-bsp/ and only be included if
> meta-arm-bsp layer is present.
>=20
> Change-Id: Ice8a301db85b5186384d602d9e3bedb909183320
> Issue-Id: SCM-984
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> .../xen-devicetree/files/xen-juno.dtsi        |  0
> .../xen-devicetree/xen-devicetree.bbappend    |  0
> ...e-number-of-interrupt-lines-for-dom0.patch |  0
> .../recipes-extended/xen/files/fvp/defconfig  |  0
> .../recipes-extended/xen/files/juno/defconfig |  0
> .../recipes-extended/xen/xen_%.bbappend       | 27 +++++++++++++++++
> .../xenguest/xenguest-manager.bbappend        |  0
> .../xenguest/xenguest-network-bridge.bbappend |  0
> .../arm-autonomy/disable-arm64-sve.cfg        |  0
> .../arm-autonomy/disable-arm64-sve.scc        |  0
> .../recipes-kernel/linux/linux-%.bbappend     | 17 +++++++++++
> .../recipes-extended/xen/xen_%.bbappend       | 29 -------------------
> .../linux/linux-arm-autonomy.inc              | 13 +--------
> 13 files changed, 45 insertions(+), 41 deletions(-)
> rename meta-arm-autonomy/{ =3D> dynamic-layers/meta-arm-bsp}/recipes-ext=
ended/xen-devicetree/files/xen-juno.dtsi (100%)
> rename meta-arm-autonomy/{ =3D> dynamic-layers/meta-arm-bsp}/recipes-ext=
ended/xen-devicetree/xen-devicetree.bbappend (100%)
> rename meta-arm-autonomy/{recipes-extended/xen/files/4.12 =3D> dynamic-l=
ayers/meta-arm-bsp/recipes-extended/xen/files/4.12.0}/0001-xen-arm-Cap-the-=
number-of-interrupt-lines-for-dom0.patch (100%)
> rename meta-arm-autonomy/{ =3D> dynamic-layers/meta-arm-bsp}/recipes-ext=
ended/xen/files/fvp/defconfig (100%)
> rename meta-arm-autonomy/{ =3D> dynamic-layers/meta-arm-bsp}/recipes-ext=
ended/xen/files/juno/defconfig (100%)
> create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes=
-extended/xen/xen_%.bbappend
> rename meta-arm-autonomy/{ =3D> dynamic-layers/meta-arm-bsp}/recipes-ext=
ended/xenguest/xenguest-manager.bbappend (100%)
> rename meta-arm-autonomy/{ =3D> dynamic-layers/meta-arm-bsp}/recipes-ext=
ended/xenguest/xenguest-network-bridge.bbappend (100%)
> rename meta-arm-autonomy/{recipes-kernel/linux/arm-autonomy-kmeta =3D> d=
ynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra}/f=
eatures/arm-autonomy/disable-arm64-sve.cfg (100%)
> rename meta-arm-autonomy/{recipes-kernel/linux/arm-autonomy-kmeta =3D> d=
ynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra}/f=
eatures/arm-autonomy/disable-arm64-sve.scc (100%)
> create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes=
-kernel/linux/linux-%.bbappend
>=20
> diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen=
-juno.dtsi b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended=
/xen-devicetree/files/xen-juno.dtsi
> similarity index 100%
> rename from meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen-=
juno.dtsi
> rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended=
/xen-devicetree/files/xen-juno.dtsi
> diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devic=
etree.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-exte=
nded/xen-devicetree/xen-devicetree.bbappend
> similarity index 100%
> rename from meta-arm-autonomy/recipes-extended/xen-devicetree/xen-device=
tree.bbappend
> rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended=
/xen-devicetree/xen-devicetree.bbappend
> diff --git a/meta-arm-autonomy/recipes-extended/xen/files/4.12/0001-xen-=
arm-Cap-the-number-of-interrupt-lines-for-dom0.patch b/meta-arm-autonomy/dy=
namic-layers/meta-arm-bsp/recipes-extended/xen/files/4.12.0/0001-xen-arm-Ca=
p-the-number-of-interrupt-lines-for-dom0.patch
> similarity index 100%
> rename from meta-arm-autonomy/recipes-extended/xen/files/4.12/0001-xen-a=
rm-Cap-the-number-of-interrupt-lines-for-dom0.patch
> rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended=
/xen/files/4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.p=
atch
> diff --git a/meta-arm-autonomy/recipes-extended/xen/files/fvp/defconfig =
b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/=
fvp/defconfig
> similarity index 100%
> rename from meta-arm-autonomy/recipes-extended/xen/files/fvp/defconfig
> rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended=
/xen/files/fvp/defconfig
> diff --git a/meta-arm-autonomy/recipes-extended/xen/files/juno/defconfig=
 b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files=
/juno/defconfig
> similarity index 100%
> rename from meta-arm-autonomy/recipes-extended/xen/files/juno/defconfig
> rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended=
/xen/files/juno/defconfig
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-exten=
ded/xen/xen_%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/reci=
pes-extended/xen/xen_%.bbappend
> new file mode 100644
> index 0000000..bac391c
> --- /dev/null
> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen=
/xen_%.bbappend
> @@ -0,0 +1,27 @@
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
> +
> +# Machine specific settings
> +XEN_CONFIG_EARLY_PRINTK_juno =3D "juno"
> +XEN_CONFIG_EARLY_PRINTK_gem5-arm64 =3D "vexpress"
> +XEN_CONFIG_EARLY_PRINTK_fvp-base =3D "fastmodel"
> +XEN_CONFIG_EARLY_PRINTK_foundation-armv8 =3D "fastmodel"
> +
> +# Foundation-armv8 support
> +COMPATIBLE_MACHINE_foundation-armv8 =3D "foundation-armv8"
> +
> +SRC_URI_append_foundation-armv8 =3D " file://fvp/defconfig"
> +
> +# FVP Base support
> +COMPATIBLE_MACHINE_fvp-base =3D "fvp-base"
> +
> +SRC_URI_append_fvp-base =3D " file://fvp/defconfig"
> +
> +# Juno support
> +COMPATIBLE_MACHINE_juno =3D "juno"
> +
> +SRC_URI_append_juno =3D " file://juno/defconfig"
> +
> +# Gem5 support
> +# Fix problem with number of interrupts on gem5
> +SRC_URI_append_gem5-arm64 =3D " file://4.12.0/0001-xen-arm-Cap-the-numb=
er-of-interrupt-lines-for-dom0.patch"
> +
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manage=
r.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended=
/xenguest/xenguest-manager.bbappend
> similarity index 100%
> rename from meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager=
.bbappend
> rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended=
/xenguest/xenguest-manager.bbappend
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-networ=
k-bridge.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-e=
xtended/xenguest/xenguest-network-bridge.bbappend
> similarity index 100%
> rename from meta-arm-autonomy/recipes-extended/xenguest/xenguest-network=
-bridge.bbappend
> rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended=
/xenguest/xenguest-network-bridge.bbappend
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/f=
eatures/arm-autonomy/disable-arm64-sve.cfg b/meta-arm-autonomy/dynamic-laye=
rs/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-=
autonomy/disable-arm64-sve.cfg
> similarity index 100%
> rename from meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/fe=
atures/arm-autonomy/disable-arm64-sve.cfg
> rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/l=
inux/arm-autonomy-kmeta-extra/features/arm-autonomy/disable-arm64-sve.cfg
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/f=
eatures/arm-autonomy/disable-arm64-sve.scc b/meta-arm-autonomy/dynamic-laye=
rs/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-=
autonomy/disable-arm64-sve.scc
> similarity index 100%
> rename from meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/fe=
atures/arm-autonomy/disable-arm64-sve.scc
> rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/l=
inux/arm-autonomy-kmeta-extra/features/arm-autonomy/disable-arm64-sve.scc
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kerne=
l/linux/linux-%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/re=
cipes-kernel/linux/linux-%.bbappend
> new file mode 100644
> index 0000000..189645a
> --- /dev/null
> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux=
/linux-%.bbappend
> @@ -0,0 +1,17 @@
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}:"
> +
> +#
> +# arm-autonomy kmeta extra
> +#
> +SRC_URI_append =3D " file://arm-autonomy-kmeta-extra;type=3Dkmeta;name=
=3Darm-autonomy-kmeta-extra;destsuffix=3Darm-autonomy-kmeta-extra"
> +
> +# We need to turn off SVE support in the Linux kernel otherwise Xen is =
stopping
> +# Linux kernel with a coredump while trying to access XEN bit of CPACR1=
 core
> +# register.
> +LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE =3D "${@bb.utils.contains_any('DIS=
TRO_FEATURES', \
> +                                         'arm-autonomy-host arm-autonom=
y-guest', \
> +                                         ' features/arm-autonomy/disabl=
e-arm64-sve.scc','',d)}"
> +
> +KERNEL_FEATURES_append_gem5-arm64 =3D "${LINUX_ARM_AUTONOMY_DISABLE_ARM=
64_SVE}"
> +KERNEL_FEATURES_append_fvp-base =3D "${LINUX_ARM_AUTONOMY_DISABLE_ARM64=
_SVE}"
> +KERNEL_FEATURES_append_foundation-armv8 =3D "${LINUX_ARM_AUTONOMY_DISAB=
LE_ARM64_SVE}"
> diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend b/met=
a-arm-autonomy/recipes-extended/xen/xen_%.bbappend
> index fb5962a..92348e6 100644
> --- a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
> +++ b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
> @@ -1,37 +1,8 @@
> -# xen settings
> -
> -FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
> -
> #
> # Define early console based on board parameters
> #
>=20
> XEN_CONFIG_EARLY_PRINTK ??=3D "disable"
>=20
> -# Machine specific settings
> -XEN_CONFIG_EARLY_PRINTK_juno =3D "juno"
> -XEN_CONFIG_EARLY_PRINTK_gem5-arm64 =3D "vexpress"
> -XEN_CONFIG_EARLY_PRINTK_fvp-base =3D "fastmodel"
> -XEN_CONFIG_EARLY_PRINTK_foundation-armv8 =3D "fastmodel"
> -
> EXTRA_OEMAKE +=3D "${@bb.utils.contains('XEN_CONFIG_EARLY_PRINTK', 'disa=
ble', \
>     '', ' CONFIG_DEBUG=3Dy CONFIG_EARLY_PRINTK=3D${XEN_CONFIG_EARLY_PRIN=
TK}',d)}"
> -
> -# Foundation-armv8 support
> -COMPATIBLE_MACHINE_foundation-armv8 =3D "foundation-armv8"
> -
> -SRC_URI_append_foundation-armv8 =3D " file://fvp/defconfig"
> -
> -# FVP Base support
> -COMPATIBLE_MACHINE_fvp-base =3D "fvp-base"
> -
> -SRC_URI_append_fvp-base =3D " file://fvp/defconfig"
> -
> -# Juno support
> -COMPATIBLE_MACHINE_juno =3D "juno"
> -
> -SRC_URI_append_juno =3D " file://juno/defconfig"
> -
> -# Gem5 support
> -# Fix problem with number of interrupts on gem5
> -SRC_URI_append_gem5-arm64 =3D " file://${XEN_REL}/0001-xen-arm-Cap-the-=
number-of-interrupt-lines-for-dom0.patch"
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.i=
nc b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> index bb48950..2763444 100644
> --- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> +++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> @@ -1,23 +1,12 @@
> # Add arm-autonomy specific features to the kernel
>=20
> -FILESEXTRAPATHS_prepend :=3D "${THISDIR}:${THISDIR}/files:"
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}:"
>=20
> #
> # arm-autonomy kmeta
> #
> SRC_URI_append =3D " file://arm-autonomy-kmeta;type=3Dkmeta;name=3Darm-a=
utonomy-kmeta;destsuffix=3Darm-autonomy-kmeta"
>=20
> -# We need to turn off SVE support in the Linux kernel otherwise Xen is =
stopping
> -# Linux kernel with a coredump while trying to access XEN bit of CPACR1=
 core
> -# register.
> -LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE =3D "${@bb.utils.contains_any('DIS=
TRO_FEATURES', \
> -                                         'arm-autonomy-host arm-autonom=
y-guest', \
> -                                         ' features/arm-autonomy/disabl=
e-arm64-sve.scc','',d)}"
> -
> -KERNEL_FEATURES_append_gem5-arm64 =3D "${LINUX_ARM_AUTONOMY_DISABLE_ARM=
64_SVE}"
> -KERNEL_FEATURES_append_fvp-base =3D "${LINUX_ARM_AUTONOMY_DISABLE_ARM64=
_SVE}"
> -KERNEL_FEATURES_append_foundation-armv8 =3D "${LINUX_ARM_AUTONOMY_DISAB=
LE_ARM64_SVE}"
> -
>=20
> # Add xen host drivers to kernel if arm-autonomy-host is activated
> KERNEL_FEATURES +=3D "${@bb.utils.contains('DISTRO_FEATURES', \
> --=20
> 2.17.1
>=20
>=20

