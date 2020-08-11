Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.64])
 by mx.groups.io with SMTP id smtpd.web10.16798.1597157893291945210
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Aug 2020 07:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=7Z2B02JK;
 spf=pass (domain: arm.com, ip: 40.107.3.64, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVSivvbOYiU1XpBIpsxR4gmlFOPV5K/OFKDlbvBkr5I=;
 b=7Z2B02JKp0AUHnim1tOgw+R8sH10ToQOXTw2g0PX6CBDgsEeZFL1Co1ApZjj6npvTpk0W1ReDGIY7vdjLGRAbwfDamWsXXoPxgPXvv7JPy7nHdiou4Yac2dmFd6F17Fcb27FHLcD/oWghBPnSw6qYS1NepHMeVZYMG+/xlzGIHI=
Received: from DB6PR0601CA0001.eurprd06.prod.outlook.com (2603:10a6:4:7b::11)
 by HE1PR0802MB2364.eurprd08.prod.outlook.com (2603:10a6:3:c7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Tue, 11 Aug
 2020 14:58:09 +0000
Received: from DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::20) by DB6PR0601CA0001.outlook.office365.com
 (2603:10a6:4:7b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Tue, 11 Aug 2020 14:58:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT042.mail.protection.outlook.com (10.152.21.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Tue, 11 Aug 2020 14:58:08 +0000
Received: ("Tessian outbound bac899b43a54:v64"); Tue, 11 Aug 2020 14:58:08 +0000
X-CR-MTA-TID: 64aa7808
Received: from 55d10cd78383.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 43F6A78E-19A7-4CF0-9682-D2B474FD56AB.1;
	Tue, 11 Aug 2020 14:58:03 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 55d10cd78383.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 11 Aug 2020 14:58:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L84fUXaiikVorX1xIwYZ/oEv9n7VClYrxGe10HV/lzUtrfObdmfXpn/SMc204EAawSKRWGOs1vi086JTiqfMvL2vnebIXUZVWL2J6gx9Ig1sIbOFiogKjYQWm41KDw3UWGWBl8NTZwtLnHYWd5MJXA7MhFCujdTYwVhBErfgLUPdI835e2dKetdKcPEjnpaz03Ehb7STQRRaVup1KKRtTtnL5ekDpK6r+U6INNoKHtMJlJjVnjQLCCwTUIA//SuvD8vciyQzCSjsud95tvCogI4sdAhfP5TgaWjEdOTIPaCJL9NdsUyHuBQQYY6qcvPNiVVbdP9wY5YBRZa37yXJHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVSivvbOYiU1XpBIpsxR4gmlFOPV5K/OFKDlbvBkr5I=;
 b=biqpIHkK39xuRuMsPhCVYTpHt+oJd8Tv3fRZ3RUnEmV2ZUloUfxl9bpnXXMpUo8lL0RYHCiGrYChzuLbmP0JppzN+XB8pw2/9cTspsvb3COQrK67hyh+0ZWcQ+Oq3shmM2hNiL0tviFykxrDMpNXus2PLQtSQ5xlA4wCVZoBaD3UzlFoZO/wkir4+l74LsFrMXvpGPa3OeOu1JNL5asjXLxVEPCDAxipAlN1TrrdMbJlHdilhy1pp8f6BtMWrujpwCnQHiOlTl+J04+4dnLeFXLkKZT3T1eUKNc7jLB+ctudBxwV6//4aD7pzywGZy0CCu7RXPjQHRHAh5p66ANaVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVSivvbOYiU1XpBIpsxR4gmlFOPV5K/OFKDlbvBkr5I=;
 b=7Z2B02JKp0AUHnim1tOgw+R8sH10ToQOXTw2g0PX6CBDgsEeZFL1Co1ApZjj6npvTpk0W1ReDGIY7vdjLGRAbwfDamWsXXoPxgPXvv7JPy7nHdiou4Yac2dmFd6F17Fcb27FHLcD/oWghBPnSw6qYS1NepHMeVZYMG+/xlzGIHI=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3877.eurprd08.prod.outlook.com (2603:10a6:20b:88::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Tue, 11 Aug
 2020 14:57:59 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3261.025; Tue, 11 Aug 2020
 14:57:59 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "ross@burtonini.com" <ross@burtonini.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH][dunfell] arm-bsp/linux: fix gem5-arm64 build
Thread-Topic: [meta-arm] [PATCH][dunfell] arm-bsp/linux: fix gem5-arm64 build
Thread-Index: AQHWb+3ACyj92bKlckyI46rjhAwEI6ky/2rg
Date: Tue, 11 Aug 2020 14:57:59 +0000
Message-ID: 
 <AM6PR08MB34616169E5BE3DF093CA8B7092450@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: <20200811144213.3233392-1-ross.burton@arm.com>
In-Reply-To: <20200811144213.3233392-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: a1fd9784-b049-4b2e-815b-22d058c5224c.0
x-checkrecipientchecked: true
Authentication-Results-Original: burtonini.com; dkim=none (message not signed)
 header.d=none;burtonini.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [78.105.98.91]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 948cdd25-38a4-4519-de84-08d83e06f594
x-ms-traffictypediagnostic: AM6PR08MB3877:|HE1PR0802MB2364:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB2364831ACAF900EE88AA1FE892450@HE1PR0802MB2364.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 uO/UlhPAXGY40gJfZXGq4LLwIVbyEDb+CnqXr6X2sq1p7nVYUF2MzC/2YbPHMYPbltMHJUcs1yy/xfQFjNMZmPBJNiMUZr4ef9r6xKi+G9BC0+CuXF7aOFbSImFnfyUQ2IfmxFOw7FepkK6/2eUPRnBp8hF5k0N4CcrMnGkoUIE8xLug2MPuv6fj06mIWYT1j0zYpmA4gnZ47HiGZl1geRbEs7eT5o+ipZYyHQivdyR8QOp8iV+dJlJicoMbTsdwsV7addL3IAgAeZgbPt2Vwq+/Au2Z/9qPjpDcBK5X6PqB713+jzgQ1oNmtCD0QKF0Q2Hox4a2V9wAilS2/vkwnA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(66446008)(7696005)(186003)(8936002)(83380400001)(26005)(76116006)(33656002)(6506007)(52536014)(66946007)(30864003)(5660300002)(9686003)(71200400001)(86362001)(2906002)(55016002)(478600001)(110136005)(64756008)(66556008)(66476007)(316002)(8676002)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 5Z1zLPw/U1tG5wKFHUHg43J/GN/MSdGeKcqjkcGl9519ElakpiE6O+NdVnkessjIAyFj9ckx62LczgKTyvaoVpwUvxVDcKBaeGgUtgPHj5BEkcTUlotfg1n/nKWyAh+NYp1UrREaPxqchrfFsMOQyOXOXRYE8HYk7gqOZ2A34lYnEubCNg8cc8RdhxGfX5wmzzAGF3CV7PBRsw+mbIBkW1QitpQUNH3ww+7yUbZblolBd4KxZbT5uOzJ1QdskRr8oDidTclZuJoNo1sljPMPZBE1DDvz0mdLpeefZIY5YfW3I2d3lj7uwVhivxWk1PjysUCweQvlPP+yffGpaoOGiOu/vGjF+9BRhQmtawV8mPn49iAqjjXeLsi3MrTiGr2amiv5Y7pzH/kg5RqfsXYCBKY8TdxYhbX/b8DOBwUZyNrdb0FZqiVYLkcM34CVJrzQ/iXfbv+PTt+D4HfaGQnncImfx6TO8dSNTbpGOq3B/QH8s4EGbzOsjtWe094/s6Qnhk2uxADIiCS1mrYLX4mVmS1TKwaGSAfkrtR2xSyQdq/VMBmft74icaTEF7GiIcj7E+lr8HuxnhfmQ1YIPHMvWI/ejzB80gCs4dJtut0tOjkXcwJLvdQ7but8RuVsnEYGTMmFN/wedBaCJ6RfIq4jmA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3877
Original-Authentication-Results: burtonini.com; dkim=none (message not signed)
 header.d=none;burtonini.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0c0900d8-1894-480a-bc40-08d83e06f033
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	taLkVqwAQiQ/nQ7xlNz6ppLhwF5bcazIqzax5UVvj1QjMW/xpxZREfKqf/s1bH3LJ3pdKz690YOYRGBGBZqWEijvbBKUlZd8ALWwnKhDilBRM4yYQ/TOsZXXk6iuXDKBnAKq7uef8Yg4HDk81fz7NLaLngzsfTFO3NCfzG4j7NwFFloWR8MbRn3Ijs6hXlrnSM3v77D2xvz2BdbnTKOvVO8pusODFvadJmx+avILPuyaUBJPJOAQU1TS5l3w1iwOaVCl9Qb2eO3iDM6CrFplxlwbA8CYYcP2+jZNB2C1CNzV30Di4iG9YT3hguXM7+dB1+jeKnjCqUic/Xe1os+Y9uDA2xlf+xJaXOeBZwCIzU4dJ62TQqEa21yV3NAZOAwpGMQB5aqPFNrCuS4FgT8SPg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(46966005)(70206006)(110136005)(52536014)(7696005)(70586007)(6506007)(47076004)(26005)(55016002)(316002)(478600001)(81166007)(33656002)(86362001)(9686003)(186003)(82740400003)(30864003)(336012)(2906002)(356005)(82310400002)(8676002)(5660300002)(83380400001)(8936002)(579004)(559001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2020 14:58:08.3755
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 948cdd25-38a4-4519-de84-08d83e06f594
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2364
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
>On Behalf Of Ross Burton via lists.yoctoproject.org
>Sent: 11 August 2020 15:42
>To: meta-arm@lists.yoctoproject.org
>Subject: [meta-arm] [PATCH][dunfell] arm-bsp/linux: fix gem5-arm64 build
>
>From: Ross Burton <ross.burton@arm.com>
>
>Similar to dcbabb, if meta-kernel is present when parsing then the
>gem5-arm64 support tries appending some shell to a Python function,
>which predictably then fails to parse.
>
>Solve the same way, by turning a directory of files which are moved with
>an append into a simple patch.
>
>Change-Id: I1106c324c84f87f2d4e1f56fb2d5f2671f384f99
>Signed-off-by: Ross Burton <ross.burton@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

>---
> .../dts/gem5-arm64/armv8_gem5_v2_1cpu.dts     |  95 ---
> .../dts/gem5-arm64/armv8_gem5_v2_2cpu.dts     | 103 ---
> .../dts/gem5-arm64/armv8_gem5_v2_4cpu.dts     | 119 ---
> .../dts/gem5-arm64/armv8_gem5_v2_8cpu.dts     | 151 ----
> .../dts/gem5-arm64/vexpress_gem5_v2.dtsi      |  46 --
> .../dts/gem5-arm64/vexpress_gem5_v2_base.dtsi | 202 -----
> .../recipes-kernel/linux/files/gem5-dts.patch | 757 ++++++++++++++++++
> .../linux/linux-arm-platforms.inc             |   7 +-
> 8 files changed, 758 insertions(+), 722 deletions(-)
> delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-
>arm64/armv8_gem5_v2_1cpu.dts
> delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-
>arm64/armv8_gem5_v2_2cpu.dts
> delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-
>arm64/armv8_gem5_v2_4cpu.dts
> delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-
>arm64/armv8_gem5_v2_8cpu.dts
> delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-
>arm64/vexpress_gem5_v2.dtsi
> delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-
>arm64/vexpress_gem5_v2_base.dtsi
> create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/gem5-dts.patch
>
>diff --git a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-
>arm64/armv8_gem5_v2_1cpu.dts b/meta-arm-bsp/recipes-
>kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_1cpu.dts
>deleted file mode 100644
>index 0e59fdf..0000000
>--- a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-
>arm64/armv8_gem5_v2_1cpu.dts
>+++ /dev/null
>@@ -1,95 +0,0 @@
>-/*
>- * Copyright (c) 2015-2016 ARM Limited
>- * All rights reserved
>- *
>- * Redistribution and use in source and binary forms, with or without
>- * modification, are permitted provided that the following conditions are
>- * met: redistributions of source code must retain the above copyright
>- * notice, this list of conditions and the following disclaimer;
>- * redistributions in binary form must reproduce the above copyright
>- * notice, this list of conditions and the following disclaimer in the
>- * documentation and/or other materials provided with the distribution;
>- * neither the name of the copyright holders nor the names of its
>- * contributors may be used to endorse or promote products derived from
>- * this software without specific prior written permission.
>- *
>- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
>CONTRIBUTORS
>- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
>- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
>FITNESS FOR
>- * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
>COPYRIGHT
>- * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
>INCIDENTAL,
>- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
>NOT
>- * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
>USE,
>- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
>ON ANY
>- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
>- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
>THE USE
>- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
>DAMAGE.
>- *
>- * Authors: Andreas Sandberg
>- */
>-
>-/dts-v1/;
>-
>-/memreserve/ 0x80000000 0x00010000;
>-
>-/include/ "vexpress_gem5_v2.dtsi"
>-
>-/ {
>-model =3D "V2P-AARCH64";
>-compatible =3D "arm,vexpress,v2p-aarch64", "arm,vexpress";
>-
>-memory@80000000 {
>-device_type =3D "memory";
>-reg =3D <0 0x80000000 0x4 0x00000000>;
>-};
>-
>-cpus {
>-#address-cells =3D <1>;
>-#size-cells =3D <0>;
>-
>-        cpu@0 {
>-            device_type =3D "cpu";
>-            compatible =3D "gem5,armv8", "arm,armv8";
>-            reg =3D < 0 >;
>-            enable-method =3D "spin-table";
>-            cpu-release-addr =3D <0 0x8000fff8>;
>-        };
>-
>-};
>-
>-virt-encoder {
>-compatible =3D "drm,virtual-encoder";
>-port {
>-dp0_virt_input: endpoint@0 {
>-remote-endpoint =3D <&dp0_output>;
>-};
>-};
>-
>-display-timings {
>-native-mode =3D <&timing0>;
>-
>-timing0: timing_1080p60 {
>-/* 1920x1080-60 */
>-clock-frequency =3D <148500000>;
>-hactive =3D <1920>;
>-vactive =3D <1080>;
>-hfront-porch =3D <148>;
>-hback-porch =3D <88>;
>-hsync-len =3D <44>;
>-vfront-porch =3D <36>;
>-vback-porch =3D <4>;
>-vsync-len =3D <5>;
>-};
>-};
>-};
>-};
>-
>-&dp0 {
>-status =3D "ok";
>-
>-port {
>-dp0_output: endpoint@0 {
>-remote-endpoint =3D <&dp0_virt_input>;
>-};
>-};
>-};
>diff --git a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-
>arm64/armv8_gem5_v2_2cpu.dts b/meta-arm-bsp/recipes-
>kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_2cpu.dts
>deleted file mode 100644
>index 441d3df..0000000
>--- a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-
>arm64/armv8_gem5_v2_2cpu.dts
>+++ /dev/null
>@@ -1,103 +0,0 @@
>-/*
>- * Copyright (c) 2015-2016 ARM Limited
>- * All rights reserved
>- *
>- * Redistribution and use in source and binary forms, with or without
>- * modification, are permitted provided that the following conditions are
>- * met: redistributions of source code must retain the above copyright
>- * notice, this list of conditions and the following disclaimer;
>- * redistributions in binary form must reproduce the above copyright
>- * notice, this list of conditions and the following disclaimer in the
>- * documentation and/or other materials provided with the distribution;
>- * neither the name of the copyright holders nor the names of its
>- * contributors may be used to endorse or promote products derived from
>- * this software without specific prior written permission.
>- *
>- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
>CONTRIBUTORS
>- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
>- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
>FITNESS FOR
>- * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
>COPYRIGHT
>- * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
>INCIDENTAL,
>- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
>NOT
>- * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
>USE,
>- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
>ON ANY
>- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
>- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
>THE USE
>- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
>DAMAGE.
>- *
>- * Authors: Andreas Sandberg
>- */
>-
>-/dts-v1/;
>-
>-/memreserve/ 0x80000000 0x00010000;
>-
>-/include/ "vexpress_gem5_v2.dtsi"
>-
>-/ {
>-model =3D "V2P-AARCH64";
>-compatible =3D "arm,vexpress,v2p-aarch64", "arm,vexpress";
>-
>-memory@80000000 {
>-device_type =3D "memory";
>-reg =3D <0 0x80000000 0x4 0x00000000>;
>-};
>-
>-cpus {
>-#address-cells =3D <1>;
>-#size-cells =3D <0>;
>-
>-        cpu@0 {
>-            device_type =3D "cpu";
>-            compatible =3D "gem5,armv8", "arm,armv8";
>-            reg =3D < 0 >;
>-            enable-method =3D "spin-table";
>-            cpu-release-addr =3D <0 0x8000fff8>;
>-        };
>-
>-        cpu@1 {
>-            device_type =3D "cpu";
>-            compatible =3D "gem5,armv8", "arm,armv8";
>-            reg =3D < 1 >;
>-            enable-method =3D "spin-table";
>-            cpu-release-addr =3D <0 0x8000fff8>;
>-        };
>-
>-};
>-
>-virt-encoder {
>-compatible =3D "drm,virtual-encoder";
>-port {
>-dp0_virt_input: endpoint@0 {
>-remote-endpoint =3D <&dp0_output>;
>-};
>-};
>-
>-display-timings {
>-native-mode =3D <&timing0>;
>-
>-timing0: timing_1080p60 {
>-/* 1920x1080-60 */
>-clock-frequency =3D <148500000>;
>-hactive =3D <1920>;
>-vactive =3D <1080>;
>-hfront-porch =3D <148>;
>-hback-porch =3D <88>;
>-hsync-len =3D <44>;
>-vfront-porch =3D <36>;
>-vback-porch =3D <4>;
>-vsync-len =3D <5>;
>-};
>-};
>-};
>-};
>-
>-&dp0 {
>-status =3D "ok";
>-
>-port {
>-dp0_output: endpoint@0 {
>-remote-endpoint =3D <&dp0_virt_input>;
>-};
>-};
>-};
>diff --git a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-
>arm64/armv8_gem5_v2_4cpu.dts b/meta-arm-bsp/recipes-
>kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_4cpu.dts
>deleted file mode 100644
>index 2d0311a..0000000
>--- a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-
>arm64/armv8_gem5_v2_4cpu.dts
>+++ /dev/null
>@@ -1,119 +0,0 @@
>-/*
>- * Copyright (c) 2015-2016 ARM Limited
>- * All rights reserved
>- *
>- * Redistribution and use in source and binary forms, with or without
>- * modification, are permitted provided that the following conditions are
>- * met: redistributions of source code must retain the above copyright
>- * notice, this list of conditions and the following disclaimer;
>- * redistributions in binary form must reproduce the above copyright
>- * notice, this list of conditions and the following disclaimer in the
>- * documentation and/or other materials provided with the distribution;
>- * neither the name of the copyright holders nor the names of its
>- * contributors may be used to endorse or promote products derived from
>- * this software without specific prior written permission.
>- *
>- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
>CONTRIBUTORS
>- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
>- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
>FITNESS FOR
>- * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
>COPYRIGHT
>- * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
>INCIDENTAL,
>- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
>NOT
>- * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
>USE,
>- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
>ON ANY
>- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
>- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
>THE USE
>- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
>DAMAGE.
>- *
>- * Authors: Andreas Sandberg
>- */
>-
>-/dts-v1/;
>-
>-/memreserve/ 0x80000000 0x00010000;
>-
>-/include/ "vexpress_gem5_v2.dtsi"
>-
>-/ {
>-model =3D "V2P-AARCH64";
>-compatible =3D "arm,vexpress,v2p-aarch64", "arm,vexpress";
>-
>-memory@80000000 {
>-device_type =3D "memory";
>-reg =3D <0 0x80000000 0x4 0x00000000>;
>-};
>-
>-cpus {
>-#address-cells =3D <1>;
>-#size-cells =3D <0>;
>-
>-        cpu@0 {
>-            device_type =3D "cpu";
>-            compatible =3D "gem5,armv8", "arm,armv8";
>-            reg =3D < 0 >;
>-            enable-method =3D "spin-table";
>-            cpu-release-addr =3D <0 0x8000fff8>;
>-        };
>-
>-        cpu@1 {
>-            device_type =3D "cpu";
>-            compatible =3D "gem5,armv8", "arm,armv8";
>-            reg =3D < 1 >;
>-            enable-method =3D "spin-table";
>-            cpu-release-addr =3D <0 0x8000fff8>;
>-        };
>-
>-        cpu@2 {
>-            device_type =3D "cpu";
>-            compatible =3D "gem5,armv8", "arm,armv8";
>-            reg =3D < 2 >;
>-            enable-method =3D "spin-table";
>-            cpu-release-addr =3D <0 0x8000fff8>;
>-        };
>-
>-        cpu@3 {
>-            device_type =3D "cpu";
>-            compatible =3D "gem5,armv8", "arm,armv8";
>-            reg =3D < 3 >;
>-            enable-method =3D "spin-table";
>-            cpu-release-addr =3D <0 0x8000fff8>;
>-        };
>-
>-};
>-
>-virt-encoder {
>-compatible =3D "drm,virtual-encoder";
>-port {
>-dp0_virt_input: endpoint@0 {
>-remote-endpoint =3D <&dp0_output>;
>-};
>-};
>-
>-display-timings {
>-native-mode =3D <&timing0>;
>-
>-timing0: timing_1080p60 {
>-/* 1920x1080-60 */
>-clock-frequency =3D <148500000>;
>-hactive =3D <1920>;
>-vactive =3D <1080>;
>-hfront-porch =3D <148>;
>-hback-porch =3D <88>;
>-hsync-len =3D <44>;
>-vfront-porch =3D <36>;
>-vback-porch =3D <4>;
>-vsync-len =3D <5>;
>-};
>-};
>-};
>-};
>-
>-&dp0 {
>-status =3D "ok";
>-
>-port {
>-dp0_output: endpoint@0 {
>-remote-endpoint =3D <&dp0_virt_input>;
>-};
>-};
>-};
>diff --git a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-
>arm64/armv8_gem5_v2_8cpu.dts b/meta-arm-bsp/recipes-
>kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_8cpu.dts
>deleted file mode 100644
>index ba94d07..0000000
>--- a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-
>arm64/armv8_gem5_v2_8cpu.dts
>+++ /dev/null
>@@ -1,151 +0,0 @@
>-/*
>- * Copyright (c) 2015-2016 ARM Limited
>- * All rights reserved
>- *
>- * Redistribution and use in source and binary forms, with or without
>- * modification, are permitted provided that the following conditions are
>- * met: redistributions of source code must retain the above copyright
>- * notice, this list of conditions and the following disclaimer;
>- * redistributions in binary form must reproduce the above copyright
>- * notice, this list of conditions and the following disclaimer in the
>- * documentation and/or other materials provided with the distribution;
>- * neither the name of the copyright holders nor the names of its
>- * contributors may be used to endorse or promote products derived from
>- * this software without specific prior written permission.
>- *
>- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
>CONTRIBUTORS
>- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
>- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
>FITNESS FOR
>- * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
>COPYRIGHT
>- * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
>INCIDENTAL,
>- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
>NOT
>- * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
>USE,
>- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
>ON ANY
>- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
>- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
>THE USE
>- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
>DAMAGE.
>- *
>- * Authors: Andreas Sandberg
>- */
>-
>-/dts-v1/;
>-
>-/memreserve/ 0x80000000 0x00010000;
>-
>-/include/ "vexpress_gem5_v2.dtsi"
>-
>-/ {
>-model =3D "V2P-AARCH64";
>-compatible =3D "arm,vexpress,v2p-aarch64", "arm,vexpress";
>-
>-memory@80000000 {
>-device_type =3D "memory";
>-reg =3D <0 0x80000000 0x4 0x00000000>;
>-};
>-
>-cpus {
>-#address-cells =3D <1>;
>-#size-cells =3D <0>;
>-
>-        cpu@0 {
>-            device_type =3D "cpu";
>-            compatible =3D "gem5,armv8", "arm,armv8";
>-            reg =3D < 0 >;
>-            enable-method =3D "spin-table";
>-            cpu-release-addr =3D <0 0x8000fff8>;
>-        };
>-
>-        cpu@1 {
>-            device_type =3D "cpu";
>-            compatible =3D "gem5,armv8", "arm,armv8";
>-            reg =3D < 1 >;
>-            enable-method =3D "spin-table";
>-            cpu-release-addr =3D <0 0x8000fff8>;
>-        };
>-
>-        cpu@2 {
>-            device_type =3D "cpu";
>-            compatible =3D "gem5,armv8", "arm,armv8";
>-            reg =3D < 2 >;
>-            enable-method =3D "spin-table";
>-            cpu-release-addr =3D <0 0x8000fff8>;
>-        };
>-
>-        cpu@3 {
>-            device_type =3D "cpu";
>-            compatible =3D "gem5,armv8", "arm,armv8";
>-            reg =3D < 3 >;
>-            enable-method =3D "spin-table";
>-            cpu-release-addr =3D <0 0x8000fff8>;
>-        };
>-
>-        cpu@4 {
>-            device_type =3D "cpu";
>-            compatible =3D "gem5,armv8", "arm,armv8";
>-            reg =3D < 4 >;
>-            enable-method =3D "spin-table";
>-            cpu-release-addr =3D <0 0x8000fff8>;
>-        };
>-
>-        cpu@5 {
>-            device_type =3D "cpu";
>-            compatible =3D "gem5,armv8", "arm,armv8";
>-            reg =3D < 5 >;
>-            enable-method =3D "spin-table";
>-            cpu-release-addr =3D <0 0x8000fff8>;
>-        };
>-
>-        cpu@6 {
>-            device_type =3D "cpu";
>-            compatible =3D "gem5,armv8", "arm,armv8";
>-            reg =3D < 6 >;
>-            enable-method =3D "spin-table";
>-            cpu-release-addr =3D <0 0x8000fff8>;
>-        };
>-
>-        cpu@7 {
>-            device_type =3D "cpu";
>-            compatible =3D "gem5,armv8", "arm,armv8";
>-            reg =3D < 7 >;
>-            enable-method =3D "spin-table";
>-            cpu-release-addr =3D <0 0x8000fff8>;
>-        };
>-
>-};
>-
>-virt-encoder {
>-compatible =3D "drm,virtual-encoder";
>-port {
>-dp0_virt_input: endpoint@0 {
>-remote-endpoint =3D <&dp0_output>;
>-};
>-};
>-
>-display-timings {
>-native-mode =3D <&timing0>;
>-
>-timing0: timing_1080p60 {
>-/* 1920x1080-60 */
>-clock-frequency =3D <148500000>;
>-hactive =3D <1920>;
>-vactive =3D <1080>;
>-hfront-porch =3D <148>;
>-hback-porch =3D <88>;
>-hsync-len =3D <44>;
>-vfront-porch =3D <36>;
>-vback-porch =3D <4>;
>-vsync-len =3D <5>;
>-};
>-};
>-};
>-};
>-
>-&dp0 {
>-status =3D "ok";
>-
>-port {
>-dp0_output: endpoint@0 {
>-remote-endpoint =3D <&dp0_virt_input>;
>-};
>-};
>-};
>diff --git a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-
>arm64/vexpress_gem5_v2.dtsi b/meta-arm-bsp/recipes-
>kernel/linux/files/dts/gem5-arm64/vexpress_gem5_v2.dtsi
>deleted file mode 100644
>index e53e6e8..0000000
>--- a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-
>arm64/vexpress_gem5_v2.dtsi
>+++ /dev/null
>@@ -1,46 +0,0 @@
>-/*
>- * Copyright (c) 2015-2018 ARM Limited
>- * All rights reserved
>- *
>- * Redistribution and use in source and binary forms, with or without
>- * modification, are permitted provided that the following conditions are
>- * met: redistributions of source code must retain the above copyright
>- * notice, this list of conditions and the following disclaimer;
>- * redistributions in binary form must reproduce the above copyright
>- * notice, this list of conditions and the following disclaimer in the
>- * documentation and/or other materials provided with the distribution;
>- * neither the name of the copyright holders nor the names of its
>- * contributors may be used to endorse or promote products derived from
>- * this software without specific prior written permission.
>- *
>- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
>CONTRIBUTORS
>- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
>- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
>FITNESS FOR
>- * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
>COPYRIGHT
>- * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
>INCIDENTAL,
>- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
>NOT
>- * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
>USE,
>- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
>ON ANY
>- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
>- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
>THE USE
>- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
>DAMAGE.
>- *
>- * Authors: Andreas Sandberg
>- */
>-
>-/include/ "vexpress_gem5_v2_base.dtsi"
>-
>-/ {
>-/* The display processor needs custom configuration to setup its
>- * output ports. Disable it by default in the platform until the
>- * DT bindings have stabilize.
>- */
>-dp0: hdlcd@2b000000 {
>-compatible =3D "arm,hdlcd";
>-reg =3D <0x0 0x2b000000 0x0 0x1000>;
>-interrupts =3D <0 63 4>;
>-clocks =3D <&osc_pxl>;
>-clock-names =3D "pxlclk";
>-status =3D "disabled";
>-};
>-};
>diff --git a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-
>arm64/vexpress_gem5_v2_base.dtsi b/meta-arm-bsp/recipes-
>kernel/linux/files/dts/gem5-arm64/vexpress_gem5_v2_base.dtsi
>deleted file mode 100644
>index eba0db2..0000000
>--- a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-
>arm64/vexpress_gem5_v2_base.dtsi
>+++ /dev/null
>@@ -1,202 +0,0 @@
>-/*
>- * Copyright (c) 2015-2017, 2019 ARM Limited
>- * All rights reserved
>- *
>- * Redistribution and use in source and binary forms, with or without
>- * modification, are permitted provided that the following conditions are
>- * met: redistributions of source code must retain the above copyright
>- * notice, this list of conditions and the following disclaimer;
>- * redistributions in binary form must reproduce the above copyright
>- * notice, this list of conditions and the following disclaimer in the
>- * documentation and/or other materials provided with the distribution;
>- * neither the name of the copyright holders nor the names of its
>- * contributors may be used to endorse or promote products derived from
>- * this software without specific prior written permission.
>- *
>- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
>CONTRIBUTORS
>- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
>- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
>FITNESS FOR
>- * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
>COPYRIGHT
>- * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
>INCIDENTAL,
>- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
>NOT
>- * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
>USE,
>- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
>ON ANY
>- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
>- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
>THE USE
>- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
>DAMAGE.
>- *
>- * Authors: Andreas Sandberg
>- */
>-
>-/ {
>-arm,hbi =3D <0x0>;
>-arm,vexpress,site =3D <0xf>;
>-interrupt-parent =3D <&gic>;
>-#address-cells =3D <2>;
>-#size-cells =3D <2>;
>-
>-gic: interrupt-controller@2c000000 {
>-compatible =3D "arm,gic-v3";
>-#interrupt-cells =3D <0x3>;
>-#address-cells =3D <0x2>;
>-ranges;
>-interrupt-controller;
>-redistributor-stride =3D <0x0 0x40000>; // 256kB stride
>-reg =3D <0x0 0x2c000000 0x0 0x10000
>-       0x0 0x2c010000 0x0 0x2000000 // room for 128
>redistributors using 128K each (256K strided...)
>-       0x0 0x0 0x0 0x0>;
>-interrupts =3D <1 9 0xf04>;
>-#size-cells =3D <0x2>;
>-linux,phandle =3D <0x1>;
>-phandle =3D <0x1>;
>-
>-gic-its@2e010000 {
>-compatible =3D "arm,gic-v3-its";
>-msi-controller;
>-#msi-cells =3D <1>;
>-reg =3D <0x0 0x2e010000 0 0x20000>;
>-};
>-};
>-
>-timer {
>-compatible =3D "arm,cortex-a15-timer",
>-     "arm,armv7-timer";
>-interrupts =3D <1 13 0xf08>,
>-             <1 14 0xf08>,
>-     <1 11 0xf08>,
>-             <1 10 0xf08>;
>-clocks =3D <&osc_sys>;
>-clock-names=3D"apb_pclk";
>-};
>-
>-pci {
>-compatible =3D "pci-host-ecam-generic";
>-device_type =3D "pci";
>-#address-cells =3D <0x3>;
>-#size-cells =3D <0x2>;
>-#interrupt-cells =3D <0x1>;
>-
>-reg =3D <0x0 0x30000000 0x0 0x10000000>;
>-
>-ranges =3D <0x01000000 0x0 0x00000000  0x0 0x2f000000  0x0
>0x00010000>,
>-         <0x02000000 0x0 0x40000000  0x0 0x40000000  0x0
>0x40000000>;
>-
>-/*
>-  child unit address, #cells =3D #address-cells
>-  child interrupt specifier, #cells =3D #interrupt-cells (INTA =3D 1, INT=
B =3D 2,
>INTC =3D 3 and INTD =3D 4)
>-  interrupt-parent, phandle
>-  parent unit address, #cells =3D #address-cells@gic
>-  parent interrupt specifier, #cells =3D #interrupt-cells@gic
>-*/
>-interrupt-map =3D <0x0    0x0 0x0  0x1  &gic  0x0 0x0  0x0 0x44 0x1
>-         0x800  0x0 0x0  0x1  &gic  0x0 0x0  0x0 0x45 0x1
>-         0x1000 0x0 0x0  0x1  &gic  0x0 0x0  0x0 0x46 0x1
>-         0x1800 0x0 0x0  0x1  &gic  0x0 0x0  0x0 0x47 0x1>;
>-
>-interrupt-map-mask =3D <0x001800 0x0 0x0 0x0>;
>-dma-coherent;
>-};
>-
>-kmi@1c060000 {
>-compatible =3D "arm,pl050", "arm,primecell";
>-reg =3D <0x0 0x1c060000 0x0 0x1000>;
>-interrupts =3D <0 12 4>;
>-clocks =3D <&v2m_clk24mhz>, <&osc_smb>;
>-clock-names =3D "KMIREFCLK", "apb_pclk";
>-};
>-
>-kmi@1c070000 {
>-compatible =3D "arm,pl050", "arm,primecell";
>-reg =3D <0x0 0x1c070000 0x0 0x1000>;
>-interrupts =3D <0 13 4>;
>-clocks =3D <&v2m_clk24mhz>, <&osc_smb>;
>-clock-names =3D "KMIREFCLK", "apb_pclk";
>-};
>-
>-uart0: uart@1c090000 {
>-compatible =3D "arm,pl011", "arm,primecell";
>-reg =3D <0x0 0x1c090000 0x0 0x1000>;
>-interrupts =3D <0 5 4>;
>-clocks =3D <&osc_peripheral>, <&osc_smb>;
>-clock-names =3D "uartclk", "apb_pclk";
>-};
>-
>-rtc@1c170000 {
>-compatible =3D "arm,pl031", "arm,primecell";
>-reg =3D <0x0 0x1c170000 0x0 0x1000>;
>-interrupts =3D <0 4 4>;
>-clocks =3D <&osc_smb>;
>-clock-names =3D "apb_pclk";
>-};
>-
>-v2m_clk24mhz: clk24mhz {
>-compatible =3D "fixed-clock";
>-#clock-cells =3D <0>;
>-clock-frequency =3D <24000000>;
>-clock-output-names =3D "v2m:clk24mhz";
>-};
>-
>-
>-v2m_sysreg: sysreg@1c010000 {
>-compatible =3D "arm,vexpress-sysreg";
>-reg =3D <0 0x1c010000 0x0 0x1000>;
>-gpio-controller;
>-#gpio-cells =3D <2>;
>-};
>-
>-vio@1c130000 {
>-compatible =3D "virtio,mmio";
>-reg =3D <0 0x1c130000 0x0 0x1000>;
>-interrupts =3D <0 42 4>;
>-};
>-
>-vio@1c140000 {
>-compatible =3D "virtio,mmio";
>-reg =3D <0 0x1c140000 0x0 0x1000>;
>-interrupts =3D <0 43 4>;
>-};
>-
>-dcc {
>-compatible =3D "arm,vexpress,config-bus";
>-arm,vexpress,config-bridge =3D <&v2m_sysreg>;
>-
>-osc_pxl: osc@5 {
>-compatible =3D "arm,vexpress-osc";
>-arm,vexpress-sysreg,func =3D <1 5>;
>-freq-range =3D <23750000 1000000000>;
>-#clock-cells =3D <0>;
>-clock-output-names =3D "oscclk5";
>-};
>-
>-osc_smb: osc@6 {
>-compatible =3D "arm,vexpress-osc";
>-arm,vexpress-sysreg,func =3D <1 6>;
>-freq-range =3D <20000000 50000000>;
>-#clock-cells =3D <0>;
>-clock-output-names =3D "oscclk6";
>-};
>-
>-osc_sys: osc@7 {
>-compatible =3D "arm,vexpress-osc";
>-arm,vexpress-sysreg,func =3D <1 7>;
>-freq-range =3D <20000000 60000000>;
>-#clock-cells =3D <0>;
>-clock-output-names =3D "oscclk7";
>-};
>-};
>-
>-
>-mcc {
>-compatible =3D "arm,vexpress,config-bus";
>-arm,vexpress,config-bridge =3D <&v2m_sysreg>;
>-arm,vexpress,site =3D <0>;
>-
>-osc_peripheral: osc@2 {
>-compatible =3D "arm,vexpress-osc";
>-arm,vexpress-sysreg,func =3D <1 2>;
>-freq-range =3D <24000000 24000000>;
>-#clock-cells =3D <0>;
>-clock-output-names =3D "v2m:oscclk2";
>-};
>-};
>-};
>diff --git a/meta-arm-bsp/recipes-kernel/linux/files/gem5-dts.patch b/meta=
-
>arm-bsp/recipes-kernel/linux/files/gem5-dts.patch
>new file mode 100644
>index 0000000..6aa08bc
>--- /dev/null
>+++ b/meta-arm-bsp/recipes-kernel/linux/files/gem5-dts.patch
>@@ -0,0 +1,757 @@
>+Add DTS files which are not yet upstream.
>+
>+Upstream-Status: Pending
>+Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>+
>+diff --git a/arch/arm64/boot/dts/gem5-arm64/armv8_gem5_v2_1cpu.dts
>b/arch/arm64/boot/dts/gem5-arm64/armv8_gem5_v2_1cpu.dts
>+new file mode 100644
>+index 000000000000..0e59fdf89054
>+--- /dev/null
>++++ b/arch/arm64/boot/dts/gem5-arm64/armv8_gem5_v2_1cpu.dts
>+@@ -0,0 +1,95 @@
>++/*
>++ * Copyright (c) 2015-2016 ARM Limited
>++ * All rights reserved
>++ *
>++ * Redistribution and use in source and binary forms, with or without
>++ * modification, are permitted provided that the following conditions ar=
e
>++ * met: redistributions of source code must retain the above copyright
>++ * notice, this list of conditions and the following disclaimer;
>++ * redistributions in binary form must reproduce the above copyright
>++ * notice, this list of conditions and the following disclaimer in the
>++ * documentation and/or other materials provided with the distribution;
>++ * neither the name of the copyright holders nor the names of its
>++ * contributors may be used to endorse or promote products derived from
>++ * this software without specific prior written permission.
>++ *
>++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
>CONTRIBUTORS
>++ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT
>NOT
>++ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
>FITNESS FOR
>++ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
>COPYRIGHT
>++ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
>INCIDENTAL,
>++ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
>NOT
>++ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
>OF USE,
>++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
>ON ANY
>++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
>++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
>THE USE
>++ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
>DAMAGE.
>++ *
>++ * Authors: Andreas Sandberg
>++ */
>++
>++/dts-v1/;
>++
>++/memreserve/ 0x80000000 0x00010000;
>++
>++/include/ "vexpress_gem5_v2.dtsi"
>++
>++/ {
>++model =3D "V2P-AARCH64";
>++compatible =3D "arm,vexpress,v2p-aarch64", "arm,vexpress";
>++
>++memory@80000000 {
>++device_type =3D "memory";
>++reg =3D <0 0x80000000 0x4 0x00000000>;
>++};
>++
>++cpus {
>++#address-cells =3D <1>;
>++#size-cells =3D <0>;
>++
>++        cpu@0 {
>++            device_type =3D "cpu";
>++            compatible =3D "gem5,armv8", "arm,armv8";
>++            reg =3D < 0 >;
>++            enable-method =3D "spin-table";
>++            cpu-release-addr =3D <0 0x8000fff8>;
>++        };
>++
>++};
>++
>++virt-encoder {
>++compatible =3D "drm,virtual-encoder";
>++port {
>++dp0_virt_input: endpoint@0 {
>++remote-endpoint =3D <&dp0_output>;
>++};
>++};
>++
>++display-timings {
>++native-mode =3D <&timing0>;
>++
>++timing0: timing_1080p60 {
>++/* 1920x1080-60 */
>++clock-frequency =3D <148500000>;
>++hactive =3D <1920>;
>++vactive =3D <1080>;
>++hfront-porch =3D <148>;
>++hback-porch =3D <88>;
>++hsync-len =3D <44>;
>++vfront-porch =3D <36>;
>++vback-porch =3D <4>;
>++vsync-len =3D <5>;
>++};
>++};
>++};
>++};
>++
>++&dp0 {
>++status =3D "ok";
>++
>++port {
>++dp0_output: endpoint@0 {
>++remote-endpoint =3D <&dp0_virt_input>;
>++};
>++};
>++};
>+diff --git a/arch/arm64/boot/dts/gem5-arm64/armv8_gem5_v2_2cpu.dts
>b/arch/arm64/boot/dts/gem5-arm64/armv8_gem5_v2_2cpu.dts
>+new file mode 100644
>+index 000000000000..441d3df2a16f
>+--- /dev/null
>++++ b/arch/arm64/boot/dts/gem5-arm64/armv8_gem5_v2_2cpu.dts
>+@@ -0,0 +1,103 @@
>++/*
>++ * Copyright (c) 2015-2016 ARM Limited
>++ * All rights reserved
>++ *
>++ * Redistribution and use in source and binary forms, with or without
>++ * modification, are permitted provided that the following conditions ar=
e
>++ * met: redistributions of source code must retain the above copyright
>++ * notice, this list of conditions and the following disclaimer;
>++ * redistributions in binary form must reproduce the above copyright
>++ * notice, this list of conditions and the following disclaimer in the
>++ * documentation and/or other materials provided with the distribution;
>++ * neither the name of the copyright holders nor the names of its
>++ * contributors may be used to endorse or promote products derived from
>++ * this software without specific prior written permission.
>++ *
>++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
>CONTRIBUTORS
>++ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT
>NOT
>++ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
>FITNESS FOR
>++ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
>COPYRIGHT
>++ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
>INCIDENTAL,
>++ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
>NOT
>++ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
>OF USE,
>++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
>ON ANY
>++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
>++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
>THE USE
>++ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
>DAMAGE.
>++ *
>++ * Authors: Andreas Sandberg
>++ */
>++
>++/dts-v1/;
>++
>++/memreserve/ 0x80000000 0x00010000;
>++
>++/include/ "vexpress_gem5_v2.dtsi"
>++
>++/ {
>++model =3D "V2P-AARCH64";
>++compatible =3D "arm,vexpress,v2p-aarch64", "arm,vexpress";
>++
>++memory@80000000 {
>++device_type =3D "memory";
>++reg =3D <0 0x80000000 0x4 0x00000000>;
>++};
>++
>++cpus {
>++#address-cells =3D <1>;
>++#size-cells =3D <0>;
>++
>++        cpu@0 {
>++            device_type =3D "cpu";
>++            compatible =3D "gem5,armv8", "arm,armv8";
>++            reg =3D < 0 >;
>++            enable-method =3D "spin-table";
>++            cpu-release-addr =3D <0 0x8000fff8>;
>++        };
>++
>++        cpu@1 {
>++            device_type =3D "cpu";
>++            compatible =3D "gem5,armv8", "arm,armv8";
>++            reg =3D < 1 >;
>++            enable-method =3D "spin-table";
>++            cpu-release-addr =3D <0 0x8000fff8>;
>++        };
>++
>++};
>++
>++virt-encoder {
>++compatible =3D "drm,virtual-encoder";
>++port {
>++dp0_virt_input: endpoint@0 {
>++remote-endpoint =3D <&dp0_output>;
>++};
>++};
>++
>++display-timings {
>++native-mode =3D <&timing0>;
>++
>++timing0: timing_1080p60 {
>++/* 1920x1080-60 */
>++clock-frequency =3D <148500000>;
>++hactive =3D <1920>;
>++vactive =3D <1080>;
>++hfront-porch =3D <148>;
>++hback-porch =3D <88>;
>++hsync-len =3D <44>;
>++vfront-porch =3D <36>;
>++vback-porch =3D <4>;
>++vsync-len =3D <5>;
>++};
>++};
>++};
>++};
>++
>++&dp0 {
>++status =3D "ok";
>++
>++port {
>++dp0_output: endpoint@0 {
>++remote-endpoint =3D <&dp0_virt_input>;
>++};
>++};
>++};
>+diff --git a/arch/arm64/boot/dts/gem5-arm64/armv8_gem5_v2_4cpu.dts
>b/arch/arm64/boot/dts/gem5-arm64/armv8_gem5_v2_4cpu.dts
>+new file mode 100644
>+index 000000000000..2d0311a5f893
>+--- /dev/null
>++++ b/arch/arm64/boot/dts/gem5-arm64/armv8_gem5_v2_4cpu.dts
>+@@ -0,0 +1,119 @@
>++/*
>++ * Copyright (c) 2015-2016 ARM Limited
>++ * All rights reserved
>++ *
>++ * Redistribution and use in source and binary forms, with or without
>++ * modification, are permitted provided that the following conditions ar=
e
>++ * met: redistributions of source code must retain the above copyright
>++ * notice, this list of conditions and the following disclaimer;
>++ * redistributions in binary form must reproduce the above copyright
>++ * notice, this list of conditions and the following disclaimer in the
>++ * documentation and/or other materials provided with the distribution;
>++ * neither the name of the copyright holders nor the names of its
>++ * contributors may be used to endorse or promote products derived from
>++ * this software without specific prior written permission.
>++ *
>++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
>CONTRIBUTORS
>++ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT
>NOT
>++ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
>FITNESS FOR
>++ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
>COPYRIGHT
>++ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
>INCIDENTAL,
>++ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
>NOT
>++ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
>OF USE,
>++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
>ON ANY
>++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
>++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
>THE USE
>++ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
>DAMAGE.
>++ *
>++ * Authors: Andreas Sandberg
>++ */
>++
>++/dts-v1/;
>++
>++/memreserve/ 0x80000000 0x00010000;
>++
>++/include/ "vexpress_gem5_v2.dtsi"
>++
>++/ {
>++model =3D "V2P-AARCH64";
>++compatible =3D "arm,vexpress,v2p-aarch64", "arm,vexpress";
>++
>++memory@80000000 {
>++device_type =3D "memory";
>++reg =3D <0 0x80000000 0x4 0x00000000>;
>++};
>++
>++cpus {
>++#address-cells =3D <1>;
>++#size-cells =3D <0>;
>++
>++        cpu@0 {
>++            device_type =3D "cpu";
>++            compatible =3D "gem5,armv8", "arm,armv8";
>++            reg =3D < 0 >;
>++            enable-method =3D "spin-table";
>++            cpu-release-addr =3D <0 0x8000fff8>;
>++        };
>++
>++        cpu@1 {
>++            device_type =3D "cpu";
>++            compatible =3D "gem5,armv8", "arm,armv8";
>++            reg =3D < 1 >;
>++            enable-method =3D "spin-table";
>++            cpu-release-addr =3D <0 0x8000fff8>;
>++        };
>++
>++        cpu@2 {
>++            device_type =3D "cpu";
>++            compatible =3D "gem5,armv8", "arm,armv8";
>++            reg =3D < 2 >;
>++            enable-method =3D "spin-table";
>++            cpu-release-addr =3D <0 0x8000fff8>;
>++        };
>++
>++        cpu@3 {
>++            device_type =3D "cpu";
>++            compatible =3D "gem5,armv8", "arm,armv8";
>++            reg =3D < 3 >;
>++            enable-method =3D "spin-table";
>++            cpu-release-addr =3D <0 0x8000fff8>;
>++        };
>++
>++};
>++
>++virt-encoder {
>++compatible =3D "drm,virtual-encoder";
>++port {
>++dp0_virt_input: endpoint@0 {
>++remote-endpoint =3D <&dp0_output>;
>++};
>++};
>++
>++display-timings {
>++native-mode =3D <&timing0>;
>++
>++timing0: timing_1080p60 {
>++/* 1920x1080-60 */
>++clock-frequency =3D <148500000>;
>++hactive =3D <1920>;
>++vactive =3D <1080>;
>++hfront-porch =3D <148>;
>++hback-porch =3D <88>;
>++hsync-len =3D <44>;
>++vfront-porch =3D <36>;
>++vback-porch =3D <4>;
>++vsync-len =3D <5>;
>++};
>++};
>++};
>++};
>++
>++&dp0 {
>++status =3D "ok";
>++
>++port {
>++dp0_output: endpoint@0 {
>++remote-endpoint =3D <&dp0_virt_input>;
>++};
>++};
>++};
>+diff --git a/arch/arm64/boot/dts/gem5-arm64/armv8_gem5_v2_8cpu.dts
>b/arch/arm64/boot/dts/gem5-arm64/armv8_gem5_v2_8cpu.dts
>+new file mode 100644
>+index 000000000000..ba94d0746958
>+--- /dev/null
>++++ b/arch/arm64/boot/dts/gem5-arm64/armv8_gem5_v2_8cpu.dts
>+@@ -0,0 +1,151 @@
>++/*
>++ * Copyright (c) 2015-2016 ARM Limited
>++ * All rights reserved
>++ *
>++ * Redistribution and use in source and binary forms, with or without
>++ * modification, are permitted provided that the following conditions ar=
e
>++ * met: redistributions of source code must retain the above copyright
>++ * notice, this list of conditions and the following disclaimer;
>++ * redistributions in binary form must reproduce the above copyright
>++ * notice, this list of conditions and the following disclaimer in the
>++ * documentation and/or other materials provided with the distribution;
>++ * neither the name of the copyright holders nor the names of its
>++ * contributors may be used to endorse or promote products derived from
>++ * this software without specific prior written permission.
>++ *
>++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
>CONTRIBUTORS
>++ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT
>NOT
>++ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
>FITNESS FOR
>++ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
>COPYRIGHT
>++ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
>INCIDENTAL,
>++ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
>NOT
>++ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
>OF USE,
>++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
>ON ANY
>++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
>++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
>THE USE
>++ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
>DAMAGE.
>++ *
>++ * Authors: Andreas Sandberg
>++ */
>++
>++/dts-v1/;
>++
>++/memreserve/ 0x80000000 0x00010000;
>++
>++/include/ "vexpress_gem5_v2.dtsi"
>++
>++/ {
>++model =3D "V2P-AARCH64";
>++compatible =3D "arm,vexpress,v2p-aarch64", "arm,vexpress";
>++
>++memory@80000000 {
>++device_type =3D "memory";
>++reg =3D <0 0x80000000 0x4 0x00000000>;
>++};
>++
>++cpus {
>++#address-cells =3D <1>;
>++#size-cells =3D <0>;
>++
>++        cpu@0 {
>++            device_type =3D "cpu";
>++            compatible =3D "gem5,armv8", "arm,armv8";
>++            reg =3D < 0 >;
>++            enable-method =3D "spin-table";
>++            cpu-release-addr =3D <0 0x8000fff8>;
>++        };
>++
>++        cpu@1 {
>++            device_type =3D "cpu";
>++            compatible =3D "gem5,armv8", "arm,armv8";
>++            reg =3D < 1 >;
>++            enable-method =3D "spin-table";
>++            cpu-release-addr =3D <0 0x8000fff8>;
>++        };
>++
>++        cpu@2 {
>++            device_type =3D "cpu";
>++            compatible =3D "gem5,armv8", "arm,armv8";
>++            reg =3D < 2 >;
>++            enable-method =3D "spin-table";
>++            cpu-release-addr =3D <0 0x8000fff8>;
>++        };
>++
>++        cpu@3 {
>++            device_type =3D "cpu";
>++            compatible =3D "gem5,armv8", "arm,armv8";
>++            reg =3D < 3 >;
>++            enable-method =3D "spin-table";
>++            cpu-release-addr =3D <0 0x8000fff8>;
>++        };
>++
>++        cpu@4 {
>++            device_type =3D "cpu";
>++            compatible =3D "gem5,armv8", "arm,armv8";
>++            reg =3D < 4 >;
>++            enable-method =3D "spin-table";
>++            cpu-release-addr =3D <0 0x8000fff8>;
>++        };
>++
>++        cpu@5 {
>++            device_type =3D "cpu";
>++            compatible =3D "gem5,armv8", "arm,armv8";
>++            reg =3D < 5 >;
>++            enable-method =3D "spin-table";
>++            cpu-release-addr =3D <0 0x8000fff8>;
>++        };
>++
>++        cpu@6 {
>++            device_type =3D "cpu";
>++            compatible =3D "gem5,armv8", "arm,armv8";
>++            reg =3D < 6 >;
>++            enable-method =3D "spin-table";
>++            cpu-release-addr =3D <0 0x8000fff8>;
>++        };
>++
>++        cpu@7 {
>++            device_type =3D "cpu";
>++            compatible =3D "gem5,armv8", "arm,armv8";
>++            reg =3D < 7 >;
>++            enable-method =3D "spin-table";
>++            cpu-release-addr =3D <0 0x8000fff8>;
>++        };
>++
>++};
>++
>++virt-encoder {
>++compatible =3D "drm,virtual-encoder";
>++port {
>++dp0_virt_input: endpoint@0 {
>++remote-endpoint =3D <&dp0_output>;
>++};
>++};
>++
>++display-timings {
>++native-mode =3D <&timing0>;
>++
>++timing0: timing_1080p60 {
>++/* 1920x1080-60 */
>++clock-frequency =3D <148500000>;
>++hactive =3D <1920>;
>++vactive =3D <1080>;
>++hfront-porch =3D <148>;
>++hback-porch =3D <88>;
>++hsync-len =3D <44>;
>++vfront-porch =3D <36>;
>++vback-porch =3D <4>;
>++vsync-len =3D <5>;
>++};
>++};
>++};
>++};
>++
>++&dp0 {
>++status =3D "ok";
>++
>++port {
>++dp0_output: endpoint@0 {
>++remote-endpoint =3D <&dp0_virt_input>;
>++};
>++};
>++};
>+diff --git a/arch/arm64/boot/dts/gem5-arm64/vexpress_gem5_v2.dtsi
>b/arch/arm64/boot/dts/gem5-arm64/vexpress_gem5_v2.dtsi
>+new file mode 100644
>+index 000000000000..e53e6e84b301
>+--- /dev/null
>++++ b/arch/arm64/boot/dts/gem5-arm64/vexpress_gem5_v2.dtsi
>+@@ -0,0 +1,46 @@
>++/*
>++ * Copyright (c) 2015-2018 ARM Limited
>++ * All rights reserved
>++ *
>++ * Redistribution and use in source and binary forms, with or without
>++ * modification, are permitted provided that the following conditions ar=
e
>++ * met: redistributions of source code must retain the above copyright
>++ * notice, this list of conditions and the following disclaimer;
>++ * redistributions in binary form must reproduce the above copyright
>++ * notice, this list of conditions and the following disclaimer in the
>++ * documentation and/or other materials provided with the distribution;
>++ * neither the name of the copyright holders nor the names of its
>++ * contributors may be used to endorse or promote products derived from
>++ * this software without specific prior written permission.
>++ *
>++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
>CONTRIBUTORS
>++ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT
>NOT
>++ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
>FITNESS FOR
>++ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
>COPYRIGHT
>++ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
>INCIDENTAL,
>++ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
>NOT
>++ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
>OF USE,
>++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
>ON ANY
>++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
>++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
>THE USE
>++ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
>DAMAGE.
>++ *
>++ * Authors: Andreas Sandberg
>++ */
>++
>++/include/ "vexpress_gem5_v2_base.dtsi"
>++
>++/ {
>++/* The display processor needs custom configuration to setup its
>++ * output ports. Disable it by default in the platform until the
>++ * DT bindings have stabilize.
>++ */
>++dp0: hdlcd@2b000000 {
>++compatible =3D "arm,hdlcd";
>++reg =3D <0x0 0x2b000000 0x0 0x1000>;
>++interrupts =3D <0 63 4>;
>++clocks =3D <&osc_pxl>;
>++clock-names =3D "pxlclk";
>++status =3D "disabled";
>++};
>++};
>+diff --git a/arch/arm64/boot/dts/gem5-arm64/vexpress_gem5_v2_base.dtsi
>b/arch/arm64/boot/dts/gem5-arm64/vexpress_gem5_v2_base.dtsi
>+new file mode 100644
>+index 000000000000..eba0db2526df
>+--- /dev/null
>++++ b/arch/arm64/boot/dts/gem5-arm64/vexpress_gem5_v2_base.dtsi
>+@@ -0,0 +1,202 @@
>++/*
>++ * Copyright (c) 2015-2017, 2019 ARM Limited
>++ * All rights reserved
>++ *
>++ * Redistribution and use in source and binary forms, with or without
>++ * modification, are permitted provided that the following conditions ar=
e
>++ * met: redistributions of source code must retain the above copyright
>++ * notice, this list of conditions and the following disclaimer;
>++ * redistributions in binary form must reproduce the above copyright
>++ * notice, this list of conditions and the following disclaimer in the
>++ * documentation and/or other materials provided with the distribution;
>++ * neither the name of the copyright holders nor the names of its
>++ * contributors may be used to endorse or promote products derived from
>++ * this software without specific prior written permission.
>++ *
>++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
>CONTRIBUTORS
>++ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT
>NOT
>++ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
>FITNESS FOR
>++ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
>COPYRIGHT
>++ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
>INCIDENTAL,
>++ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
>NOT
>++ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
>OF USE,
>++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
>ON ANY
>++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
>++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
>THE USE
>++ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
>DAMAGE.
>++ *
>++ * Authors: Andreas Sandberg
>++ */
>++
>++/ {
>++arm,hbi =3D <0x0>;
>++arm,vexpress,site =3D <0xf>;
>++interrupt-parent =3D <&gic>;
>++#address-cells =3D <2>;
>++#size-cells =3D <2>;
>++
>++gic: interrupt-controller@2c000000 {
>++compatible =3D "arm,gic-v3";
>++#interrupt-cells =3D <0x3>;
>++#address-cells =3D <0x2>;
>++ranges;
>++interrupt-controller;
>++redistributor-stride =3D <0x0 0x40000>; // 256kB stride
>++reg =3D <0x0 0x2c000000 0x0 0x10000
>++       0x0 0x2c010000 0x0 0x2000000 // room for 128
>redistributors using 128K each (256K strided...)
>++       0x0 0x0 0x0 0x0>;
>++interrupts =3D <1 9 0xf04>;
>++#size-cells =3D <0x2>;
>++linux,phandle =3D <0x1>;
>++phandle =3D <0x1>;
>++
>++gic-its@2e010000 {
>++compatible =3D "arm,gic-v3-its";
>++msi-controller;
>++#msi-cells =3D <1>;
>++reg =3D <0x0 0x2e010000 0 0x20000>;
>++};
>++};
>++
>++timer {
>++compatible =3D "arm,cortex-a15-timer",
>++     "arm,armv7-timer";
>++interrupts =3D <1 13 0xf08>,
>++             <1 14 0xf08>,
>++     <1 11 0xf08>,
>++             <1 10 0xf08>;
>++clocks =3D <&osc_sys>;
>++clock-names=3D"apb_pclk";
>++};
>++
>++pci {
>++compatible =3D "pci-host-ecam-generic";
>++device_type =3D "pci";
>++#address-cells =3D <0x3>;
>++#size-cells =3D <0x2>;
>++#interrupt-cells =3D <0x1>;
>++
>++reg =3D <0x0 0x30000000 0x0 0x10000000>;
>++
>++ranges =3D <0x01000000 0x0 0x00000000  0x0 0x2f000000  0x0
>0x00010000>,
>++         <0x02000000 0x0 0x40000000  0x0 0x40000000  0x0
>0x40000000>;
>++
>++/*
>++  child unit address, #cells =3D #address-cells
>++  child interrupt specifier, #cells =3D #interrupt-cells (INTA =3D 1, IN=
TB =3D 2,
>INTC =3D 3 and INTD =3D 4)
>++  interrupt-parent, phandle
>++  parent unit address, #cells =3D #address-cells@gic
>++  parent interrupt specifier, #cells =3D #interrupt-cells@gic
>++*/
>++interrupt-map =3D <0x0    0x0 0x0  0x1  &gic  0x0 0x0  0x0 0x44 0x1
>++         0x800  0x0 0x0  0x1  &gic  0x0 0x0  0x0 0x45 0x1
>++         0x1000 0x0 0x0  0x1  &gic  0x0 0x0  0x0 0x46 0x1
>++         0x1800 0x0 0x0  0x1  &gic  0x0 0x0  0x0 0x47 0x1>;
>++
>++interrupt-map-mask =3D <0x001800 0x0 0x0 0x0>;
>++dma-coherent;
>++};
>++
>++kmi@1c060000 {
>++compatible =3D "arm,pl050", "arm,primecell";
>++reg =3D <0x0 0x1c060000 0x0 0x1000>;
>++interrupts =3D <0 12 4>;
>++clocks =3D <&v2m_clk24mhz>, <&osc_smb>;
>++clock-names =3D "KMIREFCLK", "apb_pclk";
>++};
>++
>++kmi@1c070000 {
>++compatible =3D "arm,pl050", "arm,primecell";
>++reg =3D <0x0 0x1c070000 0x0 0x1000>;
>++interrupts =3D <0 13 4>;
>++clocks =3D <&v2m_clk24mhz>, <&osc_smb>;
>++clock-names =3D "KMIREFCLK", "apb_pclk";
>++};
>++
>++uart0: uart@1c090000 {
>++compatible =3D "arm,pl011", "arm,primecell";
>++reg =3D <0x0 0x1c090000 0x0 0x1000>;
>++interrupts =3D <0 5 4>;
>++clocks =3D <&osc_peripheral>, <&osc_smb>;
>++clock-names =3D "uartclk", "apb_pclk";
>++};
>++
>++rtc@1c170000 {
>++compatible =3D "arm,pl031", "arm,primecell";
>++reg =3D <0x0 0x1c170000 0x0 0x1000>;
>++interrupts =3D <0 4 4>;
>++clocks =3D <&osc_smb>;
>++clock-names =3D "apb_pclk";
>++};
>++
>++v2m_clk24mhz: clk24mhz {
>++compatible =3D "fixed-clock";
>++#clock-cells =3D <0>;
>++clock-frequency =3D <24000000>;
>++clock-output-names =3D "v2m:clk24mhz";
>++};
>++
>++
>++v2m_sysreg: sysreg@1c010000 {
>++compatible =3D "arm,vexpress-sysreg";
>++reg =3D <0 0x1c010000 0x0 0x1000>;
>++gpio-controller;
>++#gpio-cells =3D <2>;
>++};
>++
>++vio@1c130000 {
>++compatible =3D "virtio,mmio";
>++reg =3D <0 0x1c130000 0x0 0x1000>;
>++interrupts =3D <0 42 4>;
>++};
>++
>++vio@1c140000 {
>++compatible =3D "virtio,mmio";
>++reg =3D <0 0x1c140000 0x0 0x1000>;
>++interrupts =3D <0 43 4>;
>++};
>++
>++dcc {
>++compatible =3D "arm,vexpress,config-bus";
>++arm,vexpress,config-bridge =3D <&v2m_sysreg>;
>++
>++osc_pxl: osc@5 {
>++compatible =3D "arm,vexpress-osc";
>++arm,vexpress-sysreg,func =3D <1 5>;
>++freq-range =3D <23750000 1000000000>;
>++#clock-cells =3D <0>;
>++clock-output-names =3D "oscclk5";
>++};
>++
>++osc_smb: osc@6 {
>++compatible =3D "arm,vexpress-osc";
>++arm,vexpress-sysreg,func =3D <1 6>;
>++freq-range =3D <20000000 50000000>;
>++#clock-cells =3D <0>;
>++clock-output-names =3D "oscclk6";
>++};
>++
>++osc_sys: osc@7 {
>++compatible =3D "arm,vexpress-osc";
>++arm,vexpress-sysreg,func =3D <1 7>;
>++freq-range =3D <20000000 60000000>;
>++#clock-cells =3D <0>;
>++clock-output-names =3D "oscclk7";
>++};
>++};
>++
>++
>++mcc {
>++compatible =3D "arm,vexpress,config-bus";
>++arm,vexpress,config-bridge =3D <&v2m_sysreg>;
>++arm,vexpress,site =3D <0>;
>++
>++osc_peripheral: osc@2 {
>++compatible =3D "arm,vexpress-osc";
>++arm,vexpress-sysreg,func =3D <1 2>;
>++freq-range =3D <24000000 24000000>;
>++#clock-cells =3D <0>;
>++clock-output-names =3D "v2m:oscclk2";
>++};
>++};
>++};
>diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/m=
eta-
>arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
>index 40acc24..61e611f 100644
>--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
>+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
>@@ -40,9 +40,4 @@ KMACHINE_juno =3D "juno"
> #
> COMPATIBLE_MACHINE_gem5-arm64 =3D "gem5-arm64"
> KMACHINE_gem5-arm64 =3D "gem5-arm64"
>-SRC_URI_append_gem5-arm64 =3D " file://dts/gem5-arm64;subdir=3Dadd-files"
>-
>-do_patch_append_gem5-arm64() {
>-    tar -C ${WORKDIR}/add-files/dts -cf - gem5-arm64 | \
>-        tar -C arch/arm64/boot/dts -xf -
>-}
>+SRC_URI_append_gem5-arm64 =3D " file://gem5-dts.patch"
>--
>2.26.2

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
